package com.stone.biz.message.action;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import com.ibm.icu.text.SimpleDateFormat;
import com.stone.biz.message.pojo.MessageBox;
import com.stone.biz.message.pojo.TMessageBoxOrgan;
import com.stone.biz.message.service.MessageBoxService;
import com.stone.para.IConstant;
import com.stone.support.SupportAction;
import com.stone.support.utils.DateFormatTool;
import com.stone.support.utils.SendMessageUtil;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TUser;

public class MessageBoxAction extends SupportAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4700248132860921118L;

	private MessageBoxService boxService;
	
	private MessageBox box ;
	private File file;
	private String fileFileName;
	
	public File getFile() {
		return file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	//保存
	public String add() throws IOException{
		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		SimpleDateFormat fromat = new SimpleDateFormat("yyyy-MM-dd HH24:mm");
//		fromat.format(new Date());
//		String calDate = box.getCalDate();
//		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("GMT +08:00"));//使用默认时区和语言环境获得一个日历。   
//		cal.add(Calendar.YEAR, +1);//取当前日期的后一天.  
//		if("72".equals(calDate)){
//			cal.add(Calendar.DAY_OF_MONTH, +3);//天数
//		}else if("12".equals(calDate)){
//			cal.add(Calendar.HOUR_OF_DAY, +12);//小时
//		}else if("24".equals(calDate)){
//			cal.add(Calendar.HOUR_OF_DAY, +24);//小时
//		}else if("6".equals(calDate)){
//			cal.add(Calendar.HOUR_OF_DAY, +6);//小时
//		}else if("5".equals(calDate)){
//			cal.add(Calendar.MINUTE, +5);//分钟
//		}else if("10".equals(calDate)){
//			cal.add(Calendar.MINUTE, +10);//分钟
//		}else if("30".equals(calDate)){
//			cal.add(Calendar.MINUTE, +30);//分钟
//		}else if("60".equals(calDate)){
//			cal.add(Calendar.MINUTE, +60);//分钟
//		}else if("7".equals(calDate)){
//			cal.add(Calendar.DAY_OF_MONTH, +7);//天数
//		}else{
//			cal.add(Calendar.YEAR, +1);//年份
//		}
		
//		box.setGuoqiDate(cal.getTime());
//		box.setCreateDate(new Date());
		box.setLoginId(user.getLoginId());
		box.setStatus("0");//默认为 未发布
		String result = boxService.addMessage(box,file,fileFileName);
		if("SUCCESS".equals(result)){
			TMessageBoxOrgan bo = null;
			for(String code : box.getCode().split(",")){
				bo = new TMessageBoxOrgan();
				bo.setOrganCode(code);
				bo.setMid(box.getId());
				boxService.save(bo);
			}
		}
		super.addActionData("msg",result);
		return SUCCESS;
	}
	
	/**
	 * 修改消息提示
	 * @return
	 */
	public String edit(){
		MessageBox message = (MessageBox) boxService.findById(box.getId(), MessageBox.class.getName());
//		String calDate = box.getCalDate();
//		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("GMT +08:00"));//使用默认时区和语言环境获得一个日历。   
//		cal.add(Calendar.YEAR, +1);//取当前日期的后一天.  
//		if("72".equals(calDate)){
//			cal.add(Calendar.DAY_OF_MONTH, +3);//天数
//		}else if("12".equals(calDate)){
//			cal.add(Calendar.HOUR_OF_DAY, +12);//小时
//		}else if("24".equals(calDate)){
//			cal.add(Calendar.HOUR_OF_DAY, +24);//小时
//		}else if("6".equals(calDate)){
//			cal.add(Calendar.HOUR_OF_DAY, +6);//小时
//		}else if("5".equals(calDate)){
//			cal.add(Calendar.MINUTE, +5);//分钟
//		}else if("10".equals(calDate)){
//			cal.add(Calendar.MINUTE, +10);//分钟
//		}else if("30".equals(calDate)){
//			cal.add(Calendar.MINUTE, +30);//分钟
//		}else if("60".equals(calDate)){
//			cal.add(Calendar.MINUTE, +60);//分钟
//		}else if("7".equals(calDate)){
//			cal.add(Calendar.DAY_OF_MONTH, +7);//天数
//		}else if("0".equals(calDate)){
//			cal.add(Calendar.SECOND, 0);
//		}else{
//			cal.add(Calendar.YEAR, +1);//年份
//		}

//		message.setCreateDate(new Date());
//		message.setGuoqiDate(cal.getTime());
		message.setTitle(box.getTitle());
		message.setContent(box.getContent());
		message.setStatus("0");
		boxService.update(message);
		return SUCCESS;
	}
	
	/**
	 * 发布消息
	 * @return
	 */
	public String sendMessage(){
		String id = super.getParameter("id");
		box = (MessageBox) boxService.findById(Long.parseLong(id), MessageBox.class.getName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String content = sdf.format(new Date())+","+box.getContent();
		SendMessageUtil.SendMessage(content);
		
		box.setStatus("1");
		boxService.update(box);
		return SUCCESS;
	}
	
	/**
	 * 撤销消息
	 * @return
	 */
	public String cancelMessage(){
		String id = super.getParameter("id");
		MessageBox box = (MessageBox) boxService.findById(Long.parseLong(id), MessageBox.class.getName());
		box.setStatus("0");
		boxService.update(box);
		return SUCCESS;
	}
	
	/**
	 * 详细信息
	 * @return
	 */
	public String getMsgById(){
		String id = super.getParameter("id");
		box = (MessageBox) boxService.findById(Long.parseLong(id), MessageBox.class.getName());
		return "OPEN_MSG_SUCCESS";
	}
	public String getNeirong(){
		String ids = super.getParameter("ids");
		List<MessageBox> list = boxService.findListByHql("from MessageBox where id in ("+ids+")");
		String neirong = "";
		for(MessageBox mb : list){
			neirong += "<span>标题："+mb.getTitle()+"</span><span style='float:right'>"+mb.getCreateDate()
			+"</span><br><span style='color:red'>内容：<br>"+mb.getContent()+"</span><br>";
		}
		setReqestAttribute("neirong",neirong);
		return "GET_NEIRONG_SUCCESS";
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String deleteByIds(){
		String ids = super.getParameter("ids");
		
		boxService.deleteMessage(ids);
		boxService.deleteByIds(ids, MessageBox.class);
		return SUCCESS;
	}
	
	
	/**
	 * 打开添加页面
	 * 获取发布人信息 包括所在机构
	 * @return
	 */
	public String openAdd(){
		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		TOrgan organ = (TOrgan) getSession().getAttribute(IConstant.SESSION_TORGAN);
		box = new MessageBox(); //实例化
		StringBuffer sb = new StringBuffer();
		//获取发布人信息
		sb.append(user.getName());
		if(organ.getCode().length() == 2 || organ.getCode().length() == 4){
			sb.append("【"+organ.getName()+"】");
		}else if(organ.getCode().length() == 6){
			TOrgan organS = (TOrgan) boxService.findById(organ.getParentId(), TOrgan.class.getName());
			sb.append("【"+organS.getName()+"/"+organ.getName()+"】");
		}
		box.setFaburen(sb.toString());
		//所在地市区划
		box.setCode(organ.getCode());
		box.setName(organ.getNotes());
		
		return "ADD_MSG_SUCCESS";
	}
	
	
	public void setBoxService(MessageBoxService boxService) {
		this.boxService = boxService;
	}

	public MessageBox getBox() {
		return box;
	}

	public void setBox(MessageBox box) {
		this.box = box;
	}
	
}
