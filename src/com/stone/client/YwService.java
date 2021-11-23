package com.stone.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;

import com.alibaba.fastjson.JSONObject;
import com.stone.support.SupportService;

public class YwService extends SupportService{
	
	private static final String CATEGORY_URL = "http://60.210.113.85:8003/unitCode/web/inspur/uniteCode/getUniteCode?appCode=SD370000ZJJ&itemId=&regionCode=370100&powerType=01&token=5b6896947e0c7548550ac7f8765e62c3"; 
    private static final String TYPE_XML = "application/xml";  
    private static final String TYPE_JSON = "application/json"; 

    public static String insureResponseBlockGet(String url) {
        PrintWriter out = null;
        String result = "";
        HttpURLConnection conn = null;
        InputStream is = null;
        BufferedReader br = null;
        StringBuffer strBuffer = new StringBuffer();
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            conn = (HttpURLConnection) realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(20000);
            conn.setReadTimeout(300000);
            conn.setRequestProperty("Content-Type", "application/json");
            is = conn.getInputStream();
            br = new BufferedReader( new InputStreamReader(is));
            String line = null;
            while ((line=br.readLine())!= null) {
                strBuffer.append(line);
            }
            result = strBuffer.toString();
        } catch (Exception e) {
            System.out.println( "发送 GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输出流、输入流
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (br != null) {
                    br.close();
                }
                if (conn != null) {
                    conn.disconnect();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        
        return result;
    }
	
	
	public static void main(String[] args) {
		String appCode = "SD370000ZJJ";
		String itemId = "3701001004407"; 
		String token = DigestUtils.md5Hex(appCode+itemId+"28holsjyy0");
		
		token = insureResponseBlockGet(CATEGORY_URL);
		
		JSONObject json = (JSONObject) JSONObject.parse(token);
		json.get("code").toString();
		System.out.println(json.get("code").toString());
		
		
		//
		
	}
	
	
	public void yw(){
		String appCode = "SD370000ZJJ";
		String itemId = "3701001004407";
		String token = DigestUtils.md5Hex(appCode+itemId+"28holsjyy0");
		
		String url = "http://172.20.232.1/unitCode/web/inspur/uniteCode/" +
				"getUniteCode?appCode=SD370000ZJJ&itemId="+itemId+"&regionCode=370100" +
				"&powerType=01&token="+token;
		
		String sql = "select orgbusno from EA_JC_STEP_BASICINFO ";
		
		List<HashMap<String, Object>>  mapList =  super.findListBySql(sql);
		
		for(HashMap<String, Object> map : mapList){
			token = insureResponseBlockGet(url);
			
			JSONObject json = (JSONObject) JSONObject.parse(token);
//			json.get("password").toString(); //
//			json.get("unitecode").toString(); //
//			map.get("orgbusno");
			
			String upd = "update EA_JC_STEP_BASICINFO set projid = '"+json.get("unitecode").toString()+"',projpwd='"+json.get("password").toString()+"' where orgbusno = "+map.get("orgbusno").toString();
			
			super.insertBySql(upd);
			
		}
		
	}
	

}
