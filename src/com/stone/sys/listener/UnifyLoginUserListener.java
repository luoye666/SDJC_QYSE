package com.stone.sys.listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.stone.para.IConstant;
import com.stone.support.utils.SpringApplicationTool;
import com.stone.sys.pojo.TUser;
import com.stone.sys.service.impl.UserServiceImpl;


/**
 * 用户统一登录监听
 * @author Administrator
 *
 */
public class UnifyLoginUserListener implements ServletContextAttributeListener,
		HttpSessionAttributeListener {

	private UserServiceImpl userLoginService;
	
	public void attributeAdded(ServletContextAttributeEvent event) {
	}

	public void attributeRemoved(ServletContextAttributeEvent event) {
	}

	public void attributeReplaced(ServletContextAttributeEvent event) {
	}

	/**
	 * session创建后触发该方法，将session信息添加到集合中
	 */
	public void attributeAdded(HttpSessionBindingEvent event) {
		if (event.getName().equals(IConstant.SESSION_TUSER)) {
			//获取session信息
			HttpSession session = event.getSession();
			if(session!=null){
				userLoginService=(UserServiceImpl)SpringApplicationTool.getBean("userService");
				//获得用户信息
				TUser user=(TUser)event.getValue();
				userLoginService.saveLoginNotesAndLog(user);
			}
		}
	}

	/**
	 * session被清除里触发，一般用户用户退出时
	 */
	public void attributeRemoved(HttpSessionBindingEvent event) {
		if (event.getName().equals(IConstant.SESSION_TUSER)) {
			//获得用户信息
			TUser user=(TUser)event.getValue();
			userLoginService=(UserServiceImpl)SpringApplicationTool.getBean("userService");
			userLoginService.deleteLoginNotes(user);
			userLoginService.saveLoginOutLogs(user);
		}
	}

	/**
	 * session被替换时触发,将原有的用户session保存的信息删除，放置新的
	 */
	public void attributeReplaced(HttpSessionBindingEvent event) {
		if (event.getName().equals(IConstant.SESSION_TUSER)) {
			//获得用户信息
			TUser user=(TUser)event.getValue();
			userLoginService=(UserServiceImpl)SpringApplicationTool.getBean("userService");
			userLoginService.saveLoginNotesAndLog(user);
		}
	}

}
