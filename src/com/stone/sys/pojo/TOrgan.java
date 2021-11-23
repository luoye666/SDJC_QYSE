package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name = "SYS_ORGAN")
public class TOrgan {
	
	@Id
	@Column(name="ORGAN_ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_ORGAN")
    @SequenceGenerator(name="SEQ_SYS_ORGAN",allocationSize=1, sequenceName="SEQ_SYS_ORGAN")
	private Long id;
	@Column(name="NAME")
	private String name;
	@Column(name="NAME_EN")
	private String nameEN;
	@Column(name="NOTES")
	private String notes;
	@Column(name="TEL")
	private String tel;
	@Column(name="CODE")
	private String code;
	@Column(name="PARENT_ID")
	private Long parentId;
	
	//经度    用以在电子地图中定位区域
	private String jingdu;
	//纬度
	private String weidu;
	//排序号
	private String sort_num;
	//管辖机构代码
	private String guanxiajigou;
	 
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
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
	public String getSort_num() {
		return sort_num;
	}
	public void setSort_num(String sortNum) {
		sort_num = sortNum;
	}
	public String getGuanxiajigou() {
		return guanxiajigou;
	}
	public void setGuanxiajigou(String guanxiajigou) {
		this.guanxiajigou = guanxiajigou;
	}
}
