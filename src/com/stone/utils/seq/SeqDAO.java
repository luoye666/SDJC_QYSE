package com.stone.utils.seq;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import frm.ssh.dao.BaseDAO;

/**
 * 取得序列
 * JZ
 * </pre>
 */
public class SeqDAO extends BaseDAO{

	public SeqDAO(){
	}

	public Long getNextKey(final String seqName){
		Object thekey=this.getHibernateTemplate().execute(new HibernateCallback(){
			@SuppressWarnings("deprecation")
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Connection con=session.connection();
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery("select "+seqName+".nextval from dual");
				rs.next();
				Long key= rs.getLong(1);
				rs.close();
				stmt.close();
				return key;
			}
		});
		return (Long)thekey;
	}

}
