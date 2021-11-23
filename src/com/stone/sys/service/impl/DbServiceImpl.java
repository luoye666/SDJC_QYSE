package com.stone.sys.service.impl;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.sql.DataSource;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.ibm.icu.text.SimpleDateFormat;
import com.stone.biz.utils.pojo.TDBUtils;
import com.stone.support.SupportService;
import com.stone.support.utils.DateFormatTool;
import com.stone.support.utils.DesUtils;
import com.stone.sys.pojo.TDbData;
import com.stone.sys.pojo.TDbType;


public class DbServiceImpl extends SupportService {
	
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String BURL = "jdbc:oracle:thin:@192.168.1.128:1521:ORACLE"; //测试
	//public static final String BURL = "jdbc:oracle:thin:@10.1.160.188:1521:sdzjdw"; //正式
	public static final String BUSER = "xzxk";
	public static final String BPWD =  "tzsb1234";
	

	private Connection bcon = null;
	private PreparedStatement bps = null;
	private ResultSet brs = null;
	public static DataSource bsource = null;
	private DesUtils des = null;
	private String[] str = null;
	
	
	/**
	 * 连接数据库
	 * @return
	 */
	public Connection getConBURL() { 
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			des = new DesUtils();
			bcon = DriverManager.getConnection(BURL, BUSER, BPWD);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return bcon;

	}

	
	/**
	 * 关闭连接
	 */
	public void closeAllBURL() {
		if (brs != null) {
			try {
				brs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (bps != null) {
			try {
				bps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (bcon != null) {
			try {
				bcon.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
   
	/**
	 * 拼接sql语句
	 * @return
	 */
	public String createSQL() {
		//找出要查询的表
		TDbType dbType = (TDbType) super.findSingletonByHql(" from TDbType type where type.table_en ='biz_bjd' ");
		//找出需要查询的表字段
//		String ziduan = "";
//		List<TDbData> dbData = super.findListByHql(" from TDbData data where data.parentId='"+dbType.getId()+"' order by id");
//		for(int i=0;i<dbData.size();i++){
//			ziduan += dbData.get(i).getCol_en()+",";
//		}
//		ziduan = ziduan.substring(0,ziduan.length()-1);
		
		String[] cols = dbType.getTable_col().toString().split(",");
		String name = "";
		for(int i=0;i<cols.length;i++){
			name += cols[i].toString().substring(0,cols[i].toString().indexOf("["))+",";
		}
		name = name.substring(0,name.length()-1);
		str = name.split(",");
		String sql = " select "+name+" from "+dbType.getTable_en()+"  ";
		
		return sql;
	}

	
	/**
	 * 查找生产单位
	 * @return
	 */
	public List findDb(String sql){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> rowData = new HashMap<String,Object>();   
		bcon = getConBURL();
		
		try {
			Statement stmt=bcon.createStatement();
			brs=stmt.executeQuery(sql);
			ResultSetMetaData md = brs.getMetaData(); //得到结果集(rs)的结构信息，比如字段数、字段名等   
			int columnCount = md.getColumnCount();//返回此 ResultSet 对象中的列数   
			
	         while (brs.next()) {   
	          rowData = new HashMap<String,Object>(columnCount);   
	          for (int i = 1; i <= columnCount; i++) {   
	                  rowData.put(md.getColumnName(i).toLowerCase(), brs.getObject(i));   
	          }   
	          list.add(rowData);   
	         }   
	         return list;
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			closeAllBURL();
		}
		
		return null;
	}
	
	/**
	 * 查找生产单位
	 * @return
	 */
	public int findDbCount(String sql){
		bcon = getConBURL();
		int num = 0;
		try {
			Statement stmt=bcon.createStatement();
			brs=stmt.executeQuery(sql);
	         while (brs.next()) {   
	        	 num = brs.getInt(1);
	         }   
	         return num;
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			closeAllBURL();
		}
		
		return 0;
	}
	
	
	
	/**
	 * 查询要查询的字段
	 * @return
	 */
	public String[] createZiDuan() {
		//找出要查询的表
		TDbType dbType = (TDbType) super.findSingletonByHql(" from TDbType type where type.table_en ='biz_bjd' ");
		//找出需要查询的表字段
		String ziduan = "";
		List<TDbData> dbData = super.findListByHql(" from TDbData data where data.parentId='"+dbType.getId()+"' order by id");
		
		for(int i=0;i<dbData.size();i++){
			ziduan += dbData.get(i).getCol_en()+",";
		}
		ziduan = ziduan.substring(0,ziduan.length()-1);
		
		String[] str = ziduan.split(",");
		
		return str;
	}
	
	
	
	public Map getXx(String id){
		bcon = getConBURL();
		//查询表
		TDbType dbType = (TDbType) super.findSingletonByHql(" from TDbType type where type.table_en = 'biz_bjd' ");
		//根据表查询字段
		String ziduan = "";
		List<TDbData> dbData = super.findListByHql(" from TDbData data where data.parentId='"+dbType.getId()+"' order by id");
		for(int i=0;i<dbData.size();i++){
			ziduan += dbData.get(i).getCol_en()+",";
		}
		ziduan = ziduan.substring(0,ziduan.length()-1);
		
		String sql = " select "+ziduan+" from "+dbType.getTable_en()+" where annalid = "+id;
		
		Map map = new HashMap<String, String>();
		
		
		try {
			Statement stmt=bcon.createStatement();
			brs=stmt.executeQuery(sql);
			ResultSetMetaData md = brs.getMetaData(); //得到结果集(rs)的结构信息，比如字段数、字段名等   
			int columnCount = md.getColumnCount();//返回此 ResultSet 对象中的列数   
			
	         while (brs.next()) {   
	        	 map = new HashMap(columnCount);   
	          for (int i = 1; i <= columnCount; i++) {   
	        	  map.put(dbData.get(i-1).getCol_ch(), brs.getObject(i).toString());   
	          }   
	         }   
	         return map;
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			closeAllBURL();
		}
		
		
		return null;
	}
	
	
	
	
	/**
	 * 生产信息
	 */
	public Map getSCDW(){
		bcon = getConBURL();
		
		String sql = " select t.organid,t.name,t.work from m2_person.sp_manufacture_tech t ";
		
		Map map = new HashMap<String, String>();
		
		
		try {
			Statement stmt=bcon.createStatement();
			brs=stmt.executeQuery(sql);
			ResultSetMetaData md = brs.getMetaData(); //得到结果集(rs)的结构信息，比如字段数、字段名等   
			int columnCount = md.getColumnCount();//返回此 ResultSet 对象中的列数   
			
	         while (brs.next()) {   
	        	 map = new HashMap(columnCount);   
	        	 
	         }   
	         return map;
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			closeAllBURL();
		}
		
		
		return null;
	}
	
	
	
	/**
	 * 最新大数据提取
	 * @return
	 * @throws ParseException 
	 */
	public List findSCDW(String dbSql,String danweileixing) throws ParseException{
		List list = new ArrayList();
		Map map = new HashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		bcon = getConBURL();
		
		try {
			Statement stmt=bcon.createStatement();
			brs=stmt.executeQuery(dbSql);
			//ResultSetMetaData md = brs.getMetaData(); //得到结果集(rs)的结构信息，比如字段数、字段名等   
			//int columnCount = md.getColumnCount();//返回此 ResultSet 对象中的列数   
			
	         while (brs.next()) {   
	        	 //t.id,t.orgname ,t.organno,t.abode,t.region,t.itemname,c.certno,c.sdate,c.edate,t.organid 
	        	
    		 	TDBUtils db = new TDBUtils();
    		 	db.setId(brs.getLong(1));
    		 	db.setOrgname(brs.getObject(2)==null?"":brs.getString(2));
    		 	db.setOrganno(brs.getObject(3)==null?"":brs.getString(3));
    		 	db.setAbode(brs.getObject(4)==null?"":brs.getString(4));
    		 	db.setRegion(brs.getObject(5)==null?"":brs.getString(5));
    		 	db.setItemname("1".equals(danweileixing)?"特种设备制造许可":"2".equals(danweileixing)?"气瓶充装许可":"3".equals(danweileixing)?"移动式压力容器充装许可":"4".equals(danweileixing)?"特种设备安装改造维修许可":"特种设备设计许可");
    		 	db.setCertno(brs.getObject(6)==null?"":brs.getString(6));
    		 	db.setSdate(brs.getObject(7)==null?null:sdf.parse(sdf.format(brs.getDate(7))));
    		 	db.setEdate(brs.getObject(8)==null?null:sdf.parse(sdf.format(brs.getDate(8))));
    		 	db.setOrganid(brs.getObject(9)==null?"":brs.getString(9));
				
	        	 list.add(db);
	         }   
	         return list;
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			closeAllBURL();
		}
		
		return null;
		
	}
	
	
	/**
	 * 查找单个信息
	 * @return
	 */
	public TDBUtils findDwInfo(String id,String leibie){
		
		String zhuReport = "M2_ZZJG.SP_SESJ_ORGANINFO";
		String xxSql = "";
		if("特种设备设计许可".equals(leibie)){
			xxSql = " select ORGANNO,ORGNAME,ABODE,REGION,SINGLEMAN,POST,TEL,CONFAX,URL,EMAIL,TRADESORTNAME," +
			        " ECONOMYTYPENAME,CREATEDATE,AUTHORIZEORGAN,REGORGAN,REGNUM,STARTWORKDATE," +
			        " IMMOBILITYFUND,SINGLEINCOME,TECHNOLOGYPRINCIPAL,QUALITYPRINCIPAL," +
			        " ALLWORKMANCOUNT,DEVISECOUNT,DEVISESHENPICOUNT,SURROGATE_NAME," +
			        " SURROGATE_ADD,SURROGATE_ID,SURROGATE_CORPORATION,SURROGATE_PRINCIPAL," +
			        " SURROGATE_FAX,SURROGATE_EMAIL,SURROGATE_TEL from  M2_ZZJG.SP_SESJ_ORGANINFO where id = "+id;
		}else if("特种设备制造许可".equals(leibie)){
			xxSql = " select ORGANNO,ORGNAME,ABODE,REGION,SINGLEMAN,POST,TEL,CONFAX,URL,EMAIL,TRADESORTNAME, "+
					" ECONOMYTYPENAME,AUTHORIZEORGAN,REGORGAN,REGNUM,CREATEDATE,STARTWORKDATE, " +
					" IMMOBILITYFUND,SINGLEINCOME,MANAGER,MANAGERDUTY, " +
					" QUALITYPRINCIPAL,ALLWORKMANCOUNT from  M2_ZZJG.SP_SEZZ_ORGANINFO where id = "+id;
		}else if("气瓶充装许可".equals(leibie)){
			xxSql = " select ORGANNO,ORGNAME,CZUNITNUM,ABODE,SINGLEMAN,REGION, "+
					" POST,EMAIL,TEL,FAX,TRADESORTNAME,ECONOMYTYPENAME, " +
					" AUTHORIZEORGAN,REGNUM,CREATEDATE,ALLPEOPLE,IMMOBILITYFUND, " +
					" SINGLEINCOME,PRINCIPAL,PRINCIPALTEL,TECHNOLOGYPRINCIPAL, " +
					" TECHNOLOGYPRINCIPALTEL,UNITSAREA,WORKSHOPAREA, " +
					" INSTALLORGAN,INSTALLTESTORGAN,TESTORGAN from  M2_ZZJG.SP_SECZ_ORGANINFO where id = "+id;
			
		}else if("移动式压力容器充装许可".equals(leibie)){
			xxSql =  " select ORGANNO,ORGNAME,ABODE,REGION,SINGLEMAN,POST,TEL,CONFAX,URL,EMAIL,TRADESORTNAME, " +
			         " ECONOMYTYPENAME,AUTHORIZEORGAN,REGORGAN,REGNUM,CREATEDATE,STARTWORKDATE, " +
			         " IMMOBILITYFUND,SINGLEINCOME,technologyprincipal,ALLWORKMANCOUNT,UNITS_AREA,WORKSHOP_AREA," +
			         " LOADAREA,PRODUCTION,MANAGERPERSONCOUNT,CARD_COUNT from  M2_ZZJG.SP_SEGCCZ_ORGANINFO where id = "+id;
		}else if("特种设备安装改造维修许可".equals(leibie)){
			xxSql = " select ORGANNO,ORGNAME,ABODE,REGION,SINGLEMAN,POST,TEL,CONFAX,URL,EMAIL,TRADESORTNAME, "+
					" ECONOMYTYPENAME,AUTHORIZEORGAN,REGORGAN,REGNUM,CREATEDATE,STARTWORKDATE, " +
					" IMMOBILITYFUND,SINGLEINCOME,MANAGER,MANAGERDUTY,QUALITYPRINCIPAL,ALLWORKMANCOUNT, " +
					" UNITS_AREA,WORKSHOP_AREA,EXPOSAL_ROOM_AREA,DESIGN_PEOPLE," +
					" BUSYWORK_PEOPLE,INSPECT_PEOPLE,TEST_PEOPLE,JOINTING_PEOPLE," +
					" ELECTRIC_ENGINEERS,MACHINE_ENGINEERS,OTHER_PEOPLE,PRODUCTION from  M2_ZZJG.SP_SEAGW_ORGANINFO where id = "+id;
		}
		
		
		brs = searchUtil(xxSql);
		if(brs != null){
			try {
				return objUtil(brs,leibie);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				//closeAllBURL();
			}
		}
		
		
		return null;
	}
	
	
	
	/**
	 * 通用查询方法
	 * @param sql
	 * @return
	 */
	public ResultSet searchUtil(String sql){
		bcon = getConBURL();
		
		try {
			Statement stmt=bcon.createStatement();
			brs=stmt.executeQuery(sql);
			  
	        return brs;
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 返回单个 对象
	 * @param rs
	 * @return
	 * @throws ParseException 
	 * @throws SQLException 
	 */
	public TDBUtils objUtil(ResultSet rs,String leibie) throws SQLException, ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		TDBUtils db = new TDBUtils();
		 while (rs.next()) {   
			 int i = 1;
			 if("特种设备设计许可".equals(leibie)){
				db.setLeibie("特种设备设计许可");
				db.setOrganno(rs.getObject(1)==null?"":rs.getString(1)); //组织机构代码：
			 	db.setOrgname(rs.getObject(2)==null?"":rs.getString(2)); //烟台万华木村化工机械有限公司 
			 	db.setAbode(rs.getObject(3)==null?"":rs.getString(3)); //住所：
			 	db.setRegion(rs.getObject(4)==null?"":rs.getString(4)); //地市：
			 	db.setFadingdaibiaoren(rs.getObject(5)==null?"":rs.getString(5)); //法定代表人：
			 	db.setYoubian(rs.getObject(6)==null?"":rs.getString(6)); // 	邮政编码：
			 	db.setDianhua(rs.getObject(7)==null?"":rs.getString(7)); //电话：
			 	db.setChuanzhen(rs.getObject(8)==null?"":rs.getString(8)); //传真：
			 	db.setWangzhi(rs.getObject(9)==null?"":rs.getString(9)); //网址
			 	db.setYouxiang(rs.getObject(10)==null?"":rs.getString(10)); //电子邮箱：
			 	db.setHanghye(rs.getObject(11)==null?"":rs.getString(11)); //行业
				db.setJingjileixing(rs.getObject(12)==null?"":rs.getString(12)); //经济类型
				db.setChengliriqi(rs.getObject(13)==null?"":sdf.format(rs.getDate(13))); //成立日期
				db.setChenglijiguan(rs.getObject(14)==null?"":rs.getString(14)); //成立机关
				db.setDengjijigou(rs.getObject(15)==null?"":rs.getString(15)); //营业执照登记机构：
				db.setZhudehao(rs.getObject(16)==null?"":rs.getString(16)); // 	营业执照注册号：
				db.setGongzuoriqi(rs.getObject(17)==null?"":sdf.format(rs.getDate(17))); //工作日期
				db.setGudingzichan(rs.getObject(18)==null?"":rs.getString(18)); //固定资产
				db.setZhucezijin(rs.getObject(19)==null?"":rs.getString(19)); //注册资金
				db.setJishufuzeren(rs.getObject(20)==null?"":rs.getString(20)); //技术负责人
				db.setZhiliangfuzeren(rs.getObject(21)==null?"":rs.getString(21)); //质量负责人
				db.setRenshu(rs.getObject(22)==null?"":rs.getString(22)); //总人数
				db.setShejirenshuliang(rs.getObject(23)==null?"":rs.getString(23)); //设计人数量
				db.setShenpirenshuliang(rs.getObject(24)==null?"":rs.getString(24)); //审批人数量
				db.setJigoumingcheng(rs.getObject(25)==null?"":rs.getString(25)); //申请代理机构 机构名称：
				i = 26;
				db.setDizhi_youbian(rs.getObject(i)==null?"":rs.getString(i)); //机构地址、邮编：
				i ++;
				db.setShenqing_jigoudaima(rs.getObject(i)==null?"":rs.getString(i)); //申请机构代码
				i++;
				db.setShenqing_fadingren(rs.getObject(i)==null?"":rs.getString(i)); //申请法人
				i++;
				db.setShenqing_fuzeren(rs.getObject(i)==null?"":rs.getString(i)); //申请负责人
				i++;
				db.setShenqing_chuanzhen(rs.getObject(i)==null?"":rs.getString(i)); //申请传真
				i++;
				db.setShenqing_youxiang(rs.getObject(i)==null?"":rs.getString(i)); //申请邮箱
				i++;
				db.setShenqing_dianhua(rs.getObject(i)==null?"":rs.getString(i)); //申请电话
			 }else if("特种设备制造许可".equals(leibie)){
				    db.setLeibie("特种设备制造许可");
					db.setOrganno(rs.getObject(1)==null?"":rs.getString(1)); //组织机构代码：
				 	db.setOrgname(rs.getObject(2)==null?"":rs.getString(2)); //烟台万华木村化工机械有限公司 
				 	db.setAbode(rs.getObject(3)==null?"":rs.getString(3)); //住所：
				 	db.setRegion(rs.getObject(4)==null?"":rs.getString(4)); //地市
				 	db.setFadingdaibiaoren(rs.getObject(5)==null?"":rs.getString(5)); //法定代表人：
				 	db.setYoubian(rs.getObject(6)==null?"":rs.getString(6)); // 	邮政编码：
				 	db.setDianhua(rs.getObject(7)==null?"":rs.getString(7)); //电话：
				 	db.setChuanzhen(rs.getObject(8)==null?"":rs.getString(8)); //传真：
				 	db.setWangzhi(rs.getObject(9)==null?"":rs.getString(9)); //网址
				 	db.setYouxiang(rs.getObject(10)==null?"":rs.getString(10)); //电子邮箱：
				 	db.setHanghye(rs.getObject(11)==null?"":rs.getString(11)); //行业
					db.setJingjileixing(rs.getObject(12)==null?"":rs.getString(12)); //经济类型
					db.setChenglijiguan(rs.getObject(13)==null?"":rs.getString(13)); //成立机关
					db.setDengjijigou(rs.getObject(14)==null?"":rs.getString(14)); //营业执照登记机构：
					db.setZhudehao(rs.getObject(15)==null?"":rs.getString(15)); // 	营业执照注册号：
					db.setChengliriqi(rs.getObject(16)==null?"":sdf.format(rs.getDate(16))); //成立日期
					db.setGongzuoriqi(rs.getObject(17)==null?"":sdf.format(rs.getDate(17))); //工作日期
					db.setGudingzichan(rs.getObject(18)==null?"":rs.getString(18)); //固定资产
					db.setZhucezijin(rs.getObject(19)==null?"":rs.getString(19)); //注册资金
					db.setShenqing_fadingren(rs.getObject(20)==null?"":rs.getString(20)); //申请法人  管理者代表：
					db.setShenqing_fuzeren(rs.getObject(21)==null?"":rs.getString(21)); //申请负责人  管理者代表职务：
					db.setZhiliangfuzeren(rs.getObject(22)==null?"":rs.getString(22)); //质量负责人
					db.setRenshu(rs.getObject(23)==null?"":rs.getString(23)); //总人数
					
			 }else if("气瓶充装许可".equals(leibie)){
				    db.setLeibie("气瓶充装许可");
				 	db.setOrganno(rs.getObject(1)==null?"":rs.getString(1)); //组织机构代码：
				 	db.setOrgname(rs.getObject(2)==null?"":rs.getString(2)); //烟台万华木村化工机械有限公司 
				 	db.setChongzhuangdanwei(rs.getObject(3)==null?"":rs.getString(3)); //充装单位标识：----
				 	db.setAbode(rs.getObject(4)==null?"":rs.getString(4)); //住所：
				 	db.setFadingdaibiaoren(rs.getObject(5)==null?"":rs.getString(5)); //法定代表人：
				 	db.setRegion(rs.getObject(6)==null?"":rs.getString(6)); // 地市
				 	db.setYoubian(rs.getObject(7)==null?"":rs.getString(7)); // 	邮政编码：
				 	db.setYouxiang(rs.getObject(8)==null?"":rs.getString(8)); //电子邮箱：
				 	db.setDianhua(rs.getObject(9)==null?"":rs.getString(9)); //电话：
				 	db.setChuanzhen(rs.getObject(10)==null?"":rs.getString(10)); //传真：
				 	db.setHanghye(rs.getObject(11)==null?"":rs.getString(11)); //行业
					db.setJingjileixing(rs.getObject(12)==null?"":rs.getString(12)); //经济类型
					db.setChenglijiguan(rs.getObject(13)==null?"":rs.getString(13)); //成立机关
					db.setZhudehao(rs.getObject(14)==null?"":rs.getString(14)); // 	营业执照注册号：
					db.setChengliriqi(rs.getObject(15)==null?"":sdf.format(rs.getDate(15))); //成立日期
					db.setZhigongrenshu(rs.getObject(16)==null?"":rs.getString(16)); //：  职工人数 ----
					db.setGudingzichan(rs.getObject(17)==null?"":rs.getString(17)); //固定资产
					db.setZhucezijin(rs.getObject(18)==null?"":rs.getString(18)); //注册资金
					db.setZhiliangfuzeren(rs.getObject(21)==null?"":rs.getString(19)); //质量负责人
					db.setZhiliang_dianhua(rs.getObject(20)==null?"":rs.getString(20)); //质量负责人电话 --- 
					db.setJishufuzeren(rs.getObject(21)==null?"":rs.getString(21)); //技术负责人
					db.setJishu_dianhua(rs.getObject(22)==null?"":rs.getString(22)); //技术负责人  电话 ----
					
					db.setZhandimianji(rs.getObject(23)==null?"":rs.getString(23)); //占地面积（㎡）： ----
					db.setChangfangmianji(rs.getObject(24)==null?"":rs.getString(24)); //厂房面积（㎡）： ----
					db.setAnzhuangdanwei(rs.getObject(25)==null?"":rs.getString(25)); //设备安装单位： ----
					db.setJianjiandanwei(rs.getObject(26)==null?"":rs.getString(26)); //安装监检单位： ----
					db.setDingjiandanwei(rs.getObject(27)==null?"":rs.getString(27)); //气瓶定检单位： ----
					
					
				 
			 }else if("移动式压力容器充装许可".equals(leibie)){
				 db.setLeibie("移动式压力容器充装许可");
				 db.setOrganno(rs.getObject(1)==null?"":rs.getString(1)); //组织机构代码：
			 	 db.setOrgname(rs.getObject(2)==null?"":rs.getString(2)); //烟台万华木村化工机械有限公司 
			 	 db.setAbode(rs.getObject(3)==null?"":rs.getString(3)); //住所：
			 	 db.setRegion(rs.getObject(4)==null?"":rs.getString(4)); //地市
			 	 db.setFadingdaibiaoren(rs.getObject(5)==null?"":rs.getString(5)); //法定代表人：
			 	 db.setYoubian(rs.getObject(6)==null?"":rs.getString(6)); // 	邮政编码：
			 	 db.setDianhua(rs.getObject(7)==null?"":rs.getString(7)); //电话：
			 	 db.setChuanzhen(rs.getObject(8)==null?"":rs.getString(8)); //传真：
			 	 db.setWangzhi(rs.getObject(9)==null?"":rs.getString(9)); //网址
			 	 db.setYouxiang(rs.getObject(10)==null?"":rs.getString(10)); //电子邮箱：
			 	 db.setHanghye(rs.getObject(11)==null?"":rs.getString(11)); //行业
				 db.setJingjileixing(rs.getObject(12)==null?"":rs.getString(12)); //经济类型
				 db.setChenglijiguan(rs.getObject(13)==null?"":rs.getString(13)); //成立机关
				 db.setDengjijigou(rs.getObject(14)==null?"":rs.getString(14)); //营业执照登记机构：
				 db.setZhudehao(rs.getObject(15)==null?"":rs.getString(15)); // 	营业执照注册号：
				 db.setChengliriqi(rs.getObject(16)==null?"":sdf.format(rs.getDate(16))); //成立日期
				 db.setGongzuoriqi(rs.getObject(17)==null?"":sdf.format(rs.getDate(17))); //工作日期
				 db.setGudingzichan(rs.getObject(18)==null?"":rs.getString(18)); //固定资产
				 db.setZhucezijin(rs.getObject(19)==null?"":rs.getString(19)); //注册资金
				 db.setJishufuzeren(rs.getObject(20)==null?"":rs.getString(20)); //技术负责人
				 db.setRenshu(rs.getObject(21)==null?"":rs.getString(21)); //总人数
				 db.setZhandimianji(rs.getObject(22)==null?"":rs.getString(22)); //占地面积（㎡）： ----
				 db.setChangfangmianji(rs.getObject(23)==null?"":rs.getString(23)); //厂房面积（㎡）： ----
				 db.setAnzhuangdanwei(rs.getObject(24)==null?"":rs.getString(24)); //充装场地面积：： ----
				 db.setJianjiandanwei(rs.getObject(25)==null?"":rs.getString(25)); //年 产 值（万元）：： ----
				 db.setDingjiandanwei(rs.getObject(26)==null?"":rs.getString(26)); //管理和技术人员数： ----
				 db.setZhigongrenshu(rs.getObject(27)==null?"":rs.getString(27));//持证充装人数  职工人数
			 }else if("特种设备安装改造维修许可".equals(leibie)){
				 
				 db.setLeibie("特种设备安装改造维修许可");
				 db.setOrganno(rs.getObject(1)==null?"":rs.getString(1)); //组织机构代码：
			 	 db.setOrgname(rs.getObject(2)==null?"":rs.getString(2)); //烟台万华木村化工机械有限公司 
			 	 db.setAbode(rs.getObject(3)==null?"":rs.getString(3)); //住所：
			 	 db.setRegion(rs.getObject(4)==null?"":rs.getString(4)); //地市
			 	 db.setFadingdaibiaoren(rs.getObject(5)==null?"":rs.getString(5)); //法定代表人：
			 	 db.setYoubian(rs.getObject(6)==null?"":rs.getString(6)); // 	邮政编码：
			 	 db.setDianhua(rs.getObject(7)==null?"":rs.getString(7)); //电话：
			 	 db.setChuanzhen(rs.getObject(8)==null?"":rs.getString(8)); //传真：
			 	 db.setWangzhi(rs.getObject(9)==null?"":rs.getString(9)); //网址
			     db.setYouxiang(rs.getObject(10)==null?"":rs.getString(10)); //电子邮箱：
			 	 db.setHanghye(rs.getObject(11)==null?"":rs.getString(11)); //行业
				 db.setJingjileixing(rs.getObject(12)==null?"":rs.getString(12)); //经济类型
				 db.setChenglijiguan(rs.getObject(13)==null?"":rs.getString(13)); //成立机关
				 db.setDengjijigou(rs.getObject(14)==null?"":rs.getString(14)); //营业执照登记机构：
				 db.setZhudehao(rs.getObject(15)==null?"":rs.getString(15)); // 	营业执照注册号：
				 db.setChengliriqi(rs.getObject(16)==null?"":sdf.format(rs.getDate(16))); //成立日期
				 db.setGongzuoriqi(rs.getObject(17)==null?"":sdf.format(rs.getDate(17))); //工作日期
				 db.setGudingzichan(rs.getObject(18)==null?"":rs.getString(18)); //固定资产
				 db.setZhucezijin(rs.getObject(19)==null?"":rs.getString(19)); //注册资金
				 db.setShenqing_fadingren(rs.getObject(20)==null?"":rs.getString(20)); //申请法人  管理者代表：
				 db.setShenqing_fuzeren(rs.getObject(21)==null?"":rs.getString(21)); //申请负责人  管理者代表职务：
				 db.setZhiliangfuzeren(rs.getObject(22)==null?"":rs.getString(22)); //质量负责人
				 db.setRenshu(rs.getObject(23)==null?"":rs.getString(23)); //总人数
				 db.setZhandimianji(rs.getObject(24)==null?"":rs.getString(24)); //占地面积（㎡）： ----
				 db.setChangfangmianji(rs.getObject(25)==null?"":rs.getString(25)); //厂房面积（㎡）： ----
					
				  db.setShenqing_jigoudaima(rs.getObject(26)==null?"":rs.getString(26));//曝光室面积（㎡）：
				 db.setShenqing_fadingren(rs.getObject(27)==null?"":rs.getString(27));//设计人员数：
				 db.setShenqing_fuzeren(rs.getObject(28)==null?"":rs.getString(28));//安装改造维修作业人员数
				 db.setShenqing_chuanzhen(rs.getObject(29)==null?"":rs.getString(29));//检查人员数：
				 db.setShenqing_youxiang(rs.getObject(30)==null?"":rs.getString(30));//无损检测人员数：
				 db.setShenqing_dianhua(rs.getObject(31)==null?"":rs.getString(31));// 焊接人员数：
				 db.setChongzhuangdanwei(rs.getObject(32)==null?"":rs.getString(32));//电气工程师人员数：
				 db.setZhigongrenshu(rs.getObject(33)==null?"":rs.getString(33));//机械工程师人员数：
				 db.setAnzhuangdanwei(rs.getObject(34)==null?"":rs.getString(34));//其他专业人员数量：
				 db.setJianjiandanwei(rs.getObject(35)==null?"":rs.getString(35));//年 产 值（万元）：
				
			 } 
		 	
			
         }
		return db;
		
	}
	
	
	
	/**
	 * 总条数
	 * @return
	 * @throws ParseException 
	 */
	public int countRow(String sql) throws ParseException{
		int i = 0;
		bcon = getConBURL();
		
		try {
			Statement stmt=bcon.createStatement();
			brs=stmt.executeQuery(sql);
			//ResultSetMetaData md = brs.getMetaData(); //得到结果集(rs)的结构信息，比如字段数、字段名等   
			//int columnCount = md.getColumnCount();//返回此 ResultSet 对象中的列数   
			
	         while (brs.next()) {   
	        	
	        	 i = brs.getInt(1);
	         }   
	         return i;
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			closeAllBURL();
		}
		
		return 0;
	}
	
	
	
	/**
	 * 查找其他项目
	 * @param organid
	 * @return
	 * @throws ParseException 
	 */
	public List findQtInfo(String organid,String lx,String leibie) throws ParseException{
		
		String sql = "";
		String zhengshu = "m2_zzjg.sp_sesj_cert";
		String renyuan = "M2_PERSON.SP_SESJ_DEVISEPERSON";   
		if("特种设备设计许可".equals(leibie)){
			zhengshu = "m2_zzjg.sp_sesj_cert";
			renyuan = "M2_PERSON.SP_SESJ_DEVISEPERSON";
		}else if("特种设备制造许可".equals(leibie)){
			zhengshu = "m2_zzjg.sp_sezz_cert";
			renyuan = "M2_PERSON.SP_SEZZ_MANAGERPERSON";
		}else if("气瓶充装许可".equals(leibie)){
			zhengshu = "M2_ZZJG.SP_SECZ_CERT";  
			renyuan = "M2_PERSON.SP_SECZ_BOTTLEPERSON";
		}else if("移动式压力容器充装许可".equals(leibie)){
			zhengshu = "M2_ZZJG.sp_segccz_cert";  
			renyuan = "M2_PERSON.SP_SEGCCZ_MANAGERPERSON";
		}else if("特种设备安装改造维修许可".equals(leibie)){  //特种设备安装改造维修许可
			zhengshu = "M2_ZZJG.SP_SEAGW_CERT"; // M2_ZZJG.SP_SEAGW_CERT
			renyuan = "M2_PERSON.SP_SEAGW_MANAGERPERSON";
		}
		
		if("3".equals(lx)){
			sql = " select ID,ITEMNAME,CERTNO,SDATE,EDATE,ISSUECERTORG,CERTCHANGEDATE,CERTTYPE from "+zhengshu+" WHERE ORGANID = "+organid;
		}else if("30".equals(lx)){
			if("气瓶充装许可".equals(leibie)){
				sql = " select ID,NAME,CARD,workpostname,workcertno,DUTYNAME from "+renyuan+" WHERE ORGANID = "+organid;
			}else{
				sql = " select ID,NAME,CARD,SPECIALITY,XUELINAME,DUTYNAME from "+renyuan+" WHERE ORGANID = "+organid;
			}
		}
		
		
		List list = new ArrayList();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		bcon = getConBURL();
		if(sql != ""){
			
		try {
			Statement stmt=bcon.createStatement();
			
			brs=stmt.executeQuery(sql);
			
	         while (brs.next()) {   
	        	 //ID,ITEMNAME,CERTNO,SDATE,EDATE,ISSUECERTORG,CERTCHANGEDATE,CERTTYPE
	        	
    		 	TDBUtils db = new TDBUtils();
    		 	if("3".equals(lx)){
    		 		db.setId(brs.getLong(1));
        		 	db.setItemname(brs.getObject(2)==null?"":brs.getString(2));
        		 	db.setCertno(brs.getObject(3)==null?"":brs.getString(3));
        		 	db.setSdate(brs.getObject(4)==null?null:sdf.parse(sdf.format(brs.getDate(4))));
        		 	db.setEdate(brs.getObject(5)==null?null:sdf.parse(sdf.format(brs.getDate(5))));
        		 	db.setFazhengjigou(brs.getObject(6)==null?"":brs.getString(6));
        		 	db.setBiangengriqi(brs.getObject(7)==null?"":sdf.format(brs.getDate(7)));
        		 	db.setFazhengleixing("1".equals(brs.getObject(8))?"省发":"市发");
    		 	}else if("30".equals(lx)){  
    		 		//ID,NAME,CARD,SPECIALITY,XUELINAME,DUTYNAME
    		 		db.setId(brs.getLong(1));
        		 	db.setItemname(brs.getObject(2)==null?"":brs.getString(2)); //作业项目
        		 	db.setCertno(brs.getObject(3)==null?"":brs.getString(3)); //姓名
        		 	db.setChenglijiguan(brs.getObject(4)==null?"":brs.getString(4)); //身份证编号
        		 	db.setDengjijigou(brs.getObject(5)==null?"":brs.getString(5)); //所学专业
        		 	db.setFazhengjigou(brs.getObject(6)==null?"":brs.getString(6)); //学历中文描述
        		 	//db.setZhudehao(brs.getObject(7)==null?"":brs.getString(7)); //职称中文描述
    		 	}
				
	        	 list.add(db);
	         }   
	         return list;
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			closeAllBURL();
		}
		
		}
		
		
		return null;
	}
	
	
	//导出excel表格
	public void expExcel(String query,OutputStream os) throws UnsupportedEncodingException{
//		columns = URLDecoder.decode(columns,"utf-8");
		WritableWorkbook workbook = null;
		String title = "单位名称,行政区划,联系人,联系电话,许可证类别,取证时间,有效期至";//标题
		String colName = "orgname,region,singleman,tel,itemname,sdate,edate";//表列名
//		String[] clnArr = columns.split(",");
//		String[] colArr = null;
//		for(String c : clnArr){
//			colArr = c.split("\\|");
//			title += colArr[0]+",";
//			colName += colArr[1]+",";
//		}
//		if(title.endsWith(",")){
//			title = title.substring(0,title.length()-1);
//			colName = colName.substring(0,colName.length()-1);
//		}
		
		try {
			// 创建Excel
			workbook = Workbook.createWorkbook(os);
			// 在Excel中新建一个sheet
			WritableSheet wsheet = workbook.createSheet("列表", 0);
	
			// 根据标题列数设置每列宽度
			String[] titles = title.split(",");
			for (int i = 0; i < titles.length; i++) {
				wsheet.setColumnView(i, 20);
			}
			// 标题字体
			WritableFont font = new WritableFont(WritableFont.ARIAL, 12,
					WritableFont.BOLD, false,
					jxl.format.UnderlineStyle.NO_UNDERLINE,
					jxl.format.Colour.BLACK);
			WritableCellFormat format = new WritableCellFormat(font);
			// 标题设置		
			for (int i = 0; i < titles.length; i++) {
				Label wlabel = new Label(i, 0, String.valueOf(titles[i]), format);
				wsheet.addCell(wlabel);
			}
			// 内容字体
			font = new jxl.write.WritableFont(WritableFont.createFont("宋体"),
					12, WritableFont.NO_BOLD, false,
					jxl.format.UnderlineStyle.NO_UNDERLINE,
					jxl.format.Colour.BLACK);
			format = new jxl.write.WritableCellFormat(font);
	
			List<HashMap<String,Object>> list =    this.findDb(query);
				//super.findListBySql(query);
			String v = "";
			for(int i = 0;i<list.size();i++){
				String[] colNameArr = colName.split(",");
				HashMap<String,Object> m = list.get(i);
				
				for(int c = 0;c<colNameArr.length;c++){
					v = "";
					if ((m.get(colNameArr[c]) instanceof Date)) {
						v = DateFormatTool.format((Date) m.get(colNameArr[c]), false);
					} else {
						v = m.get(colNameArr[c]) == null ? "" : m.get(colNameArr[c]).toString();
						if("zcstatus".equals(colNameArr[c])){
							if(!"".equals(v)){
								switch (Integer.parseInt(v)) {
								case 0:
									v = "在用";
									break;
								case 1:
									v = "在用";
									break;
								case 3:
									v = "已停用";
									break;
								case 5:
									v = "已注销";
									break;
								case 7:
									v = "已报废";
									break;
								default:
									break;
								}
							}
						}
					}
					Label wlabel = new Label(c, i+1, v, format);
					wsheet.addCell(wlabel);
				}
			}
			// 循环记录放入Excel
		/*	for (int i = 0; i < list.size(); i++) {
				Label wlabel1 = new Label(0, i+1, list.get(i).getZhucedaima() , format);
				wsheet.addCell(wlabel1);
				Label wlabel2 = new Label(1, i+1, list.get(i).getDengjizhengbianhao() , format);
				wsheet.addCell(wlabel2);
				Label wlabel3 = new Label(2, i+1, list.get(i).getShebeimingcheng() , format);
				wsheet.addCell(wlabel3);
				Label wlabel4 = new Label(3, i+1, list.get(i).getShiyongdanwei() , format);
				wsheet.addCell(wlabel4);
				Label wlabel5 = new Label(4, i+1, list.get(i).getShiyongdanwei_dizhi() , format);
				wsheet.addCell(wlabel5);
				Label wlabel6 = new Label(5, i+1, list.get(i).getQuhuamingcheng() , format);
				wsheet.addCell(wlabel6);
				Label wlabel7 = new Label(6, i+1, null == list.get(i).getJianyanjieshuriqi() ? "" : DateFormatTool.formate(list.get(i).getJianyanjieshuriqi(),"yyyy-MM-dd") , format);
				wsheet.addCell(wlabel7);
				Label wlabel8 = new Label(7, i+1, null == list.get(i).getXiacijianyanriqi() ? "" : DateFormatTool.formate(list.get(i).getXiacijianyanriqi(), "yyyy-MM-dd") , format);
				wsheet.addCell(wlabel8);
				Label wlabel9 = new Label(8, i+1, list.get(i).getShiyongdanwei_lianxiren() , format);
				wsheet.addCell(wlabel9);
				Label wlabel10 = new Label(9, i+1, list.get(i).getShiyongdanwei_lianxidianhua() , format);
				wsheet.addCell(wlabel10);
			}*/
			workbook.write();
			workbook.close();
			os.close();
		} catch (Exception e) {
			
		}
	}
}
