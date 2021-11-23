package com.stone.webservice.bjgl.service;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ibm.icu.text.SimpleDateFormat;
import com.stone.biz.bjgl.pojo.TBjd;
import com.stone.biz.jcsj.pojo.TCablewaysParam;
import com.stone.support.SupportService;
import com.stone.support.utils.CopyUtils;
import com.stone.support.utils.JsonUtils;

public class BjdWebService extends SupportService{
	
	
	/**
	 * 查询报检单方法
	 * @param name
	 * @param pwd
	 * @param shidaima
	 * @return
	 */
	public String findBjd(String name,String pwd,String shidaima){
		
		//验证用户名密码是否存在
		if(getUser(name,pwd)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
//			TBjd bjd = (TBjd) super.findById(Long.parseLong(shidaima), TBjd.class.getName());
			
			String sql = " select id as qyId,jianyanleibie,shebeizhonglei,shebeizhongleidaima,shiyongdanwei,shiyongdanweiDizhi,seZhucedaima as seZhucedaima,seDengjizhengbianhao as dengjizhengbianhao," +
						"se_id as sbid, shiyongdanweiShebeidizhi,shiyongdanweiLianxiren,shiyongdanweiLianxidianhua,quhuamingcheng,quhuadaima,fujian,to_char(tijiaoriqi,'yyyy-mm-dd') tijiaoriqi,jiaofeipingzheng,zhizaodanwei," +
						" shigongdanwei,shigongdanweiDizhi,shigongdanweiLianxiren,shigongdanweiLianxidianhua,mail,shoujiandanwei,shojianren," +
						" shoujiandizhi,shoujiandianhuan,youjiwumingcheng,shuliang,cost,yuejiezhanghao,youjibeizhu,youxiang " +
					" from QY_BJD b where b.bjState = '1' and b.shidaima="+shidaima;
			List<HashMap<String, Object>> bjdList = super.findListBySql(sql);
			
			if(bjdList.size() > 0){
				
				String updSql = " update qy_bjd b set b.bjState='2' where b.bjState = '1' and b.shidaima="+shidaima;
				
				super.insertBySql(updSql);
				
				JSONArray json = JSONArray.fromObject(bjdList);
				
				return "[{\"msg\":\"成功\",\"list\":"+json.toString()+"}]";
			}
			
			return "[{\"msg\":\"无报检数据\"}]";
			
		}else{
			
			return "[{\"msg\":\"用户不存在\"}]";
		}
		
		
	}
	
	
	
	/**
	 * 查询报检设备信息方法
	 * @param name 用户名称必填
	 * @param pwd  用户密码必填
	 * @param zldm 设备种类代码必填
	 * @param seid 设备主键必填
	 * @return
	 */
	public String findBjdSe(String name,String pwd,String zldm,String seid){
		
		//验证用户名密码是否存在
		/*
		 * 公共参数：设备类别、设备品种、设备名称、设备代码、注册代码、登记证号、产品编号、规格型号、下次检验日期
		电梯：层、提升高度、区段长度、
		压力管道：管道编号、管道级别、长度、直径
		压力容器：设备代码、容积、工作温度
		起重机械：额定起重量、跨度、额定起重力矩、提升高度、车位
		场内车：发动机编号、载重量（kg）、底盘编号
		锅炉：蒸发量、

		 */
		if(getUser(name,pwd)){
			String sql = "select s.shebeizhonglei,s.shebeizhongleidaima,s.shebeileibie,s.shebeileibiedaima,s.zhucedaima,s.dengjizhengbianhao, s.shebeididian," +
					"s.quhuadaima,s.quhuamingcheng,s.zcstatus,s.shiyongdanwei,s.shiyongdanwei_dizhi,s.shiyongdanwei_lianxiren,s.shiyongdanwei_lianxidianhua," +
					"s.shiyongdanwei_code,s.shebeipinzhong,s.shenbeipinzhongdaima,s.shebeixinghao,to_char(s.xiacijianyanriqi,'yyyy-mm-dd') xiacijianyanriqi,s.chuchangbianhao," +
					"s.shebeidaima,s.shebeimingcheng, " ;
			
			if("1000".equals(zldm)){
				sql += " b.chukouwendu,b.edingchuli,b.edingwendu,b.edingyali,b.gongzuoyali,b.edingzhengfaliang,b.edinggonglv from biz_boilerparam b,biz_se s where s.id = b.boilerid ";
			}else if("2000".equals(zldm)){
				sql += " pv.jiezhiguancheng,pv.rongqichang,pv.rongqigao,pv.rongqineijing,pv.wendukecheng,pv.yalikecheng,pv.rongqimianji,pv.gongzuowendu from biz_pressure_vessels_param pv ,biz_se s where s.id = pv.pressurevesselsid ";
			}else if("3000".equals(zldm)){
				sql += " e.ceng,e.edingsudu,e.dingshengxingshi,e.edingsudu_shangxing,e.edingsudu_xiaxing,e.tishenggaodu,e.quduanchangdu from biz_elevatorparam e,biz_se s where s.id = e.elevatorid ";
			}else if("4000".equals(zldm) || "5000".equals(zldm)){
				sql += " c.edingqizhongliang,c.tishenggaodu,c.youxiaobanjing,c.kuadu,c.edingqizhongliju,c.fadongjibianhao,c.dipanbianhao from biz_craneparam c ,biz_se s where s.id = c.craneid ";
			}else if("6000".equals(zldm)){
				sql += " r.xiansudu,r.ylss_gaodu,r.edingchengkerenshu,r.edingzaihe,r.sudu from biz_recreation_param r ,biz_se s where s.id = r.recreationid";
			}else if("8000".equals(zldm)){
				sql += " pp.gongchengzhijing,pp.gongchengbihou,pp.guandaochangdu,pp.shejiyali,pp.shejiwendu,pp.shusongjiezhi,pp.gongzuoyali,pp.zhongyaoguandao,pp.guandaojibie from biz_pressure_piping_param pp ,biz_se s where s.id = pp.pressurepipingid";
			}else if("9000".equals(zldm)){
				sql += " cab.yunxingsudu,cab.changdu,cab.yunzainengli,cab.yunzaicheliangxingshi from biz_cableways_param cab ,biz_se s where s.id = cab.cablewaysid";
			}
//			sql += " and s.tmpData='0' and s.eqhide='0' and s.zfstate='0' and s.chongfu='0' and ( s.zcstatus = '0' or s.zcstatus = '1' ) and s.zhucedaima ='"+zhucedaima+"' ";
			sql += " and s.id="+seid;
			
			List<HashMap<String, Object>> seList = super.findListBySql(sql);
			
			if(seList.size() > 0){
				
//				String updSql = " update qy_bjd b set b.bjState='2' where b.bjState = '1' and b.shidaima="+shidaima;
//				
//				super.insertBySql(updSql);
				
				JSONArray json = JSONArray.fromObject(seList.get(0));
				
				return "[{\"msg\":\"成功\",\"list\":"+json.toString()+"}]";
			}
			
			return "[{\"msg\":\"无数据\"}]";
			
		}else{
			
			return "[{\"msg\":\"用户不存在\"}]";
		}
		
		
	}
	
	
	/**
	 * 修改报检单方法
	 * @param name
	 * @param pwd
	 * @param qyBjJosn 报检单字符
	 * @return 
	 */
	public String updBjd(String name,String pwd,String qyBjJosn){
		
		if(getUser(name,pwd)){
			 JSONArray json = JSONArray.fromObject(qyBjJosn);
			 json = JSONArray.fromObject(json);
			 //将字符串转为Bean
			 TBjd qyBjd = getEntity(json.getJSONObject(0).toString(), TBjd.class );
			 //查询报检单
			 TBjd bjd = (TBjd) super.findById(qyBjd.getId(), TBjd.class.getName());
			 qyBjd.setRole(bjd.getRole());
			 qyBjd.setSe_id(bjd.getSe_id());
			 qyBjd.setShi(bjd.getShi());
			 qyBjd.setShidaima(bjd.getShidaima());
			 qyBjd.setFujian(bjd.getFujian());
			 qyBjd.setTijiaoriqi(bjd.getTijiaoriqi());
			 qyBjd.setSeDengjizhengbianhao(bjd.getSeDengjizhengbianhao());
			 qyBjd.setJiaofeipingzheng(bjd.getJiaofeipingzheng());
			 qyBjd.setQuhuadaima(bjd.getQuhuadaima());
			 qyBjd.setQuhuamingcheng(bjd.getQuhuamingcheng());
			 qyBjd.setJianyanleibie(bjd.getJianyanleibie());
			 qyBjd.setShebeizhonglei(bjd.getShebeizhonglei());
			 qyBjd.setShebeizhongleidaima(bjd.getShebeizhongleidaima());
			 
			 try {
				CopyUtils.Copy(qyBjd, bjd);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 super.update(bjd);
			
			 //验证是否不予受理，不予受理需要重新报检
			 if("7".equals(bjd.getBjState())){
				 super.insertBySql("update BIZ_APPRIZES set state = '0' where annalid in ("+bjd.getSe_id()+")");
			 }
			 
//			 super.update(qyBjd);
		}
		
		
		return "";
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
	 * jackson 将json转java类方法
	 * @param <T>
	 * @param jsonString
	 * @param prototype
	 * @return
	 */
	public static <T> T getEntity(String jsonString, Class<T> prototype) {
	    ObjectMapper objectMapper = new ObjectMapper();
	    try {
	    	return (T) objectMapper.readValue(jsonString, prototype);
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
	    return null;
	  }
	
	
	/**
	 * 查询报检开工告知设备信息方法
	 * @param name 用户名称必填
	 * @param pwd  用户密码必填
	 * @param zldm 设备种类代码必填
	 * @param seid 设备主键必填
	 * @return
	 */
	public String findBjdKggz(String name,String pwd,String seid){
		
		if(getUser(name,pwd)){
			String sql = "select t.seid,t.bjid,t.shebeileibie,t.shebeipinzhong,t.shebeimingcheng,t.zhizaobianhao,t.zhucedaima,t.dengjibianhao, " +
						 "t.fujian,t.edingchuli,t.ceng,t.tishenggaodu,t.quduanchangdu,t.gonggongjiaotong,t.xiansuqi,t.edingqizhongliang,t.kuadu, " +
						 "t.eliehuanjing,t.sijishi,t.fugan,t.paizhaobianhao,t.yunxingsudu,t.chewei,t.shebeileibiedaima,t.shebeipinzhongdaima,t.xinghao from qy_bjdparam t where t.bjId = "+seid ;
			
			List<HashMap<String, Object>> seList = super.findListBySql(sql);
			
			if(seList.size() > 0){
				
//				String updSql = " update qy_bjd b set b.bjState='2' where b.bjState = '1' and b.shidaima="+shidaima;
//				
//				super.insertBySql(updSql);
				
				JSONArray json = JSONArray.fromObject(seList);
				
				return "[{\"msg\":\"成功\",\"list\":"+json.toString()+"}]";
			}
			
			return "[{\"msg\":\"无数据\"}]";
			
		}else{
			
			return "[{\"msg\":\"用户不存在\"}]";
		}
		
		
	}

}
