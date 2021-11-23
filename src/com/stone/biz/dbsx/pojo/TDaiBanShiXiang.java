package com.stone.biz.dbsx.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "TAB_DAIBANSHIXIANG")
public class TDaiBanShiXiang implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1870848009524384596L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_TAB_DAIBANSHIXIANG")
    @SequenceGenerator(name="SEQ_TAB_DAIBANSHIXIANG",allocationSize=1, sequenceName="SEQ_TAB_DAIBANSHIXIANG")
	private Long id;			//主键ID
	
	private String neirong;
	private String xiugairen;
	private String xiugairen_loginId;
	private Date xiugairiqi;
	private Long dataId;   //该ID为临时数据的ID
	
	// 设备、单位、人员
	private String type;
	//提交状态  0 未提交  1 已提交
	private String tjstate;
	//机构代码
	private String organ_code;
	//是否为企业提交过来的
	private String qiyetijiao;//1 企业
	
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
	public String getXiugairen() {
		return xiugairen;
	}
	public void setXiugairen(String xiugairen) {
		this.xiugairen = xiugairen;
	}
	public Date getXiugairiqi() {
		return xiugairiqi;
	}
	public void setXiugairiqi(Date xiugairiqi) {
		this.xiugairiqi = xiugairiqi;
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
	public String getXiugairen_loginId() {
		return xiugairen_loginId;
	}
	public void setXiugairen_loginId(String xiugairenLoginId) {
		xiugairen_loginId = xiugairenLoginId;
	}
	public String getTjstate() {
		return tjstate;
	}
	public void setTjstate(String tjstate) {
		this.tjstate = tjstate;
	}
	public String getOrgan_code() {
		return organ_code;
	}
	public void setOrgan_code(String organCode) {
		organ_code = organCode;
	}
	public String getQiyetijiao() {
		return qiyetijiao;
	}
	public void setQiyetijiao(String qiyetijiao) {
		this.qiyetijiao = qiyetijiao;
	}
}
