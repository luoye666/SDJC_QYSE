package com.stone.biz.utils.pojo;

import java.util.Date;

/**
 * 大数据提取信息借用
 * @author lenovo
 *
 */
public class TDBUtils {
	
	// t.orgname ,t.organno,t.abode,t.region,t.itemname,c.certno,c.sdate,c.edate,t.organid
	private Long id;
	
	private String orgname; //申请人名称
	
	private String organno; //组织机构代码
	
	private String abode; //住所
	
	private String region; //行政区划
	
	private String itemname; //申请类别
	
	private String certno; //证书编号
	
	private Date sdate; //发证日期
	
	private Date edate; //有效期
	
	private String organid; //连接
	
	private String fadingdaibiaoren; //法定代表人
	
	private String youbian; //邮编
	
	private String dianhua; //电话
	
	private String chuanzhen; //传真
	
	private String wangzhi; //网址
	
	private String youxiang; //邮箱
	
	private String hanghye; //行业
	
	private String jingjileixing; //经济类型
	
	private String chengliriqi; //成立日期
	
	private String chenglijiguan; //成立机关
	
	private String dengjijigou; //营业执照登记机构：
	
	private String zhudehao; // 	营业执照注册号：
	
	private String gongzuoriqi; //工作日期
	
	private String gudingzichan; //固定资产
	
	private String zhucezijin; //注册资金
	
	private String jishufuzeren; //技术负责人
	
	private String zhiliangfuzeren; //质量负责人
	
	private String renshu; //总人数
	
	private String shejirenshuliang; //设计人数量
	
	private String shenpirenshuliang; //审批人数量
	
	private String jigoumingcheng; //申请代理机构 机构名称：
	
	private String dizhi_youbian; //机构地址、邮编：
	
	private String shenqing_jigoudaima; //申请机构代码
	
	private String shenqing_fadingren; //申请法人
	
	private String shenqing_fuzeren; //申请负责人
	
	private String shenqing_chuanzhen; //申请传真
	
	private String shenqing_youxiang; //申请邮箱
	
	private String shenqing_dianhua; //申请电话
	
	private String leibie; //类别 区分那张表
	
	
	//气瓶使用 
	private String chongzhuangdanwei; //充装单位标识
	private String zhigongrenshu; //职工人数
	private String zhiliang_dianhua; //质量负责人电话
	private String jishu_dianhua; //技术负责人电话
	private String zhandimianji; //占地面积
	private String changfangmianji; //厂房面积
	private String anzhuangdanwei; //安装单位
	private String jianjiandanwei; //监检单位
	private String dingjiandanwei; //定检单位
	
	
	//证书
	private String fazhengjigou; //发证机构
	private String biangengriqi; //变更日期
	private String fazhengleixing ;//发证类型
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getOrganno() {
		return organno;
	}

	public void setOrganno(String organno) {
		this.organno = organno;
	}

	public String getAbode() {
		return abode;
	}

	public void setAbode(String abode) {
		this.abode = abode;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public String getCertno() {
		return certno;
	}

	public void setCertno(String certno) {
		this.certno = certno;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public String getOrganid() {
		return organid;
	}

	public void setOrganid(String organid) {
		this.organid = organid;
	}

	public String getFadingdaibiaoren() {
		return fadingdaibiaoren;
	}

	public void setFadingdaibiaoren(String fadingdaibiaoren) {
		this.fadingdaibiaoren = fadingdaibiaoren;
	}

	public String getYoubian() {
		return youbian;
	}

	public void setYoubian(String youbian) {
		this.youbian = youbian;
	}

	public String getWangzhi() {
		return wangzhi;
	}

	public void setWangzhi(String wangzhi) {
		this.wangzhi = wangzhi;
	}

	public String getYouxiang() {
		return youxiang;
	}

	public void setYouxiang(String youxiang) {
		this.youxiang = youxiang;
	}

	public String getHanghye() {
		return hanghye;
	}

	public void setHanghye(String hanghye) {
		this.hanghye = hanghye;
	}

	public String getJingjileixing() {
		return jingjileixing;
	}

	public void setJingjileixing(String jingjileixing) {
		this.jingjileixing = jingjileixing;
	}

	public String getChengliriqi() {
		return chengliriqi;
	}

	public void setChengliriqi(String chengliriqi) {
		this.chengliriqi = chengliriqi;
	}

	public String getChenglijiguan() {
		return chenglijiguan;
	}

	public void setChenglijiguan(String chenglijiguan) {
		this.chenglijiguan = chenglijiguan;
	}

	public String getDengjijigou() {
		return dengjijigou;
	}

	public void setDengjijigou(String dengjijigou) {
		this.dengjijigou = dengjijigou;
	}

	public String getZhudehao() {
		return zhudehao;
	}

	public void setZhudehao(String zhudehao) {
		this.zhudehao = zhudehao;
	}

	public String getGongzuoriqi() {
		return gongzuoriqi;
	}

	public void setGongzuoriqi(String gongzuoriqi) {
		this.gongzuoriqi = gongzuoriqi;
	}

	public String getGudingzichan() {
		return gudingzichan;
	}

	public void setGudingzichan(String gudingzichan) {
		this.gudingzichan = gudingzichan;
	}

	public String getZhucezijin() {
		return zhucezijin;
	}

	public void setZhucezijin(String zhucezijin) {
		this.zhucezijin = zhucezijin;
	}

	public String getJishufuzeren() {
		return jishufuzeren;
	}

	public void setJishufuzeren(String jishufuzeren) {
		this.jishufuzeren = jishufuzeren;
	}

	public String getZhiliangfuzeren() {
		return zhiliangfuzeren;
	}

	public void setZhiliangfuzeren(String zhiliangfuzeren) {
		this.zhiliangfuzeren = zhiliangfuzeren;
	}

	public String getRenshu() {
		return renshu;
	}

	public void setRenshu(String renshu) {
		this.renshu = renshu;
	}

	public String getShejirenshuliang() {
		return shejirenshuliang;
	}

	public void setShejirenshuliang(String shejirenshuliang) {
		this.shejirenshuliang = shejirenshuliang;
	}

	public String getShenpirenshuliang() {
		return shenpirenshuliang;
	}

	public void setShenpirenshuliang(String shenpirenshuliang) {
		this.shenpirenshuliang = shenpirenshuliang;
	}

	public String getJigoumingcheng() {
		return jigoumingcheng;
	}

	public void setJigoumingcheng(String jigoumingcheng) {
		this.jigoumingcheng = jigoumingcheng;
	}

	public String getDizhi_youbian() {
		return dizhi_youbian;
	}

	public void setDizhi_youbian(String dizhiYoubian) {
		dizhi_youbian = dizhiYoubian;
	}

	public String getShenqing_jigoudaima() {
		return shenqing_jigoudaima;
	}

	public void setShenqing_jigoudaima(String shenqingJigoudaima) {
		shenqing_jigoudaima = shenqingJigoudaima;
	}

	public String getShenqing_fadingren() {
		return shenqing_fadingren;
	}

	public void setShenqing_fadingren(String shenqingFadingren) {
		shenqing_fadingren = shenqingFadingren;
	}

	public String getShenqing_fuzeren() {
		return shenqing_fuzeren;
	}

	public void setShenqing_fuzeren(String shenqingFuzeren) {
		shenqing_fuzeren = shenqingFuzeren;
	}

	public String getShenqing_chuanzhen() {
		return shenqing_chuanzhen;
	}

	public void setShenqing_chuanzhen(String shenqingChuanzhen) {
		shenqing_chuanzhen = shenqingChuanzhen;
	}

	public String getShenqing_youxiang() {
		return shenqing_youxiang;
	}

	public void setShenqing_youxiang(String shenqingYouxiang) {
		shenqing_youxiang = shenqingYouxiang;
	}

	public String getShenqing_dianhua() {
		return shenqing_dianhua;
	}

	public void setShenqing_dianhua(String shenqingDianhua) {
		shenqing_dianhua = shenqingDianhua;
	}

	public String getDianhua() {
		return dianhua;
	}

	public void setDianhua(String dianhua) {
		this.dianhua = dianhua;
	}

	public String getChuanzhen() {
		return chuanzhen;
	}

	public void setChuanzhen(String chuanzhen) {
		this.chuanzhen = chuanzhen;
	}

	public String getChongzhuangdanwei() {
		return chongzhuangdanwei;
	}

	public void setChongzhuangdanwei(String chongzhuangdanwei) {
		this.chongzhuangdanwei = chongzhuangdanwei;
	}

	public String getZhigongrenshu() {
		return zhigongrenshu;
	}

	public void setZhigongrenshu(String zhigongrenshu) {
		this.zhigongrenshu = zhigongrenshu;
	}

	public String getZhiliang_dianhua() {
		return zhiliang_dianhua;
	}

	public void setZhiliang_dianhua(String zhiliangDianhua) {
		zhiliang_dianhua = zhiliangDianhua;
	}

	public String getJishu_dianhua() {
		return jishu_dianhua;
	}

	public void setJishu_dianhua(String jishuDianhua) {
		jishu_dianhua = jishuDianhua;
	}

	public String getZhandimianji() {
		return zhandimianji;
	}

	public void setZhandimianji(String zhandimianji) {
		this.zhandimianji = zhandimianji;
	}

	public String getChangfangmianji() {
		return changfangmianji;
	}

	public void setChangfangmianji(String changfangmianji) {
		this.changfangmianji = changfangmianji;
	}

	public String getAnzhuangdanwei() {
		return anzhuangdanwei;
	}

	public void setAnzhuangdanwei(String anzhuangdanwei) {
		this.anzhuangdanwei = anzhuangdanwei;
	}

	public String getJianjiandanwei() {
		return jianjiandanwei;
	}

	public void setJianjiandanwei(String jianjiandanwei) {
		this.jianjiandanwei = jianjiandanwei;
	}

	public String getDingjiandanwei() {
		return dingjiandanwei;
	}

	public void setDingjiandanwei(String dingjiandanwei) {
		this.dingjiandanwei = dingjiandanwei;
	}

	public String getLeibie() {
		return leibie;
	}

	public void setLeibie(String leibie) {
		this.leibie = leibie;
	}

	public String getFazhengjigou() {
		return fazhengjigou;
	}

	public void setFazhengjigou(String fazhengjigou) {
		this.fazhengjigou = fazhengjigou;
	}

	public String getFazhengleixing() {
		return fazhengleixing;
	}

	public void setFazhengleixing(String fazhengleixing) {
		this.fazhengleixing = fazhengleixing;
	}

	public String getBiangengriqi() {
		return biangengriqi;
	}

	public void setBiangengriqi(String biangengriqi) {
		this.biangengriqi = biangengriqi;
	}

	
	
	
}
