package com.stone.sys.pojo;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name = "SYS_DIC_DATA")
public class TDicData {
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_DIC_DATA")
    @SequenceGenerator(name="SEQ_SYS_DIC_DATA",allocationSize=1, sequenceName="SEQ_SYS_DIC_DATA")
	@Column(name = "DICDATA_ID")
    private Long id;
	@Column(name = "TYPE_ID")
	private Long typeId;
	@Column(name = "NAME")
	private String name; 
	@Column(name = "CODE")
	private String code;
	@Column(name = "VALUE")
	private String value;
	@Column(name = "NOTES")
	private String notes;
	@Column(name = "SORT_NUM")
	private Integer sortNum;
	@Column(name = "PARENT_ID")
	private Long parentId;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getTypeId() {
		return typeId;
	}
	public void setTypeId(Long typeId) {
		this.typeId = typeId;
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
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
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
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
}
