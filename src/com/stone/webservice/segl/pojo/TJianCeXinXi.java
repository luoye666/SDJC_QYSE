package com.stone.webservice.segl.pojo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "TAB_JIANCEXINXI")
public class TJianCeXinXi implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_TAB_JIANCEXINXI")
	@SequenceGenerator(name = "SEQ_TAB_JIANCEXINXI", allocationSize = 1, sequenceName = "SEQ_TAB_JIANCEXINXI")
	private Long id; // 主键ID
	private String zhucedaima;
	private String dengjibianhao;
	private Date jianceriqi;
	private Date xiacijianceriqi;
	private String bianhao;
	private String jiancejielun;
	private String jiancejigou;
	private String shiyongdanwei; //使用单位

	private Date create_time; // 创建日期
	private Date modify_time; // 更新时间
	private String role;
	private String state; // 状态 0 未更新 1 更新成功 2 更新失败
	private String beizhu; // 原因
	private String shi;
	private String quxian;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getZhucedaima() {
		return zhucedaima;
	}

	public void setZhucedaima(String zhucedaima) {
		this.zhucedaima = zhucedaima;
	}

	public String getDengjibianhao() {
		return dengjibianhao;
	}

	public void setDengjibianhao(String dengjibianhao) {
		this.dengjibianhao = dengjibianhao;
	}

	public Date getJianceriqi() {
		return jianceriqi;
	}

	public void setJianceriqi(Date jianceriqi) {
		this.jianceriqi = jianceriqi;
	}

	public Date getXiacijianceriqi() {
		return xiacijianceriqi;
	}

	public void setXiacijianceriqi(Date xiacijianceriqi) {
		this.xiacijianceriqi = xiacijianceriqi;
	}

	public String getBianhao() {
		return bianhao;
	}

	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}

	public String getJiancejielun() {
		return jiancejielun;
	}

	public void setJiancejielun(String jiancejielun) {
		this.jiancejielun = jiancejielun;
	}

	public String getJiancejigou() {
		return jiancejigou;
	}

	public void setJiancejigou(String jiancejigou) {
		this.jiancejigou = jiancejigou;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Date getModify_time() {
		return modify_time;
	}

	public void setModify_time(Date modify_time) {
		this.modify_time = modify_time;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getShi() {
		return shi;
	}

	public void setShi(String shi) {
		this.shi = shi;
	}

	public String getQuxian() {
		return quxian;
	}

	public void setQuxian(String quxian) {
		this.quxian = quxian;
	}

	public String getShiyongdanwei() {
		return shiyongdanwei;
	}

	public void setShiyongdanwei(String shiyongdanwei) {
		this.shiyongdanwei = shiyongdanwei;
	}

}
