package com.stone.biz.message.action;

import java.util.List;

import com.stone.biz.message.service.MessageBoxService;
import com.stone.support.SupportListAction;

public class DownloadBoxListAction extends SupportListAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2362054823488175939L;
	private MessageBoxService boxService;
	
	/**
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getList(){
		String query = "from DownloadBox box where 1=1";
		String conditions = "";
		String order = " order by box.id desc";
		
		query += conditions + order;
		List boxList = boxService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long records = boxService.findTotalByHql("select count(box) " + query);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, boxList);
		
		return SUCCESS;
	}

	
	
	public void setBoxService(MessageBoxService boxService) {
		this.boxService = boxService;
	}
	
}
