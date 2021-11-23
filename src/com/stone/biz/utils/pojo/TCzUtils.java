package com.stone.biz.utils.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "TAB_CZUNITS")
public class TCzUtils implements Serializable,Cloneable {
	private Long id = Long.valueOf(Long.parseLong("0"));
	private String dwmc;
	private String dwdz;
	private String frdb;
	private String frtel;
	private String qtlb;
	private String qtzl;
	private Date fzrq;
	private Date zsyxq;
	private String zsbh;
	private String meo;
	private String czfw;
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
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_CZUNITS")
	@SequenceGenerator(name = "SEQ_CZUNITS", allocationSize = 1, sequenceName = "SEQ_CZUNITS")
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDwmc() {
		return this.dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getDwdz() {
		return this.dwdz;
	}

	public void setDwdz(String dwdz) {
		this.dwdz = dwdz;
	}

	public String getFrdb() {
		return this.frdb;
	}

	public void setFrdb(String frdb) {
		this.frdb = frdb;
	}

	public String getFrtel() {
		return this.frtel;
	}

	public void setFrtel(String frtel) {
		this.frtel = frtel;
	}

	public String getQtlb() {
		return this.qtlb;
	}

	public void setQtlb(String qtlb) {
		this.qtlb = qtlb;
	}

	public String getQtzl() {
		return this.qtzl;
	}

	public void setQtzl(String qtzl) {
		this.qtzl = qtzl;
	}

	public Date getFzrq() {
		return this.fzrq;
	}

	public void setFzrq(Date fzrq) {
		this.fzrq = fzrq;
	}

	public Date getZsyxq() {
		return this.zsyxq;
	}

	public void setZsyxq(Date zsyxq) {
		this.zsyxq = zsyxq;
	}

	public String getZsbh() {
		return this.zsbh;
	}

	public void setZsbh(String zsbh) {
		this.zsbh = zsbh;
	}

	public String getMeo() {
		return this.meo;
	}

	public void setMeo(String meo) {
		this.meo = meo;
	}

	public String getCzfw() {
		return this.czfw;
	}

	public void setCzfw(String czfw) {
		this.czfw = czfw;
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

	public TCzUtils clone(){
		Object object = null;
		try {
			object = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (TCzUtils)object;
	}
}
