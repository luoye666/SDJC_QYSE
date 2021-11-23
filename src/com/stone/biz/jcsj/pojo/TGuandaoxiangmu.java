package com.stone.biz.jcsj.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "BIZ_GUANDAOXIANGMU")
public class TGuandaoxiangmu implements Serializable {
	private Long id = Long.valueOf(Long.parseLong("0"));
	
	private String xuhao;
	private String mingcheng;
	private String bianhao;
	private String jibie;
	private String suoshuchejian;
	private String gongchengzhijing;
	private String gongchengbihou;
	private String guandaochangdu;
	private String yali;
	private String wendu;
	private String jiezhi;
	private String qidian;
	private String zhongdian;
	private String pushefangshi;
	private String fangfufangshi;
	private String guandaocaizhi;
	private String guandaodaima;
	private String gudingzichan;
	private String beizhu;
	private String type;
	private String djbid;

	@Id
	@Column(name = "ANNALID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_BIZ_GUANDAOXIANGMU")
	@SequenceGenerator(name = "SEQ_BIZ_GUANDAOXIANGMU", allocationSize = 1, sequenceName = "SEQ_BIZ_GUANDAOXIANGMU")
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMingcheng() {
		return mingcheng;
	}

	public void setMingcheng(String mingcheng) {
		this.mingcheng = mingcheng;
	}

	public String getXuhao() {
		return xuhao;
	}

	public void setXuhao(String xuhao) {
		this.xuhao = xuhao;
	}

	public String getBianhao() {
		return bianhao;
	}

	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}

	public String getJibie() {
		return jibie;
	}

	public void setJibie(String jibie) {
		this.jibie = jibie;
	}

	public String getSuoshuchejian() {
		return suoshuchejian;
	}

	public void setSuoshuchejian(String suoshuchejian) {
		this.suoshuchejian = suoshuchejian;
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

	public String getQidian() {
		return qidian;
	}

	public void setQidian(String qidian) {
		this.qidian = qidian;
	}

	public String getZhongdian() {
		return zhongdian;
	}

	public void setZhongdian(String zhongdian) {
		this.zhongdian = zhongdian;
	}

	public String getPushefangshi() {
		return pushefangshi;
	}

	public void setPushefangshi(String pushefangshi) {
		this.pushefangshi = pushefangshi;
	}

	public String getFangfufangshi() {
		return fangfufangshi;
	}

	public void setFangfufangshi(String fangfufangshi) {
		this.fangfufangshi = fangfufangshi;
	}

	public String getGuandaocaizhi() {
		return guandaocaizhi;
	}

	public void setGuandaocaizhi(String guandaocaizhi) {
		this.guandaocaizhi = guandaocaizhi;
	}

	public String getGuandaodaima() {
		return guandaodaima;
	}

	public void setGuandaodaima(String guandaodaima) {
		this.guandaodaima = guandaodaima;
	}

	public String getGudingzichan() {
		return gudingzichan;
	}

	public void setGudingzichan(String gudingzichan) {
		this.gudingzichan = gudingzichan;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getDjbid() {
		return djbid;
	}

	public void setDjbid(String djbid) {
		this.djbid = djbid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}