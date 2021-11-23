package com.stone.webservice.qd.action;

import java.io.Serializable;

import com.stone.webservice.qd.service.QDWebService;

import net.sf.json.JSONObject;

public class QDWebImpl implements QDWeb,Serializable{

	
	private static final long serialVersionUID = 7108948567572210691L;
	private QDWebService qdWebService;
	
	
	public void setQdWebService(QDWebService qdWebService) {
		this.qdWebService = qdWebService;
	}


	@Override
	public String seUD(String json) throws Throwable {
		// TODO Auto-generated method stub
		return qdWebService.saveUD(json);
	}
	
	@Override
	public String seDw(String json) throws Throwable {
		// TODO Auto-generated method stub
		return qdWebService.saveQDDw(json);
	}

}
