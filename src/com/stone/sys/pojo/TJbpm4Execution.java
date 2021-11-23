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
@Table(name = "JBPM4_EXECUTION")
public class TJbpm4Execution implements java.io.Serializable {
		
    /**
	 * 
	 */
	private static final long serialVersionUID = -2894015071995547003L;

	// Fields
    private Long dbid;

    private String procdefid;
    
    private String id;


	@Column(name = "DBID_")
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_JBPM4_EXECUTION")
    @SequenceGenerator(name="SEQ_JBPM4_EXECUTION",allocationSize=1, sequenceName="SEQ_JBPM4_DEFINITION")
    public Long getDbid() {
		return dbid;
	}

	public void setDbid(Long dbid) {
		this.dbid = dbid;
	}

	@Column(name = "PROCDEFID_")
	public String getProcdefid() {
		return procdefid;
	}

	public void setProcdefid(String procdefid) {
		this.procdefid = procdefid;
	}
	@Column(name = "ID_")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
}