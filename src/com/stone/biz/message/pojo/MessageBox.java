package com.stone.biz.message.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 消息提示
 * @author Chao
 * 2014-04-29
 */


@Entity
@Table(name="BIZ_MESSAGE_BOX")
public class MessageBox {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_BIZ_MESSAGE_BOX")
	@SequenceGenerator(name = "SEQ_BIZ_MESSAGE_BOX", allocationSize = 1, sequenceName = "SEQ_BIZ_MESSAGE_BOX")
//	
//	列表项目：发布时间、发布人、发布内容（最多取两行，剩下的以...显示），附件（没有显示无，有显示曲别针图标，点击可以下载）
//
//表单内容：
//发布时间：精确到时分秒，自动取服务器时间，不要去本地时间
//是否置顶：是否，默认为否
//发布内容：文本编辑器最好
//发布内容类别：
//发布人：当前用户，要显示用户的组织机构明细，如：王小二【菏泽市质量技术监督局/牡丹区市场监管局/七里河监管所】
//阅读者类型：质监局 特检机构 使用单位 安装单位 四个框复选；默认选中质监局；
//阅读者：默认是用户的所属区划，不可以选更高级别，可以复选市、县区，如省局用户，默认山东省，则全省都可以看；烟台市局用户，默认为烟台，但是可以在烟台下面复选县区，但不可以选择其他地市；如果是县区用户，则锁死县区，不能选择；
//附件：上传附件，提示最大10M

	private Long id; //主键
	
	private String createDate;//创建时间 精确到时分秒，自动取服务器时间，不要去本地时间
	
	private String isUp; //是否置顶：是否，默认为否   0否 1 是
	
	private String content;//内容 文本编辑器最好
	
	private String leibie;//发布内容类别：1通知公告、2紧急通知、3软件功能、4版本更新、5征求意见，默认为软件功能。
	
	private String faburen;//发布人 当前用户，要显示用户的组织机构明细，如：王小二【菏泽市质量技术监督局/牡丹区市场监管局/七里河监管所】
	
	private String jigou;//接收机构  阅读者类型：1质监局  2特检机构  3使用单位  4安装单位 四个框复选；默认选中质监局；
	
	private String yueduzhe; //阅读者：默认是用户的所属区划，不可以选更高级别，可以复选市、县区，如省局用户，默认山东省，则全省都可以看；烟台市局用户，默认为烟台，但是可以在烟台下面复选县区，但不可以选择其他地市；如果是县区用户，则锁死县区，不能选择；
	
	private String filePath; //附件：上传附件，提示最大10M
	
	private String title; //标题 
	
	private String loginId; //发布人登陆名（备用可以用于删除等操作）
	
	private String status;// 状态 0 已保存 1 已发布 3 已删除（待定）
	
	private String code; //地市区县代码 （取代阅读者） 如果地市多选设置关联表
	
	private String name;// 地市名称（取代阅读者） 如果地市多选设置关联表
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFaburen() {
		return faburen;
	}

	public void setFaburen(String faburen) {
		this.faburen = faburen;
	}

	public String getJigou() {
		return jigou;
	}

	public void setJigou(String jigou) {
		this.jigou = jigou;
	}

	public String getIsUp() {
		return isUp;
	}

	public String getYueduzhe() {
		return yueduzhe;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setIsUp(String isUp) {
		this.isUp = isUp;
	}

	public void setYueduzhe(String yueduzhe) {
		this.yueduzhe = yueduzhe;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getLoginId() {
		return loginId;
	}

	public String getStatus() {
		return status;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCode() {
		return code;
	}

	public String getName() {
		return name;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLeibie() {
		return leibie;
	}

	public void setLeibie(String leibie) {
		this.leibie = leibie;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
}
