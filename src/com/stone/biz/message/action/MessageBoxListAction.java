package com.stone.biz.message.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import com.stone.biz.message.pojo.MessageBox;
import com.stone.biz.message.service.MessageBoxService;
import com.stone.para.IConstant;
import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TUser;

public class MessageBoxListAction extends SupportListAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7851516174730355311L;
	private MessageBoxService boxService;
	
	/**
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getList(){
		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		TOrgan organ = (TOrgan) getSession().getAttribute(IConstant.SESSION_TORGAN);
		String query = "from MessageBox box where 1=1 ";
		
		String conditions = "";
		
		if(!"admin".equalsIgnoreCase(user.getLoginId())){ 
			conditions = " and instr(box.jigou,'3') > 0 and exists ( select o.mid from TMessageBoxOrgan o where o.mid = box.id and o.organCode = " +
						" ( case when (select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) >=  length('"+user.getXiandaima()+"')  " +
						" then '"+user.getXiandaima()+"' " +
						" when (select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) < length('"+user.getXiandaima()+"')" +
						" and (select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) = '2' " +
						" then substr('"+user.getXiandaima()+"',0,'2') " +
						" when (select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) < length('"+user.getXiandaima()+"')" +
						" and (select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) = '4' " +
						" then substr('"+user.getXiandaima()+"',0,'4') " +
						" else substr('"+user.getXiandaima()+"',0,'6') " +
						"  end )) ";
		}
		
//		conditions = "  and exists ( select o.mid from TMessageBoxOrgan o where o.mid = box.id and o.organCode = " +
//		" ( case when (select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) >=  length('"+organ.getCode()+"')  " +
//		" then substr('"+organ.getCode()+"',0,2) " +
//		" when length('"+organ.getCode()+"') = '4' " +
//		" then substr('"+organ.getCode()+"',0,4) " +
//		" else substr('"+organ.getCode()+"',0,6) end )) ";
		
		
//		conditions = " and (((select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) >= '"+organ.getCode().length()+"' " +
//				" and exists ( select o.mid from TMessageBoxOrgan o where o.organCode = '"+organ.getCode()+"' and o.mid = box.id ))" +
//				" or ( (select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) < '"+organ.getCode().length()+"' " +
//				"  and ( select o.mid from TMessageBoxOrgan o where o.mid = o.id and o.organCode = " +
//				" ( case when (select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) = '2' " +
//				" then substr('"+organ.getCode()+"',0,4) " +
//				" when (select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) = '4' " +
//				" then substr('"+organ.getCode()+"',0,4) " +
//				" when (select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) = '6' " +
//				" then substr('"+organ.getCode()+"',0,6) end )  ) )) ";
		
//		" or (( (select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) < '"+organ.getCode().length()+"') " +
//		" and exists (select o.mid from TMessageBoxOrgan o where instr('"+organ.getCode()+"',o.organCode) > 0 " +
//		" and (select length(max(o.organCode)) from TMessageBoxOrgan o where o.mid = box.id) = length(o.organCode) ))) ";
		
//		if(!"admin".equalsIgnoreCase(user.getLoginId())){  substr(box.code,0,instr(box.code,',')-1)
//			conditions = " and exists ( select o.mid from TMessageBoxOrgan o where instr(o.organCode,'"+organ.getCode()+"') > 0" +
//					" and '"+organ.getCode().length()+"' >= length(o.organCode) " +
//							"and box.id = o.mid )";
//		}
		
		String order = " order by box.isUp desc,box.id desc";
		
		query += conditions + order;

		List boxList = boxService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long records = boxService.findTotalByHql("select count(box) " + query);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, boxList);
		return SUCCESS;
	}

	/**
	 * 获取消息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getMessageData(){
		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		if(user != null){
			String hql = "FROM MessageBox box WHERE box.guoqiDate > to_date('"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"','yyyy-mm-dd hh24:mi:ss') " +
			" AND box.status = '1' order by box.id desc";
			List<MessageBox> list = boxService.findListByHql(hql);
			super.addActionData("boxList", list);
		}
		return SUCCESS;
	}
	
	
	public void setBoxService(MessageBoxService boxService) {
		this.boxService = boxService;
	}
	
}
