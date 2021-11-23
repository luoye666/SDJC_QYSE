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
public class TBaseInfoJyxx implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 62907824677970707L;
	
	/************************************************设备信息***********************************************/
	/**
	 * Id
	 */
	private Long id;
	
	//临时数据状态       0  正式数据  1 临时数据   点击保存后生成的数据
	private String tmpData;
	
	/********************************************报告信息******************************************************/
	//检验结构
	private String jianyanjigou;
	
	/**
	 * 报告编号
	 */
	private String baogaobianhao;
	
	/**
	 * 设备信息使用  保存 报告结论
	 */
	private String jianyanjielun;
	
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
	
	
	private Date updateTime; //设备更改日期  （历史记录修改时间）
	
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SE")
    @SequenceGenerator(name="SEQ_SE",allocationSize=1, sequenceName="SEQ_SE")
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

	public String getTmpData() {
		return tmpData;
	}

	public void setTmpData(String tmpData) {
		this.tmpData = tmpData;
	}

	public String getJianyanjigou() {
		return jianyanjigou;
	}

	public void setJianyanjigou(String jianyanjigou) {
		this.jianyanjigou = jianyanjigou;
	}

	public String getBaogaobianhao() {
		return baogaobianhao;
	}

	public void setBaogaobianhao(String baogaobianhao) {
		this.baogaobianhao = baogaobianhao;
	}

	public String getJianyanjielun() {
		return jianyanjielun;
	}

	public void setJianyanjielun(String jianyanjielun) {
		this.jianyanjielun = jianyanjielun;
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

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
}