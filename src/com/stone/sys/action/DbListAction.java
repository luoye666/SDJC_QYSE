package com.stone.sys.action;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.stone.biz.utils.pojo.TDBUtils;
import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TDbType;
import com.stone.sys.service.impl.DbServiceImpl;

public class DbListAction extends SupportListAction{
	
	
	private static final long serialVersionUID = 1L;
	
	
	private DbServiceImpl dbaService;
	public Map<String,String> map = null;
	private TDBUtils db ;


	public void setDbaService(DbServiceImpl dbaService) {
		this.dbaService = dbaService;
	}

	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map = map;
	}

	public TDBUtils getDb() {
		return db;
	}

	public void setDb(TDBUtils db) {
		this.db = db;
	}

	/**
	 * 查询外数据库信息方法  停用
	 * @return
	 */
	public String findDb(){ 
		
		dbaService.getSCDW();
		
		return SUCCESS;
	}
	
	/**
	 * 查找列信息  停用
	 * @return
	 */
	public String findCols(){ 
		//查询表
		TDbType dbType = (TDbType) dbaService.findSingletonByHql(" from TDbType type where type.table_en = 'biz_bjd' ");
		
		String[] cols = dbType.getTable_col().toString().split(",");
		List<String> list = new ArrayList<String>();
		for(int i=0;i<cols.length;i++){
			String name = cols[i].toString().substring(0,cols[i].toString().indexOf("["));
			
			if("id".equals(name) || "annalid".equals(name)){
				list.add("{ name:'"+name.toUpperCase()+"', width:120, align:'center'}");
			}else{
				list.add("{ name:'"+name.toUpperCase()+"', width:120, align:'center'}");
			}
			
		}
		
		list.add("{name:'operating', label:'操作',width:80, fixed:true, align:'center'}");
		
		addActionData("cols", list);
		return SUCCESS;
	}
	
	
	/**
	 * 查找生产单位信息 停用
	 * @return
	 */
	public String getList(){
		
		System.out.println();
		
		//查询表
		TDbType dbType = (TDbType) dbaService.findSingletonByHql(" from TDbType type where type.table_en = 'biz_bjd' ");
		String[] cols = dbType.getTable_col().toString().split(",");
		String name = "";
		for(int i=0;i<cols.length;i++){
			name += cols[i].toString().substring(0,cols[i].toString().indexOf("["))+",";
		}
		name = name.substring(0,name.length()-1);
		String query = "select "+name+" from "+dbType.getTable_en()+" sy  ";
		String conditions = "";
		String order = " order by annalid desc";
		
		String query2 = "select count(*) from  "+dbType.getTable_en()+" sy  ";
		
		String danweimingcheng = super.getParameter("danweimingcheng");
		String shidaima = super.getParameter("shidaima");
		String zhuangtai = super.getParameter("zhuangtai");
		String sydwids = super.getParameter("sydwids");

		if(super.checkParam(sydwids)){
			conditions += " and sy.id in ("+sydwids+")";
		}
		if(super.checkParam(danweimingcheng)){
			conditions += " and sy.dwmc like '%"+danweimingcheng+"%'";
		}
		if(super.checkParam(shidaima)){
			conditions += " and sy.shidaima = '"+shidaima+"'";
		}
		if(super.checkParam(zhuangtai)){
			conditions += " and sy.flag = '"+zhuangtai+"'";
		}
		
		query += conditions + order;
		query2 += conditions + order;
		String sql = "SELECT * FROM ( SELECT A.*, ROWNUM RN FROM ("+query+") A WHERE ROWNUM <= "+super.getRowNumber()*super.getPagination()+" )" +
				" WHERE RN > "+super.getRowNumber()*(super.getPagination()-1)+" ";
		
		List list = dbaService.findDb(sql);
		long records = dbaService.findDbCount(query2);
		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, list);
		return SUCCESS;
	}
	
	
	/**
	 * 在用
	 * 根据条件查找单个信息
	 * @return
	 */
	public String openDwInfo(){
		String id = super.getParameter("id");
		String leibie = super.getParameter("leibie");
//		//查询表
//		TDbType dbType = (TDbType) dbaService.findSingletonByHql(" from TDbType type where type.table_en = 'TAB_SYUNITS' ");
//		//根据表查询字段
//		String ziduan = "";
//		List<TDbData> dbData = dbaService.findListByHql(" from TDbData data where data.parentId='"+dbType.getId()+"' order by id");
//		for(int i=0;i<dbData.size();i++){
//			ziduan += dbData.get(i).getCol_en()+",";
//		}
//		ziduan = ziduan.substring(0,ziduan.length()-1);
//		
//		String sql = " select "+ziduan+" from "+dbType.getTable_en()+" where id = "+id;
//		
//		List<HashMap<String, Object>> list = dbaService.findListBySql(sql);
//		
//		map = new HashMap<String, String>();
//		
//		
//		Map<String,Object> m = list.get(0);
//		Iterator iterator = m.entrySet().iterator();
//		
//        while(iterator.hasNext()) {
//    	   Map.Entry entry = (Entry) iterator.next();
//    	   for(int i=0;i<dbData.size();i++){
//    		   if(dbData.get(i).getCol_en().equals(entry.getKey())){
//        		   map.put(dbData.get(i).getCol_ch(), entry.getValue()==null?"":entry.getValue().toString());
//        	   }
//    	   }
//    	  
//        }
        
//        map = dbaService.getXx(id);
		db = dbaService.findDwInfo(id,leibie);
		
		dbaService.closeAllBURL();
		return "OPEN_DB_SCDW_SUCCESS";
	}
	
	
	/**
	 * 大数据提取信息最新      在用
	 * 2016-08-28
	 * @return
	 * @throws ParseException 
	 * @throws UnsupportedEncodingException 
	 */
	public String findSCDW() throws ParseException, UnsupportedEncodingException{
		
		String danweileixing = super.getParameter("danweileibie");  //类别
		danweileixing = URLDecoder.decode(danweileixing,"utf-8");
		String shenqingrenmingcheng = super.getParameter("shenqingmingcheng"); //申请人名称
		shenqingrenmingcheng = URLDecoder.decode(shenqingrenmingcheng,"utf-8");
		String fz_st = super.getParameter("fazheng_ks"); //发证日期 开始
		String fz_ed = super.getParameter("fazheng_js"); //发证日期 结束
		String zhengshuzhuangtai = super.getParameter("zhengshuzhuangtai"); //证书状态
		String fazhengdanwei = super.getParameter("fazhengdanwei");//发证单位  CERTTYPE
		fazhengdanwei = URLDecoder.decode(fazhengdanwei,"utf-8");
		String yx_st = super.getParameter("youxiaoqi_ks"); //有效期 开始
		String yx_ed = super.getParameter("youxiaoqi_js"); //有效期 结束  
		String expExcel = super.getParameter("expExcel"); //是否导出
		String diqu = super.getParameter("diqu"); //地区
		diqu = URLDecoder.decode(diqu,"utf-8");
		
		String conditions = "";

		if(super.checkParam(shenqingrenmingcheng)){
			conditions += " and t.orgname like '%"+shenqingrenmingcheng+"%' ";
		}
		if(super.checkParam(fz_st)){
			conditions += " and TO_CHAR(c.sdate,'yyyy-MM-dd') >= '" + fz_st + "'";
		}
		if(super.checkParam(fz_ed)){
			conditions += " and TO_CHAR(c.sdate,'yyyy-MM-dd') <= '" + fz_ed + "'";
		}
		if(super.checkParam(yx_st)){
			conditions += " and TO_CHAR(c.edate,'yyyy-MM-dd') >= '" + yx_st + "'";
		}
		if(super.checkParam(yx_ed)){
			conditions += " and TO_CHAR(c.edate,'yyyy-MM-dd') <= '" + yx_ed + "'";
		}
		if(super.checkParam(fazhengdanwei)){
			conditions += " and c.CERTTYPE = '"+fazhengdanwei+"' ";
		}
		if(super.checkParam(diqu)){
			conditions += " and t.region like '%"+diqu+"%' ";
		}
		
		String zhuReport = "M2_ZZJG.SP_SESJ_ORGANINFO";
		String fuReport = "m2_zzjg.sp_sesj_cert";
		if("0".equals(danweileixing)){
			zhuReport = "M2_ZZJG.SP_SESJ_ORGANINFO";
			fuReport = "m2_zzjg.sp_sesj_cert"; 
		}else if("1".equals(danweileixing)){
			zhuReport = "M2_ZZJG.SP_SEZZ_ORGANINFO";
			fuReport = "m2_zzjg.sp_sezz_cert";
		}else if("2".equals(danweileixing)){
			zhuReport = "M2_ZZJG.SP_SECZ_ORGANINFO";
			fuReport = "M2_ZZJG.SP_SECZ_CERT";
		}else if("3".equals(danweileixing)){
			zhuReport = "M2_ZZJG.SP_SEGCCZ_ORGANINFO";
			fuReport = "M2_ZZJG.sp_segccz_cert";
		}else if("4".equals(danweileixing)){
			zhuReport = "M2_ZZJG.SP_SEAGW_ORGANINFO";
			fuReport = "M2_ZZJG.SP_SEAGW_CERT";
		}
		
		//设计许可
		
		//特种设备制造许可单位
		
		String dbSql = "select t.id,t.orgname ,t.organno,t.abode,t.region,c.certno,c.sdate,c.edate,t.organid from "+zhuReport+" t " +
					   " left join "+fuReport+" c on t.organid = c. organid " +
					   " where 1=1  " ;
		
		
		if("exp".equals(expExcel)){
			//单位名称、行政区划、许可证类别、取证时间、有效期至、联系人、联系电话。
			dbSql = "select t.orgname,t.region, t.singleman,t.tel ,c.itemname,c.sdate,c.edate from "+zhuReport+" t " +
			   " left join "+fuReport+" c on t.organid = c. organid " +
			   " where 1=1  " ;
			String ids = super.getParameter("ids");
			if(super.checkParam(ids)){
				dbSql += " and t.id in ("+ids+") ";
			}
			OutputStream os = null;
			String name = "设备列表";
			try {
				os = super.getResponse().getOutputStream();
				super.getResponse().reset();
				super.getResponse().setHeader("Content-disposition",
						"attachment; filename=" + new String(name.getBytes(), "ISO8859-1")+ ".xls"); 
				super.getResponse().setContentType("application/msexcel");
				
				dbaService.expExcel(dbSql += conditions ,os);
			} catch (Exception ex) {
		//		System.out.println("流操作错误:" + ex.getMessage());
			}
			return null;
		}
		
		int startPage = (super.getPagination()-1)*super.getRowNumber();
		int endPage = super.getRowNumber()*super.getPagination();
		
		dbSql = "select t.id,t.orgname ,t.organno,t.abode,t.region,c.certno,c.sdate,c.edate,t.organid from "+zhuReport+" t " +
		   " left join "+fuReport+" c on t.organid = c. organid " +
		   " where 1=1  " + conditions;
		
		dbSql = " select * from ( select A.*,ROWNUM RN  from ("+ dbSql +" ) A where rownum <= '"+endPage+"'   ) WHERE RN > " +startPage;
		
		List list = dbaService.findSCDW(dbSql,danweileixing);
		
		String countSql = "select count(*) from "+zhuReport+" t " +
		   " left join "+fuReport+" c on t.organid = c. organid " +
		   " where 1=1  " + conditions;
		
		int records = dbaService.countRow(countSql);
		
		JSONArray jArray = JSONArray.fromObject(list);
		
		int total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, jArray);
		
		return SUCCESS;
	}
	
	
	
	/**
	 * 查找其他信息
	 * @return
	 * @throws ParseException 
	 */
	public String findQtInfo() throws ParseException{
		String organid = super.getParameter("oid");
		String lx = super.getParameter("seCode");
		String leibie = super.getParameter("leibie");
		if(super.checkParam(organid)){
			List list = dbaService.findQtInfo(organid,lx,leibie);
			int records = list == null ? 0 :list.size();
			int total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
			super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, list);
		}
		return SUCCESS;
	}
	
	
	/**
	 * 在用 (监督检查)
	 * 根据条件查找单个信息
	 * @return
	 */
	public String openDwInfoJ(){
		String id = super.getParameter("id");
		String leibie = super.getParameter("leibie");
		db = dbaService.findDwInfo(id,leibie);
		
		super.addActionData("db", db);
		dbaService.closeAllBURL();
		return SUCCESS;
	}
	
}
