package com.stone.biz.jcsj.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;



@Entity
@Table(name = "BIZ_REGISTER_FILE")
public class TRegisterFile {

	private Long id = Long.valueOf(Long.parseLong("0"));
	
	/*
	 * 使用登记表  sydjb
	 * 使用单位统一社会信用代码证（公民个人所有的特种设备无需上传本证件） dmz
	 * 个人身份证明（适用于公民个人所有的特种设备） sfz
	 * 特种设备合格证（含产品数据表、车用气瓶安装合格证明） hgz
	 * 特种设备监督检验证明（安全技术规范要求进行使用前首次检验的特种设备，应当提交使用前的首次检验报告） jdjyzm
	 * 
	 */
	private String file_name ; 
	
	private String file_path; 
	
	private Long djb_id;
	
	private Date create_time;

	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_BIZ_REGISTER_FILE")
    @SequenceGenerator(name="SEQ_BIZ_REGISTER_FILE",allocationSize=1, sequenceName="SEQ_BIZ_REGISTER_FILE")
    @Column(name = "id")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String fileName) {
		file_name = fileName;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String filePath) {
		file_path = filePath;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date createTime) {
		create_time = createTime;
	}

	public Long getDjb_id() {
		return djb_id;
	}

	public void setDjb_id(Long djbId) {
		djb_id = djbId;
	}
	
	
}
