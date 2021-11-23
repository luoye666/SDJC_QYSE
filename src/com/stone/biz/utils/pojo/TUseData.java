package com.stone.biz.utils.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 企业资料
 * @author admin
 *
 */
@Entity
@Table(name="TAB_QY_ZL")
public class TUseData implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_ENTERPRISE_INSPECT")
	@SequenceGenerator(name = "SEQ_ENTERPRISE_INSPECT", allocationSize = 1, sequenceName = "SEQ_ENTERPRISE_INSPECT")
	private Long id;
	
	@Column(name="name")
	private String name; //名称
	
	@Column(name="file_path")
	private String filePath; //资料地址
	
	
	@Column(name="type")
	private Integer type; //上传用户
	
	
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
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	
}
