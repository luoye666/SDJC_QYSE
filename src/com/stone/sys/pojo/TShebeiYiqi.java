package com.stone.sys.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 设备仪器
 * @author THINKPAD
 *
 */

@Entity
@Table(name = "SYS_SHEBEI_YIQI")
public class TShebeiYiqi implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3988729407306448542L;

	@Id
	@Column(name="ANNALID")
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_SHEBEI_YIQI")
    @SequenceGenerator(name="SEQ_SYS_SHEBEI_YIQI",allocationSize=1, sequenceName="SEQ_SYS_SHEBEI_YIQI")
	private Long id;
	
	private Long userId;//用户主键  用来记录是用户个人添加的，方便使用
	
	private String yiqimingcheng; //仪器名称
	private String xinghao; //型号
	private String neibubianhao;//内部编号
	private String shebeizhonglei;//设备种类
	
	private String state;// 状态（正常 0 /借用 1 /检修 2/损坏 3/报废4/停用5）正常、维修、报废/停用
	
	private String yiqileibie;//varchar2(20)	y	仪器类别 (检测工具/仪器设备/标准物质)
	
	//////////////厂家信息
	private String zhizaochangjia;//varchar2(150)	y		制造厂家
	private String chuchangriqi;//	出厂日期
	private String chuchangbianhao;//varchar2(20)	y		出厂编号
	private String gouzhiriqi;//	timestamp(6)	y		购置日期
	private Double shebeijiage;//	number(5,2)	y	设备价格(单位：元)

	
	/////////////设备参数
	private String jingdu;//设备精度
	private String daxingshebei;//是否大型设备   1/0
	private String baoyangfangshi;//保养方式（擦拭/润滑/充电/其他）
	private String rukuriqi;//入库日期
	
	
	/////////////保养信息
	private Date jiaoyanriqi;//校验日期
	private Date jiandingriqi;//timestamp(6) 检定日期
	private Date xiacijiandingriqi;//timestamp(6) 下次检定日期
	private String jiandingbumen;//检定部门
//	private Date diandingriqi;//timestamp(6)	y	
	private String shifoujiaoyan;//"是否需要  校验/检定
	private String suyuanfangshi;//varchar2(20)	 溯源方式
	
	
	/////////////借用/归还信息
	private String jieyongren;//借用人
	private Date jieyongriqi;//借用日期
	private Date jieyongshijian;//借用时间（时长）
	private String jiechuzhuangtai;//借出状态   （正常/不正常）
	private String guihuanren;//归还人
	private Date guihuanriqi;//归还日期
	private String guihuanzhuangtai;//归还状态   （正常/不正常）
	
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getYiqimingcheng() {
		return yiqimingcheng;
	}

	public void setYiqimingcheng(String yiqimingcheng) {
		this.yiqimingcheng = yiqimingcheng;
	}

	public String getXinghao() {
		return xinghao;
	}

	public void setXinghao(String xinghao) {
		this.xinghao = xinghao;
	}

	public String getNeibubianhao() {
		return neibubianhao;
	}

	public void setNeibubianhao(String neibubianhao) {
		this.neibubianhao = neibubianhao;
	}

	public String getShebeizhonglei() {
		return shebeizhonglei;
	}

	public void setShebeizhonglei(String shebeizhonglei) {
		this.shebeizhonglei = shebeizhonglei;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getYiqileibie() {
		return yiqileibie;
	}

	public void setYiqileibie(String yiqileibie) {
		this.yiqileibie = yiqileibie;
	}

	public String getZhizaochangjia() {
		return zhizaochangjia;
	}

	public void setZhizaochangjia(String zhizaochangjia) {
		this.zhizaochangjia = zhizaochangjia;
	}

	public String getChuchangriqi() {
		return chuchangriqi;
	}

	public void setChuchangriqi(String chuchangriqi) {
		this.chuchangriqi = chuchangriqi;
	}

	public String getChuchangbianhao() {
		return chuchangbianhao;
	}

	public void setChuchangbianhao(String chuchangbianhao) {
		this.chuchangbianhao = chuchangbianhao;
	}

	public String getGouzhiriqi() {
		return gouzhiriqi;
	}

	public void setGouzhiriqi(String gouzhiriqi) {
		this.gouzhiriqi = gouzhiriqi;
	}

	public Double getShebeijiage() {
		return shebeijiage;
	}

	public void setShebeijiage(Double shebeijiage) {
		this.shebeijiage = shebeijiage;
	}

	public String getJingdu() {
		return jingdu;
	}

	public void setJingdu(String jingdu) {
		this.jingdu = jingdu;
	}

	public String getDaxingshebei() {
		return daxingshebei;
	}

	public void setDaxingshebei(String daxingshebei) {
		this.daxingshebei = daxingshebei;
	}

	public String getBaoyangfangshi() {
		return baoyangfangshi;
	}

	public void setBaoyangfangshi(String baoyangfangshi) {
		this.baoyangfangshi = baoyangfangshi;
	}

	public String getRukuriqi() {
		return rukuriqi;
	}

	public void setRukuriqi(String rukuriqi) {
		this.rukuriqi = rukuriqi;
	}

	public Date getJiaoyanriqi() {
		return jiaoyanriqi;
	}

	public void setJiaoyanriqi(Date jiaoyanriqi) {
		this.jiaoyanriqi = jiaoyanriqi;
	}

	public Date getJiandingriqi() {
		return jiandingriqi;
	}

	public void setJiandingriqi(Date jiandingriqi) {
		this.jiandingriqi = jiandingriqi;
	}

	public Date getXiacijiandingriqi() {
		return xiacijiandingriqi;
	}

	public void setXiacijiandingriqi(Date xiacijiandingriqi) {
		this.xiacijiandingriqi = xiacijiandingriqi;
	}

	public String getJiandingbumen() {
		return jiandingbumen;
	}

	public void setJiandingbumen(String jiandingbumen) {
		this.jiandingbumen = jiandingbumen;
	}

	public String getShifoujiaoyan() {
		return shifoujiaoyan;
	}

	public void setShifoujiaoyan(String shifoujiaoyan) {
		this.shifoujiaoyan = shifoujiaoyan;
	}

	public String getSuyuanfangshi() {
		return suyuanfangshi;
	}

	public void setSuyuanfangshi(String suyuanfangshi) {
		this.suyuanfangshi = suyuanfangshi;
	}

	public String getJieyongren() {
		return jieyongren;
	}

	public void setJieyongren(String jieyongren) {
		this.jieyongren = jieyongren;
	}

	public Date getJieyongriqi() {
		return jieyongriqi;
	}

	public void setJieyongriqi(Date jieyongriqi) {
		this.jieyongriqi = jieyongriqi;
	}

	public Date getJieyongshijian() {
		return jieyongshijian;
	}

	public void setJieyongshijian(Date jieyongshijian) {
		this.jieyongshijian = jieyongshijian;
	}

	public String getJiechuzhuangtai() {
		return jiechuzhuangtai;
	}

	public void setJiechuzhuangtai(String jiechuzhuangtai) {
		this.jiechuzhuangtai = jiechuzhuangtai;
	}

	public String getGuihuanren() {
		return guihuanren;
	}

	public void setGuihuanren(String guihuanren) {
		this.guihuanren = guihuanren;
	}

	public Date getGuihuanriqi() {
		return guihuanriqi;
	}

	public void setGuihuanriqi(Date guihuanriqi) {
		this.guihuanriqi = guihuanriqi;
	}

	public String getGuihuanzhuangtai() {
		return guihuanzhuangtai;
	}

	public void setGuihuanzhuangtai(String guihuanzhuangtai) {
		this.guihuanzhuangtai = guihuanzhuangtai;
	}

	
	
	
}
