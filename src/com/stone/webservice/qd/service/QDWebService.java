package com.stone.webservice.qd.service;

import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import com.stone.biz.jcsj.pojo.TBaseInfo;
import com.stone.biz.jcsj.pojo.TBaseInfoJyxx;
import com.stone.biz.jcsj.pojo.TBaseInfoSearch;
import com.stone.biz.jcsj.pojo.TBoilerParam;
import com.stone.biz.jcsj.pojo.TCablewaysParam;
import com.stone.biz.jcsj.pojo.TCraneParam;
import com.stone.biz.jcsj.pojo.TElevatorParam;
import com.stone.biz.jcsj.pojo.TPressurePipingParam;
import com.stone.biz.jcsj.pojo.TPressureVesselsParam;
import com.stone.biz.jcsj.pojo.TRecreationParam;
import com.stone.support.SupportService;
import com.stone.support.utils.CopyUtils;
import com.stone.support.utils.DateJsonValueProcessor;
import com.stone.support.utils.JsonUtils;

import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.JSONTokener;
import net.sf.json.util.JSONUtils;

public class QDWebService extends SupportService{

	/**
	 * 通过青岛传入的数据对设备进行操作
	 * 新增和更新设备
	 * zldm 必须存在 ，判断查询哪个类
	 * seid 存储省局主键，更新根据主键更新
	 * 如果新增设备要判重，根据注册代码或登记编号分别判断
	 * 注销、停用等操作直接更新状态即可，不添加历史记录
	 * @param jsonObj
	 * @return
	 * @throws Throwable 
	 */
	public String saveUD(String obj) throws Throwable{
		String mge = "";
		JSONObject jsonObj = JSONObject.fromObject(obj);
		try {
			//只修改设备
			if(jsonObj.containsKey("zcstatus")){ 
				mge = updSeZcstatus(jsonObj);
			}else if(jsonObj.containsKey("zldm") && jsonObj.containsKey("seid")){//设备主键 存在表示更新操作
				mge = updSe(jsonObj);
			}else if(jsonObj.containsKey("zldm")){
				//新增设备
				mge = saveSe(jsonObj);
			}else if(jsonObj.containsKey("plgx")){
				mge = updSeArray(jsonObj);
			}else{
				mge = "失败";
			}
		} catch (Exception e) {
			mge = "失败";
		} finally{
			
		}
		return mge;
	}
	
	
	/**
	 * 保存设备方法
	 * 规则： 根据传入的设备串转为设备，然后根据注册代码和登记证编号进行验证是否有重复设备，如果存在重复不增加，返回设备已重复
	 * 暂时进行人工判断，比较双方设备，然后进行选择
	 * @param jsonObj
	 * @return
	 * @throws Throwable
	 */
	@Transactional
	public String saveSe(JSONObject jsonObj) throws Throwable{
		String zldm = jsonObj.getString("zldm");
		Long seid = 0L;
		System.out.println(jsonObj.get("obj").toString());
		try {
			if("1000".equals(zldm)){
				TBoilerParam jsonBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TBoilerParam.class,null,"yyyy-MM-dd");
				//验证注册代码或登记证编号是否重复
				String msg = findSeChongfu(jsonBoiler.getZhucedaima(),jsonBoiler.getDengjizhengbianhao());
				if(msg.length() > 2){
					return msg;
				}
				jsonBoiler.setShiyongdanweiId(0l);
				seid = super.saveReturnId(jsonBoiler);
			}else if("2000".equals(zldm)){
				TPressureVesselsParam jsonBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TPressureVesselsParam.class,null,"yyyy-MM-dd");
				//验证注册代码或登记证编号是否重复
				String msg = findSeChongfu(jsonBoiler.getZhucedaima(),jsonBoiler.getDengjizhengbianhao());
				if(msg.length() > 2){
					return msg;
				}
				jsonBoiler.setShiyongdanweiId(0l);
				seid = super.saveReturnId(jsonBoiler);
			}else if("3000".equals(zldm)){
				TElevatorParam jsonBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TElevatorParam.class,null,"yyyy-MM-dd");
				//验证注册代码或登记证编号是否重复
				String msg = findSeChongfu(jsonBoiler.getZhucedaima(),jsonBoiler.getDengjizhengbianhao());
				if(msg.length() > 2){
					return msg;
				} 
				jsonBoiler.setShiyongdanweiId(0l);
				
				//
				
				seid = super.saveReturnId(jsonBoiler);
			}else if("4000".equals(zldm) || "5000".equals(zldm)){
				TCraneParam jsonBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TCraneParam.class,null,"yyyy-MM-dd");
				//验证注册代码或登记证编号是否重复
				String msg = findSeChongfu(jsonBoiler.getZhucedaima(),jsonBoiler.getDengjizhengbianhao());
				if(msg.length() > 2){
					return msg;
				}
				jsonBoiler.setShiyongdanweiId(0l);
				//
				//4000 5000
				jsonBoiler.setXuanbichangdu("");
				jsonBoiler.setZuidalunya("");
				jsonBoiler.setXiajiangshendu("");
				jsonBoiler.setZhugouzuoyouweizhi("");
				jsonBoiler.setZhengchezhongliang("");
				jsonBoiler.setEdinghengyisudu("");
				jsonBoiler.setQishengsudu("");
				jsonBoiler.setQishenggaodu("");
			
				jsonBoiler.setEdingqizhongliang("");
				
				jsonBoiler.setQudong("");
				jsonBoiler.setChangneicheliang_edingzaihe("");
				jsonBoiler.setZhengchezhongliang("");
				jsonBoiler.setQishenggaodu("");
				jsonBoiler.setXuanbichangdu("");
				jsonBoiler.setXiajiangshendu("");
				jsonBoiler.setCengshu("");
				jsonBoiler.setXuanbichangdu("");
				jsonBoiler.setFadongjiedinggonglv("");
				jsonBoiler.setXjsd_edingqizhongliang("");
				jsonBoiler.setDengji("");
				
				jsonBoiler.setJianyanjigou("");
				seid = super.saveReturnId(jsonBoiler);
			}else if("6000".equals(zldm)){
				TRecreationParam jsonBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TRecreationParam.class,null,"yyyy-MM-dd");
				//验证注册代码或登记证编号是否重复
				String msg = findSeChongfu(jsonBoiler.getZhucedaima(),jsonBoiler.getDengjizhengbianhao());
				if(msg.length() > 2){
					return msg;
				}
				jsonBoiler.setShiyongdanweiId(0l);
				seid = super.saveReturnId(jsonBoiler);
			}else if("9000".equals(zldm)){
				TCablewaysParam jsonBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TCablewaysParam.class,null,"yyyy-MM-dd");
				//验证注册代码或登记证编号是否重复
				String msg = findSeChongfu(jsonBoiler.getZhucedaima(),jsonBoiler.getDengjizhengbianhao());
				if(msg.length() > 2){
					return msg;
				}
				jsonBoiler.setShiyongdanweiId(0l);
				seid = super.saveReturnId(jsonBoiler);
			}else if("8000".equals(zldm)){
				TPressurePipingParam gdBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TPressurePipingParam.class);
				gdBoiler.setShiyongdanweiId(0l);
				seid = super.saveReturnId(gdBoiler);
			}
		} catch (Exception e) {
			return "失败";
		}
		
		return seid.toString();
	}
	
	/**
	 * 更改设备方法
	 * 根据传入的设备主键进行查找，然后对设备进行赋值
	 * @param jsonObj
	 * @return
	 * @throws Throwable
	 */
	public String updSe(JSONObject jsonObj) throws Throwable{
		String zldm = jsonObj.getString("zldm");
		String seid = jsonObj.getString("seid");
		String message = "";
		try {
			if("1000".equals(zldm)){
				TBoilerParam jsonBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TBoilerParam.class,null,"yyyy-MM-dd");
				TBoilerParam boilerParam = (TBoilerParam) super.findById(Long.parseLong(seid), TBoilerParam.class.getName());
				if(boilerParam == null){
					saveSe(jsonObj);
				}
				CopyUtils.Copy(jsonBoiler, boilerParam);
				boilerParam.setUpdateTime(new Date());
				boilerParam.setTmpData("0");
				boilerParam.setShiyongdanweiId(0l);
				super.update(boilerParam);
			}else if("2000".equals(zldm)){
				TPressureVesselsParam pvBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TPressureVesselsParam.class,null,"yyyy-MM-dd");
				TPressureVesselsParam pvParam = (TPressureVesselsParam) super.findById(Long.parseLong(seid), TPressureVesselsParam.class.getName());
				if(pvParam == null){
					saveSe(jsonObj);
				}
				CopyUtils.Copy(pvBoiler, pvParam);
				pvParam.setUpdateTime(new Date());
				pvParam.setTmpData("0");
				pvParam.setShiyongdanweiId(0l);
				super.update(pvParam);
			}else if("3000".equals(zldm)){
				TElevatorParam elevatorBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TElevatorParam.class,null,"yyyy-MM-dd");
				TElevatorParam elevatorParam = (TElevatorParam) super.findById(Long.parseLong(seid), TElevatorParam.class.getName());
				if(elevatorParam == null){
					saveSe(jsonObj);
				}
				CopyUtils.Copy(elevatorBoiler, elevatorParam);
				elevatorParam.setUpdateTime(new Date());
				elevatorParam.setTmpData("0");
				elevatorParam.setShiyongdanweiId(0l);
				super.update(elevatorParam);
			}else if("4000".equals(zldm) || "5000".equals(zldm)){
				TCraneParam craneBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TCraneParam.class,null,"yyyy-MM-dd");
				TCraneParam craneParam = (TCraneParam) super.findById(Long.parseLong(seid), TCraneParam.class.getName());
				if(craneParam == null){
					saveSe(jsonObj);
				}
				CopyUtils.Copy(craneBoiler, craneParam);
				craneParam.setUpdateTime(new Date());
				craneParam.setTmpData("0");
				craneParam.setShiyongdanweiId(0l);
				super.update(craneParam);
			}else if("6000".equals(zldm)){
				TRecreationParam recreatBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TRecreationParam.class,null,"yyyy-MM-dd");
				TRecreationParam recreatParam = (TRecreationParam) super.findById(Long.parseLong(seid), TRecreationParam.class.getName());
				if(recreatParam == null){
					saveSe(jsonObj);
				}
				CopyUtils.Copy(recreatBoiler, recreatParam);
				recreatParam.setUpdateTime(new Date());
				recreatParam.setTmpData("0");
				recreatParam.setShiyongdanweiId(0l);
				super.update(recreatParam);
			}else if("9000".equals(zldm)){
				TCablewaysParam cablewayBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TCablewaysParam.class,null,"yyyy-MM-dd");
				TCablewaysParam cablewayParam = (TCablewaysParam) super.findById(Long.parseLong(seid), TCablewaysParam.class.getName());
				if(cablewayParam == null){
					saveSe(jsonObj);
				}
				CopyUtils.Copy(cablewayBoiler, cablewayParam);
				cablewayParam.setUpdateTime(new Date());
				cablewayParam.setTmpData("0");
				cablewayParam.setShiyongdanweiId(0l);
				super.update(cablewayParam);
			}else if("8000".equals(zldm)){
				TPressurePipingParam gdBoiler = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TPressurePipingParam.class,null,"yyyy-MM-dd");
				TPressurePipingParam gdParam = (TPressurePipingParam) super.findById(Long.parseLong(seid), TPressurePipingParam.class.getName());
				if(gdParam == null){
					saveSe(jsonObj);
				}
				CopyUtils.Copy(gdBoiler, gdParam);
				gdParam.setUpdateTime(new Date());
				gdParam.setTmpData("0");
				gdParam.setShiyongdanweiId(0l);
				super.update(gdParam);
			}else if("9999".equals(zldm)){
				TBaseInfoJyxx base = JsonUtils.json2Bean(JSONObject.fromObject(jsonObj.get("obj")), TBaseInfoJyxx.class,null,"yyyy-MM-dd");
				TBaseInfoJyxx tbase = (TBaseInfoJyxx) super.findById(Long.parseLong(seid), TBaseInfoJyxx.class.getName());
				CopyUtils.Copy(base, tbase);
				tbase.setUpdateTime(new Date());
				tbase.setTmpData("0");
				super.update(tbase);
			}
			message = "成功";
		} catch (Exception e) {
			e.printStackTrace();
			message = "失败";
		}
		return message;
	}
	
	
	/**
	 * 更新设备状态
	 * @param jsonObj
	 * @return
	 */
	public String updSeZcstatus(JSONObject jsonObj){
		String message = "";
		try {
			String zcstatus = jsonObj.getString("zcstatus");
			String seid = jsonObj.getString("seid");
			//super.updateByHQL("update TBaseInfoCache set zcstatus = '"+zcstatus+"' where id = "+seid, null);
			super.insertBySql("update biz_se set zcstatus = '"+zcstatus+"',biangengriqi=sysdate where id = "+seid);
			message = "成功";
		} catch (Exception e) {
			e.printStackTrace();
			message = "失败";
		}
		
		return message;
	}
	
	
	/**
	 * 判断是否存在重复数据
	 * @param zcdm
	 * @param djbh
	 * @return
	 */
	public String findSeChongfu(Object zcdm,Object djbh){
		if(null != zcdm && zcdm.toString().trim().length() > 8){
			Long ct = super.findTotalBySql("select count(*) ct from biz_se se where se.tmpdata='0' and se.shidaima='3702' and ( se.zcstatus = '1' or se.zcstatus = '3')" +
				    " and trim(se.zhucedaima) = '"+zcdm.toString().trim()+"' ");
			if(ct > 0 ){
				super.insertBySql("update biz_se se set se.zcstatus = '7',se.biangengriqi=sysdate where se.tmpdata='0' and se.shidaima='3702' and ( se.zcstatus = '1' or se.zcstatus = '3')" +
				    " and trim(se.zhucedaima) = '"+zcdm.toString().trim()+"' ");
				return "";
			}else{
				if(null != djbh && djbh.toString().trim().length() > 3){
					ct = super.findTotalBySql("select count(*) ct from biz_se se where se.tmpdata='0' and se.shidaima='3702' and ( se.zcstatus = '1' or se.zcstatus = '3')" +
						    " and trim(se.dengjizhengbianhao) = '"+djbh.toString().trim()+"' ");
					if(ct > 0){
						super.insertBySql("update biz_se se set se.zcstatus = '7',se.biangengriqi=sysdate where se.tmpdata='0' and se.shidaima='3702' and ( se.zcstatus = '1' or se.zcstatus = '3')" +
						    " and trim(se.dengjizhengbianhao) = '"+djbh.toString().trim()+"' ");
						return "";
					}
				}
				
			} 
		}else if(null != djbh && djbh.toString().trim().length() > 3){
			Long ct = super.findTotalBySql("select count(*) ct from biz_se se where se.tmpdata='0' and se.shidaima='3702' and ( se.zcstatus = '1' or se.zcstatus = '3')" +
				    " and trim(se.dengjizhengbianhao) = '"+djbh.toString().trim()+"' ");
			if(ct > 0){
				super.insertBySql("update biz_se se set se.zcstatus = '7',se.biangengriqi=sysdate where se.tmpdata='0' and se.shidaima='3702' and ( se.zcstatus = '1' or se.zcstatus = '3')" +
					    " and trim(se.dengjizhengbianhao) = '"+djbh.toString().trim()+"' ");
				return "";
			}
		}
		
		return "";
	}
	
	
	/**
	 * 批量更新设备部分信息
	 * @param jsonObj
	 * @return
	 */
	public String updSeArray(JSONObject jsonObj){
		String message = "";
		try {
			Object listArray = new JSONTokener(jsonObj.getString("obj")).nextValue();
            if (listArray instanceof JSONArray){
            	JSONArray jsonArray = (JSONArray)listArray;
	            for (int k = 0; k < jsonArray.size(); k++) {
	            	//{"jianyanjieshuriqi":"2017-05-08","jianyanjielun":"符合要求","xiacijianyanriqi":"2020-05-07","baogaobianhao":"RD20170097-4001","zfstate":"0","se_id":"1078319","zcstatus":"1","eqhide":"0","chongfu":"0"}
	                JSONObject jsonObject = jsonArray.getJSONObject(k);
	                
	    			String zfstate = jsonObject.getString("zfstate");
	    			String seid = jsonObject.getString("se_id");
	    			String zcstatus = jsonObject.getString("zcstatus");
	    			String chongfu = jsonObject.getString("chongfu");
	    			String eqhide = jsonObject.getString("eqhide");
	    			String yjyy = jsonObject.getString("yjyy");
	    			String jianyanjigou = jsonObject.getString("jianyanjigou");
	    			
	    			if(!jsonObject.containsKey("jianyanjieshuriqi")){
	    				String shiyongdanwei = jsonObject.getString("shiyongdanwei");
		    			String quhuadaima = jsonObject.getString("quhuadaima");
		    			String xiangzhendaima = jsonObject.getString("xiangzhendaima");
	    				super.insertBySql("update biz_se se set se.zcstatus = '"+zcstatus+"' ,se.eqhide = '"+eqhide+"',se.zfstate = '"+zfstate+"',se.chongfu = '"+chongfu+"',se.yjyy = '"+yjyy+"'," +
		    					" shiyongdanwei = '"+shiyongdanwei+"',quhuadaima = '"+quhuadaima+"',xiangzhendaima = '"+xiangzhendaima+"' " +
		    					"where se.tmpdata='0' and se.shidaima='3702' and se.id = '"+seid+"' ");
	    			}else{
	    				String jianyanjieshuriqi = jsonObject.getString("jianyanjieshuriqi");
		    			String jianyanjielun = jsonObject.getString("jianyanjielun");
		    			String xiacijianyanriqi = jsonObject.getString("xiacijianyanriqi");
		    			String baogaobianhao = jsonObject.getString("baogaobianhao");
	    				super.insertBySql("update biz_se se set se.zcstatus = '"+zcstatus+"' ,se.eqhide = '"+eqhide+"',se.zfstate = '"+zfstate+"',se.chongfu = '"+chongfu+"',se.yjyy = '"+yjyy+"'," +
		    					"se.jianyanjieshuriqi = to_date('"+jianyanjieshuriqi+"','yyyy-mm-dd') ,se.xiacijianyanriqi = to_date('"+xiacijianyanriqi+"','yyyy-mm-dd'),"
		    							+ "se.baogaobianhao = '"+baogaobianhao+"',se.jianyanjielun = '"+jianyanjielun+"',se.jianyanjigou = '"+jianyanjigou+"'  " +
		    					"where se.tmpdata='0' and se.shidaima='3702' and se.id = '"+seid+"' ");
	    			}
	                
	    			
	                
	            }
            }else if (listArray instanceof JSONObject) {
            	JSONObject jsonObject3 = (JSONObject)listArray;
            }
			message = "成功";
		} catch (Exception e) {
			e.printStackTrace();
			message = "失败";
		}
		
		return message;
	}
	
	
	
	/**
	 * 更新设备 单位名称和区划
	 * @param str
	 */
	public String saveQDDw(String str){
		
		JSONObject jsonObj = JSONObject.fromObject(str);
		
		String message = "";
		try {
			Object listArray = new JSONTokener(jsonObj.getString("obj")).nextValue();
            if (listArray instanceof JSONArray){
            	JSONArray jsonArray = (JSONArray)listArray;
	            for (int k = 0; k < jsonArray.size(); k++) {
	                JSONObject jsonObject = jsonArray.getJSONObject(k);
	                
	    			String shiyongdanwei = jsonObject.getString("shiyongdanwei");
	    			String seid = jsonObject.getString("se_id");
	    			String quhuadaima = jsonObject.getString("quhuadaima");
	    			String xiangzhendaima = jsonObject.getString("xiangzhendaima");
	    			
	                
	    			super.insertBySql("insert into wwww (id,sydw,qx,xz) values ('"+seid+"','"+shiyongdanwei+"','"+quhuadaima+"','"+xiangzhendaima+"')" );
	                
	            }
            }
			message = "成功";
		} catch (Exception e) {
			e.printStackTrace();
			message = "失败";
		}
		
		return message;
	}
	
	
}
