package com.stone.biz.message.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="BIZ_DOWNLOAD_BOX")
public class DownloadBox {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_BIZ_DOWNLOAD_BOX")
	@SequenceGenerator(name = "SEQ_BIZ_DOWNLOAD_BOX", allocationSize = 1, sequenceName = "SEQ_BIZ_DOWNLOAD_BOX")
	@Column(name = "ANNALID")
	private Long id;//主键
	
	private String title;//标题
	
	private String path;//url路径
	
	private Date createDate;//创建时间
	
	private String createName;//创建人
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}
	
	
}
