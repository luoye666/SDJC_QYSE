package com.stone.biz.utils.pojo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "TAB_AZUNITS")
public class TAzUtils implements Serializable,Cloneable {
	private Long id = Long.valueOf(Long.parseLong("0"));
	private String unitsname;
	private String unitsadd;
	private String unitsid;
	private String corporation;
	private String corporationtel;
	private String shi;
	private String shidaima;
	private String quxian;
	private String quxiandaima;
	private String xiangzhen;
	private String xiangzhendaima;
	//临时数据状态       0  正式数据  1 临时数据   点击保存后生成的数据
	private String tmpData;
	//正式数据的id
	private Long pid;

	@Id
	@Column(name = "ANNALID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_AZUNITS")
	@SequenceGenerator(name = "SEQ_AZUNITS", allocationSize = 1, sequenceName = "SEQ_AZUNITS")
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUnitsname() {
		return this.unitsname;
	}

	public void setUnitsname(String unitsname) {
		this.unitsname = unitsname;
	}

	public String getUnitsadd() {
		return this.unitsadd;
	}

	public void setUnitsadd(String unitsadd) {
		this.unitsadd = unitsadd;
	}

	public String getUnitsid() {
		return this.unitsid;
	}

	public void setUnitsid(String unitsid) {
		this.unitsid = unitsid;
	}

	public String getCorporation() {
		return this.corporation;
	}

	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}

	public String getCorporationtel() {
		return this.corporationtel;
	}

	public void setCorporationtel(String corporationtel) {
		this.corporationtel = corporationtel;
	}

	public String getTmpData() {
		return tmpData;
	}

	public void setTmpData(String tmpData) {
		this.tmpData = tmpData;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
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

	public TAzUtils clone(){
		Object object = null;
		try {
			object = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (TAzUtils)object;
	}
}
