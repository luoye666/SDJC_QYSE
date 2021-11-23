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
@Table(name="BIZ_REGISTER_YLGD_HZB")
public class TRegister_YLGD_HZB {

	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_BIZ_REGISTER_YLGD_HZB")
    @SequenceGenerator(name="SEQ_BIZ_REGISTER_YLGD_HZB",allocationSize=1, sequenceName="SEQ_BIZ_REGISTER_YLGD_HZB")
	private Long id	;//number(18)	n			系统主键
	
	//管道名称
	private String guandaomingcheng;
	//管道编号
	private String guandaobianhao;
	//管道级别
	private String guandaojibie;
	//设计单位
	private String shejidanwei;
	//安装单位
	private String anzhuangdanwei;
	//安装年月
	private Date anzhuangnianyue;
	//投用年月
	private String touyongnianyue;
	//公称直径
	private String gongchengzhijing;
	//公称壁厚
	private String gongchengbihou;
	//管道长度
	private String guandaochangdu;
	//压力
	private String yali;
	//温度
	private String wendu;
	//介质
	private String jiezhi;
	//检验结论
	private String jianyanjielun;
	//机构名称
	private String jigoumingcheng;
	//下次检验日期
	private Date xiacijianyanriqi;
	//备注
	private String beizhu;
	//登记表ID
	private Long register_id;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getGuandaomingcheng() {
		return guandaomingcheng;
	}
	public void setGuandaomingcheng(String guandaomingcheng) {
		this.guandaomingcheng = guandaomingcheng;
	}
	public String getGuandaobianhao() {
		return guandaobianhao;
	}
	public void setGuandaobianhao(String guandaobianhao) {
		this.guandaobianhao = guandaobianhao;
	}
	public String getGuandaojibie() {
		return guandaojibie;
	}
	public void setGuandaojibie(String guandaojibie) {
		this.guandaojibie = guandaojibie;
	}
	public String getShejidanwei() {
		return shejidanwei;
	}
	public void setShejidanwei(String shejidanwei) {
		this.shejidanwei = shejidanwei;
	}
	public String getAnzhuangdanwei() {
		return anzhuangdanwei;
	}
	public void setAnzhuangdanwei(String anzhuangdanwei) {
		this.anzhuangdanwei = anzhuangdanwei;
	}
	public Date getAnzhuangnianyue() {
		return anzhuangnianyue;
	}
	public void setAnzhuangnianyue(Date anzhuangnianyue) {
		this.anzhuangnianyue = anzhuangnianyue;
	}
	public String getTouyongnianyue() {
		return touyongnianyue;
	}
	public void setTouyongnianyue(String touyongnianyue) {
		this.touyongnianyue = touyongnianyue;
	}
	public String getGongchengzhijing() {
		return gongchengzhijing;
	}
	public void setGongchengzhijing(String gongchengzhijing) {
		this.gongchengzhijing = gongchengzhijing;
	}
	public String getGongchengbihou() {
		return gongchengbihou;
	}
	public void setGongchengbihou(String gongchengbihou) {
		this.gongchengbihou = gongchengbihou;
	}
	public String getGuandaochangdu() {
		return guandaochangdu;
	}
	public void setGuandaochangdu(String guandaochangdu) {
		this.guandaochangdu = guandaochangdu;
	}
	public String getYali() {
		return yali;
	}
	public void setYali(String yali) {
		this.yali = yali;
	}
	public String getWendu() {
		return wendu;
	}
	public void setWendu(String wendu) {
		this.wendu = wendu;
	}
	public String getJiezhi() {
		return jiezhi;
	}
	public void setJiezhi(String jiezhi) {
		this.jiezhi = jiezhi;
	}
	public String getJianyanjielun() {
		return jianyanjielun;
	}
	public void setJianyanjielun(String jianyanjielun) {
		this.jianyanjielun = jianyanjielun;
	}
	public String getJigoumingcheng() {
		return jigoumingcheng;
	}
	public void setJigoumingcheng(String jigoumingcheng) {
		this.jigoumingcheng = jigoumingcheng;
	}
	public Date getXiacijianyanriqi() {
		return xiacijianyanriqi;
	}
	public void setXiacijianyanriqi(Date xiacijianyanriqi) {
		this.xiacijianyanriqi = xiacijianyanriqi;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public Long getRegister_id() {
		return register_id;
	}
	public void setRegister_id(Long registerId) {
		register_id = registerId;
	}
	
	
}
