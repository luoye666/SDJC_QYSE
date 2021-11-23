package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;



@Entity
@Table(name = "SYS_SHEBEI_YIQI_YSJL")
public class TShebeiYiqiYsjl implements java.io.Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7893993937805499056L;

	@Id
	@Column(name="ANNALID")
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_SHEBEI_YIQI_YSJL")
    @SequenceGenerator(name="SEQ_SYS_SHEBEI_YIQI_YSJL",allocationSize=1, sequenceName="SEQ_SYS_SHEBEI_YIQI_YSJL")
	private Long id;
	
	private String yiqimingcheng;
	
	private String xinghao;
	
	private String neibubianhao;
	
	private String state;
	
	private Long ysjlid;//ysjlid	number	y			原始记录主键

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

	public Long getYsjlid() {
		return ysjlid;
	}

	public void setYsjlid(Long ysjlid) {
		this.ysjlid = ysjlid;
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
}
