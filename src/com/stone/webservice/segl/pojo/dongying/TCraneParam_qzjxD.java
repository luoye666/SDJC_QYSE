package com.stone.webservice.segl.pojo.dongying;

import java.text.DecimalFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;


/**
 * 
 * 起重机械_技术参数
 * 
 */
@Entity
@Table(name = "BIZ_CRANEPARAM")
@PrimaryKeyJoinColumn(name="craneId")
public class TCraneParam_qzjxD extends TBaseInfoD implements java.io.Serializable,Cloneable{
	

	/**
	 * 额定起重量  (额定载重量)
	 */
	private String edingqizhongliang;
	/**
	 * 起升高度
	 */
	private String qishenggaodu;
	/**
	 * 起升速度
	 */
	private String qishengsudu;
	
	
	/**
	 * 大车运行速度
	 */
	private String dacheyunxingsudu;
	
	
	/**
	 * 小车运行速度
	 */
	private String xiaocheyunxingsudu;
	

	private String chewei;//车位

	private String edingqizhongliju;//额定起重力矩

	private String cengshu;//层数
	
	
	private String gongzuojibie ;


	public String getEdingqizhongliang() {
		return edingqizhongliang;
	}


	public void setEdingqizhongliang(String edingqizhongliang) {
		this.edingqizhongliang = edingqizhongliang;
	}


	public String getQishenggaodu() {
		return qishenggaodu;
	}


	public void setQishenggaodu(String qishenggaodu) {
		this.qishenggaodu = qishenggaodu;
	}


	public String getQishengsudu() {
		return qishengsudu;
	}


	public void setQishengsudu(String qishengsudu) {
		this.qishengsudu = qishengsudu;
	}


	public String getDacheyunxingsudu() {
		return dacheyunxingsudu;
	}


	public void setDacheyunxingsudu(String dacheyunxingsudu) {
		this.dacheyunxingsudu = dacheyunxingsudu;
	}


	public String getXiaocheyunxingsudu() {
		return xiaocheyunxingsudu;
	}


	public void setXiaocheyunxingsudu(String xiaocheyunxingsudu) {
		this.xiaocheyunxingsudu = xiaocheyunxingsudu;
	}


	public String getChewei() {
		return chewei;
	}


	public void setChewei(String chewei) {
		this.chewei = chewei;
	}


	public String getEdingqizhongliju() {
		return edingqizhongliju;
	}


	public void setEdingqizhongliju(String edingqizhongliju) {
		this.edingqizhongliju = edingqizhongliju;
	}


	public String getCengshu() {
		return cengshu;
	}


	public void setCengshu(String cengshu) {
		this.cengshu = cengshu;
	}


	public String getGongzuojibie() {
		return gongzuojibie;
	}


	public void setGongzuojibie(String gongzuojibie) {
		this.gongzuojibie = gongzuojibie;
	}
	
	
	

	
	
}