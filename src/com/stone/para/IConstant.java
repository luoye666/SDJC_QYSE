package com.stone.para;

/**
 * 常量。
 * 
 * @author JZ
 * @since 2009/07/06
 */
public interface IConstant {
	
	/**
	 * 日志阻拦器不记录日志的方法	
	 */
	String[] METHOD_ARRAY = {"find", "get", "init", "check", "showImage"};
	
	/**
	 * 点击左侧树不清除的SESSION
	 */
	String SESSION_UNREMOVE = "SESSION_TUSER,SESSION_TORGAN,SESSION_TORGAN_CODE,SESSION_ISCITY,SESSION_ISADMIN,SESSION_ROLES,SESSION_SIGN,";

	
	/**
	 * Session中存放用户TUser实体
	 */
	String SESSION_TUSER = "SESSION_TUSER";
	
	/**
	 * Session中存放用户TOrgan实体
	 */
	String SESSION_TORGAN = "SESSION_TORGAN";
	
	/**
	 * Session中存放用户角色所拥有的按钮
	 */
	String SESSION_BTNS = "SESSION_BTNS";
	
	
	/**
	 * Session中存放用户所在机构的编号。
	 * 例如省局370000110。对应值为Long型。
	 */
	String SESSION_TORGAN_CODE = "SESSION_TORGAN_CODE";
	
	/**
	 * Session中存放是否是市级单位 0：不是 1：是
	 */
	String SESSION_ISCITY = "SESSION_ISCITY";	
	
	/**
	 * 是否超级管理员 1： 是,0：不是
	 */
	String SESSION_ISADMIN = "SESSION_ISADMIN";
	
	
	/**
	 * 用户具有的角色串
	 */
	String SESSION_ROLES = "SESSION_ROLES";
	
	/**
	 * 菜单ID
	 */
	String SESSION_MENU_ID = "SESSION_MENU_ID";
	
	/**
	 * 菜单where
	 */
	String SESSION_MENU_WHERE = "SESSION_MENU_WHERE";
	
	/**
	 * 
	 */
	String PROGRAEM_TITLE = "山东省特种设备检验管理系统";
	
	//区划
	String PARAM_XZQH_CODE = "3707";
	 
	//
	String PARAM_DEPARTMENT_NAME = "山东省特种设备检验研究院";
	
	String PARAM_DEPARTMENT_ADDR = "检验机构地址：潍坊市寒亭区高新产业园2A楼";
	
	String PARAM_DEPARTMENT_TEL = "联系电话：0536-5603066";
	
	String PARAM_DEPARTMENT_FAX = "";
	
	String PARAM_DEPARTMENT_URL = "";
	
	String PARAM_DEPARTMENT_POST = "邮政编码：261100";
	
	/**
	 * 翻页每页页数
	 */
	String PAGE_LIMIT = "20";

	/**
	 * 上传文件字节大小
	 */
	int FILE_BUFFER_SIZE = 1048576;//1024 * 1024;
	
	/**
	 * 上传文件大小(10M)
	 */
	int FILE_SIZE_TEN = 10;	
	int FILE_SIZE_HUNDRED = 1000;
	

	/**
	 * 读Excel文件大小(2M)
	 */
	int FILE_SIZE_TOW = 2;
	
	/**
	 * 读Excel文件大小(3M)
	 */
	int FILE_SIZE_THREE = 3;	
	
	/**
	 * 读Excel文件大小(4M)
	 */
	int FILE_SIZE_FOUR = 4;	
	
	/**
	 * 读Excel文件大小(5M)
	 */
	int FILE_SIZE_FIVE = 5;
	
	/**
	 * 图片类型
	 */
	String IMAGE_TYPE = ".JPG.PNG.BMP.GIF";
	
	/**
	 * 待办
	 */
	String COLOR_DB = "#000000";
	
	/**
	 * 合格
	 */
	String COLOR_HG = "#008000";
	
	/**
	 * 报检预警
	 */
	String COLOR_BJYJ = "#996600";
	
	/**
	 * 超期未检
	 */
	String COLOR_CQWJ = "#660033";

	/**
	 * 需整改
	 */
	String COLOR_XZG = "#CC0000";
	
	/**
	 * 不合格
	 */
	String COLOR_BHG = "#FF00FF";

	/**
	 * 停用
	 */
	String COLOR_TY = "#6600CC";
	
	/**
	 * 拆除
	 */
	String COLOR_CC = "#F75000";

	/**
	 * 是否签名 
	 */
	String SESSION_SIGN = "SESSION_SIGN";
	
	/**
	 * 窗口图标
	 */
	String WINDOW_ICON = "icon-application";
	/**用于统计在线人数 存放所有用户的session登录信息**/
	String APPLICATION_SESSION="SESSIONS";

}