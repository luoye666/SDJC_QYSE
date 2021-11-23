package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 
 */
@Entity
@Table(name = "JBPM4_LOB")
public class TJbpm4Lob implements java.io.Serializable {
		
    /**
	 * 
	 */
	private static final long serialVersionUID = -7651140935780280207L;

	// Fields
    private Long dbid;

    private String name;
    
    private byte[] blobValue;
    
    private Long deployment;

	@Column(name = "DBID_")
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_JBPM4_LOB")
    @SequenceGenerator(name="SEQ_JBPM4_LOB",allocationSize=1, sequenceName="SEQ_JBPM4_DEFINITION")
    public Long getDbid() {
		return dbid;
	}

	public void setDbid(Long dbid) {
		this.dbid = dbid;
	}

	@Column(name = "NAME_")
	@Lob
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "DEPLOYMENT_")
	public Long getDeployment() {
		return deployment;
	}

	public void setDeployment(Long deployment) {
		this.deployment = deployment;
	}

	@Column(name = "BLOB_VALUE_", columnDefinition = "BLOB")
	public byte[] getBlobValue() {
		return blobValue;
	}

	public void setBlobValue(byte[] blobValue) {
		this.blobValue = blobValue;
	}
	
	
	
}