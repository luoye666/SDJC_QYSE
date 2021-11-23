package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


/**
 * 角色实体
 * @author root
 *
 */
@Entity
@Table(name = "SYS_ROLE")
public class TRole {
	@Id
	@Column(name="ROLE_ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_ROLE")
    @SequenceGenerator(name="SEQ_SYS_ROLE",allocationSize=1, sequenceName="SEQ_SYS_ROLE")
	private Long id;
	@Column(name="NAME")
	private String name;
	@Column(name="NAME_EN") 
	private String nameEN;
	@Column(name="NOTES")
	private String notes;
	
	private String sbxx;
	
	private String xingming; // 科室主任姓名
	private String dianhua;// 科室主任电话
	private String editSeField;//可修改的设备信息字段  （使用单位角色使用）
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNameEN() {
		return nameEN;
	}
	public void setNameEN(String nameEN) {
		this.nameEN = nameEN;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public String getXingming() {
		return xingming;
	}
	public void setXingming(String xingming) {
		this.xingming = xingming;
	}
	public String getDianhua() {
		return dianhua;
	}
	public void setDianhua(String dianhua) {
		this.dianhua = dianhua;
	}
	public String getSbxx() {
		return sbxx;
	}
	public void setSbxx(String sbxx) {
		this.sbxx = sbxx;
	}
	public String getEditSeField() {
		return editSeField;
	}
	public void setEditSeField(String editSeField) {
		this.editSeField = editSeField;
	}
	
	
}
