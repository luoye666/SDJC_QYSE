package com.stone.support.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 
 * @author ThinkPad
 *
 */
public  class Tools {
	

	/**
	 * 将"'"、"""转换成中文格式，并把回车转换成<br/>
	 * @param str
	 * @return 
	 */
	public static String replace(String str)
	{
		if(str!=null&&!str.equals(""))
		{
			return str.replaceAll("'", "’").replaceAll("\"", " ").replaceAll("\r\n", "<br/>").replaceAll("\n", "<br/>").replaceAll(" ", "&nbsp;");			
		}else
			return "";
	}
	
	public static String replaceP(String str){
		if(str!=null&&!str.equals(""))
		{
			return str.replaceAll("<P>", "").replaceAll("</P>", " ").replaceAll("&nbsp;", " ");			
		}else
			return "";		
	}
	/**
	 * 解码
	 * @param str
	 * @return String
	 * @throws UnsupportedEncodingException 
	 */
	public static String decode(String str) 
	{
		
			try {
				if(str!=null&&!str.equals(""))
				{
					return URLDecoder.decode(str, "utf-8");
				}
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return "";
	}
	
	/**
	 * 解码
	 * @param str
	 * @return String
	 * @throws UnsupportedEncodingException 
	 */
	public static String encode(String str) 
	{
		
			try {
				if(str!=null&&!str.equals(""))
				{
				return URLEncoder.encode(str, "utf-8");
				}
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return "";
	}
	
	public static boolean isNumeric(String str){
		if("".equals(str)){
			return false;
		}
		Pattern pattern=Pattern.compile("[0-9]*");
		Matcher matcher = pattern.matcher(str);
		if(matcher.matches()){
			return true;
		}
		return false;
	}
	/**
	   * 数字验证,当为数字时返回true
	   * 
	   */
	public static boolean checkNumber(String num){
		return num.matches("\\d*(\\.\\d+)?");
	}
	public static boolean isDigit(String str){
		for(int i=0;i<str.length();i++){
			char c=str.charAt(i);
			if(!Character.isDigit(c)){
				return false;
			}
		}
		return true;
	}
	public static boolean isTicketId(String str){
		if(isNumeric(str)){
			if(str.length()<11){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	public static boolean isMobile(String str){
		if(isNumeric(str)){
			if(str.length()==11){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	public static boolean hasNoNull(String[] st){
		boolean boo = true;
		for(int i=0;i<st.length;i++){
			if(st[i]==null)
				boo = false;
		}
		return boo;
	}
	
	@SuppressWarnings("unchecked")
	public static Map  conversionHashMap(HashMap<String,String> inputMap,Map<String,Object> outMap) throws ParseException{
		
		
		if(inputMap!=null){
			Iterator iter = inputMap.entrySet().iterator(); 
			while (iter.hasNext()) { //重新定义map中的参数类型
				Map.Entry entry = (Map.Entry) iter.next(); 
			
				
				String keystr=entry.getKey().toString();
				String valstr=entry.getValue().toString();
				String type="";
				
				String[] items=keystr.split("!");
				if(items.length>=2){
					keystr=items[0];
					type=items[1];
				}
				//valstr=valstr.substring(1,valstr.length());
				
				if("Double".equalsIgnoreCase(type)){
					outMap.put(keystr, Double.parseDouble(valstr));
				}else if("Long".equalsIgnoreCase(type)){
					outMap.put(keystr, Long.parseLong(valstr));
				}else if("Float".equalsIgnoreCase(type)){
					outMap.put(keystr, Float.parseFloat(valstr));
				}else if("Date".equalsIgnoreCase(type)){
					outMap.put(keystr, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(valstr));
				}else 	if("String".equalsIgnoreCase(type)){
					outMap.put(keystr, valstr);
				}
				
			}	
		}
		
		return outMap;
	}
	
	// 检验报告Map
	public static HashMap<String, String> getTableBG() {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("壁厚测定", "biz_report_ylrq_bhcd,BIZ_REPORT_YLRQ_BHCD_CHJL");
		map.put("壁厚校核", "biz_report_ylrq_bhjh");
		map.put("硬度检测", "biz_report_ylrq_ydjc,BIZ_REPORT_YLRQ_YDJC_JL");
		map.put("金相分析", "biz_report_ylrq_jxfx");
		map.put("附加检验", "biz_report_ylrq_fjjy");
		map.put("气密性试验", "biz_report_ylrq_qmx");
		map.put("耐压试验", "biz_report_ylrq_nysy");
		map.put("衍射时差法超声检测", "BIZ_REPORT_WS_TOFD,BIZ_REPORT_WS_TOFD_TD,BIZ_REPORT_WS_TOFD_PD");
		map.put("声发射检测", "BIZ_REPORT_WS_SFS");
		map.put("渗透检测", "BIZ_REPORT_WS_ST,BIZ_REPORT_WS_ST_PD");
		map.put("磁粉检测", "BIZ_REPORT_WS_CF,BIZ_REPORT_WS_CF_PD");
		map.put("超声检测", "BIZ_REPORT_WS_CS,BIZ_REPORT_WS_CS_PD");
		map.put("射线检测", "BIZ_REPORT_WS_SX,BIZ_REPORT_WS_SX_PD");
		map.put("氨检漏试验", "biz_report_ylrq_ajl");
		map.put("材料成分分析", "biz_report_ylrq_cffx,BIZ_REPORT_YLRQ_CFFX_FXJL");
		map.put("安全附件检验", "biz_report_ylrq_aqfj");
		map.put("氦卤素检漏试验", "biz_report_ylrq_hlsjl");
		return map;
	}
	// 检验报告Map
	public static HashMap<String, String> getTableYsjl() {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("壁厚测定", "biz_ysjl_ylrq_bhcd,BIZ_YSJL_YLRQ_BHCD_CHJL");
		map.put("声发射检测", "BIZ_YSJL_WS_SFS");//2015-5-11pm,yancx add
		map.put("渗透检测", "BIZ_YSJL_WS_ST,BIZ_YSJL_WS_ST_PD");//2015-5-11pm,yancx add
		map.put("磁粉检测", "BIZ_YSJL_WS_CF,BIZ_YSJL_WS_CF_PD");//2015-5-11pm,yancx add
		map.put("超声检测", "BIZ_YSJL_WS_CS,BIZ_YSJL_WS_CS_PD");//2015-5-11pm,yancx add
		map.put("射线检测", "BIZ_YSJL_WS_SX,BIZ_YSJL_WS_SX_PD");//2015-5-11pm,yancx add
		map.put("硬度检测", "biz_ysjl_ylrq_ydjc,BIZ_YSJL_YLRQ_YDJC_JL");
		map.put("材料成分分析", "biz_ysjl_ylrq_cffx,BIZ_YSJL_YLRQ_CFFX_FXJL");
		map.put("金相分析", "biz_ysjl_ylrq_jxfx");
		return map;
	}
	
	public static void main(String[] args) {
		String str = "sfsf\\sfsfsf";
		str = str.replace("\\", "\\\\");
				System.out.println(str);
	}
}
