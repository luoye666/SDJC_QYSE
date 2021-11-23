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
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.stone.biz.jcsj.pojo.TBaseFile;
import com.stone.biz.jcsj.pojo.TBaseInfo;
import com.stone.biz.jcsj.pojo.TBaseInfoSearch;
import com.stone.biz.jcsj.pojo.TBoilerParam;
import com.stone.biz.jcsj.pojo.TCablewaysParam;
import com.stone.biz.jcsj.pojo.TCraneParam;
import com.stone.biz.jcsj.pojo.TElevatorParam;
import com.stone.biz.jcsj.pojo.TPressurePipingParam;
import com.stone.biz.jcsj.pojo.TPressureVesselsParam;
import com.stone.biz.jcsj.pojo.TQiPingParam;
import com.stone.biz.jcsj.pojo.TRecreationParam;
import com.stone.biz.jcsj.service.SECommonService;
import com.stone.biz.utils.pojo.TSyUtils;
import com.stone.para.IConstant;
import com.stone.support.SupportAction;
import com.stone.support.utils.CopyUtils;
import com.stone.support.utils.DateFormatTool;
import com.stone.sys.action.DicListAction;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TSeDirectory;
import com.stone.sys.pojo.TUser;

import frm.ssh.action.BaseAction;
import frm.ssh.exception.AppException;

@SuppressWarnings("serial")
public class SEAction extends SupportAction {

	private SECommonService seService;
	// private SEServiceImpl service;
	private TBaseInfo baseInfo;
	private TElevatorParam elevatorPraram;
	private File uploadify;
	private String uploadifyFileName;
	private TCraneParam craneParam;
	private TBoilerParam boilerParam;
	private TPressureVesselsParam pressureVesselsParam;
	private TPressurePipingParam piping;
	private TCablewaysParam cable;
	private TRecreationParam recreat;
	private TQiPingParam qiping;

	private File updFile;
	private String updFileFileName;
	private String id;
	private String note;

	/**
	 * 进入详细页面
	 * 
	 * @return
	 */
	public String openSbById(){
		String zldm = super.getParameter("zldm");
		String result = "";
		if("1000".equals(zldm)){
			boilerParam = (TBoilerParam)seService.findById(Long.parseLong(id),TBoilerParam.class.getName());
			//锅炉判断参数是否为空
			checkParamNull(boilerParam);
			TBoilerParam oldBoil = new TBoilerParam();
			String hql = "from TBoilerParam where tmpData = '1' and pid = '"+boilerParam.getId()+"' order by id desc";
			List<TBoilerParam> list = seService.findListByHql(hql);
			if(list.size()>0){//待办区有正在修改的数据
				oldBoil = list.get(0);
				checkParamNull(oldBoil);
			}else{
				oldBoil = boilerParam;
			}
			setReqestAttribute("boilerParamOld", oldBoil);
			result = "OPEN_GL_SE_SUCCESS";
		}else if("2000".equals(zldm)){
			pressureVesselsParam = (TPressureVesselsParam)seService.findById(Long.parseLong(id),TPressureVesselsParam.class.getName());
			if("".equals(pressureVesselsParam.getSzstatus()) || null == pressureVesselsParam.getSzstatus()){
				pressureVesselsParam.setSzstatus("0");
			}
			TPressureVesselsParam oldPre = new TPressureVesselsParam();
			String hql = "from TPressureVesselsParam where tmpData = '1' and pid = '"+pressureVesselsParam.getId()+"' order by id desc";
			List<TPressureVesselsParam> list = seService.findListByHql(hql);
			if(list.size()>0){//待办区有正在修改的数据
				if("".equals(list.get(0).getSzstatus()) || null == list.get(0).getSzstatus()){
					list.get(0).setSzstatus("0");
				}
				oldPre = list.get(0);
			}else{
				oldPre = pressureVesselsParam;
			}
			setReqestAttribute("pressureVesselsParamOld", oldPre);
			result = "OPEN_YLRQ_SE_SUCCESS";
		}else if("3000".equals(zldm)){
			elevatorPraram = (TElevatorParam)seService.findById(Long.parseLong(id),TElevatorParam.class.getName());
			if("".equals(elevatorPraram.getSzstatus()) || null == elevatorPraram.getSzstatus()){
				elevatorPraram.setSzstatus("0");
			}
			if("".equals(elevatorPraram.getShifou_renkoumijiqu()) || null == elevatorPraram.getShifou_renkoumijiqu()){
				elevatorPraram.setShifou_renkoumijiqu("");
			}
			if("".equals(elevatorPraram.getShifou_yingjifangan()) || null == elevatorPraram.getShifou_yingjifangan()){
				elevatorPraram.setShifou_yingjifangan("");
			}
			if("".equals(elevatorPraram.getShifou_zhongdaweixianyuan()) || null == elevatorPraram.getShifou_zhongdaweixianyuan()){
				elevatorPraram.setShifou_zhongdaweixianyuan("");
			}
			if("".equals(elevatorPraram.getShifou_zhongdianjiankong()) || null == elevatorPraram.getShifou_zhongdianjiankong()){
				elevatorPraram.setShifou_zhongdianjiankong("");
			}
			TElevatorParam oldEle = new TElevatorParam();
			String hql = "from TElevatorParam where tmpData = '1' and pid = '"+elevatorPraram.getId()+"' order by id desc";
			List<TElevatorParam> list = seService.findListByHql(hql);
			if(list.size()>0){//待办区有正在修改的数据
				if("".equals(list.get(0).getSzstatus()) || null == list.get(0).getSzstatus()){
					list.get(0).setSzstatus("0");
				}
				if("".equals(list.get(0).getShifou_renkoumijiqu()) || null == list.get(0).getShifou_renkoumijiqu()){
					list.get(0).setShifou_renkoumijiqu("");
				}
				if("".equals(list.get(0).getShifou_yingjifangan()) || null == list.get(0).getShifou_yingjifangan()){
					list.get(0).setShifou_yingjifangan("");
				}
				if("".equals(list.get(0).getShifou_zhongdaweixianyuan()) || null == list.get(0).getShifou_zhongdaweixianyuan()){
					list.get(0).setShifou_zhongdaweixianyuan("");
				}
				if("".equals(list.get(0).getShifou_zhongdianjiankong()) || null == list.get(0).getShifou_zhongdianjiankong()){
					list.get(0).setShifou_zhongdianjiankong("");
				}
				oldEle = list.get(0);
			}else{
				oldEle = elevatorPraram;
			}
			setReqestAttribute("elevatorPraramOld", oldEle);
			result = "OPEN_DT_SE_SUCCESS";
		}else if("4000".equals(zldm)){
			craneParam = (TCraneParam)seService.findById(Long.parseLong(id),TCraneParam.class.getName());
			if("".equals(craneParam.getSijishi()) || null == craneParam.getSijishi()){
				craneParam.setSijishi("0");
			}
			if("".equals(craneParam.getSzstatus()) || null == craneParam.getSzstatus()){
				craneParam.setSzstatus("0");
			}
			TCraneParam oldCr = new TCraneParam();
			String hql = "from TCraneParam where tmpData = '1' and pid = '"+craneParam.getId()+"' order by id desc";
			List<TCraneParam> list = seService.findListByHql(hql);
			if(list.size()>0){//待办区有正在修改的数据
				if("".equals(list.get(0).getSzstatus()) || null == list.get(0).getSzstatus()){
					list.get(0).setSzstatus("0");
				}
				if("".equals(list.get(0).getSijishi()) || null == list.get(0).getSijishi()){
					list.get(0).setSijishi("0");
				}
				oldCr = list.get(0);
			}else{
				oldCr = craneParam;
			}
			setReqestAttribute("craneParamOld", oldCr);
			result = "OPEN_QZJX_SE_SUCCESS";
		}else if("5000".equals(zldm)){
			craneParam = (TCraneParam)seService.findById(Long.parseLong(id),TCraneParam.class.getName());
			if("".equals(craneParam.getDonglifangshi()) || null == craneParam.getDonglifangshi()){
				craneParam.setDonglifangshi("0");
			}
			if("".equals(craneParam.getSzstatus()) || null == craneParam.getSzstatus()){
				craneParam.setSzstatus("0");
			}
			if("".equals(craneParam.getQudong()) || null == craneParam.getQudong()){
				craneParam.setQudong("0");
			}
			if("".equals(craneParam.getTuoguache()) || null == craneParam.getTuoguache()){
				craneParam.setTuoguache("0");
			}
			if("".equals(craneParam.getZuigaoshisu()) || null == craneParam.getZuigaoshisu()){
				craneParam.setZuigaoshisu("0");
			}
			if("".equals(craneParam.getDonglifangshi()) || null == craneParam.getDonglifangshi()){
				craneParam.setDonglifangshi("0");
			}
			
			TCraneParam oldCr = new TCraneParam();
			String hql = "from TCraneParam where tmpData = '1' and pid = '"+craneParam.getId()+"' order by id desc";
			List<TCraneParam> list = seService.findListByHql(hql);
			if(list.size()>0){//待办区有正在修改的数据
				if("".equals(list.get(0).getDonglifangshi()) || null == list.get(0).getDonglifangshi()){
					list.get(0).setDonglifangshi("0");
				}
				if("".equals(list.get(0).getSzstatus()) || null == list.get(0).getSzstatus()){
					list.get(0).setSzstatus("0");
				}
				if("".equals(list.get(0).getQudong()) || null == list.get(0).getQudong()){
					list.get(0).setQudong("0");
				}
				if("".equals(list.get(0).getTuoguache()) || null == list.get(0).getTuoguache()){
					list.get(0).setTuoguache("0");
				}
				if("".equals(list.get(0).getZuigaoshisu()) || null == list.get(0).getZuigaoshisu()){
					list.get(0).setZuigaoshisu("0");
				}
				if("".equals(list.get(0).getDonglifangshi()) || null == list.get(0).getDonglifangshi()){
					list.get(0).setDonglifangshi("0");
				}
				
				
				oldCr = list.get(0);
			}else{
				oldCr = craneParam;
			}
			setReqestAttribute("craneParamOld", oldCr);
			result = "OPEN_CNC_SE_SUCCESS";
		}else if("6000".equals(zldm)){
			recreat = (TRecreationParam)seService.findById(Long.parseLong(id),TRecreationParam.class.getName());
			if("".equals(recreat.getSzstatus()) || null == recreat.getSzstatus()){
				recreat.setSzstatus("0");
			}
			TRecreationParam oldRe = new TRecreationParam();
			String hql = "from TRecreationParam where tmpData = '1' and pid = '"+recreat.getId()+"' order by id desc";
			List<TRecreationParam> list = seService.findListByHql(hql);
			if(list.size()>0){//待办区有正在修改的数据
				if("".equals(list.get(0).getSzstatus()) || null == list.get(0).getSzstatus()){
					list.get(0).setSzstatus("0");
				}
				oldRe = list.get(0);
			}else{
				oldRe = recreat;
			}
			setReqestAttribute("recreatOld", oldRe);
			result = "OPEN_YLSS_SE_SUCCESS";
		}else if("8000".equals(zldm)){
			piping = (TPressurePipingParam)seService.findById(Long.parseLong(id),TPressurePipingParam.class.getName());
			if("".equals(piping.getSzstatus()) || null == piping.getSzstatus()){
				piping.setSzstatus("0");
			}
			if("".equals(piping.getZhongyaoguandao()) || null == piping.getZhongyaoguandao()){
				piping.setZhongyaoguandao("0");
			}
			TPressurePipingParam oldPr = new TPressurePipingParam();
			String hql = "from TPressurePipingParam where tmpData = '1' and pid = '"+piping.getId()+"' order by id desc";
			List<TPressurePipingParam> list = seService.findListByHql(hql);
			if(list.size()>0){//待办区有正在修改的数据
				if("".equals(list.get(0).getSzstatus()) || null == list.get(0).getSzstatus()){
					list.get(0).setSzstatus("0");
				}
				if("".equals(list.get(0).getZhongyaoguandao()) || null == list.get(0).getZhongyaoguandao()){
					list.get(0).setZhongyaoguandao("0");
				}
				oldPr = list.get(0);
			}else{
				oldPr = piping;
			}
			setReqestAttribute("pipingOld", oldPr);
			result = "OPEN_YLGD_SE_SUCCESS";
		}else if("9000".equals(zldm)){
			cable = (TCablewaysParam)seService.findById(Long.parseLong(id),TCablewaysParam.class.getName());
			if("".equals(cable.getSzstatus()) || null == cable.getSzstatus()){
				cable.setSzstatus("0");
			}
			if("".equals(cable.getYunzaicheliangxingshi()) || null == cable.getYunzaicheliangxingshi()){
				cable.setYunzaicheliangxingshi("0");
			}
			TCablewaysParam oldCa = new TCablewaysParam();
			String hql = "from TCablewaysParam where tmpData = '1' and pid = '"+cable.getId()+"' order by id desc";
			List<TCablewaysParam> list = seService.findListByHql(hql);
			if(list.size()>0){//待办区有正在修改的数据
				if("".equals(list.get(0).getSzstatus()) || null == list.get(0).getSzstatus()){
					list.get(0).setSzstatus("0");
				}
				if("".equals(list.get(0).getYunzaicheliangxingshi()) || null == list.get(0).getYunzaicheliangxingshi()){
					list.get(0).setYunzaicheliangxingshi("0");
				}
				oldCa = list.get(0);
			}else{
				oldCa = cable;
			}
			setReqestAttribute("cableOld", oldCa);
			result = "OPEN_KYSD_SE_SUCCESS";
		}else if("Q000".equals(zldm)){
			qiping = (TQiPingParam)seService.findById(Long.parseLong(id),TQiPingParam.class.getName());
			TQiPingParam oldQr = new TQiPingParam();
			String hql = "from TQiPingParam where tmpData = '1' and pid = '"+qiping.getId()+"' order by id desc";
			List<TQiPingParam> list = seService.findListByHql(hql);
			if(list.size()>0){//待办区有正在修改的数据
				oldQr = list.get(0);
			}else{
				oldQr = qiping;
			}
			setReqestAttribute("qipingOld", oldQr);
			if("Q100".equals(qiping.getShebeileibiedaima())){
				result = "OPEN_CYQP_SE_SUCCESS";
			}else{
				result = "OPEN_QP_SE_SUCCESS";
			}
		}
		setReqestAttribute("ptabsid", super.getParameter("pTabsId"));
		return result;
	}

	//判断锅炉参数是否为空
	public void checkParamNull(TBoilerParam bp){
		if("".equals(bp.getSzstatus()) || null == bp.getSzstatus()){
			bp.setSzstatus("0");
		}
		if(null == bp.getChengqu() || "".equals(bp.getChengqu())){
			bp.setChengqu("否");
		}
		if(null == bp.getChuchenzhuangzhi() || "".equals(bp.getChuchenzhuangzhi())){
			bp.setChuchenzhuangzhi("是");
		}
		if(null == bp.getFuhebiaozhun() || "".equals(bp.getFuhebiaozhun())){
			bp.setFuhebiaozhun("是");
		}
		if(null == bp.getNengxiaoceshi_dq() || "".equals(bp.getNengxiaoceshi_dq())){
			bp.setNengxiaoceshi_dq("是");
		}
		if(null == bp.getNengxiaoceshi_dx() || "".equals(bp.getNengxiaoceshi_dx())){
			bp.setNengxiaoceshi_dx("是");
		}
		if(null == bp.getRexiaolv_sheji() || "".equals(bp.getRexiaolv_sheji())){
			bp.setRexiaolv_sheji("是");
		}
		if(null == bp.getRexiaolv_shiji() || "".equals(bp.getRexiaolv_shiji())){
			bp.setRexiaolv_shiji("是");
		}
		if("".equals(bp.getShifou_renkoumijiqu()) || null == bp.getShifou_renkoumijiqu()){
			bp.setShifou_renkoumijiqu("");
		}
		if("".equals(bp.getShifou_yingjifangan()) || null == bp.getShifou_yingjifangan()){
			bp.setShifou_yingjifangan("");
		}
		if("".equals(bp.getShifou_zhongdaweixianyuan()) || null == bp.getShifou_zhongdaweixianyuan()){
			bp.setShifou_zhongdaweixianyuan("");
		}
		if("".equals(bp.getShifou_zhongdianjiankong()) || null == bp.getShifou_zhongdianjiankong()){
			bp.setShifou_zhongdianjiankong("");
		}
	}
	
	/**
	 * 保存
	 * 
	 * @return
	 * @throws AppException
	 */
	public String update() throws AppException {
		elevatorPraram.setShebeileibie(this.getNameByCode(elevatorPraram
				.getShebeileibiedaima()));
		elevatorPraram.setShebeipinzhong(this.getNameByCode(elevatorPraram
				.getShenbeipinzhongdaima()));
		elevatorPraram.setQuhuamingcheng(this.getQHNameByCode(elevatorPraram
				.getQuhuadaima()));
		seService.saveOrUpdate(elevatorPraram);
		return SUCCESS;
	}
	
	//修改信息
	public String updateByDT(){
		String tjstate = super.getParameter("tjstate");
		String address = super.getParameter("address");
		String dbid = super.getParameter("dbid");
		elevatorPraram.setShebeileibie(this.getNameByCode(elevatorPraram.getShebeileibiedaima()));
		elevatorPraram.setShebeipinzhong(this.getNameByCode(elevatorPraram.getShenbeipinzhongdaima()));
		elevatorPraram.setQuhuamingcheng(this.getQHNameByCode(elevatorPraram.getQuhuadaima()));
		elevatorPraram.setShi(getQHNameByCode(elevatorPraram.getShidaima()));
		elevatorPraram.setXiangzhen(getQHNameByCode(elevatorPraram.getXiangzhendaima()));
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		
		//验证使用单位是否存在
		TSyUtils syUtils = seService.createSYDW(elevatorPraram);
		elevatorPraram.setShiyongdanweiId(syUtils.getId());
		
		TElevatorParam oldEle = (TElevatorParam)seService.findById(elevatorPraram.getId(),TElevatorParam.class.getName());
		
		if(seService.findSJSH(elevatorPraram.getId().toString())){
			seService.updateByDT(elevatorPraram,tjstate,user,address,dbid,oldEle);
		}else{
			//当待审核数据存在此设备时，不允许重复提交到待审核数据
			super.addActionData("msg","notallow");
		}
		return SUCCESS;
	}

	/**
	 * 修改起重机的参数
	 * 
	 * @return
	 */
	public String updateCraneParam() {
		craneParam.setShebeileibie(this.getNameByCode(craneParam
				.getShebeileibiedaima()));
		craneParam.setShebeipinzhong(this.getNameByCode(craneParam
				.getShenbeipinzhongdaima()));
		craneParam.setQuhuamingcheng(this.getQHNameByCode(craneParam
				.getQuhuadaima()));
		seService.saveOrUpdate(craneParam);
		return SUCCESS;
	}
	/**
	 * 修改起重机的信息
	 * 
	 * @return
	 */
	public String updateByQZJX() {
		String tjstate = super.getParameter("tjstate");
		String address = super.getParameter("address");
		String dbid = super.getParameter("dbid");
		craneParam.setShebeileibie(this.getNameByCode(craneParam.getShebeileibiedaima()));
		craneParam.setShebeipinzhong(this.getNameByCode(craneParam.getShenbeipinzhongdaima()));
		craneParam.setQuhuamingcheng(this.getQHNameByCode(craneParam.getQuhuadaima()));
		craneParam.setShi(getQHNameByCode(craneParam.getShidaima()));
		craneParam.setXiangzhen(getQHNameByCode(craneParam.getXiangzhendaima()));
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		
		//验证使用单位是否存在
		TSyUtils syUtils = seService.createSYDW(craneParam);
		craneParam.setShiyongdanweiId(syUtils.getId());
		
		TCraneParam oldCra = (TCraneParam)seService.findById(craneParam.getId(),TCraneParam.class.getName());
		
		if(seService.findSJSH(craneParam.getId().toString())){
			seService.updateByQZJX(craneParam,tjstate,user,address,dbid,oldCra);
		}else{
			//当待审核数据存在此设备时，不允许重复提交到待审核数据
			super.addActionData("msg","notallow");
		}
		return SUCCESS;
	}
	/**
	 * 修改锅炉的信息
	 * 
	 * @return
	 */
	public String updateByGL() {
		String tjstate = super.getParameter("tjstate");
		String address = super.getParameter("address");
		String dbid = super.getParameter("dbid");
		boilerParam.setShebeileibie(this.getNameByCode(boilerParam.getShebeileibiedaima()));
		boilerParam.setShebeipinzhong(this.getNameByCode(boilerParam.getShenbeipinzhongdaima()));
		boilerParam.setShi(getQHNameByCode(boilerParam.getShidaima()));
		boilerParam.setQuhuamingcheng(this.getQHNameByCode(boilerParam.getQuhuadaima()));
		boilerParam.setXiangzhen(this.getQHNameByCode(boilerParam.getXiangzhendaima()));
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		
		TBoilerParam oldBoil = (TBoilerParam)seService.findById(boilerParam.getId(),TBoilerParam.class.getName());
		
		//验证使用单位是否存在
		TSyUtils syUtils = seService.createSYDW(boilerParam);
		boilerParam.setShiyongdanweiId(syUtils.getId());
		
		if(seService.findSJSH(boilerParam.getId().toString())){
			seService.updateByGL(boilerParam,tjstate,user,address,dbid,oldBoil);
		}else{
			//当待审核数据存在此设备时，不允许重复提交到待审核数据
			super.addActionData("msg","notallow");
		}
		return SUCCESS;
	}

	/**
	 * 修改锅炉
	 * 
	 * @return
	 */
	public String updateBoilerParam() {
		boilerParam.setShebeileibie(this.getNameByCode(boilerParam
				.getShebeileibiedaima()));
		boilerParam.setShebeipinzhong(this.getNameByCode(boilerParam
				.getShenbeipinzhongdaima()));
		boilerParam.setQuhuamingcheng(this.getQHNameByCode(boilerParam
				.getQuhuadaima()));
		seService.saveOrUpdate(boilerParam);
		return SUCCESS;
	}

	/**
	 * 修改压力容器
	 * 
	 * @return
	 */
	public String updatePressureVesselsParam() {
		pressureVesselsParam.setShebeileibie(this
				.getNameByCode(pressureVesselsParam.getShebeileibiedaima()));
		pressureVesselsParam.setShebeipinzhong(this
				.getNameByCode(pressureVesselsParam.getShenbeipinzhongdaima()));
		pressureVesselsParam.setQuhuamingcheng(this
				.getQHNameByCode(pressureVesselsParam.getQuhuadaima()));
		seService.saveOrUpdate(pressureVesselsParam);
		return SUCCESS;
	}
	/**
	 * 修改压力容器信息
	 * 
	 * @return
	 */
	public String updateByYLRQ() {
		String tjstate = super.getParameter("tjstate");
		String address = super.getParameter("address");
		String dbid = super.getParameter("dbid");
		pressureVesselsParam.setShebeileibie(this.getNameByCode(pressureVesselsParam.getShebeileibiedaima()));
		pressureVesselsParam.setShebeipinzhong(this.getNameByCode(pressureVesselsParam.getShenbeipinzhongdaima()));
		pressureVesselsParam.setQuhuamingcheng(this.getQHNameByCode(pressureVesselsParam.getQuhuadaima()));
		pressureVesselsParam.setShi(getQHNameByCode(pressureVesselsParam.getShidaima()));
		pressureVesselsParam.setXiangzhen(getQHNameByCode(pressureVesselsParam.getXiangzhendaima()));
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		
		//验证使用单位是否存在
		TSyUtils syUtils = seService.createSYDW(pressureVesselsParam);
		pressureVesselsParam.setShiyongdanweiId(syUtils.getId());
		
		TPressureVesselsParam oldPre = (TPressureVesselsParam)seService.findById(pressureVesselsParam.getId(),TPressureVesselsParam.class.getName());
		
		if(seService.findSJSH(pressureVesselsParam.getId().toString())){
			seService.updateByYLRQ(pressureVesselsParam,tjstate,user,address,dbid,oldPre);
		}else{
			//当待审核数据存在此设备时，不允许重复提交到待审核数据
			super.addActionData("msg","notallow");
		}
		return SUCCESS;
	}
	/**
	 * 修改压力管道信息
	 * 
	 * @return
	 */
	public String updateByYLGD() {
		String tjstate = super.getParameter("tjstate");
		String address = super.getParameter("address");
		String dbid = super.getParameter("dbid");
		piping.setShebeileibie(this.getNameByCode(piping.getShebeileibiedaima()));
		piping.setShebeipinzhong(this.getNameByCode(piping.getShenbeipinzhongdaima()));
		piping.setQuhuamingcheng(this.getQHNameByCode(piping.getQuhuadaima()));
		piping.setShi(getQHNameByCode(piping.getShidaima()));
		piping.setXiangzhen(getQHNameByCode(piping.getXiangzhendaima()));
		
		//验证使用单位是否存在
		TSyUtils syUtils = seService.createSYDW(piping);
		piping.setShiyongdanweiId(syUtils.getId());
		
		TPressurePipingParam oldPi = (TPressurePipingParam)seService.findById(piping.getId(),TPressurePipingParam.class.getName());
		
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		
		if(seService.findSJSH(piping.getId().toString())){
			seService.updateByYLGD(piping,tjstate,user,address,dbid,oldPi);
		}else{
			//当待审核数据存在此设备时，不允许重复提交到待审核数据
			super.addActionData("msg","notallow");
		}
		return SUCCESS;
	}
	/**
	 * 修改气瓶信息
	 * 
	 * @return
	 */
	public String updateByQP() {
		String tjstate = super.getParameter("tjstate");
		String address = super.getParameter("address");
		String dbid = super.getParameter("dbid");
		qiping.setShebeileibie(this.getNameByCode(qiping.getShebeileibiedaima()));
		qiping.setShebeipinzhong(this.getNameByCode(qiping.getShenbeipinzhongdaima()));
		qiping.setQuhuamingcheng(this.getQHNameByCode(qiping.getQuhuadaima()));
		qiping.setShi(getQHNameByCode(qiping.getShidaima()));
		qiping.setXiangzhen(getQHNameByCode(qiping.getXiangzhendaima()));
		
		//验证使用单位是否存在
		TSyUtils syUtils = seService.createSYDW(qiping);
		qiping.setShiyongdanweiId(syUtils.getId());
		
		TQiPingParam oldQi = (TQiPingParam)seService.findById(qiping.getId(),TQiPingParam.class.getName());
		
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		seService.updateByQP(qiping,tjstate,user,address,dbid,oldQi);
		return SUCCESS;
	}
	/**
	 * 修改客运索道信息
	 * 
	 * @return
	 */
	public String updateByKYSD() {
		String tjstate = super.getParameter("tjstate");
		String address = super.getParameter("address");
		String dbid = super.getParameter("dbid");
		cable.setShebeileibie(this.getNameByCode(cable.getShebeileibiedaima()));
		cable.setShebeipinzhong(this.getNameByCode(cable.getShenbeipinzhongdaima()));
		cable.setQuhuamingcheng(this.getQHNameByCode(cable.getQuhuadaima()));
		cable.setShi(getQHNameByCode(cable.getShidaima()));
		cable.setXiangzhen(getQHNameByCode(cable.getXiangzhendaima()));
		
		//验证使用单位是否存在
		TSyUtils syUtils = seService.createSYDW(cable);
		cable.setShiyongdanweiId(syUtils.getId());
		
		TCablewaysParam oldCa = (TCablewaysParam)seService.findById(cable.getId(),TCablewaysParam.class.getName());
		
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		
		if(seService.findSJSH(cable.getId().toString())){
			seService.updateByKYSD(cable,tjstate,user,address,dbid,oldCa);
		}else{
			//当待审核数据存在此设备时，不允许重复提交到待审核数据
			super.addActionData("msg","notallow");
		}
		return SUCCESS;
	}
	/**
	 * 修改游乐设施信息
	 * 
	 * @return
	 */
	public String updateByYLSS() {
		String tjstate = super.getParameter("tjstate");
		String address = super.getParameter("address");
		String dbid = super.getParameter("dbid");
		recreat.setShebeileibie(this.getNameByCode(recreat.getShebeileibiedaima()));
		recreat.setShebeipinzhong(this.getNameByCode(recreat.getShenbeipinzhongdaima()));
		recreat.setQuhuamingcheng(this.getQHNameByCode(recreat.getQuhuadaima()));
		recreat.setShi(getQHNameByCode(recreat.getShidaima()));
		recreat.setXiangzhen(getQHNameByCode(recreat.getXiangzhendaima()));
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		
		//验证使用单位是否存在
		TSyUtils syUtils = seService.createSYDW(recreat);
		recreat.setShiyongdanweiId(syUtils.getId());

		TRecreationParam oldRe = (TRecreationParam)seService.findById(recreat.getId(),TRecreationParam.class.getName());
		
		if(seService.findSJSH(recreat.getId().toString())){
			seService.updateByYLSS(recreat,tjstate,user,address,dbid,oldRe);
		}else{
			//当待审核数据存在此设备时，不允许重复提交到待审核数据
			super.addActionData("msg","notallow");
		}
		return SUCCESS;
	}

	//验证单位是否存在
	public String verifyByDwmc() throws UnsupportedEncodingException{
		String dwmc = super.getParameter("dwmc");
		dwmc = URLDecoder.decode(dwmc, "utf-8");
		String hql = "from TSyUtils where dwmc = '"+dwmc+"'";
//		super.addActionData("res", seService.findListByHql(hql).size());
		return SUCCESS;
	}

	/**
	 * By Id
	 * 
	 * @return
	 * @throws AppException
	 */
	public String getById() throws Exception {
		String seid = super.getParameter("id");
		String zldm = super.getParameter("zldm");
		// System.out.println("查看电梯的设备信息 Id=="+seid);
		if (zldm.equals("1000")) {
			TBoilerParam seinfo = (TBoilerParam) seService.findById(Long
					.parseLong(seid), TBoilerParam.class.getName());
			
			// System.out.println("查看电梯的设备信息=="+seinfo.getShebeimingcheng());
	//		this.addActionData("se", seinfo);
		}
		if (zldm.equals("2000")) {
			TPressureVesselsParam seinfo = (TPressureVesselsParam) seService
					.findById(Long.parseLong(seid), TPressureVesselsParam.class
							.getName());
			// System.out.println("查看电梯的设备信息=="+seinfo.getShebeimingcheng());
//			this.addActionData("se", seinfo);
		}
		if (zldm.equals("3000")) {
			TElevatorParam seinfo = (TElevatorParam) seService.findById(Long
					.parseLong(seid), TElevatorParam.class.getName());
			// System.out.println("查看电梯的设备信息=="+seinfo.getShebeimingcheng());
	//		this.addActionData("se", seinfo);
		}
		if (zldm.equals("4000") || zldm.equals("5000")) {
			TCraneParam seinfo = (TCraneParam) seService.findById(Long
					.parseLong(seid), TCraneParam.class.getName());
			// System.out.println("查看起重机械的设备信息 Id=="+seinfo.getShebeimingcheng());
//			this.addActionData("se", seinfo);
		}
		return SUCCESS;
	}

	/*
	 * 生成随机文件名
	 */
	public String generateRandom() {
		String RandomFilename = "";
		Random rand = new Random();// 生成随机数
		int random = rand.nextInt();

		Calendar calCurrent = Calendar.getInstance();
		int intDay = calCurrent.get(Calendar.DATE);
		int intMonth = calCurrent.get(Calendar.MONTH) + 1;
		int intYear = calCurrent.get(Calendar.YEAR);
		// String now = String.valueOf(intYear) + "_" + String.valueOf(intMonth)
		// + "_" +
		// String.valueOf(intDay) + "_";
		String now = String.valueOf(intYear) + String.valueOf(intMonth)
				+ String.valueOf(intDay);
		RandomFilename = now
				+ String.valueOf(random > 0 ? random : (-1) * random) + ".";

		return RandomFilename;
	}

	// 根据代码获取设备种类名称
	public String getNameByCode(String code) {
		String name ="";
		String hql = "from TSeDirectory s where s.daima = '" + code + "'";
		List<TSeDirectory> list = seService.findListByHql(hql);
		if(list.size()>0){
			name = list.get(0).getMingcheng();
		}
		return name;
	}

	// 根据代码获取设备区划名称
	public String getQHNameByCode(String code) {
		String name = "";
		String hql = "from TDicData s where s.code = '" + code + "'";
		List<TDicData> list = seService.findListByHql(hql);
		if(list.size()>0){
			name = list.get(0).getName();
		}
		return name;
	}
	//批量修改维保单位
	public String updWbdwByIds(){
		String ids = super.getParameter("ids");
		String mingcheng = super.getParameter("weibaodanwei");
		String dianhua = super.getParameter("lianxidianhua");
		String lianxiren = super.getParameter("lianxiren");
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		TOrgan organ = (TOrgan)getSession().getAttribute(IConstant.SESSION_TORGAN);
		seService.updWbdwByIds(ids,mingcheng,dianhua,user,organ,lianxiren);
		return SUCCESS;
	}
	//批量修改产权单位
	public String updCqdwByIds(){
		String ids = super.getParameter("ids");
		String mingcheng = super.getParameter("chanquandanwei");
		String dizhi = super.getParameter("dizhi");
		String daima = super.getParameter("daima");
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		TOrgan organ = (TOrgan)getSession().getAttribute(IConstant.SESSION_TORGAN);
		seService.updCqdwByIds(ids,mingcheng,dizhi,daima,user,organ);
		return SUCCESS;
	}
	/**
	 * 批量修改单位信息（维保单位 、产权单位、使用单位）
	 * @return
	 */
	public String updPLXGDW(){
		String ids = super.getParameter("ids");
	
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		TOrgan organ = (TOrgan)getSession().getAttribute(IConstant.SESSION_TORGAN);
		
		seService.updPLXGDW(ids,baseInfo,user,organ);
		return SUCCESS;
	}
	
	/**
	 * 批量修改区县乡镇
	 * @return
	 */
	public String updPLXGQX(){
        String ids = super.getParameter("ids");
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		TOrgan organ = (TOrgan)getSession().getAttribute(IConstant.SESSION_TORGAN);
		
		seService.updPLXGQX(ids,baseInfo,user,organ); 
		return SUCCESS;
	}
	/**
	 * 批量修改设备类别
	 * @return
	 */
	public String updPLXGSBLB(){
        String ids = super.getParameter("ids");
        String sblbdm = super.getParameter("shebeileibiedaima");
        String sblb = this.getNameByCode(sblbdm);
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		TOrgan organ = (TOrgan)getSession().getAttribute(IConstant.SESSION_TORGAN);
		
		seService.updPLXGSBLB(ids,sblbdm,sblb,user,organ); 
		return SUCCESS;
	}
	
	/**
  	 * 查找设备的所有单位信息
  	 * @return
  	 */
  	public String findSeDw(){
  		String ids = super.getParameter("ids");
  		ids = ids.split(",")[0];
  		baseInfo = (TBaseInfo) seService.findById(Long.parseLong(ids),TBaseInfo.class.getName());
  		return "OPEN_SE_DW_SUCCESS";
  	}
  	
  	
  	/**
  	 * 验证注册代码是否重复
  	 * @return
  	 */
  	public String findSeCode(){
  		String code = super.getParameter("code");
  		String id = super.getParameter("id");
  		
  		int count = seService.findSeCode(id,code);
  		super.addActionData("count", count);
  		return SUCCESS;
  	}
  	
  	/**
	 * 新建设备
	 * 页面取使用单位信息
	 * @return
	 */
	public String doCreateBase(){
		String zldm = super.getParameter("zldm");
		String sydwid = super.getParameter("sydwid");
		String result = "";
		//查找使用单位
		TSyUtils syUtils = (TSyUtils) seService.findById(Long.parseLong(sydwid), TSyUtils.class.getName());
		
		if("1000".equals(zldm)){
			boilerParam = new TBoilerParam();
			boilerParam.setSzstatus("0");
			boilerParam.setShebeizhongleidaima(zldm);
			boilerParam.setShiyongdanwei(syUtils.getDwmc());
			boilerParam.setShiyongdanwei_dizhi(syUtils.getDwdz());
			boilerParam.setShiyongdanwei_code(syUtils.getJgdm());
			boilerParam.setShiyongdanwei_lianxiren(syUtils.getLxr());
			boilerParam.setShiyongdanwei_lianxidianhua(syUtils.getLxdh());
			boilerParam.setShi(syUtils.getShi());
			boilerParam.setShidaima(syUtils.getShidaima());
			boilerParam.setQuhuamingcheng(syUtils.getQuxian());
			boilerParam.setQuhuadaima(syUtils.getQuxiandaima());
			boilerParam.setXiangzhen(syUtils.getXiangzhen());
			boilerParam.setXiangzhendaima(syUtils.getXiangzhendaima());
			TBoilerParam oldBoil = new TBoilerParam();
			oldBoil = boilerParam;
			setReqestAttribute("boilerParamOld", oldBoil);
			result = "OPEN_GL_SE_SUCCESS";
		}else if("2000".equals(zldm)){
			pressureVesselsParam = new TPressureVesselsParam();
			pressureVesselsParam.setSzstatus("0");
			pressureVesselsParam.setShebeizhongleidaima(zldm);
			pressureVesselsParam.setShiyongdanwei(syUtils.getDwmc());
			pressureVesselsParam.setShiyongdanwei_dizhi(syUtils.getDwdz());
			pressureVesselsParam.setShiyongdanwei_code(syUtils.getJgdm());
			pressureVesselsParam.setShiyongdanwei_lianxiren(syUtils.getLxr());
			pressureVesselsParam.setShiyongdanwei_lianxidianhua(syUtils.getLxdh());
			pressureVesselsParam.setShi(syUtils.getShi());
			pressureVesselsParam.setShidaima(syUtils.getShidaima());
			pressureVesselsParam.setQuhuamingcheng(syUtils.getQuxian());
			pressureVesselsParam.setQuhuadaima(syUtils.getQuxiandaima());
			pressureVesselsParam.setXiangzhen(syUtils.getXiangzhen());
			pressureVesselsParam.setXiangzhendaima(syUtils.getXiangzhendaima());
			TPressureVesselsParam oldPre = new TPressureVesselsParam();
			oldPre = pressureVesselsParam;
			setReqestAttribute("pressureVesselsParamOld", oldPre);
			result = "OPEN_YLRQ_SE_SUCCESS";
		}else if("3000".equals(zldm)){
			elevatorPraram = new TElevatorParam();
			elevatorPraram.setShiyongdanwei(syUtils.getDwmc());
			elevatorPraram.setShebeizhongleidaima(zldm);
			elevatorPraram.setShiyongdanwei_dizhi(syUtils.getDwdz());
			elevatorPraram.setShiyongdanwei_code(syUtils.getJgdm());
			elevatorPraram.setShiyongdanwei_lianxiren(syUtils.getLxr());
			elevatorPraram.setShiyongdanwei_lianxidianhua(syUtils.getLxdh());
			elevatorPraram.setShi(syUtils.getShi());
			elevatorPraram.setShidaima(syUtils.getShidaima());
			elevatorPraram.setQuhuamingcheng(syUtils.getQuxian());
			elevatorPraram.setQuhuadaima(syUtils.getQuxiandaima());
			elevatorPraram.setXiangzhen(syUtils.getXiangzhen());
			elevatorPraram.setXiangzhendaima(syUtils.getXiangzhendaima());
			elevatorPraram.setSzstatus("0");
			TElevatorParam oldEle = new TElevatorParam();
			oldEle = elevatorPraram;
			setReqestAttribute("elevatorPraramOld", oldEle);
			result = "OPEN_DT_SE_SUCCESS";
		}else if("4000".equals(zldm)){
			craneParam = new TCraneParam();
			craneParam.setShebeizhongleidaima(zldm);
			craneParam.setShiyongdanwei(syUtils.getDwmc());
			craneParam.setShiyongdanwei_dizhi(syUtils.getDwdz());
			craneParam.setShiyongdanwei_code(syUtils.getJgdm());
			craneParam.setShiyongdanwei_lianxiren(syUtils.getLxr());
			craneParam.setShiyongdanwei_lianxidianhua(syUtils.getLxdh());
			craneParam.setShi(syUtils.getShi());
			craneParam.setShidaima(syUtils.getShidaima());
			craneParam.setQuhuamingcheng(syUtils.getQuxian());
			craneParam.setQuhuadaima(syUtils.getQuxiandaima());
			craneParam.setXiangzhen(syUtils.getXiangzhen());
			craneParam.setXiangzhendaima(syUtils.getXiangzhendaima());
			craneParam.setSijishi("0");
			craneParam.setSzstatus("0");
			craneParam.setQudong("0");
			TCraneParam oldCr = new TCraneParam();
			oldCr = craneParam;
			setReqestAttribute("craneParamOld", oldCr);
			result = "OPEN_QZJX_SE_SUCCESS";
		}else if("5000".equals(zldm)){
			craneParam = new TCraneParam();
			craneParam.setShebeizhongleidaima(zldm);
			craneParam.setShiyongdanwei(syUtils.getDwmc());
			craneParam.setShiyongdanwei_dizhi(syUtils.getDwdz());
			craneParam.setShiyongdanwei_code(syUtils.getJgdm());
			craneParam.setShiyongdanwei_lianxiren(syUtils.getLxr());
			craneParam.setShiyongdanwei_lianxidianhua(syUtils.getLxdh());
			craneParam.setShi(syUtils.getShi());
			craneParam.setShidaima(syUtils.getShidaima());
			craneParam.setQuhuamingcheng(syUtils.getQuxian());
			craneParam.setQuhuadaima(syUtils.getQuxiandaima());
			craneParam.setXiangzhen(syUtils.getXiangzhen());
			craneParam.setXiangzhendaima(syUtils.getXiangzhendaima());
			craneParam.setDonglifangshi("0");
			craneParam.setQudong("0");
			craneParam.setSzstatus("0");
			craneParam.setTuoguache("0");
			craneParam.setZuigaoshisu("0");
			TCraneParam oldCr = new TCraneParam();
			oldCr = craneParam;
			setReqestAttribute("craneParamOld", oldCr);
			result = "OPEN_CNC_SE_SUCCESS";
		}else if("6000".equals(zldm)){
			recreat = new TRecreationParam();
			recreat.setShebeizhongleidaima(zldm);
			recreat.setShiyongdanwei(syUtils.getDwmc());
			recreat.setShiyongdanwei_dizhi(syUtils.getDwdz());
			recreat.setShiyongdanwei_code(syUtils.getJgdm());
			recreat.setShiyongdanwei_lianxiren(syUtils.getLxr());
			recreat.setShiyongdanwei_lianxidianhua(syUtils.getLxdh());
			recreat.setShi(syUtils.getShi());
			recreat.setShidaima(syUtils.getShidaima());
			recreat.setQuhuamingcheng(syUtils.getQuxian());
			recreat.setQuhuadaima(syUtils.getQuxiandaima());
			recreat.setXiangzhen(syUtils.getXiangzhen());
			recreat.setXiangzhendaima(syUtils.getXiangzhendaima());
			recreat.setSzstatus("0");
			TRecreationParam oldRe = new TRecreationParam();
			oldRe = recreat;
			setReqestAttribute("recreatOld", oldRe);
			result = "OPEN_YLSS_SE_SUCCESS";
		}else if("8000".equals(zldm)){
			piping = new TPressurePipingParam();
			piping.setShebeizhongleidaima(zldm);
			piping.setShiyongdanwei(syUtils.getDwmc());
			piping.setShiyongdanwei_dizhi(syUtils.getDwdz());
			piping.setShiyongdanwei_code(syUtils.getJgdm());
			piping.setShiyongdanwei_lianxiren(syUtils.getLxr());
			piping.setShiyongdanwei_lianxidianhua(syUtils.getLxdh());
			piping.setShi(syUtils.getShi());
			piping.setShidaima(syUtils.getShidaima());
			piping.setQuhuamingcheng(syUtils.getQuxian());
			piping.setQuhuadaima(syUtils.getQuxiandaima());
			piping.setXiangzhen(syUtils.getXiangzhen());
			piping.setXiangzhendaima(syUtils.getXiangzhendaima());
			piping.setSzstatus("0");
			piping.setZhongyaoguandao("0");
			TPressurePipingParam oldPr = new TPressurePipingParam();
			oldPr = piping;
			setReqestAttribute("pipingOld", oldPr);
			result = "OPEN_YLGD_SE_SUCCESS";
		}else if("9000".equals(zldm)){
			cable = new TCablewaysParam();
			cable.setShebeizhongleidaima(zldm);
			cable.setShiyongdanwei(syUtils.getDwmc());
			cable.setShiyongdanwei_dizhi(syUtils.getDwdz());
			cable.setShiyongdanwei_code(syUtils.getJgdm());
			cable.setShiyongdanwei_lianxiren(syUtils.getLxr());
			cable.setShiyongdanwei_lianxidianhua(syUtils.getLxdh());
			cable.setShi(syUtils.getShi());
			cable.setShidaima(syUtils.getShidaima());
			cable.setQuhuamingcheng(syUtils.getQuxian());
			cable.setQuhuadaima(syUtils.getQuxiandaima());
			cable.setXiangzhen(syUtils.getXiangzhen());
			cable.setXiangzhendaima(syUtils.getXiangzhendaima());
			cable.setSzstatus("0");
			cable.setYunzaicheliangxingshi("0");
			TCablewaysParam oldCa = new TCablewaysParam();
			oldCa = cable;
			setReqestAttribute("cableOld", oldCa);
			result = "OPEN_KYSD_SE_SUCCESS";
		}
		setReqestAttribute("ptabsid", super.getParameter("pTabsId"));
		return result;
	}
	
	
	
	/**
	 * 使用单位新建设备方法
	 * @return
	 */
	public String saveSydwXjSe(){
		String zldm = super.getParameter("zldm");
		String tjstate = super.getParameter("tjstate");
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		TOrgan organ = (TOrgan)getSession().getAttribute(IConstant.SESSION_TORGAN);
		if("1000".equals(zldm)){
			boilerParam.setShebeileibie(this.getNameByCode(boilerParam.getShebeileibiedaima()));
			boilerParam.setShebeipinzhong(this.getNameByCode(boilerParam.getShenbeipinzhongdaima()));
			boilerParam.setShi(getQHNameByCode(boilerParam.getShidaima()));
			boilerParam.setQuhuamingcheng(this.getQHNameByCode(boilerParam.getQuhuadaima()));
			boilerParam.setXiangzhen(this.getQHNameByCode(boilerParam.getXiangzhendaima()));
			
			boilerParam.setSzstatus("0");
			//验证使用单位是否存在
			TSyUtils syUtils = seService.createSYDW(boilerParam);
			boilerParam.setShiyongdanweiId(syUtils.getId());
			
			if("1".equals(tjstate)){
				boilerParam.setTmpData("0");
				boilerParam.setZcstatus("1");
				seService.saveReturnId(boilerParam);
			}
			seService.updateByGL(boilerParam,tjstate,user,organ);
		}else if("2000".equals(zldm)){
			pressureVesselsParam.setShebeileibie(this.getNameByCode(pressureVesselsParam.getShebeileibiedaima()));
			pressureVesselsParam.setShebeipinzhong(this.getNameByCode(pressureVesselsParam.getShenbeipinzhongdaima()));
			pressureVesselsParam.setQuhuamingcheng(this.getQHNameByCode(pressureVesselsParam.getQuhuadaima()));
			pressureVesselsParam.setShi(getQHNameByCode(pressureVesselsParam.getShidaima()));
			pressureVesselsParam.setXiangzhen(getQHNameByCode(pressureVesselsParam.getXiangzhendaima()));
			
			pressureVesselsParam.setSzstatus("0");
			//验证使用单位是否存在
			TSyUtils syUtils = seService.createSYDW(pressureVesselsParam);
			pressureVesselsParam.setShiyongdanweiId(syUtils.getId());
			
			if("1".equals(tjstate)){
				pressureVesselsParam.setTmpData("0");
				pressureVesselsParam.setZcstatus("1");
				seService.saveReturnId(pressureVesselsParam);
			}
			seService.updateByYLRQ(pressureVesselsParam,tjstate,user,organ);
			
		}else if("3000".equals(zldm)){
			elevatorPraram.setShebeileibie(this.getNameByCode(elevatorPraram.getShebeileibiedaima()));
			elevatorPraram.setShebeipinzhong(this.getNameByCode(elevatorPraram.getShenbeipinzhongdaima()));
			elevatorPraram.setQuhuamingcheng(this.getQHNameByCode(elevatorPraram.getQuhuadaima()));
			elevatorPraram.setShi(getQHNameByCode(elevatorPraram.getShidaima()));
			elevatorPraram.setXiangzhen(getQHNameByCode(elevatorPraram.getXiangzhendaima()));
			
			elevatorPraram.setSzstatus("0");
			//验证使用单位是否存在
			TSyUtils syUtils = seService.createSYDW(elevatorPraram);
			elevatorPraram.setShiyongdanweiId(syUtils.getId());
			
			if("1".equals(tjstate)){
				elevatorPraram.setTmpData("0");
				elevatorPraram.setZcstatus("1");
				seService.saveReturnId(elevatorPraram);
			}
			
			seService.updateByDT(elevatorPraram,tjstate,user,organ);
			
		}else if("4000".equals(zldm) || "5000".equals(zldm)){
			craneParam.setShebeileibie(this.getNameByCode(craneParam.getShebeileibiedaima()));
			craneParam.setShebeipinzhong(this.getNameByCode(craneParam.getShenbeipinzhongdaima()));
			craneParam.setQuhuamingcheng(this.getQHNameByCode(craneParam.getQuhuadaima()));
			craneParam.setShi(getQHNameByCode(craneParam.getShidaima()));
			craneParam.setXiangzhen(getQHNameByCode(craneParam.getXiangzhendaima()));
			
			craneParam.setDonglifangshi("0");
			craneParam.setSijishi("0");
			craneParam.setSzstatus("0");
			//验证使用单位是否存在
			TSyUtils syUtils = seService.createSYDW(craneParam);
			craneParam.setShiyongdanweiId(syUtils.getId());
			
			if("1".equals(tjstate)){
				craneParam.setTmpData("0");
				craneParam.setZcstatus("1");
				seService.saveReturnId(craneParam);
			}
			
			seService.updateByQZJX(craneParam,tjstate,user,organ);
			
		}else if("6000".equals(zldm)){
			recreat.setShebeileibie(this.getNameByCode(recreat.getShebeileibiedaima()));
			recreat.setShebeipinzhong(this.getNameByCode(recreat.getShenbeipinzhongdaima()));
			recreat.setQuhuamingcheng(this.getQHNameByCode(recreat.getQuhuadaima()));
			recreat.setShi(getQHNameByCode(recreat.getShidaima()));
			recreat.setXiangzhen(getQHNameByCode(recreat.getXiangzhendaima()));
			
			recreat.setSzstatus("0");
			//验证使用单位是否存在
			TSyUtils syUtils = seService.createSYDW(recreat);
			recreat.setShiyongdanweiId(syUtils.getId());

			if("1".equals(tjstate)){
				recreat.setTmpData("0");
				recreat.setZcstatus("1");
				seService.saveReturnId(recreat);
			}
			
			seService.updateByYLSS(recreat,tjstate,user,organ);
		}else if("8000".equals(zldm)){
			piping.setShebeileibie(this.getNameByCode(piping.getShebeileibiedaima()));
			piping.setShebeipinzhong(this.getNameByCode(piping.getShenbeipinzhongdaima()));
			piping.setQuhuamingcheng(this.getQHNameByCode(piping.getQuhuadaima()));
			piping.setShi(getQHNameByCode(piping.getShidaima()));
			piping.setXiangzhen(getQHNameByCode(piping.getXiangzhendaima()));
			
			piping.setSzstatus("0");
			//验证使用单位是否存在
			TSyUtils syUtils = seService.createSYDW(piping);
			piping.setShiyongdanweiId(syUtils.getId());
			
			if("1".equals(tjstate)){
				piping.setTmpData("0");
				piping.setZcstatus("1");
				seService.saveReturnId(piping);
			}
			
			seService.updateByYLGD(piping,tjstate,user,organ);
		}else if("9000".equals(zldm)){
			cable.setShebeileibie(this.getNameByCode(cable.getShebeileibiedaima()));
			cable.setShebeipinzhong(this.getNameByCode(cable.getShenbeipinzhongdaima()));
			cable.setQuhuamingcheng(this.getQHNameByCode(cable.getQuhuadaima()));
			cable.setShi(getQHNameByCode(cable.getShidaima()));
			cable.setXiangzhen(getQHNameByCode(cable.getXiangzhendaima()));
			
			cable.setYunzaicheliangxingshi("0");
			cable.setSzstatus("0");
			//验证使用单位是否存在
			TSyUtils syUtils = seService.createSYDW(cable);
			cable.setShiyongdanweiId(syUtils.getId());
			
			if("1".equals(tjstate)){
				cable.setTmpData("0");
				cable.setZcstatus("1");
				seService.saveReturnId(cable);
			}
			
			seService.updateByKYSD(cable,tjstate,user,organ);
		}
		
		return SUCCESS;
	}
	
	
	/**
	 * 导出注册登记
	 * @return
	 */
	public String findDaoChuZcdj(){
		String id = super.getParameter("id");
		OutputStream os = null;
		String name = "注册登记";
		try {
			os = getResponse().getOutputStream();
			super.getResponse().reset();
			super.getResponse().setHeader("Content-disposition",
					"attachment; filename=" + new String(name.getBytes(), "ISO8859-1")+ ".xls"); 
			super.getResponse().setContentType("application/msexcel");
		} catch (Exception ex) {
			
		}
		
		baseInfo = (TBaseInfo) seService.findById(Long.parseLong(id), TBaseInfo.class.getName());
//		if("登记表".equals(name)){
//			elevatorPraram = (TElevatorParam) seService.findById(Long.parseLong(id), TElevatorParam.class.getName());
//			return "DJZ";
//		}
		
		if("1000".equals(baseInfo.getShebeizhongleidaima())){
			boilerParam = (TBoilerParam) seService.findById(Long.parseLong(id), TBoilerParam.class.getName());
			return "GL_CS";
		}else if("2000".equals(baseInfo.getShebeizhongleidaima())){
			pressureVesselsParam = (TPressureVesselsParam) seService.findById(Long.parseLong(id), TPressureVesselsParam.class.getName());
			return "YLRQ_CS";
		}else if("3000".equals(baseInfo.getShebeizhongleidaima())){
			elevatorPraram = (TElevatorParam) seService.findById(Long.parseLong(id), TElevatorParam.class.getName());
			if("3300".equals(elevatorPraram.getShebeileibiedaima())){
				return "DTZD_CS";
			}
			return "DT_CS";
		}else if("4000".equals(baseInfo.getShebeizhongleidaima())){
			craneParam = (TCraneParam) seService.findById(Long.parseLong(id), TCraneParam.class.getName());
//			4000	起重机械
//			4100	桥式起重机
//			4200	门式起重机
//			4300	塔式起重机
//			4400	流动式起重机
//			4700	门座式起重机
//			4800	升降机
//			4900	缆索式起重机
//			4A00	桅杆式起重机
//			4D00	机械式停车设备
			if("4100".equals(craneParam.getShebeileibiedaima())){
				return "QZJQS_CS";
			}else if("4200".equals(craneParam.getShebeileibiedaima())){
				return "QZJMS_CS";
			}else if("4300".equals(craneParam.getShebeileibiedaima())){
				return "QZJTS_CS";
			}else if("4400".equals(craneParam.getShebeileibiedaima())){
				return "QZJLD_CS";
			}else if("4700".equals(craneParam.getShebeileibiedaima())){
				return "QZJMZ_CS";
			}else if("4800".equals(craneParam.getShebeileibiedaima())){
				return "QZJSJJ_CS";
			}else if("4900".equals(craneParam.getShebeileibiedaima())){
				return "QZJLS_CS";
			}else if("4A00".equals(craneParam.getShebeileibiedaima())){
				return "QZJWG_CS";
			}else if("4D00".equals(craneParam.getShebeileibiedaima())){
				return "QZJJXS_CS";
			}
		}else if("5000".equals(baseInfo.getShebeizhongleidaima())){
			craneParam = (TCraneParam) seService.findById(Long.parseLong(id), TCraneParam.class.getName());
			if("5200".equals(craneParam.getShebeileibiedaima())){
				return "CCFLY_CS";
			}
			return "CC_CS";
		}else if("6000".equals(baseInfo.getShebeizhongleidaima())){
			recreat = (TRecreationParam) seService.findById(Long.parseLong(id), TRecreationParam.class.getName());
			return "YLSS_CS";
		}else if("8000".equals(baseInfo.getShebeizhongleidaima())){
			
		}else if("9000".equals(baseInfo.getShebeizhongleidaima())){
			cable = (TCablewaysParam) seService.findById(Long.parseLong(id), TCablewaysParam.class.getName());
			return "SD_CS";
		}
		
		
//		seService.findDaoChuZcdj(id,os);
		
//		return SUCCESS;
		
		
		return "DJZ";
	}
	//设备列表修改设备信息
	public String updSeInfo(){
		String ids = super.getParameter("ids");
		String shiyongdanwei_dizhi = super.getParameter("shiyongdanwei_dizhi");
		String shiyongdanwei_lianxiren = super.getParameter("shiyongdanwei_lianxiren");
		String shiyongdanwei_lianxidianhua = super.getParameter("shiyongdanwei_lianxidianhua");
		String anquanguanlibumen = super.getParameter("anquanguanlibumen");
		String anquanguanlirenyuan = super.getParameter("anquanguanlirenyuan");
		String neibubianhao = super.getParameter("neibubianhao");
		String xiangzhendaima = super.getParameter("xiangzhendaima");
		String updHql = "update TBaseInfoSearch set ";
		String fieleHql = "";
		if(super.checkParam(shiyongdanwei_dizhi)){
			fieleHql += " shiyongdanwei_dizhi = '"+shiyongdanwei_dizhi+"',";
		}
		if(super.checkParam(shiyongdanwei_lianxiren)){
			fieleHql += " shiyongdanwei_lianxiren = '"+shiyongdanwei_lianxiren+"',";
		}
		if(super.checkParam(shiyongdanwei_lianxidianhua)){
			fieleHql += " shiyongdanwei_lianxidianhua = '"+shiyongdanwei_lianxidianhua+"',";
		}
		if(super.checkParam(anquanguanlibumen)){
			fieleHql += " anquanguanlibumen = '"+anquanguanlibumen+"',";
		}
		if(super.checkParam(anquanguanlirenyuan)){
			fieleHql += " anquanguanlirenyuan = '"+anquanguanlirenyuan+"',";
		}
		if(super.checkParam(neibubianhao)){
			fieleHql += " neibubianhao = '"+neibubianhao+"',";
		}
		if(super.checkParam(xiangzhendaima)){
			List<TDicData> dl = seService.findListByHql("from TDicData where code = '"+xiangzhendaima+"'");
			if(dl.size()>0){
				fieleHql += " xiangzhen = '"+dl.get(0).getName()+"',xiangzhendaima = '"+xiangzhendaima+"'";
			}
		}
		if("".equals(fieleHql)){
			super.addActionData("msg","未填写内容，无需修改");
		}else{
			if(fieleHql.endsWith(",")){
				fieleHql = fieleHql.substring(0,fieleHql.length()-1);
			}
			updHql += fieleHql + " where id in ("+ids+")";
			seService.updateByHql(updHql);
			super.addActionData("msg","cg");
		}
		
		return SUCCESS;
	}
	
	public String updateZcstate(){
		String ids = super.getParameter("ids");
		String state = super.getParameter("state");
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		if(seService.findSJSH(ids)){
			seService.updateZcstate(ids,user,state);
		}else{
			//当待审核数据存在此设备时，不允许重复提交到待审核数据
			super.addActionData("msg","notallow");
		}
		return SUCCESS;
	}
	/**
	 * 上传设备更改资料
	 * 
	 * @return
	 * @throws IOException 
	 */
	public String saveuploadSeFile() throws IOException{
		String ids = super.getParameter("ids");
		String type = super.getParameter("type");
		String text = super.getParameter("text");
		
		TUser user = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
		
		seService.saveuploadSeFile(user,ids,type,uploadify,uploadifyFileName,text);
		
		return SUCCESS;
	}

	//企业端变更信息资料下载附件
    public void downloadBySeFile() throws IOException{
    	String id = super.getParameter("id");
    	TBaseFile bf = (TBaseFile)seService.findById(Long.parseLong(id),TBaseFile.class.getName());
    	String path = bf.getFilePath();
    	if(path.indexOf("/") == 0){//监察端上传的   相对路径
    		path = "D:\\Apache-tomcat-6.0.47\\webapps\\SDJC"+path.replace("/","\\");
    	}
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
	 * 查询锅炉压力管道信息
	 * @return
	 */
	public String findGlYlgd(){
		String id = super.getParameter("id");
		super.setReqestAttribute("gdhzbList", seService.getListByYlgdHzb(id));
		super.setReqestAttribute("id", id);
		return "OPEN_GL_YLGD";
	}
	
	/**
	 * 获取设备画像数据
	 * 
	 * @param seService
	 */
	public String getHuaXiang() {
		HashMap hm = seService.getHuaXiang(id);
		super.addActionData("nodes", hm.get("nodes")).addActionData("categories", hm.get("categories"))
				.addActionData("links", hm.get("links")).addActionData("legend", hm.get("legend"));
		return SUCCESS;
	}

	/**
	 * 企业画像点击单位，获取单位的信息
	 * 
	 * @return
	 */
	public String getDwInfo() {
		baseInfo = (TBaseInfo) seService.findById(Long.parseLong(id), TBaseInfo.class.getName());
		return "OPEN_DW_INFO_QYHX";
	}

	
	
	public void setSeService(SECommonService seService) {
		this.seService = seService;
	}

	public File getUploadify() {
		return uploadify;
	}

	public void setUploadify(File uploadify) {
		this.uploadify = uploadify;
	}

	public TElevatorParam getElevatorPraram() {
		return elevatorPraram;
	}

	public void setElevatorPraram(TElevatorParam elevatorPraram) {
		this.elevatorPraram = elevatorPraram;
	}

	public TCraneParam getCraneParam() {
		return craneParam;
	}

	public void setCraneParam(TCraneParam craneParam) {
		this.craneParam = craneParam;
	}

	public TBoilerParam getBoilerParam() {
		return boilerParam;
	}

	public void setBoilerParam(TBoilerParam boilerParam) {
		this.boilerParam = boilerParam;
	}

	public TPressureVesselsParam getPressureVesselsParam() {
		return pressureVesselsParam;
	}

	public void setPressureVesselsParam(
			TPressureVesselsParam pressureVesselsParam) {
		this.pressureVesselsParam = pressureVesselsParam;
	}

	public String getUploadifyFileName() {
		return uploadifyFileName;
	}

	public void setUploadifyFileName(String uploadifyFileName) {
		this.uploadifyFileName = uploadifyFileName;
	}

	public TBaseInfo getBaseInfo() {
		return baseInfo;
	}

	public void setBaseInfo(TBaseInfo baseInfo) {
		this.baseInfo = baseInfo;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public TPressurePipingParam getPiping() {
		return piping;
	}

	public void setPiping(TPressurePipingParam piping) {
		this.piping = piping;
	}

	public TCablewaysParam getCable() {
		return cable;
	}

	public void setCable(TCablewaysParam cable) {
		this.cable = cable;
	}

	public TRecreationParam getRecreat() {
		return recreat;
	}

	public void setRecreat(TRecreationParam recreat) {
		this.recreat = recreat;
	}

	public TQiPingParam getQiping() {
		return qiping;
	}

	public void setQiping(TQiPingParam qiping) {
		this.qiping = qiping;
	}

}
