package com.stone.sys.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.stone.para.IConstant;
import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TMenu;
import com.stone.sys.pojo.TRole;
import com.stone.sys.pojo.TRoleDic;
import com.stone.sys.pojo.TUser;
import com.stone.sys.pojo.TUserRole;
import com.stone.sys.service.impl.MenuServiceImpl;


public class MenuListAction extends SupportListAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1058824280532456943L;
	private MenuServiceImpl baseService;
	private String removeData = "";//移除 额定起重量 <=20t 的数据
	private String[] quhuaStr = {"370683","370686","370684","370681"};//需要进行 额定起重量<=20t 的数据
	
	public void setBaseService(MenuServiceImpl baseService) {
		this.baseService = baseService;
	}
	
	public String getList() throws Exception{
		/**
		 * 1.用户拥有的角色IDS已经存放在Session中，拿到该角色IDS
		 * 2.根据这个角色IDS去sys_role_menu表中查询in ROLEIDS的MENUIDS
		 * 3.根据MENUIDS查询MENU集合，返回
		 */
		TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
		String noteId = super.getParameter("id");
		List<TMenu> menus = null;
		if(noteId == null || "".equals(noteId.trim())){
			menus = this.baseService.findMenusByLoggedUser(null);
		}else{
			long parentId = Long.parseLong(noteId);
			menus = this.baseService.findMenusByLoggedUser(parentId);
		} 
		JSONArray menuArray = JSONArray.fromObject(menus);
		Map<String, String> map = new HashMap<String, String>();
		for(int i = 0 ; i < menuArray.size() ; i++){
			JSONObject menu = JSONObject.fromObject(menuArray.get(i));
			long id = Long.parseLong(menu.get("id").toString());
			boolean isParent = this.baseService.isParentById(id);
			menu.put("isParent", isParent);
			String hql = menu.getString("colNum");
			if(hql != null && !"".equals(hql)){
				map.put("hql", hql);
				map.put("loginId", user.getLoginId());
				map.put("username", user.getName());
				map.put("userId", user.getId().toString());
				hql = replaceMenu(map);
				if(hql.indexOf("select") != -1){
					long total = this.baseService.findTotalByHql(hql);
					menu.put("title", menu.get("title")+"("+total+")");
				}else{
					long total = Long.parseLong(hql);
					menu.put("title", menu.get("title")+"("+total+")");
				}
			}
			menuArray.set(i, menu);
		}
		super.addActionData("menus", menuArray);
		
		return SUCCESS;
	}
	
	/**
	 * 替换变量
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String replaceMenu(Map<String, String> map){
		String hql = map.get("hql");
		if(hql.indexOf("user.getLoginId") != -1){
			hql = hql.replaceAll("user.getLoginId", map.get("loginId"));
		}else if(hql.indexOf("user.getName") != -1){
			hql = hql.replaceAll("user.getName", map.get("username"));
		}else if(hql.indexOf("user.quhuadaima") != -1){
			List<TUserRole> roleList = baseService.findListByHql("FROM TUserRole t WHERE t.userId = "+map.get("userId"));//获取该用户的角色  根据角色中的联系人联系电话区分该人是否有分配权限
			if(roleList != null){
				StringBuffer sb = new StringBuffer();
				for(int i=0;i<roleList.size();i++){//对权限进行拼接
					TUserRole role = roleList.get(i);
					sb.append(role.getRoleId()+",");
				}
				List<TRoleDic> TRoleDicList = baseService.findListByHql("SELECT t.dicId FROM TRoleDic t WHERE t.roleId in("+sb.substring(0, sb.length()-1)+") AND length(t.dicId) = 4 GROUP BY t.dicId");
				String andSql = "";
				if(TRoleDicList != null && TRoleDicList.size() > 0){
					andSql += " AND (";//初始            11
					JSONArray array = JSONArray.fromObject(TRoleDicList);
					for(int j=0;j<array.size();j++){//对 3000 4000 5000 一次循环
						
						List<TRoleDic> listRoleDic = baseService.findListByHql("SELECT t.dicId FROM TRoleDic t WHERE t.roleId in("+sb.substring(0, sb.length()-1)+") AND t.dicId not like '"+array.get(j)+"______"+"%' AND length(t.dicId) = 12 AND t.dicId like '"+array.get(j)+"%' ");
						List<TRoleDic> TRoleDicChlidrenList = baseService.findListByHql("SELECT t.dicId as aaa FROM TRoleDic t WHERE t.roleId in("+sb.substring(0, sb.length()-1)+") AND t.dicId like '"+array.get(j)+"%' AND length(t.dicId) >= 10 ");
						if(TRoleDicChlidrenList != null && TRoleDicChlidrenList.size() > 0){
							String andSql1 = "(treport0_.shebeizhongleidaima = '"+array.getString(j)+"' AND treport0_.quhuadaima in(";
							JSONArray arrayRoleDic = JSONArray.fromObject(TRoleDicChlidrenList);
							
							
							Map<String, Object> map1 = new HashMap<String, Object>();
							for(int i=0;i<arrayRoleDic.size();i++){//[3000370634,300037063402,3000370681,300037068101]
								map1.put(arrayRoleDic.getString(i), arrayRoleDic.getString(i));
							}
							if(listRoleDic != null && listRoleDic.size()>0){
								JSONArray arrayRoleDicR = JSONArray.fromObject(listRoleDic);
								for(int i=0;i<arrayRoleDicR.size();i++){
									map1.remove(arrayRoleDicR.getString(i).substring(0, 10));
									map1.remove(arrayRoleDicR.getString(i));
								}
							}
							String quhua = "";
							for(int i=0;i<arrayRoleDic.size();i++){
								if(map1.get(arrayRoleDic.getString(i))== null){
									continue;
								}
								String leibieDic = "";
								if(arrayRoleDic.getString(i).length()>=12){
									leibieDic = arrayRoleDic.getString(i).substring(0, 12);
									quhua += map1.get(leibieDic).toString().substring(4,10)+",";
								}else{
									leibieDic = arrayRoleDic.getString(i).substring(0, 10);
									quhua += map1.get(leibieDic).toString().substring(4,10)+",";
								}
								if("4000".equals(array.get(j).toString())){
									leibieDic = leibieDic.substring(4, 10);
									for(int q=0;q<quhuaStr.length;q++){
										if(quhuaStr[q].equals(leibieDic)){
											removeData += leibieDic + ",";//起重机械中需要判断的 区划
										}
									}
								}
							}
							if(!"".equals(quhua)){
								andSql1 += quhua.substring(0,quhua.length()-1);
							}
							andSql1 += ")) OR ";
							if(!"".equals(quhua)){
								andSql += andSql1;
							}
						}
					}
					if(removeData.lastIndexOf(",") != -1){
						removeData = removeData.substring(0, removeData.length()-1);
					}
//					结尾 清除掉 OR
					if(andSql.lastIndexOf(")) OR") != -1){
						andSql = andSql.substring(0, andSql.lastIndexOf("OR"));////222
					}
					andSql += ")";//结束   11
				}
				hql = hql.replaceAll("user.quhuadaima", andSql);
			}
		}
		
		return hql;
	}
	
	/**
	 * 暂时无用
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String getQuhua(Map<String, String> map) throws Exception{
		
		TUser user = (TUser)ActionContext.getContext().getSession().get(IConstant.SESSION_TUSER);
		String roleName = "";
		String roleLianxiren = "";
		
		String hql = "FROM TUserRole t WHERE t.userId = "+user.getId();
		List<TUserRole> roleList = baseService.findListByHql(hql);//获取该用户的角色  根据角色中的联系人联系电话区分该人是否有分配权限
		if(roleList != null){
			StringBuffer sb = new StringBuffer();
			for(int i=0;i<roleList.size();i++){//对权限进行拼接
				TUserRole role = roleList.get(i);
				sb.append(role.getRoleId()+",");
				
				TRole t = (TRole)baseService.findById(role.getRoleId(), TRole.class.getName());
				roleLianxiren += t.getXingming()+",";
				roleName += t.getNotes()+",";
			}
			//拿着权限主键去数据库中获取区县字典项
			List<TRoleDic> TRoleDicList = baseService.findListByHql("SELECT t.dicId FROM TRoleDic t WHERE t.roleId in("+sb.substring(0, sb.length()-1)+") AND length(t.dicId) = 4 GROUP BY t.dicId");
			if(TRoleDicList != null && TRoleDicList.size() > 0){//拼接SQL语句，对语句进行查询 得出结果
				for(int j=0;j<TRoleDicList.size();j++){
					JSONArray array = JSONArray.fromObject(TRoleDicList);
//					andSql += "  rw.shebeizhongleidaima = '"+array.get(j)+"' ";
					List<TRoleDic> TRoleDicChlidrenList = baseService.findListByHql("SELECT t.dicId FROM TRoleDic t WHERE t.roleId in("+sb.substring(0, sb.length()-1)+") AND t.dicId like '"+array.get(j)+"%' AND length(t.dicId) <> 4 GROUP BY t.dicId");
					if(TRoleDicChlidrenList != null && TRoleDicChlidrenList.size()>0){//如果存在子集
//						andSql += "AND rw.quhuadaima in (";
						for(int o=0;o<TRoleDicChlidrenList.size();o++){
//							JSONArray dicArray = JSONArray.fromObject(TRoleDicChlidrenList);
							
//							andSql += dicArray.get(o).toString().substring(4, dicArray.get(o).toString().length())+",";
						}
//						andSql = andSql.substring(0, andSql.length()-1);
					}
				}
				
			}
		}
		
		return "";
	}
	

	public void getGridList() throws Exception{
		String btns = super.getParameter("btns");
		String btn = super.getParameter("btn");
		boolean hasBtns = "show".equals(btns)?true:false;
		super.getResponse().getWriter().print(this.baseService.findAllListToGrid(null,hasBtns,btn));
	}
	
	public String getTreeList() throws Exception{
		String btns = super.getParameter("btns");
		boolean hasBtns = "show".equals(btns)?true:false;
		super.addActionData("menus", this.baseService.findAllListToTree(null,hasBtns));
		
		return SUCCESS;
	}
	
	public String getRootMenus() throws Exception{
		List<TMenu> menus = this.baseService.findRootMenusByLoggedUser();
		super.addActionData("menus", menus);
		
		return SUCCESS;
	}
	
	public String getButtonsByMenuId() throws Exception{
		Long id = super.getParameterLong("id");
		List<TMenu> btns = this.baseService.findBtnsByMenuId(id);
		super.addActionData(ROWS, btns).addActionData(TOTAL, btns.size());
		
		return SUCCESS;
	}
	

	/**
	 * 获取
	 * @return
	 */
	public String getListMenus(){
		String id = getRequest().getParameter("id");
		TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
		List<TMenu> list = baseService.getListMenus(id, user.getId());
		super.addActionData("menusList", list);
		return SUCCESS;
	}

	//根据最顶端的父ID获取菜单
	public String getMenusByParent(){
		TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
		List<TMenu> list = baseService.getMenusByUserId(user);
		super.addActionData("list",list);
		return SUCCESS;
	}
	//根据父id获取关联的按钮
	public String getButtonByParent(){
		String mid = super.getParameter("mid");
		String qtip = super.getParameter("qtip");
		TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
		List<TMenu> list = baseService.getButtonsByParent(user,mid,qtip);
		super.addActionData("list",list);
		return SUCCESS;
	}

	
}

