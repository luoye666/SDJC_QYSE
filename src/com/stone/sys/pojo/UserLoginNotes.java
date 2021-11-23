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
 * 用户登录记录表
 * 登录时记录，退出时删除
 * @author 王帅
 *
 */

@Entity
@Table(name="SYS_USER_LOGIN_NOTES"
    ,schema="SEJC"
)
public class UserLoginNotes implements java.io.Serializable {

	private Long id;
	private String userId;
	private String loginId;
	private String name;
	private String organcode;
	private String userType;
	private String regioncode;
	private String roleid;
	private String rolename;
	private String mobile;
	private String tel;
	private Date loginTime;
	private String organame;
	private String type;
	public UserLoginNotes() {
		super();
	}
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SYS_LOGIN_NOTES_ORDER")
    @SequenceGenerator(name="SYS_LOGIN_NOTES_ORDER",allocationSize=1, sequenceName="SYS_LOGIN_NOTES_ORDER")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@Column(name="USER_ID")
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Column(name="LOGIN_ID")
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	@Column(name="NAME")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name="ORGANCODE")
	public String getOrgancode() {
		return organcode;
	}
	public void setOrgancode(String organcode) {
		this.organcode = organcode;
	}
	@Column(name="REGIONCODE")
	public String getRegioncode() {
		return regioncode;
	}
	public void setRegioncode(String regioncode) {
		this.regioncode = regioncode;
	}
	@Column(name="ROLEID")
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	@Column(name="ROLENAME")
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	@Column(name="MOBILE")
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	@Column(name="TEL")
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Column(name="LOGIN_TIME")
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	@Column(name="USER_TYPE")
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	@Column(name="ORGANAME")
	public String getOrganame() {
		return organame;
	}
	public void setOrganame(String organame) {
		this.organame = organame;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public UserLoginNotes(Long id, String userId, String loginId, String name,
			String organcode, String userType, String regioncode,
			String roleid, String rolename, String mobile, String tel,
			Date loginTime, String organame) {
		super();
		this.id = id;
		this.userId = userId;
		this.loginId = loginId;
		this.name = name;
		this.organcode = organcode;
		this.userType = userType;
		this.regioncode = regioncode;
		this.roleid = roleid;
		this.rolename = rolename;
		this.mobile = mobile;
		this.tel = tel;
		this.loginTime = loginTime;
		this.organame = organame;
	}
	
}
