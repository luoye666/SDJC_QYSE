package com.stone.sys.action;


import java.util.List;

import net.sf.json.JSONArray;

import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TSeDirectory;
import com.stone.sys.service.impl.SeDirServiceImpl;


public class SeDirectoryListAction extends SupportListAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1088733378437094610L;
	private SeDirServiceImpl dirService;

	public void setDirService(SeDirServiceImpl dirService) {
		this.dirService = dirService;
	}

	public String getGridList() throws Exception{
		JSONArray dirs = this.dirService.findAllListToGrid(null);
		
		super.addActionData(ROWS, dirs)
		.addActionData(TOTAL, dirs.size());
		
		return SUCCESS;
	}
	
	public String getTreeList() throws Exception{
		JSONArray dirs = this.dirService.findAllListToTree(null);
		super.addActionData("dirs", dirs);
		
		return SUCCESS;
	}
	//获取全部设备类别
	public String getSetypeList(){
		String hql = "from TSeDirectory se where se.parentId is null order by se.daima";
		List<TSeDirectory> list = dirService.findListByHql(hql);
		super.addActionData("dirDatas",list);
		return SUCCESS;
	}
	//根据代码获取子级菜单
	public String getDataListByParentCodeForSe(){
		String code = super.getParameter("code");
		String query = "from TSeDirectory s where s.parentId = " +
				"(select t.id from TSeDirectory t where t.daima = '"+code+"' AND rownum = 1) order by s.daima";
		List<TSeDirectory> datalist = dirService.findListByHql(query);
		super.addActionData("dirDatas", datalist);
		return SUCCESS;
	}
}
