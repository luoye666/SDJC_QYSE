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
 * 气瓶基本信息汇总表 ("BIZ_register_ylgd_hzb")
 * @author Chao
 *
 */
@Entity
@Table(name="BIZ_REGISTER_QP_HZB")
public class TRegister_QP_HZB {

	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_BIZ_REGISTER_QP_HZB")
    @SequenceGenerator(name="SEQ_BIZ_REGISTER_QP_HZB",allocationSize=1, sequenceName="SEQ_BIZ_REGISTER_QP_HZB")
	private Long id	;//number(18)	n			系统主键
	
	//设备品种
	private String shebeipinzhong;
	//产品编号
	private String chanpinbianhao;
	//充装介质
	private String chongzhuangjiezhi;
	//制造单位
	private String zhizaodanwei;
	//制造年月
	private String zhizaonianyue;
	//公称工作压力
	private String gongzuoyali;
	//容积
	private String rongji;
	//最近一次检验日期
	private Date zuihoujianyanriqi;
	//下次检验日期
	private Date xiacijianyanriqi;
	//单位内编号
	private String danweineibianhao;
	//变更或停用情况
	private String biangengtingyong;
	//信息化管理情况
	private String xinxihua;
	//登记表ID
	private Long register_id;
	
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
	public String getShebeipinzhong() {
		return shebeipinzhong;
	}
	public void setShebeipinzhong(String shebeipinzhong) {
		this.shebeipinzhong = shebeipinzhong;
	}
	public String getChanpinbianhao() {
		return chanpinbianhao;
	}
	public void setChanpinbianhao(String chanpinbianhao) {
		this.chanpinbianhao = chanpinbianhao;
	}
	public String getChongzhuangjiezhi() {
		return chongzhuangjiezhi;
	}
	public void setChongzhuangjiezhi(String chongzhuangjiezhi) {
		this.chongzhuangjiezhi = chongzhuangjiezhi;
	}
	public String getZhizaodanwei() {
		return zhizaodanwei;
	}
	public void setZhizaodanwei(String zhizaodanwei) {
		this.zhizaodanwei = zhizaodanwei;
	}
	public String getZhizaonianyue() {
		return zhizaonianyue;
	}
	public void setZhizaonianyue(String zhizaonianyue) {
		this.zhizaonianyue = zhizaonianyue;
	}
	public String getGongzuoyali() {
		return gongzuoyali;
	}
	public void setGongzuoyali(String gongzuoyali) {
		this.gongzuoyali = gongzuoyali;
	}
	public String getRongji() {
		return rongji;
	}
	public void setRongji(String rongji) {
		this.rongji = rongji;
	}
	public Date getZuihoujianyanriqi() {
		return zuihoujianyanriqi;
	}
	public void setZuihoujianyanriqi(Date zuihoujianyanriqi) {
		this.zuihoujianyanriqi = zuihoujianyanriqi;
	}
	public Date getXiacijianyanriqi() {
		return xiacijianyanriqi;
	}
	public void setXiacijianyanriqi(Date xiacijianyanriqi) {
		this.xiacijianyanriqi = xiacijianyanriqi;
	}
	public String getDanweineibianhao() {
		return danweineibianhao;
	}
	public void setDanweineibianhao(String danweineibianhao) {
		this.danweineibianhao = danweineibianhao;
	}
	public String getBiangengtingyong() {
		return biangengtingyong;
	}
	public void setBiangengtingyong(String biangengtingyong) {
		this.biangengtingyong = biangengtingyong;
	}
	public String getXinxihua() {
		return xinxihua;
	}
	public void setXinxihua(String xinxihua) {
		this.xinxihua = xinxihua;
	}
	
	
}
