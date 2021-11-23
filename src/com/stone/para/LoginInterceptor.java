package com.stone.para;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		
	    ActionContext context = invocation.getInvocationContext();
	    HttpServletRequest request = (HttpServletRequest)context.get("com.opensymphony.xwork2.dispatcher.HttpServletRequest");
	    HttpSession session = request.getSession(false);

        //获得请求类型  
        String type = request.getHeader("X-Requested-With");

	    String actionName = invocation.getProxy().getActionName();

	    String methodName = invocation.getProxy().getMethod();
	    
	//    System.out.println(session.getAttribute("SESSION_TUSER"));
	//    System.out.println(null == session.getAttribute("SESSION_TUSER"));
	    
	    if(null == session || null == session.getAttribute(IConstant.SESSION_TUSER)){
	    	if("validateLoginId".equals(methodName) || "getChkNumber".equals(methodName) || "verifyYzm".equals(methodName)
	    			|| "register".equals(methodName) || "getDataListByCode".equals(methodName) || "getKey".equals(methodName)
	    			|| "getDataListByParentCodeForDic".equals(methodName) || "getUserByQHCode".equals(methodName) ||"findDian".equals(methodName) 
	    			|| "ssoLogin".equals(methodName)){
	    		return invocation.invoke();
	    	}
	    	if ("XMLHttpRequest".equalsIgnoreCase(type)) {//ajax 请求
	    		PrintWriter printWriter = ServletActionContext.getResponse().getWriter();  
                printWriter.print("notLogin");  
                printWriter.flush();  
                printWriter.close();  
                return null;
	    	}else{
		    	return "login";
	    	}
	    }

	/*    if ((session == null) || ((session.getAttribute("SESSION_TUSER") == null) && ("getMenuByUserRole".equals(methodName))))
	    {
	      return "login";
	    }*/

	    if ("logout".equals(actionName)) {
	      session.invalidate();
	      return "login";
	    }
	    return invocation.invoke();
	}

}
