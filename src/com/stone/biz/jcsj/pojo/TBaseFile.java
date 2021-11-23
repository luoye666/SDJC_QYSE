package com.stone.biz.jcsj.pojo;

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
 * 设备附件表
 * 用于设备停用、报废等上传附件使用
 * 
 */
@Entity
@Table(name="BIZ_SE_FILE")
public class TBaseFile implements java.io.Serializable {
	
	private static final long serialVersionUID = 62907824677970707L;
	
	/**
	 * Id
	 */
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SE_FILE")
    @SequenceGenerator(name="SEQ_SE_FILE",allocationSize=1, sequenceName="SEQ_SE_FILE")
	private Long id;
	
	private Long dataId; //设备主键
	
	private String filePath; //文件路径
	
	private String type; //类型  0 未注册    1 已注册---定期检监  2  已告知----安装监检  3 已停用  4 改造维修监检 5拆除 6待办 7报废
	
	private Date updateTime;//更改时间
	
	private String updateName; //操作人
	
	private String beizhu;
	
	
	
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

	public Long getDataId() {
		return dataId;
	}

	public void setDataId(Long dataId) {
		this.dataId = dataId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateName() {
		return updateName;
	}

	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
    
    

	
}