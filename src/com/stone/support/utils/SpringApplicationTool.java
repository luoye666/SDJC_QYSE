package com.stone.support.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ApplicationObjectSupport;

import frm.ssh.util.SpringUtil;

/**
 * 获取Spring的工具类
 * 
 * @author Administrator
 * 
 */
public class SpringApplicationTool extends ApplicationObjectSupport {

	private static ApplicationContext applicationContext = null;

	@Override
	protected void initApplicationContext(ApplicationContext context)
			throws BeansException {
		super.initApplicationContext(context);
		if (SpringApplicationTool.applicationContext == null) {
			SpringApplicationTool.applicationContext = context;
		}
	}

	public static ApplicationContext getAppContext() {
		return applicationContext;
	}

	public static Object getBean(String name) {
		return SpringUtil.getInstance().getBean(name);
	//	return getAppContext().getBean(name);
	}

}
