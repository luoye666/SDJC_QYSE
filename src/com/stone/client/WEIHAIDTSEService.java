package com.stone.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.net.ssl.*;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.httpclient.protocol.Protocol;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;
import com.stone.support.SupportService;
import com.sun.star.security.CertificateException;

public class WEIHAIDTSEService extends SupportService{
	
	private static final String tokenUrl = "https://scjgjdt.weihai.cn/web/wh/gettoken?key=weihai_mingan_data";  //http://www.sdwhdt.cn:8001/web/wh/gettoken?key=weihai_mingan_data
	private static final String pushUrl = "https://scjgjdt.weihai.cn/web/wh/insertMinganLift";   //www.sdwhdt.cn:8001/web/wh/insertMinganLift
	private static String token = null;
	
	
	/**
	 * 获取威海token
	 */
	public void getToken(){
		try {
	        URL url = new URL(tokenUrl);
	        HttpURLConnection httpConn = (HttpURLConnection)
	        url.openConnection();
	        
	        try {
				SslUtils.ignoreSsl();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        httpConn.setRequestMethod("GET");
	        httpConn.connect();
	            
	        BufferedReader reader = new BufferedReader(new InputStreamReader(
	        httpConn.getInputStream()));
	        String line;
	        StringBuffer buffer = new StringBuffer();
	        while ((line = reader.readLine()) != null) {
	        buffer.append(line);
	        }
	        reader.close();
	        httpConn.disconnect();
	        token = (String) JSONObject.fromObject(buffer.toString()).get("token");
	        System.out.println(token);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	public String findWHDt(String map){
      
		getToken();
		if("error".equals(token)){
			getToken();
		}
		HttpClient client= createIgnoreSSLHttpClient();
		
		HttpPost request = new HttpPost(pushUrl);
		
		List<NameValuePair> pairs = new ArrayList<NameValuePair>();
		pairs.add(new BasicNameValuePair("token", token));
		pairs.add(new BasicNameValuePair("lifts", map));
		net.sf.json.JSONObject object = null;
		try{
			request.setEntity(new UrlEncodedFormEntity(pairs,Consts.UTF_8)); 
			HttpResponse resp = client.execute(request);
			HttpEntity entity = resp.getEntity();
			if(entity != null){
				String result = EntityUtils.toString(entity,"UTF-8");
				object = JSONObject.fromObject(result);
			}

		}catch (IOException e) {
	        e.printStackTrace();
	    } 
		
		String result = (String) JSONObject.fromObject(object).get("result");
		System.out.println(result);
		return result;
	}


	
	public void findWHDTSe(){
		
		String sql = "select se.id sync_id,se.quhuamingcheng area_id,se.shebeipinzhong category_id,se.jianyanjielun checkout_result,e.kongzhifangshi control_way,se.jianyanjigou device_check_organ," +
				"e.men drag_door_count,e.ceng drag_floor_count,e.tishenggaodu drag_height,e.zhan drag_site_count,se.zhizaodanwei factory_id,se.chuchangbianhao factory_number," +
				"to_char(se.anzhuangriqi,'yyyy-mm-dd') install_date,se.anzhuangdanwei install_unit,to_char(se.jianyanjieshuriqi,'yyyy-mm-dd') last_check_date,se.shebeishiyongnianxian lift_age," +
				"e.qingxiejiao lift_angle,se.zcstatus lift_status,to_char(se.zhizaoriqi_date,'yyyy-mm-dd')  made_date,se.weihubaoyangdanwei maintenance_company_id,se.shebeixinghao model_id," +
				"to_char(se.xiacijianyanriqi,'yyyy-mm-dd') next_check_date,se.shiyongchangsuo place_id,se.chanquandanwei property_right_unit,e.edingzaizhongliang rated_load_weight," +
				"e.edingsudu rated_speed,se.dengjizhengbianhao reg_certificate_no,se.zhucedaima register_code, to_char(se.zhuceriqi,'yyyy-mm-dd') register_date," +
				"se.zhucedengjijigou register_organ,e.mingyikuandu stage_width,se.shebeididian use_address,se.shiyongdanwei use_company_id,se.neibubianhao user_inside_code,se.shebeidaima device_code " +
				"from  biz_se se, biz_elevatorparam e where se.tmpdata = '0' and se.eqhide = '0' and se.chongfu = '0' and se.zfstate = '0' " +
				"and se.id = e.elevatorid and se.shebeizhongleidaima = '3000' and se.shidaima = '3710' and se.zcstatus in ('1','3','5','7') " +
				"and to_char(se.modify_time,'yyyy-mm-dd') >= '2021-09-20'  ";//and se.modify_time >= sysdate-3/60*24    to_char(TRUNC(SYSDATE - 1),'yyyy-mm-dd')
		
		List<HashMap<String, Object>> list = super.findListBySql(sql);
		
		List<HashMap<String, Object>> list2 = new ArrayList<HashMap<String, Object>>();
		for(HashMap<String, Object> map : list){
			list2.add(nullToEmpty(map));
		}
		
		monthSeToZTSdjc(list2);
	}
	
	/**
	 * 定时向省局更新下次检验日期及部分状态字段
	 */
	public void monthSeToZTSdjc(List seList){
		int size = 150; //每次100条数据
		int count = seList.size();
		int temp = count/size + 1;
		boolean special = count % size == 0;
		List cutList = null;
		for(int i= 0;i < temp; i++){
			if(i == temp - 1){
				if(special){
					break;
				}
				cutList = seList.subList(size * i, count);
			}else{
				cutList = seList.subList(size * i, size * (i+1));
			}
			JSONArray ss = new JSONArray();
			findWHDt(ss.fromObject(cutList).toString());
		}
		
	}
	
	
	/**
	 * map处理null
	 * @param map
	 * @return
	 */
	public static HashMap<String, Object> nullToEmpty(HashMap<String, Object> map) {
		Set<String> set = map.keySet();
		if(set != null && !set.isEmpty()) {
			for(String key : set) {
				if(map.get(key) == null || "null".equals(map.get(key)) ) { 
						map.put(key, ""); 
				}
			}
		}
		return map;
	}
	
	
	
	/**
	 * 忽略ssl证书验证
	 * @return
	 */
	public static CloseableHttpClient createIgnoreSSLHttpClient() {
	    try {
			SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, new TrustStrategy() {
	            public boolean isTrusted(X509Certificate[] chain,
	                                     String authType) throws CertificateException {
	                return true;
	            }
	        }).build();
	        SSLConnectionSocketFactory sslConnectionSocketFactory = new SSLConnectionSocketFactory(sslContext, NoopHostnameVerifier.INSTANCE);
	        return HttpClients.custom().setSSLSocketFactory(sslConnectionSocketFactory).build();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	
	

}
