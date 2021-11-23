package com.stone.para;

import cn.hutool.core.util.StrUtil;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SqlInjectionFilter implements Filter {

    // 过滤掉的sql关键字，可以手动添加
    private final static String[] BAD_STRS = (" and | exec | execute | insert | select | delete | update | count | drop | chr | master | truncate |"
            + " declare | sitename | xp_cmdshell | like | and | exec | execute | insert | create | drop |"
            + " table | from | grant | use | group_concat | column_name |"
            + " information_schema.columns | table_schema | union | where | select | delete | update | order | by | count |"
            + " master | truncate | declare | or | like |'").split("\\|");

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest args0, ServletResponse args1, FilterChain chain) throws IOException,
			ServletException {
		HttpServletRequest req = (HttpServletRequest) args0;
		HttpServletResponse res = (HttpServletResponse) args1;
		// 获得所有请求参数名
		Enumeration params = req.getParameterNames();
		String sql = "";
		while (params.hasMoreElements()) {
			// 得到参数名
			String name = params.nextElement().toString();
			// System.out.println("name===========================" + name +
			// "--");
			// 得到参数对应值
			String[] value = req.getParameterValues(name);
			for (int i = 0; i < value.length; i++) {
				sql = sql + value[i];
			}
		}
		// 有sql关键字，跳转到error.html
		if (sqlValidate(sql)) {
			throw new IOException("您发送请求中的参数中含有非法字符");
			// String ip = req.getRemoteAddr();
		} else {
			chain.doFilter(args0, args1);
		}
	}

	// 效验
	protected static boolean sqlValidate(String str) {
		for (int i = 0; i < BAD_STRS.length; i++) {
			if (StrUtil.containsIgnoreCase(str, BAD_STRS[i])) {
				System.err.println("非法字符：" + BAD_STRS[i]);
				return true;
			}
		}
		return false;
	}

}