package com.stone.sys.service.impl;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.stone.support.SupportService;
import com.stone.support.utils.ParameterUtils;
import com.stone.sys.pojo.TDbType;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TOrgan;

public class DicServiceImpl extends SupportService {
	
	/**
	 * 删除字典类型，并删除该类型关联数据
	 * @param id
	 */
	public void deleteType(Long id){
		if(id == null) return ;
		
		this.executeUpdateByHql("delete TDicData data where data.typeId = " + id);
		this.delete(id,TDicType.class.getName());
	}
	
	public void deleteTypeByIds(String ids){
		String[] idArray = ids.split(ParameterUtils.IDS_SEPARATOR);
		for(String one : idArray){
			 Long id = Long.parseLong(one);
			 this.deleteType(id);
		}
	}
	
	public boolean addType(TDicType type){
		Long id = super.saveReturnId(type);
		return id == null ? false : true;
	}
	
	public boolean addData(TDicData data){
		Long id = super.saveReturnId(data);
		return id == null ? false : true;
	}
	
	
	@SuppressWarnings("unchecked")
	public JSONArray findAllListToGrid(Long parentId,Long typeId){
		JSONArray organsJSON = new JSONArray();
		List<TDicData> childsOrgan = null;
		if(parentId != null){
			childsOrgan = super.findListByHql("from TDicData entity where entity.typeId = "+typeId+" AND entity.parentId = " + parentId + " order by entity.sortNum ");
		}else{
			childsOrgan = super.findListByHql("from TDicData entity where entity.typeId = "+typeId+" AND entity.parentId is null order by entity.sortNum");
		}
		
		for(TDicData organ : childsOrgan){
			JSONObject organJSON = new JSONObject();
			organJSON.put("id", organ.getId());
			organJSON.put("name", organ.getName());
			organJSON.put("code", organ.getCode());
			organJSON.put("value", organ.getValue());
			organJSON.put("notes", organ.getNotes());
			organJSON.put("children", this.findAllListToGrid(organ.getId(),typeId));
			organsJSON.add(organJSON);
		}
		return organsJSON;
	}
	
	/**
	 * 任务分组
	 * @param typeId
	 * @param parentId
	 * @return
	 */
	public JSONArray findAllListTFenzu(Long typeId,Long parentId){
		JSONArray organsJSON = new JSONArray();
		List<TOrgan> childsOrgan = null;
		
		if(parentId != null){
			organsJSON = this.findListByParentId(typeId,parentId);
		}else{
			childsOrgan = this.findListByNotParent();//
			
			for(TOrgan organ : childsOrgan){
				JSONObject organJSON = new JSONObject();
				organJSON.put("id", organ.getId());
				organJSON.put("text", organ.getName());
				organJSON.put("state", "open");
				organJSON.put("children", this.findAllListTFenzu(typeId,organ.getId()));
				organsJSON.add(organJSON);
			}
		}
		
		return organsJSON;
	}
	
	
	@SuppressWarnings("unchecked")
	public JSONArray findListByParentId(Long typeId,Long parentId){
		JSONArray organsJSON = new JSONArray();
		List<TOrgan> childsOrgan = super.findListByHql("from TOrgan entity where entity.parentId = " + parentId + " order by entity.id desc");
		for(TOrgan organ : childsOrgan){
			List<TOrgan> childOrgan = super.findListByHql("from TOrgan entity where entity.parentId = " + organ.getId() + " order by entity.id desc");
			JSONObject organJSON = new JSONObject();
			organJSON.put("id", organ.getId());
			organJSON.put("text", organ.getName());
			if(childOrgan != null && childOrgan.size()>0){
				organJSON.put("children", this.findListByParentId(typeId,organ.getId()));
			}else{
				organJSON.put("children", this.findListByNotParent(typeId,organ.getId()));
			}
			organsJSON.add(organJSON);
		}
		return organsJSON;
	}
	
	@SuppressWarnings("unchecked")
	public List<TOrgan> findListByNotParent(){
		return super.findListByHql("from TOrgan entity where entity.parentId is null order by entity.id desc");
	}
	
	@SuppressWarnings("unchecked")
	public JSONArray findListByNotParent(Long typeId,Long parentId){
		JSONArray dataArray = new JSONArray();
		List<TDicData> tdataList = super.findListByHql("FROM TDicData s WHERE s.typeId = "+typeId+" AND s.parentId = "+parentId+" ");
		for(int j=0;j<tdataList.size();j++){
			TDicData tdata = tdataList.get(j);
			JSONObject obj1 = new JSONObject();
			obj1.put("id", tdata.getId());
			obj1.put("text", tdata.getName());
			obj1.put("children", this.findListByNotParent(typeId,tdata.getId()));
			dataArray.add(obj1);
		}
		return dataArray;
	}
	
	/**
	 * 
	 * @param typeId
	 * @param parentId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JSONArray findListByRenwudan(Long typeId,Long parentId){
		JSONArray dataArray = new JSONArray();
		List<TDicData> tdataList = super.findListByHql("FROM TDicData s WHERE s.typeId = "+typeId+" AND s.parentId is null");
		for(int j=0;j<tdataList.size();j++){
			TDicData tdata = tdataList.get(j);
			JSONObject obj1 = new JSONObject();
			obj1.put("id", tdata.getId());
			obj1.put("text", tdata.getName());
			obj1.put("children", this.findListByNotParent(typeId,tdata.getId()));
			dataArray.add(obj1);
		}
		return dataArray;
	}
	
	
	
	/**
	 * 保存外数据表
	 * @param name_en
	 * @param name_ch
	 */
	public void addDbType(String name_en,String name_ch,String table_col){
		TDbType type = new TDbType();
		type.setTable_en(name_en);
		type.setTable_ch(name_ch);
		type.setTable_col(table_col);
		super.save(type);
	}
	
	
	/**
	 * 删除外数据表
	 * 级联删除外数据表字段
	 */
	public void delDbType(String ids){
		this.deleteByIds(ids, TDbType.class);
	}
}
