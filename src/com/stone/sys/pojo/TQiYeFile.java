package com.stone.sys.pojo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 
 * 企业附件表（使用单位，安装单位）
 * 用于使用单位和安装单位上传附件使用
 * 
 */
@Entity
@Table(name="BIZ_QY_FILE")
public class TQiYeFile implements java.io.Serializable {
	
	private static final long serialVersionUID = 62907824677970707L;
	
	/**
	 * Id
	 */
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_QIYE_FILE")
    @SequenceGenerator(name="SEQ_QIYE_FILE",allocationSize=1, sequenceName="SEQ_QIYE_FILE")
	private Long id;
	
	private Long qiyeId; //企业账号主键
	
	private String filePath; //文件路径
	
	private Date updateTime;//更改时间
	
	private String fileName; //文件名称
	
	
	
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Long getQiyeId() {
		return qiyeId;
	}

	public void setQiyeId(Long qiyeId) {
		this.qiyeId = qiyeId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	

	
}