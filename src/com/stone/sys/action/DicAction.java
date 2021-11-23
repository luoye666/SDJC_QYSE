package com.stone.sys.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import com.stone.support.SupportAction;
import com.stone.sys.pojo.TDbData;
import com.stone.sys.pojo.TDbType;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.service.impl.DicServiceImpl;


public class DicAction extends SupportAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 441012039023392142L;
	private DicServiceImpl baseService;
	private TDicType dicType;
	private TDicData dicData;
	private TDbType dbType;
	private TDbData dbData;
	public TDicType getDicType() {
		return dicType;
	}
	public void setDicType(TDicType dicType) {
		this.dicType = dicType;
	}
	public TDicData getDicData() {
		return dicData;
	}
	public void setDicData(TDicData dicData) {
		this.dicData = dicData;
	}
	public void setBaseService(DicServiceImpl baseService) {
		this.baseService = baseService;
	}
	
	
	public TDbType getDbType() {
		return dbType;
	}
	public void setDbType(TDbType dbType) {
		this.dbType = dbType;
	}
	public TDbData getDbData() {
		return dbData;
	}
	public void setDbData(TDbData dbData) {
		this.dbData = dbData;
	}
	public String openZdTypeInfo() throws Exception{
		String id = super.getParameter("id");
		dicType = (TDicType)this.baseService.findById(Long.parseLong(id), TDicType.class.getName());
		return "OPEN_DIC_TYPE_SUCCESS";
	}
	
	public String openZdDataInfo() throws Exception{
		String id = super.getParameter("id");
		dicData = (TDicData)this.baseService.findById(Long.parseLong(id), TDicData.class.getName());
		return "OPEN_DIC_DATA_SUCCESS";
	}
	
	public String addType() throws Exception{
		this.baseService.addType(dicType);
		return SUCCESS;
	}
	
	public String deleteTypeByIds() throws Exception{
		String ids = super.getParameter("ids");
		this.baseService.deleteTypeByIds(ids);
		
		return SUCCESS;
	}
	
	public String updateType() throws Exception{
		this.baseService.update(dicType);
		
		return SUCCESS;
	}
	
	public String addData() throws Exception{
		this.baseService.addData(dicData);
		
		return SUCCESS;
	}
	
	public String deleteDataByIds() throws Exception{
		String ids = super.getParameter("ids");
		this.baseService.deleteByIds(ids, TDicData.class);
		
		return SUCCESS;
	}
	
	public String updateData() throws Exception{
		this.baseService.update(dicData);
		return SUCCESS;
	}
	public void getTypeName() throws IOException{
		String type_id = super.getParameter("id");
		String name = "无";
		if(super.checkParam(type_id)){
			TDicType t = (TDicType)baseService.findById(Long.parseLong(type_id), TDicType.class.getName());
			name = t.getName();
		}
		super.getResponse().getWriter().print(name);
	}
	
	
	/***********************************************外部数据更改******************************************************/
	
	/**
	 *保存外数据表信息
	 * @return
	 */
	public String addDbType(){
		
		String name_en = super.getParameter("name_en");
		String name_ch = super.getParameter("name_ch");
		String table_col = super.getParameter("table_col");
		
		baseService.addDbType(name_en,name_ch,table_col);
		
		return SUCCESS;
	}
	
	
	/**
	 * 更改外数据表信息
	 * @return
	 */
	public String updDbType(){
		
		baseService.update(dbType);
		return SUCCESS;
	}
	
	
	/**
	 * 外部表查找方法
	 * @return
	 */
	public String findDbType(){
		String id = super.getParameter("id");
		
		dbType = (TDbType) baseService.findById(Long.parseLong(id), TDbType.class.getName());
		
		return "OPEN_DB_TYPE_SUCCESS";
	}
	
	/**
	 * 删除数据表
	 * @return
	 */
	public String delDbType(){
		
		String ids = super.getParameter("ids");
		baseService.delDbType(ids);
		
		
		return SUCCESS;
	}
	
	/**
	 * 外部表字段查找方法
	 * @return
	 */
	public String findDbData(){
		String id = super.getParameter("id");
		
		dbData = (TDbData) baseService.findById(Long.parseLong(id), TDbData.class.getName());
		
		return "OPEN_DB_DATA_SUCCESS";
	}
	
	
	/**
	 * 保存外数据表字段
	 * @return
	 */
	public String addDbData(){
		
		baseService.save(dbData);
		
		return SUCCESS;
	}
	
	/**
	 * 更改外数据表字段
	 * @return
	 */
	public String updDbData(){
		
		baseService.update(dbData);
		
		return SUCCESS;
	}
	
	
	/**
	 * 删除外数据表字段
	 * @return
	 * @throws Exception
	 */
	public String deleteDbDataByIds() throws Exception{
		String ids = super.getParameter("ids");
		this.baseService.deleteByIds(ids, TDbData.class);
		
		return SUCCESS;
	}
	
	
	/**
	 * 查找外数据表
	 * @throws IOException
	 */
	public void getDbTypeName() throws IOException{
		String type_id = super.getParameter("id");
		TDbType t = (TDbType)baseService.findById(Long.parseLong(type_id), TDbType.class.getName());
		super.getResponse().getWriter().print(t.getTable_ch());
	}
	
}
