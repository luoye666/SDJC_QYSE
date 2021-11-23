package com.stone.sys.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.dao.DataAccessException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.opensymphony.xwork2.ActionContext;
import com.stone.para.IConstant;
import com.stone.support.SupportService;
import com.stone.sys.pojo.TMenu;
import com.stone.sys.pojo.TUser;

public class MenuServiceImpl extends SupportService {
	/**
	 * 传入菜单实体主键，判断该菜单是否是父项
	 * @param id
	 * @return
	 */
	public boolean isParentById(Long id) {
		return this.findChildCountById(id,false) > 0 ? true:false;
	}
	
	/**
	 * 查询所属子菜单项数量
	 * @param id		主键
	 * @param hasBtns	是否含有按钮
	 * @return
	 */
	public int findChildCountById(Long id,boolean hasBtns) {
		String query = "select count(menu.id) from TMenu menu where menu.parentId = " + id;
		if(!hasBtns){
			query += " and menu.btnId is null";
		}
		int count = Integer.parseInt(super.findFirst(query).toString());
		return count;
	}
	
	/**
	 * 查询所属子菜单项
	 * @param id		主键
	 * @param hasBtns	是否含有按钮
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TMenu> findChildsById(Long id,boolean hasBtns){
		String query = "from TMenu menu where menu.parentId = " + id;
		if(!hasBtns){
			query += " and menu.btnId is null";
		}
		query += " order by menu.sortNum";
		return super.findListByHql(query);
	}
	
	/**
	 * 根据父项ID查询子菜单项
	 * @param parentId	父项主键
	 * @param hasBtns	是否含有按钮
	 * @return
	 */
	public List<TMenu> findListByParentId(Long parentId,boolean hasBtns){
		return this.findChildsById(parentId,hasBtns);
	}
	
	/**
	 * 查询父级为空的菜单项
	 * @param hasBtns
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TMenu> findListByNotParent(boolean hasBtns){
		String query = "from TMenu menu where menu.parentId is null";
		if(!hasBtns){
			query += " and menu.btnId is null";
		}
		query += " order by menu.sortNum";
		return super.findListByHql(query);
	}
	
	/**
	 * 查询Grid所需的所有菜单项数据
	 * @param parentId
	 * @return
	 */
	public JSONArray findAllListToGrid(Long parentId,boolean hasBtns,String btn){
		JSONArray menusJSON = new JSONArray();
		List<TMenu> childsMenu = null;
		
		if(parentId != null){
			childsMenu = this.findListByParentId(parentId,hasBtns);
		}else{
			childsMenu = this.findListByNotParent(hasBtns);
		}
		 
		for(TMenu menu : childsMenu){
			if("no".equals(btn)){
				if("ui-btn ui-btn-sp".equals(menu.getStyle_class())){
					continue;
				}
			}
			JSONObject menuJSON = new JSONObject();
			menuJSON.put("id", menu.getId());
			menuJSON.put("name", menu.getTitle());
			menuJSON.put("dizhi", menu.getUrl());
			menuJSON.put("children", this.findAllListToGrid(menu.getId(),hasBtns,btn));
			
			menusJSON.add(menuJSON);
		}
		return menusJSON;
	}
	
	/**
	 * 查询Tree所需的所有菜单项数据
	 * @param parentId
	 * @param hasBtns
	 * @return
	 */
	public JSONArray findAllListToTree(Long parentId,boolean hasBtns){
		JSONArray menusJSON = new JSONArray();
		List<TMenu> childsMenu = null;

		if(parentId != null) {
			childsMenu = this.findListByParentId(parentId, hasBtns);
		}else{
			childsMenu = this.findListByNotParent(hasBtns);
		}
		
		for(TMenu menu : childsMenu){
			JSONObject menuJSON = new JSONObject();
			menuJSON.put("id", menu.getId());
			if(menu.getNotes() != null && !"".equals(menu.getNotes())){
				menuJSON.put("text", menu.getTitle()+"("+menu.getNotes()+")");
			}else{
				menuJSON.put("text", menu.getTitle());
			}
			menuJSON.put("children", this.findAllListToTree(menu.getId(),hasBtns));
			menusJSON.add(menuJSON);
		}
		return menusJSON;
	}
	
	/**
	 * 递归查询菜单树下的所有子菜单
	 * @param organ
	 * @return
	 */
	private List<TMenu> getMenuTreeNodes(TMenu menu){
		List<TMenu> menuList = new ArrayList<TMenu>();
		List<TMenu> childsOrgan = this.findListByParentId(menu.getId(), false);
		menuList.addAll(childsOrgan);
		for(int i = 0 ; i < childsOrgan.size(); i++){
			menuList.addAll(this.getMenuTreeNodes(childsOrgan.get(i)));
		}
		return menuList;
	}
	
	/**
	 * 删除菜单项，并删除（角色菜单表）中的关联信息
	 * @param id
	 */
	public void delete(Long id){
		if(id == null) return ;
		
		//删除角色菜单关联表中的关联数据
		super.executeUpdateByHql("delete TRoleMenu rm where rm.menuId = " + id);
		//删除菜单项所属按钮
		this.deleteBtnsByMenuId(id);
		//删除菜单项数据
		super.delete(id,TMenu.class.getName());
	}
	
	/**
	 * 根据菜单IDS删除菜单项信息
	 * @param ids
	 */
	@SuppressWarnings("unchecked")
	public void deleteByIds(String ids){
		List<TMenu> list = super.findListByIds(ids, TMenu.class);
		for(int i = 0 ; i < list.size(); i++){
			TMenu menu = list.get(i);
			List<TMenu> childs = this.getMenuTreeNodes(menu);
			for(int j = 0 ; j < childs.size() ; j++){
				this.delete(childs.get(j).getId());
			}
			this.delete(menu.getId());
		}
	}
	
	/**
	 * 删除指定菜单项下的按钮信息,并删除角色菜单关联表的信息
	 * @param id
	 */
	public void deleteBtnsByMenuId(Long id){
		//删除角色菜单关联信息
		super.executeUpdateByHql("delete TRoleMenu rm where rm.menuId in (select btn.id from TMenu btn where btn.parentId = " + id + ")");
		//删除按钮信息
		super.executeUpdateByHql("delete TMenu btn where btn.btnId = 1 and btn.parentId = " + id);
	}
	
	/**
	 * 根据按钮ID删除该项信息
	 * @param btnId
	 */
	public void deleteBtnById(Long btnId){
		//删除角色菜单关联信息
		super.executeUpdateByHql("delete TRoleMenu rm where rm.menuId = " + btnId);
		//删除按钮信息
		super.executeUpdateByHql("delete TMenu btn where btn.id = " + btnId);
	}
	
	/**
	 * 根据菜单ID查询所属所有按钮
	 * @param menuId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TMenu> findBtnsByMenuId(Long menuId){
		return super.findListByHql("from TMenu entity where entity.btnId = 1 and entity.parentId = " + menuId + " order by entity.id");
	}
	
	/**
	 * 获取当前登录用户的所有按钮
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TMenu> findBtnsByLoggedUser(){
		TUser user = (TUser)ActionContext.getContext().getSession().get(IConstant.SESSION_TUSER);
		if(user == null) return Collections.EMPTY_LIST;
		
		String query = "from TMenu menu where menu.btnId = 1 and menu.id in (" +
				"select rm.menuId from TRoleMenu rm where rm.roleId in (" +
					"select ur.roleId from TUserRole ur where ur.userId = "+user.getId()+"))";
		return super.findListByHql(query);
	}
	
	

	/**
	 * 判断用户是否有指定code的权限
	 * @param user
	 * @param code
	 * @return
	 */
	public boolean hasAuthority(TUser user,String code){
		/*
		 * 查出当前用户拥有的角色
		 * 根据角色查询出所有关联的菜单
		 * 判断菜单项里是否拥有指定菜单
		 * */
		String query = "select count(m) " +
						"from TMenu m " +
						"where m.btnId = 1 " +
						"and m.btnCode = '" + code + "' " +
						"and m.id in (" +
							"select rm.menuId " +
							"from TRoleMenu rm " +
							"where rm.roleId in (" +
								"select ur.roleId from TUserRole ur where ur.userId = " + user.getId() +
							")" +
						")";
		long total = super.findTotalByHql(query);
		return total > 0 ? true : false;
	}
	
	/**
	 * 获取当前登录用户的菜单
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TMenu> findMenusByLoggedUser(Long parentId){
		TUser user = (TUser)ActionContext.getContext().getSession().get(IConstant.SESSION_TUSER);
		if(user == null) return Collections.EMPTY_LIST;
		
		String query = "from TMenu menu where 1=1 ";
		if(parentId != null){
			query += " and menu.parentId = " + parentId;
		}else{
			query += " and menu.parentId is null";
		}
		query += " and menu.btnId is null and menu.id in (" +
				"select rm.menuId from TRoleMenu rm where rm.roleId in (" +
					"select ur.roleId from TUserRole ur where ur.userId = "+user.getId()+"))";
		query += " order by menu.sortNum";
		
		return super.findListByHql(query);
	}
	
	/**
	 * 获取菜单根节点,此处需要根据当前用户的权限去获取
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TMenu> findRootMenusByLoggedUser(){
		TUser user = (TUser)ActionContext.getContext().getSession().get(IConstant.SESSION_TUSER);
		if(user == null) return Collections.EMPTY_LIST;
		 
		String query = "from TMenu menu " +
				"where menu.btnId is null " +
					"and menu.parentId is null " +
					"and menu.id in (" +
					"select rm.menuId from TRoleMenu rm where rm.roleId in (" +
						"select ur.roleId from TUserRole ur where ur.userId = "+user.getId() +
					"))" +
					" order by menu.sortNum";
		
		return super.findListByHql(query);
	}

	/**
	 * 验证按钮编号是否存在
	 * @param btn
	 * @return
	 */
	public boolean validateButtonCode(TMenu btn){
		if(btn == null || btn.getBtnCode() == null) return false;
		
		String query = "select count(btn) from TMenu btn where btn.btnCode = '" + btn.getBtnCode().trim() + "'";
		
		if(btn.getId() != null){
			query += " and btn.id != "+btn.getId();
		}
		
		long total = super.findTotalByHql(query);
		
		return total == 0 ? true : false;
	}
	
	/**
	 * 保存按钮在指定的菜单下
	 * @param menuId
	 * @param btns
	 */
	public void saveBtnsByMenuId(Long menuId,List<TMenu> btns){
		if(btns == null) return;
		
		for(TMenu btn : btns){
			btn.setParentId(menuId);
			btn.setBtnId(1L);
			super.save(btn);
		}
	}
	
	/**
	 * 更新指定菜单下的按钮
	 * @param menuId
	 * @param btns
	 */
	public void updateBtnsByMenuId(Long menuId,List<TMenu> btns){
		if(btns == null) return ;
		/*该删除实现方法可优化处理*/
		List<TMenu> oldBtns = this.findBtnsByMenuId(menuId);
		for(TMenu oldBtn : oldBtns){
			boolean isExist = false;
			for(TMenu newBtn : btns){
				if(oldBtn.getId().equals(newBtn.getId())){
					isExist = true;
					break;
				}
			}
			if(!isExist){
				this.deleteBtnById(oldBtn.getId());
			}
		}
		
		for(TMenu btn : btns){
			if(btn.getId() != null){
				super.executeUpdateByHql
				("UPDATE TMenu btn set " +
						"btn.title = '" + btn.getTitle() + "'," +
						"btn.btnCode = '" + btn.getBtnCode() + "'," +
						"btn.iconCls = '"+btn.getIconCls()+"'," +
						"btn.notes = '"+btn.getNotes()+"'," +
						"btn.qtip = '"+btn.getQtip()+"' WHERE btn.id = " + btn.getId());
			}else{
				btn.setParentId(menuId);
				btn.setBtnId(1L);
				super.save(btn);
			}
		}
	}
	
	/**
	 * 保存菜单信息和菜单所关联的按钮信息
	 * @param menu
	 * @param btns
	 */
	public void save(TMenu menu,List<TMenu> btns) throws DataAccessException{
		Long id = super.saveReturnId(menu);
		if(id != null){
			this.saveBtnsByMenuId(id, btns);
		}
	}
	
	
	/**
	 * 
	 * 更新菜单信息和菜单所关联的按钮信息,
	 * @param menu
	 * @param btns
	 */
	public void update(TMenu menu,List<TMenu> btns){
		if(menu == null) return;
		//更新菜单信息
		super.update(menu);
		//更新菜单所属按钮
		this.updateBtnsByMenuId(menu.getId(),btns);
	}
	
	/**
	 * 通过User中的待办id获取树结构
	 * @param str
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TMenu> getMenuListByUser(String str){
		if(str != null){
			String hql = "FROM TMenu menu where menu.id in ("+str+")";
			List<TMenu> list = (List<TMenu>)this.findListByHql(hql);
			return list;
		}
		return null;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<TMenu> getListMenus(String parentId,Long uid){
		//通过父类取得当前树下的按钮
		//拿着这些按钮到权限中验证是否具有权限
		//返回具有权限的按钮到页面上
		//
		String hql = "FROM TMenu menu WHERE menu.id in(SELECT t.menuId FROM TRoleMenu t WHERE t.menuId in (SELECT entity.id From TMenu entity WHERE entity.btnId = 1 and entity.parentId = " + parentId + ") AND t.roleId in (SELECT role.roleId FROM TUserRole role WHERE role.userId = '"+uid+"'))";
		return super.findListByHql(hql);
	}
	
	//根据用户id查询所关联的菜单
	public List<TMenu> getMenusByUserId(TUser user){
		List<TMenu> list = null;
		String hql = "from TMenu where id in (select menuId from TRoleMenu where roleId in " +
				"(select roleId from TUserRole where userId = '"+user.getId()+"')) and parentId is not null " +
						" and btnCode = '0' order by sortNum";
		
		return super.findListByHql(hql);
	}
	//根据用户id查询所关联的按钮
	public List<TMenu> getButtonsByParent(TUser user,String mid,String qtip){
		List<TMenu> list = null;
		String hql = null;
		if(qtip != ""){
			hql = "from TMenu where id in (select menuId from TRoleMenu where roleId in " +
			"(select roleId from TUserRole where userId = '"+user.getId()+"')) and parentId is not null " +
					" and btnCode = '1' and qtip = '"+qtip+"' order by sortNum";
		}else{
			hql = "from TMenu where id in (select menuId from TRoleMenu where roleId in " +
			"(select roleId from TUserRole where userId = '"+user.getId()+"')) and parentId is not null " +
					" and btnCode = '1' and parentId = '"+mid+"' and qtip is null order by sortNum";
		}
		
		
		return super.findListByHql(hql);
	}
	
}
