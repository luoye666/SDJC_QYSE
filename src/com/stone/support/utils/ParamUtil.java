package com.stone.support.utils;

/**
 * 请求参数工具类
 * @author root
 *
 */
public class ParamUtil {
	
	/**
	 * 在参数列表中查找指定参数
	 * @param params
	 * @param name 
	 * @return
	 */
	public static String selectParameter(String params,String name){
		if(params == null || "".equals(params)) return null;
		if(name == null || "".equals(name)) return params;
		String value = null;
		String[] paramArray = params.split("&");
		for(int i = 0 ; i < paramArray.length ; i++){
			String[] param = paramArray[i].split("=");
			if(param.length!=2)
				continue;
			if(name.equals(param[0])){
				value = param[1];
				break;
			}
		}
		return value;
	}
	
	public static boolean isEmpty(String param){
		return param == null || param.trim().length() == 0;
	}
}
