package com.stone.sys.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Session;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.microsoft.schemas.office.x2006.encryption.CTKeyEncryptor.Uri;
import com.stone.para.IConstant;
import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TJCUser;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TUser;
import com.stone.sys.pojo.TUserRole;
import com.stone.sys.service.impl.UserServiceImpl;

public class UserListAction extends SupportListAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9150607020124435432L;
	private UserServiceImpl userService;
	public void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}

	public String getAll() throws Exception{
		//获取查询参数,qp = QueryParameter
		String qpLoginId = super.getParameter("loginId");
		String qpName = super.getParameter("name");
//		String qpState = super.getParameter("state");
//		String qpIsAdmin = super.getParameter("isAdmin");
//		String qpTel = super.getParameter("tel");
//		String qpMobile = super.getParameter("mobile");
//		String qpEmail = super.getParameter("email");
		String qpOrganId = super.getParameter("organId");
		String organCode = super.getParameter("organCode");
		String roleId = super.getParameter("roleId");
		
		TOrgan organ = (TOrgan)getSession().getAttribute(IConstant.SESSION_TORGAN);
		String query = "";
		if("SDJC".equals(organ.getNameEN())){
			query = "from TUser entity where 1=1 ";
		}else{
			if(super.checkParam(qpOrganId) || super.checkParam(qpLoginId) || super.checkParam(qpName)){
				query = "from TUser entity where 1=1 ";
			}else{
				query = "from TUser entity where 1=1 and entity.organId ="+organ.getId();
			}
		}
		String conditions = "";
		String order = " order by entity.id desc";
		
		//查询条件
		//登录ID
		if(super.checkParam(qpLoginId)){
			conditions += " and entity.loginId like '%" + qpLoginId + "%'";
		}
		//用户名
		if(super.checkParam(qpName)) {
			conditions += " and entity.name like '%" + qpName+ "%'";
		}
		//机构
		if(super.checkParam(qpOrganId)){
			conditions += " and entity.organId = '" + qpOrganId+"'";
		}
		//机构代码
		if(super.checkParam(organCode)){
			String organids = userService.findOrganIdsByOrganCode(organCode);
			conditions += " and entity.organId in (" + organids+")";
		}
		//角色ID
		if(super.checkParam(roleId)){
			conditions += " and entity.id in (select userId from TUserRole where roleId = '"+roleId+"')";
		}
		
		//合并HQL语句
		query += conditions + order;
		
		List ses = userService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long records = userService.findTotalByHql("select count(user) " + query);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, ses);
		
		return SUCCESS;
	}
	
	/**
	 * 弹出选择的checkbox tree
	 * 
	 */
	@SuppressWarnings("unchecked")
	public String getListTree() throws Exception {

		List<HashMap<String,String>> list = null;
		
		List<HashMap<String,String>> listOrgan = new ArrayList<HashMap<String, String>>();

//		listOrgan = this.userService.getListByDHql(" 'A' || o.id as id, o.name as text,'closed' as  state", 
//																				"",
//																				null, 
//																				" order by o.code", 
//																				"TOrgan o");

		list = this.userService.getListByDHql("u.loginId as id, u.name as text, 'A' || u.organId as parentId, u.loginId || '***' as qtip", 
																				"",
																				null, 
																				" order by u.sortNum", 
																				"TUser u");
		
		listOrgan.addAll(list);
		JSONArray menuArray = JSONArray.fromObject(listOrgan);
		System.out.println("listOrgan size"+listOrgan.size());
		for(int i=0;i<listOrgan.size();i++){
			System.out.println("listOrgan 0"+listOrgan.get(i).toString());
		}
		super.addActionData("menus", menuArray);
		return SUCCESS;
	}
	
	/**
	 * 组织下的用户
	 * @return
	 */
	public String getListTreeUser(){

		String btns = super.getParameter("btns");
		boolean hasBtns = "show".equals(btns)?true:false;
		super.addActionData("menus",userService.findAllListToTree(null,hasBtns));

		return SUCCESS;
	}
	
	/**
	 * 获取科室下的用户
	 * @return
	 */
	public String getListTreeByUser(){
		String id = super.getParameter("id");
		JSONArray organsJSON= new JSONArray();
		id = id.substring(0, id.length()-1);
		List<TUser> list = userService.findChildsById(id);
		for(TUser user : list){
			JSONObject organJSON = new JSONObject();
			organJSON.put("id", user.getId());
			organJSON.put("text", user.getName());
			organsJSON.add(organJSON);
		}
		
		super.addActionData("dicUsers",organsJSON);
		return SUCCESS;
	}
	
	/**
	 * 获取分组下的用户
	 * @return
	 */
	public String getListTreeFenzuUser(){
		String id = super.getParameter("id");
		JSONArray organsJSON= new JSONArray();
		id = id.substring(0, id.length()-1);
		List<TUser> list = userService.findChildsByIdFenzu(id);
		for(TUser user : list){
			JSONObject organJSON = new JSONObject();
			organJSON.put("id", user.getId());
			organJSON.put("text", user.getName());
			organsJSON.add(organJSON);
		}
		
		super.addActionData("dicUsers",organsJSON);
		return SUCCESS;
	}
	
	
	/**
	 * 分组人员
	 * @param fenzuId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findListUser(String fenzuId){
		StringBuffer sb = new StringBuffer();
		List<TUser> userList = userService.findListByHql("FROM TUser t WHERE t.fenzuId like '%"+fenzuId+"%'");//字典的主键
		if(userList != null && userList.size()>0){
			for (TUser tUser : userList) {
				sb.append(tUser.getName()+",");
			}
		}else{
			sb.append(",");
		}
		return sb.substring(0, sb.length()-1);
	}
	public String getJcUserByOgCode() throws UnsupportedEncodingException{
		TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
		String xianmc = super.getParameter("xianmc");
		xianmc = URLDecoder.decode(xianmc,"utf-8");
		List ses = new ArrayList();
		String organHql = "from TOrgan where code = '"+user.getXiandaima()+"' order by length(nameEN)";
		List<TOrgan> organList = userService.findListByHql(organHql);
		if(organList.size()>0){
			String hql = "from TJCUser user where user.organId = '"+organList.get(0).getId()+"'";
			ses = userService.findPageListByHql(hql, super.getPagination(), super.getRowNumber());
			long records = userService.findTotalByHql("select count(user) " + hql);
			long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
			super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, ses);
		}
		return SUCCESS;
	}
	
	/**
	 * session防止失效
	 */
	public String userOnLineNums(){
		super.addActionData("maxtime", getSession().getLastAccessedTime());
		return SUCCESS;
	}
	
}
