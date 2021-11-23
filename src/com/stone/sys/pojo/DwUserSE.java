package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name = "sys_se_dwuser")
public class DwUserSE implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2846281498368612740L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_SE_DWUSER")
    @SequenceGenerator(name="SEQ_SYS_SE_DWUSER",allocationSize=1, sequenceName="SEQ_SYS_SE_DWUSER")
    private Long id;
    
	@Column(name="USER_ID")
	private Long userId;
	@Column(name="SE_ID")
	private Long seId;
	
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
	public Long getSeId() {
		return seId;
	}
	public void setSeId(Long seId) {
		this.seId = seId;
	}

}