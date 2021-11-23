package com.stone.sys.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.stone.biz.jcsj.pojo.TBaseInfoSearch;
import com.stone.para.IConstant;
import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TDbType;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TSeDirectory;
import com.stone.sys.service.impl.DicServiceImpl;


@SuppressWarnings("serial")
public class DicListAction extends SupportListAction {
	/**
	 * 
	 */
	private DicServiceImpl baseService;
	public void setBaseService(DicServiceImpl baseService) {
		this.baseService = baseService;
	}

	@SuppressWarnings("unchecked")
	public String getTypeList() throws Exception{
		//查询参数
		String qpName = super.getParameter("name");
		String qpCode = super.getParameter("code");
		
		String query = "from TDicType entity where 1=1";
		String conditions = "";
		String order = " order by entity.id desc";
		
		//查询条件
		
		//类型名称
		if(super.checkParam(qpName)){
			conditions += " and entity.name like '%" + qpName + "%'";
		}
		//类型编号
		if(super.checkParam(qpCode)){
			conditions += " and entity.code like '%"+ qpCode +"%'";
		}
		
		//合并HQL语句
		query += conditions + order;
		
		List ses = baseService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long records = baseService.findTotalByHql("select count(entity) " + query);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, ses);
		
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public void getTypeAll() throws Exception{
		String type = "";
		List<TDicType> list = this.baseService.findListByHql("from TDicType type order by type.id");
		
		for(TDicType t : list){
			type += t.getName()+":"+t.getId()+",";
		}
		if(!"".equals(type)){
			type = type.substring(0,type.length()-1);
		}
		super.getResponse().getWriter().print(type);
	}
	
	@SuppressWarnings("unchecked")
	public String getDataList() throws Exception{
		//查询参数
		String qpName = super.getParameter("name");
		String qpCode = super.getParameter("code");
		String qpTypeId = super.getParameter("typeId");
		
		String query = "from TDicData data where 1=1 ";
		String conditions = "";
		String order = " order by data.id desc";
		
		//查询条件
		//字典数据名称
		if(super.checkParam(qpName)){
			conditions += " and data.name like '%" + qpName + "%'";
		}
		//字典数据编码
		if(super.checkParam(qpCode)){
			conditions += " and data.code like '%" + qpCode + "%'";
		}
		//所属字典类型
		if(super.checkParam(qpTypeId)){
			conditions += " and data.typeId = " + qpTypeId;
		}
		
		query += conditions + order;
		
		List ses = baseService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long records = baseService.findTotalByHql("select count(data) " + query);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, ses);
		
		return SUCCESS;
	}
	
	public String getZuyuanDataList() throws Exception{
		String query = "from TDicType type where type.code ='RENWU_FENZU'";
		TDicType type = (TDicType)this.baseService.findSingletonByHql(query);
		
		
		//查询参数
		JSONArray organs = this.baseService.findAllListToGrid(null,type.getId());
		super.addActionData(ROWS, organs).addActionData(TOTAL, organs.size());
		return SUCCESS;
	}
	
	//根据字典的类型代码获得字典内容
	@SuppressWarnings("unchecked")
	public String getDataListByCode() throws Exception{
		String qpCode = super.getParameter("code");
		String query = "from TDicType type where type.code ='" + qpCode+"'";
		List<TDicType> typelist = this.baseService.findListByHql(query);
		if(typelist.size()>0){
			TDicType typeOne=new TDicType();
			typeOne=typelist.get(0);
			String dataquery = "from TDicData data where data.typeId = "+typeOne.getId();
			dataquery += " order by code";
			List<TDicData> datalist = this.baseService.findListByHql(dataquery);
			super.addActionData("dicDatas", datalist);
			return SUCCESS;
		}
		return SUCCESS;
	}
	//根据字典的类型代码获得字典内容
	@SuppressWarnings("unchecked")
	public String getDataListByCodeAndValue() throws Exception{
			String qpCode = super.getParameter("code");
			String qpValue = super.getParameter("value");
			String query = "from TDicType type where type.code ='" + qpCode+"'";
			List<TDicType> typelist = this.baseService.findListByHql(query);
			if(typelist.size()>0){
				TDicType typeOne=new TDicType();
				typeOne=typelist.get(0);
				String dataquery = "from TDicData data where data.typeId = "+typeOne.getId()+" and data.value like '"+qpValue+"%'";
				List<TDicData> datalist = this.baseService.findListByHql(dataquery);
				super.addActionData("dicDatas", datalist);
				return SUCCESS;
			}
			return SUCCESS;
		}
	
	//根据父级字典名称获取子级字典
	@SuppressWarnings("unchecked")
	public String getDataListByParentCode() throws IOException{
		String code = super.getParameter("code");
		String query = "from TSeDirectory s where s.parentId = (select t.id from TSeDirectory t where t.daima = '"+code+"' AND rownum = 1)";
		List<TSeDirectory> datalist = this.baseService.findListByHql(query);
		super.addActionData("dicDatas", datalist);
		return SUCCESS;
	}
	
	//初始化设备品种
	@SuppressWarnings("unchecked")
	public String getDataListByPzInit(){
		String query = "from TSeDirectory where daima > '"+3000+"' and daima < '"+4000+"'" +
				"and parentId not in (select (s.id) from TSeDirectory s where s.daima = '3000')";
		List<TSeDirectory> datalist = this.baseService.findListByHql(query);
		if(datalist.size()>0){
			super.addActionData("pzdatas", datalist);
		}
		return SUCCESS;
	}
	//根据父级字典ID获取子级字典
	public String getDataListByParentCodeForDic() throws IOException{
		String code = super.getParameter("code");
		String codeHql = "";
		String query = "from TDicData s where s.parentId in (select t.id from TDicData t where t.code = '"+code+"') ";
		query += codeHql + " order by s.code";
		List<TDicData> datalist = this.baseService.findListByHql(query);
		if(datalist.size()>0){
			super.addActionData("dicDatas", datalist);
		}
		
		return SUCCESS;
	}
	/**
	 * 初始化设备品种代码
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getDataListByParentInitDaima(){
		String dataList = "";
		String code = super.getParameter("code");
		String hql = "FROM TSeDirectory WHERE parentId = (SELECT id FROM TSeDirectory WHERE daima = '"+code+"' )";
		List<TSeDirectory> dirList = this.baseService.findListByHql(hql);
		if(dirList != null && dirList.size()>0){
			String sql = "FROM TSeDirectory WHERE parentId in(";
			for (int i = 0; i < dirList.size(); i++) {
				TSeDirectory dir = dirList.get(i);
				sql += "'"+dir.getId()+"',";
			}
			sql = sql.substring(0,sql.length()-1)+")";
			List<TSeDirectory> datalist = this.baseService.findListByHql(sql);
			super.addActionData("pzdatas", datalist);
		}
		return SUCCESS;
	}
	
	
	/**
	 * 获得大类的设备种类
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getShebeizhonglei(){
		String query = "FROM TSeDirectory s WHERE s.parentId is null order by s.daima";
		List<TSeDirectory> dirList = this.baseService.findListByHql(query);
		
		List<TDicData> dataList = this.baseService.findListByHql("FROM TDicData s WHERE s.code like '"+IConstant.PARAM_XZQH_CODE+"%')");
		
		JSONArray array = new JSONArray();
		if(dirList != null){
			for(int i=0;i<dirList.size();i++){
				JSONObject obj = new JSONObject();
				JSONArray dataArray = new JSONArray();
				
				TSeDirectory directory = dirList.get(i);
				obj.put("id", directory.getDaima());
				obj.put("text", directory.getMingcheng());
				obj.put("state", "open");
				
				for(int j=0;j<dataList.size();j++){
					JSONArray dataLeibieArray = new JSONArray();
					TDicData data = dataList.get(j);
					JSONObject obj1 = new JSONObject();
					obj1.put("id", directory.getDaima() + data.getCode());
					obj1.put("text", data.getName()+"("+data.getCode()+")");
					
					for(int l=0;l<2;l++){
						JSONObject obj2 = new JSONObject();
						obj2.put("id", directory.getDaima() + data.getCode() + (l==0?"01":"02"));
						obj2.put("text", l==0?"定期检验":"安装监检");
						dataLeibieArray.add(obj2);
					}
					obj1.put("children", dataLeibieArray);
					dataArray.add(obj1);
				}
				obj.put("children", dataArray);
				array.add(obj);
			}
		}
		super.addActionData("dicDatas", array);
		return SUCCESS;
	}
	
	
	/**
	 * 查询外数据库表名
	 * @return
	 */
	public String getDbTypeList(){
		
		String query = " from TDbType entity ";
		
		List ses = baseService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long records = baseService.findTotalByHql("select count(entity) " + query);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, ses);
		
		return SUCCESS;
	}
	
	/**
	 * 查询外数据库字段
	 * @return
	 */
	public String getDbDataList(){
		
		String type_id = super.getParameter("table");
		
		String query = " from TDbData entity where 1=1 ";
		String conditions = "";
		
		if(super.checkParam(type_id)){
			conditions += " and entity.parentId = " + type_id;
		}
		
		query = query+conditions;
		
		List ses = baseService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long records = baseService.findTotalByHql("select count(entity) " + query);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, ses);
		
		return SUCCESS;
	}
	
	/**
	 * 查询外数据表
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void getDbTypeAll() throws Exception{
		String type = "";
		List<TDbType> list = this.baseService.findListByHql("from TDbType type order by type.id");
		
		for(TDbType t : list){
			type += t.getTable_ch()+":"+t.getId()+",";
		}
		if(!"".equals(type)){
			type = type.substring(0,type.length()-1);
		}
		super.getResponse().getWriter().print(type);
	}
	//获取选择设备的乡镇列表
	public String getXzList(){
		String seids = super.getParameter("seids");
		String hql = "select quhuadaima from TBaseInfoSearch where id in ("+seids+") and quhuadaima is not null group by quhuadaima";
		List list = baseService.findListByHql(hql);
		List<TDicData> dataList = new ArrayList<TDicData>();
		if(list.size() == 1){
			String qhdm = list.get(0).toString().replace("[","").replace("]","");
			hql = "from TDicData where code like '"+qhdm+"%' and code != '"+qhdm+"' order by code";
			dataList = baseService.findListByHql(hql);
			super.addActionData("dicDatas", dataList);
		}else{
			super.addActionData("dicDatas", dataList);
		}
		return SUCCESS;
	}
}
