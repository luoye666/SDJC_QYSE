package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 
 */
@Entity
@Table(name = "JBPM4_DEPLOYPROP")
public class TJbpm4Deployprop implements java.io.Serializable {
		
    /**
	 * 
	 */
	private static final long serialVersionUID = 4176585010737228159L;

	// Fields
    private Long dbid;

    private Long deployment;

    private String objname;

    private String key;
    
    private String stringval;
    
    private Long longval;

    
	@Column(name = "DBID_")
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_JBPM4_DEPLOYPROP")
    @SequenceGenerator(name="SEQ_JBPM4_DEPLOYPROP",allocationSize=1, sequenceName="SEQ_JBPM4_DEFINITION")
    public Long getDbid() {
		return dbid;
	}

	public void setDbid(Long dbid) {
		this.dbid = dbid;
	}

	@Column(name = "DEPLOYMENT_")
	public Long getDeployment() {
		return deployment;
	}

	public void setDeployment(Long deployment) {
		this.deployment = deployment;
	}

	@Column(name = "OBJNAME_")
	public String getObjname() {
		return objname;
	}

	public void setObjname(String objname) {
		this.objname = objname;
	}

	@Column(name = "KEY_")
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	@Column(name = "STRINGVAL_")
	public String getStringval() {
		return stringval;
	}

	public void setStringval(String stringval) {
		this.stringval = stringval;
	}

	@Column(name = "LONGVAL_")
	public Long getLongval() {
		return longval;
	}

	public void setLongval(Long longval) {
		this.longval = longval;
	}
}