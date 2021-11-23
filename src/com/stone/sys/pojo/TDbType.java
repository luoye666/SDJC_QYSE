package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "SYS_DB_TYPE")
public class TDbType {
	
	@Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_DB_TYPE")
    @SequenceGenerator(name="SEQ_SYS_DB_TYPE",allocationSize=1, sequenceName="SEQ_SYS_DB_TYPE")
	@Column(name = "id")
    private Long id;
	@Column(name = "table_en")
	private String table_en;
	@Column(name = "table_ch")
	private String table_ch;
	@Column(name = "table_col")
	private String table_col;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTable_en() {
		return table_en;
	}
	public void setTable_en(String tableEn) {
		table_en = tableEn;
	}
	public String getTable_ch() {
		return table_ch;
	}
	public void setTable_ch(String tableCh) {
		table_ch = tableCh;
	}
	public String getTable_col() {
		return table_col;
	}
	public void setTable_col(String tableCol) {
		table_col = tableCol;
	}
	
	
}
