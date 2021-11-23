package com.stone.sys.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "SYS_USER")
public class TJCUser implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1870848009524384596L;
	/**
	 * 用户状态：正常
	 */
	public static final Integer STATE_NORMAL = 1;
	/**
	 * 用户状态：停用
	 */
	public static final Integer STATE_STOP = 0; 
	/**
	 * 用户类型：管理员 
	 */
	public static final Integer TYPE_ADMIN = 1;
	/**
	 * 用户类型：普通用户
	 */
	public static final Integer TYPE_NORMAL = 0;
	
	@Id
	@Column(name="USER_ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_SYS_USER")
    @SequenceGenerator(name="SEQ_SYS_USER",allocationSize=1, sequenceName="SEQ_SYS_USER")
	private Long id;			//主键ID
	
	@Column(name="LOGIN_ID")
	private String loginId;		//登录ID
    @Column(name="NAME")
	private String name;		//用户名称
    @Column(name="PASSWORD")
	private String password;	//密码
    @Column(name="TEL")
	private String tel;			//电话号码
    @Column(name="MOBILE")
	private String mobile;		//手机号码
    @Column(name="EMAIL")
	private String email;		//电子邮箱
    @Column(name="STATE")
	private Integer state;		//用户状态
    @Column(name="NOTES")
	private String notes;		//用户说明
	@Column(name="IS_ADMIN")
    private Integer isAdmin;	//是否是管理员
	@Column(name="SORT_NUM")
    private Integer sortNum;	//排序编号
	@Column(name="IMAGE_PATH")
    private String imagePath;	//图片路径
	@Column(name="ORGAN_ID")
	private Long organId;		//机构ID
	@Column(name="MYSELF_DESK")
	private String myselfDesk;	//桌面设置
	@Column(name="DAIBAN_ID")
	private String daibanId;//代办列表id
	@Column(name="FENZU_ID")
	private String fenzuId;//任务分组id
	
	private String isZuzhang;//是否组长   0 否 1 是 
	
	private String styleCode;//样式

	private String indexHref;//首页显示内容

	private String sejyinfo;//设备检验信息是否可修改   0 可  1 不可
	
	private String user_type;//账号类型
	
	private String shebeizhonglei;//所管辖的设备种类
	
	private String suoshushi;//所管辖的地市
	
	public Long getOrganId() {
		return organId;
	}
	public void setOrganId(Long organId) {
		this.organId = organId;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public Integer getSortNum() {
		return sortNum;
	}
	public void setSortNum(Integer sortNum) {
		this.sortNum = sortNum;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Integer getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getMyselfDesk() {
		return myselfDesk;
	}
	public void setMyselfDesk(String myselfDesk) {
		this.myselfDesk = myselfDesk;
	}
	public String getDaibanId() {
		return daibanId;
	}
	public void setDaibanId(String daibanId) {
		this.daibanId = daibanId;
	}
	public String getStyleCode() {
		return styleCode;
	}
	public void setStyleCode(String styleCode) {
		this.styleCode = styleCode;
	}
	public String getFenzuId() {
		return fenzuId;
	}
	public void setFenzuId(String fenzuId) {
		this.fenzuId = fenzuId;
	}
	public String getIsZuzhang() {
		return isZuzhang;
	}
	public void setIsZuzhang(String isZuzhang) {
		this.isZuzhang = isZuzhang;
	}
	public String getIndexHref() {
		return indexHref;
	}
	public void setIndexHref(String indexHref) {
		this.indexHref = indexHref;
	}
	public String getSejyinfo() {
		return sejyinfo;
	}
	public void setSejyinfo(String sejyinfo) {
		this.sejyinfo = sejyinfo;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String userType) {
		user_type = userType;
	}
	public String getShebeizhonglei() {
		return shebeizhonglei;
	}
	public void setShebeizhonglei(String shebeizhonglei) {
		this.shebeizhonglei = shebeizhonglei;
	}
	public String getSuoshushi() {
		return suoshushi;
	}
	public void setSuoshushi(String suoshushi) {
		this.suoshushi = suoshushi;
	}
	
}
