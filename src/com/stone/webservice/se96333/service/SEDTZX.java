package com.stone.webservice.se96333.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.ts365.api.api.SE96333;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.alibaba.fastjson.JSON;
import com.stone.support.SupportService;
import com.stone.support.utils.JsonDateValueProcessor;
import com.stone.support.utils.MD5Utils;
import com.stone.webservice.se96333.pojo.TQDDTParamView;

public class SEDTZX extends SupportService{
	
	public static void main(String[] args) {
		new SEDTZX().toSE96333();
	}

	/**
	 * 给省局电梯中心写入需要更新的电梯数据
	 */
	public void saveSJDT(){
		//  to_char(TRUNC(SYSDATE - 1),'yyyy-mm-dd')
		String sql = "insert into web_sjdtzx_record (id,maid) "+
	     "select seq_dzdtzx.nextval,se.id from biz_se se where se.tmpdata = '0' and se.zfstate = '0' "
	     + " and chongfu='0' and se.zcstatus in ('0','1','3','5','7') and se.shebeizhongleidaima = '3000' " +
	     "and to_char(se.modify_time,'yyyy-mm-dd') >= to_char(TRUNC(SYSDATE - 1),'yyyy-mm-dd') ";
		super.insertBySql(sql);
	}
	
	
	public void toSE96333(){
		try {
			saveSJDT(); //初始化省局电梯中间表
			String querySJDT = " select id, maid from web_sjdtzx_record where status = '0' order by id desc";
			List<HashMap<String, Object>> dtMapList = super.findListBySql(querySJDT);
			
			splitList(dtMapList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * 通过接口传输到电梯中心
	 * @param dtList
	 * @return
	 */
	public JSONObject doSE96333(List dtList){
		System.out.println(dtList.size());
		JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());// 注入处理Date类
		String sourceStr = "userID=record.connect.lift&sydjList="+regEx(JSONArray.fromObject(dtList,jsonConfig).toString())+"&key=TSJDGLXT.sd96333";
		System.out.println(MD5Utils.MD5(sourceStr.toLowerCase()));
		SE96333 sedt = new SE96333();
		String s = (String) sedt.uploadSYDJList("record.connect.lift", MD5Utils.MD5(sourceStr.toLowerCase()),regEx(JSONArray.fromObject(dtList,jsonConfig).toString()));
		System.out.println(s);
		JSONObject obj = (JSONObject) JSONArray.fromObject(s).get(0);
		
		return obj;
		
	}
	
	/**
	 * 根据返回结果处理中间表数据
	 * @param result
	 */
	public void updateSEDT(JSONObject result,String ids){
		String status = "";
		String msg = "异常数据";
		if(result != null){
			status = result.get("status").toString();
			msg = result.get("msg").toString();
		}
		try {
			if("1".equals(status)){
				super.insertBySql("update web_sjdtzx_record set status = '1',updatetime=sysdate where status = '0' and id in ( "+ids+" )");
			}else{
				super.insertBySql("update web_sjdtzx_record set cause='"+msg+"',status = '2',updatetime=sysdate where status = '0' and id in ( "+ids+" )");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	/**
	 * 得到需要传输的对象集合
	 * @param ids
	 * @return
	 */
	public List listDt(String ids){
		String sql = "select trim(se.zhucedaima) zcdm, se.dengjizhengbianhao sydjzbh, to_char(se.zhuceriqi,'yyyy-mm-dd') zcdjrq, se.shi dishi, se.quhuamingcheng xzqhmc, se.quhuadaima xzqhbh," +
				"se.shebeimingcheng sbmc,se.shebeileibiedaima sblbbh, se.shebeileibie sblbmc, se.shenbeipinzhongdaima sbpzbh,se.shebeipinzhong sbpzmc,se.shebeixinghao dtxh," +
				"se.chuchangbianhao ccbh, se.shiyongdanwei sydwmc,se.shiyongdanwei_code sydwdm,se.neibubianhao dwnbh,se.shiyongchangsuo sycsfl,se.shebeididian azdz,se.zcstatus dtzt," +
				"se.jianyanjigou jyjgmc,to_char(se.jianyanjieshuriqi,'yyyy-mm-dd') jyrq,to_char(se.xiacijianyanriqi,'yyyy-mm-dd') xcjyrq,se.jianyanjielun jyjl,se.zhizaodanwei zzdw," +
				"se.zhizaodanwei_code zzdwdm,to_char(se.zhizaoriqi_date,'yyyy-mm-dd') zzrq,se.anzhuangdanwei azdw,se.anzhuangdanwei_daima azdwdm,to_char(se.anzhuangriqi,'yyyy-mm-dd') azrq, " +
				"e.edingzaizhongliang edzzl, e.edingsudu edsd,e.tishenggaodu tsgd,e.qingxiejiao qxjd,e.ceng cs,e.zhan zs ,e.men ms, se.eqhide eqhide, se.yjyy yjyy," +
				"WEIHUBAOYANGDANWEI wbdw,WEIHUBAOYANGDANWEI_CODE wbdwdm,WEIHUBAOYANGDANWEI_LIANXIREN wbdwlxr,WEIHUBAOYANGDANWEI_DIANHUA wbdwlxdh," +
				"SHIYONGDANWEI_LIANXIREN sydwlxr,se.SHIYONGDANWEI_LIANXIDIANHUA sydwlxdh,id " +
				" from  biz_se se, biz_elevatorparam e where se.id = e.elevatorid and se.id in ("+ids+") ";
		
		List<HashMap<String, Object>> mapList =  super.findListBySql(sql);
		
		TQDDTParamView view = null;
		List<TQDDTParamView> viewList = new ArrayList<TQDDTParamView>();
		for(HashMap<String, Object> map : mapList){
			view = JSON.parseObject(JSON.toJSONString(map),TQDDTParamView.class);
			viewList.add(view);
		}
		return viewList;
	}
	
	
	/**
	 * 拆分集合
	 * @param dtMapList
	 * @return
	 */
	public void splitList(List dtMapList){
		int size = 100; //每次100条数据
		int count = dtMapList.size();
		int temp = count/size + 1;
		boolean special = count % size == 0;
		List childList = new ArrayList();
		for(int i= 0;i < temp; i++){
			if(i == temp - 1){
				if(special){
					break;
				}
				childList = dtMapList.subList(size * i, count);
			}else{
				childList = dtMapList.subList(size * i, size * (i+1));
			}
			
			String maid = toArrayMaid(childList);
			String ids = toArrayId(childList);
			JSONObject result = null;
			//传输的电梯数据
			List dtList = null;
			try {
				dtList = listDt(maid);
				result = doSE96333(dtList);
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				updateSEDT(result, ids);
			}
			
		}
	}
	
	/**
	 * map 转为数组
	 * 设备主键
	 */
	public String toArrayMaid(List dtMapList){
		JSONArray jsonArr = JSONArray.fromObject(dtMapList);
		String[] ids = new String[jsonArr.size()];
		for(int i=0;i<jsonArr.size();i++){
			ids[i] = jsonArr.getJSONObject(i).getString("maid");
		}
		
		return StringUtils.join(ids, ",");
	}
	
	/**
	 * map 转为数组
	 * 中间表主键
	 */
	public String toArrayId(List dtMapList){
		JSONArray jsonArr = JSONArray.fromObject(dtMapList);
		String[] ids = new String[jsonArr.size()];
		for(int i=0;i<jsonArr.size();i++){
			ids[i] = jsonArr.getJSONObject(i).getString("id");
		}
		
		return StringUtils.join(ids, ",");
	}
	
	public String regEx(String json){
		String regEx="[`~!@#$%^&*+=|''@#￥%……&*——+|【】‘；：”“’、？]";
		String regStr = json.replaceAll(regEx,"");
		
		
		if (regStr != null) {
	        Pattern p = Pattern.compile("\\s*|\t|\r|\n");
	        Matcher m = p.matcher(regStr);
	        regStr = m.replaceAll("");
	    }

		System.out.println(regStr);
		return regStr;
	}
	
	
}
