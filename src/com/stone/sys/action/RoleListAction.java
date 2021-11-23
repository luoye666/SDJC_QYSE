package com.stone.sys.action;

import java.util.List;

import com.stone.support.SupportListAction;
import com.stone.sys.service.impl.RoleServiceImpl;


public class RoleListAction extends SupportListAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4658369826241202893L;
	private RoleServiceImpl roleService;
	
	public void setRoleService(RoleServiceImpl roleService) {
		this.roleService = roleService;
	}

	@SuppressWarnings("unchecked")
	public String getAll() throws Exception{
		String query = "from TRole role order by role.id desc";
		List roles = this.roleService.findListByHql(query);
		long total = this.roleService.findTotalByHql("select count(role) "+query);
		super.addActionData(ROWS, roles).addActionData(TOTAL, total);
		
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getList() throws Exception{
		String qpName = super.getParameter("name");
		String qpNameEN = super.getParameter("nameEN");
		
		String query = "from TRole role where 1=1";
		String conditions = "";
		String order = " order by role.id desc";
		
		if(super.checkParam(qpName)){
			conditions += " and role.name like '%" + qpName + "%'";
		}
		if(super.checkParam(qpNameEN)){
			conditions += " and role.nameEN like '%" + qpNameEN + "%'";
		}
		
		query += conditions + order;
		
		List ses = roleService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long records = roleService.findTotalByHql("select count(role) " + query);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, ses);
		
		return SUCCESS;
	}
}
