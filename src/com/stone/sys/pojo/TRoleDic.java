package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "SYS_ROLE_DIC")
public class TRoleDic {
	@Id
	@Column(name="ROLEDIC_ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_ROLE_DIC")
    @SequenceGenerator(name="SEQ_SYS_ROLE_DIC",allocationSize=1, sequenceName="SEQ_SYS_ROLE_DIC")
	private Long id;
	 
	@Column(name="DIC_ID")
	private Long dicId;
	
	@Column(name="ROLE_ID")
	private Long roleId;
	
	public Long getId() { 
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getDicId() {
		return dicId;
	}
	public void setDicId(Long dicId) {
		this.dicId = dicId;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
}
