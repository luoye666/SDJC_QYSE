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
 * 压力管道_技术参数
 * 
 */
@Entity
@Table(name = "BIZ_PRESSURE_PIPING_PARAM")
@PrimaryKeyJoinColumn(name="PressurePipingID")
@XmlRootElement(name = "TPressurePipingParam")
public class TPressurePipingParam extends TBaseInfo implements java.io.Serializable,Cloneable{

	private String gongchengzhijing;
	private String gongchengbihou;
	private String guandaochangdu;
	private String shejiyali;
	private String shejiwendu;
	private String shusongjiezhi;
	private String gongzuoyali;
	private String gongzuowendu;
	private String zhongyaoguandao;
	private String guandaojibie;
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

	
	public String getGongchengzhijing() {
		return gongchengzhijing;
	}

	public void setGongchengzhijing(String gongchengzhijing) {
		this.gongchengzhijing = gongchengzhijing;
	}

	public String getGongchengbihou() {
		return gongchengbihou;
	}

	public void setGongchengbihou(String gongchengbihou) {
		this.gongchengbihou = gongchengbihou;
	}

	public String getGuandaochangdu() {
		return guandaochangdu;
	}

	public void setGuandaochangdu(String guandaochangdu) {
		this.guandaochangdu = guandaochangdu;
	}

	public String getShejiyali() {
		return shejiyali;
	}

	public void setShejiyali(String shejiyali) {
		this.shejiyali = shejiyali;
	}

	public String getShejiwendu() {
		return shejiwendu;
	}

	public void setShejiwendu(String shejiwendu) {
		this.shejiwendu = shejiwendu;
	}

	public String getShusongjiezhi() {
		return shusongjiezhi;
	}

	public void setShusongjiezhi(String shusongjiezhi) {
		this.shusongjiezhi = shusongjiezhi;
	}

	public String getGongzuoyali() {
		return gongzuoyali;
	}

	public void setGongzuoyali(String gongzuoyali) {
		this.gongzuoyali = gongzuoyali;
	}

	public String getGongzuowendu() {
		return gongzuowendu;
	}

	public void setGongzuowendu(String gongzuowendu) {
		this.gongzuowendu = gongzuowendu;
	}

	public String getZhongyaoguandao() {
		return zhongyaoguandao;
	}

	public void setZhongyaoguandao(String zhongyaoguandao) {
		this.zhongyaoguandao = zhongyaoguandao;
	}

	public String getGuandaojibie() {
		return guandaojibie;
	}

	public void setGuandaojibie(String guandaojibie) {
		this.guandaojibie = guandaojibie;
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

	public TPressurePipingParam clone(){
		Object object = null;
		try {
			object = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (TPressurePipingParam)object;
	}
	
}