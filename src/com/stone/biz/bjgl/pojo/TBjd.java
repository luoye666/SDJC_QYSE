package com.stone.biz.bjgl.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 * 报检单信息表
 * @author lenovo
 *
 */
@Entity
@Table(name="QY_BJD")
@XmlRootElement(name="TBjd")
@JsonIgnoreProperties(ignoreUnknown = true)
public class TBjd implements Serializable{

	private static final long serialVersionUID = 3750453107209476718L;
	
    private Long id = Long.valueOf(Long.parseLong("0"));
    
    /*
     * 设备信息
     */
    
    private String jianyanleibie; //检验类别
    
    private String shebeizhonglei; //设备种类
    
    private String shebeizhongleidaima; //设备种类代码
    
    /*
     * 使用单位信息
     */
    
    private String shiyongdanwei; //使用单位
    
    private String shiyongdanweiDizhi; //使用单位地址
    
    private String shiyongdanweiShebeidizhi; //设备地址
    
    private String shiyongdanweiLianxiren; //联系人
    
    private String shiyongdanweiLianxidianhua; //联系电话
    
    private String shi; //市 
    
    private String shidaima; //市代码
    
    private String quhuamingcheng; //区划
    
    private String quhuadaima; //区划代码
    
    /*
     * 业务信息
     */
    
    private String shoulibianhao; //受理编号
    
    private Date shouliriqi; //受理日期（检验机构）
    
    private String hedingleixing; //核定类型
    
    private String hedingrenyuan; //核定人员
    
    private String biaozhunfeiyong; //标准费用
    
    private String jiaofeizhuangtai;// 缴费状态
    
    private String fapiaohao;//发票号
    
    private String kaijurenyuan; //开具人员
    
    private String jianyandidian; //检验地点
    
    private Date jianyanriqi; //协商检验日期
    
    private String beizhu; //备注
    
    /*
     * 检验信息
     */
    
    private String jianyankeshi; //检验科室
    
    private String jianyanLianxiren; //检验联系人
    
    private String jianyanLianxidianhua; //检验联系电话
    
    /*
     * 状态信息及其它辅助信息
     */
    
    private String se_id ; //设备主键
    
    private String seZhucedaima;//设备注册代码
    
    private String seDengjizhengbianhao; //登记证编号
    
    private Date tijiaoriqi; //企业提交日期（默认当前日期）
    
    /*
     * 报检状态 
     * 1 企业提交
     * 2 等待审核
     * 3 检验机构预审通过  
     * 4 检验机构通过
     * 5 检验中
     * 6 检验完毕
     * 7 不予受理
     * (暂定 待议)
     */
    private String bjState;
    
    private String role;//登录角色
    
    private String fujian;//附件
    
    private String hzdid; //暂存 bjdid
    
    private String jiaofeipingzheng; //缴费凭证
    
    /*
     * 邮寄信息
     * 如果选择邮寄，带*必填
     */
    private String mail; //是否邮寄
    private String shoujiandanwei; //收件单位 *
    private String shojianren;  //收件人 *
    private String shoujiandizhi; //地址 *
    private String shoujiandianhuan; //电话 *
    private String youjiwumingcheng; //邮寄物名称
    private String shuliang; //数量
    private String cost; //费用
    private String yuejiezhanghao; //月结账号
    private String youjibeizhu; //邮寄备注
    
    private String youxiang; //邮箱
    
    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_QY_BJD")
    @SequenceGenerator(name="SEQ_QY_BJD",allocationSize=1,sequenceName="SEQ_QY_BJD")
	public Long getId() {
		return id;
	}

	public String getJianyanleibie() {
		return jianyanleibie;
	}

	public String getShebeizhonglei() {
		return shebeizhonglei;
	}

	public String getShebeizhongleidaima() {
		return shebeizhongleidaima;
	}

	public String getShiyongdanwei() {
		return shiyongdanwei;
	}

	public String getShi() {
		return shi;
	}

	public String getShidaima() {
		return shidaima;
	}

	public String getQuhuamingcheng() {
		return quhuamingcheng;
	}

	public String getQuhuadaima() {
		return quhuadaima;
	}

	public String getShoulibianhao() {
		return shoulibianhao;
	}

	public Date getShouliriqi() {
		return shouliriqi;
	}

	public String getHedingleixing() {
		return hedingleixing;
	}

	public String getHedingrenyuan() {
		return hedingrenyuan;
	}

	public String getBiaozhunfeiyong() {
		return biaozhunfeiyong;
	}

	public String getJiaofeizhuangtai() {
		return jiaofeizhuangtai;
	}

	public String getFapiaohao() {
		return fapiaohao;
	}

	public String getKaijurenyuan() {
		return kaijurenyuan;
	}

	public String getJianyandidian() {
		return jianyandidian;
	}

	public Date getJianyanriqi() {
		return jianyanriqi;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public String getJianyankeshi() {
		return jianyankeshi;
	}

	public String getSe_id() {
		return se_id;
	}

	public Date getTijiaoriqi() {
		return tijiaoriqi;
	}

	public String getFujian() {
		return fujian;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setJianyanleibie(String jianyanleibie) {
		this.jianyanleibie = jianyanleibie;
	}

	public void setShebeizhonglei(String shebeizhonglei) {
		this.shebeizhonglei = shebeizhonglei;
	}

	public void setShebeizhongleidaima(String shebeizhongleidaima) {
		this.shebeizhongleidaima = shebeizhongleidaima;
	}

	public void setShiyongdanwei(String shiyongdanwei) {
		this.shiyongdanwei = shiyongdanwei;
	}

	public void setShi(String shi) {
		this.shi = shi;
	}

	public void setShidaima(String shidaima) {
		this.shidaima = shidaima;
	}

	public void setQuhuamingcheng(String quhuamingcheng) {
		this.quhuamingcheng = quhuamingcheng;
	}

	public void setQuhuadaima(String quhuadaima) {
		this.quhuadaima = quhuadaima;
	}

	public void setShoulibianhao(String shoulibianhao) {
		this.shoulibianhao = shoulibianhao;
	}

	public void setShouliriqi(Date shouliriqi) {
		this.shouliriqi = shouliriqi;
	}

	public void setHedingleixing(String hedingleixing) {
		this.hedingleixing = hedingleixing;
	}

	public void setHedingrenyuan(String hedingrenyuan) {
		this.hedingrenyuan = hedingrenyuan;
	}

	public void setBiaozhunfeiyong(String biaozhunfeiyong) {
		this.biaozhunfeiyong = biaozhunfeiyong;
	}

	public void setJiaofeizhuangtai(String jiaofeizhuangtai) {
		this.jiaofeizhuangtai = jiaofeizhuangtai;
	}

	public void setFapiaohao(String fapiaohao) {
		this.fapiaohao = fapiaohao;
	}

	public void setKaijurenyuan(String kaijurenyuan) {
		this.kaijurenyuan = kaijurenyuan;
	}

	public void setJianyandidian(String jianyandidian) {
		this.jianyandidian = jianyandidian;
	}

	public void setJianyanriqi(Date jianyanriqi) {
		this.jianyanriqi = jianyanriqi;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public void setJianyankeshi(String jianyankeshi) {
		this.jianyankeshi = jianyankeshi;
	}


	public void setSe_id(String seId) {
		se_id = seId;
	}

	public void setTijiaoriqi(Date tijiaoriqi) {
		this.tijiaoriqi = tijiaoriqi;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getShiyongdanweiDizhi() {
		return shiyongdanweiDizhi;
	}

	public void setShiyongdanweiDizhi(String shiyongdanweiDizhi) {
		this.shiyongdanweiDizhi = shiyongdanweiDizhi;
	}

	public String getShiyongdanweiShebeidizhi() {
		return shiyongdanweiShebeidizhi;
	}

	public void setShiyongdanweiShebeidizhi(String shiyongdanweiShebeidizhi) {
		this.shiyongdanweiShebeidizhi = shiyongdanweiShebeidizhi;
	}

	public String getShiyongdanweiLianxiren() {
		return shiyongdanweiLianxiren;
	}

	public void setShiyongdanweiLianxiren(String shiyongdanweiLianxiren) {
		this.shiyongdanweiLianxiren = shiyongdanweiLianxiren;
	}

	public String getShiyongdanweiLianxidianhua() {
		return shiyongdanweiLianxidianhua;
	}

	public void setShiyongdanweiLianxidianhua(String shiyongdanweiLianxidianhua) {
		this.shiyongdanweiLianxidianhua = shiyongdanweiLianxidianhua;
	}

	public String getJianyanLianxiren() {
		return jianyanLianxiren;
	}

	public void setJianyanLianxiren(String jianyanLianxiren) {
		this.jianyanLianxiren = jianyanLianxiren;
	}

	public String getJianyanLianxidianhua() {
		return jianyanLianxidianhua;
	}

	public void setJianyanLianxidianhua(String jianyanLianxidianhua) {
		this.jianyanLianxidianhua = jianyanLianxidianhua;
	}

	public String getSeZhucedaima() {
		return seZhucedaima;
	}

	public void setSeZhucedaima(String seZhucedaima) {
		this.seZhucedaima = seZhucedaima;
	}

	public String getBjState() {
		return bjState;
	}

	public void setBjState(String bjState) {
		this.bjState = bjState;
	}

	public String getHzdid() {
		return hzdid;
	}

	public void setHzdid(String hzdid) {
		this.hzdid = hzdid;
	}

	public String getSeDengjizhengbianhao() {
		return seDengjizhengbianhao;
	}

	public void setSeDengjizhengbianhao(String seDengjizhengbianhao) {
		this.seDengjizhengbianhao = seDengjizhengbianhao;
	}

	public String getJiaofeipingzheng() {
		return jiaofeipingzheng;
	}

	public void setJiaofeipingzheng(String jiaofeipingzheng) {
		this.jiaofeipingzheng = jiaofeipingzheng;
	}

	public String getShoujiandanwei() {
		return shoujiandanwei;
	}

	public void setShoujiandanwei(String shoujiandanwei) {
		this.shoujiandanwei = shoujiandanwei;
	}

	public String getShojianren() {
		return shojianren;
	}

	public void setShojianren(String shojianren) {
		this.shojianren = shojianren;
	}

	public String getShoujiandizhi() {
		return shoujiandizhi;
	}

	public void setShoujiandizhi(String shoujiandizhi) {
		this.shoujiandizhi = shoujiandizhi;
	}

	public String getShoujiandianhuan() {
		return shoujiandianhuan;
	}

	public void setShoujiandianhuan(String shoujiandianhuan) {
		this.shoujiandianhuan = shoujiandianhuan;
	}

	public String getYoujiwumingcheng() {
		return youjiwumingcheng;
	}

	public void setYoujiwumingcheng(String youjiwumingcheng) {
		this.youjiwumingcheng = youjiwumingcheng;
	}

	public String getShuliang() {
		return shuliang;
	}

	public void setShuliang(String shuliang) {
		this.shuliang = shuliang;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getYuejiezhanghao() {
		return yuejiezhanghao;
	}

	public void setYuejiezhanghao(String yuejiezhanghao) {
		this.yuejiezhanghao = yuejiezhanghao;
	}

	public String getYoujibeizhu() {
		return youjibeizhu;
	}

	public void setYoujibeizhu(String youjibeizhu) {
		this.youjibeizhu = youjibeizhu;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getYouxiang() {
		return youxiang;
	}

	public void setYouxiang(String youxiang) {
		this.youxiang = youxiang;
	}
	
	

}
