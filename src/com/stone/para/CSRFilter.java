package com.stone.para;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import cn.hutool.core.util.StrUtil;
import org.springframework.web.util.HtmlUtils;

/**
 * @author zichen
 */
public class CSRFilter implements Filter {

	private String[] verifyReferer = null;

	public void init(FilterConfig filterConfig) throws ServletException {
		String referer = filterConfig.getInitParameter("referer");
		this.verifyReferer = referer.split(",");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException {

		// System.err.println("Csrf：" + ((HttpServletRequest)
		// request).getRequestURI());

		String referer = ((HttpServletRequest) request).getHeader("Referer");
        // 是否是Csrf攻击状态
		boolean attackState = true;
        // 系统通过网址访问登录页时和检验系统调用接口时referer为null，所以需要放开此处判断。
		if (StrUtil.isBlank(referer)) {
            attackState = false;
        } else {
            for (String vReferer : verifyReferer) {
                if (referer.trim().startsWith(vReferer)) {
                    attackState = false;
                    break;
                }
            }
        }
		if (attackState) {
			System.err.println("疑似CSRF攻击，Referer：" + referer);
			PrintWriter printWriter = response.getWriter();
			// 使用HtmlUtils.htmlEscape格式化一下代码避免Xss攻击
			printWriter.print("疑似CSRF攻击，Referer：" + HtmlUtils.htmlEscape(referer));
			printWriter.flush();
			printWriter.close();
		} else {
            chain.doFilter(request, response);
        }
	}

	public void destroy() {
	}

}
