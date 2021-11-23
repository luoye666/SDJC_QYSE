package com.stone.sys.action;

import java.util.List;
import java.util.Map;

import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TLog;
import com.stone.sys.service.impl.LogsService;

@SuppressWarnings("serial")
public class LogsListAction extends SupportListAction{

	private LogsService logsService;

	/**
	 * 获取结果集
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getList(){
		String name = super.getParameter("name");
		String nameEn = super.getParameter("nameEN");
		
		String query = "from TLog entity where 1=1";
		String conditions = "";
		
		if(super.checkParam(name)){
			conditions += " AND name like '%"+name+"%'";
		}
		if(super.checkParam(nameEn)){
			conditions += " AND actionapp like '%"+nameEn+"%'";
		}
		
		String order = " order by entity.id desc";
		
		query += conditions + order;
		List<TDicType> list = this.logsService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long total = this.logsService.findTotalByHql("select count(entity) " + query);
		addActionData(ROWS,list).addActionData(TOTAL, total);
		return SUCCESS;
	}
	
	/**
	 * 获取分组后的actionapp
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getActionAppGroup(){
		List<Map<String, String>> list = logsService.findListByHql("SELECT actionapp FROM TLog t GROUP BY t.actionapp");
		super.addActionData("log", list);
		return SUCCESS;
	}
	
	/**
	 * 获取异常任务 退回日志
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getRwList(){
		String query = "from TLog entity where entity.actionapp = 'RwAction'";
		String conditions = "";
		String order = " order by entity.id desc";
		
		query += conditions + order;
		List<TDicType> list = this.logsService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long total = this.logsService.findTotalByHql("select count(entity) " + query);
		addActionData(ROWS,list).addActionData(TOTAL, total);
		return SUCCESS;
	}
	
	/**
	 * 或许任务的日志信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getByRwOuid(){
		String id = super.getParameter("id");
		List<TLog> list = logsService.findListByHql("FROM TLog t where t.ouid = '"+id+"' order by t.id desc");
		super.addActionData("log", list.get(0));
		return SUCCESS;
	}
	
	public void setLogsService(LogsService logsService) {
		this.logsService = logsService;
	}
	
}
