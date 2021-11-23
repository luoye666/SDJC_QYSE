package com.stone.webservice.kggz.action;

import java.io.Serializable;

import com.stone.webservice.kggz.service.KggzWebService;

public class KggzWebImpl implements KggzWeb,Serializable{

	private static final long serialVersionUID = -6796675138311198984L;
	
	private KggzWebService kggzWebService;
	
	public void setKggzWebService(KggzWebService kggzWebService) {
		this.kggzWebService = kggzWebService;
	}



	@Override
	public String findKggzList(String name, String pwd, String shidaima,
			String map) {
		
		String s = kggzWebService.findKggzList( name,  pwd,  shidaima,
				 map);
		return s;
	}



	@Override
	public String findKggz(String name, String pwd, String id) {
		
		String s = kggzWebService.findKggz(name, pwd, id);
		
		return s;
	}

}
