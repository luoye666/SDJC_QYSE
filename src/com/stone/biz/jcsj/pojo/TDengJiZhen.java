package com.stone.biz.jcsj.pojo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 登记证号码提取表
 * @author admin
 *
 */
@Entity
@Table(name="BIZ_DJZHM")
public class TDengJiZhen implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Long id; 
	
	/**
	 * 登记证号码编写规则
	 */
	private String daihao; 
	
	/**
	 * 流水号
	 */
	private String xuhao; 
	
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_BIZ_DJZHM")
    @SequenceGenerator(name="SEQ_BIZ_DJZHM",allocationSize=1, sequenceName="SEQ_BIZ_DJZHM")
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

	public String getDaihao() {
		return daihao;
	}

	public String getXuhao() {
		return xuhao;
	}

	public void setDaihao(String daihao) {
		this.daihao = daihao;
	}

	public void setXuhao(String xuhao) {
		this.xuhao = xuhao;
	}
    
}
