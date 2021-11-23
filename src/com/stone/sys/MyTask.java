package com.stone.sys;

import java.util.Date;
import java.util.TimerTask;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.stone.support.utils.DesUtils;

public class MyTask extends TimerTask {

	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String AURL = "jdbc:oracle:thin:@localhost:1521:YTDBSRV";
    public static final String AUSER = "YTSE";
	public static final String APWD = "YTSE2014";
	public static final String BURL = "cdb5599e3eab8b9bb90f83e8ea05c6163b2c6ff684221b75abd7b4189858598ea6caf31dcaa126a06e8662b6d7f37c27";
	public static final String BUSER = "d1eae0e3d84f53e3";
	public static final String BPWD =  "30912088d2029fe4";
	
	private static final String UPDATE_PREFIX = "UPDATE SEBASEINFO SET ";
	private static final String YTSE_UPDATE = "UPDATE BIZ_BJBG SET UPD_STATUS = '1' WHERE UPD_STATUS = '0' AND REG_CODE = '";

	private Connection acon = null;
	private Connection bcon = null;
	private PreparedStatement aps = null;
	private PreparedStatement bps = null;
	private ResultSet ars = null;
	private ResultSet brs = null;
	public static DataSource asource = null;
	public static DataSource bsource = null;
	private DesUtils des = null;

	public Connection getConAURL() {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			acon = DriverManager.getConnection(AURL, AUSER, APWD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return acon;
	}

	public Connection getConBURL() {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			des = new DesUtils();
			bcon = DriverManager.getConnection(des.decrypt(BURL), des.decrypt(BUSER), des.decrypt(BPWD));
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return bcon;

	}

	public void closeAllAURL() {
		if (ars != null) {
			try {
				ars.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (aps != null) {
			try {
				aps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (acon != null) {
			try {
				acon.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
	}
	
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
   
	public String[] createSQL(String selectSql) {
		String[] resultArray=new String[2];
		String ycdbScriptSQL = "";
		String ytseScriptSQL = ""; 
		acon = getConAURL();
		try {
			Statement stmt=acon.createStatement();
			ars=stmt.executeQuery(selectSql);
		    while(ars.next())   
		    {  
		      String ycdbUpdateSQL = UPDATE_PREFIX;
		      String ytseUpdateSQL = YTSE_UPDATE; 
		      ycdbUpdateSQL += " TEST_DATE = to_date('"+ars.getDate(2)+"','yyyy-mm-dd'),NEXT_TEST_DATE = to_date('"+ars.getDate(3)+"','yyyy-mm-dd')"
              +"  WHERE SE_CODE = '"+ars.getString(1)+"';"; 
		      ycdbScriptSQL+=ycdbUpdateSQL;
		      
	          ytseUpdateSQL=ytseUpdateSQL+ars.getString(1)+"';";
	          ytseScriptSQL+=ytseUpdateSQL;
	          
		    }
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			closeAllAURL();
		}
		resultArray[0]=ycdbScriptSQL;
		resultArray[1]=ytseScriptSQL;
		return resultArray;
	}

	public int updateYcse(String sql) {
		int resu = 0;
		bcon = getConBURL();
		try {
			bps = bcon.prepareStatement(sql);
			resu = bps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAllBURL();
		}
		return resu;
	}
	
	public int updateYtse(String sql) {
		int resu = 0;
		bcon = getConAURL();
		try {
			bps = bcon.prepareStatement(sql);
			resu = bps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAllAURL();
		}
		return resu;
	}

	public void run() {
		
		System.out.println("----------------call at " + (new Date())+ "----------------------------");
		String selectSQL="select * from biz_bjbg t where t.biz_status ='0' and t.upd_status = '0'";
		String[] updateSQL = createSQL(selectSQL);
		if (updateSQL != null && updateSQL.length > 0) {
			if(!"".equals(updateSQL[0])){
				String[] strArrayYcse = updateSQL[0].split(";");
				int ycselength = strArrayYcse.length;
				for (int i = 0; i < ycselength; i++) {
					updateYcse(strArrayYcse[i]);
				}
			}
			if(!"".equals(updateSQL[1])){
				String[] strArrayYtse = updateSQL[1].split(";");
				int ytselength = strArrayYtse.length;
				for (int j = 0; j < ytselength; j++) {
					updateYtse(strArrayYtse[j]);
				}
			}	
		}
	}
}
