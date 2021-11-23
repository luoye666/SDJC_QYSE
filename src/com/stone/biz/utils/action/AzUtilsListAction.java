package com.stone.biz.utils.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.stone.biz.utils.service.UtilsCommonService;
import com.stone.para.IConstant;
import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TUser;

public class AzUtilsListAction extends SupportListAction {
	private UtilsCommonService myService;

	public void setMyService(UtilsCommonService myService) {
		this.myService = myService;
	}

	//获取安装单位列表
	public String getList(){

		TOrgan organ = (TOrgan)getSession().getAttribute(IConstant.SESSION_TORGAN);
		
		String query = "from TAzUtils az  where tmpData=0 ";
		String conditions = "";
		String order = " order by az.id desc";

		String anzhuangdanwei = super.getParameter("anzhuangdanwei");
		String jigoudaima = super.getParameter("jigoudaima");

		//查询条件
		if(organ.getCode().length() == 4){//市级用户
			conditions += " and az.shidaima = '" + organ.getCode() + "'";
		}else if(organ.getCode().length() == 6){//县级用户
			conditions += " and az.quxiandaima = '" + organ.getCode() + "'";
		}else if(organ.getCode().length() == 9){//乡镇街道级用户
			conditions += " and az.xiangzhendaima = '" + organ.getCode() + "'";
		}
		if(super.checkParam(anzhuangdanwei)){
			conditions += " and az.unitsname like '%"+anzhuangdanwei+"%'";
		}
		if(super.checkParam(jigoudaima)){
			conditions += " and az.unitsid like '%"+jigoudaima+"%'";
		}
		
		query += conditions + order;

		List ses = myService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long records = myService.findTotalByHql("select count(az) " + query);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, ses);
		return SUCCESS;
	}
	
}
