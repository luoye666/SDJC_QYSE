package com.stone.webservice.segl.pojo.dongying;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 锅炉
 * @author chao
 * @time 2013年12月10日15:04:02
 */

@Entity
@Table(name = "BIZ_BOILERPARAM")
@PrimaryKeyJoinColumn(name="BoilerID")
public class TBoilerParamD extends TBaseInfoD implements Serializable, Cloneable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4602058261451287397L;
	
	
	private String edingchuli;//	VARCHAR2(50)	额定出力
	private String edingyali;//	NUMBER(4,2)	额定压力
	private String edingwendu;//	NUMBER(3)	额定温度
	private String gongzuoyali;//	NUMBER(4,2)	工作压力
	private String chukouwendu;//	NUMBER(4,1)	出口温度
	private String huishuiwendu;
	/**
	 * 额定蒸发量
	 */
	private String edingzhengfaliang;
	/**
	 * 再热蒸汽流量
	 */
	private String zairezhengqiliuliang;
	/**
	 * 锅筒工作压力
	 */
	private String guotonggongzuoyali;
	private String gongzuowendu;//	NUMBER(4,1)	工作温度
	/**
	 * 过热蒸汽出口温度
	 */
	private String guorezhengqichukouwendu;
	/**
	 * 过热蒸汽出口压力
	 */
	private String guorezhengqichukouyali;
	/**
	 * 再热蒸汽进口压力
	 */
	private String zairezhengqijinkouyali;
	/**
	 * 再热蒸汽出口温度
	 */
	private String zairezhengqichukouwendu;
	/**
	 * 再热蒸汽出口压力
	 */
	private String zairezhengqichukouyali;
	/**
	 * 出水温度
	 */
	private String chushuiwendu;
	/**
	 * 给水温度
	 */
	private String geishuiwendu;
	
	private String jinkouwendu; //再热器进（出）口温度 ℃
	public String getEdingchuli() {
		return edingchuli;
	}
	public void setEdingchuli(String edingchuli) {
		this.edingchuli = edingchuli;
	}
	public String getEdingyali() {
		return edingyali;
	}
	public void setEdingyali(String edingyali) {
		this.edingyali = edingyali;
	}
	public String getEdingwendu() {
		return edingwendu;
	}
	public void setEdingwendu(String edingwendu) {
		this.edingwendu = edingwendu;
	}
	public String getGongzuoyali() {
		return gongzuoyali;
	}
	public void setGongzuoyali(String gongzuoyali) {
		this.gongzuoyali = gongzuoyali;
	}
	public String getChukouwendu() {
		return chukouwendu;
	}
	public void setChukouwendu(String chukouwendu) {
		this.chukouwendu = chukouwendu;
	}
	public String getHuishuiwendu() {
		return huishuiwendu;
	}
	public void setHuishuiwendu(String huishuiwendu) {
		this.huishuiwendu = huishuiwendu;
	}
	public String getEdingzhengfaliang() {
		return edingzhengfaliang;
	}
	public void setEdingzhengfaliang(String edingzhengfaliang) {
		this.edingzhengfaliang = edingzhengfaliang;
	}
	public String getZairezhengqiliuliang() {
		return zairezhengqiliuliang;
	}
	public void setZairezhengqiliuliang(String zairezhengqiliuliang) {
		this.zairezhengqiliuliang = zairezhengqiliuliang;
	}
	public String getGuotonggongzuoyali() {
		return guotonggongzuoyali;
	}
	public void setGuotonggongzuoyali(String guotonggongzuoyali) {
		this.guotonggongzuoyali = guotonggongzuoyali;
	}
	public String getGongzuowendu() {
		return gongzuowendu;
	}
	public void setGongzuowendu(String gongzuowendu) {
		this.gongzuowendu = gongzuowendu;
	}
	public String getGuorezhengqichukouwendu() {
		return guorezhengqichukouwendu;
	}
	public void setGuorezhengqichukouwendu(String guorezhengqichukouwendu) {
		this.guorezhengqichukouwendu = guorezhengqichukouwendu;
	}
	public String getGuorezhengqichukouyali() {
		return guorezhengqichukouyali;
	}
	public void setGuorezhengqichukouyali(String guorezhengqichukouyali) {
		this.guorezhengqichukouyali = guorezhengqichukouyali;
	}
	public String getZairezhengqijinkouyali() {
		return zairezhengqijinkouyali;
	}
	public void setZairezhengqijinkouyali(String zairezhengqijinkouyali) {
		this.zairezhengqijinkouyali = zairezhengqijinkouyali;
	}
	public String getZairezhengqichukouwendu() {
		return zairezhengqichukouwendu;
	}
	public void setZairezhengqichukouwendu(String zairezhengqichukouwendu) {
		this.zairezhengqichukouwendu = zairezhengqichukouwendu;
	}
	public String getZairezhengqichukouyali() {
		return zairezhengqichukouyali;
	}
	public void setZairezhengqichukouyali(String zairezhengqichukouyali) {
		this.zairezhengqichukouyali = zairezhengqichukouyali;
	}
	public String getChushuiwendu() {
		return chushuiwendu;
	}
	public void setChushuiwendu(String chushuiwendu) {
		this.chushuiwendu = chushuiwendu;
	}
	public String getGeishuiwendu() {
		return geishuiwendu;
	}
	public void setGeishuiwendu(String geishuiwendu) {
		this.geishuiwendu = geishuiwendu;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getJinkouwendu() {
		return jinkouwendu;
	}
	public void setJinkouwendu(String jinkouwendu) {
		this.jinkouwendu = jinkouwendu;
	}
	
	
	
	
	
}
