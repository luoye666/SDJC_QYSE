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
 * 游乐设施_技术参数
 * 
 */
@Entity
@Table(name = "BIZ_RECREATION_PARAM")
@PrimaryKeyJoinColumn(name="RecreationID")
@XmlRootElement(name = "TRecreationParam")
public class TRecreationParam extends TBaseInfo implements java.io.Serializable,Cloneable{

	private String xiansudu;
	private String ylss_gaodu;
	private String edingchengkerenshu;
	private String edingzaihe;
	private String sudu;
	private String qingjiao;
	private String fusudu;
	private String qudongxingshi;
	private String qudongzhugonglv;
	private String dianya;
	private String fugonglv;
	private String gaodu;
	private String huizhuanzhijing;
	private String guiju;
	private String guijuchangdu;
	private String shuihuatigaodu;
	private String youlechishuishen;
	
	/**
	 * 20170805 新增字段
	 */
	private String shebeijibie; //设备级别
	private String shiyongfangshi; //设备使用方式 □固定式□移动式
	private String cheliangshu; //车辆数或列车数或座舱数 人
	private String zhuansu; //转速 rpm
	private String guidaogaodu; //轨道高度 m
	private String gaocha; //高差 m
	private String zuidapodu; //最大坡度 °
	private String shejijiasudu; //设计最大加速度  G


	public String getXiansudu() {
		return xiansudu;
	}

	public void setXiansudu(String xiansudu) {
		this.xiansudu = xiansudu;
	}

	public String getYlss_gaodu() {
		return ylss_gaodu;
	}

	public void setYlss_gaodu(String ylssGaodu) {
		ylss_gaodu = ylssGaodu;
	}

	public String getEdingchengkerenshu() {
		return edingchengkerenshu;
	}

	public void setEdingchengkerenshu(String edingchengkerenshu) {
		this.edingchengkerenshu = edingchengkerenshu;
	}

	public String getEdingzaihe() {
		return edingzaihe;
	}

	public void setEdingzaihe(String edingzaihe) {
		this.edingzaihe = edingzaihe;
	}

	public String getSudu() {
		return sudu;
	}

	public void setSudu(String sudu) {
		this.sudu = sudu;
	}

	public String getQingjiao() {
		return qingjiao;
	}

	public void setQingjiao(String qingjiao) {
		this.qingjiao = qingjiao;
	}

	public String getFusudu() {
		return fusudu;
	}

	public void setFusudu(String fusudu) {
		this.fusudu = fusudu;
	}

	public String getQudongxingshi() {
		return qudongxingshi;
	}

	public void setQudongxingshi(String qudongxingshi) {
		this.qudongxingshi = qudongxingshi;
	}

	public String getQudongzhugonglv() {
		return qudongzhugonglv;
	}

	public void setQudongzhugonglv(String qudongzhugonglv) {
		this.qudongzhugonglv = qudongzhugonglv;
	}

	public String getDianya() {
		return dianya;
	}

	public void setDianya(String dianya) {
		this.dianya = dianya;
	}

	public String getFugonglv() {
		return fugonglv;
	}

	public void setFugonglv(String fugonglv) {
		this.fugonglv = fugonglv;
	}

	public String getGaodu() {
		return gaodu;
	}

	public void setGaodu(String gaodu) {
		this.gaodu = gaodu;
	}

	public String getHuizhuanzhijing() {
		return huizhuanzhijing;
	}

	public void setHuizhuanzhijing(String huizhuanzhijing) {
		this.huizhuanzhijing = huizhuanzhijing;
	}

	public String getGuiju() {
		return guiju;
	}

	public void setGuiju(String guiju) {
		this.guiju = guiju;
	}

	public String getGuijuchangdu() {
		return guijuchangdu;
	}

	public void setGuijuchangdu(String guijuchangdu) {
		this.guijuchangdu = guijuchangdu;
	}

	public String getShuihuatigaodu() {
		return shuihuatigaodu;
	}

	public void setShuihuatigaodu(String shuihuatigaodu) {
		this.shuihuatigaodu = shuihuatigaodu;
	}

	public String getYoulechishuishen() {
		return youlechishuishen;
	}

	public void setYoulechishuishen(String youlechishuishen) {
		this.youlechishuishen = youlechishuishen;
	}
	

	public String getShebeijibie() {
		return shebeijibie;
	}

	public void setShebeijibie(String shebeijibie) {
		this.shebeijibie = shebeijibie;
	}

	public String getShiyongfangshi() {
		return shiyongfangshi;
	}

	public void setShiyongfangshi(String shiyongfangshi) {
		this.shiyongfangshi = shiyongfangshi;
	}

	public String getCheliangshu() {
		return cheliangshu;
	}

	public void setCheliangshu(String cheliangshu) {
		this.cheliangshu = cheliangshu;
	}

	public String getZhuansu() {
		return zhuansu;
	}

	public void setZhuansu(String zhuansu) {
		this.zhuansu = zhuansu;
	}

	public String getGuidaogaodu() {
		return guidaogaodu;
	}

	public void setGuidaogaodu(String guidaogaodu) {
		this.guidaogaodu = guidaogaodu;
	}

	public String getGaocha() {
		return gaocha;
	}

	public void setGaocha(String gaocha) {
		this.gaocha = gaocha;
	}

	public String getZuidapodu() {
		return zuidapodu;
	}

	public void setZuidapodu(String zuidapodu) {
		this.zuidapodu = zuidapodu;
	}

	public String getShejijiasudu() {
		return shejijiasudu;
	}

	public void setShejijiasudu(String shejijiasudu) {
		this.shejijiasudu = shejijiasudu;
	}

	public TRecreationParam clone(){
		Object object = null;
		try {
			object = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (TRecreationParam)object;
	}
	
}