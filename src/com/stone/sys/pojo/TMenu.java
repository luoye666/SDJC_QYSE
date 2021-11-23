package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.SequenceGenerator;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "SYS_MENU")
public class TMenu implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1561024243322797686L;

	@Id
	@Column(name="MENU_ID")
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_MENU")
    @SequenceGenerator(name="SEQ_SYS_MENU",allocationSize=1, sequenceName="SEQ_SYS_MENU")
    private Long id;
    
	@Column(name="PARENT_ID")
    private Long parentId;
     
	@Column(name="ICON_CLS")
    private String iconCls;

	@Column(name="TITLE")
    private String title;
    
	@Column(name="NOTES")
    private String notes;
    
	@Column(name="URL")
    private String url;
    
	@Column(name="QTIP")
    private String qtip;
    
    @Column(name="BTN_ID")
    private Long btnId;
    
    @Column(name="BTN_CODE")
    private String btnCode;

	@Column(name="SORT_NUM")
    private Long sortNum;
	
	@Column(name="COL_NUM")
	private String colNum;
	
	private String style_class;
	private String tabid;
	
    
	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
    
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
    
    public String getBtnCode() {
		return btnCode;
	}

	public void setBtnCode(String btnCode) {
		this.btnCode = btnCode;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url == null ? "" : url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getQtip() {
		return qtip == null ? "" : qtip;
	}

	public void setQtip(String qtip) {
		this.qtip = qtip;
	}

	public Long getBtnId() {
		return btnId;
	}

	public void setBtnId(Long btnId) {
		this.btnId = btnId;
	}

	public Long getSortNum() {
		return sortNum;
	}

	public void setSortNum(Long sortNum) {
		this.sortNum = sortNum;
	}

	public String getColNum() {
		return colNum;
	}

	public void setColNum(String colNum) {
		this.colNum = colNum;
	}

	public String getStyle_class() {
		return style_class;
	}

	public void setStyle_class(String styleClass) {
		style_class = styleClass;
	}

	public String getTabid() {
		return tabid;
	}

	public void setTabid(String tabid) {
		this.tabid = tabid;
	}
    
	
}