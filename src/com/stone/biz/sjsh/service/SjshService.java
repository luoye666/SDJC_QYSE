package com.stone.biz.sjsh.service;

import java.util.ArrayList;
import java.util.List;

import com.stone.support.SupportService;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TSeDirectory;

/**
 * <pre>
 *  基础数据的Service
 * </pre>
 */

public class SjshService extends SupportService {
	//获取全部的区划
	public List<TDicData> getDataListByCodeAndValue(String qpCode){
		String query = "from TDicType type where type.code ='" + qpCode+"'";
		List<TDicData> datalist = new ArrayList<TDicData>();
		List<TDicType> typelist = super.findListByHql(query);
		if(typelist.size()>0){
			TDicType typeOne=new TDicType();
			typeOne=typelist.get(0);
			String dataquery = "from TDicData data where data.typeId = "+typeOne.getId();
			datalist = super.findListByHql(dataquery);
		}
		return datalist;
	}
	//根据父级字典名称获取子级字典
	public List<TSeDirectory> getDataListByParentCode(String code){
		String query = "from TSeDirectory s where s.parentId = (select t.id from TSeDirectory t where t.daima = '"+code+"' AND rownum = 1)";
		List<TSeDirectory> list = super.findListByHql(query);
		return list;
	}

	// 根据设备代码获取设备种类名称
	public String getSeNameByCode(String code) {
		String hql = "from TSeDirectory s where s.daima = '" + code + "'";
		List<TSeDirectory> list = super.findListByHql(hql);
		if(list.size()>0){
			return list.get(0).getMingcheng();
		}
		return "";
	}
}
