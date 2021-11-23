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
@Table(name = "TAB_SCUNITS")
public class TScUtils implements Serializable,Cloneable {
	private Long id = Long.valueOf(Long.parseLong("0"));
	private String dwmc;
	private String dwdz;
	private String frdb;
	private String frtel;
	private String jgdm;
	private Date clrq;
	private String gdzc;
	private String zczj;
	private String jsfzr;
	private String zlfzr;
	private String glzdb;
	private String glzdbzw;
	private String meo;
	private String zrs;
	private String sjrs;
	private String sjsprs;
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
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_SCUNITS")
	@SequenceGenerator(name = "SEQ_SCUNITS", allocationSize = 1, sequenceName = "SEQ_SCUNITS")
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

	public String getJgdm() {
		return this.jgdm;
	}

	public void setJgdm(String jgdm) {
		this.jgdm = jgdm;
	}

	public Date getClrq() {
		return this.clrq;
	}

	public void setClrq(Date clrq) {
		this.clrq = clrq;
	}

	public String getJsfzr() {
		return this.jsfzr;
	}

	public void setJsfzr(String jsfzr) {
		this.jsfzr = jsfzr;
	}

	public String getZlfzr() {
		return this.zlfzr;
	}

	public void setZlfzr(String zlfzr) {
		this.zlfzr = zlfzr;
	}

	public String getMeo() {
		return this.meo;
	}

	public void setMeo(String meo) {
		this.meo = meo;
	}

	public String getGlzdb() {
		return this.glzdb;
	}

	public void setGlzdb(String glzdb) {
		this.glzdb = glzdb;
	}

	public String getGlzdbzw() {
		return this.glzdbzw;
	}

	public void setGlzdbzw(String glzdbzw) {
		this.glzdbzw = glzdbzw;
	}

	public String getGdzc() {
		return gdzc;
	}

	public void setGdzc(String gdzc) {
		this.gdzc = gdzc;
	}

	public String getZczj() {
		return zczj;
	}

	public void setZczj(String zczj) {
		this.zczj = zczj;
	}

	public String getZrs() {
		return zrs;
	}

	public void setZrs(String zrs) {
		this.zrs = zrs;
	}

	public String getSjrs() {
		return sjrs;
	}

	public void setSjrs(String sjrs) {
		this.sjrs = sjrs;
	}

	public String getSjsprs() {
		return sjsprs;
	}

	public void setSjsprs(String sjsprs) {
		this.sjsprs = sjsprs;
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

	public TScUtils clone(){
		Object object = null;
		try {
			object = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (TScUtils)object;
	}

}
