package com.stone.biz.jcsj.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "BIZ_APPRIZES")
public class TApprizes implements Serializable {
	private Long id = Long.valueOf(Long.parseLong("0"));
	/**
	 * 施工单位
	 */
	private String shigongdanwei;
	/**
	 * 告知单编号
	 */
	private String gaozhidanbianhao;
	/**
	 * 设备名称
	 */
	private String shebeimingcheng;
	/**
	 * 型号
	 */
	private String xinghao;
	/**
	 * 设备代码
	 */
	private String shebeidaima;
	/**
	 * 制造编号
	 */
	private String zhizaobianhao;
	/**
	 * 制造单位
	 */
	private String zhizaodanwei;
	/**
	 * 制造许可证编号
	 */
	private String zhizaoxukezhengbianhao;
	/**
	 * 设备地点
	 */
	private String shebeididian;
	/**
	 * 安装日期
	 */
	private String anzhuangriqi;
	/**
	 * 施工单位全称
	 */
	private String shigongdanweiquancheng;
	private Long shigongdanweiId;
	/**
	 * 施工类别
	 */
	private String shigongleibie;
	/**
	 * 施工许可证编号
	 */
	private String shigongxukezhengbianhao;
	/**
	 * 施工许可证有效期
	 */
	private String shigongxukezhengyouxiaoqi;
	/**
	 * 施工单位联系人
	 */
	private String shigongdanwei_lianxiren;
	/**
	 * 施工单位联系电话
	 */
	private String shigongdanwei_lianxidianhua;
	/**
	 * 施工单位传真
	 */
	private String shigongdanwei_chuanzhen;
	/**
	 * 施工单位地址
	 */
	private String shigongdanwei_dizhi;
	/**
	 * 施工单位邮编
	 */
	private String shigongdanwei_youbian;
	/**
	 * 使用单位
	 */
	private String shiyongdanwei;
	private Long   shiyongdanweiId;
	/**
	 * 使用单位联系人
	 */
	private String shiyongdanwei_lianxiren;
	/**
	 * 使用单位联系电话
	 */
	private String shiyongdanwei_lianxidianhua;
	/**
	 * 使用单位传真
	 */
	private String shiyongdanwei_chuanzhen;
	/**
	 * 使用单位地址
	 */
	private String shiyongdanwei_dizhi;
	/**
	 * 使用单位邮编
	 */
	private String shiyongdanwei_youbian;
	/**
	 * 设备种类
	 */
	private String shebeizhonglei;
	/**
	 * 设备种类代码
	 */
	private String shebeizhongleidaima;
	/**
	 * 设备类别
	 */
	private String shebeileibie;
	/**
	 * 设备类别代码
	 */
	private String shebeileibiedaima;
	/**
	 * 设备品种
	 */
	private String shebeipinzhong;
	/**
	 * 设备品种代码
	 */
	private String shebeipinzhongdaima;
	/**
	 * 区县名称
	 */
	private String quhuamingcheng;
	/**
	 * 区县代码
	 */
	private String quhuadaima;
	/**
	 * 报检日期
	 */
	private Date baojianriqi;
	/**
	 * 检验结束日期
	 */
	private Date jianyanjieshuriqi;
	/**
	 * 检验开始日期
	 */
	private Date jianyankaishiriqi;
	/**
	 * 报告编号
	 */
	private String baogaobianhao;
	/**
	 * 注册登记日期
	 */
	private Date dengjiriqi;
	/**
	 * 注册代码
	 */
	private String zhucedaima;
	/**
	 * 登记证编号
	 */
	private String dengjizhengbianhao;
	/**
	 * 下次检验日期
	 */
	private Date xiacijianyanriqi;
	/**
	 * 检验结论
	 */
	private String jianyanjielun;
	/**
	 * 告知经办人
	 */
	private String gaozhi_jingbanren;
	/**
	 * 告知经办日期
	 */
	private Date gaozhi_jingbanriqi;
	/**
	 * 检验报告主键
	 */
	private String jybgzj;
	/**
	 * 登记经办人
	 */
	private String dengji_jingbanren;
	/**
	 * 登记经办日期
	 */
	private Date dengji_jingbanriqi;
	/**
	 * 告知单状态     0 已告知 1 已报检 2 检验中 3 已检验  4 已登记
	 */
	private String state;
	/**
	 * 告知单文件路径
	 */
	private String filepath;
	/**
	 * 作废状态
	 */
	private String zfstate;
	/**
	 * 附件路径
	 */
	private String fj_filepath;
	/**
	 * 办结后保存检验项目
	 */
	private String bj_jianyanxiangmu;
	/**
	 * 登记表id
	 */
	private Long djb_id;
	/**
	 * 设备注册日期
	 */
	private Date zhuceriqi;
	/**
	 * 内部编号（设备编号）
	 */
	private String neibubianhao;
	private String shi;
	private String shidaima;
	private String xiangzhen;
	private String xiangzhendaima;
	
	private String creat_user;//创建告知人账号    安装单位使用
	private String wtg_yuanyin;//企业单位提交的告知  不通过原因
	private String shstate;//审核状态

	@Id
	@Column(name = "ANNALID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_BIZ_APPRIZES")
	@SequenceGenerator(name = "SEQ_BIZ_APPRIZES", allocationSize = 1, sequenceName = "SEQ_BIZ_APPRIZES")
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getShigongdanwei() {
		return shigongdanwei;
	}

	public void setShigongdanwei(String shigongdanwei) {
		this.shigongdanwei = shigongdanwei;
	}

	public String getShigongdanwei_lianxiren() {
		return shigongdanwei_lianxiren;
	}

	public void setShigongdanwei_lianxiren(String shigongdanweiLianxiren) {
		shigongdanwei_lianxiren = shigongdanweiLianxiren;
	}

	public String getShigongdanwei_lianxidianhua() {
		return shigongdanwei_lianxidianhua;
	}

	public void setShigongdanwei_lianxidianhua(String shigongdanweiLianxidianhua) {
		shigongdanwei_lianxidianhua = shigongdanweiLianxidianhua;
	}

	public String getShiyongdanwei() {
		return shiyongdanwei;
	}

	public void setShiyongdanwei(String shiyongdanwei) {
		this.shiyongdanwei = shiyongdanwei;
	}

	public String getZhizaodanwei() {
		return zhizaodanwei;
	}

	public void setZhizaodanwei(String zhizaodanwei) {
		this.zhizaodanwei = zhizaodanwei;
	}

	public String getGaozhidanbianhao() {
		return gaozhidanbianhao;
	}

	public void setGaozhidanbianhao(String gaozhidanbianhao) {
		this.gaozhidanbianhao = gaozhidanbianhao;
	}

	public String getAnzhuangriqi() {
		return anzhuangriqi;
	}

	public void setAnzhuangriqi(String anzhuangriqi) {
		this.anzhuangriqi = anzhuangriqi;
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

	public String getShebeizhonglei() {
		return shebeizhonglei;
	}

	public void setShebeizhonglei(String shebeizhonglei) {
		this.shebeizhonglei = shebeizhonglei;
	}

	public String getShebeizhongleidaima() {
		return shebeizhongleidaima;
	}

	public void setShebeizhongleidaima(String shebeizhongleidaima) {
		this.shebeizhongleidaima = shebeizhongleidaima;
	}

	public String getShebeileibie() {
		return shebeileibie;
	}

	public void setShebeileibie(String shebeileibie) {
		this.shebeileibie = shebeileibie;
	}

	public String getShebeileibiedaima() {
		return shebeileibiedaima;
	}

	public void setShebeileibiedaima(String shebeileibiedaima) {
		this.shebeileibiedaima = shebeileibiedaima;
	}

	public String getShebeipinzhong() {
		return shebeipinzhong;
	}

	public void setShebeipinzhong(String shebeipinzhong) {
		this.shebeipinzhong = shebeipinzhong;
	}

	public String getShebeipinzhongdaima() {
		return shebeipinzhongdaima;
	}

	public void setShebeipinzhongdaima(String shebeipinzhongdaima) {
		this.shebeipinzhongdaima = shebeipinzhongdaima;
	}

	public Date getBaojianriqi() {
		return baojianriqi;
	}

	public void setBaojianriqi(Date baojianriqi) {
		this.baojianriqi = baojianriqi;
	}

	public Date getJianyanjieshuriqi() {
		return jianyanjieshuriqi;
	}

	public void setJianyanjieshuriqi(Date jianyanjieshuriqi) {
		this.jianyanjieshuriqi = jianyanjieshuriqi;
	}

	public Date getJianyankaishiriqi() {
		return jianyankaishiriqi;
	}

	public void setJianyankaishiriqi(Date jianyankaishiriqi) {
		this.jianyankaishiriqi = jianyankaishiriqi;
	}

	public String getBaogaobianhao() {
		return baogaobianhao;
	}

	public void setBaogaobianhao(String baogaobianhao) {
		this.baogaobianhao = baogaobianhao;
	}

	public Date getDengjiriqi() {
		return dengjiriqi;
	}

	public void setDengjiriqi(Date dengjiriqi) {
		this.dengjiriqi = dengjiriqi;
	}

	public String getZhucedaima() {
		return zhucedaima;
	}

	public void setZhucedaima(String zhucedaima) {
		this.zhucedaima = zhucedaima;
	}

	public String getDengjizhengbianhao() {
		return dengjizhengbianhao;
	}

	public void setDengjizhengbianhao(String dengjizhengbianhao) {
		this.dengjizhengbianhao = dengjizhengbianhao;
	}

	public Date getXiacijianyanriqi() {
		return xiacijianyanriqi;
	}

	public void setXiacijianyanriqi(Date xiacijianyanriqi) {
		this.xiacijianyanriqi = xiacijianyanriqi;
	}

	public String getJianyanjielun() {
		return jianyanjielun;
	}

	public void setJianyanjielun(String jianyanjielun) {
		this.jianyanjielun = jianyanjielun;
	}

	public String getGaozhi_jingbanren() {
		return gaozhi_jingbanren;
	}

	public void setGaozhi_jingbanren(String gaozhiJingbanren) {
		gaozhi_jingbanren = gaozhiJingbanren;
	}

	public Date getGaozhi_jingbanriqi() {
		return gaozhi_jingbanriqi;
	}

	public void setGaozhi_jingbanriqi(Date gaozhiJingbanriqi) {
		gaozhi_jingbanriqi = gaozhiJingbanriqi;
	}

	public String getJybgzj() {
		return jybgzj;
	}

	public void setJybgzj(String jybgzj) {
		this.jybgzj = jybgzj;
	}

	public String getDengji_jingbanren() {
		return dengji_jingbanren;
	}

	public void setDengji_jingbanren(String dengjiJingbanren) {
		dengji_jingbanren = dengjiJingbanren;
	}

	public Date getDengji_jingbanriqi() {
		return dengji_jingbanriqi;
	}

	public void setDengji_jingbanriqi(Date dengjiJingbanriqi) {
		dengji_jingbanriqi = dengjiJingbanriqi;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getShebeimingcheng() {
		return shebeimingcheng;
	}

	public void setShebeimingcheng(String shebeimingcheng) {
		this.shebeimingcheng = shebeimingcheng;
	}

	public String getXinghao() {
		return xinghao;
	}

	public void setXinghao(String xinghao) {
		this.xinghao = xinghao;
	}

	public String getShebeidaima() {
		return shebeidaima;
	}

	public void setShebeidaima(String shebeidaima) {
		this.shebeidaima = shebeidaima;
	}

	public String getZhizaobianhao() {
		return zhizaobianhao;
	}

	public void setZhizaobianhao(String zhizaobianhao) {
		this.zhizaobianhao = zhizaobianhao;
	}

	public String getZhizaoxukezhengbianhao() {
		return zhizaoxukezhengbianhao;
	}

	public void setZhizaoxukezhengbianhao(String zhizaoxukezhengbianhao) {
		this.zhizaoxukezhengbianhao = zhizaoxukezhengbianhao;
	}

	public String getShebeididian() {
		return shebeididian;
	}

	public void setShebeididian(String shebeididian) {
		this.shebeididian = shebeididian;
	}

	public String getShigongdanweiquancheng() {
		return shigongdanweiquancheng;
	}

	public void setShigongdanweiquancheng(String shigongdanweiquancheng) {
		this.shigongdanweiquancheng = shigongdanweiquancheng;
	}

	public String getShigongleibie() {
		return shigongleibie;
	}

	public void setShigongleibie(String shigongleibie) {
		this.shigongleibie = shigongleibie;
	}

	public String getShigongxukezhengbianhao() {
		return shigongxukezhengbianhao;
	}

	public void setShigongxukezhengbianhao(String shigongxukezhengbianhao) {
		this.shigongxukezhengbianhao = shigongxukezhengbianhao;
	}

	public String getShigongxukezhengyouxiaoqi() {
		return shigongxukezhengyouxiaoqi;
	}

	public void setShigongxukezhengyouxiaoqi(String shigongxukezhengyouxiaoqi) {
		this.shigongxukezhengyouxiaoqi = shigongxukezhengyouxiaoqi;
	}

	public String getShigongdanwei_chuanzhen() {
		return shigongdanwei_chuanzhen;
	}

	public void setShigongdanwei_chuanzhen(String shigongdanweiChuanzhen) {
		shigongdanwei_chuanzhen = shigongdanweiChuanzhen;
	}

	public String getShigongdanwei_dizhi() {
		return shigongdanwei_dizhi;
	}

	public void setShigongdanwei_dizhi(String shigongdanweiDizhi) {
		shigongdanwei_dizhi = shigongdanweiDizhi;
	}

	public String getShigongdanwei_youbian() {
		return shigongdanwei_youbian;
	}

	public void setShigongdanwei_youbian(String shigongdanweiYoubian) {
		shigongdanwei_youbian = shigongdanweiYoubian;
	}

	public String getShiyongdanwei_chuanzhen() {
		return shiyongdanwei_chuanzhen;
	}

	public void setShiyongdanwei_chuanzhen(String shiyongdanweiChuanzhen) {
		shiyongdanwei_chuanzhen = shiyongdanweiChuanzhen;
	}

	public String getShiyongdanwei_dizhi() {
		return shiyongdanwei_dizhi;
	}

	public void setShiyongdanwei_dizhi(String shiyongdanweiDizhi) {
		shiyongdanwei_dizhi = shiyongdanweiDizhi;
	}

	public String getShiyongdanwei_youbian() {
		return shiyongdanwei_youbian;
	}

	public void setShiyongdanwei_youbian(String shiyongdanweiYoubian) {
		shiyongdanwei_youbian = shiyongdanweiYoubian;
	}
	
	public String getQuhuamingcheng() {
		return quhuamingcheng;
	}

	public void setQuhuamingcheng(String quhuamingcheng) {
		this.quhuamingcheng = quhuamingcheng;
	}

	public String getQuhuadaima() {
		return quhuadaima;
	}

	public void setQuhuadaima(String quhuadaima) {
		this.quhuadaima = quhuadaima;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getZfstate() {
		return zfstate;
	}

	public void setZfstate(String zfstate) {
		this.zfstate = zfstate;
	}

	public Long getShigongdanweiId() {
		return shigongdanweiId;
	}

	public void setShigongdanweiId(Long shigongdanweiId) {
		this.shigongdanweiId = shigongdanweiId;
	}

	public String getFj_filepath() {
		return fj_filepath;
	}

	public void setFj_filepath(String fjFilepath) {
		fj_filepath = fjFilepath;
	}

	public String getBj_jianyanxiangmu() {
		return bj_jianyanxiangmu;
	}

	public void setBj_jianyanxiangmu(String bjJianyanxiangmu) {
		bj_jianyanxiangmu = bjJianyanxiangmu;
	}

	public Long getDjb_id() {
		return djb_id;
	}

	public void setDjb_id(Long djbId) {
		djb_id = djbId;
	}

	public Date getZhuceriqi() {
		return zhuceriqi;
	}

	public void setZhuceriqi(Date zhuceriqi) {
		this.zhuceriqi = zhuceriqi;
	}

	public String getNeibubianhao() {
		return neibubianhao;
	}

	public void setNeibubianhao(String neibubianhao) {
		this.neibubianhao = neibubianhao;
	}

	public Long getShiyongdanweiId() {
		return shiyongdanweiId;
	}

	public void setShiyongdanweiId(Long shiyongdanweiId) {
		this.shiyongdanweiId = shiyongdanweiId;
	}

	public String getShi() {
		return shi;
	}

	public void setShi(String shi) {
		this.shi = shi;
	}

	public String getShidaima() {
		return shidaima;
	}

	public void setShidaima(String shidaima) {
		this.shidaima = shidaima;
	}

	public String getXiangzhen() {
		return xiangzhen;
	}

	public void setXiangzhen(String xiangzhen) {
		this.xiangzhen = xiangzhen;
	}

	public String getXiangzhendaima() {
		return xiangzhendaima;
	}

	public void setXiangzhendaima(String xiangzhendaima) {
		this.xiangzhendaima = xiangzhendaima;
	}

	public String getCreat_user() {
		return creat_user;
	}

	public void setCreat_user(String creatUser) {
		creat_user = creatUser;
	}

	public String getWtg_yuanyin() {
		return wtg_yuanyin;
	}

	public void setWtg_yuanyin(String wtgYuanyin) {
		wtg_yuanyin = wtgYuanyin;
	}

	public String getShstate() {
		return shstate;
	}

	public void setShstate(String shstate) {
		this.shstate = shstate;
	}

}