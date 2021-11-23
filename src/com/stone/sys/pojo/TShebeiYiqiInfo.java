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
@Table(name = "SYS_SHEBEI_YIQI_INFO")
public class TShebeiYiqiInfo implements java.io.Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8526846207052060597L;

	@Id
	@Column(name="ANNALID")
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_SHEBEI_YIQI_INFO")
    @SequenceGenerator(name="SEQ_SYS_SHEBEI_YIQI_INFO",allocationSize=1, sequenceName="SEQ_SYS_SHEBEI_YIQI_INFO")
	private Long id;
	private Long userid;	//number	y			借用人主键
	private Long yiqiid;//仪器主键
	
	private String yiqimingcheng;//仪器名称
	private String xinghao;//型号
	private String neibubianhao;//内部编号
	
	
	
	/////////借用/归还
	private String jieyongren;//借用人
	private Date jieyongriqi;//借用日期
	private Date jieyongshijian;//借用时间（时长）
	private String jiechuzhuangtai;//借出状态   （正常/不正常）
	private String guihuanren;//归还人
	private Date guihuanriqi;//归还日期
	private String guihuanzhuangtai;//归还状态   （正常/不正常）
	
	
	private String beizhu;	//varchar2(100)	y			备注
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getYiqimingcheng() {
		return yiqimingcheng;
	}
	public void setYiqimingcheng(String yiqimingcheng) {
		this.yiqimingcheng = yiqimingcheng;
	}
	public String getXinghao() {
		return xinghao;
	}
	public void setXinghao(String xinghao) {
		this.xinghao = xinghao;
	}
	public String getNeibubianhao() {
		return neibubianhao;
	}
	public void setNeibubianhao(String neibubianhao) {
		this.neibubianhao = neibubianhao;
	}
	public String getJieyongren() {
		return jieyongren;
	}
	public void setJieyongren(String jieyongren) {
		this.jieyongren = jieyongren;
	}
	public Date getJieyongriqi() {
		return jieyongriqi;
	}
	public void setJieyongriqi(Date jieyongriqi) {
		this.jieyongriqi = jieyongriqi;
	}
	public String getGuihuanren() {
		return guihuanren;
	}
	public void setGuihuanren(String guihuanren) {
		this.guihuanren = guihuanren;
	}
	public Date getGuihuanriqi() {
		return guihuanriqi;
	}
	public void setGuihuanriqi(Date guihuanriqi) {
		this.guihuanriqi = guihuanriqi;
	}
	public Long getUserid() {
		return userid;
	}
	public void setUserid(Long userid) {
		this.userid = userid;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public Long getYiqiid() {
		return yiqiid;
	}
	public void setYiqiid(Long yiqiid) {
		this.yiqiid = yiqiid;
	}
	public Date getJieyongshijian() {
		return jieyongshijian;
	}
	public void setJieyongshijian(Date jieyongshijian) {
		this.jieyongshijian = jieyongshijian;
	}
	public String getJiechuzhuangtai() {
		return jiechuzhuangtai;
	}
	public void setJiechuzhuangtai(String jiechuzhuangtai) {
		this.jiechuzhuangtai = jiechuzhuangtai;
	}
	public String getGuihuanzhuangtai() {
		return guihuanzhuangtai;
	}
	public void setGuihuanzhuangtai(String guihuanzhuangtai) {
		this.guihuanzhuangtai = guihuanzhuangtai;
	}
	
	
	
}
