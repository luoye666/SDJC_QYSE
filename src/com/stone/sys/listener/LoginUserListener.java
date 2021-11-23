package com.stone.sys.listener;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.stone.para.IConstant;
import com.stone.support.utils.SpringApplicationTool;
import com.stone.sys.pojo.TUser;
import com.stone.sys.service.impl.RoleServiceImpl;
/**
 * session监听 用于在线用户统计
 * @author Administrator
 *
 */
public class LoginUserListener implements ServletContextAttributeListener,
		HttpSessionAttributeListener {

	
	private RoleServiceImpl roleService;
	
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
		roleService=(RoleServiceImpl)SpringApplicationTool.getBean("roleService");
		if (event.getName().equals(IConstant.SESSION_TUSER)) {
			//获取session信息
			HttpSession session = event.getSession();
			if(session!=null){
				//获得用户信息
				TUser user=(TUser)event.getValue();
				user.setLoginTime(new Date().toLocaleString());
				//获得application信息
				ServletContext application = session.getServletContext();
				//从application中获得session列表
				HashMap<String,Object> hashSet=(HashMap<String,Object>)application.getAttribute(IConstant.APPLICATION_SESSION);
				//判断列表数据是否为空 如果为空 需要实例化sessionlist
				if(hashSet==null){
					hashSet=new HashMap<String,Object>();
				}
				if(hashSet.get(user.getId())==null){
					//判断用户的session是否已经存在，如果已经存在则不在添加
					//将新增用户添加到list中
					hashSet.put(user.getId().toString(),user);
					application.setAttribute(IConstant.APPLICATION_SESSION, hashSet);
				}
			}
		}
	}

	/**
	 * session被清除里触发，一般用户用户退出时
	 */
	public void attributeRemoved(HttpSessionBindingEvent event) {
		if (event.getName().equals(IConstant.SESSION_TUSER)) {
			//获取session信息
			HttpSession session = event.getSession();
			//获得用户信息
			TUser user=(TUser)event.getValue();
			ServletContext application = session.getServletContext();
			//从application中获得session列表
			HashMap<String,Object> hashSet=(HashMap<String,Object>)application.getAttribute(IConstant.APPLICATION_SESSION);
			if(hashSet!=null){
				hashSet.remove(user.getId().toString());
				//将剩余的放置在application中
				application.setAttribute(IConstant.APPLICATION_SESSION, hashSet);
			}
		}
	}

	/**
	 * session被替换时触发,将原有的用户session保存的信息删除，放置新的
	 */
	public void attributeReplaced(HttpSessionBindingEvent event) {
		if (event.getName().equals(IConstant.SESSION_TUSER)) {
			//获取session信息
			HttpSession session = event.getSession();
			//获得用户信息
			TUser user=(TUser)event.getValue();
			user.setLoginTime(new Date().toLocaleString());
			ServletContext application = session.getServletContext();
			//从application中获得session列表
			HashMap<String,Object> hashSet=(HashMap<String,Object>)application.getAttribute(IConstant.APPLICATION_SESSION);
			if(hashSet!=null){
				hashSet.remove(user.getId().toString());
				//将剩余的放置在application中
				hashSet.put(user.getId().toString(),user);
				application.setAttribute(IConstant.APPLICATION_SESSION, hashSet);
			}
		}
	}

}
