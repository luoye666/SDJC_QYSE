package com.stone.biz.utils.action;

import com.stone.biz.utils.pojo.TEnterpriseInspect;
import com.stone.biz.utils.pojo.TSyUtils;
import com.stone.biz.utils.pojo.TUseDataNum;
import com.stone.biz.utils.service.UtilsCommonService;
import com.stone.para.IConstant;
import com.stone.support.SupportAction;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TUser;
import frm.ssh.exception.AppException;

import javax.servlet.ServletOutputStream;
import java.io.*;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

public class SyUtilsAction extends SupportAction {
	private UtilsCommonService myService;
	private TSyUtils entity;
	private String id;
	private File updFile;
	private String updFileFileName;
	private TEnterpriseInspect inspect;

	public String openDwInfo() throws AppException {
		TSyUtils oldsy = new  TSyUtils();
		entity = (TSyUtils)myService.findById(Long.parseLong(id),TSyUtils.class.getName());
		String hql = "from TSyUtils where tmpData = '1' and pid = '"+entity.getId()+"' order by id desc";
		List<TSyUtils> list = myService.findListByHql(hql);
		if(list.size()>0){//待办区有正在修改的数据
			oldsy = list.get(0);
		}else{
			oldsy = entity;
		}
		if(null != entity.getFujian()){
			entity.setFujian(entity.getFujian().replace("\\","/"));
		}
		setReqestAttribute("entityOld", oldsy);
		List<TDicData> dataList = getDataListByCodeAndValue("SD_XZQH");
		super.setReqestAttribute("dataList",dataList);
		return "OPEN_SYDW_SUCCESS";
	}
	public String openBianGengInfo(){
		entity = (TSyUtils)myService.findById(Long.parseLong(id),TSyUtils.class.getName());
		List<TDicData> dataList = getDataListByCodeAndValue("SD_XZQH");
		super.setReqestAttribute("dataList",dataList);
		return "OPEN_BIANGENG_SUCCESS";
	}

	public String save() throws AppException, IOException {
		String tjstate = super.getParameter("tjstate");
		entity.setShi(myService.getNameByCode(entity.getShidaima()));
		entity.setQuxian(myService.getNameByCode(entity.getQuxiandaima()));
		entity.setXiangzhen(myService.getNameByCode(entity.getXiangzhendaima()));
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		String msg = this.myService.updateSydw(this.entity,tjstate,user,updFile,updFileFileName);
		super.addActionData("msg",msg);
		return SUCCESS;
	}

	/**
	 * 删除使用单位
	 * @return
	 * @throws AppException
	 */
	public String delete() throws AppException {
		String ids = super.getParameter("ids");
		String str = this.myService.doDelete(ids);
		super.addActionData("result", str);
		return SUCCESS;
	}
	public String verifyByDwmc() throws UnsupportedEncodingException{
		String dwid = super.getParameter("dwid");
		String dwmc = super.getParameter("dwmc");
		dwmc = URLDecoder.decode(dwmc,"utf-8");
		String shi = super.getParameter("shi");
		String quxian = super.getParameter("quxian");
		String xiangzhen = super.getParameter("xiangzhen");
		int count = myService.verifyByDwmcToSy(dwid,dwmc,shi,quxian,xiangzhen);
		super.addActionData("result", count);
		return SUCCESS;
	}

	//获取全部的区划
	public List<TDicData> getDataListByCodeAndValue(String qpCode){
		String query = "from TDicType type where type.code ='" + qpCode+"'";
		List<TDicData> datalist = new ArrayList<TDicData>();
		List<TDicType> typelist = myService.findListByHql(query);
		if(typelist.size()>0){
			TDicType typeOne=new TDicType();
			typeOne=typelist.get(0);
			String dataquery = "from TDicData data where data.typeId = "+typeOne.getId();
			datalist = myService.findListByHql(dataquery);
		}
		return datalist;
	}
	/**
	 * 批量修改区县
	 * @return
	 */
	public String updPLQX(){
		//使用单位
		String sydwid = super.getParameter("sydwids");
		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		TOrgan organ = (TOrgan)getSession().getAttribute(IConstant.SESSION_TORGAN);
		String dwmc = myService.updPLQX(sydwid,entity,user,organ);
		
		addActionData("dwmc", dwmc );
		return SUCCESS;
	}
	//获取单位的坐标
	public String getZuobiao(){
		String id = super.getParameter("id");
		String[] zuobiao = new String[]{"","","false","9"};// 0 经度 1 纬度 2 是否需要描点 3 缩放级别
		myService.getZuobiao(id,zuobiao);
		super.addActionData("jingdu", zuobiao[0]).addActionData("weidu",zuobiao[1]).addActionData("sfmd",zuobiao[2]).addActionData("sfjb",zuobiao[3]);
		return SUCCESS;
	}
	//保存标注
	public String saveBz(){
		String id = super.getParameter("id");
		String jingdu = super.getParameter("jingdu");
		String weidu = super.getParameter("weidu");
		myService.saveBz(id,jingdu,weidu);
		return SUCCESS;
	}
	//单位账号使用单位变更信息资料下载附件
    public void downloadFileBySydw() throws IOException{
    	String id = super.getParameter("id");
    	TSyUtils sy = (TSyUtils)myService.findById(Long.parseLong(id),TSyUtils.class.getName());
    	String path = sy.getFujian();
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
     * 根据社会组织统一信用代码拉取使用单位信息
     *
     * @return 返回接口运行状态及其查询结果
     */
    public String findSydwBaseByXydm() {
        String xydm = super.getParameter("xydm");
        String dwmc = super.getParameter("dwmc");
        super.addActionData("dwMap", myService.findSydwBaseByXydm(xydm, dwmc));
        return SUCCESS;
    }
    
    
    /**
     * 保存企业自查信息
     * @return
     */
    public String saveEnterpriseInspect(){
    	TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
    	
    	inspect.setLoginId(user.getLoginId());
    	inspect.setCreateTime(new Date());
    	
    	String msg = this.myService.saveEnterpriseInspect(inspect,updFile,updFileFileName);
    	super.addActionData("msg",msg);
    	return SUCCESS;
    }
    
    
    /**
     * 更新企业自查信息
     * @return
     */
    public String updateEnterpriseInspect(){
    	
    	String msg = this.myService.updateEnterpriseInspect(this.inspect,updFile,updFileFileName);
    	super.addActionData("msg",msg);
    	return SUCCESS;
    }
    
    public String findEnterpriseInspect(){
    	String id = super.getParameter("id");
    	
    	inspect = (TEnterpriseInspect) myService.findById(Long.parseLong(id), TEnterpriseInspect.class.getName());

        TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
        if (!Objects.equals(inspect.getLoginId(), user.getLoginId())) {
            return "OPEN_INSPECT_ERROR";
        }

    	return "OPEN_INSPECT_SUCCESS";
    }

    /**
     * 保存企业学习次数及记录
     * @return
     */
    public String saveUseDataNum(){
    	TUser user =  (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
    	String type = super.getParameter("type");
    	
    	String hql = " from TUseDataNum n where n.loginId = '"+user.getLoginId()+"' and n.type = '"+type+"' ";
    	List<TUseDataNum> dataNumList = myService.findListByHql(hql);
    	if(dataNumList.size() > 0){
    		TUseDataNum dataNum = dataNumList.get(0);
    		dataNum.setNum(dataNum.getType()+1);
    		myService.update(dataNum);
    	}else{
    		TUseDataNum dataNum = new TUseDataNum();
    		dataNum.setName(user.getName());
    		dataNum.setLoginId(user.getLoginId());
    		dataNum.setType(Integer.parseInt(type));
    		dataNum.setNum(1);
    		myService.save(dataNum);
    	}
    	
    	return SUCCESS;
    }
	
	
	public void setMyService(UtilsCommonService myService) {
		this.myService = myService;
	}

	public TSyUtils getEntity() {
		return this.entity;
	}

	public void setEntity(TSyUtils entity) {
		this.entity = entity;
	}

	public File getUpdFile() {
		return updFile;
	}

	public void setUpdFile(File updFile) {
		this.updFile = updFile;
	}

	public String getUpdFileFileName() {
		return updFileFileName;
	}

	public void setUpdFileFileName(String updFileFileName) {
		this.updFileFileName = updFileFileName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public TEnterpriseInspect getInspect() {
		return inspect;
	}
	public void setInspect(TEnterpriseInspect inspect) {
		this.inspect = inspect;
	}

	
}
