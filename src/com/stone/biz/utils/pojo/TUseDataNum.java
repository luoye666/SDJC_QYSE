package com.stone.biz.utils.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 企业资料
 * @author admin
 *
 */
@Entity
@Table(name="TAB_QY_ZL_NUM")
public class TUseDataNum implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_QY_ZL_NUM")
	@SequenceGenerator(name = "SEQ_QY_ZL_NUM", allocationSize = 1, sequenceName = "SEQ_QY_ZL_NUM")
	private Long id;
	
	@Column(name="login_id")
	private String loginId; //登录账号
	
	@Column(name="name")
	private String name; //名称
	
	@Column(name="num")
	private Integer num=0; // 下载或学习次数
	
	
	@Column(name="type")
	private Integer type; //类型  1  法律  2 标准 3 视频 4 网站  5 考试
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	
	
}
