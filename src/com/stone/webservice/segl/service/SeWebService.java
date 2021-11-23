
package com.stone.webservice.segl.service;

import java.net.SocketException;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.stone.biz.jcsj.pojo.TBoilerParam;
import com.stone.biz.jcsj.pojo.TCablewaysParam;
import com.stone.biz.jcsj.pojo.TCraneParam;
import com.stone.biz.jcsj.pojo.TElevatorParam;
import com.stone.biz.jcsj.pojo.TPressurePipingParam;
import com.stone.biz.jcsj.pojo.TPressureVesselsParam;
import com.stone.biz.jcsj.pojo.TRecreationParam;
import com.stone.support.SupportService;
import com.stone.support.utils.AesUtils;
import com.stone.support.utils.DateJsonValueProcessor;
import com.stone.support.utils.JsonUtils;
import com.stone.webservice.segl.pojo.TJianCeXinXi;
import com.stone.webservice.segl.pojo.dongying.TBoilerParamD;
import com.stone.webservice.segl.pojo.dongying.TCraneParam_ccD;
import com.stone.webservice.segl.pojo.dongying.TCraneParam_qzjxD;
import com.stone.webservice.segl.pojo.dongying.TElevatorParamD;
import com.stone.webservice.segl.pojo.dongying.TPressureVesselsParamD;

public class SeWebService extends SupportService{
	
	
	
	
	
	
	/**
	 * 查询设备
	 * @param name
	 * @param pwd
	 * @param shidaima
	 * @param map tiaoshu  yema shiyongdanwei zhucedaima chuchangbianhao zhizaodanwei
	 * @return
	 */
	public String getSeLsit(String name,String pwd,String shidaima,String map){
		
		if(getUser(name,pwd)){
			
			JSONArray jsonArray = JSONArray.fromObject(map);
			JSONObject json = JSONObject.fromObject(jsonArray.getJSONObject(0));
			
			String tiaoshu = "";
			String yema = "";
			String shiyongdanwei = "";
			String zhucedaima = "";
			String chuchangbianhao = "";
			String zhizaodanwei = "";
			String shebeizhonglei ="";
			String quhuamingcheng = "";
			String gaozhibianhao =""; //登记证编号
			String gzrq_start = "";
			String xcjyrq = "";
			String jyrq = "";
			String shigongdanwei = "";
			String state = ""; //设备状态 zcstatus
			
			if(json.containsKey("tiaoshu")){
				tiaoshu = json.get("tiaoshu").toString();
			}
			if(json.containsKey("yema")){
				yema = json.get("yema").toString();
			}
			if(json.containsKey("shiyongdanwei")){
				shiyongdanwei = json.get("shiyongdanwei").toString();
			}
			if(json.containsKey("zhucedaima")){
				zhucedaima = json.get("zhucedaima").toString();
			}
			if(json.containsKey("chuchangbianhao")){
				chuchangbianhao = json.get("chuchangbianhao").toString();
			}
			if(json.containsKey("zhizaodanwei")){
				zhizaodanwei = json.get("zhizaodanwei").toString();
			}
			if(json.containsKey("shebeizhonglei")){
				shebeizhonglei = json.get("shebeizhonglei").toString();
			}
			if(json.containsKey("quhuamingcheng")){
				quhuamingcheng = json.get("quhuamingcheng").toString();
			}
			if(json.containsKey("gaozhidanbianhao")){
				gaozhibianhao = json.get("gaozhidanbianhao").toString(); //登记证编号
			}
			if(json.containsKey("xiacijianyanriqi")){
				xcjyrq = json.get("xiacijianyanriqi").toString();
			}
			if(json.containsKey("jianyanjieshuriqi")){
				jyrq = json.get("jianyanjieshuriqi").toString();
			}
			if(json.containsKey("shigongdanwei")){
				shigongdanwei = json.get("shigongdanwei").toString();
			}
			if(json.containsKey("state")){
				state = json.getString("state").toString();
			}
			
			//(t.zcstatus = '1' or t.zcstatus = '3') and
			String sql = " select id,shiyongdanwei,zhucedaima,to_char(xiacijianyanriqi,'yyyy-MM-dd') xiacijianyanriqi,zcstatus," +
					" quhuamingcheng,shebeixinghao,shebeididian,shebeizhonglei,shebeizhongleidaima,shebeimingcheng,dengjizhengbianhao,chuchangbianhao " +
					" from biz_se t where t.tmpdata = '0' and  t.shidaima = '"+shidaima+"' "; 
			String append = "";
			String order = " order by t.zhucedaima asc";
			
			if(shiyongdanwei.length() > 0 && !"null".equals(shiyongdanwei)){
				append += " and t.shiyongdanwei like '%"+shiyongdanwei+"%'";
			}
			
			if(zhucedaima.length() > 0 && !"null".equals(zhucedaima)){
				append += " and t.zhucedaima like '%"+zhucedaima+"%'";
			}
			
			if(chuchangbianhao.length() > 0 && !"null".equals(chuchangbianhao)){
				append += " and t.chuchangbianhao like '%"+chuchangbianhao+"%'";
			}
			
			if(zhizaodanwei.length() > 0 && !"null".equals(zhizaodanwei)){
				append += " and t.zhizaodanwei like '%"+zhizaodanwei+"%'";
			}
			
			if(shebeizhonglei.length() > 0 && !"null".equals(shebeizhonglei)){
				append += " and t.shebeizhongleidaima = '"+shebeizhonglei+"'";
			}
			
			if(quhuamingcheng.length() > 0 && !"null".equals(quhuamingcheng)){
				append += " and t.quhuadaima = '"+quhuamingcheng+"'";
			}
			
			if(gaozhibianhao.length() > 0 && !"null".equals(gaozhibianhao)){ //登记证编号
				append += " and t.dengjizhengbianhao like '%"+gaozhibianhao+"%'";
			}
			if(gzrq_start.length() > 0 && !"null".equals(gzrq_start)){
				append += " and to_char( t.gaozhiriqi,'yyyy-mm-dd' )= '"+gzrq_start+"'";
			}
			
			if(xcjyrq.length() > 0 && !"null".equals(xcjyrq)){
				append += " and to_char( t.xiacijianyanriqi,'yyyy-mm-dd' ) >= '"+xcjyrq+"'";
			}
			if(jyrq.length() > 0 && !"null".equals(jyrq)){
				append += " and to_char( t.xiacijianyanriqi,'yyyy-mm-dd' ) <= '"+jyrq+"'";
			}
			if(shigongdanwei.length() > 0 && !"null".equals(shigongdanwei)){ 
				append += " and t.shigongdanwei like '%"+shigongdanwei+"%'";
			}
			if(state.length() > 0 && !"null".equals(state)){
				append += " and t.zcstatus = '"+state+"' ";
			}else{
				append += " and t.zcstatus <= '3' ";
			}
			
			sql += append+order;
			
			int startPage = (Integer.parseInt(yema)-1)*Integer.parseInt(tiaoshu);
			int endPage = Integer.parseInt(tiaoshu)*Integer.parseInt(yema);
			
			String fySql = " select * from ( select A.*,ROWNUM RN  from ("+sql+" ) A where rownum <= '"+endPage+"'   ) WHERE RN >'"+startPage+"'  ";
			
			List<HashMap<String, Object>> seList = super.findListBySql(fySql);
			
			long total = super.findTotalByHql("select count(t) from TBaseInfoSearch t where 1=1 and (t.zcstatus = '1' or t.zcstatus = '3') and t.tmpData = '0' and  t.shidaima = '"+shidaima+"' "+append);
			if(seList.size() > 0){
				JSONArray jsonA = JSONArray.fromObject(seList);
				
				return "[{\"msg\":\"成功\",\"total\":"+total+",\"list\":"+jsonA.toString()+"}]";
			}
			
			return "[{\"msg\":\"无数据\"}]";
			
		}else{
			return "[{\"msg\":\"用户不存在\"}]";
		}
		
	}
	
	
	public String getSe(String name,String pwd,String shebeizhonglei,String ids){
		List list = null;
		if(getUser(name, pwd)){
			
			if("1000".equals(shebeizhonglei)){
				list = super.findListByIds(ids, TBoilerParam.class);
			}else if("2000".equals(shebeizhonglei)){
				list = super.findListByIds(ids, TPressureVesselsParam.class);
			}else if("3000".equals(shebeizhonglei)){
				list = super.findListByIds(ids, TElevatorParam.class);
			}else if("4000".equals(shebeizhonglei) || "5000".equals(shebeizhonglei)){
				list = super.findListByIds(ids, TCraneParam.class);
			}else if("6000".equals(shebeizhonglei)){
				list = super.findListByIds(ids, TRecreationParam.class);
			}else if("8000".equals(shebeizhonglei)){
				list = super.findListByIds(ids, TPressurePipingParam.class);
			}else if("9000".equals(shebeizhonglei)){
				list = super.findListByIds(ids, TCablewaysParam.class);
			}
			
			if(list.size() > 0){
				JsonConfig jsonConfig = new JsonConfig();  
		        jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());  
				JSONArray json = JSONArray.fromObject(list,jsonConfig);
				
				return "[{\"msg\":\"成功\",\"list\":"+json.toString()+"}]";
			}
			return "[{\"msg\":\"无数据\"}]";
		}else{
			return "[{\"msg\":\"用户不存在\"}]";
		}
	}
	
	
	public String getSeCode(String name,String pwd,String shebeizhonglei,String zhucedaima){
		
		if(getUser(name, pwd)){
			String seHql = "";
			List list = null;
			if("1000".equals(shebeizhonglei)){
				seHql = " from TBoilerParam t where t.zhucedaima = '"+zhucedaima+"' ";
				list = super.findListByHql(seHql);
			}else if("2000".equals(shebeizhonglei)){
				seHql = " from TPressureVesselsParam t where t.zhucedaima = '"+zhucedaima+"' ";
			}else if("3000".equals(shebeizhonglei)){
				seHql = " from TElevatorParam t where t.zhucedaima = '"+zhucedaima+"' ";
			}else if("4000".equals(shebeizhonglei) || "5000".equals(shebeizhonglei)){
				seHql = " from TCraneParam t where t.zhucedaima = '"+zhucedaima+"' ";
			}else if("6000".equals(shebeizhonglei)){
				seHql = " from TRecreationParam t where t.zhucedaima = '"+zhucedaima+"' ";
			}else if("8000".equals(shebeizhonglei)){
				seHql = " from TPressurePipingParam t where t.zhucedaima = '"+zhucedaima+"' ";
			}else if("9000".equals(shebeizhonglei)){
				seHql = " from TCablewaysParam t where t.zhucedaima = '"+zhucedaima+"' ";
			}
			list = super.findListByHql(seHql);
			if(list.size() > 0){
				JsonConfig jsonConfig = new JsonConfig();  
		        jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());  
				JSONArray json = JSONArray.fromObject(list.get(0),jsonConfig);
				
				return "[{\"msg\":\"成功\",\"list\":"+json.toString()+"}]";
			}
			return "[{\"msg\":\"无数据\"}]";
		}else{
			return "[{\"msg\":\"用户不存在\"}]";
		}
	}
	
	
	
	/**
	 * 查看用户是否存在
	 * @param name
	 * @param pwd
	 * @return
	 */
	public boolean getUser(String name,String pwd){
		boolean flag = false;
		
		String sql = " select id from web_user where name = '"+name+"' and password = '"+pwd+"' ";
		if(super.findListBySql(sql).size()>0){
			flag = true;
		}
		
		return flag;
	}

	
	
	/**
	 * 东营市获取报检信息列表使用
	 * @param name
	 * @param pwd
	 * @param map
	 * @return
	 */
	public String getDYSeList(String name,String pwd,String map){
		
		if(getUser(name,pwd)){
			
			JSONObject json = JSONObject.fromObject(map);
			
			String shiyongdanwei = "";
			String shebeizhongleidaima ="";
			String shebeidaima = "";
			String zhucedaima = "";
			String dengjizhengbianhao =""; //登记证编号
			
			if(json.containsKey("shiyongdanwei")){
				shiyongdanwei = json.get("shiyongdanwei").toString();
			}
			if(json.containsKey("shebeizhongleidaima")){
				shebeizhongleidaima = json.get("shebeizhongleidaima").toString();
			}
			if(json.containsKey("zhucedaima")){
				zhucedaima = json.get("zhucedaima").toString();
			}
			if(json.containsKey("dengjizhengbianhao")){
				dengjizhengbianhao = json.get("dengjizhengbianhao").toString(); //登记证编号
			}
			if(json.containsKey("shebeidaima")){
				shebeidaima = json.get("shebeidaima").toString(); //登记证编号
			}
			
			//(t.zcstatus = '1' or t.zcstatus = '3') and
			String sql = " select id maid,shebeizhonglei,shebeizhongleidaima,to_char(xiacijianyanriqi,'yyyy-MM-dd') xiacijianyanriqi," +
					" shebeileibie,shebeipinzhong,shebeimingcheng,zhucedaima,quhuamingcheng,shebeididian,dengjizhengbianhao,chuchangbianhao," +
					" neibubianhao,shebeixinghao,to_char(zhuceriqi,'yyyy-MM-dd') zhuceriqi,shiyongdanwei,shiyongdanwei_code,shiyongdanwei_dizhi," +
					" shiyongdanwei_lianxiren,shiyongdanwei_lianxidianhua,shiyongdanwei_suoshuhangye,anquanguanlibumen,anquanguanlirenyuan," +
					" anquanguanli_lianxidianhua,chanquandanwei,chanquandanwei_daima,chanquandanwei_dizhi,zhizaodanwei,zhizaoriqi,anzhuangdanwei," +
					" to_char(anzhuangriqi,'yyyy-MM-dd') anzhuangriqi,shebeidaima,shigongdanwei,shigongdanwei_xukezhengbianhao,weihubaoyangdanwei," +
					" weihubaoyangdanwei_dianhua,beizhu,zcstatus " +
					" from biz_se t where t.tmpdata = '0' and  t.shidaima = '3705' and t.zfstate = '0' and t.chongfu = '0' and t.zcstatus <= '3' " +
					" and t.shebeizhongleidaima <= '5000' "; 
			String append = "";
			String order = " order by t.zhucedaima asc";
			
			if(shiyongdanwei.length() > 0 && !"null".equals(shiyongdanwei)){
				append += " and t.shiyongdanwei = '"+shiyongdanwei+"'";
			}
			if(shebeizhongleidaima.length() > 0 && !"null".equals(shebeizhongleidaima)){
				append += " and t.shebeizhongleidaima = '"+shebeizhongleidaima+"'";
			}
			if(zhucedaima.length() > 0 && !"null".equals(zhucedaima)){
				append += " and t.zhucedaima like '%"+zhucedaima+"%'";
			}
			if(shebeidaima.length() > 0 && !"null".equals(shebeidaima)){
				append += " and t.shebeidaima like '%"+shebeidaima+"%'";
			}
			if(dengjizhengbianhao.length() > 0 && !"null".equals(dengjizhengbianhao)){
				append += " and t.dengjizhengbianhao like '%"+dengjizhengbianhao+"%'";
			}
			
			if("".equals(append)){
				return "[{\"msg\":\"无数据\"}]";
			}
			sql += append;
			
			List<HashMap<String, Object>> seList = super.findListBySql(sql);
			
			if(seList.size() > 0){
				JSONArray jsonA = JSONArray.fromObject(seList);
				
				return "[{\"msg\":\"成功\",\"list\":"+jsonA.toString()+"}]";
			}
			
			return "[{\"msg\":\"无数据\"}]";
			
		}else{
			return "[{\"msg\":\"用户不存在\"}]";
		}
	}
	
	
	/**
	 * 东营根据主键获取
	 * @param name
	 * @param pwd
	 * @param shebeizhonglei
	 * @param ids
	 * @return
	 */
	public String getDYSe(String name,String pwd,String shebeizhonglei,String ids){
		List list = null;
		if(getUser(name, pwd)){
			if("1000".equals(shebeizhonglei)){
				list = super.findListByIds(ids, TBoilerParamD.class);
			}else if("2000".equals(shebeizhonglei)){
				list = super.findListByIds(ids, TPressureVesselsParamD.class);
			}else if("3000".equals(shebeizhonglei)){
				list = super.findListByIds(ids, TElevatorParamD.class);
			}else if("4000".equals(shebeizhonglei)){
				list = super.findListByIds(ids, TCraneParam_qzjxD.class);
			}else if("5000".equals(shebeizhonglei)){
				list = super.findListByIds(ids, TCraneParam_ccD.class);
			}
			if(list.size() > 0){
				JsonConfig jsonConfig = new JsonConfig();  
		        jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());  
				JSONArray json = JSONArray.fromObject(list,jsonConfig);
				
				return "[{\"msg\":\"成功\",\"list\":"+json.toString()+"}]";
			}
			return "[{\"msg\":\"无数据\"}]";
		}else{
			return "[{\"msg\":\"用户不存在\"}]";
		}
	}
	
	
	
	/**
	 * 保存电梯检测信息方法
	 * @param jsonObj
	 * @return
	 * @throws Throwable
	 */
	public String saveElevator(String jsonObj) {

		JSONObject jObject = JSONObject.fromObject(jsonObj);
		String name = jObject.getString("name");
		String password = jObject.getString("pwd");
		JSONArray json = JSONArray.fromObject(jObject.getString("list"));
		
		String message = "[{\"status\":\"1\",\"msg\":\"OK\"}]";
		String msg = "";
		Long retrunId = 0L;
		String key = getUserKey(name);
		if(key.length() > 0){
			password = AesUtils.decrypt(password, key);
		}else{
			return "[{\"status\":\"0\",\"msg\":\"请先获取AES秘钥\"}]";
		}
		try {
			if(getUser(name, password)){
				
				for(int i=0;i<json.size();i++){
					TJianCeXinXi jc = JsonUtils.json2Bean(json.getJSONObject(i), TJianCeXinXi.class,null,"yyyy-MM-dd");
				
					if(jc.getZhucedaima() == null && jc.getZhucedaima().trim().length() == 0
							&& jc.getDengjibianhao() == null && jc.getDengjibianhao().trim().length() == 0){
						msg = "电梯的注册代码或登记证编号必须保证一项有值";
					}
					
					jc.setRole(name);
					jc.setCreate_time(new Date());
					jc.setState("0");
					retrunId = super.saveReturnId(jc);
				}
			}else{
				return "[{\"status\":\"0\",\"msg\":\"该账号密码不正确\"}]";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message = "[{\"status\":\"0\",\"msg\":\""+msg+"\"}]";
		}
		
		return message;
	}
	
	/**
	 * 获取key
	 * 
	 * @return
	 * @throws UnknownHostException
	 * @throws SocketException
	 */
	public String getKey(String name) throws Exception {
		String token = "";
		StringBuilder uid = new StringBuilder();
		// 产生16位的强随机数
		Random rd = new SecureRandom();
		for (int i = 0; i < 16; i++) {
			// 产生0-2的3位随机数
			int type = rd.nextInt(3);
			switch (type) {
			case 0:
				// 0-9的随机数
				uid.append(rd.nextInt(10));
				break;
			case 1:
				// ASCII在65-90之间为大写,获取大写随机
				uid.append((char) (rd.nextInt(25) + 65));
				break;
			case 2:
				// ASCII在97-122之间为小写，获取小写随机
				uid.append((char) (rd.nextInt(25) + 97));
				break;
			default:
				break;
			}
			token = uid.toString();
		}
		List<HashMap<String, Object>> mapList =  super.findListBySql(" select id from web_user where name= '"+name+"' ");
		if(mapList.size() == 1){
			super.insertBySql("update web_user set role = '"+token+"' where name = '"+name+"' ");
		}else{
			return "[{\"status\":\"1\",\"key\":\"该用户未授权，请检查该用户是否填写正确\"}]";
		}
		
		return "[{\"status\":\"1\",\"key\":\""+token+"\"}]";
	}
	
	
	
	public static void main(String[] args) {
		 String s = AesUtils.encrypt("dtjc_zbs_shandongruntong867", "Qd6r26dm61s63CTr");
		 System.out.println(s);
		 s = AesUtils.decrypt(s, "Qd6r26dm61s63CTr");
		 System.out.println(s);
	}
	
	/**
	 * 查看用户是否存在
	 * @param name
	 * @param pwd
	 * @return
	 */
	public String getUserKey(String name){
		
		String sql = " select role from web_user where name = '"+name+"' ";
		
		List<HashMap<String, Object>> mapList = super.findListBySql(sql);
		
		
		
		return mapList.get(0).get("role").toString();
	}
}
