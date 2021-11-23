package com.stone.webservice.segl.action;

import java.io.Serializable;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.stone.webservice.segl.service.WebService;

@WebService(value = "/rest/ProductService", type = WebService.Type.REST)
@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
public interface SeWeb extends Serializable{

	@GET
	@Path("/selist/{name}/{pwd}/{shidaima}/{map}")
	@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	@Consumes("application/json")
	public String getSeList(@PathParam("name")String name,@PathParam("pwd")String pwd,@PathParam("shidaima")String shidaima,@PathParam("map") String map);
	
	@GET
	@Path("/se/{name}/{pwd}/{shebeizhonglei}/{ids}")
	@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	@Consumes("application/json")
	public String getSe(@PathParam("name")String name,@PathParam("pwd")String pwd,@PathParam("shebeizhonglei")String shebeizhonglei,@PathParam("ids")String ids);
	
	@GET
	@Path("/secode/{name}/{pwd}/{shebeizhonglei}/{zhucedaima}")
	@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	@Consumes("application/json")
	public String getSeCode(@PathParam("name")String name,@PathParam("pwd")String pwd,@PathParam("shebeizhonglei")String shebeizhonglei,@PathParam("zhucedaima")String zhucedaima);
	
	@GET
	@Path("/getDYSeList/{name}/{pwd}/{map}")
	@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	@Consumes("application/json")
	public String getDYSeList(@PathParam("name")String name,@PathParam("pwd")String pwd,@PathParam("map") String map);
	
	@GET
	@Path("/getDYSe/{name}/{pwd}/{shebeizhongleidaima}/{ids}")
	@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	@Consumes("application/json")
	public String getDYSe(@PathParam("name")String name,@PathParam("pwd")String pwd,@PathParam("shebeizhongleidaima")String shebeizhongleidaima,@PathParam("ids")String ids);
	
	@POST
	@Path("/modifyElevator")
	@Consumes({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	public String modifyElevator(String map);
	
	
	@GET
	@Path("/getKey/{name}")
	@Produces({MediaType.APPLICATION_JSON + ";charset=UTF-8"})
	@Consumes("application/json")
	public String getKey(@PathParam("name")String name) throws Exception ;
	
	
}
