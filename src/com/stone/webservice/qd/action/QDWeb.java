package com.stone.webservice.qd.action;

import java.io.Serializable;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;

import net.sf.json.JSONObject;

/**
 * 对接青岛项目和省局数据交互
 * 1 设备
 * 2 通知
 * @author admin
 * 2018-03-20
 */
public interface QDWeb{
	
	
	/**
	 * 设备的增加或更改
	 * @param json
	 * @return
	 */
	@POST
	@Path("/seUD")
	@Consumes({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	public String seUD(String json) throws Throwable;
	
	
	/**
	 * 设备使用单位信息
	 * @param json
	 * @return
	 */
	@POST
	@Path("/seDw")
	@Consumes({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	public String seDw(String json) throws Throwable;

}
