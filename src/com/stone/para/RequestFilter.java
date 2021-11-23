package com.stone.para;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import cn.hutool.core.util.StrUtil;

/**
 * 禁止非get或post请求访问，禁止指定的请求中进行get请求
 * 
 * @author zichen
 */
public class RequestFilter implements Filter {

	private List<String> ignoresParam = null;

	public void init(FilterConfig filterConfig) throws ServletException {
		String referer = filterConfig.getInitParameter("ignores");
		this.ignoresParam = StrUtil.split(referer, ',');
		for (int i = 0; i < this.ignoresParam.size(); i++) {
			// 过滤掉\n和空格
			this.ignoresParam.set(i, StrUtil.cleanBlank(StrUtil.removeAllLineBreaks(this.ignoresParam.get(i))));
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String uri = req.getRequestURI();
		// System.err.println("RequestFilter：" + uri);
		String method = req.getMethod();

		// 如果当前请求不是get或post请求，则禁止访问
		if (!StrUtil.equalsIgnoreCase("get", method) && !StrUtil.equalsIgnoreCase("post", method)) {
			System.err.println("禁止非法请求方式：" + method);
			PrintWriter printWriter = response.getWriter();
			printWriter.print("禁止非法请求方式：" + method);
			printWriter.flush();
			printWriter.close();
			return;
		}

		// 判断是否有指定的uri请求使用get方法如果有则禁止访问
		if (ignoresParam.contains(uri) && StrUtil.equalsIgnoreCase("get", method)) {
			System.err.println("当前路径禁止GET请求：" + uri);
			PrintWriter printWriter = response.getWriter();
			printWriter.print("当前路径禁止GET请求：" + uri);
			printWriter.flush();
			printWriter.close();
			return;
		}

		chain.doFilter(request, response);
	}

	public void destroy() {
	}

}
