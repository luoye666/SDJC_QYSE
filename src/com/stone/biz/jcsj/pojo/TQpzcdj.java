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
@Table(name = "BIZ_QPZCDJ")
public class TQpzcdj implements Serializable {
	private Long id = Long.valueOf(Long.parseLong("0"));
	/**
	 * 名称
	 */
	private String shebeipinzhong;
	private String chongzhuangjiezhi;
	private String zhizaodanwei;
	private String zhizaonianyue;
	private String gongchengyali;
	private String rongji;
	private String shejibihou;
	private String zhyc_jianyanriqi;
	private String xiacijianyanriqi;
	private String dengjidaima;
	private String biangengqingkuang;
	private String tingyongqingkuang;
	private String chuchangbianhao;
	private String changneibianhao;
	private String djbid;

	@Id
	@Column(name = "ANNALID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_BIZ_QPZCDJ")
	@SequenceGenerator(name = "SEQ_BIZ_QPZCDJ", allocationSize = 1, sequenceName = "SEQ_BIZ_QPZCDJ")
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getShebeipinzhong() {
		return shebeipinzhong;
	}

	public void setShebeipinzhong(String shebeipinzhong) {
		this.shebeipinzhong = shebeipinzhong;
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

	public String getGongchengyali() {
		return gongchengyali;
	}

	public void setGongchengyali(String gongchengyali) {
		this.gongchengyali = gongchengyali;
	}

	public String getRongji() {
		return rongji;
	}

	public void setRongji(String rongji) {
		this.rongji = rongji;
	}

	public String getShejibihou() {
		return shejibihou;
	}

	public void setShejibihou(String shejibihou) {
		this.shejibihou = shejibihou;
	}

	public String getZhyc_jianyanriqi() {
		return zhyc_jianyanriqi;
	}

	public void setZhyc_jianyanriqi(String zhycJianyanriqi) {
		zhyc_jianyanriqi = zhycJianyanriqi;
	}

	public String getXiacijianyanriqi() {
		return xiacijianyanriqi;
	}

	public void setXiacijianyanriqi(String xiacijianyanriqi) {
		this.xiacijianyanriqi = xiacijianyanriqi;
	}

	public String getDengjidaima() {
		return dengjidaima;
	}

	public void setDengjidaima(String dengjidaima) {
		this.dengjidaima = dengjidaima;
	}

	public String getBiangengqingkuang() {
		return biangengqingkuang;
	}

	public void setBiangengqingkuang(String biangengqingkuang) {
		this.biangengqingkuang = biangengqingkuang;
	}

	public String getTingyongqingkuang() {
		return tingyongqingkuang;
	}

	public void setTingyongqingkuang(String tingyongqingkuang) {
		this.tingyongqingkuang = tingyongqingkuang;
	}

	public String getChuchangbianhao() {
		return chuchangbianhao;
	}

	public void setChuchangbianhao(String chuchangbianhao) {
		this.chuchangbianhao = chuchangbianhao;
	}

	public String getChangneibianhao() {
		return changneibianhao;
	}

	public void setChangneibianhao(String changneibianhao) {
		this.changneibianhao = changneibianhao;
	}

	public String getDjbid() {
		return djbid;
	}

	public void setDjbid(String djbid) {
		this.djbid = djbid;
	}

}