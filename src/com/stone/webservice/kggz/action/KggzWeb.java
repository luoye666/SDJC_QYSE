package com.stone.webservice.kggz.action;

import java.io.Serializable;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
public interface KggzWeb extends Serializable{

	@GET
	@Path("/gzlist/{name}/{pwd}/{shidaima}/{map}")
	@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	@Consumes("application/json")
	public String findKggzList(@PathParam("name")String name,@PathParam("pwd")String pwd,@PathParam("shidaima")String shidaima,@PathParam("map") String map);
	
	@GET
	@Path("/gz/{name}/{pwd}/{id}")
	@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	@Consumes("application/json")
	public String findKggz(@PathParam("name")String name,@PathParam("pwd")String pwd,@PathParam("id") String id);
}
