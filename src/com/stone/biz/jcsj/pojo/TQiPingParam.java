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

import com.stone.biz.utils.pojo.TCzUtils;
import com.sun.xml.internal.messaging.saaj.util.TeeInputStream;

/**
 * 
 * 气瓶_技术参数
 * 
 */
@Entity
@Table(name = "BIZ_QIPING_PARAM")
@PrimaryKeyJoinColumn(name="QiPingID")
public class TQiPingParam extends TBaseInfo implements java.io.Serializable,Cloneable{

	private String chongzhuangjiezhi;
	private String gongzuoyali;
	private String rongji;
	private String chepaihao;
	private String VINma;
	
	
	/**
	 * 20170805 新增字段
	 */
	private String chanpinbiaozhu; //产品标准
	private String edingzhiliang; //额定质量 kg
	private String shiyongwendu; //使用环境温度 ℃
	//性能参数
	private String xinghao; //型  号
	private String shuliang; //数  量
	private String zongrongji; //总容积
	//规格
	private String guige_waijing; //外径：     (mm)
	private String guige_bihou; //壁厚： 
	private String guige_changdu; //长度：   (mm)
	//材料
	private String cailiao_pingti; //瓶体
	private String cailiao_duansai; //端塞
	private String cailiao_guanlu; //管路
	//检验试验
	private String qiping_wsff; //无损检测方法 气瓶
	private String guanlu_wsff; //无损检测方法 管路
	private String qiping_wsbl; //无损检测比例 气瓶 %
	private String guanlu_wsbl; //无损检测比例 管路 %
	private String qiping_nysy; //耐压试验压力 气瓶 MPa
	private String guanlu_nysy; //耐压试验压力 管路 MPa
	private String qiping_qmx; //气密性试验压力 气瓶
	private String guanlu_qmx; //气密性试验压力 管路
	private String qitizhihuanyali; //气体置换后压力 MPa
	private String pingtihanyangliang; //瓶体内含氧量 ％

	private String rechulifangshi; //热处理方式
	private String rechuliwendu; //热处理温度 ℃
	private String qipinganzhuangweizhi; //气瓶安装位置

	
	
	public String getChongzhuangjiezhi() {
		return chongzhuangjiezhi;
	}

	public void setChongzhuangjiezhi(String chongzhuangjiezhi) {
		this.chongzhuangjiezhi = chongzhuangjiezhi;
	}

	public String getGongzuoyali() {
		return gongzuoyali;
	}

	public void setGongzuoyali(String gongzuoyali) {
		this.gongzuoyali = gongzuoyali;
	}

	public String getRongji() {
		return rongji;
	}

	public void setRongji(String rongji) {
		this.rongji = rongji;
	}

	public String getChepaihao() {
		return chepaihao;
	}

	public void setChepaihao(String chepaihao) {
		this.chepaihao = chepaihao;
	}

	public String getVINma() {
		return VINma;
	}

	public void setVINma(String vINma) {
		VINma = vINma;
	}

	public String getChanpinbiaozhu() {
		return chanpinbiaozhu;
	}

	public void setChanpinbiaozhu(String chanpinbiaozhu) {
		this.chanpinbiaozhu = chanpinbiaozhu;
	}

	public String getEdingzhiliang() {
		return edingzhiliang;
	}

	public void setEdingzhiliang(String edingzhiliang) {
		this.edingzhiliang = edingzhiliang;
	}

	public String getShiyongwendu() {
		return shiyongwendu;
	}

	public void setShiyongwendu(String shiyongwendu) {
		this.shiyongwendu = shiyongwendu;
	}

	public String getXinghao() {
		return xinghao;
	}

	public void setXinghao(String xinghao) {
		this.xinghao = xinghao;
	}

	public String getShuliang() {
		return shuliang;
	}

	public void setShuliang(String shuliang) {
		this.shuliang = shuliang;
	}

	public String getZongrongji() {
		return zongrongji;
	}

	public void setZongrongji(String zongrongji) {
		this.zongrongji = zongrongji;
	}

	public String getGuige_waijing() {
		return guige_waijing;
	}

	public void setGuige_waijing(String guigeWaijing) {
		guige_waijing = guigeWaijing;
	}

	public String getGuige_bihou() {
		return guige_bihou;
	}

	public void setGuige_bihou(String guigeBihou) {
		guige_bihou = guigeBihou;
	}

	public String getGuige_changdu() {
		return guige_changdu;
	}

	public void setGuige_changdu(String guigeChangdu) {
		guige_changdu = guigeChangdu;
	}

	public String getCailiao_pingti() {
		return cailiao_pingti;
	}

	public void setCailiao_pingti(String cailiaoPingti) {
		cailiao_pingti = cailiaoPingti;
	}

	public String getCailiao_duansai() {
		return cailiao_duansai;
	}

	public void setCailiao_duansai(String cailiaoDuansai) {
		cailiao_duansai = cailiaoDuansai;
	}

	public String getCailiao_guanlu() {
		return cailiao_guanlu;
	}

	public void setCailiao_guanlu(String cailiaoGuanlu) {
		cailiao_guanlu = cailiaoGuanlu;
	}

	public String getQiping_wsff() {
		return qiping_wsff;
	}

	public void setQiping_wsff(String qipingWsff) {
		qiping_wsff = qipingWsff;
	}

	public String getGuanlu_wsff() {
		return guanlu_wsff;
	}

	public void setGuanlu_wsff(String guanluWsff) {
		guanlu_wsff = guanluWsff;
	}

	public String getQiping_wsbl() {
		return qiping_wsbl;
	}

	public void setQiping_wsbl(String qipingWsbl) {
		qiping_wsbl = qipingWsbl;
	}

	public String getGuanlu_wsbl() {
		return guanlu_wsbl;
	}

	public void setGuanlu_wsbl(String guanluWsbl) {
		guanlu_wsbl = guanluWsbl;
	}

	public String getQiping_nysy() {
		return qiping_nysy;
	}

	public void setQiping_nysy(String qipingNysy) {
		qiping_nysy = qipingNysy;
	}

	public String getGuanlu_nysy() {
		return guanlu_nysy;
	}

	public void setGuanlu_nysy(String guanluNysy) {
		guanlu_nysy = guanluNysy;
	}

	public String getQiping_qmx() {
		return qiping_qmx;
	}

	public void setQiping_qmx(String qipingQmx) {
		qiping_qmx = qipingQmx;
	}

	public String getGuanlu_qmx() {
		return guanlu_qmx;
	}

	public void setGuanlu_qmx(String guanluQmx) {
		guanlu_qmx = guanluQmx;
	}

	public String getQitizhihuanyali() {
		return qitizhihuanyali;
	}

	public void setQitizhihuanyali(String qitizhihuanyali) {
		this.qitizhihuanyali = qitizhihuanyali;
	}

	public String getPingtihanyangliang() {
		return pingtihanyangliang;
	}

	public void setPingtihanyangliang(String pingtihanyangliang) {
		this.pingtihanyangliang = pingtihanyangliang;
	}

	public String getRechulifangshi() {
		return rechulifangshi;
	}

	public void setRechulifangshi(String rechulifangshi) {
		this.rechulifangshi = rechulifangshi;
	}

	public String getRechuliwendu() {
		return rechuliwendu;
	}

	public void setRechuliwendu(String rechuliwendu) {
		this.rechuliwendu = rechuliwendu;
	}

	public String getQipinganzhuangweizhi() {
		return qipinganzhuangweizhi;
	}

	public void setQipinganzhuangweizhi(String qipinganzhuangweizhi) {
		this.qipinganzhuangweizhi = qipinganzhuangweizhi;
	}

	public TQiPingParam clone(){
		Object object = null;
		try {
			object = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (TQiPingParam)object;
	}
	
}