package com.stone.biz.jcsj.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;


/**
 * 压力管道基本信息汇总表 ("BIZ_register_ylgd_hzb")
 * @author Chao
 *
 */
@Entity
@Table(name="BIZ_REGISTER_GL_HZB")
public class TRegister_GL_HZB {

	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_BIZ_REGISTER_GL_HZB")
    @SequenceGenerator(name="SEQ_BIZ_REGISTER_GL_HZB",allocationSize=1, sequenceName="SEQ_BIZ_REGISTER_GL_HZB")
	private Long id	;//number(18)	n			系统主键
	
	private String shouyabujian; //主要受压部件
	private String cailiao; //材料
	private String bihou; //壁厚mm
	private String fangfa; //方法
	private String bili; //比例%
	private String wendu; //温度℃
	private String shijian; //时间h
	private String jiezhi; //介质
	private String yali; //压力MPa
	private Long register_id;//注册登记表主键
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getShouyabujian() {
		return shouyabujian;
	}
	public String getCailiao() {
		return cailiao;
	}
	public String getBihou() {
		return bihou;
	}
	public String getFangfa() {
		return fangfa;
	}
	public String getBili() {
		return bili;
	}
	public String getWendu() {
		return wendu;
	}
	public String getShijian() {
		return shijian;
	}
	public String getJiezhi() {
		return jiezhi;
	}
	public String getYali() {
		return yali;
	}
	public void setShouyabujian(String shouyabujian) {
		this.shouyabujian = shouyabujian;
	}
	public void setCailiao(String cailiao) {
		this.cailiao = cailiao;
	}
	public void setBihou(String bihou) {
		this.bihou = bihou;
	}
	public void setFangfa(String fangfa) {
		this.fangfa = fangfa;
	}
	public void setBili(String bili) {
		this.bili = bili;
	}
	public void setWendu(String wendu) {
		this.wendu = wendu;
	}
	public void setShijian(String shijian) {
		this.shijian = shijian;
	}
	public void setJiezhi(String jiezhi) {
		this.jiezhi = jiezhi;
	}
	public void setYali(String yali) {
		this.yali = yali;
	}
	public Long getRegister_id() {
		return register_id;
	}
	public void setRegister_id(Long registerId) {
		register_id = registerId;
	}
	
	
}
