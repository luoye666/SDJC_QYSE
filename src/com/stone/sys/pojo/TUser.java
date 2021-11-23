package com.stone.sys.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "sys_sydw_user")
public class TUser implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2846281498368612740L;
	/**
	 * 用户状态：正常
	 */
	public static final Integer STATE_NORMAL = 1;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_SYDW_USER")
    @SequenceGenerator(name="SEQ_SYS_SYDW_USER",allocationSize=1, sequenceName="SEQ_SYS_SYDW_USER")
    private Long id;
    
    private String name;

	@Column(name="LOGIN_ID")
	private String loginId;		//登录ID

    private String password;

    private String danweimingcheng;
    private String lianxiren;
    private String lianxidianhua;

    private String danweidizhi;

    private String filepath;

    private String beizhu;

    private Integer state = 1;//1是正常  0是冻结

    private String shiyongdanwei_id;

    private String shstate;//审核状态  0 未审核  1 未通过  2 已通过

    private String jujueyuanyin;

    private String shi;
    
    private String shidaima;
    
    private String xian;

    private String xiandaima;
    //账号的类型
    private String type;
    
    private String bjstate; //报检权限状态 
	@Transient
    private String loginTime;
	
//	private String token; //单点登陆使用唯一确认码
	
    @Column(name="ERROR_LOGIN_TIME")
    private Date errorLoginTime;

    @Column(name="ERROR_COUNT")
    private Integer errorCount;

    @Column(name="PASSWORD_VALIDITY")
    private Date passwordValidity;
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
    
	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDanweimingcheng() {
		return danweimingcheng;
	}

	public void setDanweimingcheng(String danweimingcheng) {
		this.danweimingcheng = danweimingcheng;
	}

	public String getLianxiren() {
		return lianxiren;
	}

	public void setLianxiren(String lianxiren) {
		this.lianxiren = lianxiren;
	}

	public String getLianxidianhua() {
		return lianxidianhua;
	}

	public void setLianxidianhua(String lianxidianhua) {
		this.lianxidianhua = lianxidianhua;
	}

	public String getDanweidizhi() {
		return danweidizhi;
	}

	public void setDanweidizhi(String danweidizhi) {
		this.danweidizhi = danweidizhi;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getShiyongdanwei_id() {
		return shiyongdanwei_id;
	}

	public void setShiyongdanwei_id(String shiyongdanweiId) {
		shiyongdanwei_id = shiyongdanweiId;
	}

	public String getShstate() {
		return shstate;
	}

	public void setShstate(String shstate) {
		this.shstate = shstate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getJujueyuanyin() {
		return jujueyuanyin;
	}

	public void setJujueyuanyin(String jujueyuanyin) {
		this.jujueyuanyin = jujueyuanyin;
	}

	public String getShi() {
		return shi;
	}

	public void setShi(String shi) {
		this.shi = shi;
	}

	public String getShidaima() {
		return shidaima;
	}

	public void setShidaima(String shidaima) {
		this.shidaima = shidaima;
	}

	public String getXian() {
		return xian;
	}

	public void setXian(String xian) {
		this.xian = xian;
	}

	public String getXiandaima() {
		return xiandaima;
	}

	public void setXiandaima(String xiandaima) {
		this.xiandaima = xiandaima;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBjstate() {
		return bjstate;
	}

	public void setBjstate(String bjstate) {
		this.bjstate = bjstate;
	}

	public String getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}

	public Date getErrorLoginTime() {
		return errorLoginTime;
	}

	public void setErrorLoginTime(Date errorLoginTime) {
		this.errorLoginTime = errorLoginTime;
	}

	public Integer getErrorCount() {
		return errorCount;
	}

	public void setErrorCount(Integer errorCount) {
		this.errorCount = errorCount;
	}

	public Date getPasswordValidity() {
		return passwordValidity;
	}

	public void setPasswordValidity(Date passwordValidity) {
		this.passwordValidity = passwordValidity;
	}

	

//	public String getToken() {
//		return token;
//	}
//
//	public void setToken(String token) {
//		this.token = token;
//	}
	

}