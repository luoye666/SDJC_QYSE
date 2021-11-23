package com.stone.biz.jcsj.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 锅炉
 * @author chao
 * @time 2013年12月10日15:04:02
 */

@Entity
@Table(name = "BIZ_BOILERPARAM")
@PrimaryKeyJoinColumn(name="BoilerID")
@XmlRootElement(name = "TBoilerParam")
public class TBoilerParam extends TBaseInfo implements Serializable, Cloneable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4602058261451287397L;
	
	
	private String edingchuli;//	VARCHAR2(50)	额定出力
	private String edingyali;//	NUMBER(4,2)	额定压力
	private String edingwendu;//	NUMBER(3)	额定温度
	private String shiyongwendu;//	NUMBER(3)	使用温度
	private String edinggonglv;//	VARCHAR2(20)	额定功率
	private String gonglvdanwei;//	VARCHAR2(10)	功率单位
	private String chukouwendu;//	NUMBER(4,1)	出口温度
	private String shejiyali;//	NUMBER(4,2)	设计压力
	private String gongzuoyali;//	NUMBER(4,2)	工作压力
	private String gongzuowendu;//	NUMBER(4,1)	工作温度
	private String ranliaozhonglei;//	VARCHAR2(50)	燃料种类
	private String yongtu;//	VARCHAR2(20)	用途
	private String guoluxinghao;//锅炉型号
	/**
	 * 水压试验日期
	 */
	private Date shuiyashiyanriqi;
	/**
	 * 水压试验压力
	 */
	private String shuiyashiyanyali;
	/**
	 * 处理意见
	 */
	private String chuliyijian;
	/**
	 * 出厂日期
	 */
	private Date chuchangriqi;
	/**
	 * 额定出口温度
	 */
	private String edingchukouwendu;
	/**
	 * 额定出口压力
	 */
	private String edingchukouyali;
	/**
	 * 使用压力
	 */
	private String shiyongyali;
	/**
	 * 水处理型式
	 */
	private String shuichulixingshi;
	/**
	 * 允许工作压力
	 */
	private String yunxugongzuoyali;
	/**
	 * 允许工作温度
	 */
	private String yunxugongzuowendu;
	/**
	 * 额定蒸发量
	 */
	private String edingzhengfaliang;
	/**
	 * 额定出力单位
	 */
	private String edingchulidanwei;
	/**
	 * 燃烧方式
	 */
	private String ranshaofangshi;
	/**
	 * 锅筒工作压力
	 */
	private String guotonggongzuoyali;
	/**
	 * 再热蒸汽流量
	 */
	private String zairezhengqiliuliang;
	/**
	 * 过热蒸汽出口温度
	 */
	private String guorezhengqichukouwendu;
	/**
	 * 过热蒸汽出口压力
	 */
	private String guorezhengqichukouyali;
	/**
	 * 再热蒸汽进口温度
	 */
	private String zairezhengqijinkouwendu;
	/**
	 * 再热蒸汽进口压力
	 */
	private String zairezhengqijinkouyali;
	/**
	 * 再热蒸汽出口温度
	 */
	private String zairezhengqichukouwendu;
	/**
	 * 再热蒸汽出口压力
	 */
	private String zairezhengqichukouyali;
	/**
	 * 出水温度
	 */
	private String chushuiwendu;
	/**
	 * 回水温度
	 */
	private String huishuiwendu;
	/**
	 * 给水温度
	 */
	private String geishuiwendu;
	/**
	 * 取样冷却器
	 */
	private String quyanglengqueqi;
	/**
	 * 过热器
	 */
	private String guoreqi;
	/**
	 * 外部报检日期
	 */
	private Date wb_baojianriqi;
	/**
	 * 外部检验日期
	 */
	private Date wb_jianyanriqi;
	/**
	 * 外部下次检验日期
	 */
	private Date wb_xiacijianyanriqi;
	/**
	 * 外部检验结论
	 */
	private String wb_jianyanjielun;
	/**
	 * 外部检验机构
	 */
	private String wb_jianyanjigou;
//	//职工人数
//	private String zhigongrenshu;
//	//年产值
//	private String nianchanzhi;
//	//制造监检日期
//	private Date zhizaojianjianriqi;
//	//安装日期
//	private Date anzhuangriqi;
//	//安装监检日期
//	private Date anzhuangjianjianriqi;
//	//安装监检机构
//	private String anzhuangjianjianjigou;

	private String yalidengji;
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
	
	private String jiezhi; //介质
	private String yunxingrexiaolv; //运行热效率
	
	
	/**
	 * 2017-08-12 锅炉添加字段
	 */
	private String shebeijibie; //设备级别
	private String wenjianjiandingriqi; //设计文件鉴定日期
	private String jiandingbaogaobianhao; //鉴定报告书编号
	private String jiandingjigou; //鉴定机构名称
	//主要参数
	private String bentijiezhi; //整装锅炉本体液压试验介质 MPa
	private String bentiyali; //整装锅炉本体液压试验压力 MPa
	private String jinkouwendu; //再热器进（出）口温度 ℃
	private String chukouyali;  //再热器进（出）口压力  MPa
	private String zhengqiliuliang; //再热蒸汽流量  t/h
	private String qimijiezhi; //有机热载体锅炉气密试验介质 MPa
	private String qimiyali; //有机热载体锅炉气密试验压力 MPa
	private String edingchushui; //额定出水（油） ℃
	private String shejireciaolv; //设计热效率 %
	
//	private String edingzhengfaliang; //额定蒸发量（热功率）t/h MW
	private String edingqizhongliang_dw;  //额定蒸发量（热功率）t/h MW
//	private String gongzuoyali; //额定工作压力 MPa
//	private String gongzuowendu; //额定工作温度 ℃
//	private String ranshaofangshi; //燃烧方式
//	private String geishuiwendu; //给水温度 ℃
	private String rongji; //锅炉本体水（油）容积  L

//	private String huishuiwendu; //回水（油）温度  ℃
//	private String ranliaozhonglei; //燃料（或者热源）种类
	
	public String getEdingchuli() {
		return edingchuli;
	}
	public void setEdingchuli(String edingchuli) {
		this.edingchuli = edingchuli;
	}

	public String getEdingyali() {
		return edingyali;
	}
	public void setEdingyali(String edingyali) {
		this.edingyali = edingyali;
	}
	public String getEdinggonglv() {
		return edinggonglv;
	}
	public void setEdinggonglv(String edinggonglv) {
		this.edinggonglv = edinggonglv;
	}
	public String getGonglvdanwei() {
		return gonglvdanwei;
	}
	public void setGonglvdanwei(String gonglvdanwei) {
		this.gonglvdanwei = gonglvdanwei;
	}

	public String getChukouwendu() {
		return chukouwendu;
	}
	public void setChukouwendu(String chukouwendu) {
		this.chukouwendu = chukouwendu;
	}
	public String getRanliaozhonglei() {
		return ranliaozhonglei;
	}
	public void setRanliaozhonglei(String ranliaozhonglei) {
		this.ranliaozhonglei = ranliaozhonglei;
	}
	public String getYongtu() {
		return yongtu;
	}
	public void setYongtu(String yongtu) {
		this.yongtu = yongtu;
	}
	public Date getShuiyashiyanriqi() {
		return shuiyashiyanriqi;
	}
	public void setShuiyashiyanriqi(Date shuiyashiyanriqi) {
		this.shuiyashiyanriqi = shuiyashiyanriqi;
	}
	public String getShuiyashiyanyali() {
		return shuiyashiyanyali;
	}
	public void setShuiyashiyanyali(String shuiyashiyanyali) {
		this.shuiyashiyanyali = shuiyashiyanyali;
	}
	public String getChuliyijian() {
		return chuliyijian;
	}
	public void setChuliyijian(String chuliyijian) {
		this.chuliyijian = chuliyijian;
	}
	public Date getChuchangriqi() {
		return chuchangriqi;
	}
	public void setChuchangriqi(Date chuchangriqi) {
		this.chuchangriqi = chuchangriqi;
	}
	public String getEdingchukouwendu() {
		return edingchukouwendu;
	}
	public void setEdingchukouwendu(String edingchukouwendu) {
		this.edingchukouwendu = edingchukouwendu;
	}
	public String getEdingchukouyali() {
		return edingchukouyali;
	}
	public void setEdingchukouyali(String edingchukouyali) {
		this.edingchukouyali = edingchukouyali;
	}
	public String getShiyongyali() {
		return shiyongyali;
	}
	public void setShiyongyali(String shiyongyali) {
		this.shiyongyali = shiyongyali;
	}
	public String getShuichulixingshi() {
		return shuichulixingshi;
	}
	public void setShuichulixingshi(String shuichulixingshi) {
		this.shuichulixingshi = shuichulixingshi;
	}
	public String getYunxugongzuoyali() {
		return yunxugongzuoyali;
	}
	public void setYunxugongzuoyali(String yunxugongzuoyali) {
		this.yunxugongzuoyali = yunxugongzuoyali;
	}
	public String getYunxugongzuowendu() {
		return yunxugongzuowendu;
	}
	public void setYunxugongzuowendu(String yunxugongzuowendu) {
		this.yunxugongzuowendu = yunxugongzuowendu;
	}
	public String getEdingzhengfaliang() {
		return edingzhengfaliang;
	}
	public void setEdingzhengfaliang(String edingzhengfaliang) {
		this.edingzhengfaliang = edingzhengfaliang;
	}
	public String getEdingchulidanwei() {
		return edingchulidanwei;
	}
	public void setEdingchulidanwei(String edingchulidanwei) {
		this.edingchulidanwei = edingchulidanwei;
	}
	public String getRanshaofangshi() {
		return ranshaofangshi;
	}
	public void setRanshaofangshi(String ranshaofangshi) {
		this.ranshaofangshi = ranshaofangshi;
	}
	public String getGuotonggongzuoyali() {
		return guotonggongzuoyali;
	}
	public void setGuotonggongzuoyali(String guotonggongzuoyali) {
		this.guotonggongzuoyali = guotonggongzuoyali;
	}
	public String getZairezhengqiliuliang() {
		return zairezhengqiliuliang;
	}
	public void setZairezhengqiliuliang(String zairezhengqiliuliang) {
		this.zairezhengqiliuliang = zairezhengqiliuliang;
	}
	public String getGuorezhengqichukouwendu() {
		return guorezhengqichukouwendu;
	}
	public void setGuorezhengqichukouwendu(String guorezhengqichukouwendu) {
		this.guorezhengqichukouwendu = guorezhengqichukouwendu;
	}
	public String getGuorezhengqichukouyali() {
		return guorezhengqichukouyali;
	}
	public void setGuorezhengqichukouyali(String guorezhengqichukouyali) {
		this.guorezhengqichukouyali = guorezhengqichukouyali;
	}
	public String getZairezhengqijinkouwendu() {
		return zairezhengqijinkouwendu;
	}
	public void setZairezhengqijinkouwendu(String zairezhengqijinkouwendu) {
		this.zairezhengqijinkouwendu = zairezhengqijinkouwendu;
	}
	public String getZairezhengqijinkouyali() {
		return zairezhengqijinkouyali;
	}
	public void setZairezhengqijinkouyali(String zairezhengqijinkouyali) {
		this.zairezhengqijinkouyali = zairezhengqijinkouyali;
	}
	public String getZairezhengqichukouwendu() {
		return zairezhengqichukouwendu;
	}
	public void setZairezhengqichukouwendu(String zairezhengqichukouwendu) {
		this.zairezhengqichukouwendu = zairezhengqichukouwendu;
	}
	public String getZairezhengqichukouyali() {
		return zairezhengqichukouyali;
	}
	public void setZairezhengqichukouyali(String zairezhengqichukouyali) {
		this.zairezhengqichukouyali = zairezhengqichukouyali;
	}
	public String getChushuiwendu() {
		return chushuiwendu;
	}
	public void setChushuiwendu(String chushuiwendu) {
		this.chushuiwendu = chushuiwendu;
	}
	public String getHuishuiwendu() {
		return huishuiwendu;
	}
	public void setHuishuiwendu(String huishuiwendu) {
		this.huishuiwendu = huishuiwendu;
	}
	public String getGeishuiwendu() {
		return geishuiwendu;
	}
	public void setGeishuiwendu(String geishuiwendu) {
		this.geishuiwendu = geishuiwendu;
	}
	public String getQuyanglengqueqi() {
		return quyanglengqueqi;
	}
	public void setQuyanglengqueqi(String quyanglengqueqi) {
		this.quyanglengqueqi = quyanglengqueqi;
	}
	public String getGuoreqi() {
		return guoreqi;
	}
	public void setGuoreqi(String guoreqi) {
		this.guoreqi = guoreqi;
	}
	public String getGuoluxinghao() {
		return guoluxinghao;
	}
	public void setGuoluxinghao(String guoluxinghao) {
		this.guoluxinghao = guoluxinghao;
	}

	public Date getWb_baojianriqi() {
		return wb_baojianriqi;
	}
	public void setWb_baojianriqi(Date wbBaojianriqi) {
		wb_baojianriqi = wbBaojianriqi;
	}
	public Date getWb_jianyanriqi() {
		return wb_jianyanriqi;
	}
	public void setWb_jianyanriqi(Date wbJianyanriqi) {
		wb_jianyanriqi = wbJianyanriqi;
	}
	public Date getWb_xiacijianyanriqi() {
		return wb_xiacijianyanriqi;
	}
	public void setWb_xiacijianyanriqi(Date wbXiacijianyanriqi) {
		wb_xiacijianyanriqi = wbXiacijianyanriqi;
	}
	public String getWb_jianyanjielun() {
		return wb_jianyanjielun;
	}
	public void setWb_jianyanjielun(String wbJianyanjielun) {
		wb_jianyanjielun = wbJianyanjielun;
	}
	public String getWb_jianyanjigou() {
		return wb_jianyanjigou;
	}
	public void setWb_jianyanjigou(String wbJianyanjigou) {
		wb_jianyanjigou = wbJianyanjigou;
	}
//	public String getZhigongrenshu() {
//		return zhigongrenshu;
//	}
//	public void setZhigongrenshu(String zhigongrenshu) {
//		this.zhigongrenshu = zhigongrenshu;
//	}
//	public String getNianchanzhi() {
//		return nianchanzhi;
//	}
//	public void setNianchanzhi(String nianchanzhi) {
//		this.nianchanzhi = nianchanzhi;
//	}
//	public Date getZhizaojianjianriqi() {
//		return zhizaojianjianriqi;
//	}
//	public void setZhizaojianjianriqi(Date zhizaojianjianriqi) {
//		this.zhizaojianjianriqi = zhizaojianjianriqi;
//	}
//	public Date getAnzhuangriqi() {
//		return anzhuangriqi;
//	}
//	public void setAnzhuangriqi(Date anzhuangriqi) {
//		this.anzhuangriqi = anzhuangriqi;
//	}
//	public Date getAnzhuangjianjianriqi() {
//		return anzhuangjianjianriqi;
//	}
//	public void setAnzhuangjianjianriqi(Date anzhuangjianjianriqi) {
//		this.anzhuangjianjianriqi = anzhuangjianjianriqi;
//	}
//	public String getAnzhuangjianjianjigou() {
//		return anzhuangjianjianjigou;
//	}
//	public void setAnzhuangjianjianjigou(String anzhuangjianjianjigou) {
//		this.anzhuangjianjianjigou = anzhuangjianjianjigou;
//	}
	public String getYalidengji() {
		return yalidengji;
	}
	public void setYalidengji(String yalidengji) {
		this.yalidengji = yalidengji;
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
	public String getEdingwendu() {
		return edingwendu;
	}
	public void setEdingwendu(String edingwendu) {
		this.edingwendu = edingwendu;
	}
	public String getShiyongwendu() {
		return shiyongwendu;
	}
	public void setShiyongwendu(String shiyongwendu) {
		this.shiyongwendu = shiyongwendu;
	}
	public String getShejiyali() {
		return shejiyali;
	}
	public void setShejiyali(String shejiyali) {
		this.shejiyali = shejiyali;
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
	public String getYunxingrexiaolv() {
		return yunxingrexiaolv;
	}
	public void setYunxingrexiaolv(String yunxingrexiaolv) {
		this.yunxingrexiaolv = yunxingrexiaolv;
	}
	
	
	public TBoilerParam clone(){
		Object object = null;
		try {
			object = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (TBoilerParam)object;
	}
	public String getWenjianjiandingriqi() {
		return wenjianjiandingriqi;
	}
	public String getJiandingbaogaobianhao() {
		return jiandingbaogaobianhao;
	}
	public String getJiandingjigou() {
		return jiandingjigou;
	}
	public String getBentijiezhi() {
		return bentijiezhi;
	}
	public String getBentiyali() {
		return bentiyali;
	}
	public String getJinkouwendu() {
		return jinkouwendu;
	}
	public String getChukouyali() {
		return chukouyali;
	}
	public String getZhengqiliuliang() {
		return zhengqiliuliang;
	}
	public String getQimijiezhi() {
		return qimijiezhi;
	}
	public String getQimiyali() {
		return qimiyali;
	}
	public String getEdingchushui() {
		return edingchushui;
	}
	public String getShejireciaolv() {
		return shejireciaolv;
	}
	public String getEdingqizhongliang_dw() {
		return edingqizhongliang_dw;
	}
	public String getRongji() {
		return rongji;
	}
	public void setWenjianjiandingriqi(String wenjianjiandingriqi) {
		this.wenjianjiandingriqi = wenjianjiandingriqi;
	}
	public void setJiandingbaogaobianhao(String jiandingbaogaobianhao) {
		this.jiandingbaogaobianhao = jiandingbaogaobianhao;
	}
	public void setJiandingjigou(String jiandingjigou) {
		this.jiandingjigou = jiandingjigou;
	}
	public void setBentijiezhi(String bentijiezhi) {
		this.bentijiezhi = bentijiezhi;
	}
	public void setBentiyali(String bentiyali) {
		this.bentiyali = bentiyali;
	}
	public void setJinkouwendu(String jinkouwendu) {
		this.jinkouwendu = jinkouwendu;
	}
	public void setChukouyali(String chukouyali) {
		this.chukouyali = chukouyali;
	}
	public void setZhengqiliuliang(String zhengqiliuliang) {
		this.zhengqiliuliang = zhengqiliuliang;
	}
	public void setQimijiezhi(String qimijiezhi) {
		this.qimijiezhi = qimijiezhi;
	}
	public void setQimiyali(String qimiyali) {
		this.qimiyali = qimiyali;
	}
	public void setEdingchushui(String edingchushui) {
		this.edingchushui = edingchushui;
	}
	public void setShejireciaolv(String shejireciaolv) {
		this.shejireciaolv = shejireciaolv;
	}
	public void setEdingqizhongliang_dw(String edingqizhongliangDw) {
		edingqizhongliang_dw = edingqizhongliangDw;
	}
	public void setRongji(String rongji) {
		this.rongji = rongji;
	}
	public String getShebeijibie() {
		return shebeijibie;
	}
	public void setShebeijibie(String shebeijibie) {
		this.shebeijibie = shebeijibie;
	}
	
}
