package com.stone.sys.action;

import java.io.ByteArrayInputStream;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;

import com.stone.para.IConstant;
import com.stone.sys.pojo.TLog;
import com.stone.sys.pojo.TMenu;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TUser;
import com.stone.sys.service.impl.MenuServiceImpl;
import com.stone.sys.service.impl.UserServiceImpl;

import frm.ssh.action.BaseAction;

public class YanZhengMaAction extends BaseAction {
	
	private UserServiceImpl userService;
	
	public void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}
	 private ByteArrayInputStream inputStream;  
     /** 
       * 验证码获取 
       * 
       */        
   public String getChkNumber(){            
         this.setInputStream(this.userService.getChkNumber(super.getSession()));
         return SUCCESS;
   }
	private void setInputStream(ByteArrayInputStream chkNumber) {
		// TODO Auto-generated method stub
		this.inputStream = chkNumber;
	}
	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}
	
}
