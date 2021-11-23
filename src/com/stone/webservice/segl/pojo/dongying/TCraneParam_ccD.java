package com.stone.webservice.segl.pojo.dongying;

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
public class TCraneParam_ccD extends TBaseInfoD implements java.io.Serializable{
	

	private String paizhaohaoma;//牌照号码
	private String cheliangmingcheng;
	private String changpaixinghao;
	private String shiyongquyu;
	private String qudong;
	private	String donglifangshi;
	private String edingzaikerenshu;
	private String zhengchezhiliang; 
	private String edingqizhongliang;
	private String zizhong; 
	private String yanse; 
	private String tuoguache;
	private	String chejiabianhao;
	private String fadongjibianhao;
	private String zuigaoshisu; 
	private String liechechexiangshu;
	private String chexiangzuoweishu; 
	private String zhutijiegouxingshi;
	public String getPaizhaohaoma() {
		return paizhaohaoma;
	}
	public void setPaizhaohaoma(String paizhaohaoma) {
		this.paizhaohaoma = paizhaohaoma;
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
	public String getShiyongquyu() {
		return shiyongquyu;
	}
	public void setShiyongquyu(String shiyongquyu) {
		this.shiyongquyu = shiyongquyu;
	}
	public String getQudong() {
		return qudong;
	}
	public void setQudong(String qudong) {
		this.qudong = qudong;
	}
	public String getDonglifangshi() {
		return donglifangshi;
	}
	public void setDonglifangshi(String donglifangshi) {
		this.donglifangshi = donglifangshi;
	}
	public String getEdingzaikerenshu() {
		return edingzaikerenshu;
	}
	public void setEdingzaikerenshu(String edingzaikerenshu) {
		this.edingzaikerenshu = edingzaikerenshu;
	}
	public String getZhengchezhiliang() {
		return zhengchezhiliang;
	}
	public void setZhengchezhiliang(String zhengchezhiliang) {
		this.zhengchezhiliang = zhengchezhiliang;
	}
	public String getEdingqizhongliang() {
		return edingqizhongliang;
	}
	public void setEdingqizhongliang(String edingqizhongliang) {
		this.edingqizhongliang = edingqizhongliang;
	}
	public String getZizhong() {
		return zizhong;
	}
	public void setZizhong(String zizhong) {
		this.zizhong = zizhong;
	}
	public String getYanse() {
		return yanse;
	}
	public void setYanse(String yanse) {
		this.yanse = yanse;
	}
	public String getTuoguache() {
		return tuoguache;
	}
	public void setTuoguache(String tuoguache) {
		this.tuoguache = tuoguache;
	}
	public String getChejiabianhao() {
		return chejiabianhao;
	}
	public void setChejiabianhao(String chejiabianhao) {
		this.chejiabianhao = chejiabianhao;
	}
	public String getFadongjibianhao() {
		return fadongjibianhao;
	}
	public void setFadongjibianhao(String fadongjibianhao) {
		this.fadongjibianhao = fadongjibianhao;
	}
	public String getZuigaoshisu() {
		return zuigaoshisu;
	}
	public void setZuigaoshisu(String zuigaoshisu) {
		this.zuigaoshisu = zuigaoshisu;
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
	public String getZhutijiegouxingshi() {
		return zhutijiegouxingshi;
	}
	public void setZhutijiegouxingshi(String zhutijiegouxingshi) {
		this.zhutijiegouxingshi = zhutijiegouxingshi;
	}

	
}