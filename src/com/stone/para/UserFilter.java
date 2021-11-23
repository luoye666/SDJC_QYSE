package com.stone.para;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class UserFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest hsrq = (HttpServletRequest) request;
		HttpServletResponse hsrp = (HttpServletResponse)response;
		HttpSession ses = hsrq.getSession(false);
		String url = hsrq.getRequestURI();
		if(url.indexOf("user!dandian.do") > 0){
			
		}else if(url.indexOf("login.jsp")<0 && url.indexOf("register.jsp")<0 && url.indexOf("check_user.jsp")<0){
			if(null == ses || null == ses.getAttribute(IConstant.SESSION_TUSER)){
				hsrq.getRequestDispatcher("/jsp/common/login.jsp").forward(hsrq, hsrp);
		        return;
			}
		}
        chain.doFilter(request, response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
	
	}

}
