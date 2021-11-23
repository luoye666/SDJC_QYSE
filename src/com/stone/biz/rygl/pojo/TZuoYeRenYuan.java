package com.stone.biz.rygl.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "TAB_QY_ZUOYERENYUAN")
public class TZuoYeRenYuan implements Serializable {
	
	private Long id = Long.valueOf(Long.parseLong("0"));
	private String xingming;  //姓名
	private String shenfenzhenghao; //身份证号
	private String sex; //性别
	private String shi; //
	private String shidaima;
	private String quxian;
	private String quxiandaima;
	private String xiangzhen;
	private String xiangzhendaima;
	private String zhengshubianhao; //证书编号
	private String fazhengjiguan; //发证机关
	private Date fazhengriqi; //发证日期
	private Date zhengshuyouxiaoqi_end;//证件有效期至
	private String lianxidianhua; //电话
	private String zuoyezhonglei; //作业种类
	private String zuoyexiangmu; // 作业项目
	private Long sydw_id;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_QY_ZUOYERENYUAN")
	@SequenceGenerator(name = "SEQ_QY_ZUOYERENYUAN", allocationSize = 1, sequenceName = "SEQ_QY_ZUOYERENYUAN")
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getZuoyezhonglei() {
		return zuoyezhonglei;
	}

	public void setZuoyezhonglei(String zuoyezhonglei) {
		this.zuoyezhonglei = zuoyezhonglei;
	}

	public String getZuoyexiangmu() {
		return zuoyexiangmu;
	}

	public void setZuoyexiangmu(String zuoyexiangmu) {
		this.zuoyexiangmu = zuoyexiangmu;
	}

	public String getZhengshubianhao() {
		return zhengshubianhao;
	}

	public void setZhengshubianhao(String zhengshubianhao) {
		this.zhengshubianhao = zhengshubianhao;
	}

	public String getLianxidianhua() {
		return lianxidianhua;
	}

	public void setLianxidianhua(String lianxidianhua) {
		this.lianxidianhua = lianxidianhua;
	}

	public Date getFazhengriqi() {
		return fazhengriqi;
	}

	public void setFazhengriqi(Date fazhengriqi) {
		this.fazhengriqi = fazhengriqi;
	}

	public Date getZhengshuyouxiaoqi_end() {
		return zhengshuyouxiaoqi_end;
	}

	public void setZhengshuyouxiaoqi_end(Date zhengshuyouxiaoqiEnd) {
		zhengshuyouxiaoqi_end = zhengshuyouxiaoqiEnd;
	}

	public String getFazhengjiguan() {
		return fazhengjiguan;
	}

	public void setFazhengjiguan(String fazhengjiguan) {
		this.fazhengjiguan = fazhengjiguan;
	}

	public String getXingming() {
		return xingming;
	}

	public void setXingming(String xingming) {
		this.xingming = xingming;
	}

	public String getShenfenzhenghao() {
		return shenfenzhenghao;
	}

	public void setShenfenzhenghao(String shenfenzhenghao) {
		this.shenfenzhenghao = shenfenzhenghao;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getShi() {
		return shi;
	}

	public void setShi(String shi) {
		this.shi = shi;
	}

	public String getShidaima() {
		return shidaima;
	}

	public void setShidaima(String shidaima) {
		this.shidaima = shidaima;
	}

	public String getQuxian() {
		return quxian;
	}

	public void setQuxian(String quxian) {
		this.quxian = quxian;
	}

	public String getQuxiandaima() {
		return quxiandaima;
	}

	public void setQuxiandaima(String quxiandaima) {
		this.quxiandaima = quxiandaima;
	}

	public String getXiangzhen() {
		return xiangzhen;
	}

	public void setXiangzhen(String xiangzhen) {
		this.xiangzhen = xiangzhen;
	}

	public String getXiangzhendaima() {
		return xiangzhendaima;
	}

	public void setXiangzhendaima(String xiangzhendaima) {
		this.xiangzhendaima = xiangzhendaima;
	}

	public Long getSydw_id() {
		return sydw_id;
	}

	public void setSydw_id(Long sydwId) {
		sydw_id = sydwId;
	}
	
}
