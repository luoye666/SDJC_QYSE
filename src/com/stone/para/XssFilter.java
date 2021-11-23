package com.stone.para;

import java.io.IOException;
import java.util.ArrayList;
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

/**
 * @author zichen
 */
public class XssFilter implements Filter {

	List<String> prefixIignores = new ArrayList<String>();

	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("xss过滤器的初始化操作");
		// 对应web.xml中init-param标签体内容，放行的请求
		String ignoresParam = filterConfig.getInitParameter("ignores");
		if (ignoresParam == null) {
			return;
		}
		String[] ignoreArray = ignoresParam.split(",");
		for (String s : ignoreArray) {
			prefixIignores.add(s.trim());
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		// System.err.println("XssFilter：" + req.getRequestURI());

		// 漏洞：“Content-Security-Policy”头缺失或不安全

		/*
		 * AppScan 9.0.3.12
		 * “Content-Security-Policy”头旨在修改浏览器呈现页面的方式，从而防止各种跨站点注入，包括跨站点脚本编制。请务
		 * 必正确设置该头值，使其不会阻止网站的正确操作。例如，如果该头设置为阻止执行内联 JavaScript，则网站不得在其 页面内使用内联
		 * JavaScript。
		 * 为了防止跨站点脚本编制，请务必为‘default-src’策略或‘script-src’和‘object-src’设置正确值
		 * 。应避免不安全值，如‘*’、 ‘data:’、‘unsafe-inline’或‘unsafe-eval’。
		 * 此外，为了防止跨框架脚本编制或点击劫持，请务必为‘frame-ancestors’策略设置正确值。应避免不安全值，
		 * 如‘*’或‘data:’。
		 */

		// 下面注释的代码可消除该漏洞，但影响甚大暂无法启用。影响如下：(Content-Security-Policy策略：
		// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/script-src)
		// 1. 登录页面的a标签，href="javascript:void(0)
		// 需要添加策略unsafe-inline才能正常使用，一旦添加该策略，将无法消除该漏洞！
		// 2. jquery.easyui.min.js:56 需要添加策略unsafe-eval才能正常使用，一旦添加该策略，将无法消除该漏洞！
		// res.setHeader("Content-Security-Policy",
		// "default-src 'self' https://cdn.jsdelivr.net ; script-src 'self' https://cdn.jsdelivr.net; frame-ancestors 'self'; object-src 'none';");

		if ("/QYSE/".equals(req.getRequestURI())) {
			res.setHeader(
					"Content-Security-Policy",
					"default-src 'self' https://cdn.jsdelivr.net ; script-src 'nonce-2726c7f26c' https://cdn.jsdelivr.net; frame-ancestors 'self'; object-src 'none';"
							+ "style-src 'unsafe-inline'; style-src-elem 'unsafe-inline'; ");
		}

		if (CollUtil.newArrayList("/QYSE/js/easyui-lang-zh_CN.js", "/QYSE/js/jquery-1.8.0.min.js", "/QYSE/js/json2.js",
				"/QYSE/user!singleLogin.do").contains(req.getRequestURI())) {
			res.setHeader(
					"Content-Security-Policy",
					"default-src 'self' https://cdn.jsdelivr.net ; script-src https://cdn.jsdelivr.net; frame-ancestors 'self'; object-src 'none';");
		}

		// 跨帧脚本编制防御缺失或不安全->Web 应用程序编程或配置不安全->将服务器配置为使用值为 DENY 或 SAMEORIGIN
		// 的“X-Frame-Options”头
		res.setHeader("X-Frame-Options", "SAMEORIGIN");
		res.addHeader("x-frame-options", "SAMEORIGIN");
		res.setHeader("Strict-Transport-Security", "value");
		res.setHeader("Referrer-Policy", "value");
		res.setHeader("X-Permitted-Cross-Domain-Policies", "value");
		res.setHeader("X-Download-Options", "value");
		res.setHeader("Content-Security-Policy", "value");
		res.setHeader("X-XSS-Protection", "value");
		res.setHeader("X-Content-Type-Options", "value");
		// 设置安全响应头->此处针对静态资源文件，如果是非静态资源文件需要添加的话，在此处添加也白添加，不会产生效果。
		// 如需操作请查看ResponseInterceptor
		res.setHeader("X-Content-Type-Options", "nosniff");
		res.setHeader("X-XSS-Protection", "1; mode=block");

		if (prefixIignores.contains(req.getRequestURI())) {
			chain.doFilter(req, res);
		} else {
			/*XssWarper xssWarper = new XssWarper(req);
			// 放行
			chain.doFilter(xssWarper, res);*/
            chain.doFilter(req, res);
		}

	}

	public void destroy() {
	}

}
