package com.stone.support;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;
import com.opensymphony.xwork2.util.ValueStack;

/**
 * @author foo
 */
public class SupportJSONResult implements Result {

	private static final long serialVersionUID = -6094606464183347475L;

	@SuppressWarnings("unchecked")
	public void execute(ActionInvocation invoke) throws Exception {
		ValueStack vs = invoke.getStack();
		
		JSONObject dataSet = (JSONObject)vs.findValue("jsonDataSet");
		List<String> logicErrors = (List<String>)vs.findValue("logicErrors");
		String logicErrorTitle = (String)vs.findValue("logicErrorTitle");
		
		if(dataSet == null) return;
		
		HttpServletResponse response = (HttpServletResponse)invoke.getInvocationContext().get(ServletActionContext.HTTP_RESPONSE);
		
		if(logicErrors != null && !logicErrors.isEmpty()){
			dataSet.put(SupportAction.RESULT, false);
			dataSet.put(SupportAction.LOGIC_ERROR_MSGS, logicErrors);
		}
		
		if(logicErrorTitle != null){
			dataSet.put(SupportAction.RESULT, false);
			dataSet.put(SupportAction.LOGIC_ERROR_TITLE, logicErrorTitle);
		}
		
		if(dataSet.get(SupportAction.RESULT) == null){
			dataSet.put(SupportAction.RESULT, true);
		}
		
		response.setContentType("text/html;charset=utf-8");
		
		response.getWriter().print(dataSet);
	}
}
