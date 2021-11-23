package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "SYS_ROLE_MENU")
public class TRoleMenu {
	@Id
	@Column(name="ROLEMENU_ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_ROLE_MENU")
    @SequenceGenerator(name="SEQ_SYS_ROLE_MENU",allocationSize=1, sequenceName="SEQ_SYS_ROLE_MENU")
	private Long id;
	 
	@Column(name="MENU_ID")
	private Long menuId;
	
	@Column(name="ROLE_ID")
	private Long roleId;
	
	public Long getId() { 
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getMenuId() {
		return menuId;
	}
	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
}
