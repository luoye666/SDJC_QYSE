package com.stone.sys.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 登录记录表
 * @author Administrator
 *
 */
@Entity
@Table(name="SYS_USER_LOGIN_LOG"
    ,schema="SEJC"
)
public class UserLoginLog implements java.io.Serializable {

	
	private Long id;
	private String loginId;
	private String userId;
	private Date time;
	private String userType;
	private String loginType;
	private String ip;
	private String type;
	
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SYS_LOGIN_LOG_ORDER")
    @SequenceGenerator(name="SYS_LOGIN_LOG_ORDER",allocationSize=1, sequenceName="SYS_LOGIN_LOG_ORDER")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@Column(name="LOGIN_ID")
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	@Column(name="USER_ID")
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Column(name="TIME")
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Column(name="USER_TYPE")
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	@Column(name="LOGIN_TYPE")
	public String getLoginType() {
		return loginType;
	}
	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
	@Column(name="IP")
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
