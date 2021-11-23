package com.stone.sys.pojo;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "SYS_DB_DATA")
public class TDbData {
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_DB_DATA")
    @SequenceGenerator(name="SEQ_SYS_DB_DATA",allocationSize=1, sequenceName="SEQ_SYS_DB_DATA")
	@Column(name = "id")
    private Long id;
	@Column(name = "PARENT_ID")
	private Long parentId;
	@Column(name = "col_en")
	private String col_en;
	@Column(name = "col_ch")
	private String col_ch;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	public String getCol_en() {
		return col_en;
	}
	public void setCol_en(String colEn) {
		col_en = colEn;
	}
	public String getCol_ch() {
		return col_ch;
	}
	public void setCol_ch(String colCh) {
		col_ch = colCh;
	}
	
	
	
}
