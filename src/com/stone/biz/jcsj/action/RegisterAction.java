package com.stone.biz.jcsj.action;

/**
 * <pre>
 *  已注册设备  Action
 * @author 
 * </pre>
 */

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.atomic.AtomicReference;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;


import jxl.Workbook;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import cn.hutool.core.io.FileUtil;

import com.stone.biz.jcsj.pojo.TBaseInfo;
import com.stone.biz.jcsj.pojo.TBaseInfoSearch;
import com.stone.biz.jcsj.pojo.TBoilerParam;
import com.stone.biz.jcsj.pojo.TCraneParam;
import com.stone.biz.jcsj.pojo.TElevatorParam;
import com.stone.biz.jcsj.pojo.TFssbBean;
import com.stone.biz.jcsj.pojo.TFujianfuji;
import com.stone.biz.jcsj.pojo.TGuandaoxiangmu;
import com.stone.biz.jcsj.pojo.TPressureVesselsParam;
import com.stone.biz.jcsj.pojo.TQpzcdj;
import com.stone.biz.jcsj.pojo.TRegister;
import com.stone.biz.jcsj.pojo.TRegisterParam;
import com.stone.biz.jcsj.pojo.TRegister_CYQP_XINXI;
import com.stone.biz.jcsj.pojo.TRegister_GL_HZB;
import com.stone.biz.jcsj.pojo.TRegister_QP_HZB;
import com.stone.biz.jcsj.pojo.TRegister_YLGD_HZB;
import com.stone.biz.jcsj.service.RegisterService;
import com.stone.para.IConstant;
import com.stone.support.SupportAction;
import com.stone.support.utils.CopyUtils;
import com.stone.support.utils.DateFormatTool;
import com.stone.support.utils.Resources;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TSeDirectory;
import com.stone.sys.pojo.TUser;
import com.stone.utils.seq.SeqUtil;

import frm.ssh.exception.AppException;

@SuppressWarnings("serial")
public class RegisterAction extends SupportAction {

	private RegisterService regService;
	private TRegisterParam register;
	private TRegister reg;
	private File uploadify;
	private File file;
	private String fileFileName;
	private String uploadifyFileName;
	private TFssbBean fssbBean;
	private List<TRegister_YLGD_HZB> ylgd_hzb_list;
	private List<TRegister_CYQP_XINXI> cyqp_xx_list;
	private List<TRegister_QP_HZB> qp_hzb_list;
	private List<TFujianfuji> fjfj_list;
	private List<TRegister_GL_HZB> gl_hzb_list;

	//保存
	public String save(){
		TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
		if("气瓶".equals(register.getShebeizhonglei())){
			if("车用气瓶".equals(register.getShebeileibie())){
				regService.saveCYQP(register,user,cyqp_xx_list,fjfj_list);
			}else{
				regService.saveQP(register,user,qp_hzb_list);
			}
		}else if("压力管道".equals(register.getShebeizhonglei())){
			regService.saveYlgd(register,user,ylgd_hzb_list);
		}else if("锅炉".equals(register.getShebeizhonglei())){
			regService.saveGl(register,user,gl_hzb_list,fjfj_list,ylgd_hzb_list);
		}else{
			regService.saveReg(register,user,fjfj_list);
		}
		super.addActionData("id",register.getId()).addActionData("sydw", register.getShiyongdanwei());
		return SUCCESS;
	}
	
	/**
	 * 更新
	 * 
	 * @return
	 * @throws AppException
	 * @throws IOException 
	 */
	public String update() throws AppException, IOException {
		String tjstate = super.getParameter("tjstate");
		if("气瓶".equals(register.getShebeizhonglei())){
			if("车用气瓶".equals(register.getShebeileibie())){
				regService.updateCYQP(register,cyqp_xx_list);
			}else{
				regService.updateQP(register,qp_hzb_list);
			}
		}else if("压力管道".equals(register.getShebeizhonglei())){
			regService.updateGD(register,ylgd_hzb_list);
		}else if("锅炉".equals(register.getShebeizhonglei())){
			regService.updateGL(register,gl_hzb_list,ylgd_hzb_list);
		}

		if(register.getShiyongdanweidizhi_qu_daima() != null && register.getShiyongdanweidizhi_qu_daima().length() > 0){
			regService.updateReg(register,fjfj_list);
			//上传附件
			String msg = regService.uploadFj(register,uploadify,uploadifyFileName,tjstate);
			super.addActionData("msg", msg).addActionData("fjpath", null == register.getFj_filepath() ? "" : register.getFj_filepath());
		}else{
			super.addActionData("msg", "请选择区县");
		}
		
		return SUCCESS;
	}

	/**
	 * 删除
	 * 
	 * @return
	 * @throws AppException
	 */
	@SuppressWarnings("unchecked")
	public String deleteByIds() throws AppException {
		String ids = super.getParameter("ids");
		regService.delByIds(ids);
		return SUCCESS;
	}
	//新建登记表
	public String addZcdjb(){
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		String result = "";
		register = new TRegisterParam();
		String gzid = super.getParameter("gzid");
		String zldm = super.getParameter("zldm");
		String cpbh = super.getParameter("cpbh");
		String sydwid = super.getParameter("sydwid");
		super.setReqestAttribute("lblist", getDataListByParentCode(zldm));
		super.setReqestAttribute("gzid", gzid);
		if("1000".equals(zldm)){
			result = "ADD_GL_ZCDJB_SUCCESS";
		}else if("2000".equals(zldm)){
			result = "ADD_YLRQ_ZCDJB_SUCCESS";
		}else if("3000".equals(zldm)){
			super.setReqestAttribute("dtCpsjblist", regService.getDataListByTypeCode("DT_ZCDJ_CPSJB_LB"));
			result = "ADD_DT_ZCDJB_SUCCESS";
		}else if("4000".equals(zldm)){
			result = "ADD_QZJX_ZCDJB_SUCCESS";
		}else if("5000".equals(zldm)){
			result = "ADD_CNC_ZCDJB_SUCCESS";
		}else if("6000".equals(zldm)){
			result = "ADD_YLSS_ZCDJB_SUCCESS";
		}else if("8000".equals(zldm)){
			result = "ADD_YLGD_ZCDJB_SUCCESS";
		}else if("9000".equals(zldm)){
			super.setReqestAttribute("kysdCpsjblist", regService.getDataListByTypeCode("KYSD_ZCDJ_CPSJB_LB"));
			result = "ADD_KYSD_ZCDJB_SUCCESS";
		}else if("Q000".equals(zldm)){
			result = "ADD_QP_ZCDJB_SUCCESS";
		}else if("Q100".equals(zldm)){
			result = "ADD_CYQP_ZCDJB_SUCCESS";
		}
		//如果产品编号不为空，则提取告知信息
		if(super.checkParam(cpbh)){
			regService.getGaozhiInfo(cpbh,register,zldm);
		}
		regService.getInitInfo(register,sydwid,user.getId());
		return result;
	}
	//打开登记表
	public String openZcdjbById(){
		String result = "";
		String id = super.getParameter("id");
		String zldm = super.getParameter("zldm");
		register = (TRegisterParam)regService.findById(Long.parseLong(id),TRegisterParam.class.getName());
		super.getRequest().setAttribute("pzlist", getDataListByParentCode(register.getShebeileibiedaima()));
		super.getRequest().setAttribute("lblist", getDataListByParentCode(zldm));
		super.setReqestAttribute("fjfjList", regService.getFjfjList(register.getId()));

		if("1000".equals(register.getShebeizhongleidaima())){
			super.setReqestAttribute("glhzbList", regService.getListByGlHzb(register.getId().toString()));
			super.setReqestAttribute("gdhzbList", regService.getListByYlgdHzb(register.getId().toString()));
			result = "OPEN_GL_ZCDJB_SUCCESS";
		}else if("2000".equals(register.getShebeizhongleidaima())){
			result = "OPEN_YLRQ_ZCDJB_SUCCESS";
		}else if("3000".equals(register.getShebeizhongleidaima())){
			result = "OPEN_DT_ZCDJB_SUCCESS";
		}else if("4000".equals(register.getShebeizhongleidaima())){
			result = "OPEN_QZJX_ZCDJB_SUCCESS";
		}else if("5000".equals(register.getShebeizhongleidaima())){
			result = "OPEN_CNC_ZCDJB_SUCCESS";
		}else if("6000".equals(register.getShebeizhongleidaima())){
			result = "OPEN_YLSS_ZCDJB_SUCCESS";
		}else if("8000".equals(zldm)){
			super.setReqestAttribute("hzbList", regService.getListByYlgdHzb(register.getId().toString()));
			result = "OPEN_YLGD_ZCDJB_SUCCESS";
		}else if("9000".equals(register.getShebeizhongleidaima())){
			result = "OPEN_KYSD_ZCDJB_SUCCESS";
		}else if("Q000".equals(zldm)){
			if("Q100".equals(register.getShebeileibiedaima())){
				super.setReqestAttribute("qpxxList", regService.getListByCyqpXx(register.getId().toString()));
				result = "OPEN_CYQP_ZCDJB_SUCCESS";
			}else{
				super.setReqestAttribute("hzbList", regService.getListByQpHzb(register.getId().toString()));
				result = "OPEN_QP_ZCDJB_SUCCESS";
			}
		}
		
		if(null != register.getFj_filepath() && !"".equals(register.getFj_filepath()) && !"null".equals(register.getFj_filepath())){
			register.setFj_filepath(register.getFj_filepath().replace("\\","/"));
		}
		return result;
	}

	/**
	 * By Id
	 * 
	 * @return
	 * @throws AppException
	 */
	public String getById() throws Exception {
		String id = super.getParameter("id");
		register = (TRegisterParam)regService.findById(Long.parseLong(id),TRegisterParam.class.getName());
		super.addActionData("register", register);
		return SUCCESS;
	}
	
	//打印
	public String djbDyByJsp(){
		String result = "";
		String id = super.getParameter("id");
		reg = (TRegisterParam)regService.findById(Long.parseLong(id),TRegisterParam.class.getName());
		super.setReqestAttribute("fjfjList", regService.getFjfjList(reg.getId()));
		if("1000".equals(reg.getShebeizhongleidaima())){
			super.setReqestAttribute("glhzbList", regService.getListByGlHzb(reg.getId().toString()));
			super.setReqestAttribute("hzbList", regService.getListByYlgdHzb(reg.getId().toString()));
			result = "GL_ZCDJB_DY";
		}else if("2000".equals(reg.getShebeizhongleidaima())){
			result = "YLRQ_ZCDJB_DY";
		}else if("3000".equals(reg.getShebeizhongleidaima())){
			result = "DT_ZCDJB_DY";
		}else if("4000".equals(reg.getShebeizhongleidaima())){
			result = "QZJX_ZCDJB_DY";
		}else if("5000".equals(reg.getShebeizhongleidaima())){
			result = "CNC_ZCDJB_DY";
		}else if("6000".equals(reg.getShebeizhongleidaima())){
			result = "YLSS_ZCDJB_DY";
		}else if("8000".equals(reg.getShebeizhongleidaima())){
			super.setReqestAttribute("hzbList", regService.getListByYlgdHzb(reg.getId().toString()));
			result = "YLGD_ZCDJB_DY";
		}else if("9000".equals(reg.getShebeizhongleidaima())){
			result = "KYSD_ZCDJB_DY";
		}else if("Q000".equals(reg.getShebeizhongleidaima())){
			if("Q100".equals(reg.getShebeileibiedaima())){
				super.setReqestAttribute("qpxxList", regService.getListByCyqpXx(reg.getId().toString()));
				result = "CYQP_ZCDJB_DY";
			}else{
				super.setReqestAttribute("hzbList", regService.getListByQpHzb(reg.getId().toString()));
				result = "QP_ZCDJB_DY";
			}
		}
		return result;
	}
	//打印使用登记证
	public String sydjzDyByJsp(){
		String djbid = super.getParameter("id");
		reg = (TRegister)regService.findById(Long.parseLong(djbid),TRegister.class.getName());
		if("1000".equals(reg.getShebeizhongleidaima())){
			return "GL_SYDJZ_DY";
		}else if("2000".equals(reg.getShebeizhongleidaima())){
			return "YLRQ_SYDJZ_DY";
		}else if("3000".equals(reg.getShebeizhongleidaima())){
			return "DT_SYDJZ_DY";
		}else if("4000".equals(reg.getShebeizhongleidaima())){
			return "QZJX_SYDJZ_DY";
		}else if("5000".equals(reg.getShebeizhongleidaima())){
			return "CNC_SYDJZ_DY";
		}else if("8000".equals(reg.getShebeizhongleidaima())){
			return "YLGD_SYDJZ_DY";
		}
		return "";
	}
	//附件辅机
	public List<TFujianfuji> getListByFujian(String id){
		String query = "from TFujianfuji app where djbid = '"+id+"'";
		String order = " order by app.id";
		List<TFujianfuji> list = regService.findListByHql(query + order);
		return list;
	}

	/**
	 * 导入注册登记表
	 * 
	 * @throws Exception
	 */
	public void registerImp() {
		HttpServletResponse response = getResponse();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		TOrgan organ = (TOrgan)getSession().getAttribute(IConstant.SESSION_TORGAN);
		String gzid = super.getParameter("gzid");
		
		try {
			// 上传的Excel
			Workbook wb = Workbook.getWorkbook(file);

			Object[] obj = new Object[wb.getSheet(0).getRow(2).length];
			String errorMsg = regService.ReadExcelForDjb(wb, obj,user,file,fileFileName,gzid,organ);
			String result = "{\"success\":true,\"msg\":\""+errorMsg+"\"}";
			response.getWriter().print(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				response.getWriter().print("上传失败");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}


	// 根据代码获取设备种类名称
	public String getNameByCode(String code) {
		String hql = "from TSeDirectory s where s.daima = '" + code + "'";
		TSeDirectory dire = (TSeDirectory) regService.findListByHql(hql).get(0);
		String name = dire.getMingcheng();
		// System.out.println("name="+name);
		return name;
	}

	// 根据代码获取设备区划名称
	public String getQHNameByCode(String code) {
		String hql = "from TDicData s where s.code = '" + code + "'";
		TDicData dire = (TDicData) regService.findListByHql(hql).get(0);
		String name = dire.getName();
		return name;
	}
	//验证注册代码和单位
	public String verifyByDwmcOrZcdm() throws UnsupportedEncodingException{
		String dwmc = super.getParameter("dwmc");
		String result = regService.verifyByDwmcOrZcdm(dwmc);
		super.addActionData("result", result);
		return SUCCESS;
	}
	//根据父级字典名称获取子级字典
	public List<TSeDirectory> getDataListByParentCode(String code){
		String query = "from TSeDirectory s where s.parentId = (select t.id from TSeDirectory t where t.daima = '"+code+"' AND rownum = 1)";
		List<TSeDirectory> list = this.regService.findListByHql(query);
		return list;
	}
	//根据类别获取品种
	public String getPzListByLbCode() throws IOException{
		String pz = "";
		String code = super.getParameter("code");
		String query = "from TSeDirectory s where s.parentId = (select t.id from TSeDirectory t where t.daima = '"+code+"' AND rownum = 1)";
		List<TSeDirectory> list = this.regService.findListByHql(query);
		for(TSeDirectory se : list){
			pz += se.getDaima()+":"+se.getMingcheng()+",";
		}
		if(!"".equals(pz)){
			pz = pz.substring(0,pz.length()-1);
		}
		super.getResponse().getWriter().print(pz);
		return null;
	}
	
	/**
	 * 注册表复制方法
	 * @return
	 */
	public String doRegisterCopy(){
		String id = super.getParameter("id");
		String num = super.getParameter("shuliang");
		
		regService.doRegisterCopy(id, num);
		
		return SUCCESS;
	}
	
	/**
	 * 删除注册登记信息
	 * 只能删除未提交的设备信息
	 * @return
	 */
	public String delRegInfo(){
		String ids = super.getParameter("ids");
		
		regService.delRegInfo(ids);
		
		return SUCCESS;
	}
	
	
	
	/**
	 * 
	 * 注册登记批量提交
	 * @return
	 * @throws AppException
	 * @throws IOException 
	 */
	public String updateTj() {
		String msg = "";
		String ids = super.getParameter("ids");
		String hql = " from TRegisterParam t where "; 
		List<TRegisterParam> regList = regService.findListByIds(ids, TRegisterParam.class);
		for(TRegisterParam reg : regList){ 
			String seHql = " from TBaseInfoSearch t where t.tmpData = '0' and ( t.zcstatus = '1' or t.zcstatus ='3' ) " +
					" and t.zhucedaima = '"+reg.getZhucedaima().trim()+"' ";
			List<TBaseInfoSearch> seList = regService.findListByHql(seHql);
			if(seList.size() > 0){
				msg += "注册代码为："+reg.getZhucedaima()+"设备重复，请查设备总数";
			}else{
				try {
					regService.updSeInfo(reg,"1");
					reg.setTjstate("1");
					regService.update(reg);
				} catch (Exception e) {
					reg.setTjstate("0");
					regService.update(reg);
					msg += "注册代码为："+reg.getZhucedaima()+"提交失败，请查看参数或联系客服";
				}
			}
			
		}
		
		super.addActionData("msg", msg);
		return SUCCESS;
	}

	//单位账号注册登记资料下载附件
    public void downloadFileByDwzcdj() throws IOException{
    	String id = super.getParameter("id");
    	TRegister rg = (TRegister)regService.findById(Long.parseLong(id),TRegister.class.getName());
    	String path = rg.getFj_filepath();
    	String fileName = path.substring(path.lastIndexOf("\\")+1,path.lastIndexOf("_"));
    	fileName += path.substring(path.lastIndexOf("."));
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
    
    /**
	 * 上传附件
	 * @return
	 */
	public String addFujian(){
		String id = super.getParameter("id");
		String msg = regService.addFujian(id,uploadify,uploadifyFileName);
		super.addActionData("msg", msg);
		return SUCCESS;
	}
	
	/**
	 * 使用登记附件分类上传
	 * @return
	 */
	public String addFeiLeiFujian(){
		
		String id = super.getParameter("id");
		String name = super.getParameter("leibie");
		String msg = regService.addFujian(id, file, fileFileName,name);
		super.addActionData("msg", msg);
		return SUCCESS;
	}
	
	/**
	 * 查找分类上传的附件
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findFeiLeiFujian(){
		String id = super.getParameter("id");
		List<HashMap<String, Object>> registerFileList = regService.findListBySql("select file_name,file_path from biz_register_file where djb_id = "+id+" ");
		//List<TRegisterFile> registerFileList = regService.findListByHql(" from TRegisterFile where djb_id ="+id); 
		super.addActionData("registerFileList", registerFileList);
		return SUCCESS;
	}
	
	
	/**
	 * 打印使用标志和登记证（PDF）
	 * 
	 * @return
	 * @throws Exception
	 */
	public String printReg() throws Exception {
		AtomicReference<String> id = new AtomicReference<String>(super.getParameter("id"));
		AtomicReference<String> type = new AtomicReference<String>(super.getParameter("type"));


		// 生成Pdf文件路径
		AtomicReference<String> pdfPath = new AtomicReference<String>("E:/SDJC/pdf/reg/" + type.get() + "/"
				+ type.get() + "_" + id + ".pdf");
		if (FileUtil.exist(pdfPath.get())) {
			super.addActionData("url", pdfPath.get().replaceAll("E:/SDJC/pdf", "asdf"));
		}else{
			super.addActionData("url", "");
		}

		return SUCCESS;
	}

	public File getUploadify() {
		return uploadify;
	}

	public void setUploadify(File uploadify) {
		this.uploadify = uploadify;
	}

	public TRegisterParam getRegister() {
		return register;
	}

	public void setRegister(TRegisterParam register) {
		this.register = register;
	}

	public void setRegService(RegisterService regService) {
		this.regService = regService;
	}

	public String getUploadifyFileName() {
		return uploadifyFileName;
	}

	public void setUploadifyFileName(String uploadifyFileName) {
		this.uploadifyFileName = uploadifyFileName;
	}

	public TRegister getReg() {
		return reg;
	}

	public void setReg(TRegister reg) {
		this.reg = reg;
	}

	public TFssbBean getFssbBean() {
		return fssbBean;
	}

	public void setFssbBean(TFssbBean fssbBean) {
		this.fssbBean = fssbBean;
	}

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

	public List<TRegister_YLGD_HZB> getYlgd_hzb_list() {
		return ylgd_hzb_list;
	}

	public void setYlgd_hzb_list(List<TRegister_YLGD_HZB> ylgdHzbList) {
		ylgd_hzb_list = ylgdHzbList;
	}

	public List<TRegister_CYQP_XINXI> getCyqp_xx_list() {
		return cyqp_xx_list;
	}

	public void setCyqp_xx_list(List<TRegister_CYQP_XINXI> cyqpXxList) {
		cyqp_xx_list = cyqpXxList;
	}

	public List<TRegister_QP_HZB> getQp_hzb_list() {
		return qp_hzb_list;
	}

	public void setQp_hzb_list(List<TRegister_QP_HZB> qpHzbList) {
		qp_hzb_list = qpHzbList;
	}

	public List<TFujianfuji> getFjfj_list() {
		return fjfj_list;
	}

	public void setFjfj_list(List<TFujianfuji> fjfjList) {
		fjfj_list = fjfjList;
	}

	public List<TRegister_GL_HZB> getGl_hzb_list() {
		return gl_hzb_list;
	}

	public void setGl_hzb_list(List<TRegister_GL_HZB> glHzbList) {
		gl_hzb_list = glHzbList;
	}
	

}
