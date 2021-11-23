package com.stone.biz.jcsj.pojo;

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


/**
 * 注册登记表 ("BIZ_register")
 * @author Chao
 *
 */
@Entity
@Table(name="BIZ_REGISTER")
@Inheritance(strategy=InheritanceType.JOINED)
public class TRegister {

	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_BIZ_REGISTER")
    @SequenceGenerator(name="SEQ_BIZ_REGISTER",allocationSize=1, sequenceName="SEQ_BIZ_REGISTER")
    @Column(name = "ANNALID")
	private Long id	;//number(18)	n			系统主键
	
	//注册登记机构
	private String zhucedengjijigou;
	//注册登记日期
	private Date zhucedengjiriqi;
	//注册代码
	private String zhucedaima;
	//设备代码   2016-07-01 更改注册登记模板添加
	private String shebeidaima;
	//更新日期
	private Date gengxinriqi;
	//内部编号
	private String neibubianhao;
	//牌照编号
	private String paizhaobianhao;
	//注册登记人员
	private String zhucedengjirenyuan;
	//产权单位
	private String chanquandanwei;
	//产权单位代码
	private String chanquandanweidaima;
	//产权单位位置
	private String chanquandanweidizhi;
	//产权单位邮政编码
	private String cqdw_youzhengbianma;
	//产权单位管理负责人
	private String cqdw_guanlifuzeren;
	//产权单位   市
	private String chanquandanweidizhi_shi;
	// 市代码
	private String chanquandanweidizhi_shi_daima;
	//  区
	private String chanquandanweidizhi_qu;
	//  区代码
	private String chanquandanweidizhi_qu_daima;
	//设备使用地点   市
	private String shiyongdidian_shi;
	// 市代码
	private String shiyongdidian_shi_daima;
	//  区
	private String shiyongdidian_qu;
	//  区代码
	private String shiyongdidian_qu_daima;
	//单位法人代表
	private String danweifarendaibiao;
	//法人联系电话
	private String farenlianxidianhua;
	//使用单位
	private String shiyongdanwei;
	//使用单位代码
	private String shiyongdanweidaima;
	//使用单位地址
	private String shiyongdanweidizhi;
	//使用单位邮政编码
	private String sydw_youzhengbianma;
	//安全管理部门
	private String anquanguanlibumen;
	//安全管理人员
	private String anquanguanlirenyuan;
	//安全管理人员联系电话
	private String aqglry_lianxidianhua;
	//使用地点
	private String shiyongdidian;
	//操作人员
	private String caozuorenyuan;
	//设备类别
	private String shebeileibie;
	//设备类别代码
	private String shebeileibiedaima;
	//设备名称
	private String shebeimingcheng;
	//设备型号
	private String shebeixinghao;
	//设计单位
	private String shejidanwei;
	//设计单位代码
	private String shejidanweidaima;
	//制造单位
	private String zhizaodanwei;
	//制造单位代码
	private String zhizaodanweidaima;
	//制造单位资格证书名称
	private String zzdw_zigezhengshumingcheng;
	//制造单位资格证书号
	private String zzdw_zigezhengshuhao;
	//制造单位联系电话
	private String zzdw_lianxidianhua;
	//制造日期
	private Date zhizaoriqi;
	//制造日期  字符串
	private String zhizaoriqi_str;
	//出厂编号
	private String chuchangbianhao;
	//使用场合
	private String shiyongchanghe;
	//安装单位
	private String anzhuangdanwei;
	//安装单位代码
	private String anzhuangdanweidaima;
	//安装单位资格证书编号
	private String azdw_zigezhengshubianhao;
	//项目负责人
	private String xiangmufuzeren;
	//项目负责人联系电话
	private String xmfzr_lianxidianhua;
	//施工单位
	private String shigongdanwei;
	//施工日期
	private Date shigongriqi;
	//验收单位
	private String yanshoudanwei;
	//竣工日期
	private Date jungongriqi;
	//验收检验机构
	private String yanshoujianyanjigou;
	//验收报告编号
	private String yanshoubaogaobianhao;
	//投用日期
	private Date touyongriqi;
	//投用日期  字符串
	private String touyongriqi_str;
	//维保周期
	private String weibaozhouqi;
	//大修周期
	private String daxiuzhouqi;
	//维保单位
	private String weibaodanwei;
	//维保单位代码
	private String weibaodanweidaima;
	//维保单位资格证书号
	private String wbdw_zigezhengshuhao;
	//维保负责人
	private String weibaofuzeren;
	//维保负责人电话
	private String weibaofuzerendianhua;
	//维保型式
	private String weibaoxingshi;
	//车间分厂
	private String chejianfenchang;
	//检验单位
	private String jianyandanwei;
	//检验单位代码
	private String jianyandanweidaima;
	//检验日期
	private Date jianyanriqi;
	//检验类别
	private String jianyanleibie;
	//主要问题
	private String zhuyaowenti;
	//检验结论
	private String jianyanjielun;
	//报告书编号
	private String baogaoshubianhao;
	//下次检验日期
	private Date xiacijianyanriqi;
	//事故类别
	private String shiguleibie;
	//事故发生日期
	private Date shigufashengriqi;
	//事故处理机构
	private String shiguchulijieguo;
	//变动方式
	private String biandongfangshi;
	//变动项目
	private String biandongxiangmu;
	//变动日期
	private Date biandongriqi;
	//承担单位
	private String chengdandanwei;
	//承担单位代码
	private String chengdandanweidaima;
	
	//锅炉
	private String guolufangleixing;
	//制造国
	private String zhizaoguo;
	//监检单位
	private String jianjiandanwei;
	//监检单位代码
	private String jianjiandanweidaima;
	//结构型式
	private String jiegouxingshi;
	
	//基本信息
	private String shiyongdengjizhenghaoma;
	//使用单位   市
	private String shiyongdanweidizhi_shi;
	// 市代码
	private String shiyongdanweidizhi_shi_daima;
	//  区
	private String shiyongdanweidizhi_qu;
	//  区代码
	private String shiyongdanweidizhi_qu_daima;
	//  法定代表人
	private String sydw_fadingdaibiaoren;
	//使用单位法人电话
	private String sydw_farendianhua;
	//  使用单位法人邮箱
	private String sydw_farenemail;
	//使用单位法人传真
	private String sydw_farenchuanzhen;
	//主管负责人
	private String zhuguanfuzeren;
	//主管负责人电话
	private String zhuguanfuzerendianhua;
	//经办人
	private String jingbanren;
	//经办人电话
	private String jingbanrendianhua;
	//经办人手机
	private String jingbanrenshouji;
	//填表日期
	private Date tianbiaoriqi;
	//人口密集区
	private String renkoumijiqu;
	//重大危险源
	private String zhongdaweixianyuan;
	//应急措施
	private String yingjicuoshi;
	//重点监控
	private String zhongdianjiankong;
	//备注
	private String beizhu;
	//所在乡镇
	private String suozaixiangzhen;
	//乡镇代码
	private String suozaixiangzhen_daima;
	//所在村
	private String suozaicun;

	//
	private Date fr_riqi;
	//
	private Date jbr_riqi;
	//监察机构负责人
	private String jcjg_fuzeren;
	//监察机构日期
	private Date jcjg_riqi;
	
	//登记类别
	private String dengjileibie;
	//设备品种
	private String shebeipinzhong;
	//设备品种代码
	private String shebeipinzhongdaima;
	//压力容器品种
	private String ylrq_pinzhong;
	//设计使用年限
	private String shejishiyongnianxian;
	//固定资产
	private String gudingzichan;
	//单位性质
	private String danweixingzhi;
	//所属行业
	private String suoshuhangye;
	//运行状态   用途
	private String yxzt_yongtu;
	//  运行状态运行方式
	private String yxzt_yunxingfangshi;
	//  运行状态用途2
	private String yxzt_yongtu_2;
	//经度
	private String jingdu;
	//纬度
	private String weidu;
	//海拔高度
	private String haibagaodu;
	//充气单位性质
	private String cqdw_xingzhi;
	//充气单位所属行业
	private String cqdw_suoshuhangye;
	//充气单位电话
	private String cqdw_dianhua;
	//充气单位负责人
	private String cqdw_fuzeren;
	//设备用途
	private String shebeiyongtu;
	//产品合格证编号
	private String chanpinhegezhengbianhao;
	//设计许可证编号
	private String shejixukezhengbianhao;
	//产品图号
	private String chanpintuhao;
	//制造监检证书
	private String zhizaojianjianzhengshu;
	//型式试验机构
	private String xingshishiyanjiegou;
	//试验机构核准证
	private String shiyanjiegouhezhunzheng;
	//试验机构核准证
	private String xingshishiyanzhengshu;
	//制造监检机构 
	private String zhizaojianjianjigou;
	//监检机构核准证
	private String jianjianjigouhezhunzheng;
	//施工类别
	private String shigongleibie;
	//保险机构
	private String baoxianjigou;
	//保险机构代码
	private String baoxianjigoudaima;
	//保险品种
	private String baoxianpinzhong;
	//保险价值
	private String baoxianjiazhi;
	//保险费
	private String baoxianfei;
	//保险金额
	private String baoxianjine;
	//变动原因
	private String biandongyuanyin;
	private String biandongxiangmu_2;
	private String biandongfangshi_2;
	private String biandongyuanyin_2;
	private Date biandongriqi_2;
	private String biandongxiangmu_3;
	private String biandongfangshi_3;
	private String biandongyuanyin_3;
	private Date biandongriqi_3;
	
	//管道

	//编号
	private String bianhao;
	//主管部门
	private String zhuguanbumen;
	//审核日期
	private Date shenheriqi;
	//审核意见
	private String shenheyijian;

	//设备种类
	private String shebeizhonglei;
	//设备种类代码
	private String shebeizhongleidaima;
	//职工人数
	private String zhigongrenshu;
	//年产值
	private String nianchanzhi;
	//制造监检日期
	private Date zhizaojianjianriqi;
	//安装日期
	private Date anzhuangriqi;
	//安装监检日期
	private Date anzhuangjianjianriqi;
	//安装监检机构
	private String anzhuangjianjianjigou;

	private String filepath;
	private String fj_filepath;
	private String tjstate = "0";
	//操作人机构代码
	private String organ_code;
	
	
	//是否吊运熔融金属（起重机专用）
	private String shifou_dyrrjs; // 是 或 否
	
	private String shiyongdanwei_nyr;//使用单位盖章处的年月日
	private String dengjijiguan_nyr;//登记机关盖章处的年月日
	private String creat_user;//创建注册登记人账号    企业单位使用
	private String wtg_yuanyin;//企业单位提交的注册登记  不通过原因
	
	private String sydw_gudingdianhua;//使用单位固定电话
	private String tianbiaorenyuan;
	private Date aqglry_riqi;
	private String shebeishuliang;
	
	private Date hzb_tianbiaoriqi;
	private String hzb_jingbanren;
	private String hzb_lianxidianhua;
	private String hzb_dianziyouxiang;
	//使用登记证流水号
	private String djz_liushuihao; 
	//使用登记证前半段
	private String djz_bf;
	//使用登记证后半段
	private String djz_af;
	private String zhizaojianjianjigou_daima;
	
	private String chanpinpinpai; // 互联网+ 产品品牌
	
	public String getChanpinpinpai() {
		return chanpinpinpai;
	}
	public void setChanpinpinpai(String chanpinpinpai) {
		this.chanpinpinpai = chanpinpinpai;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getZhucedengjijigou() {
		return zhucedengjijigou;
	}
	public void setZhucedengjijigou(String zhucedengjijigou) {
		this.zhucedengjijigou = zhucedengjijigou;
	}
	public Date getZhucedengjiriqi() {
		return zhucedengjiriqi;
	}
	public void setZhucedengjiriqi(Date zhucedengjiriqi) {
		this.zhucedengjiriqi = zhucedengjiriqi;
	}
	public String getZhucedaima() {
		return zhucedaima;
	}
	public void setZhucedaima(String zhucedaima) {
		this.zhucedaima = zhucedaima;
	}
	public Date getGengxinriqi() {
		return gengxinriqi;
	}
	public void setGengxinriqi(Date gengxinriqi) {
		this.gengxinriqi = gengxinriqi;
	}
	public String getNeibubianhao() {
		return neibubianhao;
	}
	public void setNeibubianhao(String neibubianhao) {
		this.neibubianhao = neibubianhao;
	}
	public String getPaizhaobianhao() {
		return paizhaobianhao;
	}
	public void setPaizhaobianhao(String paizhaobianhao) {
		this.paizhaobianhao = paizhaobianhao;
	}
	public String getZhucedengjirenyuan() {
		return zhucedengjirenyuan;
	}
	public void setZhucedengjirenyuan(String zhucedengjirenyuan) {
		this.zhucedengjirenyuan = zhucedengjirenyuan;
	}
	public String getChanquandanwei() {
		return chanquandanwei;
	}
	public void setChanquandanwei(String chanquandanwei) {
		this.chanquandanwei = chanquandanwei;
	}
	public String getChanquandanweidaima() {
		return chanquandanweidaima;
	}
	public void setChanquandanweidaima(String chanquandanweidaima) {
		this.chanquandanweidaima = chanquandanweidaima;
	}
	public String getChanquandanweidizhi() {
		return chanquandanweidizhi;
	}
	public void setChanquandanweidizhi(String chanquandanweidizhi) {
		this.chanquandanweidizhi = chanquandanweidizhi;
	}
	public String getCqdw_youzhengbianma() {
		return cqdw_youzhengbianma;
	}
	public void setCqdw_youzhengbianma(String cqdwYouzhengbianma) {
		cqdw_youzhengbianma = cqdwYouzhengbianma;
	}
	public String getDanweifarendaibiao() {
		return danweifarendaibiao;
	}
	public void setDanweifarendaibiao(String danweifarendaibiao) {
		this.danweifarendaibiao = danweifarendaibiao;
	}
	public String getFarenlianxidianhua() {
		return farenlianxidianhua;
	}
	public void setFarenlianxidianhua(String farenlianxidianhua) {
		this.farenlianxidianhua = farenlianxidianhua;
	}
	public String getShiyongdanwei() {
		return shiyongdanwei;
	}
	public void setShiyongdanwei(String shiyongdanwei) {
		this.shiyongdanwei = shiyongdanwei;
	}
	public String getShiyongdanweidaima() {
		return shiyongdanweidaima;
	}
	public void setShiyongdanweidaima(String shiyongdanweidaima) {
		this.shiyongdanweidaima = shiyongdanweidaima;
	}
	public String getShiyongdanweidizhi() {
		return shiyongdanweidizhi;
	}
	public void setShiyongdanweidizhi(String shiyongdanweidizhi) {
		this.shiyongdanweidizhi = shiyongdanweidizhi;
	}
	public String getSydw_youzhengbianma() {
		return sydw_youzhengbianma;
	}
	public void setSydw_youzhengbianma(String sydwYouzhengbianma) {
		sydw_youzhengbianma = sydwYouzhengbianma;
	}
	public String getAnquanguanlibumen() {
		return anquanguanlibumen;
	}
	public void setAnquanguanlibumen(String anquanguanlibumen) {
		this.anquanguanlibumen = anquanguanlibumen;
	}
	public String getAnquanguanlirenyuan() {
		return anquanguanlirenyuan;
	}
	public void setAnquanguanlirenyuan(String anquanguanlirenyuan) {
		this.anquanguanlirenyuan = anquanguanlirenyuan;
	}
	public String getAqglry_lianxidianhua() {
		return aqglry_lianxidianhua;
	}
	public void setAqglry_lianxidianhua(String aqglryLianxidianhua) {
		aqglry_lianxidianhua = aqglryLianxidianhua;
	}
	public String getShiyongdidian() {
		return shiyongdidian;
	}
	public void setShiyongdidian(String shiyongdidian) {
		this.shiyongdidian = shiyongdidian;
	}
	public String getCaozuorenyuan() {
		return caozuorenyuan;
	}
	public void setCaozuorenyuan(String caozuorenyuan) {
		this.caozuorenyuan = caozuorenyuan;
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
	public String getShebeimingcheng() {
		return shebeimingcheng;
	}
	public void setShebeimingcheng(String shebeimingcheng) {
		this.shebeimingcheng = shebeimingcheng;
	}
	public String getShebeixinghao() {
		return shebeixinghao;
	}
	public void setShebeixinghao(String shebeixinghao) {
		this.shebeixinghao = shebeixinghao;
	}
	public String getShejidanwei() {
		return shejidanwei;
	}
	public void setShejidanwei(String shejidanwei) {
		this.shejidanwei = shejidanwei;
	}
	public String getShejidanweidaima() {
		return shejidanweidaima;
	}
	public void setShejidanweidaima(String shejidanweidaima) {
		this.shejidanweidaima = shejidanweidaima;
	}
	public String getZhizaodanwei() {
		return zhizaodanwei;
	}
	public void setZhizaodanwei(String zhizaodanwei) {
		this.zhizaodanwei = zhizaodanwei;
	}
	public String getZhizaodanweidaima() {
		return zhizaodanweidaima;
	}
	public void setZhizaodanweidaima(String zhizaodanweidaima) {
		this.zhizaodanweidaima = zhizaodanweidaima;
	}
	public String getZzdw_zigezhengshumingcheng() {
		return zzdw_zigezhengshumingcheng;
	}
	public void setZzdw_zigezhengshumingcheng(String zzdwZigezhengshumingcheng) {
		zzdw_zigezhengshumingcheng = zzdwZigezhengshumingcheng;
	}
	public String getZzdw_zigezhengshuhao() {
		return zzdw_zigezhengshuhao;
	}
	public void setZzdw_zigezhengshuhao(String zzdwZigezhengshuhao) {
		zzdw_zigezhengshuhao = zzdwZigezhengshuhao;
	}
	public String getZzdw_lianxidianhua() {
		return zzdw_lianxidianhua;
	}
	public void setZzdw_lianxidianhua(String zzdwLianxidianhua) {
		zzdw_lianxidianhua = zzdwLianxidianhua;
	}
	public Date getZhizaoriqi() {
		return zhizaoriqi;
	}
	public void setZhizaoriqi(Date zhizaoriqi) {
		this.zhizaoriqi = zhizaoriqi;
	}
	public String getChuchangbianhao() {
		return chuchangbianhao;
	}
	public void setChuchangbianhao(String chuchangbianhao) {
		this.chuchangbianhao = chuchangbianhao;
	}
	public String getShiyongchanghe() {
		return shiyongchanghe;
	}
	public void setShiyongchanghe(String shiyongchanghe) {
		this.shiyongchanghe = shiyongchanghe;
	}
	public String getAnzhuangdanwei() {
		return anzhuangdanwei;
	}
	public void setAnzhuangdanwei(String anzhuangdanwei) {
		this.anzhuangdanwei = anzhuangdanwei;
	}
	public String getAnzhuangdanweidaima() {
		return anzhuangdanweidaima;
	}
	public void setAnzhuangdanweidaima(String anzhuangdanweidaima) {
		this.anzhuangdanweidaima = anzhuangdanweidaima;
	}
	public String getAzdw_zigezhengshubianhao() {
		return azdw_zigezhengshubianhao;
	}
	public void setAzdw_zigezhengshubianhao(String azdwZigezhengshubianhao) {
		azdw_zigezhengshubianhao = azdwZigezhengshubianhao;
	}
	public String getXiangmufuzeren() {
		return xiangmufuzeren;
	}
	public void setXiangmufuzeren(String xiangmufuzeren) {
		this.xiangmufuzeren = xiangmufuzeren;
	}
	public String getXmfzr_lianxidianhua() {
		return xmfzr_lianxidianhua;
	}
	public void setXmfzr_lianxidianhua(String xmfzrLianxidianhua) {
		xmfzr_lianxidianhua = xmfzrLianxidianhua;
	}
	public String getShigongdanwei() {
		return shigongdanwei;
	}
	public void setShigongdanwei(String shigongdanwei) {
		this.shigongdanwei = shigongdanwei;
	}
	public Date getShigongriqi() {
		return shigongriqi;
	}
	public void setShigongriqi(Date shigongriqi) {
		this.shigongriqi = shigongriqi;
	}
	public String getYanshoudanwei() {
		return yanshoudanwei;
	}
	public void setYanshoudanwei(String yanshoudanwei) {
		this.yanshoudanwei = yanshoudanwei;
	}
	public Date getJungongriqi() {
		return jungongriqi;
	}
	public void setJungongriqi(Date jungongriqi) {
		this.jungongriqi = jungongriqi;
	}
	public String getYanshoujianyanjigou() {
		return yanshoujianyanjigou;
	}
	public void setYanshoujianyanjigou(String yanshoujianyanjigou) {
		this.yanshoujianyanjigou = yanshoujianyanjigou;
	}
	public String getYanshoubaogaobianhao() {
		return yanshoubaogaobianhao;
	}
	public void setYanshoubaogaobianhao(String yanshoubaogaobianhao) {
		this.yanshoubaogaobianhao = yanshoubaogaobianhao;
	}
	public Date getTouyongriqi() {
		return touyongriqi;
	}
	public void setTouyongriqi(Date touyongriqi) {
		this.touyongriqi = touyongriqi;
	}
	public String getWeibaozhouqi() {
		return weibaozhouqi;
	}
	public void setWeibaozhouqi(String weibaozhouqi) {
		this.weibaozhouqi = weibaozhouqi;
	}
	public String getDaxiuzhouqi() {
		return daxiuzhouqi;
	}
	public void setDaxiuzhouqi(String daxiuzhouqi) {
		this.daxiuzhouqi = daxiuzhouqi;
	}
	public String getWeibaodanwei() {
		return weibaodanwei;
	}
	public void setWeibaodanwei(String weibaodanwei) {
		this.weibaodanwei = weibaodanwei;
	}
	public String getWeibaodanweidaima() {
		return weibaodanweidaima;
	}
	public void setWeibaodanweidaima(String weibaodanweidaima) {
		this.weibaodanweidaima = weibaodanweidaima;
	}
	public String getWbdw_zigezhengshuhao() {
		return wbdw_zigezhengshuhao;
	}
	public void setWbdw_zigezhengshuhao(String wbdwZigezhengshuhao) {
		wbdw_zigezhengshuhao = wbdwZigezhengshuhao;
	}
	public String getWeibaofuzeren() {
		return weibaofuzeren;
	}
	public void setWeibaofuzeren(String weibaofuzeren) {
		this.weibaofuzeren = weibaofuzeren;
	}
	public String getWeibaofuzerendianhua() {
		return weibaofuzerendianhua;
	}
	public void setWeibaofuzerendianhua(String weibaofuzerendianhua) {
		this.weibaofuzerendianhua = weibaofuzerendianhua;
	}
	public String getChejianfenchang() {
		return chejianfenchang;
	}
	public void setChejianfenchang(String chejianfenchang) {
		this.chejianfenchang = chejianfenchang;
	}
	public String getJianyandanwei() {
		return jianyandanwei;
	}
	public void setJianyandanwei(String jianyandanwei) {
		this.jianyandanwei = jianyandanwei;
	}
	public String getJianyandanweidaima() {
		return jianyandanweidaima;
	}
	public void setJianyandanweidaima(String jianyandanweidaima) {
		this.jianyandanweidaima = jianyandanweidaima;
	}
	public Date getJianyanriqi() {
		return jianyanriqi;
	}
	public void setJianyanriqi(Date jianyanriqi) {
		this.jianyanriqi = jianyanriqi;
	}
	public String getJianyanleibie() {
		return jianyanleibie;
	}
	public void setJianyanleibie(String jianyanleibie) {
		this.jianyanleibie = jianyanleibie;
	}
	public String getZhuyaowenti() {
		return zhuyaowenti;
	}
	public void setZhuyaowenti(String zhuyaowenti) {
		this.zhuyaowenti = zhuyaowenti;
	}
	public String getJianyanjielun() {
		return jianyanjielun;
	}
	public void setJianyanjielun(String jianyanjielun) {
		this.jianyanjielun = jianyanjielun;
	}
	public String getBaogaoshubianhao() {
		return baogaoshubianhao;
	}
	public void setBaogaoshubianhao(String baogaoshubianhao) {
		this.baogaoshubianhao = baogaoshubianhao;
	}
	public Date getXiacijianyanriqi() {
		return xiacijianyanriqi;
	}
	public void setXiacijianyanriqi(Date xiacijianyanriqi) {
		this.xiacijianyanriqi = xiacijianyanriqi;
	}
	public String getShiguleibie() {
		return shiguleibie;
	}
	public void setShiguleibie(String shiguleibie) {
		this.shiguleibie = shiguleibie;
	}
	public Date getShigufashengriqi() {
		return shigufashengriqi;
	}
	public void setShigufashengriqi(Date shigufashengriqi) {
		this.shigufashengriqi = shigufashengriqi;
	}
	public String getShiguchulijieguo() {
		return shiguchulijieguo;
	}
	public void setShiguchulijieguo(String shiguchulijieguo) {
		this.shiguchulijieguo = shiguchulijieguo;
	}
	public String getBiandongfangshi() {
		return biandongfangshi;
	}
	public void setBiandongfangshi(String biandongfangshi) {
		this.biandongfangshi = biandongfangshi;
	}
	public String getBiandongxiangmu() {
		return biandongxiangmu;
	}
	public void setBiandongxiangmu(String biandongxiangmu) {
		this.biandongxiangmu = biandongxiangmu;
	}
	public Date getBiandongriqi() {
		return biandongriqi;
	}
	public void setBiandongriqi(Date biandongriqi) {
		this.biandongriqi = biandongriqi;
	}
	public String getChengdandanwei() {
		return chengdandanwei;
	}
	public void setChengdandanwei(String chengdandanwei) {
		this.chengdandanwei = chengdandanwei;
	}
	public String getChengdandanweidaima() {
		return chengdandanweidaima;
	}
	public void setChengdandanweidaima(String chengdandanweidaima) {
		this.chengdandanweidaima = chengdandanweidaima;
	}
	public String getShiyongdengjizhenghaoma() {
		return shiyongdengjizhenghaoma;
	}
	public void setShiyongdengjizhenghaoma(String shiyongdengjizhenghaoma) {
		this.shiyongdengjizhenghaoma = shiyongdengjizhenghaoma;
	}
	public String getShiyongdanweidizhi_shi() {
		return shiyongdanweidizhi_shi;
	}
	public void setShiyongdanweidizhi_shi(String shiyongdanweidizhiShi) {
		shiyongdanweidizhi_shi = shiyongdanweidizhiShi;
	}
	public String getShiyongdanweidizhi_qu() {
		return shiyongdanweidizhi_qu;
	}
	public void setShiyongdanweidizhi_qu(String shiyongdanweidizhiQu) {
		shiyongdanweidizhi_qu = shiyongdanweidizhiQu;
	}
	public String getSydw_fadingdaibiaoren() {
		return sydw_fadingdaibiaoren;
	}
	public void setSydw_fadingdaibiaoren(String sydwFadingdaibiaoren) {
		sydw_fadingdaibiaoren = sydwFadingdaibiaoren;
	}
	public String getSydw_farendianhua() {
		return sydw_farendianhua;
	}
	public void setSydw_farendianhua(String sydwFarendianhua) {
		sydw_farendianhua = sydwFarendianhua;
	}
	public String getSydw_farenemail() {
		return sydw_farenemail;
	}
	public void setSydw_farenemail(String sydwFarenemail) {
		sydw_farenemail = sydwFarenemail;
	}
	public String getSydw_farenchuanzhen() {
		return sydw_farenchuanzhen;
	}
	public void setSydw_farenchuanzhen(String sydwFarenchuanzhen) {
		sydw_farenchuanzhen = sydwFarenchuanzhen;
	}
	public String getZhuguanfuzeren() {
		return zhuguanfuzeren;
	}
	public void setZhuguanfuzeren(String zhuguanfuzeren) {
		this.zhuguanfuzeren = zhuguanfuzeren;
	}
	public String getZhuguanfuzerendianhua() {
		return zhuguanfuzerendianhua;
	}
	public void setZhuguanfuzerendianhua(String zhuguanfuzerendianhua) {
		this.zhuguanfuzerendianhua = zhuguanfuzerendianhua;
	}
	public String getJingbanren() {
		return jingbanren;
	}
	public void setJingbanren(String jingbanren) {
		this.jingbanren = jingbanren;
	}
	public String getJingbanrendianhua() {
		return jingbanrendianhua;
	}
	public void setJingbanrendianhua(String jingbanrendianhua) {
		this.jingbanrendianhua = jingbanrendianhua;
	}
	public String getJingbanrenshouji() {
		return jingbanrenshouji;
	}
	public void setJingbanrenshouji(String jingbanrenshouji) {
		this.jingbanrenshouji = jingbanrenshouji;
	}
	public Date getTianbiaoriqi() {
		return tianbiaoriqi;
	}
	public void setTianbiaoriqi(Date tianbiaoriqi) {
		this.tianbiaoriqi = tianbiaoriqi;
	}
	public String getRenkoumijiqu() {
		return renkoumijiqu;
	}
	public void setRenkoumijiqu(String renkoumijiqu) {
		this.renkoumijiqu = renkoumijiqu;
	}
	public String getZhongdaweixianyuan() {
		return zhongdaweixianyuan;
	}
	public void setZhongdaweixianyuan(String zhongdaweixianyuan) {
		this.zhongdaweixianyuan = zhongdaweixianyuan;
	}
	public String getYingjicuoshi() {
		return yingjicuoshi;
	}
	public void setYingjicuoshi(String yingjicuoshi) {
		this.yingjicuoshi = yingjicuoshi;
	}
	public String getZhongdianjiankong() {
		return zhongdianjiankong;
	}
	public void setZhongdianjiankong(String zhongdianjiankong) {
		this.zhongdianjiankong = zhongdianjiankong;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public String getSuozaixiangzhen() {
		return suozaixiangzhen;
	}
	public void setSuozaixiangzhen(String suozaixiangzhen) {
		this.suozaixiangzhen = suozaixiangzhen;
	}
	public String getSuozaicun() {
		return suozaicun;
	}
	public void setSuozaicun(String suozaicun) {
		this.suozaicun = suozaicun;
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
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getGuolufangleixing() {
		return guolufangleixing;
	}
	public void setGuolufangleixing(String guolufangleixing) {
		this.guolufangleixing = guolufangleixing;
	}
	public String getZhizaoguo() {
		return zhizaoguo;
	}
	public void setZhizaoguo(String zhizaoguo) {
		this.zhizaoguo = zhizaoguo;
	}
	public String getJianjiandanwei() {
		return jianjiandanwei;
	}
	public void setJianjiandanwei(String jianjiandanwei) {
		this.jianjiandanwei = jianjiandanwei;
	}
	public String getJianjiandanweidaima() {
		return jianjiandanweidaima;
	}
	public void setJianjiandanweidaima(String jianjiandanweidaima) {
		this.jianjiandanweidaima = jianjiandanweidaima;
	}
	public String getJiegouxingshi() {
		return jiegouxingshi;
	}
	public void setJiegouxingshi(String jiegouxingshi) {
		this.jiegouxingshi = jiegouxingshi;
	}
	public Date getFr_riqi() {
		return fr_riqi;
	}
	public void setFr_riqi(Date frRiqi) {
		fr_riqi = frRiqi;
	}
	public Date getJbr_riqi() {
		return jbr_riqi;
	}
	public void setJbr_riqi(Date jbrRiqi) {
		jbr_riqi = jbrRiqi;
	}
	public String getJcjg_fuzeren() {
		return jcjg_fuzeren;
	}
	public void setJcjg_fuzeren(String jcjgFuzeren) {
		jcjg_fuzeren = jcjgFuzeren;
	}
	public Date getJcjg_riqi() {
		return jcjg_riqi;
	}
	public void setJcjg_riqi(Date jcjgRiqi) {
		jcjg_riqi = jcjgRiqi;
	}
	public String getDengjileibie() {
		return dengjileibie;
	}
	public void setDengjileibie(String dengjileibie) {
		this.dengjileibie = dengjileibie;
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
	public String getYlrq_pinzhong() {
		return ylrq_pinzhong;
	}
	public void setYlrq_pinzhong(String ylrqPinzhong) {
		ylrq_pinzhong = ylrqPinzhong;
	}
	public String getShejishiyongnianxian() {
		return shejishiyongnianxian;
	}
	public void setShejishiyongnianxian(String shejishiyongnianxian) {
		this.shejishiyongnianxian = shejishiyongnianxian;
	}
	public String getGudingzichan() {
		return gudingzichan;
	}
	public void setGudingzichan(String gudingzichan) {
		this.gudingzichan = gudingzichan;
	}
	public String getDanweixingzhi() {
		return danweixingzhi;
	}
	public void setDanweixingzhi(String danweixingzhi) {
		this.danweixingzhi = danweixingzhi;
	}
	public String getSuoshuhangye() {
		return suoshuhangye;
	}
	public void setSuoshuhangye(String suoshuhangye) {
		this.suoshuhangye = suoshuhangye;
	}
	public String getYxzt_yongtu() {
		return yxzt_yongtu;
	}
	public void setYxzt_yongtu(String yxztYongtu) {
		yxzt_yongtu = yxztYongtu;
	}
	public String getYxzt_yunxingfangshi() {
		return yxzt_yunxingfangshi;
	}
	public void setYxzt_yunxingfangshi(String yxztYunxingfangshi) {
		yxzt_yunxingfangshi = yxztYunxingfangshi;
	}
	public String getYxzt_yongtu_2() {
		return yxzt_yongtu_2;
	}
	public void setYxzt_yongtu_2(String yxztYongtu_2) {
		yxzt_yongtu_2 = yxztYongtu_2;
	}
	public String getJingdu() {
		return jingdu;
	}
	public void setJingdu(String jingdu) {
		this.jingdu = jingdu;
	}
	public String getWeidu() {
		return weidu;
	}
	public void setWeidu(String weidu) {
		this.weidu = weidu;
	}
	public String getHaibagaodu() {
		return haibagaodu;
	}
	public void setHaibagaodu(String haibagaodu) {
		this.haibagaodu = haibagaodu;
	}
	public String getCqdw_xingzhi() {
		return cqdw_xingzhi;
	}
	public void setCqdw_xingzhi(String cqdwXingzhi) {
		cqdw_xingzhi = cqdwXingzhi;
	}
	public String getCqdw_suoshuhangye() {
		return cqdw_suoshuhangye;
	}
	public void setCqdw_suoshuhangye(String cqdwSuoshuhangye) {
		cqdw_suoshuhangye = cqdwSuoshuhangye;
	}
	public String getCqdw_dianhua() {
		return cqdw_dianhua;
	}
	public void setCqdw_dianhua(String cqdwDianhua) {
		cqdw_dianhua = cqdwDianhua;
	}
	public String getChanpinhegezhengbianhao() {
		return chanpinhegezhengbianhao;
	}
	public void setChanpinhegezhengbianhao(String chanpinhegezhengbianhao) {
		this.chanpinhegezhengbianhao = chanpinhegezhengbianhao;
	}
	public String getShejixukezhengbianhao() {
		return shejixukezhengbianhao;
	}
	public void setShejixukezhengbianhao(String shejixukezhengbianhao) {
		this.shejixukezhengbianhao = shejixukezhengbianhao;
	}
	public String getChanpintuhao() {
		return chanpintuhao;
	}
	public void setChanpintuhao(String chanpintuhao) {
		this.chanpintuhao = chanpintuhao;
	}
	public String getZhizaojianjianzhengshu() {
		return zhizaojianjianzhengshu;
	}
	public void setZhizaojianjianzhengshu(String zhizaojianjianzhengshu) {
		this.zhizaojianjianzhengshu = zhizaojianjianzhengshu;
	}
	public String getXingshishiyanjiegou() {
		return xingshishiyanjiegou;
	}
	public void setXingshishiyanjiegou(String xingshishiyanjiegou) {
		this.xingshishiyanjiegou = xingshishiyanjiegou;
	}
	public String getShiyanjiegouhezhunzheng() {
		return shiyanjiegouhezhunzheng;
	}
	public void setShiyanjiegouhezhunzheng(String shiyanjiegouhezhunzheng) {
		this.shiyanjiegouhezhunzheng = shiyanjiegouhezhunzheng;
	}
	public String getXingshishiyanzhengshu() {
		return xingshishiyanzhengshu;
	}
	public void setXingshishiyanzhengshu(String xingshishiyanzhengshu) {
		this.xingshishiyanzhengshu = xingshishiyanzhengshu;
	}
	public String getZhizaojianjianjigou() {
		return zhizaojianjianjigou;
	}
	public void setZhizaojianjianjigou(String zhizaojianjianjigou) {
		this.zhizaojianjianjigou = zhizaojianjianjigou;
	}
	public String getJianjianjigouhezhunzheng() {
		return jianjianjigouhezhunzheng;
	}
	public void setJianjianjigouhezhunzheng(String jianjianjigouhezhunzheng) {
		this.jianjianjigouhezhunzheng = jianjianjigouhezhunzheng;
	}
	public String getShigongleibie() {
		return shigongleibie;
	}
	public void setShigongleibie(String shigongleibie) {
		this.shigongleibie = shigongleibie;
	}
	public String getBaoxianjigou() {
		return baoxianjigou;
	}
	public void setBaoxianjigou(String baoxianjigou) {
		this.baoxianjigou = baoxianjigou;
	}
	public String getBaoxianpinzhong() {
		return baoxianpinzhong;
	}
	public void setBaoxianpinzhong(String baoxianpinzhong) {
		this.baoxianpinzhong = baoxianpinzhong;
	}
	public String getBaoxianjiazhi() {
		return baoxianjiazhi;
	}
	public void setBaoxianjiazhi(String baoxianjiazhi) {
		this.baoxianjiazhi = baoxianjiazhi;
	}
	public String getBaoxianfei() {
		return baoxianfei;
	}
	public void setBaoxianfei(String baoxianfei) {
		this.baoxianfei = baoxianfei;
	}
	public String getBaoxianjine() {
		return baoxianjine;
	}
	public void setBaoxianjine(String baoxianjine) {
		this.baoxianjine = baoxianjine;
	}
	public String getBiandongyuanyin() {
		return biandongyuanyin;
	}
	public void setBiandongyuanyin(String biandongyuanyin) {
		this.biandongyuanyin = biandongyuanyin;
	}
	public String getBiandongxiangmu_2() {
		return biandongxiangmu_2;
	}
	public void setBiandongxiangmu_2(String biandongxiangmu_2) {
		this.biandongxiangmu_2 = biandongxiangmu_2;
	}
	public String getBiandongfangshi_2() {
		return biandongfangshi_2;
	}
	public void setBiandongfangshi_2(String biandongfangshi_2) {
		this.biandongfangshi_2 = biandongfangshi_2;
	}
	public String getBiandongyuanyin_2() {
		return biandongyuanyin_2;
	}
	public void setBiandongyuanyin_2(String biandongyuanyin_2) {
		this.biandongyuanyin_2 = biandongyuanyin_2;
	}
	public Date getBiandongriqi_2() {
		return biandongriqi_2;
	}
	public void setBiandongriqi_2(Date biandongriqi_2) {
		this.biandongriqi_2 = biandongriqi_2;
	}
	public String getBiandongxiangmu_3() {
		return biandongxiangmu_3;
	}
	public void setBiandongxiangmu_3(String biandongxiangmu_3) {
		this.biandongxiangmu_3 = biandongxiangmu_3;
	}
	public String getBiandongfangshi_3() {
		return biandongfangshi_3;
	}
	public void setBiandongfangshi_3(String biandongfangshi_3) {
		this.biandongfangshi_3 = biandongfangshi_3;
	}
	public String getBiandongyuanyin_3() {
		return biandongyuanyin_3;
	}
	public void setBiandongyuanyin_3(String biandongyuanyin_3) {
		this.biandongyuanyin_3 = biandongyuanyin_3;
	}
	public Date getBiandongriqi_3() {
		return biandongriqi_3;
	}
	public void setBiandongriqi_3(Date biandongriqi_3) {
		this.biandongriqi_3 = biandongriqi_3;
	}
	public String getBianhao() {
		return bianhao;
	}
	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}
	public String getZhuguanbumen() {
		return zhuguanbumen;
	}
	public void setZhuguanbumen(String zhuguanbumen) {
		this.zhuguanbumen = zhuguanbumen;
	}
	public Date getShenheriqi() {
		return shenheriqi;
	}
	public void setShenheriqi(Date shenheriqi) {
		this.shenheriqi = shenheriqi;
	}
	public String getShenheyijian() {
		return shenheyijian;
	}
	public void setShenheyijian(String shenheyijian) {
		this.shenheyijian = shenheyijian;
	}
	public String getWeibaoxingshi() {
		return weibaoxingshi;
	}
	public void setWeibaoxingshi(String weibaoxingshi) {
		this.weibaoxingshi = weibaoxingshi;
	}
	public String getCqdw_fuzeren() {
		return cqdw_fuzeren;
	}
	public void setCqdw_fuzeren(String cqdwFuzeren) {
		cqdw_fuzeren = cqdwFuzeren;
	}
	public String getShebeiyongtu() {
		return shebeiyongtu;
	}
	public void setShebeiyongtu(String shebeiyongtu) {
		this.shebeiyongtu = shebeiyongtu;
	}
	public String getBaoxianjigoudaima() {
		return baoxianjigoudaima;
	}
	public void setBaoxianjigoudaima(String baoxianjigoudaima) {
		this.baoxianjigoudaima = baoxianjigoudaima;
	}
	public String getFj_filepath() {
		return fj_filepath;
	}
	public void setFj_filepath(String fjFilepath) {
		fj_filepath = fjFilepath;
	}
	public String getShiyongdanweidizhi_shi_daima() {
		return shiyongdanweidizhi_shi_daima;
	}
	public void setShiyongdanweidizhi_shi_daima(String shiyongdanweidizhiShiDaima) {
		shiyongdanweidizhi_shi_daima = shiyongdanweidizhiShiDaima;
	}
	public String getShiyongdanweidizhi_qu_daima() {
		return shiyongdanweidizhi_qu_daima;
	}
	public void setShiyongdanweidizhi_qu_daima(String shiyongdanweidizhiQuDaima) {
		shiyongdanweidizhi_qu_daima = shiyongdanweidizhiQuDaima;
	}
	public String getSuozaixiangzhen_daima() {
		return suozaixiangzhen_daima;
	}
	public void setSuozaixiangzhen_daima(String suozaixiangzhenDaima) {
		suozaixiangzhen_daima = suozaixiangzhenDaima;
	}
	public String getTjstate() {
		return tjstate;
	}
	public void setTjstate(String tjstate) {
		this.tjstate = tjstate;
	}
	public String getCqdw_guanlifuzeren() {
		return cqdw_guanlifuzeren;
	}
	public void setCqdw_guanlifuzeren(String cqdwGuanlifuzeren) {
		cqdw_guanlifuzeren = cqdwGuanlifuzeren;
	}
	public String getChanquandanweidizhi_shi() {
		return chanquandanweidizhi_shi;
	}
	public void setChanquandanweidizhi_shi(String chanquandanweidizhiShi) {
		chanquandanweidizhi_shi = chanquandanweidizhiShi;
	}
	public String getChanquandanweidizhi_shi_daima() {
		return chanquandanweidizhi_shi_daima;
	}
	public void setChanquandanweidizhi_shi_daima(String chanquandanweidizhiShiDaima) {
		chanquandanweidizhi_shi_daima = chanquandanweidizhiShiDaima;
	}
	public String getChanquandanweidizhi_qu() {
		return chanquandanweidizhi_qu;
	}
	public void setChanquandanweidizhi_qu(String chanquandanweidizhiQu) {
		chanquandanweidizhi_qu = chanquandanweidizhiQu;
	}
	public String getChanquandanweidizhi_qu_daima() {
		return chanquandanweidizhi_qu_daima;
	}
	public void setChanquandanweidizhi_qu_daima(String chanquandanweidizhiQuDaima) {
		chanquandanweidizhi_qu_daima = chanquandanweidizhiQuDaima;
	}
	public String getShiyongdidian_shi() {
		return shiyongdidian_shi;
	}
	public void setShiyongdidian_shi(String shiyongdidianShi) {
		shiyongdidian_shi = shiyongdidianShi;
	}
	public String getShiyongdidian_shi_daima() {
		return shiyongdidian_shi_daima;
	}
	public void setShiyongdidian_shi_daima(String shiyongdidianShiDaima) {
		shiyongdidian_shi_daima = shiyongdidianShiDaima;
	}
	public String getShiyongdidian_qu() {
		return shiyongdidian_qu;
	}
	public void setShiyongdidian_qu(String shiyongdidianQu) {
		shiyongdidian_qu = shiyongdidianQu;
	}
	public String getShiyongdidian_qu_daima() {
		return shiyongdidian_qu_daima;
	}
	public void setShiyongdidian_qu_daima(String shiyongdidianQuDaima) {
		shiyongdidian_qu_daima = shiyongdidianQuDaima;
	}
	public String getZhigongrenshu() {
		return zhigongrenshu;
	}
	public void setZhigongrenshu(String zhigongrenshu) {
		this.zhigongrenshu = zhigongrenshu;
	}
	public String getNianchanzhi() {
		return nianchanzhi;
	}
	public void setNianchanzhi(String nianchanzhi) {
		this.nianchanzhi = nianchanzhi;
	}
	public Date getZhizaojianjianriqi() {
		return zhizaojianjianriqi;
	}
	public void setZhizaojianjianriqi(Date zhizaojianjianriqi) {
		this.zhizaojianjianriqi = zhizaojianjianriqi;
	}
	public Date getAnzhuangriqi() {
		return anzhuangriqi;
	}
	public void setAnzhuangriqi(Date anzhuangriqi) {
		this.anzhuangriqi = anzhuangriqi;
	}
	public Date getAnzhuangjianjianriqi() {
		return anzhuangjianjianriqi;
	}
	public void setAnzhuangjianjianriqi(Date anzhuangjianjianriqi) {
		this.anzhuangjianjianriqi = anzhuangjianjianriqi;
	}
	public String getAnzhuangjianjianjigou() {
		return anzhuangjianjianjigou;
	}
	public void setAnzhuangjianjianjigou(String anzhuangjianjianjigou) {
		this.anzhuangjianjianjigou = anzhuangjianjianjigou;
	}
	public String getOrgan_code() {
		return organ_code;
	}
	public void setOrgan_code(String organCode) {
		organ_code = organCode;
	}
	public String getShebeidaima() {
		return shebeidaima;
	}
	public void setShebeidaima(String shebeidaima) {
		this.shebeidaima = shebeidaima;
	}
	public String getZhizaoriqi_str() {
		return zhizaoriqi_str;
	}
	public void setZhizaoriqi_str(String zhizaoriqiStr) {
		zhizaoriqi_str = zhizaoriqiStr;
	}
	public String getTouyongriqi_str() {
		return touyongriqi_str;
	}
	public void setTouyongriqi_str(String touyongriqiStr) {
		touyongriqi_str = touyongriqiStr;
	}
	public String getShifou_dyrrjs() {
		return shifou_dyrrjs;
	}
	public void setShifou_dyrrjs(String shifouDyrrjs) {
		shifou_dyrrjs = shifouDyrrjs;
	}
	public String getShiyongdanwei_nyr() {
		return shiyongdanwei_nyr;
	}
	public void setShiyongdanwei_nyr(String shiyongdanweiNyr) {
		shiyongdanwei_nyr = shiyongdanweiNyr;
	}
	public String getDengjijiguan_nyr() {
		return dengjijiguan_nyr;
	}
	public void setDengjijiguan_nyr(String dengjijiguanNyr) {
		dengjijiguan_nyr = dengjijiguanNyr;
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
	public String getSydw_gudingdianhua() {
		return sydw_gudingdianhua;
	}
	public void setSydw_gudingdianhua(String sydwGudingdianhua) {
		sydw_gudingdianhua = sydwGudingdianhua;
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
	public String getShebeishuliang() {
		return shebeishuliang;
	}
	public void setShebeishuliang(String shebeishuliang) {
		this.shebeishuliang = shebeishuliang;
	}
	public Date getHzb_tianbiaoriqi() {
		return hzb_tianbiaoriqi;
	}
	public void setHzb_tianbiaoriqi(Date hzbTianbiaoriqi) {
		hzb_tianbiaoriqi = hzbTianbiaoriqi;
	}
	public String getHzb_jingbanren() {
		return hzb_jingbanren;
	}
	public void setHzb_jingbanren(String hzbJingbanren) {
		hzb_jingbanren = hzbJingbanren;
	}
	public String getHzb_lianxidianhua() {
		return hzb_lianxidianhua;
	}
	public void setHzb_lianxidianhua(String hzbLianxidianhua) {
		hzb_lianxidianhua = hzbLianxidianhua;
	}
	public String getHzb_dianziyouxiang() {
		return hzb_dianziyouxiang;
	}
	public void setHzb_dianziyouxiang(String hzbDianziyouxiang) {
		hzb_dianziyouxiang = hzbDianziyouxiang;
	}
	public String getDjz_liushuihao() {
		return djz_liushuihao;
	}
	public void setDjz_liushuihao(String djzLiushuihao) {
		djz_liushuihao = djzLiushuihao;
	}
	public String getDjz_bf() {
		return djz_bf;
	}
	public void setDjz_bf(String djzBf) {
		djz_bf = djzBf;
	}
	public String getDjz_af() {
		return djz_af;
	}
	public void setDjz_af(String djzAf) {
		djz_af = djzAf;
	}
	public String getZhizaojianjianjigou_daima() {
		return zhizaojianjianjigou_daima;
	}
	public void setZhizaojianjianjigou_daima(String zhizaojianjianjigouDaima) {
		zhizaojianjianjigou_daima = zhizaojianjianjigouDaima;
	}
	
}
