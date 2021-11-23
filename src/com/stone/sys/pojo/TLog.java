package com.stone.sys.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "SYS_LOG")
public class TLog implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3316895317757137385L;

	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_LOG")
    @SequenceGenerator(name="SEQ_SYS_LOG",allocationSize=1, sequenceName="SEQ_SYS_LOG")
	@Column(name = "LOG_ID")
    private Long id;
	
	@Column(name="USER_ID")
    private String userid;   //用户id

	@Column(name="USERNAME")
    private String username;//用户名称
    
    @Column(name="ACTION_APP")
    private String actionapp;//应用名称

    @Column(name="ACTION_DESC")
    private String actiondesc;//
    
    @Column(name="OUID")
    private Long ouid;//

    @Column(name="LOG_TIME")
    private Date logtime;//日志时间
    
    @Column(name="IP")
    private String ip;//ip地址
    
    @Column(name="MAC")
    private String mac;//mac地址
    
    @Column(name="NAME")
    private String name;//日志名称
    
    private String url;//查看详细的url
    
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getActionapp() {
		return actionapp;
	}

	public void setActionapp(String actionapp) {
		this.actionapp = actionapp;
	}

	public String getActiondesc() {
		return actiondesc;
	}

	public void setActiondesc(String actiondesc) {
		this.actiondesc = actiondesc;
	}

	public Long getOuid() {
		return ouid;
	}

	public void setOuid(Long ouid) {
		this.ouid = ouid;
	}

	public Date getLogtime() {
		return logtime;
	}

	public void setLogtime(Date logtime) {
		this.logtime = logtime;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	
}