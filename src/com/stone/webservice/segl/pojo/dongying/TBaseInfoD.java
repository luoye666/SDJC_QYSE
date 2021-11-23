package com.stone.webservice.segl.pojo.dongying;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 
 * 设备基本信息
 * 
 */
@Entity
@Table(name="BIZ_SE")
@Inheritance(strategy=InheritanceType.JOINED)
public class TBaseInfoD implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 62907824677970707L;
	
	/************************************************设备信息***********************************************/
	/**
	 * Id
	 */
	private Long id;
	
	/**
	 * 设备名称	
	 */
	private String shebeimingcheng;
	
	/**
	 * 设备种类代码	
	 */
	private String shebeizhongleidaima;
	
	/**
	 * 设备种类	
	 */
	private String shebeizhonglei;
	
	/**
	 * 设备类别	
	 */
	private String shebeileibie;
	
	/**
	 * 设备品种
	 */
	private String shebeipinzhong;
	/**
	 * 设备注册代码 
	 */
	private String zhucedaima;
	/**
	 * 区划名称
	 */
	private String quhuamingcheng;
	/**
	 * 设备地点(安装地点）
	 */
	private String shebeididian;
	/**
	 * 使用登记证编号
	 */
	private String dengjizhengbianhao;
	/**
	 * 设备出厂编号(产品编号)（气瓶编号）
	 */
	private String chuchangbianhao;
	/**
	 * 内部编号（设备编号）
	 */
	private String neibubianhao;
	/**
	 * 设备型号
	 */
	private String shebeixinghao;
	/**
	 * 设备注册日期
	 */
	private Date zhuceriqi;
	
	private String shiyongdanwei;  //使用单位 
	private String shiyongdanwei_dizhi; //使用单位地址
	private String shiyongdanwei_lianxiren; //使用单位联系人 
	private String shiyongdanwei_lianxidianhua; //使用单位联系电话 
	private String shiyongdanwei_code; //使用单位代码（组织机构统一代码）
	private String shiyongdanwei_suoshuhangye; //使用单位所属行业
	private String anquanguanlibumen;//安全管理部门
	private String anquanguanli_lianxidianhua;//安全部门联系电话
	private String anquanguanlirenyuan; //安全管理人员
	//产权单位
	private String chanquandanwei;
	//产权单位地址
	private String chanquandanwei_dizhi;
	//产权单位代码
	private String chanquandanwei_daima;
	/**
	 * 制造单位 
	 */
	private String zhizaodanwei;

	/**
	 * 制造日期
	 */
	private String zhizaoriqi;
	private String anzhuangdanwei; //安装单位
	/**
	 * 安装日期
	 */
	private Date anzhuangriqi;
	/**
	 * 设备代码
	 */
	private String shebeidaima;
	
	private Date xiacijianyanriqi; //下次检验日期
	private String shigongdanwei; //施工单位
	private String shigongdanwei_xukezhengbianhao; //施工单位许可证编号
	private String weihubaoyangdanwei; //维保单位
	private String weihubaoyangdanwei_dianhua; //维保电话
	private String beizhu; //备注
	
	
	
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SE")
    @SequenceGenerator(name="SEQ_SE",allocationSize=1, sequenceName="SEQ_SE")
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

	public String getShebeimingcheng() {
		return shebeimingcheng;
	}

	public void setShebeimingcheng(String shebeimingcheng) {
		this.shebeimingcheng = shebeimingcheng;
	}

	public String getShebeizhongleidaima() {
		return shebeizhongleidaima;
	}

	public void setShebeizhongleidaima(String shebeizhongleidaima) {
		this.shebeizhongleidaima = shebeizhongleidaima;
	}

	public String getShebeizhonglei() {
		return shebeizhonglei;
	}

	public void setShebeizhonglei(String shebeizhonglei) {
		this.shebeizhonglei = shebeizhonglei;
	}

	public String getShebeileibie() {
		return shebeileibie;
	}

	public void setShebeileibie(String shebeileibie) {
		this.shebeileibie = shebeileibie;
	}

	public String getShebeipinzhong() {
		return shebeipinzhong;
	}

	public void setShebeipinzhong(String shebeipinzhong) {
		this.shebeipinzhong = shebeipinzhong;
	}

	public String getZhucedaima() {
		return zhucedaima;
	}

	public void setZhucedaima(String zhucedaima) {
		this.zhucedaima = zhucedaima;
	}

	public String getQuhuamingcheng() {
		return quhuamingcheng;
	}

	public void setQuhuamingcheng(String quhuamingcheng) {
		this.quhuamingcheng = quhuamingcheng;
	}

	public String getShebeididian() {
		return shebeididian;
	}

	public void setShebeididian(String shebeididian) {
		this.shebeididian = shebeididian;
	}

	public String getDengjizhengbianhao() {
		return dengjizhengbianhao;
	}

	public void setDengjizhengbianhao(String dengjizhengbianhao) {
		this.dengjizhengbianhao = dengjizhengbianhao;
	}

	public String getChuchangbianhao() {
		return chuchangbianhao;
	}

	public void setChuchangbianhao(String chuchangbianhao) {
		this.chuchangbianhao = chuchangbianhao;
	}

	public String getNeibubianhao() {
		return neibubianhao;
	}

	public void setNeibubianhao(String neibubianhao) {
		this.neibubianhao = neibubianhao;
	}

	public String getShebeixinghao() {
		return shebeixinghao;
	}

	public void setShebeixinghao(String shebeixinghao) {
		this.shebeixinghao = shebeixinghao;
	}

	public Date getZhuceriqi() {
		return zhuceriqi;
	}

	public void setZhuceriqi(Date zhuceriqi) {
		this.zhuceriqi = zhuceriqi;
	}

	public String getShiyongdanwei() {
		return shiyongdanwei;
	}

	public void setShiyongdanwei(String shiyongdanwei) {
		this.shiyongdanwei = shiyongdanwei;
	}

	public String getShiyongdanwei_dizhi() {
		return shiyongdanwei_dizhi;
	}

	public void setShiyongdanwei_dizhi(String shiyongdanweiDizhi) {
		shiyongdanwei_dizhi = shiyongdanweiDizhi;
	}

	public String getShiyongdanwei_lianxiren() {
		return shiyongdanwei_lianxiren;
	}

	public void setShiyongdanwei_lianxiren(String shiyongdanweiLianxiren) {
		shiyongdanwei_lianxiren = shiyongdanweiLianxiren;
	}

	public String getShiyongdanwei_lianxidianhua() {
		return shiyongdanwei_lianxidianhua;
	}

	public void setShiyongdanwei_lianxidianhua(String shiyongdanweiLianxidianhua) {
		shiyongdanwei_lianxidianhua = shiyongdanweiLianxidianhua;
	}

	public String getShiyongdanwei_code() {
		return shiyongdanwei_code;
	}

	public void setShiyongdanwei_code(String shiyongdanweiCode) {
		shiyongdanwei_code = shiyongdanweiCode;
	}

	public String getShiyongdanwei_suoshuhangye() {
		return shiyongdanwei_suoshuhangye;
	}

	public void setShiyongdanwei_suoshuhangye(String shiyongdanweiSuoshuhangye) {
		shiyongdanwei_suoshuhangye = shiyongdanweiSuoshuhangye;
	}

	public String getAnquanguanlibumen() {
		return anquanguanlibumen;
	}

	public void setAnquanguanlibumen(String anquanguanlibumen) {
		this.anquanguanlibumen = anquanguanlibumen;
	}

	public String getAnquanguanli_lianxidianhua() {
		return anquanguanli_lianxidianhua;
	}

	public void setAnquanguanli_lianxidianhua(String anquanguanliLianxidianhua) {
		anquanguanli_lianxidianhua = anquanguanliLianxidianhua;
	}

	public String getAnquanguanlirenyuan() {
		return anquanguanlirenyuan;
	}

	public void setAnquanguanlirenyuan(String anquanguanlirenyuan) {
		this.anquanguanlirenyuan = anquanguanlirenyuan;
	}

	public String getChanquandanwei() {
		return chanquandanwei;
	}

	public void setChanquandanwei(String chanquandanwei) {
		this.chanquandanwei = chanquandanwei;
	}

	public String getChanquandanwei_dizhi() {
		return chanquandanwei_dizhi;
	}

	public void setChanquandanwei_dizhi(String chanquandanweiDizhi) {
		chanquandanwei_dizhi = chanquandanweiDizhi;
	}

	public String getChanquandanwei_daima() {
		return chanquandanwei_daima;
	}

	public void setChanquandanwei_daima(String chanquandanweiDaima) {
		chanquandanwei_daima = chanquandanweiDaima;
	}

	public String getZhizaodanwei() {
		return zhizaodanwei;
	}

	public void setZhizaodanwei(String zhizaodanwei) {
		this.zhizaodanwei = zhizaodanwei;
	}

	public String getZhizaoriqi() {
		return zhizaoriqi;
	}

	public void setZhizaoriqi(String zhizaoriqi) {
		this.zhizaoriqi = zhizaoriqi;
	}

	public String getAnzhuangdanwei() {
		return anzhuangdanwei;
	}

	public void setAnzhuangdanwei(String anzhuangdanwei) {
		this.anzhuangdanwei = anzhuangdanwei;
	}

	public Date getAnzhuangriqi() {
		return anzhuangriqi;
	}

	public void setAnzhuangriqi(Date anzhuangriqi) {
		this.anzhuangriqi = anzhuangriqi;
	}

	public String getShebeidaima() {
		return shebeidaima;
	}

	public void setShebeidaima(String shebeidaima) {
		this.shebeidaima = shebeidaima;
	}

	public Date getXiacijianyanriqi() {
		return xiacijianyanriqi;
	}

	public void setXiacijianyanriqi(Date xiacijianyanriqi) {
		this.xiacijianyanriqi = xiacijianyanriqi;
	}

	public String getShigongdanwei() {
		return shigongdanwei;
	}

	public void setShigongdanwei(String shigongdanwei) {
		this.shigongdanwei = shigongdanwei;
	}

	public String getShigongdanwei_xukezhengbianhao() {
		return shigongdanwei_xukezhengbianhao;
	}

	public void setShigongdanwei_xukezhengbianhao(
			String shigongdanweiXukezhengbianhao) {
		shigongdanwei_xukezhengbianhao = shigongdanweiXukezhengbianhao;
	}

	public String getWeihubaoyangdanwei() {
		return weihubaoyangdanwei;
	}

	public void setWeihubaoyangdanwei(String weihubaoyangdanwei) {
		this.weihubaoyangdanwei = weihubaoyangdanwei;
	}

	public String getWeihubaoyangdanwei_dianhua() {
		return weihubaoyangdanwei_dianhua;
	}

	public void setWeihubaoyangdanwei_dianhua(String weihubaoyangdanweiDianhua) {
		weihubaoyangdanwei_dianhua = weihubaoyangdanweiDianhua;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	
	
	
}