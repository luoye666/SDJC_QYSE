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
 * 企业自查
 * @author admin
 *
 */
@Entity
@Table(name="TAB_ENTERPRISE_INSPECT")
public class TEnterpriseInspect implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_ENTERPRISE_INSPECT")
	@SequenceGenerator(name = "SEQ_ENTERPRISE_INSPECT", allocationSize = 1, sequenceName = "SEQ_ENTERPRISE_INSPECT")
	private Long id;
	
	@Column(name="enterprise_name")
	private String enterpriseName; //企业名称
	
	@Column(name="enterprise_address")
	private String enterpriseAddress; //企业地址
	
	@Column(name="person_in_charge")
	private String personInCharge; //负责人
	
	private String phone; //联系电话
	
	@Column(name="inspect_report_file")
	private String inspectReportFile; //报告路径
	
	@Column(name="login_id")
	private String loginId; //上传用户
	
	private Integer type; //类别 1 使用单位   2 设备 3 责任清单  4 风险刮了 5  隐患管理  6 应急预览
	
	private String result; // 设备自查结果  合格  不合格
	
	private String regcode; //注册代码或登记证编号
	
	private String record; //记录
	
	@Column(name="create_time")
	private Date createTime; //创建日期
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getEnterpriseName() {
		return enterpriseName;
	}
	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}
	public String getEnterpriseAddress() {
		return enterpriseAddress;
	}
	public void setEnterpriseAddress(String enterpriseAddress) {
		this.enterpriseAddress = enterpriseAddress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPersonInCharge() {
		return personInCharge;
	}
	public void setPersonInCharge(String personInCharge) {
		this.personInCharge = personInCharge;
	}
	public String getInspectReportFile() {
		return inspectReportFile;
	}
	public void setInspectReportFile(String inspectReportFile) {
		this.inspectReportFile = inspectReportFile;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getRegcode() {
		return regcode;
	}
	public void setRegcode(String regcode) {
		this.regcode = regcode;
	}
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	
	
	
}
