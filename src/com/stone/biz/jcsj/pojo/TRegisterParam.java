package com.stone.biz.jcsj.pojo;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 * BIZ_REgister_PARAM（参数）
 */
@Entity
@Table(name = "BIZ_REGISTER_PARAM")
@PrimaryKeyJoinColumn(name="BIZ_REGISTER_ID")
public class TRegisterParam extends TRegister implements java.io.Serializable,Cloneable {
    
	private static final long serialVersionUID = -43096041562909383L;

	//电梯
	private String guanlifangshi;
	private String yunxingsudu;
	private String edingzaihe;
	private String cengzhan;
	private String tishenggaodu;
	private String zouxingjuli;
	private String ceng;
	private String zhan;
	private String men;
	private String tijikuandu;
	private String yougangyali;
	private String quduanchangdu;
	private String qingxiejiaodu;
	private String shusongnengli;
	//电梯产品数据表
	private Date chuchangriqi;
	private String edingsudu_sx;
	private String edingsudu_xx;
	private String edingzaizhongliang;
	private String jiaoxiangchicun;
	private String fangbaodengji;
	private String qdzj_edinggonglv;
	private String qdzj_edingzhuansu;
	private String qdzj_jiansubi;
	private String yybz_gongzuoyali;
	private String xgxt_jiezhizhonglei;
	private String xgxt_jiezhishuliang;
	private String xgxt_jiezhixinghao;
	private String xgxt_jiezhiguige;
	private String mingyisudu;
	private String mingyikuandu;
	private String gongzuoleixing;
	private String qdzj_xinghao;
	private String qdzj_chanpinbianhao;
	private String qdzj_zhizaodanwei;
	private String kzg_xinghao;
	private String kzg_yunxingfangshi;
	private String kzg_chanpinbianhao;
	private String kzg_zhizaodanwei;
	
	
	//起重机
	private String zaihe;
	private String tishengliju;
	private String gongzuobanjing;
	private String shebeijibie;
	private String jiegouxingshi;
	private String fangbaoxingshi;
	private String diaojuxingshi;
	private String caozuofangshi;
	private String edingqizhongliang;
	private String edingqizhongliang_dw;
	private String kuadu;
	private String gongzuojibie;
	private String zhengjizonggonglv;
	private String buzhishuliang;
	private String gongzuohuanjing;
	private String yunxingfangshi;
	private String yunxingcaozuoxingshi;
	private String shuoming_2;
	private String yidongsudu;
	private String sijishi;
	//起重机产品数据表
	private String zhizaobiaozhun;
	private String xingshishiyanriqi;
	private String xuanbichang;
	private String qishenggaodu;
	private String xiajiangshendu;
	private String dachejiju;
	private String xiaocheguiju;
	private String zhugouweizhi;
	private String zuidalunya;
	private String zhengjizhongliang;
	private String gongdiandianyuan_v;
	private String gongdiandianyuan_hz;
	private String gongzuowendu_sx;
	private String zhuliangxingshi;
	private String zhituixingshi;
	private String jiegoujiancailiao;
	private String edingqizhongliju;
	private String zuidaqizhongliju;
	private String zuida_gongzuofudu;
	private String zuixiao_gongzuofudu;
	private String zuida_gongzuofudu_qzl;
	private String zuixiao_gongzuofudu_qzl;
	private String fuzhegaodu;
	private String bianfufangshi;
	private String biaozhunjiexingshi;
	private String jizuoxingshi;
	private String bianfushijian;
	private String zhituitiaojiechangdu;
	private String bijiaxingshi;
	private String yongtu;
	private String menjiaxingshi;
	private String huizhuanxingshi;
	private String diaolonggongzuoxingcheng;
	private String diaolongchicun;
	private String biaozhunjiechicun;
	private String qudongjigouxingshi;
	private String diaolongshuliang;
	private String daoguijia;
	private String fudu;
	private String diaojugaodu_zuigao;
	private String diaojugaodu_zuidi;
	private String chengzaisuochuidu;
	private String chengzaisuoxinghao;
	private String qianyinsuoxinghao;
	private String anzhuanggaocheng;
	private String chuikuabi;
	private String huizhuanfanwei;
	private String qita;
	private String zg_edingqizhongliang;
	private String fg_edingqizhongliang;
	private String zg_gongzuofudu;
	private String fg_gongzuofudu;
	private String zg_gongzuofudu_qzl;
	private String fg_gongzuofudu_qzl;
	private String zg_qishenggaodu;
	private String fg_qishenggaodu;
	private String zg_qishengsudu;
	private String fg_qishengsudu;
	private String huizhuanjiaodu;
	private String xingzoufanwei;
	private String tiaosufangshi;
	private String cunrongliang;
	private String shitingcheliang_zl;
	private String shitingcheliang_cc;
	private String danchejinchushijian;
	private String cpsjb_leibie;
	private String bijiajiegouxingshi;
	
	//锅炉
	private String sj_gongzuoyali;
	private String xk_shiyongyali;
	private String edingchuli;
	private String chukouwendu;
	private String jiarefangshi;
	private String ranshaozhonglei;
	private String guoluyongtu;
	private String shiyongzhuangtai;
	private String ranshaofangshi;
	private String shuichulifangshi;
	private String chuyangfangshi;
	private String chuzhafangshi;
	private String xiaoyanchuchenfangshi;
	private String silushuliang;
	private String shuizhirenyuanshuliang;
	private String lianxuzhengfaliang;
	private String zairezhengqiliuliang;
	private String gt_gongzuoyali;
	private String glq_chukouyali;
	private String zrq_rukouyali;
	private String zrq_chukouyali;
	private String geishuiwendu;
	private String grq_chukouwendu;
	private String zrq_rukouwendu;
	private String zrq_chukouwendu;
	private String zlgl_qidongyali;
	private String zlgl_qidongliuliang;
	private String shuixunhuanfangshi;
	private String rsq_buzhifangshi;
	private String sjrlkrj_huifafen;
	private String sjyyjdw_farezhi;
	private String bgs_chulifangshi;
	private String grzq_tiaowenfangshi;
	private String zrzq_tiaowenfangshi;
	private String glqs_fenlifangshi;
	private String qitaqingkuang;

	private String yalidengji;
	private String edingzhengfaliang;
	private String chengqu;
	private String chuchenzhuangzhi;
	private String wuranwu_pm25;
	private String wuranwu_pm10;
	private String wuranwu_pmso2;
	private String wuranwu_pmno2;
	private String fuhebiaozhun;
	private String ranshaojiezhiliang;
	private String biaozhunmei;
	private String nianhaodianliang;
	private String nengxiaoceshi_dx;
	private String nengxiaoceshi_dq;
	private String rexiaolv_sheji;
	private String rexiaolv_shiji;

	private String yunxingrexiaolv;
	private String tianbiaorenyuan;
	private Date aqglry_riqi;
	private Date dingqijianyanriqi;
	private String dengjirenyuan;
	private Date dengjiriqi;
	private String jianguanleibie;
	private String shuoming;
	
	//游乐设施
	private String xiansudu;
	private String ylss_gaodu;
	private String edingchengkerenshu;
	private String gaodu;
	private String baijiao;
	private String huizhuanzhijing;
	private String qingjiao;
	private String sudu;
	private String guidaogaodu;
	private String yunxinggaodu;
	private String gaocha;
	private String fusudu;
	private String qudongxingshi;
	private String qudongzhugonglv;
	private String dianya;
	private String fugonglv;
	private String guiju;
	private String guijuchangdu;
	private String shuihuatigaodu;
	private String youlechishuishen;
	//游乐设施产品数据表
	private String zhuansu;
	private String cheliangshu;
	private String jiasudu;
	
	
	//压力容器 
	private String rongji; //容器容积 m³
	private String gongzuoyali;
	private String gongzuowendu;
	private String jiezhi;
	private String chongzhuangliang;
	private String anquanzhuangkuangdengji;
	private String rongji_dw;
	
	/**
	 * 2017-08-10 注册登记新压力容器产品数据表添加字段
	 */
	private String chanpinbiaozhun; //产品标准
	private String rongqileibie; //压力容器类别
//	private String bianhao; //编号
	//主要参数
	private String neijing; //容器内径  mm
	private String rongqigao; //容器高（长） mm
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
	private String anzhuangxingshi; //安装型式
	private String zhizuoxingshi; //支座型式
	private String baowenjuerefangshi; //保温绝热方式
	//检验试验
	private String wusunjiancefangfa; //无损检测方法
	private String wusunjiancebili; //无损检测比例 %
	private String naiyashiyanzhonglei; //耐压试验种类
	private String naiyashiyanyali; //耐压试验压力 Mpa
	private String xieloushiyanzhonglei; //泄露试验种类
	private String xieloushiyanyali; //泄露试验压力Mpa
	private String rechulizhonglei; //热处理种类
//	private String rechuliwendu; //热处理温度  ℃
	
	
	
	
	//压力管道
	private String gongchengmingcheng;
	private String guandaoguige;
	private String guandaobianhao;
	private String guandaojibie;
	private String gongchengzhijing;
	private String gongchengbihou;
	private String guandaochangdu;
	private String shejiyali;
	private String shejiwendu;
	private String shusongjiezhi;
	private String shifouzhongyaoguandao;
	
	//客运索道
	private String changdu;
	private String yunzainengli;
	private String yunzaicheliangxingshi;
	//客运索道产品数据表
	private String pingju;
	private String zhijiashumu;
	private String dianjixinghao;
	private String zhangjinyouya;
	private String suoju;
	
	
	
	//气瓶
	private String chongzhuangjiezhi;
	private String chepaihao;
	private String vinma;
	//气瓶产品数据表
	private String edingzhiliang;
	private String huanjingwendu;
	private String cs_xinghao;
	private String cs_shuliang;
	private String cs_danpingrongji;
	private String cs_zongrongji;
	private String cs_guige_waijing;
	private String cs_guige_bihou;
	private String cs_guige_changdu;
	private String cs_gongzuoyali;
	private String cs_shejishiyongnianxian;
	private String cs_cl_pingti;
	private String cs_cl_duansai;
	private String cs_cl_guanlu;
	private String sy_wsjcff_qiping;
	private String sy_wsjcff_guanlu;
	private String sy_wsjcbl_qiping;
	private String sy_wsjcbl_guanlu;
	private String sy_nysy_qiping;
	private String sy_nysy_guanlu;
	private String sy_qmsy_qiping;
	private String sy_qmsy_guanlu;
	private String zhihuanyali;
	private String hanyangliang;
	private String rechulifangshi;
	private String rechuliwendu;
	
	/**
	 * 2017-08-11 叉车产品数据表
	 */
	private String fadongjibianhao; //发动机（电机）编号
	private String chejiabianhao;  //车架编号
	//主要参数
//	private String edingqizhongliang; 额定起重量 kg
	private String zaihezhongxinju; //载荷中心距  mm
	private String zizhong;//自重 kg
	private String donglifangshi; //动力方式
	private String xitongdianya; //系统电压 V
	private String fadongjiedinggonglv; //发动机（电机）额定功率 kW
	//最大运行速度 （km/h）
	private String yxsd_kongzai; //空载
	private String yxsd_edingqizhongliang; //额定起重量
	//防爆
	private String dengji; //等级
	private String fangbaoshiyongchangsuo; //防爆使用场所
	//工作装置主要特征和参数
//	private String menjiaxingshi; 门架形式
//	private String qishenggaodu;  空载最大起升高度 mm
	private String ziyougaodu; //（全）自由起升高度 mm
	private String menjiaqingjiao_qian; //门架倾角(°) 前
	private String menjiaqingjiao_hou; //门架倾角(°) 后
	//最大起升速度（mm/s)
	private String qssd_kongzai; //空载
	private String qssd_edingqizhongliang; //额定起重量
	//最大下降速度(mm/s)
	private String xjsd_kongzai; //空载
	private String xjsd_edingqizhongliang; //额定起重量
	//非公路用旅游观光车辆产品数据表
	private String zhengchezhiliang; //整机整备质量  kg
	private String edingzaikerenshu; //额定载客人数  名
	private String chang; //长 mm
	private String gao; //高 mm
	private String kuan; //宽 mm
	private String jianxi; // 最小离地间隙 mm
	private String zhouju_zuo; //轴距（mm） 左
	private String zhouju_you; //轴距（mm） 右
	private String lunju_qian; //轮距（mm） 前
	private String lunju_hou; //轮距（mm） 后
	private String banjing; //最小外侧转弯半径 mm
//	private String sudu; 最大运行速度 km/h
	private String podu; //最大行驶坡度  %
	private String zhidongjuli; //制动距离  m
	private String qianyin_zuoweishu; // 观光列车牵引车头座位数 个
	private String liechechexiangshu; // 观光列车车厢数 节
	private String chexiangzuoweishu; //观光列车每节车厢座位数 个
	
	

	/**
	 * 2017-08-12 锅炉添加字段
	 */
//	private String shebeijibie; //设备级别
	private String wenjianjiandingriqi; //设计文件鉴定日期
	private String jiandingbaogaobianhao; //鉴定报告书编号
	private String jiandingjigou; //鉴定机构名称
	//主要参数
//	private String edingzhengfaliang; //额定蒸发量（热功率）t/h MW
//	private string edingqizhongliang_dw;  //额定蒸发量（热功率）t/h MW
//	private String gongzuoyali; //额定工作压力 MPa
//	private String gongzuowendu; //额定工作温度 ℃
	private String shejireciaolv; //设计热效率 %
//	private String geishuiwendu; //给水温度 ℃
	private String edingchushui; //额定出水（油） ℃
	private String huishuiwendu; //回水（油）温度  ℃
//	private String rongji; //锅炉本体水（油）容积  L
	private String bentijiezhi; //整装锅炉本体液压试验介质 MPa
	private String bentiyali; //整装锅炉本体液压试验压力 MPa
	private String zhengqiliuliang; //再热蒸汽流量  t/h
	private String qimijiezhi; //有机热载体锅炉气密试验介质 MPa
	private String qimiyali; //有机热载体锅炉气密试验压力 MPa
//	private String ranshaofangshi; //燃烧方式
	private String ranliaozhonglei; //燃料（或者热源）种类
	private String jinkouwendu; //再热器进（出）口温度 ℃
	private String chukouyali;  //再热器进（出）口压力  MPa
//	private String chukouwendu; //再热器进（出）口温度 ℃
	private String jinkouyanli; //再热器进（出）口压力  MPa
	
	/**
	 * 2017-08-15 补充参数表
	 */
	private String shiyongdanweibeizhu; //使用单位名称备注
	private String lengku;//是否冷库设备
	
	
		
	
	
	
	
	
	public String getGuanlifangshi() {
		return guanlifangshi;
	}
	public void setGuanlifangshi(String guanlifangshi) {
		this.guanlifangshi = guanlifangshi;
	}
	public String getYunxingsudu() {
		return yunxingsudu;
	}
	public void setYunxingsudu(String yunxingsudu) {
		this.yunxingsudu = yunxingsudu;
	}
	public String getEdingzaihe() {
		return edingzaihe;
	}
	public void setEdingzaihe(String edingzaihe) {
		this.edingzaihe = edingzaihe;
	}
	public String getCengzhan() {
		return cengzhan;
	}
	public void setCengzhan(String cengzhan) {
		this.cengzhan = cengzhan;
	}
	public String getTishenggaodu() {
		return tishenggaodu;
	}
	public void setTishenggaodu(String tishenggaodu) {
		this.tishenggaodu = tishenggaodu;
	}
	public String getZouxingjuli() {
		return zouxingjuli;
	}
	public void setZouxingjuli(String zouxingjuli) {
		this.zouxingjuli = zouxingjuli;
	}
	public String getCeng() {
		return ceng;
	}
	public void setCeng(String ceng) {
		this.ceng = ceng;
	}
	public String getZhan() {
		return zhan;
	}
	public void setZhan(String zhan) {
		this.zhan = zhan;
	}
	public String getMen() {
		return men;
	}
	public void setMen(String men) {
		this.men = men;
	}
	public String getTijikuandu() {
		return tijikuandu;
	}
	public void setTijikuandu(String tijikuandu) {
		this.tijikuandu = tijikuandu;
	}
	public String getYougangyali() {
		return yougangyali;
	}
	public void setYougangyali(String yougangyali) {
		this.yougangyali = yougangyali;
	}
	public String getQuduanchangdu() {
		return quduanchangdu;
	}
	public void setQuduanchangdu(String quduanchangdu) {
		this.quduanchangdu = quduanchangdu;
	}
	public String getQingxiejiaodu() {
		return qingxiejiaodu;
	}
	public void setQingxiejiaodu(String qingxiejiaodu) {
		this.qingxiejiaodu = qingxiejiaodu;
	}
	public String getZaihe() {
		return zaihe;
	}
	public void setZaihe(String zaihe) {
		this.zaihe = zaihe;
	}
	public String getTishengliju() {
		return tishengliju;
	}
	public void setTishengliju(String tishengliju) {
		this.tishengliju = tishengliju;
	}
	public String getGongzuobanjing() {
		return gongzuobanjing;
	}
	public void setGongzuobanjing(String gongzuobanjing) {
		this.gongzuobanjing = gongzuobanjing;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getSj_gongzuoyali() {
		return sj_gongzuoyali;
	}
	public void setSj_gongzuoyali(String sjGongzuoyali) {
		sj_gongzuoyali = sjGongzuoyali;
	}
	public String getXk_shiyongyali() {
		return xk_shiyongyali;
	}
	public void setXk_shiyongyali(String xkShiyongyali) {
		xk_shiyongyali = xkShiyongyali;
	}
	public String getEdingchuli() {
		return edingchuli;
	}
	public void setEdingchuli(String edingchuli) {
		this.edingchuli = edingchuli;
	}
	public String getChukouwendu() {
		return chukouwendu;
	}
	public void setChukouwendu(String chukouwendu) {
		this.chukouwendu = chukouwendu;
	}
	public String getJiarefangshi() {
		return jiarefangshi;
	}
	public void setJiarefangshi(String jiarefangshi) {
		this.jiarefangshi = jiarefangshi;
	}
	public String getRanshaozhonglei() {
		return ranshaozhonglei;
	}
	public void setRanshaozhonglei(String ranshaozhonglei) {
		this.ranshaozhonglei = ranshaozhonglei;
	}
	public String getGuoluyongtu() {
		return guoluyongtu;
	}
	public void setGuoluyongtu(String guoluyongtu) {
		this.guoluyongtu = guoluyongtu;
	}
	public String getShiyongzhuangtai() {
		return shiyongzhuangtai;
	}
	public void setShiyongzhuangtai(String shiyongzhuangtai) {
		this.shiyongzhuangtai = shiyongzhuangtai;
	}
	public String getRanshaofangshi() {
		return ranshaofangshi;
	}
	public void setRanshaofangshi(String ranshaofangshi) {
		this.ranshaofangshi = ranshaofangshi;
	}
	public String getShuichulifangshi() {
		return shuichulifangshi;
	}
	public void setShuichulifangshi(String shuichulifangshi) {
		this.shuichulifangshi = shuichulifangshi;
	}
	public String getChuyangfangshi() {
		return chuyangfangshi;
	}
	public void setChuyangfangshi(String chuyangfangshi) {
		this.chuyangfangshi = chuyangfangshi;
	}
	public String getChuzhafangshi() {
		return chuzhafangshi;
	}
	public void setChuzhafangshi(String chuzhafangshi) {
		this.chuzhafangshi = chuzhafangshi;
	}
	public String getXiaoyanchuchenfangshi() {
		return xiaoyanchuchenfangshi;
	}
	public void setXiaoyanchuchenfangshi(String xiaoyanchuchenfangshi) {
		this.xiaoyanchuchenfangshi = xiaoyanchuchenfangshi;
	}
	public String getSilushuliang() {
		return silushuliang;
	}
	public void setSilushuliang(String silushuliang) {
		this.silushuliang = silushuliang;
	}
	public String getShuizhirenyuanshuliang() {
		return shuizhirenyuanshuliang;
	}
	public void setShuizhirenyuanshuliang(String shuizhirenyuanshuliang) {
		this.shuizhirenyuanshuliang = shuizhirenyuanshuliang;
	}
	public String getLianxuzhengfaliang() {
		return lianxuzhengfaliang;
	}
	public void setLianxuzhengfaliang(String lianxuzhengfaliang) {
		this.lianxuzhengfaliang = lianxuzhengfaliang;
	}
	public String getZairezhengqiliuliang() {
		return zairezhengqiliuliang;
	}
	public void setZairezhengqiliuliang(String zairezhengqiliuliang) {
		this.zairezhengqiliuliang = zairezhengqiliuliang;
	}
	public String getGt_gongzuoyali() {
		return gt_gongzuoyali;
	}
	public void setGt_gongzuoyali(String gtGongzuoyali) {
		gt_gongzuoyali = gtGongzuoyali;
	}
	public String getGlq_chukouyali() {
		return glq_chukouyali;
	}
	public void setGlq_chukouyali(String glqChukouyali) {
		glq_chukouyali = glqChukouyali;
	}
	public String getZrq_rukouyali() {
		return zrq_rukouyali;
	}
	public void setZrq_rukouyali(String zrqRukouyali) {
		zrq_rukouyali = zrqRukouyali;
	}
	public String getZrq_chukouyali() {
		return zrq_chukouyali;
	}
	public void setZrq_chukouyali(String zrqChukouyali) {
		zrq_chukouyali = zrqChukouyali;
	}
	public String getGeishuiwendu() {
		return geishuiwendu;
	}
	public void setGeishuiwendu(String geishuiwendu) {
		this.geishuiwendu = geishuiwendu;
	}
	public String getGrq_chukouwendu() {
		return grq_chukouwendu;
	}
	public void setGrq_chukouwendu(String grqChukouwendu) {
		grq_chukouwendu = grqChukouwendu;
	}
	public String getZrq_rukouwendu() {
		return zrq_rukouwendu;
	}
	public void setZrq_rukouwendu(String zrqRukouwendu) {
		zrq_rukouwendu = zrqRukouwendu;
	}
	public String getZrq_chukouwendu() {
		return zrq_chukouwendu;
	}
	public void setZrq_chukouwendu(String zrqChukouwendu) {
		zrq_chukouwendu = zrqChukouwendu;
	}
	public String getZlgl_qidongyali() {
		return zlgl_qidongyali;
	}
	public void setZlgl_qidongyali(String zlglQidongyali) {
		zlgl_qidongyali = zlglQidongyali;
	}
	public String getZlgl_qidongliuliang() {
		return zlgl_qidongliuliang;
	}
	public void setZlgl_qidongliuliang(String zlglQidongliuliang) {
		zlgl_qidongliuliang = zlglQidongliuliang;
	}
	public String getShuixunhuanfangshi() {
		return shuixunhuanfangshi;
	}
	public void setShuixunhuanfangshi(String shuixunhuanfangshi) {
		this.shuixunhuanfangshi = shuixunhuanfangshi;
	}
	public String getRsq_buzhifangshi() {
		return rsq_buzhifangshi;
	}
	public void setRsq_buzhifangshi(String rsqBuzhifangshi) {
		rsq_buzhifangshi = rsqBuzhifangshi;
	}
	public String getSjrlkrj_huifafen() {
		return sjrlkrj_huifafen;
	}
	public void setSjrlkrj_huifafen(String sjrlkrjHuifafen) {
		sjrlkrj_huifafen = sjrlkrjHuifafen;
	}
	public String getSjyyjdw_farezhi() {
		return sjyyjdw_farezhi;
	}
	public void setSjyyjdw_farezhi(String sjyyjdwFarezhi) {
		sjyyjdw_farezhi = sjyyjdwFarezhi;
	}
	public String getBgs_chulifangshi() {
		return bgs_chulifangshi;
	}
	public void setBgs_chulifangshi(String bgsChulifangshi) {
		bgs_chulifangshi = bgsChulifangshi;
	}
	public String getGrzq_tiaowenfangshi() {
		return grzq_tiaowenfangshi;
	}
	public void setGrzq_tiaowenfangshi(String grzqTiaowenfangshi) {
		grzq_tiaowenfangshi = grzqTiaowenfangshi;
	}
	public String getZrzq_tiaowenfangshi() {
		return zrzq_tiaowenfangshi;
	}
	public void setZrzq_tiaowenfangshi(String zrzqTiaowenfangshi) {
		zrzq_tiaowenfangshi = zrzqTiaowenfangshi;
	}
	public String getGlqs_fenlifangshi() {
		return glqs_fenlifangshi;
	}
	public void setGlqs_fenlifangshi(String glqsFenlifangshi) {
		glqs_fenlifangshi = glqsFenlifangshi;
	}
	public String getQitaqingkuang() {
		return qitaqingkuang;
	}
	public void setQitaqingkuang(String qitaqingkuang) {
		this.qitaqingkuang = qitaqingkuang;
	}
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
	public String getGaodu() {
		return gaodu;
	}
	public void setGaodu(String gaodu) {
		this.gaodu = gaodu;
	}
	public String getBaijiao() {
		return baijiao;
	}
	public void setBaijiao(String baijiao) {
		this.baijiao = baijiao;
	}
	public String getHuizhuanzhijing() {
		return huizhuanzhijing;
	}
	public void setHuizhuanzhijing(String huizhuanzhijing) {
		this.huizhuanzhijing = huizhuanzhijing;
	}
	public String getQingjiao() {
		return qingjiao;
	}
	public void setQingjiao(String qingjiao) {
		this.qingjiao = qingjiao;
	}
	public String getSudu() {
		return sudu;
	}
	public void setSudu(String sudu) {
		this.sudu = sudu;
	}
	public String getGuidaogaodu() {
		return guidaogaodu;
	}
	public void setGuidaogaodu(String guidaogaodu) {
		this.guidaogaodu = guidaogaodu;
	}
	public String getYunxinggaodu() {
		return yunxinggaodu;
	}
	public void setYunxinggaodu(String yunxinggaodu) {
		this.yunxinggaodu = yunxinggaodu;
	}
	public String getGaocha() {
		return gaocha;
	}
	public void setGaocha(String gaocha) {
		this.gaocha = gaocha;
	}
	public String getRongji() {
		return rongji;
	}
	public void setRongji(String rongji) {
		this.rongji = rongji;
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
	public String getJiezhi() {
		return jiezhi;
	}
	public void setJiezhi(String jiezhi) {
		this.jiezhi = jiezhi;
	}
	public String getChongzhuangliang() {
		return chongzhuangliang;
	}
	public void setChongzhuangliang(String chongzhuangliang) {
		this.chongzhuangliang = chongzhuangliang;
	}
	public String getYunxingrexiaolv() {
		return yunxingrexiaolv;
	}
	public void setYunxingrexiaolv(String yunxingrexiaolv) {
		this.yunxingrexiaolv = yunxingrexiaolv;
	}
	public String getTianbiaorenyuan() {
		return tianbiaorenyuan;
	}
	public void setTianbiaorenyuan(String tianbiaorenyuan) {
		this.tianbiaorenyuan = tianbiaorenyuan;
	}
	public Date getAqglry_riqi() {
		return aqglry_riqi;
	}
	public void setAqglry_riqi(Date aqglryRiqi) {
		aqglry_riqi = aqglryRiqi;
	}
	public Date getDingqijianyanriqi() {
		return dingqijianyanriqi;
	}
	public void setDingqijianyanriqi(Date dingqijianyanriqi) {
		this.dingqijianyanriqi = dingqijianyanriqi;
	}
	public String getDengjirenyuan() {
		return dengjirenyuan;
	}
	public void setDengjirenyuan(String dengjirenyuan) {
		this.dengjirenyuan = dengjirenyuan;
	}
	public Date getDengjiriqi() {
		return dengjiriqi;
	}
	public void setDengjiriqi(Date dengjiriqi) {
		this.dengjiriqi = dengjiriqi;
	}
	public String getJianguanleibie() {
		return jianguanleibie;
	}
	public void setJianguanleibie(String jianguanleibie) {
		this.jianguanleibie = jianguanleibie;
	}
	public String getShuoming() {
		return shuoming;
	}
	public void setShuoming(String shuoming) {
		this.shuoming = shuoming;
	}
	public String getShebeijibie() {
		return shebeijibie;
	}
	public void setShebeijibie(String shebeijibie) {
		this.shebeijibie = shebeijibie;
	}
	public String getJiegouxingshi() {
		return jiegouxingshi;
	}
	public void setJiegouxingshi(String jiegouxingshi) {
		this.jiegouxingshi = jiegouxingshi;
	}
	public String getFangbaoxingshi() {
		return fangbaoxingshi;
	}
	public void setFangbaoxingshi(String fangbaoxingshi) {
		this.fangbaoxingshi = fangbaoxingshi;
	}
	public String getDiaojuxingshi() {
		return diaojuxingshi;
	}
	public void setDiaojuxingshi(String diaojuxingshi) {
		this.diaojuxingshi = diaojuxingshi;
	}
	public String getCaozuofangshi() {
		return caozuofangshi;
	}
	public void setCaozuofangshi(String caozuofangshi) {
		this.caozuofangshi = caozuofangshi;
	}
	public String getEdingqizhongliang() {
		return edingqizhongliang;
	}
	public void setEdingqizhongliang(String edingqizhongliang) {
		this.edingqizhongliang = edingqizhongliang;
	}
	public String getKuadu() {
		return kuadu;
	}
	public void setKuadu(String kuadu) {
		this.kuadu = kuadu;
	}
	public String getGongzuojibie() {
		return gongzuojibie;
	}
	public void setGongzuojibie(String gongzuojibie) {
		this.gongzuojibie = gongzuojibie;
	}
	public String getZhengjizonggonglv() {
		return zhengjizonggonglv;
	}
	public void setZhengjizonggonglv(String zhengjizonggonglv) {
		this.zhengjizonggonglv = zhengjizonggonglv;
	}
	public String getBuzhishuliang() {
		return buzhishuliang;
	}
	public void setBuzhishuliang(String buzhishuliang) {
		this.buzhishuliang = buzhishuliang;
	}
	public String getGongzuohuanjing() {
		return gongzuohuanjing;
	}
	public void setGongzuohuanjing(String gongzuohuanjing) {
		this.gongzuohuanjing = gongzuohuanjing;
	}
	public String getYunxingfangshi() {
		return yunxingfangshi;
	}
	public void setYunxingfangshi(String yunxingfangshi) {
		this.yunxingfangshi = yunxingfangshi;
	}
	public String getYunxingcaozuoxingshi() {
		return yunxingcaozuoxingshi;
	}
	public void setYunxingcaozuoxingshi(String yunxingcaozuoxingshi) {
		this.yunxingcaozuoxingshi = yunxingcaozuoxingshi;
	}
	public String getShuoming_2() {
		return shuoming_2;
	}
	public void setShuoming_2(String shuoming_2) {
		this.shuoming_2 = shuoming_2;
	}
	public String getAnquanzhuangkuangdengji() {
		return anquanzhuangkuangdengji;
	}
	public void setAnquanzhuangkuangdengji(String anquanzhuangkuangdengji) {
		this.anquanzhuangkuangdengji = anquanzhuangkuangdengji;
	}
	public String getGongchengmingcheng() {
		return gongchengmingcheng;
	}
	public void setGongchengmingcheng(String gongchengmingcheng) {
		this.gongchengmingcheng = gongchengmingcheng;
	}
	public String getGuandaoguige() {
		return guandaoguige;
	}
	public void setGuandaoguige(String guandaoguige) {
		this.guandaoguige = guandaoguige;
	}
	public String getGuandaobianhao() {
		return guandaobianhao;
	}
	public void setGuandaobianhao(String guandaobianhao) {
		this.guandaobianhao = guandaobianhao;
	}
	public String getGuandaojibie() {
		return guandaojibie;
	}
	public void setGuandaojibie(String guandaojibie) {
		this.guandaojibie = guandaojibie;
	}
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
	public String getShifouzhongyaoguandao() {
		return shifouzhongyaoguandao;
	}
	public void setShifouzhongyaoguandao(String shifouzhongyaoguandao) {
		this.shifouzhongyaoguandao = shifouzhongyaoguandao;
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
	public String getYalidengji() {
		return yalidengji;
	}
	public void setYalidengji(String yalidengji) {
		this.yalidengji = yalidengji;
	}
	public String getEdingzhengfaliang() {
		return edingzhengfaliang;
	}
	public void setEdingzhengfaliang(String edingzhengfaliang) {
		this.edingzhengfaliang = edingzhengfaliang;
	}
	public String getChengqu() {
		return chengqu;
	}
	public void setChengqu(String chengqu) {
		this.chengqu = chengqu;
	}
	public String getChuchenzhuangzhi() {
		return chuchenzhuangzhi;
	}
	public void setChuchenzhuangzhi(String chuchenzhuangzhi) {
		this.chuchenzhuangzhi = chuchenzhuangzhi;
	}
	public String getWuranwu_pm25() {
		return wuranwu_pm25;
	}
	public void setWuranwu_pm25(String wuranwuPm25) {
		wuranwu_pm25 = wuranwuPm25;
	}
	public String getWuranwu_pm10() {
		return wuranwu_pm10;
	}
	public void setWuranwu_pm10(String wuranwuPm10) {
		wuranwu_pm10 = wuranwuPm10;
	}
	public String getWuranwu_pmso2() {
		return wuranwu_pmso2;
	}
	public void setWuranwu_pmso2(String wuranwuPmso2) {
		wuranwu_pmso2 = wuranwuPmso2;
	}
	public String getWuranwu_pmno2() {
		return wuranwu_pmno2;
	}
	public void setWuranwu_pmno2(String wuranwuPmno2) {
		wuranwu_pmno2 = wuranwuPmno2;
	}
	public String getFuhebiaozhun() {
		return fuhebiaozhun;
	}
	public void setFuhebiaozhun(String fuhebiaozhun) {
		this.fuhebiaozhun = fuhebiaozhun;
	}
	public String getRanshaojiezhiliang() {
		return ranshaojiezhiliang;
	}
	public void setRanshaojiezhiliang(String ranshaojiezhiliang) {
		this.ranshaojiezhiliang = ranshaojiezhiliang;
	}
	public String getBiaozhunmei() {
		return biaozhunmei;
	}
	public void setBiaozhunmei(String biaozhunmei) {
		this.biaozhunmei = biaozhunmei;
	}
	public String getNianhaodianliang() {
		return nianhaodianliang;
	}
	public void setNianhaodianliang(String nianhaodianliang) {
		this.nianhaodianliang = nianhaodianliang;
	}
	public String getNengxiaoceshi_dx() {
		return nengxiaoceshi_dx;
	}
	public void setNengxiaoceshi_dx(String nengxiaoceshiDx) {
		nengxiaoceshi_dx = nengxiaoceshiDx;
	}
	public String getNengxiaoceshi_dq() {
		return nengxiaoceshi_dq;
	}
	public void setNengxiaoceshi_dq(String nengxiaoceshiDq) {
		nengxiaoceshi_dq = nengxiaoceshiDq;
	}
	public String getRexiaolv_sheji() {
		return rexiaolv_sheji;
	}
	public void setRexiaolv_sheji(String rexiaolvSheji) {
		rexiaolv_sheji = rexiaolvSheji;
	}
	public String getRexiaolv_shiji() {
		return rexiaolv_shiji;
	}
	public void setRexiaolv_shiji(String rexiaolvShiji) {
		rexiaolv_shiji = rexiaolvShiji;
	}
	public String getEdingqizhongliang_dw() {
		return edingqizhongliang_dw;
	}
	public void setEdingqizhongliang_dw(String edingqizhongliangDw) {
		edingqizhongliang_dw = edingqizhongliangDw;
	}
	public String getChongzhuangjiezhi() {
		return chongzhuangjiezhi;
	}
	public void setChongzhuangjiezhi(String chongzhuangjiezhi) {
		this.chongzhuangjiezhi = chongzhuangjiezhi;
	}
	public String getChepaihao() {
		return chepaihao;
	}
	public void setChepaihao(String chepaihao) {
		this.chepaihao = chepaihao;
	}
	public String getVinma() {
		return vinma;
	}
	public void setVinma(String vinma) {
		this.vinma = vinma;
	}
	public String getRongji_dw() {
		return rongji_dw;
	}
	public void setRongji_dw(String rongjiDw) {
		rongji_dw = rongjiDw;
	}
	public String getShusongnengli() {
		return shusongnengli;
	}
	public void setShusongnengli(String shusongnengli) {
		this.shusongnengli = shusongnengli;
	}
	public String getYidongsudu() {
		return yidongsudu;
	}
	public void setYidongsudu(String yidongsudu) {
		this.yidongsudu = yidongsudu;
	}
	public String getSijishi() {
		return sijishi;
	}
	public void setSijishi(String sijishi) {
		this.sijishi = sijishi;
	}
	public Date getChuchangriqi() {
		return chuchangriqi;
	}
	public void setChuchangriqi(Date chuchangriqi) {
		this.chuchangriqi = chuchangriqi;
	}
	public String getEdingsudu_sx() {
		return edingsudu_sx;
	}
	public void setEdingsudu_sx(String edingsuduSx) {
		edingsudu_sx = edingsuduSx;
	}
	public String getEdingsudu_xx() {
		return edingsudu_xx;
	}
	public void setEdingsudu_xx(String edingsuduXx) {
		edingsudu_xx = edingsuduXx;
	}
	public String getEdingzaizhongliang() {
		return edingzaizhongliang;
	}
	public void setEdingzaizhongliang(String edingzaizhongliang) {
		this.edingzaizhongliang = edingzaizhongliang;
	}
	public String getJiaoxiangchicun() {
		return jiaoxiangchicun;
	}
	public void setJiaoxiangchicun(String jiaoxiangchicun) {
		this.jiaoxiangchicun = jiaoxiangchicun;
	}
	public String getFangbaodengji() {
		return fangbaodengji;
	}
	public void setFangbaodengji(String fangbaodengji) {
		this.fangbaodengji = fangbaodengji;
	}
	public String getQdzj_edinggonglv() {
		return qdzj_edinggonglv;
	}
	public void setQdzj_edinggonglv(String qdzjEdinggonglv) {
		qdzj_edinggonglv = qdzjEdinggonglv;
	}
	public String getQdzj_edingzhuansu() {
		return qdzj_edingzhuansu;
	}
	public void setQdzj_edingzhuansu(String qdzjEdingzhuansu) {
		qdzj_edingzhuansu = qdzjEdingzhuansu;
	}
	public String getQdzj_jiansubi() {
		return qdzj_jiansubi;
	}
	public void setQdzj_jiansubi(String qdzjJiansubi) {
		qdzj_jiansubi = qdzjJiansubi;
	}
	public String getYybz_gongzuoyali() {
		return yybz_gongzuoyali;
	}
	public void setYybz_gongzuoyali(String yybzGongzuoyali) {
		yybz_gongzuoyali = yybzGongzuoyali;
	}
	public String getXgxt_jiezhizhonglei() {
		return xgxt_jiezhizhonglei;
	}
	public void setXgxt_jiezhizhonglei(String xgxtJiezhizhonglei) {
		xgxt_jiezhizhonglei = xgxtJiezhizhonglei;
	}
	public String getXgxt_jiezhishuliang() {
		return xgxt_jiezhishuliang;
	}
	public void setXgxt_jiezhishuliang(String xgxtJiezhishuliang) {
		xgxt_jiezhishuliang = xgxtJiezhishuliang;
	}
	public String getXgxt_jiezhixinghao() {
		return xgxt_jiezhixinghao;
	}
	public void setXgxt_jiezhixinghao(String xgxtJiezhixinghao) {
		xgxt_jiezhixinghao = xgxtJiezhixinghao;
	}
	public String getXgxt_jiezhiguige() {
		return xgxt_jiezhiguige;
	}
	public void setXgxt_jiezhiguige(String xgxtJiezhiguige) {
		xgxt_jiezhiguige = xgxtJiezhiguige;
	}
	public String getMingyisudu() {
		return mingyisudu;
	}
	public void setMingyisudu(String mingyisudu) {
		this.mingyisudu = mingyisudu;
	}
	public String getMingyikuandu() {
		return mingyikuandu;
	}
	public void setMingyikuandu(String mingyikuandu) {
		this.mingyikuandu = mingyikuandu;
	}
	public String getGongzuoleixing() {
		return gongzuoleixing;
	}
	public void setGongzuoleixing(String gongzuoleixing) {
		this.gongzuoleixing = gongzuoleixing;
	}
	public String getQdzj_xinghao() {
		return qdzj_xinghao;
	}
	public void setQdzj_xinghao(String qdzjXinghao) {
		qdzj_xinghao = qdzjXinghao;
	}
	public String getQdzj_chanpinbianhao() {
		return qdzj_chanpinbianhao;
	}
	public void setQdzj_chanpinbianhao(String qdzjChanpinbianhao) {
		qdzj_chanpinbianhao = qdzjChanpinbianhao;
	}
	public String getQdzj_zhizaodanwei() {
		return qdzj_zhizaodanwei;
	}
	public void setQdzj_zhizaodanwei(String qdzjZhizaodanwei) {
		qdzj_zhizaodanwei = qdzjZhizaodanwei;
	}
	public String getKzg_xinghao() {
		return kzg_xinghao;
	}
	public void setKzg_xinghao(String kzgXinghao) {
		kzg_xinghao = kzgXinghao;
	}
	public String getKzg_yunxingfangshi() {
		return kzg_yunxingfangshi;
	}
	public void setKzg_yunxingfangshi(String kzgYunxingfangshi) {
		kzg_yunxingfangshi = kzgYunxingfangshi;
	}
	public String getKzg_chanpinbianhao() {
		return kzg_chanpinbianhao;
	}
	public void setKzg_chanpinbianhao(String kzgChanpinbianhao) {
		kzg_chanpinbianhao = kzgChanpinbianhao;
	}
	public String getKzg_zhizaodanwei() {
		return kzg_zhizaodanwei;
	}
	public void setKzg_zhizaodanwei(String kzgZhizaodanwei) {
		kzg_zhizaodanwei = kzgZhizaodanwei;
	}
	public String getZhizaobiaozhun() {
		return zhizaobiaozhun;
	}
	public void setZhizaobiaozhun(String zhizaobiaozhun) {
		this.zhizaobiaozhun = zhizaobiaozhun;
	}
	public String getXingshishiyanriqi() {
		return xingshishiyanriqi;
	}
	public void setXingshishiyanriqi(String xingshishiyanriqi) {
		this.xingshishiyanriqi = xingshishiyanriqi;
	}
	public String getXuanbichang() {
		return xuanbichang;
	}
	public void setXuanbichang(String xuanbichang) {
		this.xuanbichang = xuanbichang;
	}
	public String getQishenggaodu() {
		return qishenggaodu;
	}
	public void setQishenggaodu(String qishenggaodu) {
		this.qishenggaodu = qishenggaodu;
	}
	public String getXiajiangshendu() {
		return xiajiangshendu;
	}
	public void setXiajiangshendu(String xiajiangshendu) {
		this.xiajiangshendu = xiajiangshendu;
	}
	public String getDachejiju() {
		return dachejiju;
	}
	public void setDachejiju(String dachejiju) {
		this.dachejiju = dachejiju;
	}
	public String getXiaocheguiju() {
		return xiaocheguiju;
	}
	public void setXiaocheguiju(String xiaocheguiju) {
		this.xiaocheguiju = xiaocheguiju;
	}
	public String getZhugouweizhi() {
		return zhugouweizhi;
	}
	public void setZhugouweizhi(String zhugouweizhi) {
		this.zhugouweizhi = zhugouweizhi;
	}
	public String getZuidalunya() {
		return zuidalunya;
	}
	public void setZuidalunya(String zuidalunya) {
		this.zuidalunya = zuidalunya;
	}
	public String getZhengjizhongliang() {
		return zhengjizhongliang;
	}
	public void setZhengjizhongliang(String zhengjizhongliang) {
		this.zhengjizhongliang = zhengjizhongliang;
	}
	public String getGongdiandianyuan_v() {
		return gongdiandianyuan_v;
	}
	public void setGongdiandianyuan_v(String gongdiandianyuanV) {
		gongdiandianyuan_v = gongdiandianyuanV;
	}
	public String getGongdiandianyuan_hz() {
		return gongdiandianyuan_hz;
	}
	public void setGongdiandianyuan_hz(String gongdiandianyuanHz) {
		gongdiandianyuan_hz = gongdiandianyuanHz;
	}
	public String getGongzuowendu_sx() {
		return gongzuowendu_sx;
	}
	public void setGongzuowendu_sx(String gongzuowenduSx) {
		gongzuowendu_sx = gongzuowenduSx;
	}
	public String getZhuliangxingshi() {
		return zhuliangxingshi;
	}
	public void setZhuliangxingshi(String zhuliangxingshi) {
		this.zhuliangxingshi = zhuliangxingshi;
	}
	public String getZhituixingshi() {
		return zhituixingshi;
	}
	public void setZhituixingshi(String zhituixingshi) {
		this.zhituixingshi = zhituixingshi;
	}
	public String getJiegoujiancailiao() {
		return jiegoujiancailiao;
	}
	public void setJiegoujiancailiao(String jiegoujiancailiao) {
		this.jiegoujiancailiao = jiegoujiancailiao;
	}
	public String getEdingqizhongliju() {
		return edingqizhongliju;
	}
	public void setEdingqizhongliju(String edingqizhongliju) {
		this.edingqizhongliju = edingqizhongliju;
	}
	public String getZuidaqizhongliju() {
		return zuidaqizhongliju;
	}
	public void setZuidaqizhongliju(String zuidaqizhongliju) {
		this.zuidaqizhongliju = zuidaqizhongliju;
	}
	public String getZuida_gongzuofudu() {
		return zuida_gongzuofudu;
	}
	public void setZuida_gongzuofudu(String zuidaGongzuofudu) {
		zuida_gongzuofudu = zuidaGongzuofudu;
	}
	public String getZuixiao_gongzuofudu() {
		return zuixiao_gongzuofudu;
	}
	public void setZuixiao_gongzuofudu(String zuixiaoGongzuofudu) {
		zuixiao_gongzuofudu = zuixiaoGongzuofudu;
	}
	public String getZuida_gongzuofudu_qzl() {
		return zuida_gongzuofudu_qzl;
	}
	public void setZuida_gongzuofudu_qzl(String zuidaGongzuofuduQzl) {
		zuida_gongzuofudu_qzl = zuidaGongzuofuduQzl;
	}
	public String getZuixiao_gongzuofudu_qzl() {
		return zuixiao_gongzuofudu_qzl;
	}
	public void setZuixiao_gongzuofudu_qzl(String zuixiaoGongzuofuduQzl) {
		zuixiao_gongzuofudu_qzl = zuixiaoGongzuofuduQzl;
	}
	public String getFuzhegaodu() {
		return fuzhegaodu;
	}
	public void setFuzhegaodu(String fuzhegaodu) {
		this.fuzhegaodu = fuzhegaodu;
	}
	public String getBianfufangshi() {
		return bianfufangshi;
	}
	public void setBianfufangshi(String bianfufangshi) {
		this.bianfufangshi = bianfufangshi;
	}
	public String getBiaozhunjiexingshi() {
		return biaozhunjiexingshi;
	}
	public void setBiaozhunjiexingshi(String biaozhunjiexingshi) {
		this.biaozhunjiexingshi = biaozhunjiexingshi;
	}
	public String getJizuoxingshi() {
		return jizuoxingshi;
	}
	public void setJizuoxingshi(String jizuoxingshi) {
		this.jizuoxingshi = jizuoxingshi;
	}
	public String getBianfushijian() {
		return bianfushijian;
	}
	public void setBianfushijian(String bianfushijian) {
		this.bianfushijian = bianfushijian;
	}
	public String getZhituitiaojiechangdu() {
		return zhituitiaojiechangdu;
	}
	public void setZhituitiaojiechangdu(String zhituitiaojiechangdu) {
		this.zhituitiaojiechangdu = zhituitiaojiechangdu;
	}
	public String getBijiaxingshi() {
		return bijiaxingshi;
	}
	public void setBijiaxingshi(String bijiaxingshi) {
		this.bijiaxingshi = bijiaxingshi;
	}
	public String getYongtu() {
		return yongtu;
	}
	public void setYongtu(String yongtu) {
		this.yongtu = yongtu;
	}
	public String getMenjiaxingshi() {
		return menjiaxingshi;
	}
	public void setMenjiaxingshi(String menjiaxingshi) {
		this.menjiaxingshi = menjiaxingshi;
	}
	public String getHuizhuanxingshi() {
		return huizhuanxingshi;
	}
	public void setHuizhuanxingshi(String huizhuanxingshi) {
		this.huizhuanxingshi = huizhuanxingshi;
	}
	public String getDiaolonggongzuoxingcheng() {
		return diaolonggongzuoxingcheng;
	}
	public void setDiaolonggongzuoxingcheng(String diaolonggongzuoxingcheng) {
		this.diaolonggongzuoxingcheng = diaolonggongzuoxingcheng;
	}
	public String getDiaolongchicun() {
		return diaolongchicun;
	}
	public void setDiaolongchicun(String diaolongchicun) {
		this.diaolongchicun = diaolongchicun;
	}
	public String getBiaozhunjiechicun() {
		return biaozhunjiechicun;
	}
	public void setBiaozhunjiechicun(String biaozhunjiechicun) {
		this.biaozhunjiechicun = biaozhunjiechicun;
	}
	public String getQudongjigouxingshi() {
		return qudongjigouxingshi;
	}
	public void setQudongjigouxingshi(String qudongjigouxingshi) {
		this.qudongjigouxingshi = qudongjigouxingshi;
	}
	public String getDiaolongshuliang() {
		return diaolongshuliang;
	}
	public void setDiaolongshuliang(String diaolongshuliang) {
		this.diaolongshuliang = diaolongshuliang;
	}
	public String getDaoguijia() {
		return daoguijia;
	}
	public void setDaoguijia(String daoguijia) {
		this.daoguijia = daoguijia;
	}
	public String getFudu() {
		return fudu;
	}
	public void setFudu(String fudu) {
		this.fudu = fudu;
	}
	public String getDiaojugaodu_zuigao() {
		return diaojugaodu_zuigao;
	}
	public void setDiaojugaodu_zuigao(String diaojugaoduZuigao) {
		diaojugaodu_zuigao = diaojugaoduZuigao;
	}
	public String getDiaojugaodu_zuidi() {
		return diaojugaodu_zuidi;
	}
	public void setDiaojugaodu_zuidi(String diaojugaoduZuidi) {
		diaojugaodu_zuidi = diaojugaoduZuidi;
	}
	public String getChengzaisuochuidu() {
		return chengzaisuochuidu;
	}
	public void setChengzaisuochuidu(String chengzaisuochuidu) {
		this.chengzaisuochuidu = chengzaisuochuidu;
	}
	public String getChengzaisuoxinghao() {
		return chengzaisuoxinghao;
	}
	public void setChengzaisuoxinghao(String chengzaisuoxinghao) {
		this.chengzaisuoxinghao = chengzaisuoxinghao;
	}
	public String getQianyinsuoxinghao() {
		return qianyinsuoxinghao;
	}
	public void setQianyinsuoxinghao(String qianyinsuoxinghao) {
		this.qianyinsuoxinghao = qianyinsuoxinghao;
	}
	public String getAnzhuanggaocheng() {
		return anzhuanggaocheng;
	}
	public void setAnzhuanggaocheng(String anzhuanggaocheng) {
		this.anzhuanggaocheng = anzhuanggaocheng;
	}
	public String getChuikuabi() {
		return chuikuabi;
	}
	public void setChuikuabi(String chuikuabi) {
		this.chuikuabi = chuikuabi;
	}
	public String getHuizhuanfanwei() {
		return huizhuanfanwei;
	}
	public void setHuizhuanfanwei(String huizhuanfanwei) {
		this.huizhuanfanwei = huizhuanfanwei;
	}
	public String getQita() {
		return qita;
	}
	public void setQita(String qita) {
		this.qita = qita;
	}
	public String getZg_edingqizhongliang() {
		return zg_edingqizhongliang;
	}
	public void setZg_edingqizhongliang(String zgEdingqizhongliang) {
		zg_edingqizhongliang = zgEdingqizhongliang;
	}
	public String getFg_edingqizhongliang() {
		return fg_edingqizhongliang;
	}
	public void setFg_edingqizhongliang(String fgEdingqizhongliang) {
		fg_edingqizhongliang = fgEdingqizhongliang;
	}
	public String getZg_gongzuofudu() {
		return zg_gongzuofudu;
	}
	public void setZg_gongzuofudu(String zgGongzuofudu) {
		zg_gongzuofudu = zgGongzuofudu;
	}
	public String getFg_gongzuofudu() {
		return fg_gongzuofudu;
	}
	public void setFg_gongzuofudu(String fgGongzuofudu) {
		fg_gongzuofudu = fgGongzuofudu;
	}
	public String getZg_gongzuofudu_qzl() {
		return zg_gongzuofudu_qzl;
	}
	public void setZg_gongzuofudu_qzl(String zgGongzuofuduQzl) {
		zg_gongzuofudu_qzl = zgGongzuofuduQzl;
	}
	public String getFg_gongzuofudu_qzl() {
		return fg_gongzuofudu_qzl;
	}
	public void setFg_gongzuofudu_qzl(String fgGongzuofuduQzl) {
		fg_gongzuofudu_qzl = fgGongzuofuduQzl;
	}
	public String getZg_qishenggaodu() {
		return zg_qishenggaodu;
	}
	public void setZg_qishenggaodu(String zgQishenggaodu) {
		zg_qishenggaodu = zgQishenggaodu;
	}
	public String getFg_qishenggaodu() {
		return fg_qishenggaodu;
	}
	public void setFg_qishenggaodu(String fgQishenggaodu) {
		fg_qishenggaodu = fgQishenggaodu;
	}
	public String getZg_qishengsudu() {
		return zg_qishengsudu;
	}
	public void setZg_qishengsudu(String zgQishengsudu) {
		zg_qishengsudu = zgQishengsudu;
	}
	public String getFg_qishengsudu() {
		return fg_qishengsudu;
	}
	public void setFg_qishengsudu(String fgQishengsudu) {
		fg_qishengsudu = fgQishengsudu;
	}
	public String getHuizhuanjiaodu() {
		return huizhuanjiaodu;
	}
	public void setHuizhuanjiaodu(String huizhuanjiaodu) {
		this.huizhuanjiaodu = huizhuanjiaodu;
	}
	public String getXingzoufanwei() {
		return xingzoufanwei;
	}
	public void setXingzoufanwei(String xingzoufanwei) {
		this.xingzoufanwei = xingzoufanwei;
	}
	public String getTiaosufangshi() {
		return tiaosufangshi;
	}
	public void setTiaosufangshi(String tiaosufangshi) {
		this.tiaosufangshi = tiaosufangshi;
	}
	public String getCunrongliang() {
		return cunrongliang;
	}
	public void setCunrongliang(String cunrongliang) {
		this.cunrongliang = cunrongliang;
	}
	public String getShitingcheliang_zl() {
		return shitingcheliang_zl;
	}
	public void setShitingcheliang_zl(String shitingcheliangZl) {
		shitingcheliang_zl = shitingcheliangZl;
	}
	public String getShitingcheliang_cc() {
		return shitingcheliang_cc;
	}
	public void setShitingcheliang_cc(String shitingcheliangCc) {
		shitingcheliang_cc = shitingcheliangCc;
	}
	public String getDanchejinchushijian() {
		return danchejinchushijian;
	}
	public void setDanchejinchushijian(String danchejinchushijian) {
		this.danchejinchushijian = danchejinchushijian;
	}
	public String getCpsjb_leibie() {
		return cpsjb_leibie;
	}
	public void setCpsjb_leibie(String cpsjbLeibie) {
		cpsjb_leibie = cpsjbLeibie;
	}
	public String getBijiajiegouxingshi() {
		return bijiajiegouxingshi;
	}
	public void setBijiajiegouxingshi(String bijiajiegouxingshi) {
		this.bijiajiegouxingshi = bijiajiegouxingshi;
	}
	public String getZhuansu() {
		return zhuansu;
	}
	public void setZhuansu(String zhuansu) {
		this.zhuansu = zhuansu;
	}
	public String getCheliangshu() {
		return cheliangshu;
	}
	public void setCheliangshu(String cheliangshu) {
		this.cheliangshu = cheliangshu;
	}
	public String getJiasudu() {
		return jiasudu;
	}
	public void setJiasudu(String jiasudu) {
		this.jiasudu = jiasudu;
	}
	public String getPingju() {
		return pingju;
	}
	public void setPingju(String pingju) {
		this.pingju = pingju;
	}
	public String getZhijiashumu() {
		return zhijiashumu;
	}
	public void setZhijiashumu(String zhijiashumu) {
		this.zhijiashumu = zhijiashumu;
	}
	public String getDianjixinghao() {
		return dianjixinghao;
	}
	public void setDianjixinghao(String dianjixinghao) {
		this.dianjixinghao = dianjixinghao;
	}
	public String getZhangjinyouya() {
		return zhangjinyouya;
	}
	public void setZhangjinyouya(String zhangjinyouya) {
		this.zhangjinyouya = zhangjinyouya;
	}
	public String getSuoju() {
		return suoju;
	}
	public void setSuoju(String suoju) {
		this.suoju = suoju;
	}
	public String getEdingzhiliang() {
		return edingzhiliang;
	}
	public void setEdingzhiliang(String edingzhiliang) {
		this.edingzhiliang = edingzhiliang;
	}
	public String getHuanjingwendu() {
		return huanjingwendu;
	}
	public void setHuanjingwendu(String huanjingwendu) {
		this.huanjingwendu = huanjingwendu;
	}
	public String getCs_xinghao() {
		return cs_xinghao;
	}
	public void setCs_xinghao(String csXinghao) {
		cs_xinghao = csXinghao;
	}
	public String getCs_shuliang() {
		return cs_shuliang;
	}
	public void setCs_shuliang(String csShuliang) {
		cs_shuliang = csShuliang;
	}
	public String getCs_danpingrongji() {
		return cs_danpingrongji;
	}
	public void setCs_danpingrongji(String csDanpingrongji) {
		cs_danpingrongji = csDanpingrongji;
	}
	public String getCs_zongrongji() {
		return cs_zongrongji;
	}
	public void setCs_zongrongji(String csZongrongji) {
		cs_zongrongji = csZongrongji;
	}
	public String getCs_guige_waijing() {
		return cs_guige_waijing;
	}
	public void setCs_guige_waijing(String csGuigeWaijing) {
		cs_guige_waijing = csGuigeWaijing;
	}
	public String getCs_guige_bihou() {
		return cs_guige_bihou;
	}
	public void setCs_guige_bihou(String csGuigeBihou) {
		cs_guige_bihou = csGuigeBihou;
	}
	public String getCs_guige_changdu() {
		return cs_guige_changdu;
	}
	public void setCs_guige_changdu(String csGuigeChangdu) {
		cs_guige_changdu = csGuigeChangdu;
	}
	public String getCs_gongzuoyali() {
		return cs_gongzuoyali;
	}
	public void setCs_gongzuoyali(String csGongzuoyali) {
		cs_gongzuoyali = csGongzuoyali;
	}
	public String getCs_shejishiyongnianxian() {
		return cs_shejishiyongnianxian;
	}
	public void setCs_shejishiyongnianxian(String csShejishiyongnianxian) {
		cs_shejishiyongnianxian = csShejishiyongnianxian;
	}
	public String getCs_cl_pingti() {
		return cs_cl_pingti;
	}
	public void setCs_cl_pingti(String csClPingti) {
		cs_cl_pingti = csClPingti;
	}
	public String getCs_cl_duansai() {
		return cs_cl_duansai;
	}
	public void setCs_cl_duansai(String csClDuansai) {
		cs_cl_duansai = csClDuansai;
	}
	public String getCs_cl_guanlu() {
		return cs_cl_guanlu;
	}
	public void setCs_cl_guanlu(String csClGuanlu) {
		cs_cl_guanlu = csClGuanlu;
	}
	public String getSy_wsjcff_qiping() {
		return sy_wsjcff_qiping;
	}
	public void setSy_wsjcff_qiping(String syWsjcffQiping) {
		sy_wsjcff_qiping = syWsjcffQiping;
	}
	public String getSy_wsjcff_guanlu() {
		return sy_wsjcff_guanlu;
	}
	public void setSy_wsjcff_guanlu(String syWsjcffGuanlu) {
		sy_wsjcff_guanlu = syWsjcffGuanlu;
	}
	public String getSy_wsjcbl_qiping() {
		return sy_wsjcbl_qiping;
	}
	public void setSy_wsjcbl_qiping(String syWsjcblQiping) {
		sy_wsjcbl_qiping = syWsjcblQiping;
	}
	public String getSy_wsjcbl_guanlu() {
		return sy_wsjcbl_guanlu;
	}
	public void setSy_wsjcbl_guanlu(String syWsjcblGuanlu) {
		sy_wsjcbl_guanlu = syWsjcblGuanlu;
	}
	public String getSy_nysy_qiping() {
		return sy_nysy_qiping;
	}
	public void setSy_nysy_qiping(String syNysyQiping) {
		sy_nysy_qiping = syNysyQiping;
	}
	public String getSy_nysy_guanlu() {
		return sy_nysy_guanlu;
	}
	public void setSy_nysy_guanlu(String syNysyGuanlu) {
		sy_nysy_guanlu = syNysyGuanlu;
	}
	public String getSy_qmsy_qiping() {
		return sy_qmsy_qiping;
	}
	public void setSy_qmsy_qiping(String syQmsyQiping) {
		sy_qmsy_qiping = syQmsyQiping;
	}
	public String getSy_qmsy_guanlu() {
		return sy_qmsy_guanlu;
	}
	public void setSy_qmsy_guanlu(String syQmsyGuanlu) {
		sy_qmsy_guanlu = syQmsyGuanlu;
	}
	public String getZhihuanyali() {
		return zhihuanyali;
	}
	public void setZhihuanyali(String zhihuanyali) {
		this.zhihuanyali = zhihuanyali;
	}
	public String getHanyangliang() {
		return hanyangliang;
	}
	public void setHanyangliang(String hanyangliang) {
		this.hanyangliang = hanyangliang;
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
	public String getChanpinbiaozhun() {
		return chanpinbiaozhun;
	}
	public void setChanpinbiaozhun(String chanpinbiaozhun) {
		this.chanpinbiaozhun = chanpinbiaozhun;
	}
	public String getRongqileibie() {
		return rongqileibie;
	}
	public void setRongqileibie(String rongqileibie) {
		this.rongqileibie = rongqileibie;
	}
//	public String getBianhao() {
//		return bianhao;
//	}
//	public void setBianhao(String bianhao) {
//		this.bianhao = bianhao;
//	}
	public String getNeijing() {
		return neijing;
	}
	public void setNeijing(String neijing) {
		this.neijing = neijing;
	}
	public String getRongqigao() {
		return rongqigao;
	}
	public void setRongqigao(String rongqigao) {
		this.rongqigao = rongqigao;
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
	public String getFadongjibianhao() {
		return fadongjibianhao;
	}
	public void setFadongjibianhao(String fadongjibianhao) {
		this.fadongjibianhao = fadongjibianhao;
	}
	public String getChejiabianhao() {
		return chejiabianhao;
	}
	public void setChejiabianhao(String chejiabianhao) {
		this.chejiabianhao = chejiabianhao;
	}
	public String getZaihezhongxinju() {
		return zaihezhongxinju;
	}
	public void setZaihezhongxinju(String zaihezhongxinju) {
		this.zaihezhongxinju = zaihezhongxinju;
	}
	public String getZizhong() {
		return zizhong;
	}
	public void setZizhong(String zizhong) {
		this.zizhong = zizhong;
	}
	public String getDonglifangshi() {
		return donglifangshi;
	}
	public void setDonglifangshi(String donglifangshi) {
		this.donglifangshi = donglifangshi;
	}
	public String getXitongdianya() {
		return xitongdianya;
	}
	public void setXitongdianya(String xitongdianya) {
		this.xitongdianya = xitongdianya;
	}
	public String getFadongjiedinggonglv() {
		return fadongjiedinggonglv;
	}
	public void setFadongjiedinggonglv(String fadongjiedinggonglv) {
		this.fadongjiedinggonglv = fadongjiedinggonglv;
	}
	public String getYxsd_kongzai() {
		return yxsd_kongzai;
	}
	public void setYxsd_kongzai(String yxsdKongzai) {
		yxsd_kongzai = yxsdKongzai;
	}
	public String getYxsd_edingqizhongliang() {
		return yxsd_edingqizhongliang;
	}
	public void setYxsd_edingqizhongliang(String yxsdEdingqizhongliang) {
		yxsd_edingqizhongliang = yxsdEdingqizhongliang;
	}
	public String getDengji() {
		return dengji;
	}
	public void setDengji(String dengji) {
		this.dengji = dengji;
	}
	public String getFangbaoshiyongchangsuo() {
		return fangbaoshiyongchangsuo;
	}
	public void setFangbaoshiyongchangsuo(String fangbaoshiyongchangsuo) {
		this.fangbaoshiyongchangsuo = fangbaoshiyongchangsuo;
	}
	public String getZiyougaodu() {
		return ziyougaodu;
	}
	public void setZiyougaodu(String ziyougaodu) {
		this.ziyougaodu = ziyougaodu;
	}
	public String getMenjiaqingjiao_qian() {
		return menjiaqingjiao_qian;
	}
	public void setMenjiaqingjiao_qian(String menjiaqingjiaoQian) {
		menjiaqingjiao_qian = menjiaqingjiaoQian;
	}
	public String getMenjiaqingjiao_hou() {
		return menjiaqingjiao_hou;
	}
	public void setMenjiaqingjiao_hou(String menjiaqingjiaoHou) {
		menjiaqingjiao_hou = menjiaqingjiaoHou;
	}
	public String getQssd_kongzai() {
		return qssd_kongzai;
	}
	public void setQssd_kongzai(String qssdKongzai) {
		qssd_kongzai = qssdKongzai;
	}
	public String getQssd_edingqizhongliang() {
		return qssd_edingqizhongliang;
	}
	public void setQssd_edingqizhongliang(String qssdEdingqizhongliang) {
		qssd_edingqizhongliang = qssdEdingqizhongliang;
	}
	public String getXjsd_kongzai() {
		return xjsd_kongzai;
	}
	public void setXjsd_kongzai(String xjsdKongzai) {
		xjsd_kongzai = xjsdKongzai;
	}
	public String getXjsd_edingqizhongliang() {
		return xjsd_edingqizhongliang;
	}
	public void setXjsd_edingqizhongliang(String xjsdEdingqizhongliang) {
		xjsd_edingqizhongliang = xjsdEdingqizhongliang;
	}
	public String getZhengchezhiliang() {
		return zhengchezhiliang;
	}
	public void setZhengchezhiliang(String zhengchezhiliang) {
		this.zhengchezhiliang = zhengchezhiliang;
	}
	public String getEdingzaikerenshu() {
		return edingzaikerenshu;
	}
	public void setEdingzaikerenshu(String edingzaikerenshu) {
		this.edingzaikerenshu = edingzaikerenshu;
	}
	public String getChang() {
		return chang;
	}
	public void setChang(String chang) {
		this.chang = chang;
	}
	public String getGao() {
		return gao;
	}
	public void setGao(String gao) {
		this.gao = gao;
	}
	public String getKuan() {
		return kuan;
	}
	public void setKuan(String kuan) {
		this.kuan = kuan;
	}
	public String getJianxi() {
		return jianxi;
	}
	public void setJianxi(String jianxi) {
		this.jianxi = jianxi;
	}
	public String getZhouju_zuo() {
		return zhouju_zuo;
	}
	public void setZhouju_zuo(String zhoujuZuo) {
		zhouju_zuo = zhoujuZuo;
	}
	public String getZhouju_you() {
		return zhouju_you;
	}
	public void setZhouju_you(String zhoujuYou) {
		zhouju_you = zhoujuYou;
	}
	public String getLunju_qian() {
		return lunju_qian;
	}
	public void setLunju_qian(String lunjuQian) {
		lunju_qian = lunjuQian;
	}
	public String getLunju_hou() {
		return lunju_hou;
	}
	public void setLunju_hou(String lunjuHou) {
		lunju_hou = lunjuHou;
	}
	public String getBanjing() {
		return banjing;
	}
	public void setBanjing(String banjing) {
		this.banjing = banjing;
	}
	public String getPodu() {
		return podu;
	}
	public void setPodu(String podu) {
		this.podu = podu;
	}
	public String getZhidongjuli() {
		return zhidongjuli;
	}
	public void setZhidongjuli(String zhidongjuli) {
		this.zhidongjuli = zhidongjuli;
	}
	public String getQianyin_zuoweishu() {
		return qianyin_zuoweishu;
	}
	public void setQianyin_zuoweishu(String qianyinZuoweishu) {
		qianyin_zuoweishu = qianyinZuoweishu;
	}
	public String getLiechechexiangshu() {
		return liechechexiangshu;
	}
	public void setLiechechexiangshu(String liechechexiangshu) {
		this.liechechexiangshu = liechechexiangshu;
	}
	public String getChexiangzuoweishu() {
		return chexiangzuoweishu;
	}
	public void setChexiangzuoweishu(String chexiangzuoweishu) {
		this.chexiangzuoweishu = chexiangzuoweishu;
	}
	public String getWenjianjiandingriqi() {
		return wenjianjiandingriqi;
	}
	public void setWenjianjiandingriqi(String wenjianjiandingriqi) {
		this.wenjianjiandingriqi = wenjianjiandingriqi;
	}
	public String getJiandingbaogaobianhao() {
		return jiandingbaogaobianhao;
	}
	public void setJiandingbaogaobianhao(String jiandingbaogaobianhao) {
		this.jiandingbaogaobianhao = jiandingbaogaobianhao;
	}
	public String getJiandingjigou() {
		return jiandingjigou;
	}
	public void setJiandingjigou(String jiandingjigou) {
		this.jiandingjigou = jiandingjigou;
	}
	public String getShejireciaolv() {
		return shejireciaolv;
	}
	public void setShejireciaolv(String shejireciaolv) {
		this.shejireciaolv = shejireciaolv;
	}
	public String getEdingchushui() {
		return edingchushui;
	}
	public void setEdingchushui(String edingchushui) {
		this.edingchushui = edingchushui;
	}
	public String getHuishuiwendu() {
		return huishuiwendu;
	}
	public void setHuishuiwendu(String huishuiwendu) {
		this.huishuiwendu = huishuiwendu;
	}
	public String getBentijiezhi() {
		return bentijiezhi;
	}
	public void setBentijiezhi(String bentijiezhi) {
		this.bentijiezhi = bentijiezhi;
	}
	public String getBentiyali() {
		return bentiyali;
	}
	public void setBentiyali(String bentiyali) {
		this.bentiyali = bentiyali;
	}
	public String getJinkouwendu() {
		return jinkouwendu;
	}
	public void setJinkouwendu(String jinkouwendu) {
		this.jinkouwendu = jinkouwendu;
	}
	public String getChukouyali() {
		return chukouyali;
	}
	public void setChukouyali(String chukouyali) {
		this.chukouyali = chukouyali;
	}
	public String getZhengqiliuliang() {
		return zhengqiliuliang;
	}
	public void setZhengqiliuliang(String zhengqiliuliang) {
		this.zhengqiliuliang = zhengqiliuliang;
	}
	public String getQimijiezhi() {
		return qimijiezhi;
	}
	public void setQimijiezhi(String qimijiezhi) {
		this.qimijiezhi = qimijiezhi;
	}
	public String getQimiyali() {
		return qimiyali;
	}
	public void setQimiyali(String qimiyali) {
		this.qimiyali = qimiyali;
	}
	public String getRanliaozhonglei() {
		return ranliaozhonglei;
	}
	public void setRanliaozhonglei(String ranliaozhonglei) {
		this.ranliaozhonglei = ranliaozhonglei;
	}
	public String getJinkouyanli() {
		return jinkouyanli;
	}
	public void setJinkouyanli(String jinkouyanli) {
		this.jinkouyanli = jinkouyanli;
	}
	public String getShiyongdanweibeizhu() {
		return shiyongdanweibeizhu;
	}
	public void setShiyongdanweibeizhu(String shiyongdanweibeizhu) {
		this.shiyongdanweibeizhu = shiyongdanweibeizhu;
	}
	public String getLengku() {
		return lengku;
	}
	public void setLengku(String lengku) {
		this.lengku = lengku;
	}
	
	
	
}