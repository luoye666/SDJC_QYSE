package com.stone.webservice.segl.action;

import java.io.Serializable;
import java.util.Map;

import com.stone.webservice.segl.service.SeWebService;

public class SeWebImpl implements SeWeb,Serializable{

	private static final long serialVersionUID = 1L;
	
	private SeWebService seWebService;
	
	public void setSeWebService(SeWebService seWebService) {
		this.seWebService = seWebService;
	}

	@Override
	public String getSeList(String name, String pwd, String shidaima,
			String map) {
		String s = seWebService.getSeLsit(name, pwd, shidaima, map);
		
		return s;
	}

	@Override
	public String getSe(String name, String pwd, String shebeizhonglei, String ids) {
		String s = seWebService.getSe(name, pwd, shebeizhonglei, ids);
		
		return s;
	}

	@Override
	public String getSeCode(String name, String pwd, String shebeizhonglei,
			String zhucedaima) {
		String s = seWebService.getSeCode(name, pwd, shebeizhonglei, zhucedaima);
		return s;
	}

	@Override
	public String getDYSeList(String name, String pwd, String map) {
		String s = seWebService.getDYSeList(name, pwd, map);
		return s;
	}

	@Override
	public String getDYSe(String name, String pwd, String shebeizhonglei,
			String ids) {
		// TODO Auto-generated method stub
		String s = seWebService.getDYSe(name, pwd, shebeizhonglei, ids);
		return s;
	}

	@Override
	public String modifyElevator(String json) {
		
		return seWebService.saveElevator(json);
	}

	@Override
	public String getKey(String name) throws Exception {
		// TODO Auto-generated method stub
		return seWebService.getKey(name);
	}

	
}
