package com.stone.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;
import com.stone.support.SupportService;

public class WEIHAISEService extends SupportService{
	
	private static final String tokenUrl = "http://zhjg.weihai.cn/dataSubmit/dataSubmitPubUpdateGetToken";  //http://zhjg.weihai.cn/dataSubmit/dataSubmitPubUpdateGetToken
	private static final String pushUrl = "http://zhjg.weihai.cn/api/dataSubmitPubUpdateApi";   //http://zhjg.weihai.cn/api/dataSubmitPubUpdateApi
	private static final String searhcUrl = "http://zhjg.weihai.cn/api/dataSubmitPubListApi";   //http://zhjg.weihai.cn/api/dataSubmitPubListApi
	private static final String appKey = "65E5D_4F_28";
	private static final String appSercet = "0B6B@CF2_7255B1C8A";
	private static final String method = "174";
	private static final String isDel = "0";
	private static String token = null;
	
	
	/**
	 * 获取威海token
	 * @param zldm
	 * @param obj
	 * @param seid
	 */
	public void getToken(){
		try {
			String strURL = tokenUrl + "?appKey="+appKey+"&appSercet="+appSercet+"";
	        URL url = new URL(strURL);
	        HttpURLConnection httpConn = (HttpURLConnection)
	        url.openConnection();
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
public static void main(String[] args) {
		
		new WEIHAISEService().getToken();
		System.out.println(token);
	}

	
	public String sendToWH(String map){
		getToken();
		HttpClient client= new DefaultHttpClient();
		HttpPost request = new HttpPost(pushUrl);
		List<NameValuePair> pairs = new ArrayList<NameValuePair>();
		pairs.add(new BasicNameValuePair("appKey", appKey));
		pairs.add(new BasicNameValuePair("appSercet", appSercet));
		pairs.add(new BasicNameValuePair("method", method));
		pairs.add(new BasicNameValuePair("isDel", isDel));
		pairs.add(new BasicNameValuePair("token", token));
		pairs.add(new BasicNameValuePair("params", map));
		System.out.println(map);
		net.sf.json.JSONObject object = null;
		try{
			request.setEntity(new UrlEncodedFormEntity(pairs,Consts.UTF_8)); 
			HttpResponse resp = client.execute(request);
			HttpEntity entity = resp.getEntity();
			if(entity != null){
				String result = EntityUtils.toString(entity,"UTF-8");
				object = JSONObject.fromObject(result);
				System.out.println(object);
			}

		}catch (IOException e) {
	        e.printStackTrace();
	    } 
		
		return object.toString();
	}
	
	
	/**
	 * 定时向威海推送数据
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
			sendToWH(ss.fromObject(cutList).toString());
		}
		
	}
	
	
	public void findWHSe(){
		
		String seSql = "select se.id id,se.quhuamingcheng city,se.xiangzhen street,se.shebeizhonglei equipclass,se.shebeipinzhong equipbreeds,"
				+ "se.shebeidaima equipcode,se.shebeishiyongnianxian useYearLimit,se.zhizaodanwei createOrg,'' superviseOrg,"
				+ "se.chuchangbianhao productcode,se.shebeileibie equipcategory,se.shebeimingcheng productname,se.shebeixinghao specs,"
				+ "se.shejidanwei designorg,se.shigongdanwei buildorg,se.wenjianjiandingjigou typetestorg,se.zcstatus equipstatus,"
				+ "se.shiyongdanwei useorg,se.shiyongdanwei_dizhi useadress,se.shiyongdanwei_code uniscidused,"
				+ "se.shiyongdanwei_youbian useorgpostcode,se.neibubianhao orginsidecode,to_char(se.touyongriqi_date,'yyyy-mm-dd') usedate,"
				+ "se.anquanguanlirenyuan securityMangePerson,se.chanquandanwei propertyOrg,se.chanquandanwei_dizhi propertyOrgAdress,"
				+ "se.shebeididian equipUseAdress,se.shiyongdanwei_lianxidianhua useOrgTel,se.anquanguanli_lianxidianhua useOrgMobile,"
				+ "se.chanquandanwei_daima uniscidProperty,se.chanquandanwei_dianhua propertyTel,se.weihubaoyangdanwei repairOrg,"
				+ "se.weihubaoyangdanwei_dianhua repairOrgTel,se.jianyanjigou checkOrg,se.jianyanleixing checkClass,"
				+ "to_char(se.jianyanjieshuriqi,'yyyy-mm-dd') checkDate, to_char(se.xiacijianyanriqi,'yyyy-mm-dd') nextCheckDate,"
				+ "se.baogaobianhao  checkReportNo,se.jianyanjielun checkResult,se.yjyy checkState,se.zhucedengjijigou registeOrg,"
				+ "se.zhucedengjirenyuan registrars,to_char(se.zhuceriqi,'yyyy-mm-dd') registeDate,se.dengjileibie registeClass, "
				+ "se.zhucedaima equ_reg_code,se.dengjizhengbianhao reg_cert_no "
				+ "from biz_se se where se.tmpdata = '0' and se.eqhide = '0' and se.chongfu = '0' and se.zfstate = '0' "
				+ "and se.shidaima = '3710' and se.zcstatus in ('1','3','5','7') "
				+ "and to_char(se.modify_time,'yyyy-mm-dd') >= to_char(sysdate-1,'yyyy-mm-dd')  ";//and se.modify_time >= sysdate-3/60*24  sysdate-3/300 
		
		List<HashMap<String, Object>> list = super.findListBySql(seSql);
		
		monthSeToZTSdjc(list);
	}

}
