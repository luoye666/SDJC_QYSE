package com.stone.support.utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.comet4j.core.CometContext;
import org.comet4j.core.CometEngine;

public class   SendMessageUtil  implements  ServletContextListener{
	//定义一个频道
	public static final String MESSAGECHANNEL = "message";
    public  static  CometEngine engine;
 	public static void  SendMessage(String contents){
    	engine = CometContext.getInstance().getEngine();
	    engine.sendToAll(MESSAGECHANNEL,contents);
	} 
	
 	public void contextDestroyed(ServletContextEvent arg0) {
      
	}
	
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		CometContext cc = CometContext.getInstance();
        // 注册频道，即标识哪些字段可用当成频道，用来作为向前台传送数据的“通道”
       cc.registChannel(MESSAGECHANNEL);
		
	}
	
	
	
}
