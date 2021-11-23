package com.stone.biz.jcsj.pojo;

import java.text.DecimalFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;


/**
 * 
 * 起重机械_技术参数
 * 
 */
@Entity
@Table(name = "BIZ_CRANEPARAM")
@PrimaryKeyJoinColumn(name="craneId")
@XmlRootElement(name = "TCraneParam")
public class TCraneParam extends TBaseInfo implements java.io.Serializable,Cloneable{
	

	/**
	 * 额定起重量  (额定载重量)
	 */
	private String edingqizhongliang;
	
	/**
	 * 最大幅度起重量
	 */
	private String zuidafuduqizhongliang;
	
	/**
	 * 最大起重力矩
	 */
	private String zuidaqizhongliju;
	
	/**
	 * 跨度
	 */
	private String kuadu;
	
	/**
	 * 起升高度
	 */
	private String qishenggaodu;
	
	/**
	 * 起升高度_轨道上
	 */
	private String qishenggaodu_shang;
	
	/**
	 * 起升高度_轨道下
	 */
	private String qishenggaodu_xia;
	
	/**
	 * 起升速度
	 */
	private String qishengsudu;
	
	/**
	 * 起升速度_额定载荷
	 */
	private String qishengsudu_edingzaihe;
	
	/**
	 * 起升速度_空载
	 */
	private String qishengsudu_kongzai;
	
	/**
	 * 大车运行速度
	 */
	private String dacheyunxingsudu;
	
	/**
	 * 大车运行速度_前进
	 */
	private String dacheyunxingsudu_qianjin;
	
	/**
	 * 大车运行速度_后退
	 */
	private String dacheyunxingsudu_houtui;
	
	/**
	 * 小车运行速度
	 */
	private String xiaocheyunxingsudu;
	
	/**
	 * 工作幅度_前伸
	 */
	private String gongzuofudu_qianshen;
	
	/**
	 * 工作幅度_轨距
	 */
	private String gongzuofudu_guju;
	
	/**
	 * 工作幅度_后伸
	 */
	private String gongzuofudu_houshen;
	
	/**
	 * 回转速度
	 */
	private String huizhuansudu;
	
	/**
	 * 移动速度
	 */
	private String yidongsudu;
	
	/**
	 * 是否复检
	 */
	private String fujian;
	
	/**
	 * 恶劣检验环境
	 */
	private String  erliejianyanhuanjing;
	
	/**
	 * 司机室
	 */
	private String  sijishi;

	/**
	 * 标准价格
	 */
	private Double  biaozhunjiage;
	
	/**
	 * 核定费用
	 */
	private Double  hedingfeiyong;
	
	private String kongchezhongliang;
	private String dipanbianhao;

	private String chewei;//车位
	private String cuncherongliang;//存车容量
	private String shitingcheliangchangdu;//适停车辆长度
	private String shitingcheliangkuandu;//适停车辆宽度
	private String shitingchelianggaodu;//适停车辆高度
	private String ziyouduanxingcheng;//自由端行程
	private String ziyouduangaodu;//自由端高度

	private String zhengchezhongliang;//整机设计重量
	private String edingqizhongliju;//额定起重力矩
	private String tishenggaodu="0";//提升高度
	private String fugan;//是否有副杆
	private String tuoguache;//有否拖挂车
	private String ranliaozhonglei;//燃料种类
	private String gongzuohuanjing;//工作环境
	private String gongzuojibie;//工作级别
	private String zuidagongzuofudu;//最大工作幅度
	private String xuanbichangdu;//悬臂长度
	private String zuoxuanbichangdu;//左悬臂长度
	private String youxuanbichangdu;//右悬臂长度
	private String guokongsudu;//过孔速度
	private String zuidaguokongjuli;//最大过孔距离
	private String quanshenzhubibichang ;//全伸主臂臂长

	private String qudongfangshi;//驱动方式
	private String yanse;//颜色
	private String fadongjibianhao;//发动机编号
	
	private String shiyongquyu;//使用区域
	private String shitingcheliangzhongliang;//适停车辆重量
	private String shitingcheliangchicun ;//适停车辆尺寸
	private String cengshu;//层数
	private String shangshengsudu ;//上升速度
	
	
	private String bianfusudu ;//变幅速度
	private String gongzuofudu ;//工作幅度
	private String xingzousudu ;//行走速度
	private String youxiaobanjing ;//有效半径
	private String zuigaoshisu ;//最高时速
	
	/**
	 * 厂车参数
	 * **/
	private String paizhaohaoma;//牌照号码
	private String yunxingsudu ;//运行速度 /起重机械运行速度
	private String changneicheliang_edingzaihe;//厂内车辆额定载荷
	private String donglifangshi;// 动力方式


	/**
	 * 最大幅度
	 */
	private String zuidafudu;

	/**
	 * 车辆名称
	 */
	private String cheliangmingcheng;
	/**
	 * 厂牌型号
	 */
	private	String changpaixinghao;
	private String qudong; //驱动
	
	
	/**
	 * 20170805 新增字段
	 */
	//门式起重机产品数据表
	private String zhizaobiaozhun; //整机制造标准
	private String shiyanjigou; //型式试验机构
	private String shiyanriqi; //型式试验日期
	private String shiyanzhengshubianhao; //型式试验证书编号
	private String xiajiangshendu; //下降深度 m
	private String zhugouzuoyouweizhi; //主钩左右极限位置 m
	private String zhengjigonglv; //整机功率kW
	private String zuidalunya; //最大计算轮压 kN
	private String gongdiandianyuan; //供电电源  V     HZ
	private String gongzuowendu; //工作环境温度    ～     ℃
	private String shiyongchangsuo; //使用场所  □露天   □室内  □防爆
	private String zhuliangxingshi; //主梁型式 □正轨箱形梁  □偏轨箱形梁  □单腹板梁  □桁架梁 □导梁□其他
	private String zhituixingshi; //支腿型式 □箱形  □桁架  □其他
	private String shoulijiegoucailiao; //主要受力结构件材料 
	//塔式起重机产品数据表
	 private String zuixiaofuduqizhongliang; //最小/最大工作幅度对应的起重量 t
	private String zuidafuzhuogaodu; //最大附着高度 m
	private String duligaodu; //独立高度  m
	private String yunxingguiji; //运行轨距 m
	private String bianfufangshi; //变幅方式 □水平臂小车变幅    □倾斜式小车变幅     □动臂变幅
	private String biaozhunxingshi; //塔身标准节型式 □整体式 □组合式
	private String jizuoxingshi; //基座型式 □固定式 □轨行式
	//流动式起重机产品数据表
	private String bianfushijian; //全程变幅时间 s
	private String jixieguiju; //行走机械轨距 m
	private String xingshisudu; //行驶速度 m/min
	private String zhituichangdu; //支腿调节长度  mm
	private String bijiaxingshi; //臂架型式 □定长式  □桁架式  □伸缩式  □立柱式  □其他
	//门座式起重机产品数据表
	private String zuidagaodu; //整机最大高度 m
	private String yongtu; //用途
	private String menjiajiegouxingshi; //门架结构型式 □圆筒型 □交叉式□撑杆式    □桁架式
	private String huizhuanzhichengxingshi; //回转支承型式 □转盘式   □柱式
	//升降机产品数据表
	private String diaolonggongzuoxingcheng; //吊笼工作行程 m
	private String diaolongchicun; //吊笼尺寸(长×宽×高)  mm
	private String biaozhunjiechicun; //标准节尺寸(长×宽×高) mm
	private String caozongfangshi; //操纵方式 □司机室 □工作台
	private String qudongxingshi; //驱动机构型式 □曳引式    □钢丝绳式     □齿轮齿条式   □液压式□强制式    □有对重(或平衡重)    □其他 
	private String diaolongshuliang; //吊笼数量 □单笼   □双笼
	private String daoguijia; //导 轨 架 □单     □双
	private String biaozhunjiefangshi; //标准节加节方式
	//缆索式起重机产品数据表
	private String diaojuzuigaogaodu; //吊具最高高度 m
	private String chengzaisuochuidu; //承载索垂度 m
	private String diaojuzuidigaodu; //吊具最低高度 m
	private String chengzaisuoxinghao; //承载索型号 
	private String qianyinsuoxinghao; //牵引索型号
	private String anzhuanggaocheng; //安装高程 m
	private String chuikuabi; //垂跨比  %
	private String huizhuanfanwei; //回转范围 m
	private String qita; //其它
	private String zhutijiegouxingshi; //主体结构型式 □固定式  □平移式  □辐射式  □摇摆式  □弧动式□索轨式  □其他
	//桅杆式起重机产品数据表
	private String zhugouzuidaliang; //主钩最大额定起重量 t
	private String fugouzuidaliang; //副钩最大额定起重量 t
	private String zhugouzuidafudu; //主钩最大工作幅度 m
	private String fugouzuidafudu; //副钩最大工作幅度 m
	private String zhugouzuidafuduliang; //主钩最大工作幅度时的额定起重量 t
	private String fugouzuidafuduliang; //副钩最大工作幅度时的额定起重量 t
	private String zhugouzuidagaodu; //主钩最大起升高度 m
	private String fugouzuidagaodu; //副钩最大起升高度 m
	private String zhugouqishengsudu; //主钩起升速度  m/min
	private String fugouqishengsudu; //副钩起升速度 m/min
	private String huizhuanjiaodu; //回转角度 °
	private String xingzoufanwei; //行走范围 m 
	private String zhutiaosufengshi; //主调速方式 
	 //机械式停车设备产品数据表
	private String danchezuidajinchushijian; //单车最大进(出)车时间 s
	private String cenggao; //层高 mm
	private String edingshengjiangsudu;//额定升降速度 m/min
	private String edinghengyisudu; //额定横移速度 m/min
	private String qishengfangshi; //起升方式 □钢丝绳 □链条  □丝杠  □液压  □齿轮齿条式  □其他
	
	
	
	/**
	 * 2017-08-11 叉车产品数据表
	 */
//	private String fadongjibianhao; //发动机（电机）编号  3
	private String chejiabianhao;  //车架编号
	//主要参数
//	private String edingqizhongliang; 额定起重量 kg
	private String zaihezhongxinju; //载荷中心距  mm
	private String zizhong;//自重 kg
//	private String donglifangshi; //动力方式  2
	private String xitongdianya; //系统电压 V
	private String fadongjiedinggonglv; //发动机（电机）额定功率 kW
	//最大运行速度 （km/h）
	private String yxsd_kongzai; //空载
	private String yxsd_edingqizhongliang; //额定起重量
	//防爆
	private String dengji; //等级
	private String fangbaoshiyongchangsuo; //防爆使用场所
	//工作装置主要特征和参数
	private String menjiaxingshi; //门架形式 
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
	private String sudu; //最大运行速度 km/h
	private String podu; //最大行驶坡度  %
	private String zhidongjuli; //制动距离  m
	private String qianyin_zuoweishu; // 观光列车牵引车头座位数 个
	private String liechechexiangshu; // 观光列车车厢数 节
	private String chexiangzuoweishu; //观光列车每节车厢座位数 个

	
	public String getEdingqizhongliang() {
		return edingqizhongliang;
	}

	public void setEdingqizhongliang(String edingqizhongliang) {
		this.edingqizhongliang = edingqizhongliang;
	}

	public String getZuidafuduqizhongliang() {
		return zuidafuduqizhongliang;
	}

	public void setZuidafuduqizhongliang(String zuidafuduqizhongliang) {
		this.zuidafuduqizhongliang = zuidafuduqizhongliang;
	}

	public String getZuidaqizhongliju() {
		return zuidaqizhongliju;
	}

	public void setZuidaqizhongliju(String zuidaqizhongliju) {
		this.zuidaqizhongliju = zuidaqizhongliju;
	}

	public String getKuadu() {
		return kuadu;
	}

	public void setKuadu(String kuadu) {
		this.kuadu = kuadu;
	}

	public String getQishenggaodu() {
		return qishenggaodu;
	}

	public void setQishenggaodu(String qishenggaodu) {
		this.qishenggaodu = qishenggaodu;
	}

	public String getQishenggaodu_shang() {
		return qishenggaodu_shang;
	}

	public void setQishenggaodu_shang(String qishenggaoduShang) {
		qishenggaodu_shang = qishenggaoduShang;
	}

	public String getQishenggaodu_xia() {
		return qishenggaodu_xia;
	}

	public void setQishenggaodu_xia(String qishenggaoduXia) {
		qishenggaodu_xia = qishenggaoduXia;
	}

	public String getQishengsudu() {
		return qishengsudu;
	}

	public void setQishengsudu(String qishengsudu) {
		this.qishengsudu = qishengsudu;
	}

	public String getQishengsudu_edingzaihe() {
		return qishengsudu_edingzaihe;
	}

	public void setQishengsudu_edingzaihe(String qishengsuduEdingzaihe) {
		qishengsudu_edingzaihe = qishengsuduEdingzaihe;
	}

	public String getQishengsudu_kongzai() {
		return qishengsudu_kongzai;
	}

	public void setQishengsudu_kongzai(String qishengsuduKongzai) {
		qishengsudu_kongzai = qishengsuduKongzai;
	}

	public String getDacheyunxingsudu() {
		return dacheyunxingsudu;
	}

	public void setDacheyunxingsudu(String dacheyunxingsudu) {
		this.dacheyunxingsudu = dacheyunxingsudu;
	}

	public String getDacheyunxingsudu_qianjin() {
		return dacheyunxingsudu_qianjin;
	}

	public void setDacheyunxingsudu_qianjin(String dacheyunxingsuduQianjin) {
		dacheyunxingsudu_qianjin = dacheyunxingsuduQianjin;
	}

	public String getDacheyunxingsudu_houtui() {
		return dacheyunxingsudu_houtui;
	}

	public void setDacheyunxingsudu_houtui(String dacheyunxingsuduHoutui) {
		dacheyunxingsudu_houtui = dacheyunxingsuduHoutui;
	}

	public String getXiaocheyunxingsudu() {
		return xiaocheyunxingsudu;
	}

	public void setXiaocheyunxingsudu(String xiaocheyunxingsudu) {
		this.xiaocheyunxingsudu = xiaocheyunxingsudu;
	}

	public String getGongzuofudu_qianshen() {
		return gongzuofudu_qianshen;
	}

	public void setGongzuofudu_qianshen(String gongzuofuduQianshen) {
		gongzuofudu_qianshen = gongzuofuduQianshen;
	}

	public String getGongzuofudu_guju() {
		return gongzuofudu_guju;
	}

	public void setGongzuofudu_guju(String gongzuofuduGuju) {
		gongzuofudu_guju = gongzuofuduGuju;
	}

	public String getGongzuofudu_houshen() {
		return gongzuofudu_houshen;
	}

	public void setGongzuofudu_houshen(String gongzuofuduHoushen) {
		gongzuofudu_houshen = gongzuofuduHoushen;
	}

	public String getHuizhuansudu() {
		return huizhuansudu;
	}

	public void setHuizhuansudu(String huizhuansudu) {
		this.huizhuansudu = huizhuansudu;
	}

	public String getYidongsudu() {
		return yidongsudu;
	}

	public void setYidongsudu(String yidongsudu) {
		this.yidongsudu = yidongsudu;
	}

	public String getFujian() {
		return fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}

	public String getErliejianyanhuanjing() {
		return erliejianyanhuanjing;
	}

	public void setErliejianyanhuanjing(String erliejianyanhuanjing) {
		this.erliejianyanhuanjing = erliejianyanhuanjing;
	}

	public String getSijishi() {
		return sijishi;
	}

	public void setSijishi(String sijishi) {
		this.sijishi = sijishi;
	}

	public Double getHedingfeiyong() {
		return hedingfeiyong;
	}

	public void setHedingfeiyong(Double hedingfeiyong) {
		this.hedingfeiyong = hedingfeiyong;
	}

	public String getChewei() {
		return chewei;
	}

	public void setChewei(String chewei) {
		this.chewei = chewei;
	}

	public String getCuncherongliang() {
		return cuncherongliang;
	}

	public void setCuncherongliang(String cuncherongliang) {
		this.cuncherongliang = cuncherongliang;
	}

	public String getShitingcheliangchangdu() {
		return shitingcheliangchangdu;
	}

	public void setShitingcheliangchangdu(String shitingcheliangchangdu) {
		this.shitingcheliangchangdu = shitingcheliangchangdu;
	}

	public String getShitingcheliangkuandu() {
		return shitingcheliangkuandu;
	}

	public void setShitingcheliangkuandu(String shitingcheliangkuandu) {
		this.shitingcheliangkuandu = shitingcheliangkuandu;
	}

	public String getShitingchelianggaodu() {
		return shitingchelianggaodu;
	}

	public void setShitingchelianggaodu(String shitingchelianggaodu) {
		this.shitingchelianggaodu = shitingchelianggaodu;
	}

	public String getZiyouduanxingcheng() {
		return ziyouduanxingcheng;
	}

	public void setZiyouduanxingcheng(String ziyouduanxingcheng) {
		this.ziyouduanxingcheng = ziyouduanxingcheng;
	}

	public String getZiyouduangaodu() {
		return ziyouduangaodu;
	}

	public void setZiyouduangaodu(String ziyouduangaodu) {
		this.ziyouduangaodu = ziyouduangaodu;
	}

	public String getZhengchezhongliang() {
		return zhengchezhongliang;
	}

	public void setZhengchezhongliang(String zhengchezhongliang) {
		this.zhengchezhongliang = zhengchezhongliang;
	}

	public String getEdingqizhongliju() {
		return edingqizhongliju;
	}

	public void setEdingqizhongliju(String edingqizhongliju) {
		this.edingqizhongliju = edingqizhongliju;
	}

	public String getTishenggaodu() {
		return tishenggaodu;
	}

	public void setTishenggaodu(String tishenggaodu) {
		this.tishenggaodu = tishenggaodu;
	}

	public String getFugan() {
		return fugan;
	}

	public void setFugan(String fugan) {
		this.fugan = fugan;
	}

	public String getTuoguache() {
		return tuoguache;
	}

	public void setTuoguache(String tuoguache) {
		this.tuoguache = tuoguache;
	}

	public String getRanliaozhonglei() {
		return ranliaozhonglei;
	}

	public void setRanliaozhonglei(String ranliaozhonglei) {
		this.ranliaozhonglei = ranliaozhonglei;
	}

	public String getGongzuohuanjing() {
		return gongzuohuanjing;
	}

	public void setGongzuohuanjing(String gongzuohuanjing) {
		this.gongzuohuanjing = gongzuohuanjing;
	}

	public String getGongzuojibie() {
		return gongzuojibie;
	}

	public void setGongzuojibie(String gongzuojibie) {
		this.gongzuojibie = gongzuojibie;
	}

	public String getZuidagongzuofudu() {
		return zuidagongzuofudu;
	}

	public void setZuidagongzuofudu(String zuidagongzuofudu) {
		this.zuidagongzuofudu = zuidagongzuofudu;
	}

	public String getXuanbichangdu() {
		return xuanbichangdu;
	}

	public void setXuanbichangdu(String xuanbichangdu) {
		this.xuanbichangdu = xuanbichangdu;
	}

	public String getZuoxuanbichangdu() {
		return zuoxuanbichangdu;
	}

	public void setZuoxuanbichangdu(String zuoxuanbichangdu) {
		this.zuoxuanbichangdu = zuoxuanbichangdu;
	}

	public String getYouxuanbichangdu() {
		return youxuanbichangdu;
	}

	public void setYouxuanbichangdu(String youxuanbichangdu) {
		this.youxuanbichangdu = youxuanbichangdu;
	}

	public String getGuokongsudu() {
		return guokongsudu;
	}

	public void setGuokongsudu(String guokongsudu) {
		this.guokongsudu = guokongsudu;
	}

	public String getZuidaguokongjuli() {
		return zuidaguokongjuli;
	}

	public void setZuidaguokongjuli(String zuidaguokongjuli) {
		this.zuidaguokongjuli = zuidaguokongjuli;
	}

	public String getQuanshenzhubibichang() {
		return quanshenzhubibichang;
	}

	public void setQuanshenzhubibichang(String quanshenzhubibichang) {
		this.quanshenzhubibichang = quanshenzhubibichang;
	}

	public String getQudongfangshi() {
		return qudongfangshi;
	}

	public void setQudongfangshi(String qudongfangshi) {
		this.qudongfangshi = qudongfangshi;
	}

	public String getYanse() {
		return yanse;
	}

	public void setYanse(String yanse) {
		this.yanse = yanse;
	}

	public String getFadongjibianhao() {
		return fadongjibianhao;
	}

	public void setFadongjibianhao(String fadongjibianhao) {
		this.fadongjibianhao = fadongjibianhao;
	}

	public String getShiyongquyu() {
		return shiyongquyu;
	}

	public void setShiyongquyu(String shiyongquyu) {
		this.shiyongquyu = shiyongquyu;
	}

	public String getShitingcheliangzhongliang() {
		return shitingcheliangzhongliang;
	}

	public void setShitingcheliangzhongliang(String shitingcheliangzhongliang) {
		this.shitingcheliangzhongliang = shitingcheliangzhongliang;
	}

	public String getShitingcheliangchicun() {
		return shitingcheliangchicun;
	}

	public void setShitingcheliangchicun(String shitingcheliangchicun) {
		this.shitingcheliangchicun = shitingcheliangchicun;
	}

	public String getCengshu() {
		return cengshu;
	}

	public void setCengshu(String cengshu) {
		this.cengshu = cengshu;
	}

	public String getShangshengsudu() {
		return shangshengsudu;
	}

	public void setShangshengsudu(String shangshengsudu) {
		this.shangshengsudu = shangshengsudu;
	}

	public String getBianfusudu() {
		return bianfusudu;
	}

	public void setBianfusudu(String bianfusudu) {
		this.bianfusudu = bianfusudu;
	}

	public String getGongzuofudu() {
		return gongzuofudu;
	}

	public void setGongzuofudu(String gongzuofudu) {
		this.gongzuofudu = gongzuofudu;
	}

	public String getXingzousudu() {
		return xingzousudu;
	}

	public void setXingzousudu(String xingzousudu) {
		this.xingzousudu = xingzousudu;
	}

	public String getYouxiaobanjing() {
		return youxiaobanjing;
	}

	public void setYouxiaobanjing(String youxiaobanjing) {
		this.youxiaobanjing = youxiaobanjing;
	}

	public String getZuigaoshisu() {
		return zuigaoshisu;
	}

	public void setZuigaoshisu(String zuigaoshisu) {
		this.zuigaoshisu = zuigaoshisu;
	}

	public String getPaizhaohaoma() {
		return paizhaohaoma;
	}

	public void setPaizhaohaoma(String paizhaohaoma) {
		this.paizhaohaoma = paizhaohaoma;
	}
	
	public String getYunxingsudu() {
		return yunxingsudu;
	}

	public void setYunxingsudu(String yunxingsudu) {
		this.yunxingsudu = yunxingsudu;
	}

	public String getChangneicheliang_edingzaihe() {
		return changneicheliang_edingzaihe;
	}

	public void setChangneicheliang_edingzaihe(String changneicheliangEdingzaihe) {
		changneicheliang_edingzaihe = changneicheliangEdingzaihe;
	}

	public String getDonglifangshi() {
		return donglifangshi;
	}

	public void setDonglifangshi(String donglifangshi) {
		this.donglifangshi = donglifangshi;
	}

	public String getZuidafudu() {
		return zuidafudu;
	}

	public void setZuidafudu(String zuidafudu) {
		this.zuidafudu = zuidafudu;
	}

	public String getCheliangmingcheng() {
		return cheliangmingcheng;
	}

	public void setCheliangmingcheng(String cheliangmingcheng) {
		this.cheliangmingcheng = cheliangmingcheng;
	}

	public String getChangpaixinghao() {
		return changpaixinghao;
	}

	public void setChangpaixinghao(String changpaixinghao) {
		this.changpaixinghao = changpaixinghao;
	}

	public String getQudong() {
		return qudong;
	}

	public void setQudong(String qudong) {
		this.qudong = qudong;
	}

	

	public void setBiaozhunjiage(Double biaozhunjiage) {
		this.biaozhunjiage=biaozhunjiage;
		
	}
	public Double getBiaozhunjiage() {
		return biaozhunjiage;
	}
	
	public String getKongchezhongliang() {
		return kongchezhongliang;
	}

	public void setKongchezhongliang(String kongchezhongliang) {
		this.kongchezhongliang = kongchezhongliang;
	}

	public String getDipanbianhao() {
		return dipanbianhao;
	}

	public void setDipanbianhao(String dipanbianhao) {
		this.dipanbianhao = dipanbianhao;
	}

	public String getZhizaobiaozhun() {
		return zhizaobiaozhun;
	}

	public void setZhizaobiaozhun(String zhizaobiaozhun) {
		this.zhizaobiaozhun = zhizaobiaozhun;
	}

	public String getShiyanjigou() {
		return shiyanjigou;
	}

	public void setShiyanjigou(String shiyanjigou) {
		this.shiyanjigou = shiyanjigou;
	}

	public String getShiyanriqi() {
		return shiyanriqi;
	}

	public void setShiyanriqi(String shiyanriqi) {
		this.shiyanriqi = shiyanriqi;
	}

	public String getShiyanzhengshubianhao() {
		return shiyanzhengshubianhao;
	}

	public void setShiyanzhengshubianhao(String shiyanzhengshubianhao) {
		this.shiyanzhengshubianhao = shiyanzhengshubianhao;
	}

	public String getXiajiangshendu() {
		return xiajiangshendu;
	}

	public void setXiajiangshendu(String xiajiangshendu) {
		this.xiajiangshendu = xiajiangshendu;
	}

	public String getZhugouzuoyouweizhi() {
		return zhugouzuoyouweizhi;
	}

	public void setZhugouzuoyouweizhi(String zhugouzuoyouweizhi) {
		this.zhugouzuoyouweizhi = zhugouzuoyouweizhi;
	}

	public String getZhengjigonglv() {
		return zhengjigonglv;
	}

	public void setZhengjigonglv(String zhengjigonglv) {
		this.zhengjigonglv = zhengjigonglv;
	}

	public String getZuidalunya() {
		return zuidalunya;
	}

	public void setZuidalunya(String zuidalunya) {
		this.zuidalunya = zuidalunya;
	}

	public String getGongdiandianyuan() {
		return gongdiandianyuan;
	}

	public void setGongdiandianyuan(String gongdiandianyuan) {
		this.gongdiandianyuan = gongdiandianyuan;
	}

	public String getGongzuowendu() {
		return gongzuowendu;
	}

	public void setGongzuowendu(String gongzuowendu) {
		this.gongzuowendu = gongzuowendu;
	}

	public String getShiyongchangsuo() {
		return shiyongchangsuo;
	}

	public void setShiyongchangsuo(String shiyongchangsuo) {
		this.shiyongchangsuo = shiyongchangsuo;
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

	public String getShoulijiegoucailiao() {
		return shoulijiegoucailiao;
	}

	public void setShoulijiegoucailiao(String shoulijiegoucailiao) {
		this.shoulijiegoucailiao = shoulijiegoucailiao;
	}

	public String getZuixiaofuduqizhongliang() {
		return zuixiaofuduqizhongliang;
	}

	public void setZuixiaofuduqizhongliang(String zuixiaofuduqizhongliang) {
		this.zuixiaofuduqizhongliang = zuixiaofuduqizhongliang;
	}

	public String getZuidafuzhuogaodu() {
		return zuidafuzhuogaodu;
	}

	public void setZuidafuzhuogaodu(String zuidafuzhuogaodu) {
		this.zuidafuzhuogaodu = zuidafuzhuogaodu;
	}

	public String getDuligaodu() {
		return duligaodu;
	}

	public void setDuligaodu(String duligaodu) {
		this.duligaodu = duligaodu;
	}

	public String getYunxingguiji() {
		return yunxingguiji;
	}

	public void setYunxingguiji(String yunxingguiji) {
		this.yunxingguiji = yunxingguiji;
	}

	public String getBianfufangshi() {
		return bianfufangshi;
	}

	public void setBianfufangshi(String bianfufangshi) {
		this.bianfufangshi = bianfufangshi;
	}

	public String getBiaozhunxingshi() {
		return biaozhunxingshi;
	}

	public void setBiaozhunxingshi(String biaozhunxingshi) {
		this.biaozhunxingshi = biaozhunxingshi;
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

	public String getJixieguiju() {
		return jixieguiju;
	}

	public void setJixieguiju(String jixieguiju) {
		this.jixieguiju = jixieguiju;
	}

	public String getXingshisudu() {
		return xingshisudu;
	}

	public void setXingshisudu(String xingshisudu) {
		this.xingshisudu = xingshisudu;
	}

	public String getZhituichangdu() {
		return zhituichangdu;
	}

	public void setZhituichangdu(String zhituichangdu) {
		this.zhituichangdu = zhituichangdu;
	}

	public String getBijiaxingshi() {
		return bijiaxingshi;
	}

	public void setBijiaxingshi(String bijiaxingshi) {
		this.bijiaxingshi = bijiaxingshi;
	}

	public String getZuidagaodu() {
		return zuidagaodu;
	}

	public void setZuidagaodu(String zuidagaodu) {
		this.zuidagaodu = zuidagaodu;
	}

	public String getYongtu() {
		return yongtu;
	}

	public void setYongtu(String yongtu) {
		this.yongtu = yongtu;
	}

	public String getMenjiajiegouxingshi() {
		return menjiajiegouxingshi;
	}

	public void setMenjiajiegouxingshi(String menjiajiegouxingshi) {
		this.menjiajiegouxingshi = menjiajiegouxingshi;
	}

	public String getHuizhuanzhichengxingshi() {
		return huizhuanzhichengxingshi;
	}

	public void setHuizhuanzhichengxingshi(String huizhuanzhichengxingshi) {
		this.huizhuanzhichengxingshi = huizhuanzhichengxingshi;
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

	public String getCaozongfangshi() {
		return caozongfangshi;
	}

	public void setCaozongfangshi(String caozongfangshi) {
		this.caozongfangshi = caozongfangshi;
	}

	public String getQudongxingshi() {
		return qudongxingshi;
	}

	public void setQudongxingshi(String qudongxingshi) {
		this.qudongxingshi = qudongxingshi;
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

	public String getBiaozhunjiefangshi() {
		return biaozhunjiefangshi;
	}

	public void setBiaozhunjiefangshi(String biaozhunjiefangshi) {
		this.biaozhunjiefangshi = biaozhunjiefangshi;
	}

	public String getDiaojuzuigaogaodu() {
		return diaojuzuigaogaodu;
	}

	public void setDiaojuzuigaogaodu(String diaojuzuigaogaodu) {
		this.diaojuzuigaogaodu = diaojuzuigaogaodu;
	}

	public String getChengzaisuochuidu() {
		return chengzaisuochuidu;
	}

	public void setChengzaisuochuidu(String chengzaisuochuidu) {
		this.chengzaisuochuidu = chengzaisuochuidu;
	}

	public String getDiaojuzuidigaodu() {
		return diaojuzuidigaodu;
	}

	public void setDiaojuzuidigaodu(String diaojuzuidigaodu) {
		this.diaojuzuidigaodu = diaojuzuidigaodu;
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

	public String getZhutijiegouxingshi() {
		return zhutijiegouxingshi;
	}

	public void setZhutijiegouxingshi(String zhutijiegouxingshi) {
		this.zhutijiegouxingshi = zhutijiegouxingshi;
	}

	public String getZhugouzuidaliang() {
		return zhugouzuidaliang;
	}

	public void setZhugouzuidaliang(String zhugouzuidaliang) {
		this.zhugouzuidaliang = zhugouzuidaliang;
	}

	public String getFugouzuidaliang() {
		return fugouzuidaliang;
	}

	public void setFugouzuidaliang(String fugouzuidaliang) {
		this.fugouzuidaliang = fugouzuidaliang;
	}

	public String getZhugouzuidafudu() {
		return zhugouzuidafudu;
	}

	public void setZhugouzuidafudu(String zhugouzuidafudu) {
		this.zhugouzuidafudu = zhugouzuidafudu;
	}

	public String getFugouzuidafudu() {
		return fugouzuidafudu;
	}

	public void setFugouzuidafudu(String fugouzuidafudu) {
		this.fugouzuidafudu = fugouzuidafudu;
	}

	public String getZhugouzuidafuduliang() {
		return zhugouzuidafuduliang;
	}

	public void setZhugouzuidafuduliang(String zhugouzuidafuduliang) {
		this.zhugouzuidafuduliang = zhugouzuidafuduliang;
	}

	public String getFugouzuidafuduliang() {
		return fugouzuidafuduliang;
	}

	public void setFugouzuidafuduliang(String fugouzuidafuduliang) {
		this.fugouzuidafuduliang = fugouzuidafuduliang;
	}

	public String getZhugouzuidagaodu() {
		return zhugouzuidagaodu;
	}

	public void setZhugouzuidagaodu(String zhugouzuidagaodu) {
		this.zhugouzuidagaodu = zhugouzuidagaodu;
	}

	public String getFugouzuidagaodu() {
		return fugouzuidagaodu;
	}

	public void setFugouzuidagaodu(String fugouzuidagaodu) {
		this.fugouzuidagaodu = fugouzuidagaodu;
	}

	public String getZhugouqishengsudu() {
		return zhugouqishengsudu;
	}

	public void setZhugouqishengsudu(String zhugouqishengsudu) {
		this.zhugouqishengsudu = zhugouqishengsudu;
	}

	public String getFugouqishengsudu() {
		return fugouqishengsudu;
	}

	public void setFugouqishengsudu(String fugouqishengsudu) {
		this.fugouqishengsudu = fugouqishengsudu;
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

	public String getZhutiaosufengshi() {
		return zhutiaosufengshi;
	}

	public void setZhutiaosufengshi(String zhutiaosufengshi) {
		this.zhutiaosufengshi = zhutiaosufengshi;
	}

	public String getDanchezuidajinchushijian() {
		return danchezuidajinchushijian;
	}

	public void setDanchezuidajinchushijian(String danchezuidajinchushijian) {
		this.danchezuidajinchushijian = danchezuidajinchushijian;
	}

	public String getCenggao() {
		return cenggao;
	}

	public void setCenggao(String cenggao) {
		this.cenggao = cenggao;
	}

	public String getEdingshengjiangsudu() {
		return edingshengjiangsudu;
	}

	public void setEdingshengjiangsudu(String edingshengjiangsudu) {
		this.edingshengjiangsudu = edingshengjiangsudu;
	}

	public String getEdinghengyisudu() {
		return edinghengyisudu;
	}

	public void setEdinghengyisudu(String edinghengyisudu) {
		this.edinghengyisudu = edinghengyisudu;
	}

	public String getQishengfangshi() {
		return qishengfangshi;
	}

	public void setQishengfangshi(String qishengfangshi) {
		this.qishengfangshi = qishengfangshi;
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

	public String getMenjiaxingshi() {
		return menjiaxingshi;
	}

	public void setMenjiaxingshi(String menjiaxingshi) {
		this.menjiaxingshi = menjiaxingshi;
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

	public String getSudu() {
		return sudu;
	}

	public void setSudu(String sudu) {
		this.sudu = sudu;
	}

	public TCraneParam clone(){
		Object object = null;
		try {
			object = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (TCraneParam)object;
	}

	
	
}