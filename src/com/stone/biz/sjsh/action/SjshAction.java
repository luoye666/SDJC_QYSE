package com.stone.biz.sjsh.action;

/**
 * <pre>
 *  已注册设备  Action
 * @author 
 * </pre>
 */

import java.io.File;
import java.io.IOException;
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

import com.stone.biz.dbsx.pojo.TDaiBanShiXiang;
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
import com.stone.biz.rygl.pojo.TZuoYeRenYuan;
import com.stone.biz.sjsh.pojo.TShuJuShenHe;
import com.stone.biz.sjsh.service.SjshService;
import com.stone.biz.utils.pojo.TAzUtils;
import com.stone.biz.utils.pojo.TCzUtils;
import com.stone.biz.utils.pojo.TJyUtils;
import com.stone.biz.utils.pojo.TScUtils;
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
public class SjshAction extends SupportAction {

	private SjshService sjshService;
	private TBaseInfo baseInfo;
	private TElevatorParam elevatorPraram;
	private TCraneParam craneParam;
	private TBoilerParam boilerParam;
	private TPressureVesselsParam pressureVesselsParam;
	private TPressurePipingParam piping;
	private TCablewaysParam cable;
	private TRecreationParam recreat;
	private TQiPingParam qiping;

	//获取信息
	public String openDbInfo() throws Exception{
		Long dataid = super.getParameterLong("dataid");
		String type = super.getParameter("type");
		String result = "";
		type = URLDecoder.decode(type,"utf-8");
		if("使用单位".equals(type)){
			TSyUtils sy = (TSyUtils)sjshService.findById(dataid,TSyUtils.class.getName());
			TSyUtils oldSy = null;
			if(null == sy.getPid()){//设备修改操作的数据
				oldSy = sy;
			}else{
				oldSy = (TSyUtils)sjshService.findById(sy.getPid(),TSyUtils.class.getName());
			}
			setReqestAttribute("entity", sy);
			setReqestAttribute("entityOld", oldSy);
			result = "OPEN_SYDW_INFO_SUCCESS";
			List<TDicData> dataList = sjshService.getDataListByCodeAndValue("SD_XZQH");
			super.setReqestAttribute("dataList",dataList);
		}else if("设备".equals(type)){
			TBaseInfo bs = (TBaseInfo)sjshService.findById(dataid,TBaseInfo.class.getName());
			super.getRequest().setAttribute("pzlist", sjshService.getDataListByParentCode(bs.getShebeileibiedaima()));
			super.getRequest().setAttribute("lblist", sjshService.getDataListByParentCode(bs.getShebeizhongleidaima()));
			List<TDicData> dataList = sjshService.getDataListByCodeAndValue("SD_XZQH");
			if("1000".equals(bs.getShebeizhongleidaima())){
				TBoilerParam el = (TBoilerParam)sjshService.findById(dataid, TBoilerParam.class.getName());
				//锅炉判断参数是否为空
				checkParamNull(el);
				TBoilerParam oldEl = null;
				if(null == bs.getPid()){//设备修改操作的数据
					oldEl = el;
				}else{
					oldEl = (TBoilerParam)sjshService.findById(el.getPid(), TBoilerParam.class.getName());
					checkParamNull(oldEl);
				}
				setReqestAttribute("boilerParam", el);
				setReqestAttribute("boilerParamOld", oldEl);
				result = "OPEN_GL_INFO_SUCCESS";
			}else if("2000".equals(bs.getShebeizhongleidaima())){
				TPressureVesselsParam el = (TPressureVesselsParam)sjshService.findById(dataid, TPressureVesselsParam.class.getName());
				if("".equals(el.getSzstatus()) || null == el.getSzstatus()){
					el.setSzstatus("0");
				}
				TPressureVesselsParam oldEl = null;
				if(null == bs.getPid()){
					oldEl = el;
				}else{
					oldEl = (TPressureVesselsParam)sjshService.findById(el.getPid(), TPressureVesselsParam.class.getName());
					if("".equals(oldEl.getSzstatus()) || null == oldEl.getSzstatus()){
						oldEl.setSzstatus("0");
					}
				}
				setReqestAttribute("pressureVesselsParam", el);
				setReqestAttribute("pressureVesselsParamOld", oldEl);
				result = "OPEN_YLRQ_INFO_SUCCESS";
			}else if("3000".equals(bs.getShebeizhongleidaima())){
				TElevatorParam el = (TElevatorParam)sjshService.findById(dataid, TElevatorParam.class.getName());
				if("".equals(el.getSzstatus()) || null == el.getSzstatus()){
					el.setSzstatus("0");
				}
				TElevatorParam oldEl = null;
				if(null == bs.getPid()){
					oldEl = el;
				}else{
					oldEl = (TElevatorParam)sjshService.findById(el.getPid(), TElevatorParam.class.getName());
					if("".equals(oldEl.getSzstatus()) || null == oldEl.getSzstatus()){
						oldEl.setSzstatus("0");
					}
				}
				setReqestAttribute("elevatorPraram", el);
				setReqestAttribute("elevatorPraramOld", oldEl);
				result = "OPEN_DT_INFO_SUCCESS";
			}else if("4000".equals(bs.getShebeizhongleidaima())){
				TCraneParam el = (TCraneParam)sjshService.findById(dataid, TCraneParam.class.getName());
				if("".equals(el.getSijishi()) || null == el.getSijishi()){
					el.setSijishi("0");
				}
				if("".equals(el.getSzstatus()) || null == el.getSzstatus()){
					el.setSzstatus("0");
				}
				TCraneParam oldEl = null;
				if(null == bs.getPid()){
					oldEl = el;
				}else{
					oldEl = (TCraneParam)sjshService.findById(el.getPid(), TCraneParam.class.getName());
					if("".equals(oldEl.getSijishi()) || null == oldEl.getSijishi()){
						oldEl.setSijishi("0");
					}
					if("".equals(oldEl.getSzstatus()) || null == oldEl.getSzstatus()){
						oldEl.setSzstatus("0");
					}
				}
				setReqestAttribute("craneParam", el);
				setReqestAttribute("craneParamOld", oldEl);
				result = "OPEN_QZJX_INFO_SUCCESS";
			}else if("5000".equals(bs.getShebeizhongleidaima())){
				TCraneParam el = (TCraneParam)sjshService.findById(dataid, TCraneParam.class.getName());
				if("".equals(el.getDonglifangshi()) || null == el.getDonglifangshi() ){
					el.setDonglifangshi("0");
				}
				if("".equals(el.getSzstatus()) || null == el.getSzstatus()){
					el.setSzstatus("0");
				}
				if("".equals(el.getTuoguache()) || null == el.getTuoguache()){
					el.setTuoguache("0");
				}
				if("".equals(el.getZuigaoshisu()) || null == el.getZuigaoshisu()){
					el.setZuigaoshisu("0");
				}
				if("".equals(el.getQudong()) || null == el.getQudong()){
					el.setQudong("0");
				}
				TCraneParam oldEl = null;
				if(null == bs.getPid()){
					oldEl = el;
				}else{
					oldEl = (TCraneParam)sjshService.findById(el.getPid(), TCraneParam.class.getName());
					if("".equals(oldEl.getDonglifangshi()) || null == oldEl.getDonglifangshi() ){
						oldEl.setDonglifangshi("0");
					}
					if("".equals(oldEl.getSzstatus()) || null == oldEl.getSzstatus()){
						oldEl.setSzstatus("0");
					}
					if("".equals(oldEl.getTuoguache()) || null == oldEl.getTuoguache()){
						oldEl.setTuoguache("0");
					}
					if("".equals(oldEl.getZuigaoshisu()) || null == oldEl.getZuigaoshisu()){
						oldEl.setZuigaoshisu("0");
					}
					if("".equals(oldEl.getQudong()) || null == oldEl.getQudong()){
						oldEl.setQudong("0");
					}
				}
				setReqestAttribute("craneParam", el);
				setReqestAttribute("craneParamOld", oldEl);
				result = "OPEN_CNC_INFO_SUCCESS";
			}else if("6000".equals(bs.getShebeizhongleidaima())){
				TRecreationParam re = (TRecreationParam)sjshService.findById(dataid, TRecreationParam.class.getName());
				if("".equals(re.getSzstatus()) || null == re.getSzstatus()){
					re.setSzstatus("0");
				}
				TRecreationParam oldRe = null;
				if(null == bs.getPid()){
					oldRe = re;
				}else{
					oldRe = (TRecreationParam)sjshService.findById(re.getPid(), TRecreationParam.class.getName());
					if("".equals(oldRe.getSzstatus()) || null == oldRe.getSzstatus()){
						oldRe.setSzstatus("0");
					}
				}
				setReqestAttribute("recreat", re);
				setReqestAttribute("recreatOld", oldRe);
				result = "OPEN_YLSS_INFO_SUCCESS";
			}else if("8000".equals(bs.getShebeizhongleidaima())){
				TPressurePipingParam piping = (TPressurePipingParam)sjshService.findById(dataid, TPressurePipingParam.class.getName());
				if("".equals(piping.getSzstatus()) || null == piping.getSzstatus()){
					piping.setSzstatus("0");
				}
				if("".equals(piping.getZhongyaoguandao()) || null == piping.getZhongyaoguandao()){
					piping.setZhongyaoguandao("0");
				}
				TPressurePipingParam oldPiping = null;
				if(null == bs.getPid()){
					oldPiping = piping;
				}else{
					oldPiping = (TPressurePipingParam)sjshService.findById(piping.getPid(), TPressurePipingParam.class.getName());
					if("".equals(oldPiping.getSzstatus()) || null == oldPiping.getSzstatus()){
						oldPiping.setSzstatus("0");
					}
					if("".equals(oldPiping.getZhongyaoguandao()) || null == oldPiping.getZhongyaoguandao()){
						oldPiping.setZhongyaoguandao("0");
					}
				}
				setReqestAttribute("piping", piping);
				setReqestAttribute("pipingOld", oldPiping);
				result = "OPEN_YLGD_INFO_SUCCESS";
			}else if("9000".equals(bs.getShebeizhongleidaima())){
				TCablewaysParam cable = (TCablewaysParam)sjshService.findById(dataid, TCablewaysParam.class.getName());
				if("".equals(cable.getSzstatus()) || null == cable.getSzstatus()){
					cable.setSzstatus("0");
				}
				if("".equals(cable.getYunzaicheliangxingshi()) || null == cable.getYunzaicheliangxingshi()){
					cable.setYunzaicheliangxingshi("0");
				}
				TCablewaysParam oldCable = null;
				if(null == bs.getPid()){
					oldCable = cable;
				}else{
					oldCable = (TCablewaysParam)sjshService.findById(cable.getPid(), TCablewaysParam.class.getName());
					if("".equals(oldCable.getSzstatus()) || null == oldCable.getSzstatus()){
						oldCable.setSzstatus("0");
					}
					if("".equals(oldCable.getYunzaicheliangxingshi()) || null == oldCable.getYunzaicheliangxingshi()){
						oldCable.setYunzaicheliangxingshi("0");
					}
				}
				setReqestAttribute("cable", cable);
				setReqestAttribute("cableOld", oldCable);
				result = "OPEN_KYSD_INFO_SUCCESS";
			}else if("Q000".equals(bs.getShebeizhongleidaima())){
				TQiPingParam qiping = (TQiPingParam)sjshService.findById(dataid, TQiPingParam.class.getName());
				TQiPingParam oldQiping = null;
				if(null == bs.getPid()){
					oldQiping = qiping;
				}else{
					oldQiping = (TQiPingParam)sjshService.findById(qiping.getPid(), TQiPingParam.class.getName());
				}
				setReqestAttribute("qiping", qiping);
				setReqestAttribute("qipingOld", oldQiping);
				if("Q100".equals(qiping.getShebeileibiedaima())){
					result = "OPEN_CYQP_INFO_SUCCESS";
				}else{
					result = "OPEN_QP_INFO_SUCCESS";
				}
			}
		}
		setReqestAttribute("adr","dsh");
		return result;
	}

	//判断锅炉参数是否为空
	public void checkParamNull(TBoilerParam bp){
		if("".equals(bp.getSzstatus()) || null == bp.getSzstatus()){
			bp.setSzstatus("0");
		}
		if(null == bp.getRanliaozhonglei() || "".equals(bp.getRanliaozhonglei())){
			bp.setRanliaozhonglei("燃煤");
		}
		if(null == bp.getYalidengji() || "".equals(bp.getYalidengji())){
			bp.setYalidengji("超临界锅炉30.0MPa");
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
	
	public void setSjshService(SjshService sjshService) {
		this.sjshService = sjshService;
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

	public TBaseInfo getBaseInfo() {
		return baseInfo;
	}

	public void setBaseInfo(TBaseInfo baseInfo) {
		this.baseInfo = baseInfo;
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
