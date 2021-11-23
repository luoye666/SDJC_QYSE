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
public class TElevatorParam extends TBaseInfo implements java.io.Serializable,Cloneable{
	
	public TElevatorParam(){}
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
	
	
	/**
	 * 是否检验限速器
	 */
	private String jiaoyanxiansuqi;
	
	/**
	 * 是否公共交通型
	 */
	private String gonggongjiaotongxing;
	
	/**
	 * 是否复检
	 */
	private String fujian;
	
	/**
	 * 检验环境
	 */
	private String  erliejianyanhuanjing;

	/**
	 * 标准价格
	 */
	private Double  biaozhunjiage;
	
	/**
	 * 核定费用
	 */
	private Double  hedingfeiyong;
	
	private String dianticengzhan; //电梯层站
	
	private String yunxingsudu; //运行速度
	
	private String zouxingjuli; //走行距离
	
	
	/**
	 * 20170805 新增字段
	 */
	private String jiaoxiangchicui; //轿厢尺寸 mm
	private String fangbaoxingshi; //防爆型式(适用于防爆电梯)
	private String fangbaodengji; //防爆等级(适用于防爆电梯)
	private String edinggonglv; //额定功率 kW
	private String edingzhuansu; //额定转速 r/min
	private String jiansubi;  //减速比(适用于有齿减速)
	private String gongzuoyali; //满载工作压力MPa (适用于液压驱动电梯)
	private String jiezhizhonglei; //悬挂介质种类
	private String jiezhishuliang; //悬挂介质数量
	private String jiezhixinghao;  //悬挂介质型号
	private String jiezhiguige; //悬挂介质规格
	//（适用于自动扶梯与自动人行道）
	private String gongzuohuanjing; //工作环境
	private String gongzuoleixing; //工作类型
	//驱动主机
	private String qudong_xinghao;  //型号
	private String qudong_chanpinbianhao;//产品编号
	private String qudong_edingzhuansu;//额定转速 r/min
	private String qucong_edinggonglv;//额定功率 kW
	private String qudong_zhizaodanwei;//制造单位
	//控制柜
	private String kongzhi_xinghao;//型号
	private String kongzhi_yunxingfangshi;//节能运行方式
	private String kongzhi_chanpinbianhao;//产品编号
	private String kongzhi_zhizaodanwei;//制造单位

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

	public void setBiaozhunjiage(Double biaozhunjiage) {
		this.biaozhunjiage=biaozhunjiage;
		
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

	public void setEdingsudu_shangxing(Double edingsudu_shangxing) {
		this.edingsudu_shangxing = edingsudu_shangxing;
	}

	public Double getEdingsudu_xiaxing() {
		return edingsudu_xiaxing;
	}

	public void setEdingsudu_xiaxing(Double edingsudu_xiaxing) {
		this.edingsudu_xiaxing = edingsudu_xiaxing;
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

	public String getJiaoyanxiansuqi() {
		return jiaoyanxiansuqi;
	}

	public void setJiaoyanxiansuqi(String jiaoyanxiansuqi) {
		this.jiaoyanxiansuqi = jiaoyanxiansuqi;
	}

	public String getGonggongjiaotongxing() {
		return gonggongjiaotongxing;
	}

	public void setGonggongjiaotongxing(String gonggongjiaotongxing) {
		this.gonggongjiaotongxing = gonggongjiaotongxing;
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

	public Double getHedingfeiyong() {
		return hedingfeiyong;
	}

	public void setHedingfeiyong(Double hedingfeiyong) {
		this.hedingfeiyong = hedingfeiyong;
	}
	public Double getBiaozhunjiage() {
		return biaozhunjiage;
	}
	
	public String getDianticengzhan() {
		return dianticengzhan;
	}

	public void setDianticengzhan(String dianticengzhan) {
		this.dianticengzhan = dianticengzhan;
	}

	public String getYunxingsudu() {
		return yunxingsudu;
	}

	public void setYunxingsudu(String yunxingsudu) {
		this.yunxingsudu = yunxingsudu;
	}

	public String getZouxingjuli() {
		return zouxingjuli;
	}

	public void setZouxingjuli(String zouxingjuli) {
		this.zouxingjuli = zouxingjuli;
	}

	public String getJiaoxiangchicui() {
		return jiaoxiangchicui;
	}

	public void setJiaoxiangchicui(String jiaoxiangchicui) {
		this.jiaoxiangchicui = jiaoxiangchicui;
	}

	public String getFangbaoxingshi() {
		return fangbaoxingshi;
	}

	public void setFangbaoxingshi(String fangbaoxingshi) {
		this.fangbaoxingshi = fangbaoxingshi;
	}

	public String getFangbaodengji() {
		return fangbaodengji;
	}

	public void setFangbaodengji(String fangbaodengji) {
		this.fangbaodengji = fangbaodengji;
	}

	public String getEdinggonglv() {
		return edinggonglv;
	}

	public void setEdinggonglv(String edinggonglv) {
		this.edinggonglv = edinggonglv;
	}

	public String getEdingzhuansu() {
		return edingzhuansu;
	}

	public void setEdingzhuansu(String edingzhuansu) {
		this.edingzhuansu = edingzhuansu;
	}

	public String getJiansubi() {
		return jiansubi;
	}

	public void setJiansubi(String jiansubi) {
		this.jiansubi = jiansubi;
	}

	public String getGongzuoyali() {
		return gongzuoyali;
	}

	public void setGongzuoyali(String gongzuoyali) {
		this.gongzuoyali = gongzuoyali;
	}

	public String getJiezhizhonglei() {
		return jiezhizhonglei;
	}

	public void setJiezhizhonglei(String jiezhizhonglei) {
		this.jiezhizhonglei = jiezhizhonglei;
	}

	public String getJiezhishuliang() {
		return jiezhishuliang;
	}

	public void setJiezhishuliang(String jiezhishuliang) {
		this.jiezhishuliang = jiezhishuliang;
	}

	public String getJiezhixinghao() {
		return jiezhixinghao;
	}

	public void setJiezhixinghao(String jiezhixinghao) {
		this.jiezhixinghao = jiezhixinghao;
	}

	public String getJiezhiguige() {
		return jiezhiguige;
	}

	public void setJiezhiguige(String jiezhiguige) {
		this.jiezhiguige = jiezhiguige;
	}

	public String getGongzuohuanjing() {
		return gongzuohuanjing;
	}

	public void setGongzuohuanjing(String gongzuohuanjing) {
		this.gongzuohuanjing = gongzuohuanjing;
	}

	public String getGongzuoleixing() {
		return gongzuoleixing;
	}

	public void setGongzuoleixing(String gongzuoleixing) {
		this.gongzuoleixing = gongzuoleixing;
	}
	
	
	public String getQudong_xinghao() {
		return qudong_xinghao;
	}

	public void setQudong_xinghao(String qudongXinghao) {
		qudong_xinghao = qudongXinghao;
	}

	public String getQudong_chanpinbianhao() {
		return qudong_chanpinbianhao;
	}

	public void setQudong_chanpinbianhao(String qudongChanpinbianhao) {
		qudong_chanpinbianhao = qudongChanpinbianhao;
	}

	public String getQudong_edingzhuansu() {
		return qudong_edingzhuansu;
	}

	public void setQudong_edingzhuansu(String qudongEdingzhuansu) {
		qudong_edingzhuansu = qudongEdingzhuansu;
	}

	public String getQucong_edinggonglv() {
		return qucong_edinggonglv;
	}

	public void setQucong_edinggonglv(String qucongEdinggonglv) {
		qucong_edinggonglv = qucongEdinggonglv;
	}

	public String getQudong_zhizaodanwei() {
		return qudong_zhizaodanwei;
	}

	public void setQudong_zhizaodanwei(String qudongZhizaodanwei) {
		qudong_zhizaodanwei = qudongZhizaodanwei;
	}

	public String getKongzhi_xinghao() {
		return kongzhi_xinghao;
	}

	public void setKongzhi_xinghao(String kongzhiXinghao) {
		kongzhi_xinghao = kongzhiXinghao;
	}

	public String getKongzhi_yunxingfangshi() {
		return kongzhi_yunxingfangshi;
	}

	public void setKongzhi_yunxingfangshi(String kongzhiYunxingfangshi) {
		kongzhi_yunxingfangshi = kongzhiYunxingfangshi;
	}

	public String getKongzhi_chanpinbianhao() {
		return kongzhi_chanpinbianhao;
	}

	public void setKongzhi_chanpinbianhao(String kongzhiChanpinbianhao) {
		kongzhi_chanpinbianhao = kongzhiChanpinbianhao;
	}

	public String getKongzhi_zhizaodanwei() {
		return kongzhi_zhizaodanwei;
	}

	public void setKongzhi_zhizaodanwei(String kongzhiZhizaodanwei) {
		kongzhi_zhizaodanwei = kongzhiZhizaodanwei;
	}

	public TElevatorParam clone(){
		Object object = null;
		try {
			object = super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return (TElevatorParam)object;
	}
	
}