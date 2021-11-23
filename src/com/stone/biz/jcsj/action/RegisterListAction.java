package com.stone.biz.jcsj.action;

/**
 * <pre>
 *	基础数据  新装设备 List。
 * @author
 * </pre>
 */
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import jxl.Workbook;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.stone.biz.jcsj.pojo.TBaseInfo;
import com.stone.biz.jcsj.pojo.TFujianfuji;
import com.stone.biz.jcsj.pojo.TGuandaoxiangmu;
import com.stone.biz.jcsj.pojo.TQpzcdj;
import com.stone.biz.jcsj.pojo.TRegister;
import com.stone.biz.jcsj.service.RegisterService;

import com.stone.para.IConstant;
import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TUser;

@SuppressWarnings("unchecked")
public class RegisterListAction extends SupportListAction {

	private static final long serialVersionUID = 3979577965804736350L;

	private RegisterService regService;
	public void setRegService(RegisterService regService) {
		this.regService = regService;
	}

	/**
	 * 注册登记
	 * @return
	 * @throws Exception
	 */
	public String getList() throws Exception{

		TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
		String sbzl = super.getParameter("shebeizhonglei");
		String sblb = super.getParameter("shebeileibie"); //设备类别 2016-06-04 添加
		String xiacijianyanriqi = super.getParameter("xiacijianyanriqi");
		String xiacijianyanriqiend = super.getParameter("xiacijianyanriqiend");
		String chuchangbianhao = super.getParameter("chuchangbianhao");
		String shidaima = super.getParameter("shidaima");
		String shiyongdanwei = super.getParameter("shiyongdanwei");
		String dengjiriqi_ks = super.getParameter("dengjiriqi_ks");
		String dengjiriqi_js = super.getParameter("dengjiriqi_js");
		String tjstate = super.getParameter("tjstate"); //提交状态查询
		/*
		 *  2016-06-04 添加
		 * */
		String zzdw = super.getParameter("zhizaodanwei"); //制造单位
		String cqdw = super.getParameter("chanquandanwei"); //产权单位
		String djr = super.getParameter("dengjiren"); //登记人
		String djjg = super.getParameter("dengjijigou"); //登记机构
		String qudaima = super.getParameter("qudaima"); //区代码
		String zcdm = super.getParameter("zhucedaima"); //注册代码
		String sbdm = super.getParameter("shebeidaima"); 
		String sydjzbh = super.getParameter("dengjizhengbianhao"); 
		
		String query = "from TRegister app where creat_user = '"+user.getLoginId()+"' ";
		String conditions = "";
		String order = " order by app.id desc";

		if(super.checkParam(sbzl)){
			conditions += " and app.shebeizhongleidaima ='" + sbzl + "'";
		}
		if(super.checkParam(sblb)){  //设备类别查询
			conditions += " and app.shebeileibiedaima ='" + sblb + "'";
		}
		if(super.checkParam(chuchangbianhao)){
			conditions += " and app.chuchangbianhao like '%" + chuchangbianhao + "%'";
		}
		if(super.checkParam(shidaima)){
			conditions += " and app.shiyongdanweidizhi_shi_daima ='" + shidaima + "'";
		}
		if(super.checkParam(qudaima)){ //区代码
			conditions += " and app.shiyongdanweidizhi_qu_daima ='" + qudaima + "'";
		}
		if(super.checkParam(shiyongdanwei)){
			conditions += " and app.shiyongdanwei like '%" + shiyongdanwei + "%'";
		}
		if(super.checkParam(dengjiriqi_ks)){
			conditions += " and TO_CHAR(app.zhucedengjiriqi,'yyyy-MM-dd') >= '" + dengjiriqi_ks + "'";
		}
		if(super.checkParam(dengjiriqi_js)){
			conditions += " and TO_CHAR(app.zhucedengjiriqi,'yyyy-MM-dd') <= '" + dengjiriqi_js + "'";
		}
		
		if(super.checkParam(xiacijianyanriqi)){
			conditions += " and TO_CHAR(app.xiacijianyanriqi,'yyyy-MM-dd') >= '" + xiacijianyanriqi + "'";
		}
		if(super.checkParam(xiacijianyanriqiend)){
			conditions += " and TO_CHAR(app.xiacijianyanriqi,'yyyy-MM-dd') <= '" + xiacijianyanriqiend + "'";
		}
		if(super.checkParam(tjstate)){
			conditions += " and app.tjstate ='" + tjstate + "'";
		}
		
		if(super.checkParam(zzdw)){ //制造单位
			conditions += " and app.zhizaodanwei like '%" + zzdw + "%'";
		}
		if(super.checkParam(cqdw)){ //产权单位
			conditions += " and app.chanquandanwei like '%" + cqdw + "%'";
		}
		if(super.checkParam(djr)){ //登记人
			conditions += " and app.zhucedengjirenyuan like '%" + djr + "%'";
		}
		if(super.checkParam(djjg)){ //登记机构
			conditions += " and app.zhucedengjijigou like '%" + djjg + "%'";
		}
		if(super.checkParam(zcdm)){
			conditions += " and app.zhucedaima like '%" + zcdm + "%'";
		}
		if(super.checkParam(sbdm)){
			conditions += " and app.shebeidaima like '%" + sbdm + "%'";
		}
		if(super.checkParam(sydjzbh)){
			conditions += " and app.shiyongdengjizhenghaoma like '%" + sydjzbh + "%'";
		}
		
		query += conditions + order;
		
		List ses = regService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long records = regService.findTotalByHql("select count(app) " + query);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, ses);
		return SUCCESS;
	}

	//附件辅机
	public String getListByFujian(){
		String id = super.getParameter("id");
		String query = "from TFujianfuji app where djbid = '"+id+"'";
		String order = " order by app.id";
		query += order;
		List list = regService.findListByHql(query);
		super.addActionData(ROWS, list);
		return SUCCESS;
	}
	//管道项目
	public String getListByGDXM(){
		String id = super.getParameter("id");
		String type = super.getParameter("type");
		String query = "from TGuandaoxiangmu app where djbid = '"+id+"' and type = '"+type+"'";
		String order = " order by app.id";
		query += order;
		List list = regService.findListByHql(query);
		super.addActionData(ROWS, list);
		return SUCCESS;
	}
	//气瓶登记
	public String getListByQP(){
		String id = super.getParameter("id");
		String query = "from TQpzcdj app where djbid = '"+id+"'";
		String order = " order by app.id";
		query += order;
		List list = regService.findListByHql(query);
		super.addActionData(ROWS, list);
		return SUCCESS;
	}
	
}
