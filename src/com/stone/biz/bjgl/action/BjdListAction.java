package com.stone.biz.bjgl.action;

import java.util.List;

import com.stone.biz.bjgl.pojo.TBjd;
import com.stone.biz.bjgl.service.BjdService;
import com.stone.para.IConstant;
import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TUser;

public class BjdListAction extends SupportListAction{

	private static final long serialVersionUID = 5456258406595540759L;
	
	private BjdService bjdService;
	
	public void setBjdService(BjdService bjdService) {
		this.bjdService = bjdService;
	}

	
	/**
	 * 查询报检单下的设备信息
	 * @return
	 */
	public String findBjdSe(){
		
		//设备id
		String seId = super.getParameter("seId");
		
		List list = bjdService.findBjdSe(seId);
		
		long total = list.size()%super.getRowNumber() == 0 ? list.size()/super.getRowNumber() : list.size()/super.getRowNumber()+1;
		
		super.addActionData(ROWS, list).addActionData(TOTAL, total).addActionData(RECORDS, list.size());
		
		return SUCCESS;
	}
	
	
	/**
	 * 查询报检单列表信息
	 * @return
	 */
	public String findListBjd(){
		
		TUser user = (TUser) super.getSession().getAttribute(IConstant.SESSION_TUSER);
		
		//使用单位
		String sydw = super.getParameter("sydw");
		//注册代码
		String zcdm = super.getParameter("zcdm");
		//提交状态
		String tjState = super.getParameter("tjstate");
		//提交时间
		String tjsj = super.getParameter("tjsj");
		String tjsjend = super.getParameter("tjsjend");
		//市
		String shi = super.getParameter("shidaima");
		//区划
		String quhua = super.getParameter("quhuadaima");
		//设备种类
		String sbzl = super.getParameter("shebeizhonglei");
	
		
		String hql = " from TBjd b where b.role = '"+user.getLoginId()+"' ";
		String hqlAppend = "";
		String order = " order by b.tijiaoriqi desc";
		
		if(super.checkParam(sydw)){
			hqlAppend = " and b.shiyongdanwei like '%"+sydw+"%' ";
		}
		if(super.checkParam(zcdm)){
			hqlAppend = " and b.se_zhucedaima like '%"+zcdm+"%' ";
		}
		if(super.checkParam(sbzl)){
			hqlAppend = " and b.shebeizhongleidaima = '"+sbzl+"' ";
		}
		if(super.checkParam(shi)){
			hqlAppend = " and b.shidaima = '"+shi+"' ";
		}
		if(super.checkParam(quhua)){
			hqlAppend = " and b.quhuadaima = '"+quhua+"' ";
		}
		if(super.checkParam(tjState)){
			hqlAppend = " and b.bj_state = '"+tjState+"' ";
		}
		if(super.checkParam(tjsj)){
			hqlAppend = " and to_char(b.tijiaoriqi,'yyyy-mm-dd')  >= '"+tjsj+"' ";
		}
		if(super.checkParam(tjsjend)){
			hqlAppend = " and to_char(b.tijiaoriqi,'yyyy-mm-dd') <= '"+tjsjend+"' ";
		}
		
		hql += hqlAppend ;
		
		List<TBjd> bjdList = bjdService.findListBjd(hql+order,super.getPagination(), super.getRowNumber());
		long records = bjdService.findTotalByHql("select count(b) " + hql);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(ROWS, bjdList).addActionData(TOTAL, total).addActionData(RECORDS, records);
		
		return SUCCESS;
	}
}
