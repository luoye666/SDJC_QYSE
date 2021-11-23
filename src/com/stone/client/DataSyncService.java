package com.stone.client;

import java.util.HashMap;
import java.util.List;



import org.apache.cxf.jaxrs.client.WebClient;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.stone.biz.jcsj.pojo.TApprizes;
import com.stone.biz.jcsj.pojo.TBoilerParam;
import com.stone.biz.jcsj.pojo.TCablewaysParam;
import com.stone.biz.jcsj.pojo.TCraneParam_cc;
import com.stone.biz.jcsj.pojo.TCraneParam_qzjx;
import com.stone.biz.jcsj.pojo.TElevatorParam;
import com.stone.biz.jcsj.pojo.TPressurePipingParam;
import com.stone.biz.jcsj.pojo.TPressureVesselsParam;
import com.stone.biz.jcsj.pojo.TRecreationParam;
import com.stone.support.SupportService;

public class DataSyncService extends SupportService{
	
	private static final String CATEGORY_URL = "http://101.37.88.238:8000";  //http://60.216.110.76:9070/QYSE/
    private static final String TYPE_JSON = "application/json"; 
	
	@SuppressWarnings("unchecked")
	public void findListSe(){
		//to_char(modify_time,'yyyy-mm-dd') = to_char(sysdate,'yyyy-mm-dd')   TRUNC(SYSDATE - 1) and  = to_char(modify_time,'yyyy-mm-dd') = to_char(TRUNC(SYSDATE - 1),'yyyy-mm-dd')  to_char(TRUNC(SYSDATE - 1),'yyyy-mm-dd') 
		List<TBoilerParam> boilerList = super.findListByHql(" from TBoilerParam where tmpData = '0' and shebeizhongleidaima = '1000' and zcstatus in ('1','3')   and to_char(modify_time,'yyyy-mm-dd') >= '2020-09-01'  "); 
		List<TPressureVesselsParam> pvList = super.findListByHql(" from TPressureVesselsParam where tmpData = '0' and shebeizhongleidaima = '2000' and zcstatus in ('1','3')   and to_char(modify_time,'yyyy-mm-dd') >= '2020-09-01' ");		
		List<TElevatorParam> elevatorList = super.findListByHql(" from TElevatorParam where tmpData = '0' and shebeizhongleidaima = '3000' and zcstatus in ('1','3')  and to_char(modify_time,'yyyy-mm-dd') >= '2020-09-01' ");		
		List<TCraneParam_qzjx> craneList = super.findListByHql(" from TCraneParam_qzjx where tmpData = '0' and shebeizhongleidaima = '4000' and zcstatus in ('1','3')  and to_char(modify_time,'yyyy-mm-dd') >= '2020-09-01' ");		
		List<TCraneParam_cc> ccList = super.findListByHql(" from TCraneParam_cc where tmpData = '0' and shebeizhongleidaima = '5000' and zcstatus in ('1','3')  and to_char(modify_time,'yyyy-mm-dd') >= '2020-09-01' ");		
		List<TRecreationParam> recreationList = super.findListByHql(" from TRecreationParam where tmpData = '0' and shebeizhongleidaima = '6000' and zcstatus in ('1','3')  and to_char(modify_time,'yyyy-mm-dd') >= '2020-09-01' ");		
		List<TPressurePipingParam> ppList = super.findListByHql(" from TPressurePipingParam where tmpData = '0' and shebeizhongleidaima = '8000' and zcstatus in ('1','3')  and to_char(modify_time,'yyyy-mm-dd') >= '2020-09-01' ");		
		List<TCablewaysParam> cablewaysList = super.findListByHql(" from TCablewaysParam where tmpData = '0' and shebeizhongleidaima = '9000' and zcstatus in ('1','3')  and to_char(modify_time,'yyyy-mm-dd') >= '2020-09-01' ");		
		List<TApprizes> apprizesList = super.findListByHql(" from TApprizes where shstate = '0' and zfstate = '0'  and to_char(modify_time,'yyyy-mm-dd') >= '2020-09-01' ");		
		
		if(boilerList.size() > 0){
			monthSeToZTSdjc("1000",boilerList);
		}
//		if(pvList.size() > 0){
//			monthSeToZTSdjc("2000",pvList);
//		}
//		if(elevatorList.size() > 0){
//			monthSeToZTSdjc("3000",elevatorList);
//		}
//		if(craneList.size() > 0){
//			monthSeToZTSdjc("4000",craneList);
//		}
//		if(ccList.size() > 0){
//			monthSeToZTSdjc("5000",ccList);
//		}
//		if(recreationList.size() > 0){
//			monthSeToZTSdjc("6000",recreationList);
//		}
//		if(ppList.size() > 0){
//			monthSeToZTSdjc("8000",ppList);
//		}
//		if(cablewaysList.size() > 0){
//			monthSeToZTSdjc("9000",cablewaysList);
//		}
//		if(apprizesList.size() > 0){
//			monthSeToZTSdjc("0000",apprizesList);
//		}
		
	}
	
	
	
	/**
	 * 定时更新下次检验日期及部分状态字段
	 */
	public void monthSeToSdjc(){
		//date_sub(curdate(),interval 1 day)  date_add(now(),interval -1 hour) create_time
		String[] zlArray = new String[]{"1000","2000","3000","4000","5000","6000","9000"};
		for(int k=0;k<zlArray.length ;k++ ){
			List<HashMap<String, Object>> seList = super.findListBySql("select id,ZCSTATUS,EQHIDE,ZFSTATE,chongfu,to_char(JIANYANJIESHURIQI,'yyyy-mm-dd') JIANYANJIESHURIQI,to_char(xiacijianyanriqi,'yyyy-mm-dd') xiacijianyanriqi,baogaobianhao,JIANYANJIELUN "+
					"from biz_se se where se.tmpdata = '0' and se.shebeizhongleidaima = '"+zlArray[k]+"' "+
					"and se.shidaima = '3701' "+
					"and  to_char(se.modify_time,'yyyy-mm-dd') >= '2020-09-01' "); 
			monthSeToZTSdjc("9999",seList);
		}
		
		
	}
	
	
	/**
	 * 定时向省局更新下次检验日期及部分状态字段
	 */
	public void monthSeToZTSdjc(String zldm ,List seList){
		int size = 100; //每次100条数据
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
//			String obj = JSONArray.fromObject(cutList).toString();
			JSONArray ss = JSONArray.parseArray(JSON.toJSONString(cutList));
			System.out.println(ss.toString());
			Shebei(zldm, ss.toString());
		}
		
	}
	
	
	public void Shebei(String zldm,String obj){
		obj = "{\"zldm\":\""+zldm+"\",\"obj\":"+obj+"}";
		
		try {
			WebClient client = WebClient.create(CATEGORY_URL);  
	        client.path("SDJC/se/save").type(TYPE_JSON).accept(TYPE_JSON).post(obj,String.class); 
		} catch (Exception e) {
			e.printStackTrace();
		}
        
	}
	
	
	

}
