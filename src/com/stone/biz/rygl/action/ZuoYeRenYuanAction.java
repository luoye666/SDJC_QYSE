package com.stone.biz.rygl.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.struts2.ServletActionContext;
import org.hibernate.dialect.MySQL5Dialect;

import com.stone.biz.rygl.pojo.TZuoYeRenYuan;
import com.stone.biz.rygl.service.ZuoYeRenYuanService;
import com.stone.biz.utils.pojo.TSyUtils;
import com.stone.para.IConstant;
import com.stone.support.SupportAction;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TRole;
import com.stone.sys.pojo.TUser;
import com.stone.sys.service.impl.UserServiceImpl;

import frm.ssh.exception.AppException;

/**
 * @author admin
 *
 */
public class ZuoYeRenYuanAction extends SupportAction {
	
	private TZuoYeRenYuan ry;
	private File file;
	private String fileFileName;
	private ZuoYeRenYuanService zuoyeService;

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public void setZuoyeService(ZuoYeRenYuanService zuoyeService) {
		this.zuoyeService = zuoyeService;
	}

	public TZuoYeRenYuan getRy() {
		return ry;
	}

	public void setRy(TZuoYeRenYuan ry) {
		this.ry = ry;
	}

	//更新人员许可证
	public String updateByXkz() throws Exception{
		ry.setShi(zuoyeService.getNameByCode(ry.getShidaima()));
		ry.setQuxian(zuoyeService.getNameByCode(ry.getQuxiandaima()));
		ry.setXiangzhen(zuoyeService.getNameByCode(ry.getXiangzhendaima()));
		this.zuoyeService.update(ry);
		return SUCCESS;
	}
	//删除人员许可证
	public String deleteByXkz() throws Exception{
		String ids = super.getParameter("ids");
		zuoyeService.deleteByXkz(ids);
		return SUCCESS;
	}
	//获取人员许可证信息
	public String openRyXkzInfo() throws Exception{
		String result = "OPEN_ZYRY_SUCCESS";
		Long id = super.getParameterLong("id");
		ry = (TZuoYeRenYuan)this.zuoyeService.findById(id, TZuoYeRenYuan.class.getName());
		return result;
	}
	//获取证书信息菜单的id
	public String getXkzMenuId(){
		String mid = super.getParameter("mid");
		long id = zuoyeService.getZhengShuId(mid);
		super.addActionData("zid",id);
		return SUCCESS;
	}
	//保存人员许可证
	public String saveXkz() throws Exception{
		ry.setShi(zuoyeService.getNameByCode(ry.getShidaima()));
		ry.setQuxian(zuoyeService.getNameByCode(ry.getQuxiandaima()));
		ry.setXiangzhen(zuoyeService.getNameByCode(ry.getXiangzhendaima()));
		this.zuoyeService.save(ry);
		
		return SUCCESS;
	}
	//获取字典
	public String getDicByZyry(){
		super.addActionData("zyzl", getDicDate("ZYZL"));
		super.addActionData("zyjb", getDicDate("ZYJB"));
		super.addActionData("zyxm", getDicDate("ZYXM"));
		return SUCCESS;
	}
	//获取字典
	public String getDicByJyry(){
		super.addActionData("zgzl", getDicDate("ZGZL"));
		return SUCCESS;
	}
	//获取使用单位名称
	public String getSydwName(){
		String sydwid = super.getParameter("sydwid");
		String name = zuoyeService.getSydwName(sydwid);
		super.addActionData("name",name);
		return SUCCESS;
	}
	//获取用户关联的使用单位
	public String getSydwListByUser(){
		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		if(super.checkParam(user.getShiyongdanwei_id())){
			String hql = "from TSyUtils where id in ("+user.getShiyongdanwei_id()+")";
			List<TSyUtils> list = zuoyeService.findListByHql(hql);
			super.addActionData("sydwlist", list);
		}
		return SUCCESS;
	}
	
	public String getDicDate(String code){
		String values = "";
		String query = "from TDicData s where s.typeId = (select t.id from TDicType t where t.code = '"+code+"')";
		List<TDicData> list = zuoyeService.findListByHql(query);
		for(TDicData se : list){
			values += se.getName()+",";
		}
		if(!"".equals(values)){
			values = values.substring(0,values.length()-1);
		}
		return values;
	}
	
	
	/**
	 * 导入许可证信息和人员信息
	 * @throws IOException 
	 * 
	 * @throws Exception
	 */
	public void xkzImp() throws IOException {
		String sydwid = super.getParameter("sydwid");
		HttpServletResponse response = getResponse();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		try {
			// 上传的Excel
			Workbook wb = Workbook.getWorkbook(file);

			// String flag = seService.ReadExcel(wb);
			// response.getWriter().print(flag);
			Object[] obj = new Object[wb.getSheet(0).getRow(2).length];
			String errorMsg = zuoyeService.ReadExcelForXkz(wb, obj,user,file,fileFileName,sydwid);
			response.getWriter()
					.print("".equals(errorMsg) ? "导入成功！" : errorMsg);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			try {
				response.getWriter().print("导入失败");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			e1.printStackTrace();
		} catch (BiffException e) {
			// TODO Auto-generated catch block
			response.getWriter().print("导入失败");
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//下载导入模板
    public void downloadFile() throws IOException{
    	String path = super.getParameter("path");
    	path = URLDecoder.decode(path, "utf-8");
    	if(path.contains(".xls")){
    		String fileName = path.substring(path.lastIndexOf("/")+1,path.lastIndexOf("."));
        	fileName += path.substring(path.lastIndexOf("."));
        	path = ServletActionContext.getRequest().getRealPath("")+path;
        	File file = new File(path); 
        	if(file.exists()) { 
        		super.getResponse().setContentType("application/x-msdownload"); 
        		super.getResponse().addHeader("Content-Disposition", "attachment; filename=\"" 
        				+ new String( fileName.getBytes("gb2312"), "ISO8859-1" ) + "\""); 
    	    	InputStream inputStream = new FileInputStream(file); 
    	    	BufferedInputStream bis = new BufferedInputStream(inputStream); 
    	
    	    	byte[] bytes = new byte[1024]; 
    	
    	    	ServletOutputStream outStream = super.getResponse().getOutputStream(); 
    	    	BufferedOutputStream bos = new BufferedOutputStream(outStream); 
    	    	int readLength = 0; 
    	    	while((readLength = bis.read(bytes)) != -1) { 
    	    		bos.write(bytes, 0, readLength); 
    	    	} 
    	    	inputStream.close(); 
    	    	bis.close(); 
    	    	bos.flush(); 
    	    	outStream.close(); 
    	    	bos.close(); 
        	}
    	}
    	
    }
	
}
