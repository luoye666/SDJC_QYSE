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
@Table(name = "BIZ_FUJIANFUJI")
public class TFujianfuji implements Serializable,Cloneable {
	private Long id = Long.valueOf(Long.parseLong("0"));
	/**
	 * 名称
	 */
	private String mingcheng;
	private String xinghao;
	private String guige;
	private String shuliang;
	private String zhizaochangjia;
	private String djbid;
	private String chanpinbianhao;
	private String zhizaoriqi;
	private String hegezhenghao;

	@Id
	@Column(name = "ANNALID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_BIZ_FUJIFUJIAN")
	@SequenceGenerator(name = "SEQ_BIZ_FUJIFUJIAN", allocationSize = 1, sequenceName = "SEQ_BIZ_FUJIFUJIAN")
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

	public String getXinghao() {
		return xinghao;
	}

	public void setXinghao(String xinghao) {
		this.xinghao = xinghao;
	}

	public String getGuige() {
		return guige;
	}

	public void setGuige(String guige) {
		this.guige = guige;
	}

	public String getShuliang() {
		return shuliang;
	}

	public void setShuliang(String shuliang) {
		this.shuliang = shuliang;
	}
	public String getZhizaochangjia() {
		return zhizaochangjia;
	}

	public void setZhizaochangjia(String zhizaochangjia) {
		this.zhizaochangjia = zhizaochangjia;
	}

	public String getDjbid() {
		return djbid;
	}

	public void setDjbid(String djbid) {
		this.djbid = djbid;
	}

	public String getChanpinbianhao() {
		return chanpinbianhao;
	}

	public void setChanpinbianhao(String chanpinbianhao) {
		this.chanpinbianhao = chanpinbianhao;
	}

	public String getZhizaoriqi() {
		return zhizaoriqi;
	}

	public void setZhizaoriqi(String zhizaoriqi) {
		this.zhizaoriqi = zhizaoriqi;
	}

	public String getHegezhenghao() {
		return hegezhenghao;
	}

	public void setHegezhenghao(String hegezhenghao) {
		this.hegezhenghao = hegezhenghao;
	}
	public TFujianfuji clone(){
		Object obj = null;
		try {
			obj = super.clone();
		} catch (CloneNotSupportedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return (TFujianfuji)obj;
	}

}