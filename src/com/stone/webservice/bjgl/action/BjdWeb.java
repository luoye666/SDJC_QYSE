package com.stone.webservice.bjgl.action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.Serializable;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import javax.ws.rs.core.MediaType;

import com.stone.biz.bjgl.pojo.TBjd;
import com.stone.webservice.bjgl.pojo.DownloadFileRequestVO;
import com.stone.webservice.bjgl.pojo.DownloadFileResponseVO;



/**
 * 报检单web接口
 * @author lenovo
 *
 */
//@Produces({"application/json;charset=UTF-8","application/xml"})
//@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
public interface BjdWeb extends Serializable{

	
	/**
	 * 向客户端传送企业报检单信息
	 * @param name
	 * @param pwd
	 * @param shidaima
	 * @return
	 */
	@GET
	@Path("/bjdtj/{name}/{pwd}/{shidaima}")
	@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	public String findBjdTj(@PathParam("name")String name, @PathParam("pwd")String pwd, @PathParam("shidaima")String shidaima);
	
	/**
	 * 查找报检单设备
	 * @param name
	 * @param pwd
	 * @param shidaima
	 * @param zhucedaima
	 * @return
	 */
	@GET
	@Path("/bjdse/{name}/{pwd}/{shidaima}/{zhucedaima}")
	@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	public String findBjdSe(@PathParam("name")String name, @PathParam("pwd")String pwd, @PathParam("shidaima")String shidaima, @PathParam("zhucedaima")String zhucedaima);
	
	/**
	 * 更新bjd信息
	 * @param name
	 * @param pwd
	 * @param jsonstr
	 * @return
	 */
	@POST
	@Path("/updbjd/{name}/{pwd}")
	@Consumes({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	public String updBjd(@PathParam("name")String name, @PathParam("pwd")String pwd,String bjd);
	
	/**
	 * 查找报检单开工告知设备
	 * @param name
	 * @param pwd
	 * @param shidaima
	 * @param zhucedaima
	 * @return
	 */
	@GET
	@Path("/bjdkggz/{name}/{pwd}/{id}")
	@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	public String findBjdKggz(@PathParam("name")String name, @PathParam("pwd")String pwd, @PathParam("shidaima")String shidaima, @PathParam("id")String seid);
	
	
	/**
	 * 下载文件 传实体类 
	 * @param req
	 * @return
	 */
	@POST
    @Path("/downloadFile")
	public DownloadFileResponseVO downloadFile(DownloadFileRequestVO req);
	
	
	/**
	 * 下载文件 传文件名称
	 * @param fileName
	 * @return
	 */
	@GET
    @Path("/downloadFileByte/{fileName}")
	public String downloadFileByte(@PathParam("fileName")String fileName);
	
}
