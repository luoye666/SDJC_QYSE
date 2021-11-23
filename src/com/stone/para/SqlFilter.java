package com.stone.para;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ReUtil;
import cn.hutool.core.util.URLUtil;

/**
 * 禁止非get或post请求访问，禁止指定的请求中进行get请求
 * 
 * @author zichen
 */
public class SqlFilter implements Filter {

	private List<String> illegalCharacters;

	private String reg;

	public void init(FilterConfig filterConfig) throws ServletException {
		illegalCharacters = CollUtil.newArrayList("'", "and", "exec", "execute", "insert", "select", "delete",
				"update", "count", "drop", "chr", "mid", "master", "truncate", "char", "declare", "sitename",
				"net user", "xp_cmdshell", "or", "like");
		reg = "[,$]";
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 获得所有请求参数名 estimateName =
		// estimateName.replaceAll("%(?![0-9a-fA-F]{2})", "%25");
		Enumeration<?> params = req.getParameterNames();

		while (params.hasMoreElements()) {
			// 得到参数名
			String name = params.nextElement().toString();

			// 得到参数对应值
			String[] values = req.getParameterValues(name);
			for (String value : values) {
				value = value.replaceAll("%(?![0-9a-fA-F]{2})", "%25");
				value = URLUtil.decode(value);
				for(String check : illegalCharacters){
					if (value.toLowerCase().contains(check) &&   value.toLowerCase().contains(check+" ")  && value.toLowerCase().contains(" "+check)  &&
							( value.toLowerCase().contains("'"+check) || value.toLowerCase().contains(check+"'")) ) {
						PrintWriter printWriter = response.getWriter();
						printWriter.print("检测到非法字符：" + value);
						printWriter.flush();
						printWriter.close();
						return;
					}
				}
				
				// List<String> illegalCharacters2 = ReUtil.findAllGroup0(reg,
				// value);
				// if (CollUtil.isNotEmpty(illegalCharacters2)) {
				// PrintWriter printWriter = response.getWriter();
				// printWriter.print("检测到非法字符：" + StrUtil.join(",",
				// illegalCharacters2));
				// printWriter.flush();
				// printWriter.close();
				// return;
				// }
			}
		}

		chain.doFilter(req, res);
	}

	public void destroy() {
	}

	public static void main(String[] args) {
		String reg = "['$]";
		String value = ", ";
		List<String> illegalCharacters2 = ReUtil.findAllGroup0(reg, value);
		System.out.println(CollUtil.isNotEmpty(illegalCharacters2));
	}

}
