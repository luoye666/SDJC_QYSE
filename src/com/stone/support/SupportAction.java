package com.stone.support;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import com.stone.support.utils.ParamUtil;

import frm.ssh.action.BaseAction;

public class SupportAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -926385444854387428L;
	/**JSON结果集*/
	private JSONObject jsonDataSet = new JSONObject();
	/**逻辑错误标题*/
	private String logicErrorTitle;
	/**逻辑错误内容*/
	private List<String> logicErrors = new ArrayList<String>();
	
	/**执行结果标识:success,取值为布尔类型true;false*/
	public final static String RESULT = "success";
	
	/**系统异常提示信息标识:systemErrorMsg,存放系统异常信息的详细说明*/
	public final static String SYSTEM_ERROR_MSG = "systemErrorMsg";
	
	/**逻辑错误警告信息标识：logicErrorMsgs，存放逻辑错误的提示信息，信息为集合类型*/
	public final static String LOGIC_ERROR_MSGS = "logicErrorMsgs";
	
	/**逻辑错误警告标题标识：logicErrorTitle，存放逻辑错误的提示标题，信息为字符串类型*/
	public final static String LOGIC_ERROR_TITLE = "logicErrorTitle";
	
	/**异常详细信息标识：errorStackTrace,存放异常发生的详细错误信息*/
	public final static String ERROR_STACK_TRACE = "errorStackTrace";
	
	public JSONObject getJsonDataSet() {
		return jsonDataSet;
	}
	public String getLogicErrorTitle() {
		return logicErrorTitle;
	}
	public List<String> getLogicErrors() {
		return logicErrors;
	}
	
	/**
	 * 检查参数,检查字符串是否为空（空对象，空字符串）
	 * @param param
	 * @return
	 */
	protected boolean checkParam(String param){
		return !ParamUtil.isEmpty(param);
	}
	
	/**
	 * 检查参数，检查对象是否为空
	 * @param param
	 * @return
	 */
	protected boolean checkParam(Object param){
		return param != null;
	}
	
	/**
	 * 向结果集中添加数据
	 * @param key
	 * @param value
	 */
	public SupportAction addActionData(String key,Object value){
		this.jsonDataSet.put(key, value);
		return this;
	}
	
	/**
	 * 添加逻辑错误内容
	 * @param error
	 */
	public void addLogicError(String error){
		this.logicErrors.add(error);
	}

	/**
	 * 添加逻辑错误标题
	 * @param title
	 */
	public void setLogicErrorTitle(String title){
		this.logicErrorTitle = title;
	}
}
