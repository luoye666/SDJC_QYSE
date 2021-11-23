package com.stone.sys.pojo;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * POJO--流程定义 
 * 
 * @author 赵林场 
 *
 */

@Entity
@Table(name = "JBPM4_DEFINITION")
public class TJbpm implements java.io.Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 6725802151007721404L;
	//系统ID
    private Long id;
    //流程中文名
    private String jbpmName;
    //流程描述
    private String jbpmNotes;
    //备注
    private String jbpmRemark;
    //未发布流程的名称
    private String xmlName;
    //已发布的流程名称
    private String xmlNameEnd;
    //发布后DepoymentID
    private Long deploymentId;
    //ProcessName
    private String objname;
    //状态
    private String state;
    //流程对应表单
    private String formname;  
    //流程类别
    private String flowType;

	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_JBPM4_DEFINITION")
    @SequenceGenerator(name="SEQ_JBPM4_DEFINITION",allocationSize=1, sequenceName="SEQ_JBPM4_DEFINITION")
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "JBPM_NAME")
    public String getJbpmName() {
		return jbpmName;
	}

	public void setJbpmName(String jbpmName) {
		this.jbpmName = jbpmName;
	}
	@Column(name = "JBPM_NOTES")
	public String getJbpmNotes() {
		return jbpmNotes;
	}

	public void setJbpmNotes(String jbpmNotes) {
		this.jbpmNotes = jbpmNotes;
	}

	@Column(name = "JBPM_REMARK")
	public String getJbpmRemark() {
		return jbpmRemark;
	}

	public void setJbpmRemark(String jbpmRemark) {
		this.jbpmRemark = jbpmRemark;
	}

	@Column(name = "XML_NAME")
	public String getXmlName() {
		return xmlName;
	}

	public void setXmlName(String xmlName) {
		this.xmlName = xmlName;
	}

	@Column(name = "XML_NAME_END")
	public String getXmlNameEnd() {
		return xmlNameEnd;
	}

	public void setXmlNameEnd(String xmlNameEnd) {
		this.xmlNameEnd = xmlNameEnd;
	}

	@Column(name = "DEPLOYMENT_ID")
	public Long getDeploymentId() {
		return deploymentId;
	}

	public void setDeploymentId(Long deploymentId) {
		this.deploymentId = deploymentId;
	}
    
	@Column(name = "OBJNAME")
	public String getObjname() {
		return objname;
	}

	public void setObjname(String objname) {
		this.objname = objname;
	}
	
	@Column(name = "FORMNAME")
	public String getFormname() {
		return formname;
	}

	public void setFormname(String formname) {
		this.formname = formname;
	}

	@Column(name = "STATE")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name = "FLOW_TYPE")
	public String getFlowType() {
		return flowType;
	}

	public void setFlowType(String flowType) {
		this.flowType = flowType;
	}
	
	

	
}