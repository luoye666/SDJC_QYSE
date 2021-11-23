package com.stone.biz.utils.action;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.stone.biz.jcsj.pojo.TBaseInfo;
import com.stone.biz.jcsj.pojo.TBaseInfoSearch;
import com.stone.biz.utils.pojo.TSyUtils;
import com.stone.biz.utils.service.UtilsCommonService;
import com.stone.para.IConstant;
import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TUser;

public class SyUtilsListAction extends SupportListAction {
	private static final long serialVersionUID = 3979577965804736350L;
	private UtilsCommonService myService;

	public void setMyService(UtilsCommonService myService) {
		this.myService = myService;
	}
	//获取使用单位列表
	public String getList(){

		TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
		TUser newUser = (TUser)myService.findById(user.getId(),TUser.class.getName());
		String query = "from TSyUtils sy where tmpData = '0' ";
		String conditions = "";
		String order = " order by id desc";

		String danweimingcheng = super.getParameter("danweimingcheng");
		String shidaima = super.getParameter("shidaima");
		String zhuangtai = super.getParameter("zhuangtai");
		String qudaima = super.getParameter("quhuadaima");
		String xiangzhendaima = super.getParameter("xiangzhendaima");
		String shebeizhonglei = super.getParameter("shebeizhonglei");
		String expExcel = super.getParameter("expExcel");
		
		if(super.checkParam(newUser.getShiyongdanwei_id())){
			conditions += " and sy.id in ("+newUser.getShiyongdanwei_id()+") ";
		}else{
			conditions += " and sy.id = '-1'";
		}
		if(super.checkParam(danweimingcheng)){
			String[] dwmc = danweimingcheng.split(" ");
			String dwChild = "";
			conditions += " and ( ";
			for(int i=0;i<dwmc.length;i++){
				if(dwmc[i].trim().length() != 0){
					dwChild += "  sy.dwmc like '%"+dwmc[i]+"%' or ";
				}
			}
			dwChild = dwChild.substring(0,dwChild.lastIndexOf("or"));
			conditions += dwChild + " ) ";
		}
		if(super.checkParam(shidaima)){
			conditions += " and sy.shidaima = '"+shidaima+"'";
		}
		
		if(super.checkParam(qudaima)){
			conditions += " and sy.quxiandaima = '"+qudaima+"'";
		}
		if(super.checkParam(xiangzhendaima)){
			conditions += " and sy.xiangzhendaima = '"+xiangzhendaima+"'";
		}
		if(super.checkParam(shebeizhonglei)){
			conditions += " and s.shebeizhongleidaima = '"+shebeizhonglei+"'";
			query = "select sy.id " +
			"from tab_syunits sy,biz_se s where sy.id = s.shiyongdanweiid and sy.tmpData = '0' and s.tmpData = '0' and (s.zcstatus='1'  OR s.zcstatus = '3') ";
		}
		if(super.checkParam(zhuangtai)){
			conditions += " and s.zcstatus = '"+zhuangtai+"'";
			query = "select sy.id " +
			"from tab_syunits sy,biz_se s where sy.id = s.shiyongdanweiid and sy.tmpData = '0' and s.tmpData = '0' ";
		}
		if(super.checkParam(shebeizhonglei) || super.checkParam(zhuangtai)){
			
			if("exp".equals(expExcel)){
				
				String ids = super.getParameter("ids");
				String columns = super.getParameter("columns");
				if(super.checkParam(ids)){
					query += " and sy.id in ("+ids+") ";
				}
				OutputStream os = null;
				String name = "使用单位列表";
				query += conditions;
				query = " select id from tab_syunits where id in ("+query+")" ;
				try {
					os = super.getResponse().getOutputStream();
					super.getResponse().reset();
					super.getResponse().setHeader("Content-disposition",
							"attachment; filename=" + new String(name.getBytes(), "ISO8859-1")+ ".xls"); 
					super.getResponse().setContentType("application/msexcel");
					
					myService.expExcel( query,os,columns,"sb");
				} catch (Exception ex) {
			//		System.out.println("流操作错误:" + ex.getMessage());
				}
				return null;
			}
			
			
			String page = super.getParameter("page");
			String row = super.getParameter("rows");
			int rows = Integer.parseInt(page)*Integer.parseInt(row);
			int rn = (Integer.parseInt(page)-1)*Integer.parseInt(row);
			
			String pageStart = "SELECT * FROM (select b.*,rownum as rn from (";
			String pageEnd = ") b where rownum <= "+rows+") a WHERE a.RN > "+rn;
			
			
			String group = " group by sy.id ";
			
			query += conditions +group ;
			
			query = " select id,dwmc,dwdz,shi,quxian,xiangzhen,lxr,lxdh,flag,jgdm from tab_syunits where id in ("+query+")"+order;
			
			List list = myService.findListBySql(pageStart+query+pageEnd);
			List list1 = myService.findListBySql(query);
			
			long total = list1.size()%super.getRowNumber() == 0 ? list1.size()/super.getRowNumber() : list1.size()/super.getRowNumber()+1;
			super.addActionData(TOTAL, total).addActionData(RECORDS, list1.size()).addActionData(ROWS, list);
		}else{
			if("exp".equals(expExcel)){
				String ids = super.getParameter("ids");
				String columns = super.getParameter("columns");
				if(super.checkParam(ids)){
					query += " and sy.id in ("+ids+") ";
				}
				OutputStream os = null;
				String name = "使用单位列表";
				try {
					os = super.getResponse().getOutputStream();
					super.getResponse().reset();
					super.getResponse().setHeader("Content-disposition",
							"attachment; filename=" + new String(name.getBytes(), "ISO8859-1")+ ".xls"); 
					super.getResponse().setContentType("application/msexcel");
					
					myService.expExcel(query += conditions + order,os,columns,"sy");
				} catch (Exception ex) {
			//		System.out.println("流操作错误:" + ex.getMessage());
				}
				return null;
			}
			query += conditions + order;

			List list = myService.findPageListByHql(query,super.getPagination(),super.getRowNumber());
		//	int page = super.getPagination();
		//	int pageNum = super.getRowNumber();
		//	List list = myService.findListBySql("select * from (select a.*,ROWNUM RN from ("+query+") a WHERE ROWNUM <= "+page*pageNum+") WHERE RN >= "+(page*pageNum+1-pageNum));
			long records = myService.findTotalByHql("select count(sy) "+query);

			long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
			super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, list);
		}
		
		
		
//		query += conditions + order;
//
//		List list = myService.findPageListByHql(query,super.getPagination(),super.getRowNumber());
//	//	int page = super.getPagination();
//	//	int pageNum = super.getRowNumber();
//	//	List list = myService.findListBySql("select * from (select a.*,ROWNUM RN from ("+query+") a WHERE ROWNUM <= "+page*pageNum+") WHERE RN >= "+(page*pageNum+1-pageNum));
//		long records = myService.findTotalByHql("select count(sy) "+query);
//
//		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
//		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, list);
		return SUCCESS;
	}
	//获取使用单位列表
	public String getListForHebing(){
		
		String query = "from TSyUtils sy  where 1=1 ";
		String conditions = "";
		String order = " order by sy.id desc";

		String sydwids = super.getParameter("sydwids");
		String confirmid = super.getParameter("confirmid");

		if(super.checkParam(sydwids)){
			conditions += " and sy.id in ("+sydwids+")";
		}
		query += conditions + order;
		
		List list = myService.findListByHql(query);
		
		super.addActionData(ROWS, list).addActionData(TOTAL, list.size());
		return SUCCESS;
	}
	
	
	
	/**
	 * 获取合并单位信息,用于合并单位是展示要合并的单位及单位下的设备数量
	 * @return
	 */
	public String getListHb(){
		
//		select sy.dwmc,count(se.id) from tab_syunits sy,biz_se se 
//		where sy.id = '257' and se.shiyongdanweiid = '257'
//		group by sy.dwmc
		List list = new ArrayList();
		
		String syHql = " from TSyUtils sy where 1=1 ";
		String seHql = " from TBaseInfoSearch se where 1=1 ";
		
		String sydwids = super.getParameter("sydwids");
		if(super.checkParam(sydwids)){
			String[] id = sydwids.split(",");
			for(int i=0;i<id.length;i++){
				Map<String, String> map = new HashMap<String, String>(); 
				if(id[i].trim().length() > 0){
					String syStr = " and sy.id = "+id[i].trim()+" ";
					String seStr = " and se.shiyongdanweiId = "+id[i].trim()+" and (se.zcstatus = '1' or se.zcstatus='3') and se.tmpData = '0' ";
					List<TSyUtils> syList = myService.findListByHql(syHql+syStr);
					List seList = myService.findListByHql(seHql+seStr);
					
					map.put("dwmc", syList.get(0).getDwmc());
					if(seList == null){
						map.put("count", "0");
					}else{
						map.put("count", String.valueOf(seList.size()));
					}
					list.add(map);
				}
				
			}
			
		}
		try {
			getResponse().getWriter().write(JSONArray.fromObject(list).toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return null;
	}
	
	
	/**
	 * 查询企业自查信息
	 * @return
	 */
	public String findEnterpriseInspectList(){
		TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
		String type = super.getParameter("type");
		
		String query = "from TEnterpriseInspect inspect where inspect.loginId =  '"+user.getLoginId()+"' ";
		String order = " order by id ";
		String conditions = "";
		
		String enterpriseName = super.getParameter("enterpriseName");
		String enterpriseAddress = super.getParameter("enterpriseAddress");
		
		if(super.checkParam(type)){
			conditions += " and inspect.type = '"+type+"' ";
		}
		if(super.checkParam(enterpriseName)){
			conditions += " and inspect.enterpriseName like '%"+enterpriseName+"%'";
		}
		if(super.checkParam(enterpriseAddress)){
			conditions += " and inspect.enterpriseAddress like '%"+enterpriseAddress+"%'";
		}
		
		query += conditions + order;

		List list = myService.findPageListByHql(query,super.getPagination(),super.getRowNumber());
		long records = myService.findTotalByHql("select count(inspect) "+query);

		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, list);
		
		return SUCCESS;
	}
	
	
	/**
	 * 查询企业资料
	 * @return
	 */
	public String findUseData(){
		TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
		String type = super.getParameter("type");
		
		String query = "from TUseData data where data.type =  '"+type+"' ";
		String order = " order by id ";
		String conditions = "";

		
		query += conditions + order;

		List list = myService.findPageListByHql(query,super.getPagination(),super.getRowNumber());
		long records = myService.findTotalByHql("select count(data) "+query);

		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, list);
		
		return SUCCESS;
	}
	
}
