package com.stone.sys.service.impl;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.stone.support.SupportService;
import com.stone.sys.pojo.TOrgan;

public class OrganServiceImpl extends SupportService {
	
	@SuppressWarnings("unchecked")
	public List<TOrgan> findListByParentId(Long parentId){
		return super.findListByHql("from TOrgan entity where entity.parentId = " + parentId + " order by entity.sort_num");
	}
	
	@SuppressWarnings("unchecked")
	public List<TOrgan> findListByNotParent(){
		return super.findListByHql("from TOrgan entity where entity.parentId is null order by entity.sort_num");
	}
	
	public boolean hasChildById(Long id){
		int count = Integer.parseInt(super.findSingletonByHql("select count(entity) from TOrgan entity where entity.parentId = " + id).toString());
		
		if(count > 0){
			return true;
		}
		return false;
	}
	
	/**
	 * 递归查询树节点下的所有子节点
	 * @param organ
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TOrgan> getTreeNodes(TOrgan organ){
		List<TOrgan> organList = new ArrayList<TOrgan>();
		List<TOrgan> childsOrgan = super.findListByHql("from TOrgan entity where entity.parentId = " + organ.getId() + "order by entity.sort_num");
		organList.addAll(childsOrgan);
		
		for(int i = 0 ; i < childsOrgan.size(); i++){
			organList.addAll(this.getTreeNodes(childsOrgan.get(i)));
		}
		
		return organList;
	}
	
	/**
	 * 删除机构信息，并清空用户表中跟该机构相关的数据
	 * @param id
	 */
	public void delete(Long id){
		super.delete(id, TOrgan.class.getName());
		super.updateByHql("update TUser user set user.organId = null where user.organId = " + id);
	}
	
	@SuppressWarnings("unchecked")
	public void deleteByIds(String ids){
		List<TOrgan> list = super.findListByIds(ids, TOrgan.class);
		for(int i = 0 ; i < list.size(); i++){
			TOrgan organ = list.get(i);
			List<TOrgan> childs = this.getTreeNodes(organ);
			for(int j = 0 ; j < childs.size() ; j++){
				this.delete(childs.get(j).getId());
			}
			this.delete(organ.getId());
		}
	}
	
	/**
	 * 根据父ID递归查询子菜单
	 * @param parentId
	 * @return
	 */
	public JSONArray findAllListToGrid(Long parentId){
		JSONArray organsJSON = new JSONArray();
		List<TOrgan> childsOrgan = null;
		
		if(parentId != null){
			childsOrgan = this.findListByParentId(parentId);
		}else{
			childsOrgan = this.findListByNotParent();
		}
		
		for(TOrgan organ : childsOrgan){
			JSONObject organJSON = new JSONObject();
			organJSON.put("id", organ.getId());
			organJSON.put("name", organ.getName());
			organJSON.put("code", organ.getCode());
			organJSON.put("children", this.findAllListToGrid(organ.getId()));
			organsJSON.add(organJSON);
		}
		return organsJSON;
	}
	
	public JSONArray findAllListToTree(Long parentId){
		JSONArray organsJSON = new JSONArray();
		List<TOrgan> childsOrgan = null;
		
		if(parentId != null){
			childsOrgan = this.findListByParentId(parentId);
		}else{
			childsOrgan = this.findListByNotParent();
		}
		
		for(TOrgan organ : childsOrgan){
			JSONObject organJSON = new JSONObject();
			organJSON.put("id", organ.getId());
			organJSON.put("text", organ.getName());
			organJSON.put("children", this.findAllListToTree(organ.getId()));
			organsJSON.add(organJSON);
		}
		return organsJSON;
	}
	
	public boolean addOrgan(TOrgan organ){
		Long id = super.saveReturnId(organ);
		return id == null ? false : true;
	}
	
}

