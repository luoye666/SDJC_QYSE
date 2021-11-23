package com.stone.biz.sjsh.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "QY_TAB_SHUJUSHENHE")
public class TShuJuShenHe implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1870848009524384596L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_QY_TAB_DAIBANSHIXIANG")
    @SequenceGenerator(name="SEQ_QY_TAB_DAIBANSHIXIANG",allocationSize=1, sequenceName="SEQ_QY_TAB_DAIBANSHIXIANG")
	private Long id;			//主键ID
	
	private String neirong;
	private String tijiaoren;
	private String tijiaoren_loginId;
	private Date tijiaoriqi;
	private Long dataId;   //该ID为临时数据的ID
	
	// 设备、单位、人员
	private String type;
	//机构代码
	private String organ_code;
	private String shenheleixing;
	//审核状态   0待审核  1已通过  2已拒绝
	private String shstate;
	//待办事项ID
	private Long dbId;
	//拒绝原因
	private String jujueyuanyin;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNeirong() {
		return neirong;
	}
	public void setNeirong(String neirong) {
		this.neirong = neirong;
	}
	public Long getDataId() {
		return dataId;
	}
	public void setDataId(Long dataId) {
		this.dataId = dataId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOrgan_code() {
		return organ_code;
	}
	public void setOrgan_code(String organCode) {
		organ_code = organCode;
	}
	public String getTijiaoren() {
		return tijiaoren;
	}
	public void setTijiaoren(String tijiaoren) {
		this.tijiaoren = tijiaoren;
	}
	public String getTijiaoren_loginId() {
		return tijiaoren_loginId;
	}
	public void setTijiaoren_loginId(String tijiaorenLoginId) {
		tijiaoren_loginId = tijiaorenLoginId;
	}
	public Date getTijiaoriqi() {
		return tijiaoriqi;
	}
	public void setTijiaoriqi(Date tijiaoriqi) {
		this.tijiaoriqi = tijiaoriqi;
	}
	public String getShenheleixing() {
		return shenheleixing;
	}
	public void setShenheleixing(String shenheleixing) {
		this.shenheleixing = shenheleixing;
	}
	public String getShstate() {
		return shstate;
	}
	public void setShstate(String shstate) {
		this.shstate = shstate;
	}
	public Long getDbId() {
		return dbId;
	}
	public void setDbId(Long dbId) {
		this.dbId = dbId;
	}
	public String getJujueyuanyin() {
		return jujueyuanyin;
	}
	public void setJujueyuanyin(String jujueyuanyin) {
		this.jujueyuanyin = jujueyuanyin;
	}
}
