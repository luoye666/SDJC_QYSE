package com.stone.sys.action;

import cn.hutool.core.util.StrUtil;
import com.opensymphony.xwork2.ActionContext;
import com.stone.para.IConstant;
import com.stone.support.utils.AesUtils;
import com.stone.sys.pojo.TLog;
import com.stone.sys.pojo.TUser;
import com.stone.sys.service.impl.UserServiceImpl;
import frm.ssh.action.BaseAction;

import javax.servlet.http.Cookie;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Date;

@SuppressWarnings("serial")
public class AccountAction extends BaseAction {
	
	private TUser user;
	private UserServiceImpl userService;
	
	public void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}
	public TUser getUser() {
		return user;
	}
	public void setUser(TUser user) {
		this.user = user;
	}
	
	public String login() throws Exception{
		
		String yzm = super.getParameter("yzm");
		if ("".equals(yzm)) {
			return "login_error";
		}
		
		String result = userService.verifyYzm(yzm);

        //存进session,用于验证
        super.getSession().setAttribute("yanzhengma", "");
        //存进session,用于验证
        ActionContext.getContext().getSession().put("yanzhengma", "");

		if ("0".equals(result)) {
			super.addActionError("验证码错误!");
			return "login_error";
		}
		
		if(super.getSession().getAttribute(IConstant.SESSION_TUSER) != null){
			TUser tuser = (TUser)super.getSession().getAttribute(IConstant.SESSION_TUSER);
			if("0".equals(tuser.getShstate()) || "1".equals(tuser.getShstate())){
				return "login_sh";
			}
			if(this.user == null){
				return "login_success";
			}
			if(tuser.getLoginId().equals(user.getLoginId())){
				return "login_success";
			}
		}
		
		if(this.user==null || "".equals(this.user.getLoginId()) || "".equals(this.user.getPassword())){
			super.addActionError("用户名/密码不能为空");
			return "login_error";
		}
		
		
		String pwd = this.user.getPassword();

		String key = super.getParameter("key");

		if (StrUtil.isEmpty(pwd) || StrUtil.isEmpty(key)) {
			super.addActionError("账号或密码错误,请重新输入");
			return "login_error";
		}
		
		pwd = AesUtils.decrypt(pwd, key);
		TUser currUser = userService.findByLoginid(this.user.getLoginId());

		//判断用户是否为空
		if(currUser == null){
			super.addActionError("账号或密码错误,请重新输入");
			return "login_error";
		}else{
			// 连续登录失败5次，并且距离上次登录失败时间不足半小时，锁定账号半小时
			if (currUser.getErrorCount() != null && currUser.getErrorCount() == 5
					&& currUser.getErrorLoginTime() != null) {
				// 判断距离上次登录失败是否在半小时之内，如果是则提示用户当前已锁定
				currUser.getErrorLoginTime().setTime(currUser.getErrorLoginTime().getTime() + 1000 * 60 * 30);
				if (new Date().before(currUser.getErrorLoginTime())) {
					super.addActionError("因连续登录失败5次，目前已锁定，请30分钟后重试");
					return "login_error";
				}
			}
			// 判断密码是否正确 RsaUtils.decrypt(currUser.getPassword())
			if (!StrUtil.equals(currUser.getPassword(), pwd)) {
				super.addActionError("账号或密码错误,请重新输入,错误次数超过5次将锁定账号30分钟");
				// 如果登录失败次数为空或者大于等于5次时，初始化为0，否则默认当前失败次数
				int errorCount = currUser.getErrorCount() == null || currUser.getErrorCount() >= 5 ? 0 : currUser
						.getErrorCount();
				// 存在失败次数与失败时间时
				if (errorCount != 0 && currUser.getErrorLoginTime() != null) {
					// 判断距离上次登录失败是否在半小时之内，如果是则累加，否则重置
					currUser.getErrorLoginTime().setTime(currUser.getErrorLoginTime().getTime() + 1000 * 60 * 30);
					if (new Date().before(currUser.getErrorLoginTime())) {
						errorCount++;
					} else {
						errorCount = 1;
					}
				}
				currUser.setErrorCount(errorCount);
				currUser.setErrorLoginTime(new Date());
				userService.update(currUser);
				return "login_error";
				// 判断账户状态是否正常,过滤管理员账户
			} else if(!currUser.getState().equals(TUser.STATE_NORMAL)){
				super.addActionError("用户状态异常,不能完成登录");
				return "login_error";
			}else if("0".equals(currUser.getShstate()) || "1".equals(currUser.getShstate())){
				this.setSessionAttribute(IConstant.SESSION_TUSER, currUser);
				return "login_sh";
			}else{
				// 登录成功时清除登录失败的标记
				if (currUser.getErrorLoginTime() != null) {
					currUser.setErrorLoginTime(null);
					currUser.setErrorCount(0);
					userService.update(currUser);
				}
				
//				if("3702".equals(currUser.getShidaima())){
//					return "qingdao";
//				}
				//登录成功,将用户信息存放在Session中
				//向Session中放入用户数据
//				if(user.getToken() != null && user.getToken().toString().length() > 2){
//					userService.updateByHql("update TUser set token = '"+user.getToken()+"' where id = "+currUser.getId());
//				}
				//用户信息
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
	}
	
	public String ssoLogin() throws Exception{
		
		String token = super.getParameter("token");
		
		if(!"dfsdfimsdigl32l".equals(token)){
			return "login_error";
		}
		
		
		TUser currUser = new TUser();
		currUser.setPassword("123sdfsdf@@@");
		currUser.setLoginId("learn");
		currUser.setName("全员学习");
		//判断用户是否为空
		if(currUser == null){
			super.addActionError("账户不存在");
			return "login_error";
		}else{
			// 连续登录失败5次，并且距离上次登录失败时间不足半小时，锁定账号半小时
			if (currUser.getErrorCount() != null && currUser.getErrorCount() == 5
					&& currUser.getErrorLoginTime() != null) {
				// 判断距离上次登录失败是否在半小时之内，如果是则提示用户当前已锁定
				currUser.getErrorLoginTime().setTime(currUser.getErrorLoginTime().getTime() + 1000 * 60 * 30);
				if (new Date().before(currUser.getErrorLoginTime())) {
					super.addActionError("因连续登录失败5次，目前已锁定，请30分钟后重试");
					return "login_error";
				}
			}
			// 判断密码是否正确 RsaUtils.decrypt(currUser.getPassword())
			if(!currUser.getState().equals(TUser.STATE_NORMAL)){
				super.addActionError("用户状态异常,不能完成登录");
				return "login_error";
			}else if("0".equals(currUser.getShstate()) || "1".equals(currUser.getShstate())){
				this.setSessionAttribute(IConstant.SESSION_TUSER, currUser);
				return "login_sh";
			}else{
				// 登录成功时清除登录失败的标记
				if (currUser.getErrorLoginTime() != null) {
					currUser.setErrorLoginTime(null);
					currUser.setErrorCount(0);
					userService.update(currUser);
				}
				
//				if("3702".equals(currUser.getShidaima())){
//					return "qingdao";
//				}
				//登录成功,将用户信息存放在Session中
				//向Session中放入用户数据
//				if(user.getToken() != null && user.getToken().toString().length() > 2){
//					userService.updateByHql("update TUser set token = '"+user.getToken()+"' where id = "+currUser.getId());
//				}
				//用户信息
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
	}
	
	public String logout() throws Exception{
		//删除Session
		super.getSession().invalidate();
		return LOGIN;
	}
	
}
