/**
 * @author foo
 */
package com.stone.support;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.ibm.icu.text.SimpleDateFormat;
import com.stone.biz.jcsj.pojo.TBaseInfo;
import com.stone.biz.utils.pojo.TSyUtils;

import frm.ssh.dao.BaseDAO;
import frm.ssh.service.BaseService;

public class SupportService extends BaseService{
	
	@SuppressWarnings("unused")
	private BaseDAO baseDao;
	private int total;
	
	public void setBaseDao(BaseDAO baseDao) {
		this.baseDao = baseDao;
		super.setBaseDAO(baseDao);
	}
	
	public HibernateTemplate getHibernateTemplate(){
		return super.getBaseDAO().getHibernateTemplate();
	}
	
	
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	/**
	 * 获取分页数据列表
	 * @param hql	查询语句
	 * @param page	页码
	 * @param rows	返回行数
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List findPageListByHql(String hql,int page,int rows){
		
		final String queryHql = hql;
		final int queryPage = page;
		final int queryRows = rows;
		
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public List doInHibernate(Session session) throws HibernateException,SQLException {
				Query query = session.createQuery(queryHql);
				query.setFirstResult((queryPage-1)*queryRows);
				query.setMaxResults(queryRows);
				session.evict(TSyUtils.class);
				return query.list();
			}
		});
	}
	
	/**
	 * 根据查询语句获取单个结果
	 * @param hql	查询语句
	 * @return
	 */
	public Object findSingletonByHql(String hql){
		final String queryHql = hql;
		return this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(queryHql);
				return query.uniqueResult();
		}});
	}
	
	/**
	 * 根据查询语句获取结果集数量
	 * @param hql
	 * @return
	 */
	public long findTotalByHql(String hql){
		return Long.parseLong(this.findSingletonByHql(hql).toString());
	}
	
	/**
	 * 根据查询语句获取结果集数量
	 * @param sql
	 * @return
	 */
	public long findTotalBySql(String sql){
		
		List<HashMap<String,Object>> list = super.findListBySql(sql);
		return Long.parseLong(list.get(0).get("ct").toString());
	}
	
	/**
	 * 根据IDS查找实体
	 * @param ids
	 * @param cls
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List findListByIds(String ids,Class cls){
		String query = "from " + cls.getName() + " entity where entity.id in (" + ids + ")";
		return super.findListByHql(query);
	}
	
	/**
	 * 根据IDS删除实体信息<br />
	 * 该方法已过时 请使用 deleteByEntitysID()
	 * @param ids
	 * @param cls
	 */
	@SuppressWarnings("unchecked")
	public void deleteByIds(String ids,Class cls){
		super.deleteAll(ids, cls.getName());
	}
	
	/**
	 * 根据ID删除多个实体信息
	 * @param entitysID
	 * @param cls
	 */
	@SuppressWarnings("unchecked")
	public boolean deleteByEntitysId(Long[] entitysID,Class cls){
		
		
		return false;
	}
	
	/**
	 * 根据HQL执行更新
	 */
	public int updateByHql(String hql) throws DataAccessException{
		final String updateHql = hql;
		
		return Integer.parseInt(this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,SQLException {
				Query query = session.createQuery(updateHql);
				return query.executeUpdate();
			}
		}).toString());
	}
	
	/**
	 * 根据类的Class信息查询全部，无分页
	 * @param cls
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List findList(Class cls) throws DataAccessException{
		return this.getHibernateTemplate().find("from " + cls.getName());
	}
	
	/**
	 * 保存实体并返回主键
	 * @param entity
	 * @return
	 */
	public Long saveReturnId(Object entity) throws DataAccessException{
		return (Long)this.getHibernateTemplate().save(entity);
	}

	
	/**
	 * 执行更新语句，删除or更新
	 * @param hql
	 * @return
	 */
	public int executeUpdateByHql(String hql) throws DataAccessException{
		final String exeHql = hql;
		return Integer.parseInt(this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,SQLException {
				Query query = session.createQuery(exeHql);
				return query.executeUpdate();
			}
		}).toString());
	}
	
	/**
	 * 删除实体类集合
	 * @param entities
	 */
	@SuppressWarnings("unchecked")
	public void deleteAll(Collection entities) throws DataAccessException{
		this.getHibernateTemplate().deleteAll(entities);
	}
	
	
	
	/**
	 * 调用存储过程
	 * @param tiaojian 查询的条件
	 * @param str 存储过程名称
	 * @return
	 */
	public List findPro(String tiaojian,int startPage,int endPage,String str){
		if( startPage != 0 || endPage != 0 || tiaojian != ""){
			final String st = str;
			final String yuju = tiaojian;
			final int start = startPage;
			final int end = endPage;
			List list = (List) this.getHibernateTemplate().execute(new HibernateCallback() {
				
				public Object doInHibernate(Session session) throws HibernateException,
						SQLException {
					
					CallableStatement stmt = session.connection().prepareCall(st);
					stmt.setString(1, yuju);
					stmt.setInt(2, start);
					stmt.setInt(3, end);
					stmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR);
					stmt.registerOutParameter(5, java.sql.Types.FLOAT);
					stmt.executeQuery();
					ResultSet rs = (ResultSet) stmt.getObject(4);
					total = stmt.getInt(5);
					try {
						return convertList(rs);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return null;
				}
			});
			return list;
		}else{
			return null;
		}
		
	}
	
	
	/**
	 * 将ResultSet 转为list
	 * @param rs
	 * @return
	 * @throws SQLException
	 * @throws ParseException
	 */
	public static List convertList(ResultSet rs) throws SQLException, ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List list = new ArrayList();

		ResultSetMetaData md = rs.getMetaData();

		int columnCount = md.getColumnCount(); //Map rowData;

		while (rs.next()) { //rowData = new HashMap(columnCount);

//			Map rowData = new HashMap();
//	
//			for (int i = 1; i <= columnCount; i++) {
//	
//				rowData.put(md.getColumnName(i), rs.getObject(i));
//	
//			}
			
			TBaseInfo base = new TBaseInfo();
			base.setId(Long.parseLong(rs.getObject(1).toString())); //主键
			base.setZcstatus(rs.getObject(2)==null?null:rs.getObject(2).toString()); //状态
			base.setShiyongdanwei(rs.getObject(3)==null?null:rs.getObject(3).toString()); //使用单位
			base.setShiyongdanweiId(rs.getObject(4)==null?null:Long.parseLong(rs.getObject(4).toString()));//使用单位主键
			base.setShebeimingcheng(rs.getObject(5)==null?null:rs.getObject(5).toString()); //设备名称
			base.setShebeixinghao(rs.getObject(6)==null?null:rs.getObject(6).toString()); //设备型号
			base.setZhucedaima(rs.getObject(7)==null?null:rs.getObject(7).toString()); //注册代码
			base.setShebeileibie(rs.getObject(8)==null?null:rs.getObject(8).toString());//设备类别
			base.setShi(rs.getObject(9)==null?null:rs.getObject(9).toString());// 市
			base.setQuhuamingcheng(rs.getObject(10)==null?null:rs.getObject(10).toString());//区划名册
			
			base.setXiacijianyanriqi(rs.getObject(11)==null?null:sdf.parse(sdf.format(rs.getDate(11)))); //下次检验日期
			base.setBiaozhuleixing(rs.getObject(12)==null?null:rs.getObject(12).toString());//标准类型
			base.setState(rs.getObject(13)==null?null:rs.getObject(13).toString());//设备状态
			base.setShebeizhongleidaima(rs.getObject(14)==null?null:rs.getObject(14).toString());//设备种类代码
	
			list.add(base);

		} 
		return list;
	}
	
	
}
