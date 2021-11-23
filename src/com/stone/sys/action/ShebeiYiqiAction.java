package com.stone.sys.action;

import com.stone.para.IConstant;
import com.stone.support.SupportAction;
import com.stone.sys.pojo.TShebeiYiqi;
import com.stone.sys.pojo.TShebeiYiqiInfo;
import com.stone.sys.pojo.TUser;
import com.stone.sys.service.impl.ShebeiYiqiServiceImpl;

/**
 * 设备仪器action
 * @author THINKPAD
 * 2015年5月11日13:36:50
 */
public class ShebeiYiqiAction extends SupportAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4607117664877777346L;
	
	
	private ShebeiYiqiServiceImpl yiqiService;
	private TShebeiYiqi yiqi;
	private TShebeiYiqiInfo yiqiInfo;
	
	/**
	 * 添加
	 * @return
	 */
	public String addData(){
		TUser user = (TUser) super.getSession().getAttribute(IConstant.SESSION_TUSER);
		yiqi.setUserId(user.getId());
		yiqiService.save(yiqi);
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String editData(){
		String id = super.getParameter("id");
		yiqiService.updateData(id,yiqi);
		return SUCCESS;
	}
	
	/**
	 * 领用
	 * @return
	 */
	public String saveYiqiLingyong(){
		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		String id = super.getParameter("id");
		yiqiService.saveYiqiInfo(id,user,yiqi);
		return SUCCESS;
	}
	
	/**
	 * 仪器归还
	 * @return
	 */
	public String updateYiqiLingyong(){
		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		String id = super.getParameter("id");
		yiqiService.updateYiqiInfo(id,user);
		return SUCCESS;
	}
	
	/**
	 * 删除项目
	 * @return
	 */
	public String deleteDataByIds(){
		String ids = super.getParameter("ids");
		yiqiService.deleteDataByIds(ids);
		return SUCCESS;
	}
	
	
	public void setYiqiService(ShebeiYiqiServiceImpl yiqiService) {
		this.yiqiService = yiqiService;
	}


	public TShebeiYiqi getYiqi() {
		return yiqi;
	}

	public void setYiqi(TShebeiYiqi yiqi) {
		this.yiqi = yiqi;
	}

	public TShebeiYiqiInfo getYiqiInfo() {
		return yiqiInfo;
	}

	public void setYiqiInfo(TShebeiYiqiInfo yiqiInfo) {
		this.yiqiInfo = yiqiInfo;
	}
	
}
