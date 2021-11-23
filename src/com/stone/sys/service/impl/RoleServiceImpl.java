package com.stone.sys.service.impl;

import java.util.List;

import com.stone.support.SupportService;
import com.stone.support.utils.ParameterUtils;
import com.stone.sys.pojo.TMenu;
import com.stone.sys.pojo.TRole;
import com.stone.sys.pojo.TRoleDic;
import com.stone.sys.pojo.TRoleMenu;
import com.stone.sys.pojo.TUser;
import com.stone.sys.pojo.TUserRole;

public class RoleServiceImpl extends SupportService {
	
	/**
	 * 根据角色ID查找所属的TMenu菜单项
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TMenu> findMenusByRoleId(Long id){
		String query = "from TMenu menu where menu.id in (select rm.menuId from TRoleMenu rm where rm.roleId = " + id + ") and menu.url !='#'";
		return super.findListByHql(query);
	}
	
	/**
	 * 根据角色ID查找所属的Dic菜单项
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TRoleDic> findDicsByRoleId(Long id){
		String query = "from TRoleDic rm where rm.roleId = " + id;
		return super.findListByHql(query);
	}
	
	/**
	 * 删除指定角色所关联的菜单项
	 * @param id
	 */
	public void deleteAllMenuByRoleId(Long id){
		super.executeUpdateByHql("delete TRoleMenu rm where rm.roleId = " + id);
	}
	
	/**
	 * 更新角色信息
	 * @param role		角色基本信息
	 * @param menuIds	角色所关联的菜单信息
	 */
	@SuppressWarnings("unchecked")
	public void update(TRole role,String menuIds){
		/*更新方法可修改*/
		//更新角色基本信息
		super.update(role);
		
		//更新角色关联的菜单信息
		//删除角色菜单关联数据
		this.deleteAllMenuByRoleId(role.getId());
		//插入新的关联数据
		List<TMenu> menuList = super.findListByIds(menuIds, TMenu.class);
		
		for(TMenu menu : menuList){
			TRoleMenu rm = new TRoleMenu();
			rm.setRoleId(role.getId());
			rm.setMenuId(menu.getId());
			super.save(rm);
		}
	}
	
	/**
	 * 删除角色信息，并删除TUserRole、TRoleMenu信息
	 * @param id
	 */
	public void delete(Long id){
		//删除用户角色关联信息
		super.executeUpdateByHql("delete TUserRole ur where ur.roleId = " + id);
		
		//删除角色菜单关联信息
		super.executeUpdateByHql("delete TRoleMenu rm where rm.roleId = " + id);
		
		//删除角色信息
		super.delete(id,TRole.class.getName());
	}
	
	/**
	 * 根据IDS删除角色，并删除关联的角色菜单
	 * @param ids
	 */
	@SuppressWarnings("unchecked")
	public void deleteByIds(String ids){
		List<TRole> roleList = super.findListByIds(ids, TRole.class);
		for(TRole r : roleList){
			this.delete(r.getId());
		}
	}
	
	/**
	 * 添加角色信息，并添加关联的菜单信息
	 * @param role
	 * @param menuIds
	 */
	@SuppressWarnings("unchecked")
	public void saveRole(TRole role,String menuIds){
		if(role == null) return;
		
		Long roleId = this.saveReturnId(role);
		
		if(roleId != null){
			List<TMenu> menuList = super.findListByIds(menuIds, TMenu.class);
			for(TMenu menu : menuList){
				TRoleMenu rm = new TRoleMenu();
				rm.setRoleId(roleId);
				rm.setMenuId(menu.getId());
				super.save(rm);
			}
		}
	}
	
	/**
	 * 根据用户ID获取其角色列表
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TRole> findListByUserId(Long userId){
		List<TRole> roleList = super.findListByHql(
				"from TRole role " +
				"where role.id in (" +
					"select ur.roleId " +
					"from TUserRole ur " +
						"where ur.userId = " + userId +
					")");
		return roleList;
	}
	
	/**
	 * 根据角色ID查询，相关联的用户
	 * @param roleId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TUser> findUsersByRoleId(Long roleId){
		String query = "from TUser user where user.id in (select ur.userId from TUserRole ur where ur.roleId = " + roleId + " )";
		List<TUser> userList = super.findListByHql(query);
		return userList;
	}
	
	/**
	 * 判断用户是否含有指定的角色
	 * @param userId
	 * @param roleId
	 * @return
	 */
	public boolean hasRoleForUser(Long userId,Long roleId){
		String query = "select count(ur) from TUserRole ur where ur.userId = " + userId + " and ur.roleId = " + roleId;
		long total = super.findTotalByHql(query);
		return total > 0 ? true : false;
	}
	
	/**
	 * 根据传入的角色ID授权给指定的用户群
	 */
	public void authorizeToUsers(Long roleId,String userIds){
		long[] uids = ParameterUtils.convertIDSToLongArray(userIds);
		for(long uid : uids){
			if(!this.hasRoleForUser(uid, roleId)){
				TUserRole ur = new TUserRole();
				ur.setUserId(uid);
				ur.setRoleId(roleId);
				super.save(ur);
			}
		}
	}
	public void unAuthorizeToUsers(Long roleId,String userIds){
		long[] uids = ParameterUtils.convertIDSToLongArray(userIds);
		for(long uid : uids){
			super.executeUpdateByHql("delete TUserRole ur where ur.userId = "+uid+" and ur.roleId = "+roleId);
		}
	}
	
	/**
	 * 给用户赋予指定的权限集合
	 * @param userId
	 * @param roleIds
	 */
	public void anthorizeForUser(Long userId,String roleIds){
		long[] rids = ParameterUtils.convertIDSToLongArray(roleIds);
		for(long rid : rids){
			if(!this.hasRoleForUser(userId, rid)){
				TUserRole ur = new TUserRole();
				ur.setUserId(userId);
				ur.setRoleId(rid);
				super.save(ur);
			}
		}
	}
	public void unAnthorizeForUser(Long userId,String roleIds){
		long[] rids = ParameterUtils.convertIDSToLongArray(roleIds);
		for(long rid : rids){
			super.executeUpdateByHql("delete TUserRole ur where ur.userId = "+userId+" and ur.roleId = "+rid);
		}
	}
	
	
}
