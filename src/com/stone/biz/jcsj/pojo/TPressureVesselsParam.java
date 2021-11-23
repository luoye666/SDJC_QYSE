package com.stone.biz.jcsj.pojo;

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
@XmlRootElement(name = "TPressureVesselsParam")
public class TPressureVesselsParam extends TBaseInfo implements Cloneable{

	
	private String caizhitongti;		//	CAIZHITONGTI	VARCHAR2(30)	材质筒体
	private String caizhifengtou;		//	CAIZHIFENGTOU	VARCHAR2(30)	材质封头
	private String caizhijiatao;		//	CAIZHIJIATAO	VARCHAR2(10)	材质夹套
	private String caizhineichen;		//	CAIZHINEICHEN	VARCHAR2(30)	材质内衬
	private Double yalikecheng;		//	YALIKECHENG	NUMBER	压力壳程
	private String yaliguancheng;		//	YALIGUANCHENG	VARCHAR2(10)	压力管程
	private String jiezhikecheng;		//	JIEZHIKECHENG	VARCHAR2(30)	介质壳程
	private String jiezhiguancheng;		//	JIEZHIGUANCHENG	VARCHAR2(30)	介质管程
	private Double wendukecheng;		//	WENDUKECHENG	NUMBER	温度壳程
	private String wenduguancheng;		//	WENDUGUANCHENG	VARCHAR2(10)	温度管程
	private String rongqineijing;		//	RONGQINEIJING	NUMBER	容器内径
	private String rongqigao;		//	RONGQIGAO	NUMBER	容器高
	private Double rongqichang;		//	RONGQICHANG	NUMBER	容器长
	private String rongqimianji;		//	RONGJIMIANJI	VARCHAR2(15)	容积面积
	private String jiegouxingshi;		//	JIEGOUXINGSHI	VARCHAR2(100)	结构型式
private String zuidachongzhuangliang;/**	 * 最大充装量	 */
	
	private String shejiyali_keti;/**	 * 设计压力壳体	 */
	
	private String shejiyali_jiatao;/**	 * 设计压力夹套	 */
	
	private String gongzuoyali_keti;/**	 * 工作压力壳体	 */
	
	private String gongzuoyali_jiatao;/**	 * 工作压力夹套	 */
	
	private String shejiwendu_keti;/**	 * 设计温度壳体	 */
	
	private String shejiwendu_jiatao;/**	 * 设计温度夹套	 */
	
	private String gongzuowendu_keti;/**	 * 工作温度壳体	 */
	
	private String gongzuowendu_jiatao;/**	 * 工作温度夹套	 */
	
	private String fushiyudu_tongti;/**	 * 腐蚀裕度筒体	 */
	
	private String fushiyudu_fengtou;/**	 * 腐蚀裕度封头	 */
	
	private String houdu_tongti;/**	 * 厚度筒体	 */
	
	private String houdu_fengtou;/**	 * 厚度封头	 */
	
	private String houdu_jiatao;/**	 * 厚度夹套	 */
	
	private String houdu_chenli;/**	 * 厚度衬里	 */
	
	
	private String shejishiyongnianxian;/**  * 设计使用年限 */
	
	private String shangcijianyanriqi;/**	 * 上次检验日期	 */
	
	private String yunxingzhuangtai;/**	 * 运行状态	 */
	
	private String wentichuli;/**	 * 问题处理	 */
	
	private String anquandengji;/**	 * 安全等级	 */
	
	private String yunxushiyong_yali;/**	 * 允许使用压力	 */
	
	private String yunxushiyong_wendu;/**	 * 允许使用温度	 */
	
	private String yunxushiyong_jiezhi;/**	 * 允许使用介质	 */
	
	private String yunxushiyong_qita;/**	 * 其他	 */
	
	private String xiaciniandujianyanriqi;/**	 * 下次年度检验日期	 */
	
	private String xiaciquanmianjianyanriqi;/**	 * 下次全面检验日期	 */
	
	private String shuoming;/**	 * 说明	 */
	
	private String rongqileibie;/**	 * 容器类别	 */
	
	private String aqglry_lianxidianhua;/**	 * 安全管理人员联系电话	 */
	
	private String shejidanwei;/**	 * 设计单位	 */
	
	private String shejiriqi;/**	 * 设计日期	 */
	
	private String chanpinbiaozhun;/**	 * 产品标准	 */
	
	private String rongqituhao;/**	 * 容器图号	 */
	
	private String anzhuangxingshi;/**	 * 安装型式	 */
	
	private String zhizuoxingshi;/**	 * 支座型式	 */
	
	private String baowenjuerefangshi;/**	 * 保温绝热方式	 */

	
	private String gongzuojiezhi;/**	 * 工作介质	 */
	
	private String zhiliaorenshu;/**	 * 治疗人数	 */
	
	private String ceyangfangshi;/**	 * 测氧方式	 */
	
	private String zhaomingfangshi;/**	 * 照明方式	 */
	
	private String rq_shebeipinzhong;/**	 * 容器 设备品种	 */

	/**
	 * 年度报检日期
	 */
	private Date nd_baojianriqi;
	/**
	 * 年度检验日期
	 */
	private Date nd_jianyanriqi;
	/**
	 * 年度下次检验日期
	 */
	private Date nd_xiacijianyanriqi;
	/**
	 * 年度检验结论
	 */
	private String nd_jianyanjielun;
	/**
	 * 年度检验机构
	 */
	private String nd_jianyanjigou;
	
	private String gongzuoyali; //工作压力
	private String gongzuowendu; //工作温度
	
	
	/**
	 * 2017-08-10 注册登记新压力容器产品数据表添加字段
	 */
//	private String chanpinbiaozhun; //产品标准
//	private String rongqileibie; //压力容器类别
//	private String bianhao; //编号
	//主要参数
//	private String neijing; //容器内径  mm
//	private String rongqigao; //容器高（长） mm
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
	private String rongqizongzhongliang; //容器总重量 kg
	private String jiezhizhongliang; //盛装介质重量 kg
	//设计压力
	private String sjyl_kecheng; //壳程 Mpa
	private String sjyl_guancheng; //管程 Mpa
	private String sjyl_jiatao; //夹套  Mpa
	//设计温度
	private String sjwd_kecheng; //壳程 ℃
	private String sjwd_guancheng; //管程 ℃
	private String sjwd_jiatao; //夹套 ℃
	//最高允许工作压力
	private String gzyl_kecheng; //壳程 Mpa
	private String gzyl_guancheng; //管程 Mpa
	private String gzyl_jiatao; //夹套 Mpa
	private String kechengjiezhi; //壳程介质
	private String guanchengjiezhi; //管程介质
	private String jiataojiezhi; //夹套介质
	//结构型式
	private String zhutijiegouxingshi; //主体结构型式
//	private String anzhuangxingshi; //安装型式
//	private String zhizuoxingshi; //支座型式
//	private String baowenjuerefangshi; //保温绝热方式
	//检验试验
	private String wusunjiancefangfa; //无损检测方法
	private String wusunjiancebili; //无损检测比例 %
	private String naiyashiyanzhonglei; //耐压试验种类
	private String naiyashiyanyali; //耐压试验压力 Mpa
	private String xieloushiyanzhonglei; //泄露试验种类
	private String xieloushiyanyali; //泄露试验压力Mpa
	private String rechulizhonglei; //热处理种类
	private String rechuliwendu; //热处理温度  ℃
	
	
	
	public String getCaizhitongti() {
		return caizhitongti;
	}
	public void setCaizhitongti(String caizhitongti) {
		this.caizhitongti = caizhitongti;
	}
	public String getCaizhifengtou() {
		return caizhifengtou;
	}
	public void setCaizhifengtou(String caizhifengtou) {
		this.caizhifengtou = caizhifengtou;
	}
	public String getCaizhijiatao() {
		return caizhijiatao;
	}
	public void setCaizhijiatao(String caizhijiatao) {
		this.caizhijiatao = caizhijiatao;
	}
	public String getCaizhineichen() {
		return caizhineichen;
	}
	public void setCaizhineichen(String caizhineichen) {
		this.caizhineichen = caizhineichen;
	}
	public Double getYalikecheng() {
		return yalikecheng;
	}
	public void setYalikecheng(Double yalikecheng) {
		this.yalikecheng = yalikecheng;
	}
	public String getYaliguancheng() {
		return yaliguancheng;
	}
	public void setYaliguancheng(String yaliguancheng) {
		this.yaliguancheng = yaliguancheng;
	}
	public String getJiezhikecheng() {
		return jiezhikecheng;
	}
	public void setJiezhikecheng(String jiezhikecheng) {
		this.jiezhikecheng = jiezhikecheng;
	}
	public String getJiezhiguancheng() {
		return jiezhiguancheng;
	}
	public void setJiezhiguancheng(String jiezhiguancheng) {
		this.jiezhiguancheng = jiezhiguancheng;
	}
	public Double getWendukecheng() {
		return wendukecheng;
	}
	public void setWendukecheng(Double wendukecheng) {
		this.wendukecheng = wendukecheng;
	}
	public String getWenduguancheng() {
		return wenduguancheng;
	}
	public void setWenduguancheng(String wenduguancheng) {
		this.wenduguancheng = wenduguancheng;
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
	public String getJiegouxingshi() {
		return jiegouxingshi;
	}
	public void setJiegouxingshi(String jiegouxingshi) {
		this.jiegouxingshi = jiegouxingshi;
	}
	public String getZuidachongzhuangliang() {
		return zuidachongzhuangliang;
	}
	public void setZuidachongzhuangliang(String zuidachongzhuangliang) {
		this.zuidachongzhuangliang = zuidachongzhuangliang;
	}
	public String getShejiyali_keti() {
		return shejiyali_keti;
	}
	public void setShejiyali_keti(String shejiyaliKeti) {
		shejiyali_keti = shejiyaliKeti;
	}
	public String getShejiyali_jiatao() {
		return shejiyali_jiatao;
	}
	public void setShejiyali_jiatao(String shejiyaliJiatao) {
		shejiyali_jiatao = shejiyaliJiatao;
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
	public String getShejiwendu_keti() {
		return shejiwendu_keti;
	}
	public void setShejiwendu_keti(String shejiwenduKeti) {
		shejiwendu_keti = shejiwenduKeti;
	}
	public String getShejiwendu_jiatao() {
		return shejiwendu_jiatao;
	}
	public void setShejiwendu_jiatao(String shejiwenduJiatao) {
		shejiwendu_jiatao = shejiwenduJiatao;
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
	public String getHoudu_tongti() {
		return houdu_tongti;
	}
	public void setHoudu_tongti(String houduTongti) {
		houdu_tongti = houduTongti;
	}
	public String getHoudu_fengtou() {
		return houdu_fengtou;
	}
	public void setHoudu_fengtou(String houduFengtou) {
		houdu_fengtou = houduFengtou;
	}
	public String getHoudu_jiatao() {
		return houdu_jiatao;
	}
	public void setHoudu_jiatao(String houduJiatao) {
		houdu_jiatao = houduJiatao;
	}
	public String getHoudu_chenli() {
		return houdu_chenli;
	}
	public void setHoudu_chenli(String houduChenli) {
		houdu_chenli = houduChenli;
	}
	public String getShejishiyongnianxian() {
		return shejishiyongnianxian;
	}
	public void setShejishiyongnianxian(String shejishiyongnianxian) {
		this.shejishiyongnianxian = shejishiyongnianxian;
	}
	public String getShangcijianyanriqi() {
		return shangcijianyanriqi;
	}
	public void setShangcijianyanriqi(String shangcijianyanriqi) {
		this.shangcijianyanriqi = shangcijianyanriqi;
	}
	public String getYunxingzhuangtai() {
		return yunxingzhuangtai;
	}
	public void setYunxingzhuangtai(String yunxingzhuangtai) {
		this.yunxingzhuangtai = yunxingzhuangtai;
	}
	public String getWentichuli() {
		return wentichuli;
	}
	public void setWentichuli(String wentichuli) {
		this.wentichuli = wentichuli;
	}
	public String getAnquandengji() {
		return anquandengji;
	}
	public void setAnquandengji(String anquandengji) {
		this.anquandengji = anquandengji;
	}
	public String getYunxushiyong_yali() {
		return yunxushiyong_yali;
	}
	public void setYunxushiyong_yali(String yunxushiyongYali) {
		yunxushiyong_yali = yunxushiyongYali;
	}
	public String getYunxushiyong_wendu() {
		return yunxushiyong_wendu;
	}
	public void setYunxushiyong_wendu(String yunxushiyongWendu) {
		yunxushiyong_wendu = yunxushiyongWendu;
	}
	public String getYunxushiyong_jiezhi() {
		return yunxushiyong_jiezhi;
	}
	public void setYunxushiyong_jiezhi(String yunxushiyongJiezhi) {
		yunxushiyong_jiezhi = yunxushiyongJiezhi;
	}
	public String getYunxushiyong_qita() {
		return yunxushiyong_qita;
	}
	public void setYunxushiyong_qita(String yunxushiyongQita) {
		yunxushiyong_qita = yunxushiyongQita;
	}
	public String getXiaciniandujianyanriqi() {
		return xiaciniandujianyanriqi;
	}
	public void setXiaciniandujianyanriqi(String xiaciniandujianyanriqi) {
		this.xiaciniandujianyanriqi = xiaciniandujianyanriqi;
	}
	public String getXiaciquanmianjianyanriqi() {
		return xiaciquanmianjianyanriqi;
	}
	public void setXiaciquanmianjianyanriqi(String xiaciquanmianjianyanriqi) {
		this.xiaciquanmianjianyanriqi = xiaciquanmianjianyanriqi;
	}
	public String getShuoming() {
		return shuoming;
	}
	public void setShuoming(String shuoming) {
		this.shuoming = shuoming;
	}
	public String getRongqileibie() {
		return rongqileibie;
	}
	public void setRongqileibie(String rongqileibie) {
		this.rongqileibie = rongqileibie;
	}
	public String getAqglry_lianxidianhua() {
		return aqglry_lianxidianhua;
	}
	public void setAqglry_lianxidianhua(String aqglryLianxidianhua) {
		aqglry_lianxidianhua = aqglryLianxidianhua;
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
	public String getGongzuojiezhi() {
		return gongzuojiezhi;
	}
	public void setGongzuojiezhi(String gongzuojiezhi) {
		this.gongzuojiezhi = gongzuojiezhi;
	}
	public String getZhiliaorenshu() {
		return zhiliaorenshu;
	}
	public void setZhiliaorenshu(String zhiliaorenshu) {
		this.zhiliaorenshu = zhiliaorenshu;
	}
	public String getCeyangfangshi() {
		return ceyangfangshi;
	}
	public void setCeyangfangshi(String ceyangfangshi) {
		this.ceyangfangshi = ceyangfangshi;
	}
	public String getZhaomingfangshi() {
		return zhaomingfangshi;
	}
	public void setZhaomingfangshi(String zhaomingfangshi) {
		this.zhaomingfangshi = zhaomingfangshi;
	}
	public String getRq_shebeipinzhong() {
		return rq_shebeipinzhong;
	}
	public void setRq_shebeipinzhong(String rqShebeipinzhong) {
		rq_shebeipinzhong = rqShebeipinzhong;
	}

	public Date getNd_baojianriqi() {
		return nd_baojianriqi;
	}
	public void setNd_baojianriqi(Date ndBaojianriqi) {
		nd_baojianriqi = ndBaojianriqi;
	}
	public Date getNd_jianyanriqi() {
		return nd_jianyanriqi;
	}
	public void setNd_jianyanriqi(Date ndJianyanriqi) {
		nd_jianyanriqi = ndJianyanriqi;
	}
	public Date getNd_xiacijianyanriqi() {
		return nd_xiacijianyanriqi;
	}
	public void setNd_xiacijianyanriqi(Date ndXiacijianyanriqi) {
		nd_xiacijianyanriqi = ndXiacijianyanriqi;
	}
	public String getNd_jianyanjielun() {
		return nd_jianyanjielun;
	}
	public void setNd_jianyanjielun(String ndJianyanjielun) {
		nd_jianyanjielun = ndJianyanjielun;
	}
	public String getNd_jianyanjigou() {
		return nd_jianyanjigou;
	}
	public void setNd_jianyanjigou(String ndJianyanjigou) {
		nd_jianyanjigou = ndJianyanjigou;
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
	public String getRongqizongzhongliang() {
		return rongqizongzhongliang;
	}
	public void setRongqizongzhongliang(String rongqizongzhongliang) {
		this.rongqizongzhongliang = rongqizongzhongliang;
	}
	public String getJiezhizhongliang() {
		return jiezhizhongliang;
	}
	public void setJiezhizhongliang(String jiezhizhongliang) {
		this.jiezhizhongliang = jiezhizhongliang;
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
	public String getSjyl_jiatao() {
		return sjyl_jiatao;
	}
	public void setSjyl_jiatao(String sjylJiatao) {
		sjyl_jiatao = sjylJiatao;
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
	public String getSjwd_jiatao() {
		return sjwd_jiatao;
	}
	public void setSjwd_jiatao(String sjwdJiatao) {
		sjwd_jiatao = sjwdJiatao;
	}
	public String getGzyl_kecheng() {
		return gzyl_kecheng;
	}
	public void setGzyl_kecheng(String gzylKecheng) {
		gzyl_kecheng = gzylKecheng;
	}
	public String getGzyl_guancheng() {
		return gzyl_guancheng;
	}
	public void setGzyl_guancheng(String gzylGuancheng) {
		gzyl_guancheng = gzylGuancheng;
	}
	public String getGzyl_jiatao() {
		return gzyl_jiatao;
	}
	public void setGzyl_jiatao(String gzylJiatao) {
		gzyl_jiatao = gzylJiatao;
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
	public String getJiataojiezhi() {
		return jiataojiezhi;
	}
	public void setJiataojiezhi(String jiataojiezhi) {
		this.jiataojiezhi = jiataojiezhi;
	}
	public String getZhutijiegouxingshi() {
		return zhutijiegouxingshi;
	}
	public void setZhutijiegouxingshi(String zhutijiegouxingshi) {
		this.zhutijiegouxingshi = zhutijiegouxingshi;
	}
	public String getWusunjiancefangfa() {
		return wusunjiancefangfa;
	}
	public void setWusunjiancefangfa(String wusunjiancefangfa) {
		this.wusunjiancefangfa = wusunjiancefangfa;
	}
	public String getWusunjiancebili() {
		return wusunjiancebili;
	}
	public void setWusunjiancebili(String wusunjiancebili) {
		this.wusunjiancebili = wusunjiancebili;
	}
	public String getNaiyashiyanzhonglei() {
		return naiyashiyanzhonglei;
	}
	public void setNaiyashiyanzhonglei(String naiyashiyanzhonglei) {
		this.naiyashiyanzhonglei = naiyashiyanzhonglei;
	}
	public String getNaiyashiyanyali() {
		return naiyashiyanyali;
	}
	public void setNaiyashiyanyali(String naiyashiyanyali) {
		this.naiyashiyanyali = naiyashiyanyali;
	}
	public String getXieloushiyanzhonglei() {
		return xieloushiyanzhonglei;
	}
	public void setXieloushiyanzhonglei(String xieloushiyanzhonglei) {
		this.xieloushiyanzhonglei = xieloushiyanzhonglei;
	}
	public String getXieloushiyanyali() {
		return xieloushiyanyali;
	}
	public void setXieloushiyanyali(String xieloushiyanyali) {
		this.xieloushiyanyali = xieloushiyanyali;
	}
	public String getRechulizhonglei() {
		return rechulizhonglei;
	}
	public void setRechulizhonglei(String rechulizhonglei) {
		this.rechulizhonglei = rechulizhonglei;
	}
	public String getRechuliwendu() {
		return rechuliwendu;
	}
	public void setRechuliwendu(String rechuliwendu) {
		this.rechuliwendu = rechuliwendu;
	}
	public String getRongqineijing() {
		return rongqineijing;
	}
	public String getRongqigao() {
		return rongqigao;
	}
	public void setRongqineijing(String rongqineijing) {
		this.rongqineijing = rongqineijing;
	}
	public void setRongqigao(String rongqigao) {
		this.rongqigao = rongqigao;
	}
	public TPressureVesselsParam clone(){
		Object object = null;
		try {
			object = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (TPressureVesselsParam)object;
	}
	
	
}
