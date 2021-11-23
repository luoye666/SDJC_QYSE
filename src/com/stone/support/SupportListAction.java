package com.stone.support;


import com.stone.support.utils.ParamUtil;

import net.sf.json.JSONObject;

public class SupportListAction extends SupportAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5089088222613171126L;

	/**
	 * 查询参数
	 */
	private JSONObject queryParamsJSON;
	
	protected final static String PAGINATION = "page";		
	protected final static String ROWS = "rows";		
	protected final static String TOTAL = "total";	
	protected final static String RECORDS = "records";
	protected final static String SEARCH_PARAM_NAME = "sc_params";
	
	/**
	 * 获取传入的页码
	 * @return
	 * @throws Exception 
	 */
	public int getPagination() throws IllegalArgumentException{
		int p = 1;
		try{
			p = super.getParameterInt(PAGINATION);
		}catch(NumberFormatException e){
			throw new IllegalArgumentException("传入分页所需参数错误:"+PAGINATION);
		}
		return p;
	}
	
	/**
	 * 获取传入每页显示的行数
	 * @return
	 * @throws Exception 
	 */
	public int getRowNumber() throws IllegalArgumentException{
		int r = 20;
		try{
			r = super.getParameterInt(ROWS);
		}catch(NumberFormatException e){
			throw new IllegalArgumentException("传入分页所需参数错误:"+ROWS);
		}
		return r;
	}
	
	/**
	 * 获取查询条件参数
	 * @param name
	 * @return
	 */
	public String getQueryParam(String name){
		String queryParams =  super.getParameter(SEARCH_PARAM_NAME);
		if(ParamUtil.isEmpty(queryParams)) return null;
		
		if(this.queryParamsJSON == null){
			this.queryParamsJSON = JSONObject.fromObject(queryParams);
		}
		
		Object value = this.queryParamsJSON.get(name);
		
		if(value!=null){
			return value.toString();
		}
		return null;
	}
}
