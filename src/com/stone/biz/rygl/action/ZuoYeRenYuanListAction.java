package com.stone.biz.rygl.action;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

import com.stone.biz.rygl.pojo.TZuoYeRenYuan;
import com.stone.biz.rygl.service.ZuoYeRenYuanService;
import com.stone.para.IConstant;
import com.stone.support.SupportListAction;
import com.stone.support.utils.JsonUtils;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TUser;
import com.sun.org.apache.xml.internal.serializer.ToUnknownStream;

import frm.ssh.exception.AppException;

public class ZuoYeRenYuanListAction extends SupportListAction {

	private ZuoYeRenYuanService zuoyeService;

	public void setZuoyeService(ZuoYeRenYuanService zuoyeService) {
		this.zuoyeService = zuoyeService;
	}
	//获取人员许可证
	public String getList() throws Exception{
		String shenfenzhenghao = super.getParameter("shenfenzhenghao");
		String xingming = super.getParameter("xingming");
		String xingbie = super.getParameter("xingbie");
		String shidaima = super.getParameter("shidaima");
		String quxiandaima = super.getParameter("quxiandaima");
		String xiangzhendaima = super.getParameter("xiangzhendaima");
		String zhengshubianhao = super.getParameter("zhengshubianhao");
		String zuoyezhonglei = super.getParameter("zuoyezhonglei");
		String suozaidanwei = super.getParameter("suozaidanwei");
		String fazhengriqi_ks = super.getParameter("fazhengriqi_ks");
		String fazhengriqi_js = super.getParameter("fazhengriqi_js");
		String youxiaoqi_ks = super.getParameter("youxiaoqi_ks");
		String youxiaoqi_js = super.getParameter("youxiaoqi_js");
		
		String fazhengjiguan = super.getParameter("fazhengjiguan"); //发证机关
		String sydwid = super.getParameter("sydwid");

		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		
		String query = "from TZuoYeRenYuan entity where 1=1 ";
		String conditions = "";
		String order = " order by entity.id desc";
		
	/*	//查询条件
		if(organ.getCode().length() == 4){//市级用户
			conditions += " and entity.shidaima = '" + organ.getCode() + "'";
		}else if(organ.getCode().length() == 6){//县级用户
			conditions += " and entity.quxiandaima = '" + organ.getCode() + "'";
		}else if(organ.getCode().length() == 9){//乡镇街道级用户
			conditions += " and entity.xiangzhendaima = '" + organ.getCode() + "'";
		}*/
		if(super.checkParam(sydwid)){
			conditions += " and entity.sydw_id = '"+sydwid+"'";
		}else{
			if(super.checkParam(user.getShiyongdanwei_id())){
				String sydwIdCd = "";
				for(String sid : user.getShiyongdanwei_id().replace(" ", "").split(",")){
					if("".equals(sydwIdCd)){
						sydwIdCd += " entity.sydw_id = '"+sid+"'";
					}else{
						sydwIdCd += " or entity.sydw_id = '"+sid+"'";
					}
				}
				conditions += " and ("+sydwIdCd+") ";
			}else{
				conditions += " and entity.sydw_id = '0'";
			}
		}
		
		if(super.checkParam(xingming)){
			conditions += " and entity.xingming like '%"+xingming+"%'";
		}
		if(super.checkParam(xingbie)){
			conditions += " and entity.sex = '"+xingbie+"'";
		}
		if(super.checkParam(shidaima)){
			conditions += " and entity.shidaima = '"+shidaima+"'";
		}
		if(super.checkParam(quxiandaima)){
			conditions += " and entity.quxiandaima = '"+quxiandaima+"'";
		}
		if(super.checkParam(xiangzhendaima)){
			conditions += " and entity.xiangzhendaima = '"+xiangzhendaima+"'";
		}
		if(super.checkParam(shenfenzhenghao)){
			conditions += " and entity.shenfenzhenghao like '%"+shenfenzhenghao+"%'";
		}
		if(super.checkParam(zhengshubianhao)){
			conditions += " and entity.zhengshubianhao like '%"+zhengshubianhao+"%'";
		}
		if(super.checkParam(zuoyezhonglei)){
			conditions += " and entity.zuoyezhonglei = '"+zuoyezhonglei+"'";
		}
		if(super.checkParam(suozaidanwei)){
			conditions += " and entity.suozaidanwei like '%"+suozaidanwei+"%'";
		}
		if(super.checkParam(fazhengriqi_ks)){
			conditions += " and TO_CHAR(entity.fazhengriqi,'yyyy-MM-dd') >= '" + fazhengriqi_ks + "'";
		}
		if(super.checkParam(fazhengriqi_js)){
			conditions += " and TO_CHAR(entity.fazhengriqi,'yyyy-MM-dd') <= '" + fazhengriqi_js + "'";
		}
		if(super.checkParam(youxiaoqi_ks)){
			conditions += " and TO_CHAR(entity.zhengshuyouxiaoqi_end,'yyyy-MM-dd') >= '" + youxiaoqi_ks + "'";
		}
		if(super.checkParam(youxiaoqi_js)){
			conditions += " and TO_CHAR(entity.zhengshuyouxiaoqi_end,'yyyy-MM-dd') <= '" + youxiaoqi_js + "'";
		}
		if(super.checkParam(fazhengjiguan)){
			conditions += " and entity.fazhengjiguan like '%"+fazhengjiguan+"%'";
		}
		//合并HQL语句
		query += conditions + order;
		
		List ses = zuoyeService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long records = zuoyeService.findTotalByHql("select count(entity) " + query);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, ses);
		
		return SUCCESS;
	}
	
	
	/**
	 * 根据自己上级，获取同级所有信息
	 * @return
	 */
	public String getDataListByParent(){
		String name = super.getParameter("name");
		
		String query = "from TDicData s where s.parentId = ( select id from TDicData where name='"+name+"' )";
		query +=  " order by s.code";
		List<TDicData> datalist = zuoyeService.findListByHql(query);
		if(datalist.size()>0){
			super.addActionData("dicDatas", datalist);
		}
		return SUCCESS;
	}
}
