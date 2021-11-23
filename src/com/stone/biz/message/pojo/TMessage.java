package com.stone.biz.message.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 工作流-消息提醒
 */
@Entity
@Table(name = "JBPM4_MESSAGE")
public class TMessage implements java.io.Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 8811192467498448348L;


	/**
     * 系统ID
     */
	private Long id = Long.parseLong("0");	
	
	
	/**
	 * 发送时间
	 */
	private Date sendTime;
	
	/**
	 * readers
	 */
//	private String readers;	
	
	/**
	 * 提示信息
	 */
	private String message;

	@Id
	@Column(name = "ID")
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_JBPM_MESSAGE")
    @SequenceGenerator(name="SEQ_JBPM_MESSAGE",allocationSize=1, sequenceName="SEQ_JBPM_MESSAGE")
    public Long getId() {
		
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    
	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}