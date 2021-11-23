package com.stone.biz.jcsj.pojo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 
 * 设备基本信息
 * 
 */
@Entity
@Table(name="BIZ_SE")
public class TBaseInfoCache implements java.io.Serializable {
	
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
	 * 设备品种
	 */
	private String shebeipinzhong;
	
	/**
	 * 设备代码
	 */
	private String shebeidaima;
	
	/**
	 * 设备型号
	 */
	private String shebeixinghao;
	
	/**
	 * 设备注册代码 
	 */
	private String zhucedaima;
	
	/**
	 * 区划名称
	 */
	private String quhuamingcheng;
	
	/**
	 * 是否注册 0 未注册    1 已注册---定期检监  2  已告知----安装监检  3 已停用  4 改造维修监检 5拆除 6待办 7报废
	 */
	private String zcstatus="0";
	
	private String shi;
	private String xiangzhen;
	
	/**
	 * 使用单位
	 */
	private Long   shiyongdanweiId;
	private String shiyongdanwei;  //使用单位 
	
	/**
	 * 使用登记证编号
	 */
	private String dengjizhengbianhao;
	
	/**
	 * 标注设备类型
	 */
	private String biaozhuleixing;
	
	private Date xiacijianyanriqi; //下次检验日期
	
	private String xiangzhen_cankao; //临时使用  乡镇参考
	
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

	public String getShebeizhonglei() {
		return shebeizhonglei;
	}

	public String getShebeizhongleidaima() {
		return shebeizhongleidaima;
	}

	public String getShebeileibie() {
		return shebeileibie;
	}

	public String getShebeipinzhong() {
		return shebeipinzhong;
	}

	public String getShebeidaima() {
		return shebeidaima;
	}

	public String getShebeixinghao() {
		return shebeixinghao;
	}

	public String getZhucedaima() {
		return zhucedaima;
	}

	public String getQuhuamingcheng() {
		return quhuamingcheng;
	}

	public String getZcstatus() {
		return zcstatus;
	}

	public String getShi() {
		return shi;
	}

	public String getXiangzhen() {
		return xiangzhen;
	}

	public Long getShiyongdanweiId() {
		return shiyongdanweiId;
	}

	public String getShiyongdanwei() {
		return shiyongdanwei;
	}

	public String getDengjizhengbianhao() {
		return dengjizhengbianhao;
	}

	public String getBiaozhuleixing() {
		return biaozhuleixing;
	}

	public Date getXiacijianyanriqi() {
		return xiacijianyanriqi;
	}

	public String getXiangzhen_cankao() {
		return xiangzhen_cankao;
	}

	public void setShebeimingcheng(String shebeimingcheng) {
		this.shebeimingcheng = shebeimingcheng;
	}

	public void setShebeizhonglei(String shebeizhonglei) {
		this.shebeizhonglei = shebeizhonglei;
	}

	public void setShebeizhongleidaima(String shebeizhongleidaima) {
		this.shebeizhongleidaima = shebeizhongleidaima;
	}

	public void setShebeileibie(String shebeileibie) {
		this.shebeileibie = shebeileibie;
	}

	public void setShebeipinzhong(String shebeipinzhong) {
		this.shebeipinzhong = shebeipinzhong;
	}

	public void setShebeidaima(String shebeidaima) {
		this.shebeidaima = shebeidaima;
	}

	public void setShebeixinghao(String shebeixinghao) {
		this.shebeixinghao = shebeixinghao;
	}

	public void setZhucedaima(String zhucedaima) {
		this.zhucedaima = zhucedaima;
	}

	public void setQuhuamingcheng(String quhuamingcheng) {
		this.quhuamingcheng = quhuamingcheng;
	}

	public void setZcstatus(String zcstatus) {
		this.zcstatus = zcstatus;
	}

	public void setShi(String shi) {
		this.shi = shi;
	}

	public void setXiangzhen(String xiangzhen) {
		this.xiangzhen = xiangzhen;
	}

	public void setShiyongdanweiId(Long shiyongdanweiId) {
		this.shiyongdanweiId = shiyongdanweiId;
	}

	public void setShiyongdanwei(String shiyongdanwei) {
		this.shiyongdanwei = shiyongdanwei;
	}

	public void setDengjizhengbianhao(String dengjizhengbianhao) {
		this.dengjizhengbianhao = dengjizhengbianhao;
	}

	public void setBiaozhuleixing(String biaozhuleixing) {
		this.biaozhuleixing = biaozhuleixing;
	}

	public void setXiacijianyanriqi(Date xiacijianyanriqi) {
		this.xiacijianyanriqi = xiacijianyanriqi;
	}

	public void setXiangzhen_cankao(String xiangzhenCankao) {
		xiangzhen_cankao = xiangzhenCankao;
	}

    
	
	
}