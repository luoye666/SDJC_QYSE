package com.stone.sys.service.impl;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.stone.support.SupportService;
import com.stone.sys.pojo.TSeDirectory;

public class SeDirServiceImpl extends SupportService {
	
	@SuppressWarnings("unchecked")
	public List<TSeDirectory> findListByParentId(Long parentId){
		return super.findListByHql("from TSeDirectory entity where entity.parentId = " + parentId + " order by entity.xuhao asc");
	}
	
	@SuppressWarnings("unchecked")
	public List<TSeDirectory> findListByNotParent(){
		return super.findListByHql("from TSeDirectory entity where entity.parentId is null order by entity.xuhao asc");
	}
	
	public boolean hasChildById(Long id){
		int count = Integer.parseInt(super.findSingletonByHql("select count(entity) from TSeDirectory entity where entity.parentId = " + id).toString());
		
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
	public List<TSeDirectory> getTreeNodes(TSeDirectory dir){
		List<TSeDirectory> dirList = new ArrayList<TSeDirectory>();
		List<TSeDirectory> childsDir = super.findListByHql("from TSeDirectory entity where entity.parentId = " + dir.getId() + "order by entity.xuhao asc");
		dirList.addAll(childsDir);
		
		for(int i = 0 ; i < childsDir.size(); i++){
			dirList.addAll(this.getTreeNodes(childsDir.get(i)));
		}
		
		return dirList;
	}
	
	/**
	 * 删除特种设备目录
	 * @param id
	 */
	public void delete(Long id){
		super.delete(id, TSeDirectory.class.getName());
	}
	
	@SuppressWarnings("unchecked")
	public void deleteByIds(String ids){
		List<TSeDirectory> list = super.findListByIds(ids, TSeDirectory.class);
		for(int i = 0 ; i < list.size(); i++){
			TSeDirectory dir = list.get(i);
			List<TSeDirectory> childs = this.getTreeNodes(dir);
			for(int j = 0 ; j < childs.size() ; j++){
				this.delete(childs.get(j).getId());
			}
			this.delete(dir.getId());
		}
	}
	
	/**
	 * 根据父ID递归查询子菜单
	 * @param parentId
	 * @return
	 */
	public JSONArray findAllListToGrid(Long parentId){
		JSONArray organsJSON = new JSONArray();
		List<TSeDirectory> childsOrgan = null;
		
		if(parentId != null){
			childsOrgan = this.findListByParentId(parentId);
		}else{
			childsOrgan = this.findListByNotParent();
		}
		
		for(TSeDirectory dir : childsOrgan){
			JSONObject organJSON = new JSONObject();
			organJSON.put("id", dir.getId());
			organJSON.put("mingcheng", dir.getMingcheng());
			organJSON.put("daima", dir.getDaima());
			organJSON.put("xuhao", dir.getXuhao());
			organJSON.put("children", this.findAllListToGrid(dir.getId()));
			organsJSON.add(organJSON);
		}
		return organsJSON;
	}
	
	public JSONArray findAllListToTree(Long parentId){
		JSONArray organsJSON = new JSONArray();
		List<TSeDirectory> childsDir = null;
		
		if(parentId != null){
			childsDir = this.findListByParentId(parentId);
		}else{
			childsDir = this.findListByNotParent();
		}
		
		for(TSeDirectory dir : childsDir){
			JSONObject organJSON = new JSONObject();
			organJSON.put("id", dir.getId());
			organJSON.put("text", dir.getMingcheng());
			organJSON.put("children", this.findAllListToTree(dir.getId()));
			organsJSON.add(organJSON);
		}
		return organsJSON;
	}
	
	public boolean addDir(TSeDirectory dir){
		Long id = super.saveReturnId(dir);
		return id == null ? false : true;
	}
}

