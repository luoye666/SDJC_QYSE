package com.stone.webservice.segl.pojo.dongying;

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

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.stone.biz.utils.pojo.TCzUtils;
import com.sun.xml.internal.messaging.saaj.util.TeeInputStream;

/**
 * 
 * 电梯_技术参数
 * 
 */
@Entity
@Table(name = "BIZ_ElEVATORPARAM")
@PrimaryKeyJoinColumn(name="elevatorId")
@XmlRootElement(name = "TElevatorParam")
@JsonIgnoreProperties(ignoreUnknown = true)
public class TElevatorParamD extends TBaseInfoD implements java.io.Serializable,Cloneable{
	
	/**
	 * 层
	 */
	private Double ceng;
	
	/**
	 * 站
	 */
	private Double zhan;
	
	/**
	 * 门
	 */
	private Double men;
	
	/**
	 * 名义速度
	 */
	private Double mingyisudu;
	
	/**
	 * 名义宽度
	 */
	private Double  mingyikuandu;
	
	/**
	 * 倾斜角
	 */
	private Double qingxiejiao;
	
	/**
	 * 输送能力
	 */
	private Double shusongnengli;
	
	/**
	 * 提升高度
	 */
	private Double tishenggaodu;
	
	/**
	 * 区段长度
	 */
	private Double quduanchangdu;
	
	/**
	 * 额定载重量
	 */
	private Double edingzaizhongliang;
	
	/**
	 * 额定速度
	 */
	private Double edingsudu;
	
	/**
	 * 额定速度_上行
	 */
	private Double edingsudu_shangxing;
	
	/**
	 * 额定速度_下行
	 */
	private Double edingsudu_xiaxing;
	
	
	/**
	 * 控制方式
	 */
	private String  kongzhifangshi;
	
	/**
	 * 油罐数量
	 */
	private Double  youguanshuliang;
	
	/**
	 * 顶升型式
	 */
	private String  dingshengxingshi;
	
	

	public Double getCeng() {
		return ceng;
	}

	public void setCeng(Double ceng) {
		this.ceng = ceng;
	}

	public Double getZhan() {
		return zhan;
	}

	public void setZhan(Double zhan) {
		this.zhan = zhan;
	}

	public Double getMen() {
		return men;
	}

	public void setMen(Double men) {
		this.men = men;
	}

	public Double getShusongnengli() {
		return shusongnengli;
	}

	public void setShusongnengli(Double shusongnengli) {
		this.shusongnengli = shusongnengli;
	}

	public Double getYouguanshuliang() {
		return youguanshuliang;
	}

	public void setYouguanshuliang(Double youguanshuliang) {
		this.youguanshuliang = youguanshuliang;
	}

	public Double getMingyisudu() {
		return mingyisudu;
	}

	public void setMingyisudu(Double mingyisudu) {
		this.mingyisudu = mingyisudu;
	}

	public Double getMingyikuandu() {
		return mingyikuandu;
	}

	public void setMingyikuandu(Double mingyikuandu) {
		this.mingyikuandu = mingyikuandu;
	}

	public Double getQingxiejiao() {
		return qingxiejiao;
	}

	public void setQingxiejiao(Double qingxiejiao) {
		this.qingxiejiao = qingxiejiao;
	}

	public Double getTishenggaodu() {
		return tishenggaodu;
	}

	public void setTishenggaodu(Double tishenggaodu) {
		this.tishenggaodu = tishenggaodu;
	}

	public Double getQuduanchangdu() {
		return quduanchangdu;
	}

	public void setQuduanchangdu(Double quduanchangdu) {
		this.quduanchangdu = quduanchangdu;
	}

	public Double getEdingzaizhongliang() {
		return edingzaizhongliang;
	}

	public void setEdingzaizhongliang(Double edingzaizhongliang) {
		this.edingzaizhongliang = edingzaizhongliang;
	}

	public Double getEdingsudu() {
		return edingsudu;
	}

	public void setEdingsudu(Double edingsudu) {
		this.edingsudu = edingsudu;
	}

	public Double getEdingsudu_shangxing() {
		return edingsudu_shangxing;
	}

	public void setEdingsudu_shangxing(Double edingsuduShangxing) {
		edingsudu_shangxing = edingsuduShangxing;
	}

	public Double getEdingsudu_xiaxing() {
		return edingsudu_xiaxing;
	}

	public void setEdingsudu_xiaxing(Double edingsuduXiaxing) {
		edingsudu_xiaxing = edingsuduXiaxing;
	}

	public String getKongzhifangshi() {
		return kongzhifangshi;
	}

	public void setKongzhifangshi(String kongzhifangshi) {
		this.kongzhifangshi = kongzhifangshi;
	}

	public String getDingshengxingshi() {
		return dingshengxingshi;
	}

	public void setDingshengxingshi(String dingshengxingshi) {
		this.dingshengxingshi = dingshengxingshi;
	}
	

}