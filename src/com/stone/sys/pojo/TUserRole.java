package com.stone.sys.pojo;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "SYS_USER_ROLE")
public class TUserRole implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3333004947797942894L;
	@Id
	@Column(name="USERROLE_ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_USER_ROLE")
    @SequenceGenerator(name="SEQ_SYS_USER_ROLE",allocationSize=1, sequenceName="SEQ_SYS_USER_ROLE")
	private Long id;			//主键ID
	@Column(name="USER_ID")
	private Long userId;
	@Column(name="ROLE_ID")
	private Long roleId;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id; 
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	
}
