package com.stone.client;

import java.io.IOException;
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

public class DongYingYLRQService extends SupportService{
	
	private static final String methodUrl = "http://60.214.234.179:7777/iecp/interface/updateScjg/2";  //http://60.214.234.179:7777/iecp/interface/updateScjg
	/**
	 * 东营市压力容器使用
	 */
	public void sendToDY(String ylrqArray){
		JSONObject object = null;
		try{
			RequestConfig requestConfig = RequestConfig.custom()
            .setSocketTimeout(300 * 1000)
            .setConnectTimeout(300 * 1000)
            .build();
			HttpClient client= new DefaultHttpClient();
			HttpPost request = new HttpPost(methodUrl);
			request.setConfig(requestConfig);
			request.setHeader("Content-Type","application/json;charset=utf-8");
			StringEntity postingString = new StringEntity( ylrqArray ,"utf-8");
			request.setEntity(postingString); 
			HttpResponse resp = client.execute(request);
			HttpEntity entity = resp.getEntity();
			if(entity != null){
				String result = EntityUtils.toString(entity);
				System.out.println(result);
				object = JSONObject.fromObject(result);
			}

		}catch (IOException e) {
	        e.printStackTrace();
	    } 
		
		 System.out.println(object.toString());
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
			sendToDY(ss.fromObject(cutList).toString());
		}
		
	}
	
	
	public void findDYYlrq(){
		
		String seSql = "select se.dengjizhengbianhao sydjzbh,se.zhucedaima zcdm,se.shebeimingcheng sbmc,se.quhuamingcheng quxian," +
				"se.xiangzhen xiangzhen,se.shebeizhonglei sbzl,se.shebeileibie sblb,se.shiyongdanwei sydw,se.shiyongdanwei_dizhi sydwdz," +
				"se.shiyongdanwei_lianxiren sydwlxr,se.shiyongdanwei_lianxidianhua sydwlxdh,to_char(se.jianyanjieshuriqi,'yyyy-mm-dd') jyrq," +
				"to_char(se.xiacijianyanriqi,'yyyy-mm-dd') xcjyrq,se.baogaobianhao bgbh,se.jianyanjielun jyjl,se.jianyanjigou jyjg," +
				"to_char(se.zhizaoriqi_date,'yyyy-mm-dd') ccrq,se.shebeishiyongnianxian sjnx,se.zcstatus sbzt,yjyy yjzt,p.gongzuojiezhi jiezhi," +
				"p.gongzuoyali yali,p.gongzuowendu wendu,se.shifou_zhongdianjiankong zdjk " +
				"from biz_se se , biz_pressure_vessels_param p where se.tmpdata = '0' and se.chongfu = '0' " +
				"and se.eqhide = '0'and se.shidaima = '3705' and se.shebeizhongleidaima = '2000' and se.zcstatus <= '3' and p.pressurevesselsid = se.id " +
				"and se.modify_time >= sysdate-3/300  ";  //and se.modify_time >= sysdate-3/60*24 
		
		List<HashMap<String, Object>> list = super.findListBySql(seSql);
		
		monthSeToZTSdjc(list);
	}

}
