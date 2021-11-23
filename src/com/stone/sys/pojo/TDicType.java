package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name = "SYS_DIC_TYPE")
public class TDicType {
	
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_DIC_TYPE")
    @SequenceGenerator(name="SEQ_SYS_DIC_TYPE",allocationSize=1, sequenceName="SEQ_SYS_DIC_TYPE")
	@Column(name = "DICTYPE_ID")
    private Long id;
	@Column(name = "NAME")
	private String name;
	@Column(name = "CODE")
	private String code;
	@Column(name = "NOTES")
	private String notes; 
	@Column(name = "SORT_NUM")
	private Integer sortNum;
	
	
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public Integer getSortNum() {
		return sortNum;
	}
	public void setSortNum(Integer sortNum) {
		this.sortNum = sortNum;
	}
}
