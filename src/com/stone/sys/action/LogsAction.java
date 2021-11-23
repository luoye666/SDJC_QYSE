package com.stone.sys.action;

import com.stone.support.SupportAction;
import com.stone.sys.service.impl.LogsService;

@SuppressWarnings("serial")
public class LogsAction extends SupportAction{

	@SuppressWarnings("unused")
	private LogsService logsService;

	
	
	public void setLogsService(LogsService logsService) {
		this.logsService = logsService;
	}
	
	
}
