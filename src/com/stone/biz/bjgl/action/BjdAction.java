package com.stone.biz.bjgl.action;

import java.io.File;
import java.io.IOException;

import com.stone.biz.bjgl.pojo.TBjd;
import com.stone.biz.bjgl.service.BjdService;
import com.stone.para.IConstant;
import com.stone.support.SupportAction;
import com.stone.sys.pojo.TUser;

public class BjdAction extends SupportAction{

	private static final long serialVersionUID = 3401550524197041338L;
	
	private TBjd bjd;
	private BjdService bjdService;
	private File uploadify;
	private String uploadifyFileName;
	
	public void setBjdService(BjdService bjdService) {
		this.bjdService = bjdService;
	}

	public File getUploadify() {
		return uploadify;
	}

	public void setUploadify(File uploadify) {
		this.uploadify = uploadify;
	}

	public String getUploadifyFileName() {
		return uploadifyFileName;
	}

	public void setUploadifyFileName(String uploadifyFileName) {
		this.uploadifyFileName = uploadifyFileName;
	}


	/**
	 * 查询报检设备的信息,
	 * 将信息放到bjd里给页面赋值
	 * @return
	 */
	public String findSe(){
		//设备主键
		String seId = super.getParameter("id");
		String zcdm = super.getParameter("zcdm");
		String djbh = super.getParameter("djbh");
		
		bjd = bjdService.findSe(seId);
		bjd.setSe_id(seId);
		bjd.setSeZhucedaima(zcdm);
		bjd.setSeDengjizhengbianhao(djbh);
		
		return "QY_BJD_INFO_SUCCESS";
	}
	
	
	/**
	 * 保存报检单方法
	 * @return
	 * @throws IOException 
	 */
	public String saveBjd() throws IOException{
		
		TUser user = (TUser) super.getSession().getAttribute(IConstant.SESSION_TUSER);
		
		String message = bjdService.saveBjd(bjd,user,uploadify,uploadifyFileName);
		
		super.addActionData("msg", message);
		return SUCCESS;
	}
	
	
	/**
	 * 查询报检单信息
	 * @return
	 */
	public String findBjd(){
		
		String id = super.getParameter("id");
		
		bjd = (TBjd) bjdService.findById(Long.parseLong(id), TBjd.class.getName());
		
		return "QY_BJD_INFO_SUCCESS";
	}
	
	
	/**
	 * 上传缴费凭证
	 * @return
	 */
	public String saveuploadBjFile(){
		String str = "";
		String id = super.getParameter("id");
		try {
			str = bjdService.saveuploadBjFile(id,uploadify, uploadifyFileName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(str);
		super.addActionData("msg", str);
		return SUCCESS;
	}
	
	
	public TBjd getBjd() {
		return bjd;
	}

	public void setBjd(TBjd bjd) {
		this.bjd = bjd;
	}
	
	

}
