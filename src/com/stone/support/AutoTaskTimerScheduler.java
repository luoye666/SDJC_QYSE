package com.stone.support;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import frm.ssh.service.BaseService;


public class AutoTaskTimerScheduler extends BaseService{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3280447148387434846L;
	
	private HibernateTemplate hibernateTemplate ;
	
	
	public void getMessgeBoxList(){
		List list = new ArrayList();
		try{
//			hibernateTemplate = new HibernateTemplate();
			System.out.println(hibernateTemplate);
			list = hibernateTemplate.executeFind(new HibernateCallback(){
				public Object doInHibernate(Session session) throws HibernateException, SQLException {
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Calendar cal = Calendar.getInstance();
					cal.add(cal.SECOND, -20);//cal.SECOND-20;
					System.out.println(sf.format(cal.getTime()));
					return session.createQuery(
						"from TFlowInfo t where t.time >= to_date(?,'yyyy-MM-dd HH24:mi:ss') ").setParameter(0, sf.format(cal.getTime())).list();
				}
			});
			
			if(list.size() > 0){
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
