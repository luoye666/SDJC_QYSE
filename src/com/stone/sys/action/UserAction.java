package com.stone.sys.action;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.security.SecureRandom;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;

import cn.hutool.core.util.StrUtil;

import com.stone.para.IConstant;
import com.stone.support.SupportAction;
import com.stone.support.utils.AesUtils;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TLog;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TRole;
import com.stone.sys.pojo.TUser;
import com.stone.sys.service.impl.UserServiceImpl;

import frm.ssh.exception.AppException;

public class UserAction extends SupportAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8042236303002692272L;
	private TUser user;
	private UserServiceImpl userService;
	private File file;
	private String fileFileName;
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public TUser getUser() {
		return user;
	}
	public void setUser(TUser user) {
		this.user = user;
	}
	public void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}

	public String add() throws Exception{
		this.userService.save(this.user);
		
		return SUCCESS;
	}
	
	/**
	 * 单独修改信息是不允许修改密码
	 * @return
	 * @throws Exception
	 */
	public String edit() throws Exception{

        TUser userSession =  (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);

        if (userSession.getId() != user.getId()) {
            super.addActionData(SYSTEM_ERROR_MSG, "无权限修改！");
            return SUCCESS;
        }

        String pwd = this.user.getPassword();
        String oldPassword = super.getParameter("user.oldPassword");

        boolean modifyPassword = StrUtil.isNotBlank(pwd);

        if (modifyPassword && pwd.equals(oldPassword)) {
            super.addActionData(RESULT, false);
            super.addActionData(SYSTEM_ERROR_MSG, "新密码不能与原密码一致!");
            return SUCCESS;
        }

		TUser u = (TUser)userService.findById(user.getId(), TUser.class.getName());
        if (modifyPassword && !u.getPassword().equals(oldPassword)) {
            super.addActionData(RESULT, false);
            super.addActionData(SYSTEM_ERROR_MSG, "原密码错误!");
            return SUCCESS;
        }

        if (modifyPassword) {
            u.setPassword(pwd);
        }

		u.setName(user.getName());
		u.setDanweimingcheng(user.getDanweimingcheng());
		u.setDanweidizhi(user.getDanweidizhi());
		u.setLianxiren(user.getLianxiren());
		u.setLianxidianhua(user.getLianxidianhua());

		String result = userService.updateUser(u,file,fileFileName);
		super.addActionData("msg",result);
		return SUCCESS;
	}
	public String editBySH() throws IOException, ParseException{
		String result = userService.updateUser(user,file,fileFileName);
		super.addActionData("msg",result);
		return SUCCESS;
	}
	
	public String delete() throws Exception{
		return SUCCESS;
	}
	
	public String deleteByIds() throws Exception{
		String ids = super.getParameter("ids");
		this.userService.deleteUserByIds(ids);
		
		return SUCCESS;
	}
	
	public String openUserInfo() throws Exception{
		Long id = super.getParameterLong("id");
		String type = super.getParameter("type");
		TUser u =  (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		if(u.getId().equals(id)){
			user = u;
		}else{
			return ERROR;
		}
		//审核中或拒绝的用户信息显示
		if("sh".equals(type)){
			return "OPEN_USER_SH_SUCCESS";
		}
		return "OPEN_USER_SUCCESS";
	}
	
	public String editPassword() throws Exception{
        String pwd = this.user.getPassword();
        String oldPassword = super.getParameter("user.oldPassword");

        if(this.user == null || pwd == null || oldPassword == null){
            super.addActionData(RESULT, false);
        }

        if (pwd.equals(oldPassword)) {
            super.addActionData(RESULT, false);
            super.addActionData(SYSTEM_ERROR_MSG, "新密码不能与原密码一致!");
            return SUCCESS;
        }

        TUser u = (TUser)userService.findById(user.getId(),TUser.class.getName());
        if (!u.getPassword().equals(oldPassword)) {
            super.addActionData(RESULT, false);
            super.addActionData(SYSTEM_ERROR_MSG, "原密码错误!");
            return SUCCESS;
        }

		this.userService.updatePassword(this.user.getId(), pwd);
		
		return SUCCESS;
	}
	
	public String stateDisable() throws Exception{
		String ids = super.getParameter("ids");
		this.userService.updateStateDisableByIds(ids);
		return SUCCESS;
	}

	public String stateEnable() throws Exception{
		String ids = super.getParameter("ids");
		this.userService.updateStateEnableByIds(ids);

		return SUCCESS;
	}

	public String findRolesById() throws Exception{
		Long userId = super.getParameterLong("id");
		List<TRole> roles = this.userService.findRolesByUserId(userId);
		addActionData("roles", roles);
		
		return SUCCESS;
	}
	
	public String validateLoginId() throws Exception{
		String loginId = super.getParameter("loginId");
		String type = super.getParameter("type");
		String userid = super.getParameter("userid");
		loginId = loginId.trim();
		boolean result = this.userService.validateLoginId(loginId,type,userid);
		super.addActionData("validate", result);
		return SUCCESS;
	}
	
	//修改设备检验信息的操作权限
	public String updSeJyInfoByIds(){
		String rs = super.getParameter("rs");
		String ids = super.getParameter("ids");
		userService.updSeJyInfoByIds(ids,rs);
		return SUCCESS;
	}
	//获取人员所属机构、角色信息
	public String loadInfo() throws Exception{
		Long organId = super.getParameterLong("organId");
		Long userId = super.getParameterLong("userId");
		TOrgan og = (TOrgan)userService.findById(organId, TOrgan.class.getName());
		super.addActionData("organ",og);
		super.addActionData("ssjs",userService.getRolsByUserId(userId,"name"));
		return SUCCESS;
	}
	//获取所有角色名称
	public String getRoleList(){
		super.addActionData("roles",userService.findListByHql("from TRole order by id"));
		return SUCCESS;
	}
	//获取使用单位账号能修改的设备信息字段
	public String getEditSeField(){
		String code = super.getParameter("code");
		super.addActionData("esf", userService.getEditSeField(code));
		return SUCCESS;
	}
	//验证验证码
	public String verifyYzm(){
		String yzm = super.getParameter("yzm");
		String result = userService.verifyYzm(yzm);
		super.addActionData("result", result);
		return SUCCESS;
	}
	//用户注册提交
	public String register() throws IOException{
		String pwd = this.user.getPassword();

		String key = super.getParameter("key");
		if (StrUtil.isEmpty(key)) {
			super.addActionError("账号或密码错误,请重新输入");
			return "login_error";
		}
		if (StrUtil.isEmpty(pwd)) {
			super.addActionError("账号或密码错误,请重新输入");
			return "login_error";
		}
		
		String newPwd = AesUtils.decrypt(pwd, key);
		if(newPwd.length() > 30 ){
			super.addActionError("请重新输入密码！");
			super.addActionData("msg","请重新输入密码！");
			return SUCCESS;
		}
		user.setPassword(newPwd);
		
		String result = userService.register(user,file,fileFileName);
		super.addActionData("msg",result);
		return SUCCESS;
	}
	
	/**
	 * 单点登陆验证
	 * @return
	 * @throws UnknownHostException 
	 * @throws SocketException 
	 */
	public String findDian() throws UnknownHostException, SocketException{
		String token = super.getParameter("token");
		
		TUser currUser = userService.findByToken(token);
		
		//判断用户是否为空
		if(currUser == null){
			super.addActionError("账户不存在");
			super.addActionData("token", token);
			return "login_painless";
		}else{
				this.setSessionAttribute(IConstant.SESSION_TUSER, currUser);
				
				InetAddress ia = InetAddress.getLocalHost();//ip地址
				
				byte[] mac = NetworkInterface.getByInetAddress(ia).getHardwareAddress();//mac地址
				StringBuffer sb = new StringBuffer("");
				for(int i=0; i<mac.length; i++) {
					if(i!=0) {
						sb.append("-");
					}
					//字节转换为整数
					int temp = mac[i]&0xff;
					String str = Integer.toHexString(temp);
					if(str.length()==1) {
						sb.append("0"+str);
					}else {
						sb.append(str);
					}
				}
				
				TLog log = new TLog();
				log.setUserid(currUser.getLoginId());
				log.setUsername(currUser.getName());
				log.setActionapp("AccountAction");
				log.setLogtime(new Date());
				log.setName("用户登录");
				log.setIp(ia.toString());
				log.setMac(sb.toString().toUpperCase());
				
				
				userService.save(log);
				
				String checked = super.getParameter("checked");
				
				if("on".equals(checked)){
					Cookie cookie = new Cookie("user",currUser.getLoginId()+"-"+currUser.getPassword());
					cookie.setMaxAge(360); 
				      //设置Cookie路径和域名
					
				    getResponse().addCookie(cookie); 
				    
				}else{
					Cookie[] cookies = getRequest().getCookies();
					if(cookies!=null){   
						for(int i=0;i<cookies.length;i++){
							if("user".equals(cookies[i].getName())){
								Cookie cookie = new Cookie("user",null);
								cookie.setMaxAge(0); 
							      //设置Cookie路径和域名
							    getResponse().addCookie(cookie); 
							}
						}
					}
				}
				return "login_success";
			}
		}
	
	
	
	/**
	 * 获取key
	 * 
	 * @return
	 * @throws UnknownHostException
	 * @throws SocketException
	 */
	public String getKey() throws Exception {
		String token = super.getParameter("token");
		String username = super.getParameter("username");
		if (token.length() == 0) {
			StringBuilder uid = new StringBuilder();
			// 产生16位的强随机数
			Random rd = new SecureRandom();
			for (int i = 0; i < 16; i++) {
				// 产生0-2的3位随机数
				int type = rd.nextInt(3);
				switch (type) {
				case 0:
					// 0-9的随机数
					uid.append(rd.nextInt(10));
					break;
				case 1:
					// ASCII在65-90之间为大写,获取大写随机
					uid.append((char) (rd.nextInt(25) + 65));
					break;
				case 2:
					// ASCII在97-122之间为小写，获取小写随机
					uid.append((char) (rd.nextInt(25) + 97));
					break;
				default:
					break;
				}
			}
			token = uid.toString();
		}
		super.addActionData("key", token);
		return SUCCESS;
	}

}
