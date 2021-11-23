package com.stone.biz.utils.pojo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "TAB_SYUNITS")
public class TSyUtils implements Serializable,Cloneable {
	private Long id = Long.valueOf(Long.parseLong("0"));
	private String dwmc;
	private String dwdz;
	private String jgdm;
	private String lxr;
	private String lxdh;
	private String meo;
	private String flag = "0";
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
	
	private String faren; //法人
	
	private String jingdu;
	private String weidu;
	private String fujian;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_SYUNITS")
	@SequenceGenerator(name = "SEQ_SYUNITS", allocationSize = 1, sequenceName = "SEQ_SYUNITS")
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

	public String getJgdm() {
		return this.jgdm;
	}

	public void setJgdm(String jgdm) {
		this.jgdm = jgdm;
	}

	public String getLxr() {
		return this.lxr;
	}

	public void setLxr(String lxr) {
		this.lxr = lxr;
	}

	public String getLxdh() {
		return this.lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getFlag() {
		return this.flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getMeo() {
		return this.meo;
	}

	public void setMeo(String meo) {
		this.meo = meo;
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

	public String getJingdu() {
		return jingdu;
	}

	public void setJingdu(String jingdu) {
		this.jingdu = jingdu;
	}

	public String getWeidu() {
		return weidu;
	}

	public void setWeidu(String weidu) {
		this.weidu = weidu;
	}
	
	

	public String getFaren() {
		return faren;
	}

	public void setFaren(String faren) {
		this.faren = faren;
	}

	public String getFujian() {
		return fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}

	public TSyUtils clone(){
		Object object = null;
		try {
			object = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (TSyUtils)object;
	}
}
