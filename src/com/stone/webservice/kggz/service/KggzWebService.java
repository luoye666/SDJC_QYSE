package com.stone.webservice.kggz.service;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.stone.support.SupportService;

public class KggzWebService extends SupportService{
	
	public String findKggzList(String name,String pwd,String shidaima,String map){
		
		if(getUser(name,pwd)){
			
//			JSONArray json = JSONArray.fromObject(map);
//			
//			String tiaoshu = json.getJSONObject(0).get("tiaoshu").toString();
//			String yema = json.getJSONObject(0).get("yema").toString();
//			String shiyongdanwei = json.getJSONObject(0).get("shiyongdanwei").toString();
//			String zhucedaima = json.getJSONObject(0).get("zhucedaima").toString();
//			String chuchangbianhao = json.getJSONObject(0).get("chuchangbianhao").toString();
//			String zhizaodanwei = json.getJSONObject(0).get("zhizaodanwei").toString();
//			String shebeizhonglei = json.getJSONObject(0).get("shebeizhonglei").toString();
//			String quhuamingcheng = json.getJSONObject(0).get("quhuamingcheng").toString();
//			String gaozhibianhao = json.getJSONObject(0).get("gaozhidanbianhao").toString();
//			String gzrq_start = json.getJSONObject(0).get("gaozhiriqi").toString();
//			String id =  json.getJSONObject(0).get("id").toString();
//			String sql = " select id,shiyongdanwei,zhucedaima,to_char(xiacijianyanriqi,'yyyy-MM-dd') xiacijianyanriqi,zcstatus," +
//					" quhuamingcheng,shebeixinghao,shebeididian,shebeizhonglei,shebeizhongleidaima,shebeimingcheng " +
//					" from biz_se base where base.shidaima = '"+shidaima+"' "; 
			
			
			
			
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
			String shigongdanwei = "";
			String id = "";
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
			if(json.containsKey("shigongdanwei")){
				shigongdanwei = json.get("shigongdanwei").toString();
			}
			if(json.containsKey("id")){
				id = json.get("id").toString();
			}
			if(json.containsKey("gaozhiriqi")){
				gzrq_start = json.get("gaozhiriqi").toString();
			}
			String sql = " select t.annalid,t.shigongdanwei,t.gaozhidanbianhao,t.shebeimingcheng,t.xinghao,t.shebeidaima,t.zhizaobianhao," +
					" t.zhizaodanwei,t.zhizaoxukezhengbianhao,t.shebeididian,t.anzhuangriqi,t.shigongdanweiquancheng,t.shigongleibie," +
					" t.shigongxukezhengbianhao,t.shigongxukezhengyouxiaoqi,t.shigongdanwei_lianxiren,t.shigongdanwei_lianxidianhua," +
					" t.shigongdanwei_chuanzhen,t.shigongdanwei_dizhi,t.shigongdanwei_youbian,t.shiyongdanwei,t.shiyongdanwei_lianxiren," +
					" t.shiyongdanwei_lianxidianhua,t.shiyongdanwei_dizhi,t.shiyongdanwei_youbian,t.shebeizhonglei,t.shebeizhongleidaima," +
					" t.shebeileibie,t.shebeileibiedaima,t.shebeipinzhong,t.shebeipinzhongdaima,to_char(t.baojianriqi,'yyyy-MM-dd') baojianriqi," +
					" to_char(t.jianyanjieshuriqi,'yyyy-MM-dd') jianyanjieshuriqi,to_char(t.jianyankaishiriqi,'yyyy-MM-dd') jianyankaishiriqi,to_char(t.dengjiriqi,'yyyy-MM-dd') dengjiriqi," +
					" t.baogaobianhao,t.beizhu,t.zhucedaima,t.dengjizhengbianhao,to_char(t.xiacijianyanriqi,'yyyy-MM-dd') xiacijianyanriqi,t.jianyanjielun,t.gaozhi_jingbanren," +
					" to_char(t.gaozhi_jingbanriqi,'yyyy-MM-dd') gaozhijingbanriqi,t.jybgzj,t.dengji_jingbanren,to_char(t.dengji_jingbanriqi,'yyyy-MM-dd') dengjijingbanriqi,t.state,t.quhuamingcheng,t.quhuadaima,to_char(t.zhuceriqi,'yyyy-MM-dd') zhuderiqi," +
					" t.neibubianhao from biz_apprizes t where t.shstate = '0' and t.zfstate = '0' and t.shidaima = '"+shidaima+"'";
			String append = "";
			String order = " order by t.annalid desc";
			
			
			if(shiyongdanwei.length() > 0 && !"null".equals(shiyongdanwei)){
				append += " and t.shiyongdanwei like '%"+shiyongdanwei+"%'";
			}
			
			if(zhucedaima.length() > 0 && !"null".equals(zhucedaima)){
				append += " and t.zhucedaima like '%"+zhucedaima+"%'";
			}
			
			if(chuchangbianhao.length() > 0 && !"null".equals(chuchangbianhao)){
				append += " and t.zhizaobianhao like '%"+chuchangbianhao+"%'";
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
			if(gaozhibianhao.length() > 0 && !"null".equals(gaozhibianhao)){
				append += " and t.gaozhidanbianhao like '%"+gaozhibianhao+"%'";
			}
			if(gzrq_start.length() > 0 && !"null".equals(gzrq_start)){
				append += " and to_char( t.gaozhi_jingbanriqi,'yyyy-mm-dd') = '"+gzrq_start+"'";
			}
			if(shigongdanwei.length() > 0 && !"null".equals(shigongdanwei)){ 
				append += " and t.shigongdanwei like '%"+shigongdanwei+"%'";
			}
			
			if(id.length() > 0 && !"null".equals(id)){
				append += " and t.annalid = '"+id+"'";
			}
			
			sql += append+order;
			
			int startPage = (Integer.parseInt(yema)-1)*Integer.parseInt(tiaoshu);
			int endPage = Integer.parseInt(tiaoshu)*Integer.parseInt(yema);
			
			String fySql = " select * from ( select A.*,ROWNUM RN  from ("+sql+" ) A where rownum <= '"+endPage+"'   ) WHERE RN >'"+startPage+"'  ";
			
			List<HashMap<String, Object>> seList = super.findListBySql(fySql);
			
			
			long total = 1;
			if(id.length() > 0 && !"null".equals(id)){
			}else{
				total = super.findTotalByHql("select count(t) from TApprizes t where t.shidaima = '"+shidaima+"' "+append);
			}
			if(seList.size() > 0){
//				json = JSONArray.fromObject(seList);
				JSONArray jsonA = JSONArray.fromObject(seList);
				
				return "[{\"msg\":\"成功\",\"total\":"+total+",\"list\":"+jsonA.toString()+"}]";
			}
			
			return "[{\"msg\":\"无数据\"}]";
			
		}else{
			return "[{\"msg\":\"用户不存在\"}]";
		}
	}
	
	
	/**
	 * 根据主键查询单个告知
	 * @param name
	 * @param pwd
	 * @param id
	 * @return
	 */
	public String findKggz(String name,String pwd,String id){
		
		if(getUser(name,pwd)){
			
			String sql = " select shigongdanweiquancheng,shigongdanwei_lianxiren,shigongdanwei_lianxidianhua,shiyongdanwei,shiyongdanwei_lianxiren,shiyongdanwei_lianxidianhua,shiyongdanwei_dizhi,zhizaodanwei,gaozhidanbianhao from biz_apprizes where annalid = "+id;
			
			List<HashMap<String,Object>> gzList = super.findListBySql(sql);
			
			if(gzList.size() > 0){
				JSONArray jsonA = JSONArray.fromObject(gzList.get(0));
				return "[{\"msg\":\"成功\",\"list\":"+jsonA.toString()+"}]";
			}else{
				return "[{\"msg\":\"失败，无数据\"}]";
			}
			
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
}
