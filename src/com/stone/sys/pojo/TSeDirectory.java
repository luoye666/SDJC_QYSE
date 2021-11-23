package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "SYS_SEDIRECTORY")
public class TSeDirectory {
	
	@Id
	@Column(name="DIR_ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_SEDIRECTORY")
    @SequenceGenerator(name="SEQ_SYS_SEDIRECTORY",allocationSize=1, sequenceName="SEQ_SYS_SEDIRECTORY")
	private Long id;
	@Column(name="DAIMA")
	private String daima;
	@Column(name="MINGCHENG")
	private String mingcheng;
	@Column(name="XUHAO")
	private Long xuhao;
	@Column(name="PARENT_ID")
	private Long parentId;
	 
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
    
	public String getDaima() {
		return daima;
	}
	public void setDaima(String daima) {
		this.daima = daima;
	}
    
	public String getMingcheng() {
		return mingcheng;
	}
	public void setMingcheng(String mingcheng) {
		this.mingcheng = mingcheng;
	}
	public Long getXuhao() {
		return xuhao;
	}
	public void setXuhao(Long xuhao) {
		this.xuhao = xuhao;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
}
