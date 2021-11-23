package com.stone.webservice.segl.pojo.dongying;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 压力容器
 * @author chao
 * @time 2013年12月10日15:04:32
 */

@Entity
@Table(name = "BIZ_PRESSURE_VESSELS_PARAM")
@PrimaryKeyJoinColumn(name="PressureVesselsID")
public class TPressureVesselsParamD extends TBaseInfoD implements Cloneable{

	private String yunxingzhuangtai;/**	 * 运行状态	 */
	private String shejidanwei;/**	 * 设计单位	 */
	private String shejiriqi;/**	 * 设计日期	 */
	private String chanpinbiaozhun;/**	 * 产品标准	 */
	private String rongqituhao;/**	 * 容器图号	 */
	private String shejishiyongnianxian;/**  * 设计使用年限 */
	private String zhutijiegouxingshi; //主体结构型式
	private String anzhuangxingshi;/**	 * 安装型式	 */
	private String zhizuoxingshi;/**	 * 支座型式	 */
	private String baowenjuerefangshi;/**	 * 保温绝热方式	 */
	private String rongqineijing;		//	RONGQINEIJING	NUMBER	容器内径
	private String rongqigao;		//	RONGQIGAO	NUMBER	容器高
	private Double rongqichang;		//	RONGQICHANG	NUMBER	容器长
	private String rongqimianji;		//	RONGJIMIANJI	VARCHAR2(15)	容积面积
	private String zuidachongzhuangliang;/**	 * 最大充装量	 */
	private String sjyl_kecheng; //壳程 Mpa
	private String sjyl_guancheng; //管程 Mpa
	private String sjwd_kecheng; //壳程 ℃
	private String sjwd_guancheng; //管程 ℃
	private String gongzuoyali_keti;/**	 * 工作压力壳体	 */
	private String gongzuoyali_jiatao;/**	 * 工作压力夹套	 */
	private String gongzuowendu_keti;/**	 * 工作温度壳体	 */
	private String gongzuowendu_jiatao;/**	 * 工作温度夹套	 */
	private String kechengjiezhi; //壳程介质
	private String guanchengjiezhi; //管程介质
	private String fushiyudu_tongti;/**	 * 腐蚀裕度筒体	 */
	private String fushiyudu_fengtou;/**	 * 腐蚀裕度封头	 */
	//材料
	private String cailiao_tongti; //筒体(球壳)
	private String cailiao_fengtou; //封头
	private String cailiao_chenli; //衬里
	private String cailiao_jiatao; //夹套
	//厚度
	private String hd_tongti; //筒体(球壳) mm
	private String hd_fengtou; // 封头 mm
	private String hd_chenli; //衬里 mm
	private String hd_jiatao; //夹套 mm
	public String getYunxingzhuangtai() {
		return yunxingzhuangtai;
	}
	public void setYunxingzhuangtai(String yunxingzhuangtai) {
		this.yunxingzhuangtai = yunxingzhuangtai;
	}
	public String getShejidanwei() {
		return shejidanwei;
	}
	public void setShejidanwei(String shejidanwei) {
		this.shejidanwei = shejidanwei;
	}
	public String getShejiriqi() {
		return shejiriqi;
	}
	public void setShejiriqi(String shejiriqi) {
		this.shejiriqi = shejiriqi;
	}
	public String getChanpinbiaozhun() {
		return chanpinbiaozhun;
	}
	public void setChanpinbiaozhun(String chanpinbiaozhun) {
		this.chanpinbiaozhun = chanpinbiaozhun;
	}
	public String getRongqituhao() {
		return rongqituhao;
	}
	public void setRongqituhao(String rongqituhao) {
		this.rongqituhao = rongqituhao;
	}
	public String getShejishiyongnianxian() {
		return shejishiyongnianxian;
	}
	public void setShejishiyongnianxian(String shejishiyongnianxian) {
		this.shejishiyongnianxian = shejishiyongnianxian;
	}
	public String getZhutijiegouxingshi() {
		return zhutijiegouxingshi;
	}
	public void setZhutijiegouxingshi(String zhutijiegouxingshi) {
		this.zhutijiegouxingshi = zhutijiegouxingshi;
	}
	public String getAnzhuangxingshi() {
		return anzhuangxingshi;
	}
	public void setAnzhuangxingshi(String anzhuangxingshi) {
		this.anzhuangxingshi = anzhuangxingshi;
	}
	public String getZhizuoxingshi() {
		return zhizuoxingshi;
	}
	public void setZhizuoxingshi(String zhizuoxingshi) {
		this.zhizuoxingshi = zhizuoxingshi;
	}
	public String getBaowenjuerefangshi() {
		return baowenjuerefangshi;
	}
	public void setBaowenjuerefangshi(String baowenjuerefangshi) {
		this.baowenjuerefangshi = baowenjuerefangshi;
	}
	public String getRongqineijing() {
		return rongqineijing;
	}
	public void setRongqineijing(String rongqineijing) {
		this.rongqineijing = rongqineijing;
	}
	public String getRongqigao() {
		return rongqigao;
	}
	public void setRongqigao(String rongqigao) {
		this.rongqigao = rongqigao;
	}
	public Double getRongqichang() {
		return rongqichang;
	}
	public void setRongqichang(Double rongqichang) {
		this.rongqichang = rongqichang;
	}
	public String getRongqimianji() {
		return rongqimianji;
	}
	public void setRongqimianji(String rongqimianji) {
		this.rongqimianji = rongqimianji;
	}
	public String getZuidachongzhuangliang() {
		return zuidachongzhuangliang;
	}
	public void setZuidachongzhuangliang(String zuidachongzhuangliang) {
		this.zuidachongzhuangliang = zuidachongzhuangliang;
	}
	public String getSjyl_kecheng() {
		return sjyl_kecheng;
	}
	public void setSjyl_kecheng(String sjylKecheng) {
		sjyl_kecheng = sjylKecheng;
	}
	public String getSjyl_guancheng() {
		return sjyl_guancheng;
	}
	public void setSjyl_guancheng(String sjylGuancheng) {
		sjyl_guancheng = sjylGuancheng;
	}
	public String getSjwd_kecheng() {
		return sjwd_kecheng;
	}
	public void setSjwd_kecheng(String sjwdKecheng) {
		sjwd_kecheng = sjwdKecheng;
	}
	public String getSjwd_guancheng() {
		return sjwd_guancheng;
	}
	public void setSjwd_guancheng(String sjwdGuancheng) {
		sjwd_guancheng = sjwdGuancheng;
	}
	public String getGongzuoyali_keti() {
		return gongzuoyali_keti;
	}
	public void setGongzuoyali_keti(String gongzuoyaliKeti) {
		gongzuoyali_keti = gongzuoyaliKeti;
	}
	public String getGongzuoyali_jiatao() {
		return gongzuoyali_jiatao;
	}
	public void setGongzuoyali_jiatao(String gongzuoyaliJiatao) {
		gongzuoyali_jiatao = gongzuoyaliJiatao;
	}
	public String getGongzuowendu_keti() {
		return gongzuowendu_keti;
	}
	public void setGongzuowendu_keti(String gongzuowenduKeti) {
		gongzuowendu_keti = gongzuowenduKeti;
	}
	public String getGongzuowendu_jiatao() {
		return gongzuowendu_jiatao;
	}
	public void setGongzuowendu_jiatao(String gongzuowenduJiatao) {
		gongzuowendu_jiatao = gongzuowenduJiatao;
	}
	public String getKechengjiezhi() {
		return kechengjiezhi;
	}
	public void setKechengjiezhi(String kechengjiezhi) {
		this.kechengjiezhi = kechengjiezhi;
	}
	public String getGuanchengjiezhi() {
		return guanchengjiezhi;
	}
	public void setGuanchengjiezhi(String guanchengjiezhi) {
		this.guanchengjiezhi = guanchengjiezhi;
	}
	public String getFushiyudu_tongti() {
		return fushiyudu_tongti;
	}
	public void setFushiyudu_tongti(String fushiyuduTongti) {
		fushiyudu_tongti = fushiyuduTongti;
	}
	public String getFushiyudu_fengtou() {
		return fushiyudu_fengtou;
	}
	public void setFushiyudu_fengtou(String fushiyuduFengtou) {
		fushiyudu_fengtou = fushiyuduFengtou;
	}
	public String getCailiao_tongti() {
		return cailiao_tongti;
	}
	public void setCailiao_tongti(String cailiaoTongti) {
		cailiao_tongti = cailiaoTongti;
	}
	public String getCailiao_fengtou() {
		return cailiao_fengtou;
	}
	public void setCailiao_fengtou(String cailiaoFengtou) {
		cailiao_fengtou = cailiaoFengtou;
	}
	public String getCailiao_chenli() {
		return cailiao_chenli;
	}
	public void setCailiao_chenli(String cailiaoChenli) {
		cailiao_chenli = cailiaoChenli;
	}
	public String getCailiao_jiatao() {
		return cailiao_jiatao;
	}
	public void setCailiao_jiatao(String cailiaoJiatao) {
		cailiao_jiatao = cailiaoJiatao;
	}
	public String getHd_tongti() {
		return hd_tongti;
	}
	public void setHd_tongti(String hdTongti) {
		hd_tongti = hdTongti;
	}
	public String getHd_fengtou() {
		return hd_fengtou;
	}
	public void setHd_fengtou(String hdFengtou) {
		hd_fengtou = hdFengtou;
	}
	public String getHd_chenli() {
		return hd_chenli;
	}
	public void setHd_chenli(String hdChenli) {
		hd_chenli = hdChenli;
	}
	public String getHd_jiatao() {
		return hd_jiatao;
	}
	public void setHd_jiatao(String hdJiatao) {
		hd_jiatao = hdJiatao;
	}
	
	

	
}
