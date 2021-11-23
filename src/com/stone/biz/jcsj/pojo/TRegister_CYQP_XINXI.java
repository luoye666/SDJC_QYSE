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
 * 车用气瓶详细信息表 ("BIZ_register_cyqp_xinxi")
 *
 */
@Entity
@Table(name="BIZ_REGISTER_CYQP_XINXI")
public class TRegister_CYQP_XINXI {

	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_BIZ_REGISTER_CYQP_XINXI")
    @SequenceGenerator(name="SEQ_BIZ_REGISTER_CYQP_XINXI",allocationSize=1, sequenceName="SEQ_BIZ_REGISTER_CYQP_XINXI")
	private Long id	;//number(18)	n			系统主键
	
	//制造单位
	private String zhizaodanwei;
	//制造日期
	private String zhizaoriqi;
	//产品编号
	private String chanpinbianhao;
	//单位内编号
	private String danweineibianhao;
	//登记表ID
	private Long register_id;

	private String type;
	private String xuhao;
	private String pihao;
	private String jingzhong;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getRegister_id() {
		return register_id;
	}
	public void setRegister_id(Long registerId) {
		register_id = registerId;
	}
	public String getZhizaodanwei() {
		return zhizaodanwei;
	}
	public void setZhizaodanwei(String zhizaodanwei) {
		this.zhizaodanwei = zhizaodanwei;
	}
	public String getZhizaoriqi() {
		return zhizaoriqi;
	}
	public void setZhizaoriqi(String zhizaoriqi) {
		this.zhizaoriqi = zhizaoriqi;
	}
	public String getChanpinbianhao() {
		return chanpinbianhao;
	}
	public void setChanpinbianhao(String chanpinbianhao) {
		this.chanpinbianhao = chanpinbianhao;
	}
	public String getDanweineibianhao() {
		return danweineibianhao;
	}
	public void setDanweineibianhao(String danweineibianhao) {
		this.danweineibianhao = danweineibianhao;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getXuhao() {
		return xuhao;
	}
	public void setXuhao(String xuhao) {
		this.xuhao = xuhao;
	}
	public String getPihao() {
		return pihao;
	}
	public void setPihao(String pihao) {
		this.pihao = pihao;
	}
	public String getJingzhong() {
		return jingzhong;
	}
	public void setJingzhong(String jingzhong) {
		this.jingzhong = jingzhong;
	}
	
	
}
