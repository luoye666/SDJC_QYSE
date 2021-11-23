package com.stone.biz.jcsj.pojo;

import java.text.DecimalFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

import com.stone.biz.utils.pojo.TCzUtils;
import com.sun.xml.internal.messaging.saaj.util.TeeInputStream;

/**
 * 
 * 客运索道_技术参数
 * 
 */
@Entity
@Table(name = "BIZ_CABLEWAYS_PARAM")
@PrimaryKeyJoinColumn(name="CablewaysID")
@XmlRootElement(name = "TCablewaysParam")
public class TCablewaysParam extends TBaseInfo implements java.io.Serializable,Cloneable{

	private String yunxingsudu;
	private String changdu;
	private String yunzainengli;
	private String yunzaicheliangxingshi;
	/**
	 * 在线报检日期
	 */
	private Date zx_baojianriqi;
	/**
	 * 在线检验日期
	 */
	private Date zx_jianyanriqi;
	/**
	 * 在线下次检验日期
	 */
	private Date zx_xiacijianyanriqi;
	/**
	 * 在线检验结论
	 */
	private String zx_jianyanjielun;
	/**
	 * 在线检验机构
	 */
	private String zx_jianyanjigou;
	
	/**
	 * 20170805 新增字段
	 */
	private String pingju; //平  距 m
	private String xiechang; //斜  长 m
	private String gaocha; //高  差 m
	private String yunliang; //运  量 人/小时
	private String suoju; //索  距 m
	private String zhijiashumu; //支架数目 个
	private String dianjiexinghaogonglv; //主电机型号和功率 kW
	private String zhangjinyouya; //张紧油压(重锤重量)
	private String yunzaisuo; //运载索(牵引索、平衡索)
	private String chengzaisuo; //承载索
	private String yunzaigongju; //运载工具数量和类型

	public String getYunxingsudu() {
		return yunxingsudu;
	}

	public void setYunxingsudu(String yunxingsudu) {
		this.yunxingsudu = yunxingsudu;
	}

	public String getChangdu() {
		return changdu;
	}

	public void setChangdu(String changdu) {
		this.changdu = changdu;
	}

	public String getYunzainengli() {
		return yunzainengli;
	}

	public void setYunzainengli(String yunzainengli) {
		this.yunzainengli = yunzainengli;
	}

	public String getYunzaicheliangxingshi() {
		return yunzaicheliangxingshi;
	}

	public void setYunzaicheliangxingshi(String yunzaicheliangxingshi) {
		this.yunzaicheliangxingshi = yunzaicheliangxingshi;
	}

	public Date getZx_baojianriqi() {
		return zx_baojianriqi;
	}

	public void setZx_baojianriqi(Date zxBaojianriqi) {
		zx_baojianriqi = zxBaojianriqi;
	}

	public Date getZx_jianyanriqi() {
		return zx_jianyanriqi;
	}

	public void setZx_jianyanriqi(Date zxJianyanriqi) {
		zx_jianyanriqi = zxJianyanriqi;
	}

	public Date getZx_xiacijianyanriqi() {
		return zx_xiacijianyanriqi;
	}

	public void setZx_xiacijianyanriqi(Date zxXiacijianyanriqi) {
		zx_xiacijianyanriqi = zxXiacijianyanriqi;
	}

	public String getZx_jianyanjielun() {
		return zx_jianyanjielun;
	}

	public void setZx_jianyanjielun(String zxJianyanjielun) {
		zx_jianyanjielun = zxJianyanjielun;
	}

	public String getZx_jianyanjigou() {
		return zx_jianyanjigou;
	}

	public void setZx_jianyanjigou(String zxJianyanjigou) {
		zx_jianyanjigou = zxJianyanjigou;
	}
	

	public String getPingju() {
		return pingju;
	}

	public void setPingju(String pingju) {
		this.pingju = pingju;
	}

	public String getXiechang() {
		return xiechang;
	}

	public void setXiechang(String xiechang) {
		this.xiechang = xiechang;
	}

	public String getGaocha() {
		return gaocha;
	}

	public void setGaocha(String gaocha) {
		this.gaocha = gaocha;
	}

	public String getYunliang() {
		return yunliang;
	}

	public void setYunliang(String yunliang) {
		this.yunliang = yunliang;
	}

	public String getSuoju() {
		return suoju;
	}

	public void setSuoju(String suoju) {
		this.suoju = suoju;
	}

	public String getZhijiashumu() {
		return zhijiashumu;
	}

	public void setZhijiashumu(String zhijiashumu) {
		this.zhijiashumu = zhijiashumu;
	}

	public String getDianjiexinghaogonglv() {
		return dianjiexinghaogonglv;
	}

	public void setDianjiexinghaogonglv(String dianjiexinghaogonglv) {
		this.dianjiexinghaogonglv = dianjiexinghaogonglv;
	}

	public String getZhangjinyouya() {
		return zhangjinyouya;
	}

	public void setZhangjinyouya(String zhangjinyouya) {
		this.zhangjinyouya = zhangjinyouya;
	}

	public String getYunzaisuo() {
		return yunzaisuo;
	}

	public void setYunzaisuo(String yunzaisuo) {
		this.yunzaisuo = yunzaisuo;
	}

	public String getChengzaisuo() {
		return chengzaisuo;
	}

	public void setChengzaisuo(String chengzaisuo) {
		this.chengzaisuo = chengzaisuo;
	}

	public String getYunzaigongju() {
		return yunzaigongju;
	}

	public void setYunzaigongju(String yunzaigongju) {
		this.yunzaigongju = yunzaigongju;
	}

	public TCablewaysParam clone(){
		Object object = null;
		try {
			object = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (TCablewaysParam)object;
	}
	
}