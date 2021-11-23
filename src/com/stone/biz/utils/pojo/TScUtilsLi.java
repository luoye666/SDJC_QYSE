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
@Table(name = "TAB_SCUNITSLICENSE")
public class TScUtilsLi implements Serializable {
	private Long id = Long.valueOf(Long.parseLong("0"));
	private String zsbh;
	private String dwmc;
	private String setype;
	private String sbmc;
	private String xkzlb;
	private String pzjb;
	private String fzbm;
	private String ouid;
	private Date fzrq;
	private Date zsyxq_ks;
	private Date zsyxq_js;
	private String meo;
	
	private String pzbm;
	private Date pzrq;
	private String xkzfwh;
	private String yxkzbh;
	private String sqlb;
	private Date slrq;
	private Date fcrq;
	private Date zxrq;
	
	private Long fid;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_SCUNITSLI")
	@SequenceGenerator(name = "SEQ_SCUNITSLI", allocationSize = 1, sequenceName = "SEQ_SCUNITSLI")
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getZsbh() {
		return this.zsbh;
	}

	public void setZsbh(String zsbh) {
		this.zsbh = zsbh;
	}

	public String getDwmc() {
		return this.dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getSetype() {
		return this.setype;
	}

	public void setSetype(String setype) {
		this.setype = setype;
	}

	public String getSbmc() {
		return this.sbmc;
	}

	public void setSbmc(String sbmc) {
		this.sbmc = sbmc;
	}

	public String getXkzlb() {
		return this.xkzlb;
	}

	public void setXkzlb(String xkzlb) {
		this.xkzlb = xkzlb;
	}

	public String getPzjb() {
		return this.pzjb;
	}

	public void setPzjb(String pzjb) {
		this.pzjb = pzjb;
	}

	public String getFzbm() {
		return this.fzbm;
	}

	public void setFzbm(String fzbm) {
		this.fzbm = fzbm;
	}

	public String getOuid() {
		return this.ouid;
	}

	public void setOuid(String ouid) {
		this.ouid = ouid;
	}

	public Date getFzrq() {
		return this.fzrq;
	}

	public void setFzrq(Date fzrq) {
		this.fzrq = fzrq;
	}

	public String getMeo() {
		return this.meo;
	}

	public void setMeo(String meo) {
		this.meo = meo;
	}

	public Long getFid() {
		return this.fid;
	}

	public void setFid(Long fid) {
		this.fid = fid;
	}

	public Date getZsyxq_ks() {
		return zsyxq_ks;
	}

	public void setZsyxq_ks(Date zsyxqKs) {
		zsyxq_ks = zsyxqKs;
	}

	public Date getZsyxq_js() {
		return zsyxq_js;
	}

	public void setZsyxq_js(Date zsyxqJs) {
		zsyxq_js = zsyxqJs;
	}

	public String getPzbm() {
		return pzbm;
	}

	public void setPzbm(String pzbm) {
		this.pzbm = pzbm;
	}

	public Date getPzrq() {
		return pzrq;
	}

	public void setPzrq(Date pzrq) {
		this.pzrq = pzrq;
	}

	public String getXkzfwh() {
		return xkzfwh;
	}

	public void setXkzfwh(String xkzfwh) {
		this.xkzfwh = xkzfwh;
	}

	public String getYxkzbh() {
		return yxkzbh;
	}

	public void setYxkzbh(String yxkzbh) {
		this.yxkzbh = yxkzbh;
	}

	public String getSqlb() {
		return sqlb;
	}

	public void setSqlb(String sqlb) {
		this.sqlb = sqlb;
	}

	public Date getSlrq() {
		return slrq;
	}

	public void setSlrq(Date slrq) {
		this.slrq = slrq;
	}

	public Date getFcrq() {
		return fcrq;
	}

	public void setFcrq(Date fcrq) {
		this.fcrq = fcrq;
	}

	public Date getZxrq() {
		return zxrq;
	}

	public void setZxrq(Date zxrq) {
		this.zxrq = zxrq;
	}

}
