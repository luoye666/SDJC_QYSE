package com.stone.sys.action;


import java.io.IOException;
import java.util.List;

import net.sf.json.JSONArray;

import com.stone.para.IConstant;
import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TUser;
import com.stone.sys.service.impl.OrganServiceImpl;



public class OrganListAction extends SupportListAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8989278145630856173L;
	private OrganServiceImpl baseService;

	public void setBaseService(OrganServiceImpl baseService) {
		this.baseService = baseService;
	}

	public void getGridList() throws IOException{
		TOrgan organ = (TOrgan)getSession().getAttribute(IConstant.SESSION_TORGAN);
		if("SDJC".equals(organ.getNameEN())){
			JSONArray organs = this.baseService.findAllListToGrid(null);
			super.getResponse().getWriter().print(organs);
		}else{
			JSONArray organs = this.baseService.findAllListToGrid(organ.getParentId());
			super.getResponse().getWriter().print(organs);
		}
		
		
	}
	
	public String getTreeList() throws Exception{
		JSONArray organs = this.baseService.findAllListToTree(null);
		super.addActionData("organs", organs);
		
		return SUCCESS;
	}
	
	//获取机构
	public String getOrganListByCode(){
		String code = super.getParameter("code");
		String hql = "from TOrgan where parentId = (select id from TOrgan where code = '"+code+"') order by sort_num";
		List<TOrgan> list = baseService.findListByHql(hql);
		super.addActionData("datas",list);
		return SUCCESS;
	}
	
	//获取机构(监督检查 使用)
	public String getOrganListByCodeJ(){
		String code = super.getParameter("code");
		String hql = "from TOrgan where parentId = 21 order by sort_num";
		List<TOrgan> list = baseService.findListByHql(hql);
		super.addActionData("datas",list);
		return SUCCESS;
	}
	//根据父机构名称获取子机构
	public String getOrganListByParentName(){
		String name = super.getParameter("name");
		String hql = "from TOrgan where parentId = (select id from TOrgan where name = '"+name+"') order by sort_num";
		List<TOrgan> list = baseService.findListByHql(hql);
		super.addActionData("datas",list);
		return SUCCESS;
	}
}
