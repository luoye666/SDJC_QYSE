package com.stone.biz.message.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.stone.biz.message.pojo.DownloadBox;
import com.stone.biz.message.service.MessageBoxService;
import com.stone.para.IConstant;
import com.stone.support.SupportAction;
import com.stone.support.utils.Resources;
import com.stone.sys.pojo.TUser;

/**
 * 常用附件管理
 * @author THINKPAD
 *
 */
public class DownloadBoxAction extends SupportAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7623500764224970240L;

	private File uploadify;
	
	 // 封装上传文件类型的属性
    private String uploadifyContentType;
    // 封装上传文件名的属性
    private String uploadifyFileName;
	
	private MessageBoxService boxService;
	
	private DownloadBox box;
	
	/**
	 * 附件上传
	 * @return
	 */
	public String uploadApp(){
		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		HttpServletResponse response = getResponse();
    	response.setCharacterEncoding("utf-8");         
    	response.setContentType("text/html; charset=utf-8");

        String realpath = Resources.getString("CHANGYONGXIAZAI", "struts");
        
		SimpleDateFormat ms = new SimpleDateFormat("yyyyMMddHHmmss");
		Random rd = new Random();
		String str = uploadifyFileName.substring(0, uploadifyFileName.lastIndexOf("."))+"_"+ms.format(new Date())+(rd.nextInt(90000)+10000)+
			uploadifyFileName.substring(uploadifyFileName.lastIndexOf("."));
        if (uploadify != null) {
            File savefile = new File(new File(realpath), str);
            if (!savefile.getParentFile().exists())
                savefile.getParentFile().mkdirs();
            try {
				FileUtils.copyFile(uploadify, savefile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        box.setCreateDate(new Date());
        box.setCreateName(user.getName());
        box.setPath(realpath+str);
        boxService.save(box);
		return SUCCESS;
	}

	/**
	 * 删除
	 * @return
	 */
	public String deleteByIds(){
		String ids = super.getParameter("ids");
		String[] id = ids.split(",");
//		boxService.deleteByIds(ids, DownloadBox.class);
		
		for(int i=0;i<id.length;i++){
			DownloadBox box = (DownloadBox) boxService.findById(Long.parseLong(id[i]), DownloadBox.class.getName());
			
			if(null != box.getPath() && !"".equals(box.getPath()) && !"null".equals(box.getPath())){
				File file = new File(box.getPath());
				if(file.exists()){
		            file.delete();
				}
			}
			
			boxService.delete(box);
		}
		return SUCCESS;
	}
	
	
	public File getUploadify() {
		return uploadify;
	}

	public void setUploadify(File uploadify) {
		this.uploadify = uploadify;
	}

	public void setBoxService(MessageBoxService boxService) {
		this.boxService = boxService;
	}

	public String getUploadifyContentType() {
		return uploadifyContentType;
	}

	public void setUploadifyContentType(String uploadifyContentType) {
		this.uploadifyContentType = uploadifyContentType;
	}

	public String getUploadifyFileName() {
		return uploadifyFileName;
	}

	public void setUploadifyFileName(String uploadifyFileName) {
		this.uploadifyFileName = uploadifyFileName;
	}

	public DownloadBox getBox() {
		return box;
	}

	public void setBox(DownloadBox box) {
		this.box = box;
	}

	
	
}
