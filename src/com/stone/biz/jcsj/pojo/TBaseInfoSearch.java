package com.stone.biz.jcsj.pojo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 
 * 设备基本信息
 * 
 */
@Entity
@Table(name="BIZ_SE")
public class TBaseInfoSearch implements java.io.Serializable {
	
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
	private String shenbeipinzhongdaima;
	
	/**
	 * 设备代码
	 */
	private String shebeidaima;
	
	/**
	 * 设备形式
	 */
	private String shebeixingshi;
	
	/**
	 * 设备型号
	 */
	private String shebeixinghao;
	
	/**
	 * 设备出厂编号(产品编号)（气瓶编号）
	 */
	private String chuchangbianhao;
	
	/**
	 * 设备注册代码 
	 */
	private String zhucedaima;
	
	/**
	 * 设备注册日期
	 */
	private Date zhuceriqi;
	
	/**
	 * 内部编号（设备编号）
	 */
	private String neibubianhao;
	
	/**
	 * 设备地点(安装地点）
	 */
	private String shebeididian;
	
	/**
	 * 区划名称
	 */
	private String quhuamingcheng;
	/**
	 * 区划代码
	 */
	private String quhuadaima;
	
	
	
	/**
	 * 是否市直
	 */
	private String szstatus;
	
	/**
	 * 设备状态  0 未报检  1已报检  2 检验中  3 已检验  4 已登记0 领取 
	 */
	private String state;

	/**
	 * 是否锁定(检验中）
	 */
	private String sfshuoding;
	
	/**
	 * 是否注册 0 未注册    1 已注册---定期检监  2  已告知----安装监检  3 已停用  4 改造维修监检 5拆除 6待办 7报废
	 */
	private String zcstatus="0";
	
	
	
	/**
	 * 报检日期 
	 */
	private Date shebeibaojianriqi;
	
	/**
	 * 设备发送状态  0 正常 1 2发送中 3停用申请中  9重新启用申请中 5拆除 10 转移申请中,20,30,40,90 各种请求的不同意状态
	 */
	private String flag = "0";
	/**
	 * 告知作废状态    0未作废   1作废
	 */
	private String zfstate = "0";
	
	//临时数据状态       0  正式数据  1 临时数据   点击保存后生成的数据
	private String tmpData;
	//正式数据的id
	private Long pid;
	
	private String shi;
	private String shidaima;
	private String xiangzhen;
	private String xiangzhendaima;
	
	private String dengjileibie; //登记类别
	
	/**********************************************使用单位*******************************************************/
	/**
	 * 使用单位
	 */
	private Long   shiyongdanweiId;
	private String shiyongdanwei;  //使用单位 
	private String shiyongdanwei_dizhi; //使用单位地址
	private String shiyongdanwei_lianxiren; //使用单位联系人 
	private String shiyongdanwei_lianxidianhua; //使用单位联系电话 
	private String shiyongdanwei_code; //使用单位代码（组织机构统一代码）
	private String shiyongdanwei_chuanzhen; //使用单位传真
	private String shiyongdanwei_youbian; //使用单位邮编
	private String shiyongdanwei_suoshuhangye; //使用单位所属行业
	private String fadingdaibiaoren; //使用单位法定代表人
	private String frdb_dianhua; //使用单位法人联系电话
	private String zhuguanfuzeren; //主管负责人
	private String zhuguanfuzerendianhua; //主管负责人电话
	private String anquanguanlibumen;//安全管理部门
	private String anquanguanli_lianxidianhua;//安全部门联系电话
	private String anquanguanlirenyuan; //安全管理人员
	
	private String shiyongdanwei_caozuorenyuan; //操作人员
	private String shiyongdanwei_xingzhi; //单位性质
	private String shiyongchangsuo; //使用场所（锅炉）
	//职工人数
	private String zhigongrenshu;
	//年产值
	private String nianchanzhi;
	private String tianbiaorenyuan ; //填表人员
	private Date tianbiaoriqi; //填表日期
	private String anquandengji; //安全等级
	private String jianguanleibie; //监管类别
	/**************************************制造单位 ***************************************************************/
	/**
	 * 制造单位 
	 */
	private String zhizaodanwei;

	/**
	 * 制造日期
	 */
	private String zhizaoriqi;
	/**
	 * 制造日期  日期
	 */
	private Date zhizaoriqi_date;
	/**
	 * 制造单位许可证编号
	 */
	private String zhizaodanweixukezhengbianhao;
	private String zhizaodanwei_code; //制造单位代码
	private String zhizaodanwei_zigezhengshu; //制造单位资格证书
	private String zhizaodanwei_lianxidianhua; //制造单位联系电话
	private String zhizaodanwei_shiyongchanghe; //适用场合
	
	private String queren;//确认是否填写制造日期
	private String chanpinhegezhengbianhao; //产品合格证编号
	private String wenjianjiandingjigou; //文件鉴定机构
	private String jiandingbaogaobianhao; //鉴定报告编号
	private String zhizaojianjianjigou; //制造监检机构
	private String jianjianzhengshubianhao; //制造监检证书编号
	private String jianjianhezhunzheng; //制造监检核准证
	private Date zhizaojianjianriqi; //制造监检日期
	/*************** ************************施工单位**************************************************************/
	/**
	 * 施工单位（安装单位）
	 */
	private Long   shigongdanweiId;
	private String shigongdanwei; //施工单位
	private String shigongdanwei_dizhi; //施工单位地址
	private String shigongdanwei_xukezhengbianhao; //施工单位许可证编号
	private String shigongdanwei_jiancheng; //施工单位简称
	private String shigongdanwei_lianxiren; //施工单位联系人
	private String shigongdanwei_lianxidianhua; //施工单位联系电话
	private String shigongdanwei_xkz_youxiaoqi; //施工单位许可证有效期
	private String shigongdanwei_chuanzhen; //施工单位传真
	private String shigongdanwei_youbian; //施工单位邮编
	private String shigongdanwei_daima; //施工单位代码
	/**
	 * 施工类别	
	 */
	private String shigongleibie; 
	/**
	 * 施工类别代码
	 */
	private String shigongleibiedaima;
	private String shigongdanwei_youzhengbianma;//施工单位邮编
	private Date shigongdanwei_shigongriqi; //施工单位施工日期(施工告知日期)
	private Date shigongdanwei_jungongriqi; //施工单位竣工日期
	private String shigongdanwei_faren; //施工单位法人  
	
	/*****************************************产权单位************************************************************/
	//产权单位
	private String chanquandanwei;
	//产权单位地址
	private String chanquandanwei_dizhi;
	//产权单位代码
	private String chanquandanwei_daima;
	private String chanquandanwei_suoshuhangye; //产权单位所属行业
	private String chanquandanwei_farendaibiao; //产权单位法人代表
	private String cqdw_frdbdh; // 产权单位法人电话
	private String chanquandanwei_dianhua; //产权单位电话
	
	private String chanquandanwei_youbian; //产权单位邮政编码
	private String chanquandanwei_xingzhi; //产权单位性质
	
	/************************************设计单位*****************************************************************/
	private String shejidanwei; //设计单位
	private String shejidanweidaima; //设计单位代码
	/*********************************************登记证***************************************************************/
	/**
	 * 使用登记证编号
	 */
	private String dengjizhengbianhao;
	
	/**
	 * 发证日期
	 */
	private Date fazhengriqi;
	/*****************************************************************************************************/
	
	/******************************************维保单位***********************************************************/
	/**
	 * 维护保养单位(电梯专用)
	 */
	private String weihubaoyangdanwei_id;
	private String weihubaoyangdanwei; //维保单位
	private String weihubaoyangdanwei_dianhua; //维保电话
	private String weihubaoyangdanwei_lianxiren; //维保联系人
	private String whbydw_zizhizhengshu; //维保资质证书
	private String weihubaoyangdanwei_code; //维保代码
	
	
	
	
	/*******************************************告知信息*******************************************************/
	/**
	 * 告知编号
	 */
	private String gaozhibianhao;

	/**
	 * 告知 经办人	
	 */
	private String gaozhijingbanren;
	/**
	 * 告知日期
	 */
	private Date gaozhiriqi;
	
	
//	private String zhizaoriqi2;//制造日期月
	
	/**
	 * 告知文件路径
	 */
	private String gz_filepath;
	
	
	/**
	 * 是否是隐患设备    0  不是  1  是
	 */
	private String eqhide = "0";
	
	/**
	 * 标注设备类型
	 */
	private String biaozhuleixing;
	/**
	 * 附件文件路径
	 */
	private String fj_filepath;
	
	
	//变更日期  20160427
	private Date biangengriqi;
	
	
	
	
	/**********************检验单位*********************/
	/********************************************报告信息******************************************************/
	//检验结构
	private String jianyanjigou;
	
	private String jianyanjigou_code; //检验机构代码
	
	/**
	 * 报告编号
	 */
	private String baogaobianhao;
	/**
	 * 报告主键
	 */
	private Long jybg_id;
	/**
	 * 办结后保存检验项目
	 */
	private String bj_jianyanxiangmu;
	
	/**
	 * 报告办结日期 
	 */
	private Date banjieriqi;
	
	/**
	 * 设备信息使用  保存 报告结论
	 */
	private String jianyanjielun;
	
	/**
	 * 检验类型 1 定期 2 监检 3 制造
	 */
	private String jianyanleixing;
	/**
	 * 检验日期
	 */
	private Date jianyankaishiriqi; 
	private Date jianyanjieshuriqi; 
	private Date xiacijianyanriqi; //下次检验日期
	
	private String nj_baogaobianhao; //内检报告编号
	private String wj_baogaobianhao; //外检报告编号
	private String nd_baogaobianhao; //年度报告编号
	private String qm_baogaobianhao; //全面报告编号
	
	private String zhuyaowenti; //主要问题
	private String shiguleibie; //事故类别
	private Date shigufashengriqi; //事故发生日期
	private String shiguchulijieguo; //事故处理结果
	private String shebeibiandongfangshi; //设备变动方式
	private String shebeibiandongxiangmu; //设备变动项目
	private Date shebeibiandongriqi; //设备变动日期
	private String chengdandanwei; //承担单位
	private String chengdandanwei_code; //承担单位代码
	
	
	
	/*****************************************锅炉**********************************************/
	private String shebeishiyongnianxian; //设备使用年限
	private String gudingzichanzhi; //固定资产值
	
	private String gongchengmingcheng; //工程(装置)名称
	private String zhuguanbumen; //主管部门  
	private String hangye; //行业
	
	private Date shenheriqi; //审核日期
	
	
	private String touyongriqi; //投用日期  文本
	private Date touyongriqi_date; //投用日期   日期
	private String suoshuchejian; //所属车间  
	private String beizhu; //备注  
	
	
	
	
	/*******************************注册登记***********************************/
	/**
	 * 正在使用当中
	 */
	private String zhucedengjirenyuan; //注册登记人员
	private String zhucedengjijigou; //注册登记机构
	private String dengjiyijian; //登记意见
	

	private String jingbanren; //经办人
	private String jingbanrendianhua; // 经办人电话
	/**
	 * 登记人 （注册登记经办人）
	 */
	private String dj_jingbanren;
	/**
	 * 登记经办日期
	 */
	private Date dj_jingbanriqi;
	
	/**
	 * 登记表主键
	 */
	private Long djb_id;
	
	
	/**********************************安装单位**********************************************/
	private String anzhuangdanwei; //安装单位
	private String anzhuangdanwei_daima; //安装单位代码
	private String anzhuangdanwei_zigezhengshu; //安装单位资格证书
	private String anzhuangdanwei_lianxiren; //联系人
	private String anzhuangdanwei_lianxidianhua; //联系电话
	/**
	 * 安装日期
	 */
	private Date anzhuangriqi;
	private Date anzhuangjianjianriqi; //安装监检日期
	private String anzhuangjianjianjigou; //安装监检机构
	
	/*********************************验收单位************************************************/
	private String yanshoudanwei; //验收单位
	private Date yanshouriqi; //验收日期
	private String yanshoujigou; //验收机构
	private String yanshoubaogaobianhao; // 验收报告编号
	
	private String weibaozhouqi; //维保周期 （粥）
	private String daxiuzhouqi; //大修周期 （月）
	
	/***************************************保险**************************************/
	private String baoxianjigou; //保险机构
	private String baoxianxianzhong; //保险险种
	private String baoxianfei; //保险费
	private String baoxianji; //保险金额
	private String baoxianjiazhi; //保险价值
	
	
	/*******************是否**************************/
	private String shifou_zhongdaweixianyuan; //是否重大危险源
	private String shifou_renkoumijiqu; //是否密集区
	private String shifou_yingjifangan; //是否应急方案
	private String shifou_zhongdianjiankong; //是否重点监控
	private String shifouhuagong; //是否化工企业 20180827
	
	//是否吊运熔融金属（起重机专用）
	private String shifou_dyrrjs; // 是 或 否
	
	
	private Date updateTime; //设备更改日期  （历史记录修改时间）
	
	private String chongfu;//重复数据 2016-11-1
	
	private String xiangzhen_cankao; //临时使用  乡镇参考
	
	/**
	 * 2017-08-15 补充参数表
	 */
	private String shiyongdanweibeizhu; //使用单位名称备注
	
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SE")
    @SequenceGenerator(name="SEQ_SE",allocationSize=1, sequenceName="SEQ_SE")
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
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

	public String getShebeixinghao() {
		return shebeixinghao;
	}

	public void setShebeixinghao(String shebeixinghao) {
		this.shebeixinghao = shebeixinghao;
	}


	
	public String getDengjizhengbianhao() {
		return dengjizhengbianhao;
	}

	public void setDengjizhengbianhao(String dengjizhengbianhao) {
		this.dengjizhengbianhao = dengjizhengbianhao;
	}

	public String getNeibubianhao() {
		return neibubianhao;
	}

	public void setNeibubianhao(String neibubianhao) {
		this.neibubianhao = neibubianhao;
	}

	public String getChuchangbianhao() {
		return chuchangbianhao;
	}

	public void setChuchangbianhao(String chuchangbianhao) {
		this.chuchangbianhao = chuchangbianhao;
	}

	public String getShebeididian() {
		return shebeididian;
	}

	public void setShebeididian(String shebeididian) {
		this.shebeididian = shebeididian;
	}

	public Long getShigongdanweiId() {
		return shigongdanweiId;
	}

	public void setShigongdanweiId(Long shigongdanweiId) {
		this.shigongdanweiId = shigongdanweiId;
	}

	public String getShigongdanwei() {
		return shigongdanwei;
	}

	public void setShigongdanwei(String shigongdanwei) {
		this.shigongdanwei = shigongdanwei;
	}

	public String getShebeidaima() {
		return shebeidaima;
	}

	public void setShebeidaima(String shebeidaima) {
		this.shebeidaima = shebeidaima;
	}

	public String getShiyongdanwei() {
		return shiyongdanwei;
	}

	public void setShiyongdanwei(String shiyongdanwei) {
		this.shiyongdanwei = shiyongdanwei;
	}

	public String getZhucedaima() {
		return zhucedaima;
	}

	public void setZhucedaima(String zhucedaima) {
		this.zhucedaima = zhucedaima;
	}

	public Date getZhuceriqi() {
		return zhuceriqi;
	}

	public void setZhuceriqi(Date zhuceriqi) {
		this.zhuceriqi = zhuceriqi;
	}

	public Long getShiyongdanweiId() {
		return shiyongdanweiId;
	}

	public void setShiyongdanweiId(Long shiyongdanweiId) {
		this.shiyongdanweiId = shiyongdanweiId;
	}

	public String getShiyongdanwei_dizhi() {
		return shiyongdanwei_dizhi;
	}

	public void setShiyongdanwei_dizhi(String shiyongdanwei_dizhi) {
		this.shiyongdanwei_dizhi = shiyongdanwei_dizhi;
	}

	public String getShigongdanwei_dizhi() {
		return shigongdanwei_dizhi;
	}

	public void setShigongdanwei_dizhi(String shigongdanwei_dizhi) {
		this.shigongdanwei_dizhi = shigongdanwei_dizhi;
	}

	public String getShiyongdanwei_lianxiren() {
		return shiyongdanwei_lianxiren;
	}

	public void setShiyongdanwei_lianxiren(String shiyongdanwei_lianxiren) {
		this.shiyongdanwei_lianxiren = shiyongdanwei_lianxiren;
	}

	public String getShiyongdanwei_lianxidianhua() {
		return shiyongdanwei_lianxidianhua;
	}

	public void setShiyongdanwei_lianxidianhua(String shiyongdanwei_lianxidianhua) {
		this.shiyongdanwei_lianxidianhua = shiyongdanwei_lianxidianhua;
	}

	public String getShigongdanwei_lianxiren() {
		return shigongdanwei_lianxiren;
	}

	public void setShigongdanwei_lianxiren(String shigongdanwei_lianxiren) {
		this.shigongdanwei_lianxiren = shigongdanwei_lianxiren;
	}

	public String getShigongdanwei_lianxidianhua() {
		return shigongdanwei_lianxidianhua;
	}

	public void setShigongdanwei_lianxidianhua(String shigongdanwei_lianxidianhua) {
		this.shigongdanwei_lianxidianhua = shigongdanwei_lianxidianhua;
	}

	public String getZhizaodanwei() {
		return zhizaodanwei;
	}

	public void setZhizaodanwei(String zhizaodanwei) {
		this.zhizaodanwei = zhizaodanwei;
	}

	public String getShiyongdanwei_code() {
		return shiyongdanwei_code;
	}

	public void setShiyongdanwei_code(String shiyongdanwei_code) {
		this.shiyongdanwei_code = shiyongdanwei_code;
	}

	public String getShigongdanwei_xukezhengbianhao() {
		return shigongdanwei_xukezhengbianhao;
	}

	public void setShigongdanwei_xukezhengbianhao(
			String shigongdanwei_xukezhengbianhao) {
		this.shigongdanwei_xukezhengbianhao = shigongdanwei_xukezhengbianhao;
	}

	public String getShigongdanwei_jiancheng() {
		return shigongdanwei_jiancheng;
	}

	public void setShigongdanwei_jiancheng(String shigongdanwei_jiancheng) {
		this.shigongdanwei_jiancheng = shigongdanwei_jiancheng;
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

	public String getWeihubaoyangdanwei_id() {
		return weihubaoyangdanwei_id;
	}

	public void setWeihubaoyangdanwei_id(String weihubaoyangdanwei_id) {
		this.weihubaoyangdanwei_id = weihubaoyangdanwei_id;
	}

	public String getWeihubaoyangdanwei() {
		return weihubaoyangdanwei;
	}

	public void setWeihubaoyangdanwei(String weihubaoyangdanwei) {
		this.weihubaoyangdanwei = weihubaoyangdanwei;
	}

	public Date getJianyankaishiriqi() {
		return jianyankaishiriqi;
	}

	public void setJianyankaishiriqi(Date jianyankaishiriqi) {
		this.jianyankaishiriqi = jianyankaishiriqi;
	}

	public Date getJianyanjieshuriqi() {
		return jianyanjieshuriqi;
	}

	public void setJianyanjieshuriqi(Date jianyanjieshuriqi) {
		this.jianyanjieshuriqi = jianyanjieshuriqi;
	}

	public Date getXiacijianyanriqi() {
		return xiacijianyanriqi;
	}

	public void setXiacijianyanriqi(Date xiacijianyanriqi) {
		this.xiacijianyanriqi = xiacijianyanriqi;
	}

	public String getGaozhibianhao() {
		return gaozhibianhao;
	}

	public void setGaozhibianhao(String gaozhibianhao) {
		this.gaozhibianhao = gaozhibianhao;
	}

	public Date getGaozhiriqi() {
		return gaozhiriqi;
	}

	public void setGaozhiriqi(Date gaozhiriqi) {
		this.gaozhiriqi = gaozhiriqi;
	}


	public String getShebeizhongleidaima() {
		return shebeizhongleidaima;
	}

	public void setShebeizhongleidaima(String shebeizhongleidaima) {
		this.shebeizhongleidaima = shebeizhongleidaima;
	}

	public String getShebeileibiedaima() {
		return shebeileibiedaima;
	}

	public void setShebeileibiedaima(String shebeileibiedaima) {
		this.shebeileibiedaima = shebeileibiedaima;
	}

	public String getShenbeipinzhongdaima() {
		return shenbeipinzhongdaima;
	}

	public void setShenbeipinzhongdaima(String shenbeipinzhongdaima) {
		this.shenbeipinzhongdaima = shenbeipinzhongdaima;
	}

	public Date getFazhengriqi() {
		return fazhengriqi;
	}

	public void setFazhengriqi(Date fazhengriqi) {
		this.fazhengriqi = fazhengriqi;
	}

	public String getWeihubaoyangdanwei_dianhua() {
		return weihubaoyangdanwei_dianhua;
	}

	public void setWeihubaoyangdanwei_dianhua(String weihubaoyangdanwei_dianhua) {
		this.weihubaoyangdanwei_dianhua = weihubaoyangdanwei_dianhua;
	}

	public String getSfshuoding() {
		return sfshuoding;
	}

	public void setSfshuoding(String sfshuoding) {
		this.sfshuoding = sfshuoding;
	}

	public String getZcstatus() {
		return zcstatus;
	}

	public void setZcstatus(String zcstatus) {
		this.zcstatus = zcstatus;
	}

	public String getZhizaodanweixukezhengbianhao() {
		return zhizaodanweixukezhengbianhao;
	}

	public void setZhizaodanweixukezhengbianhao(String zhizaodanweixukezhengbianhao) {
		this.zhizaodanweixukezhengbianhao = zhizaodanweixukezhengbianhao;
	}

	public Date getAnzhuangriqi() {
		return anzhuangriqi;
	}

	public void setAnzhuangriqi(Date anzhuangriqi) {
		this.anzhuangriqi = anzhuangriqi;
	}

	public String getShebeixingshi() {
		return shebeixingshi;
	}

	public void setShebeixingshi(String shebeixingshi) {
		this.shebeixingshi = shebeixingshi;
	}

	public String getSzstatus() {
		return szstatus;
	}

	public void setSzstatus(String szstatus) {
		this.szstatus = szstatus;
	}


	public String getZhizaoriqi() {
		return zhizaoriqi;
	}

	public void setZhizaoriqi(String zhizaoriqi) {
		this.zhizaoriqi = zhizaoriqi;
	}

	@Transient
	public String getQueren() {
		return queren;
	}

	public void setQueren(String queren) {
		this.queren = queren;
	}

	public String getShigongleibie() {
		return shigongleibie;
	}

	public void setShigongleibie(String shigongleibie) {
		this.shigongleibie = shigongleibie;
	}

	public String getShigongleibiedaima() {
		return shigongleibiedaima;
	}

	public void setShigongleibiedaima(String shigongleibiedaima) {
		this.shigongleibiedaima = shigongleibiedaima;
	}

	public String getJianyanjielun() {
		return jianyanjielun;
	}

	public void setJianyanjielun(String jianyanjielun) {
		this.jianyanjielun = jianyanjielun;
	}

	public String getJianyanleixing() {
		return jianyanleixing;
	}

	public void setJianyanleixing(String jianyanleixing) {
		this.jianyanleixing = jianyanleixing;
	}

	public Date getShebeibaojianriqi() {
		return shebeibaojianriqi;
	}

	public void setShebeibaojianriqi(Date shebeibaojianriqi) {
		this.shebeibaojianriqi = shebeibaojianriqi;
	}

	public String getShigongdanwei_xkz_youxiaoqi() {
		return shigongdanwei_xkz_youxiaoqi;
	}

	public void setShigongdanwei_xkz_youxiaoqi(String shigongdanweiXkzYouxiaoqi) {
		shigongdanwei_xkz_youxiaoqi = shigongdanweiXkzYouxiaoqi;
	}

	public String getShiyongdanwei_chuanzhen() {
		return shiyongdanwei_chuanzhen;
	}

	public void setShiyongdanwei_chuanzhen(String shiyongdanweiChuanzhen) {
		shiyongdanwei_chuanzhen = shiyongdanweiChuanzhen;
	}

	public String getShiyongdanwei_youbian() {
		return shiyongdanwei_youbian;
	}

	public void setShiyongdanwei_youbian(String shiyongdanweiYoubian) {
		shiyongdanwei_youbian = shiyongdanweiYoubian;
	}

	public String getGaozhijingbanren() {
		return gaozhijingbanren;
	}

	public void setGaozhijingbanren(String gaozhijingbanren) {
		this.gaozhijingbanren = gaozhijingbanren;
	}

	public String getShigongdanwei_chuanzhen() {
		return shigongdanwei_chuanzhen;
	}

	public void setShigongdanwei_chuanzhen(String shigongdanweiChuanzhen) {
		shigongdanwei_chuanzhen = shigongdanweiChuanzhen;
	}

	public String getShigongdanwei_youbian() {
		return shigongdanwei_youbian;
	}

	public void setShigongdanwei_youbian(String shigongdanweiYoubian) {
		shigongdanwei_youbian = shigongdanweiYoubian;
	}

	public String getGz_filepath() {
		return gz_filepath;
	}

	public void setGz_filepath(String gzFilepath) {
		gz_filepath = gzFilepath;
	}

	public String getBaogaobianhao() {
		return baogaobianhao;
	}

	public void setBaogaobianhao(String baogaobianhao) {
		this.baogaobianhao = baogaobianhao;
	}

	public Long getJybg_id() {
		return jybg_id;
	}

	public void setJybg_id(Long jybgId) {
		jybg_id = jybgId;
	}

	public String getBj_jianyanxiangmu() {
		return bj_jianyanxiangmu;
	}

	public void setBj_jianyanxiangmu(String bjJianyanxiangmu) {
		bj_jianyanxiangmu = bjJianyanxiangmu;
	}

	public String getDj_jingbanren() {
		return dj_jingbanren;
	}

	public void setDj_jingbanren(String djJingbanren) {
		dj_jingbanren = djJingbanren;
	}

	public Date getDj_jingbanriqi() {
		return dj_jingbanriqi;
	}

	public void setDj_jingbanriqi(Date djJingbanriqi) {
		dj_jingbanriqi = djJingbanriqi;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getZfstate() {
		return zfstate;
	}

	public void setZfstate(String zfstate) {
		this.zfstate = zfstate;
	}

	public Long getDjb_id() {
		return djb_id;
	}

	public void setDjb_id(Long djbId) {
		djb_id = djbId;
	}

	public String getEqhide() {
		return eqhide;
	}

	public void setEqhide(String eqhide) {
		this.eqhide = eqhide;
	}

	public Date getBanjieriqi() {
		return banjieriqi;
	}

	public void setBanjieriqi(Date banjieriqi) {
		this.banjieriqi = banjieriqi;
	}

	public String getBiaozhuleixing() {
		return biaozhuleixing;
	}

	public void setBiaozhuleixing(String biaozhuleixing) {
		this.biaozhuleixing = biaozhuleixing;
	}

	public String getFj_filepath() {
		return fj_filepath;
	}

	public void setFj_filepath(String fjFilepath) {
		fj_filepath = fjFilepath;
	}

	public String getTmpData() {
		return tmpData;
	}

	public void setTmpData(String tmpData) {
		this.tmpData = tmpData;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
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

	public String getJianyanjigou() {
		return jianyanjigou;
	}

	public void setJianyanjigou(String jianyanjigou) {
		this.jianyanjigou = jianyanjigou;
	}

	public Date getBiangengriqi() {
		return biangengriqi;
	}

	public void setBiangengriqi(Date biangengriqi) {
		this.biangengriqi = biangengriqi;
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

	public String getShiyongdanwei_suoshuhangye() {
		return shiyongdanwei_suoshuhangye;
	}

	public void setShiyongdanwei_suoshuhangye(String shiyongdanweiSuoshuhangye) {
		shiyongdanwei_suoshuhangye = shiyongdanweiSuoshuhangye;
	}

	public String getChanquandanwei_suoshuhangye() {
		return chanquandanwei_suoshuhangye;
	}

	public void setChanquandanwei_suoshuhangye(String chanquandanweiSuoshuhangye) {
		chanquandanwei_suoshuhangye = chanquandanweiSuoshuhangye;
	}

	public String getNj_baogaobianhao() {
		return nj_baogaobianhao;
	}

	public void setNj_baogaobianhao(String njBaogaobianhao) {
		nj_baogaobianhao = njBaogaobianhao;
	}

	public String getWj_baogaobianhao() {
		return wj_baogaobianhao;
	}

	public void setWj_baogaobianhao(String wjBaogaobianhao) {
		wj_baogaobianhao = wjBaogaobianhao;
	}

	public String getNd_baogaobianhao() {
		return nd_baogaobianhao;
	}

	public void setNd_baogaobianhao(String ndBaogaobianhao) {
		nd_baogaobianhao = ndBaogaobianhao;
	}

	public String getQm_baogaobianhao() {
		return qm_baogaobianhao;
	}

	public void setQm_baogaobianhao(String qmBaogaobianhao) {
		qm_baogaobianhao = qmBaogaobianhao;
	}

	public String getChanquandanwei_farendaibiao() {
		return chanquandanwei_farendaibiao;
	}

	public void setChanquandanwei_farendaibiao(String chanquandanweiFarendaibiao) {
		chanquandanwei_farendaibiao = chanquandanweiFarendaibiao;
	}

	public String getChanquandanwei_dianhua() {
		return chanquandanwei_dianhua;
	}

	public void setChanquandanwei_dianhua(String chanquandanweiDianhua) {
		chanquandanwei_dianhua = chanquandanweiDianhua;
	}

	public String getFadingdaibiaoren() {
		return fadingdaibiaoren;
	}

	public void setFadingdaibiaoren(String fadingdaibiaoren) {
		this.fadingdaibiaoren = fadingdaibiaoren;
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

	public String getShebeishiyongnianxian() {
		return shebeishiyongnianxian;
	}

	public void setShebeishiyongnianxian(String shebeishiyongnianxian) {
		this.shebeishiyongnianxian = shebeishiyongnianxian;
	}

	public String getGudingzichanzhi() {
		return gudingzichanzhi;
	}

	public void setGudingzichanzhi(String gudingzichanzhi) {
		this.gudingzichanzhi = gudingzichanzhi;
	}

	public String getWeihubaoyangdanwei_lianxiren() {
		return weihubaoyangdanwei_lianxiren;
	}

	public void setWeihubaoyangdanwei_lianxiren(String weihubaoyangdanweiLianxiren) {
		weihubaoyangdanwei_lianxiren = weihubaoyangdanweiLianxiren;
	}

	public String getWhbydw_zizhizhengshu() {
		return whbydw_zizhizhengshu;
	}

	public void setWhbydw_zizhizhengshu(String whbydwZizhizhengshu) {
		whbydw_zizhizhengshu = whbydwZizhizhengshu;
	}

	public String getCqdw_frdbdh() {
		return cqdw_frdbdh;
	}

	public void setCqdw_frdbdh(String cqdwFrdbdh) {
		cqdw_frdbdh = cqdwFrdbdh;
	}

	public String getFrdb_dianhua() {
		return frdb_dianhua;
	}

	public void setFrdb_dianhua(String frdbDianhua) {
		frdb_dianhua = frdbDianhua;
	}

	public String getGongchengmingcheng() {
		return gongchengmingcheng;
	}

	public void setGongchengmingcheng(String gongchengmingcheng) {
		this.gongchengmingcheng = gongchengmingcheng;
	}

	public String getZhuguanbumen() {
		return zhuguanbumen;
	}

	public void setZhuguanbumen(String zhuguanbumen) {
		this.zhuguanbumen = zhuguanbumen;
	}

	public String getHangye() {
		return hangye;
	}

	public void setHangye(String hangye) {
		this.hangye = hangye;
	}

	public String getZhucedengjirenyuan() {
		return zhucedengjirenyuan;
	}

	public void setZhucedengjirenyuan(String zhucedengjirenyuan) {
		this.zhucedengjirenyuan = zhucedengjirenyuan;
	}

	public String getZhucedengjijigou() {
		return zhucedengjijigou;
	}

	public void setZhucedengjijigou(String zhucedengjijigou) {
		this.zhucedengjijigou = zhucedengjijigou;
	}

	public Date getShenheriqi() {
		return shenheriqi;
	}

	public void setShenheriqi(Date shenheriqi) {
		this.shenheriqi = shenheriqi;
	}

	public String getDengjiyijian() {
		return dengjiyijian;
	}

	public void setDengjiyijian(String dengjiyijian) {
		this.dengjiyijian = dengjiyijian;
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

	public String getTouyongriqi() {
		return touyongriqi;
	}

	public void setTouyongriqi(String touyongriqi) {
		this.touyongriqi = touyongriqi;
	}

	public String getSuoshuchejian() {
		return suoshuchejian;
	}

	public void setSuoshuchejian(String suoshuchejian) {
		this.suoshuchejian = suoshuchejian;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getShigongdanwei_daima() {
		return shigongdanwei_daima;
	}

	public void setShigongdanwei_daima(String shigongdanweiDaima) {
		shigongdanwei_daima = shigongdanweiDaima;
	}

	public Date getZhizaoriqi_date() {
		return zhizaoriqi_date;
	}

	public void setZhizaoriqi_date(Date zhizaoriqiDate) {
		zhizaoriqi_date = zhizaoriqiDate;
	}

	public Date getTouyongriqi_date() {
		return touyongriqi_date;
	}

	public void setTouyongriqi_date(Date touyongriqiDate) {
		touyongriqi_date = touyongriqiDate;
	}

	public String getShiyongdanwei_xingzhi() {
		return shiyongdanwei_xingzhi;
	}

	public void setShiyongdanwei_xingzhi(String shiyongdanweiXingzhi) {
		shiyongdanwei_xingzhi = shiyongdanweiXingzhi;
	}

	public String getShiyongchangsuo() {
		return shiyongchangsuo;
	}

	public void setShiyongchangsuo(String shiyongchangsuo) {
		this.shiyongchangsuo = shiyongchangsuo;
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

	public String getTianbiaorenyuan() {
		return tianbiaorenyuan;
	}

	public void setTianbiaorenyuan(String tianbiaorenyuan) {
		this.tianbiaorenyuan = tianbiaorenyuan;
	}

	public String getAnquandengji() {
		return anquandengji;
	}

	public void setAnquandengji(String anquandengji) {
		this.anquandengji = anquandengji;
	}

	public String getJianguanleibie() {
		return jianguanleibie;
	}

	public void setJianguanleibie(String jianguanleibie) {
		this.jianguanleibie = jianguanleibie;
	}

	public String getZhizaodanwei_code() {
		return zhizaodanwei_code;
	}

	public void setZhizaodanwei_code(String zhizaodanweiCode) {
		zhizaodanwei_code = zhizaodanweiCode;
	}

	public String getZhizaodanwei_zigezhengshu() {
		return zhizaodanwei_zigezhengshu;
	}

	public void setZhizaodanwei_zigezhengshu(String zhizaodanweiZigezhengshu) {
		zhizaodanwei_zigezhengshu = zhizaodanweiZigezhengshu;
	}

	public String getZhizaodanwei_lianxidianhua() {
		return zhizaodanwei_lianxidianhua;
	}

	public void setZhizaodanwei_lianxidianhua(String zhizaodanweiLianxidianhua) {
		zhizaodanwei_lianxidianhua = zhizaodanweiLianxidianhua;
	}

	public String getZhizaodanwei_shiyongchanghe() {
		return zhizaodanwei_shiyongchanghe;
	}

	public void setZhizaodanwei_shiyongchanghe(String zhizaodanweiShiyongchanghe) {
		zhizaodanwei_shiyongchanghe = zhizaodanweiShiyongchanghe;
	}

	public String getChanpinhegezhengbianhao() {
		return chanpinhegezhengbianhao;
	}

	public void setChanpinhegezhengbianhao(String chanpinhegezhengbianhao) {
		this.chanpinhegezhengbianhao = chanpinhegezhengbianhao;
	}

	public String getWenjianjiandingjigou() {
		return wenjianjiandingjigou;
	}

	public void setWenjianjiandingjigou(String wenjianjiandingjigou) {
		this.wenjianjiandingjigou = wenjianjiandingjigou;
	}

	public String getJiandingbaogaobianhao() {
		return jiandingbaogaobianhao;
	}

	public void setJiandingbaogaobianhao(String jiandingbaogaobianhao) {
		this.jiandingbaogaobianhao = jiandingbaogaobianhao;
	}

	public String getZhizaojianjianjigou() {
		return zhizaojianjianjigou;
	}

	public void setZhizaojianjianjigou(String zhizaojianjianjigou) {
		this.zhizaojianjianjigou = zhizaojianjianjigou;
	}

	public String getJianjianzhengshubianhao() {
		return jianjianzhengshubianhao;
	}

	public void setJianjianzhengshubianhao(String jianjianzhengshubianhao) {
		this.jianjianzhengshubianhao = jianjianzhengshubianhao;
	}

	public String getJianjianhezhunzheng() {
		return jianjianhezhunzheng;
	}

	public void setJianjianhezhunzheng(String jianjianhezhunzheng) {
		this.jianjianhezhunzheng = jianjianhezhunzheng;
	}

	public Date getZhizaojianjianriqi() {
		return zhizaojianjianriqi;
	}

	public void setZhizaojianjianriqi(Date zhizaojianjianriqi) {
		this.zhizaojianjianriqi = zhizaojianjianriqi;
	}

	public Date getShigongdanwei_shigongriqi() {
		return shigongdanwei_shigongriqi;
	}

	public void setShigongdanwei_shigongriqi(Date shigongdanweiShigongriqi) {
		shigongdanwei_shigongriqi = shigongdanweiShigongriqi;
	}

	public Date getShigongdanwei_jungongriqi() {
		return shigongdanwei_jungongriqi;
	}

	public void setShigongdanwei_jungongriqi(Date shigongdanweiJungongriqi) {
		shigongdanwei_jungongriqi = shigongdanweiJungongriqi;
	}

	public String getChanquandanwei_youbian() {
		return chanquandanwei_youbian;
	}

	public void setChanquandanwei_youbian(String chanquandanweiYoubian) {
		chanquandanwei_youbian = chanquandanweiYoubian;
	}

	public String getChanquandanwei_xingzhi() {
		return chanquandanwei_xingzhi;
	}

	public void setChanquandanwei_xingzhi(String chanquandanweiXingzhi) {
		chanquandanwei_xingzhi = chanquandanweiXingzhi;
	}

	public String getWeihubaoyangdanwei_code() {
		return weihubaoyangdanwei_code;
	}

	public void setWeihubaoyangdanwei_code(String weihubaoyangdanweiCode) {
		weihubaoyangdanwei_code = weihubaoyangdanweiCode;
	}

	public String getJianyanjigou_code() {
		return jianyanjigou_code;
	}

	public void setJianyanjigou_code(String jianyanjigouCode) {
		jianyanjigou_code = jianyanjigouCode;
	}

	public String getZhuyaowenti() {
		return zhuyaowenti;
	}

	public void setZhuyaowenti(String zhuyaowenti) {
		this.zhuyaowenti = zhuyaowenti;
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

	public String getShebeibiandongfangshi() {
		return shebeibiandongfangshi;
	}

	public void setShebeibiandongfangshi(String shebeibiandongfangshi) {
		this.shebeibiandongfangshi = shebeibiandongfangshi;
	}

	public String getShebeibiandongxiangmu() {
		return shebeibiandongxiangmu;
	}

	public void setShebeibiandongxiangmu(String shebeibiandongxiangmu) {
		this.shebeibiandongxiangmu = shebeibiandongxiangmu;
	}

	public Date getShebeibiandongriqi() {
		return shebeibiandongriqi;
	}

	public void setShebeibiandongriqi(Date shebeibiandongriqi) {
		this.shebeibiandongriqi = shebeibiandongriqi;
	}

	public String getChengdandanwei() {
		return chengdandanwei;
	}

	public void setChengdandanwei(String chengdandanwei) {
		this.chengdandanwei = chengdandanwei;
	}

	public String getChengdandanwei_code() {
		return chengdandanwei_code;
	}

	public void setChengdandanwei_code(String chengdandanweiCode) {
		chengdandanwei_code = chengdandanweiCode;
	}

	public String getAnzhuangdanwei() {
		return anzhuangdanwei;
	}

	public void setAnzhuangdanwei(String anzhuangdanwei) {
		this.anzhuangdanwei = anzhuangdanwei;
	}

	public String getAnzhuangdanwei_daima() {
		return anzhuangdanwei_daima;
	}

	public void setAnzhuangdanwei_daima(String anzhuangdanweiDaima) {
		anzhuangdanwei_daima = anzhuangdanweiDaima;
	}

	public String getAnzhuangdanwei_zigezhengshu() {
		return anzhuangdanwei_zigezhengshu;
	}

	public void setAnzhuangdanwei_zigezhengshu(String anzhuangdanweiZigezhengshu) {
		anzhuangdanwei_zigezhengshu = anzhuangdanweiZigezhengshu;
	}

	public String getAnzhuangdanwei_lianxiren() {
		return anzhuangdanwei_lianxiren;
	}

	public void setAnzhuangdanwei_lianxiren(String anzhuangdanweiLianxiren) {
		anzhuangdanwei_lianxiren = anzhuangdanweiLianxiren;
	}

	public String getAnzhuangdanwei_lianxidianhua() {
		return anzhuangdanwei_lianxidianhua;
	}

	public void setAnzhuangdanwei_lianxidianhua(String anzhuangdanweiLianxidianhua) {
		anzhuangdanwei_lianxidianhua = anzhuangdanweiLianxidianhua;
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

	public String getYanshoudanwei() {
		return yanshoudanwei;
	}

	public void setYanshoudanwei(String yanshoudanwei) {
		this.yanshoudanwei = yanshoudanwei;
	}

	public Date getYanshouriqi() {
		return yanshouriqi;
	}

	public void setYanshouriqi(Date yanshouriqi) {
		this.yanshouriqi = yanshouriqi;
	}

	public String getYanshoujigou() {
		return yanshoujigou;
	}

	public void setYanshoujigou(String yanshoujigou) {
		this.yanshoujigou = yanshoujigou;
	}

	public String getYanshoubaogaobianhao() {
		return yanshoubaogaobianhao;
	}

	public void setYanshoubaogaobianhao(String yanshoubaogaobianhao) {
		this.yanshoubaogaobianhao = yanshoubaogaobianhao;
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

	public String getBaoxianjigou() {
		return baoxianjigou;
	}

	public void setBaoxianjigou(String baoxianjigou) {
		this.baoxianjigou = baoxianjigou;
	}

	public String getBaoxianxianzhong() {
		return baoxianxianzhong;
	}

	public void setBaoxianxianzhong(String baoxianxianzhong) {
		this.baoxianxianzhong = baoxianxianzhong;
	}

	public String getBaoxianfei() {
		return baoxianfei;
	}

	public void setBaoxianfei(String baoxianfei) {
		this.baoxianfei = baoxianfei;
	}

	public String getBaoxianji() {
		return baoxianji;
	}

	public void setBaoxianji(String baoxianji) {
		this.baoxianji = baoxianji;
	}

	public String getBaoxianjiazhi() {
		return baoxianjiazhi;
	}

	public void setBaoxianjiazhi(String baoxianjiazhi) {
		this.baoxianjiazhi = baoxianjiazhi;
	}

	public String getShifou_zhongdaweixianyuan() {
		return shifou_zhongdaweixianyuan;
	}

	public void setShifou_zhongdaweixianyuan(String shifouZhongdaweixianyuan) {
		shifou_zhongdaweixianyuan = shifouZhongdaweixianyuan;
	}

	public String getShifou_renkoumijiqu() {
		return shifou_renkoumijiqu;
	}

	public void setShifou_renkoumijiqu(String shifouRenkoumijiqu) {
		shifou_renkoumijiqu = shifouRenkoumijiqu;
	}

	public String getShifou_yingjifangan() {
		return shifou_yingjifangan;
	}

	public void setShifou_yingjifangan(String shifouYingjifangan) {
		shifou_yingjifangan = shifouYingjifangan;
	}

	public String getShifou_zhongdianjiankong() {
		return shifou_zhongdianjiankong;
	}

	public void setShifou_zhongdianjiankong(String shifouZhongdianjiankong) {
		shifou_zhongdianjiankong = shifouZhongdianjiankong;
	}

	public String getDengjileibie() {
		return dengjileibie;
	}

	public void setDengjileibie(String dengjileibie) {
		this.dengjileibie = dengjileibie;
	}

	public String getShiyongdanwei_caozuorenyuan() {
		return shiyongdanwei_caozuorenyuan;
	}

	public void setShiyongdanwei_caozuorenyuan(String shiyongdanweiCaozuorenyuan) {
		shiyongdanwei_caozuorenyuan = shiyongdanweiCaozuorenyuan;
	}

	public Date getTianbiaoriqi() {
		return tianbiaoriqi;
	}

	public void setTianbiaoriqi(Date tianbiaoriqi) {
		this.tianbiaoriqi = tianbiaoriqi;
	}

	public String getShigongdanwei_youzhengbianma() {
		return shigongdanwei_youzhengbianma;
	}

	public void setShigongdanwei_youzhengbianma(String shigongdanweiYouzhengbianma) {
		shigongdanwei_youzhengbianma = shigongdanweiYouzhengbianma;
	}

	public String getShifou_dyrrjs() {
		return shifou_dyrrjs;
	}

	public void setShifou_dyrrjs(String shifouDyrrjs) {
		shifou_dyrrjs = shifouDyrrjs;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getChongfu() {
		return chongfu;
	}

	public void setChongfu(String chongfu) {
		this.chongfu = chongfu;
	}

	public String getXiangzhen_cankao() {
		return xiangzhen_cankao;
	}

	public void setXiangzhen_cankao(String xiangzhenCankao) {
		xiangzhen_cankao = xiangzhenCankao;
	}

	public String getShigongdanwei_faren() {
		return shigongdanwei_faren;
	}

	public void setShigongdanwei_faren(String shigongdanweiFaren) {
		shigongdanwei_faren = shigongdanweiFaren;
	}

	public String getShiyongdanweibeizhu() {
		return shiyongdanweibeizhu;
	}

	public void setShiyongdanweibeizhu(String shiyongdanweibeizhu) {
		this.shiyongdanweibeizhu = shiyongdanweibeizhu;
	}

	public String getShifouhuagong() {
		return shifouhuagong;
	}

	public void setShifouhuagong(String shifouhuagong) {
		this.shifouhuagong = shifouhuagong;
	}
	
	
	
}