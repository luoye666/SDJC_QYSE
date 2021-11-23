package com.stone.sys;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyListener implements ServletContextListener {

	private Timer timer = null;

	public void contextInitialized(ServletContextEvent event) {
		//获得当天的日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
		Date date = new Date();
		//定义开始时间字符串
		String timeStr = "01:00:00"; 
		timeStr = sdf.format(date)+timeStr;
		//获得当天的指定时间的date对象
		sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			date = sdf.parse(timeStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//判断今天的执行时间是否已经过去，如果过去则改为明天
		if(date.getTime()<System.currentTimeMillis()){
			date = new Date(date.getTime()+24*60*60*1000);
		}
		timer = new Timer(false);
	    timer.schedule(new MyTask(),0, 24*60*60*1000);
		
	}
	public void contextDestroyed(ServletContextEvent event) {
		timer.cancel();
	}
}