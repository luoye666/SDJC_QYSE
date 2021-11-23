package com.stone.biz.message.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="BIZ_MESSAGE_ORGAN")
public class TMessageBoxOrgan {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_BIZ_MESSAGE_BOX_ORGAN")
	@SequenceGenerator(name = "SEQ_BIZ_MESSAGE_BOX_ORGAN", allocationSize = 1, sequenceName = "SEQ_BIZ_MESSAGE_BOX_ORGAN")
	private Long id; //主键
	
	private String organCode; //地市代码
	
	private Long mid; //通知表主键

	public Long getId() {
		return id;
	}

	public String getOrganCode() {
		return organCode;
	}

	public Long getMid() {
		return mid;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}

	public void setMid(Long mid) {
		this.mid = mid;
	}
	
	
}
