package com.stone.sys.action;

import java.util.List;

import com.stone.support.SupportAction;
import com.stone.sys.pojo.TMenu;
import com.stone.sys.pojo.TRole;
import com.stone.sys.pojo.TRoleDic;
import com.stone.sys.service.impl.RoleServiceImpl;


public class RoleAction extends SupportAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2181487820357183759L;
	private TRole role;
	private RoleServiceImpl baseService;
	
	public void setBaseService(RoleServiceImpl baseService) {
		this.baseService = baseService;
	}
	public TRole getRole() {
		return role;
	}
	public void setRole(TRole role) {
		this.role = role;
	}

	public String add() throws Exception{
		String menuIds = super.getParameter("menuIds");
		this.baseService.saveRole(this.role,menuIds);
		return SUCCESS;
	}
	
	public String edit() throws Exception{
		String menuIds = super.getParameter("menuIds");
		this.baseService.update(this.role, menuIds);
		return SUCCESS;
	}
	
	public String delete() throws Exception{
		String ids = super.getParameter("ids");
		this.baseService.deleteByIds(ids);
		
		return SUCCESS;
	}
	
	public String openRoleInfo() throws Exception{
		Long id = super.getParameterLong("id");
		role = (TRole)this.baseService.findById(id, TRole.class.getName());
		return "OPEN_ROLE_SUCCESS";
	}
	
	public String getMenusByRoleId() throws Exception{
		Long roleId = super.getParameterLong("roleId");
		List<TMenu> menus = this.baseService.findMenusByRoleId(roleId);
		addActionData("menus", menus);
		
		return SUCCESS;
	}
	
	public String getDicsByRoleId() throws Exception{
		Long roleId = super.getParameterLong("roleId");
		List<TRoleDic> dic = this.baseService.findDicsByRoleId(roleId);
		addActionData("dics", dic);
		return SUCCESS;
	}
	
	public String hasRoleForUser() throws Exception{
		Long userId = super.getParameterLong("userId");
		Long roleId = super.getParameterLong("roleId");
		if(this.baseService.hasRoleForUser(userId, roleId)){
			addActionData("hasRole", true);
		}else{
			addActionData("hasRole", false);
		}
		
		return SUCCESS;
	}
	
	public String authorizeToUsers() throws Exception{
		Long roleId = super.getParameterLong("roleId");
		String userIds = super.getParameter("userIds");
		String accessType = super.getParameter("accessType");
		
		if("give".equals(accessType)){
			this.baseService.authorizeToUsers(roleId, userIds);
		}else if("back".equals(accessType)){
			this.baseService.unAuthorizeToUsers(roleId, userIds);
		}
		
		return SUCCESS;
	}
	
	public String authorizeForUser() throws Exception{
		Long userId = super.getParameterLong("userId");
		String roleIds = super.getParameter("roleIds");
		String accessType = super.getParameter("accessType");
		
		if("give".equals(accessType)){
			this.baseService.anthorizeForUser(userId, roleIds);
		}else if("back".equals(accessType)){
			this.baseService.unAnthorizeForUser(userId, roleIds);
		}
		
		return SUCCESS;
	}
}
