package com.stone.sys.service.impl;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.stone.support.SupportService;
import com.stone.support.utils.DateFormatTool;
import com.stone.support.utils.FileUtils;
import com.stone.support.utils.ParameterUtils;
import com.stone.support.utils.Resources;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TMenu;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TQiYeFile;
import com.stone.sys.pojo.TRole;
import com.stone.sys.pojo.TRoleMenu;
import com.stone.sys.pojo.TUser;
import com.stone.sys.pojo.TUserRole;
import com.stone.sys.pojo.UserLoginLog;
import com.stone.sys.pojo.UserLoginNotes;
import com.stone.utils.seq.SeqUtil;

public class UserServiceImpl extends SupportService {
	/**
	 * 用户所在系统的状态 0
	 */
	private final String USERTYPE="1";
	/**
	 * 用户的登录状态
	 */
	private final String LOGININTYPE="1";
	/**
	 * 根据登录ID查找用户
	 * @param loginId
	 * @return
	 */
	public TUser findByLoginid(String loginId) {
		String query = "from TUser user where user.loginId = '"+loginId+"' and user.type='sydw'";
		return (TUser)super.findSingletonByHql(query);
	}
	
	/**
	 * 根据用户名称查找用户，用户名可能有重复的，所以返回值为List
	 * @param name
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TUser> findByName(String name) {
		String query = "from TUser user where user.name = '"+name+"'";
		return super.findListByHql(query);
	}
	
	/**
	 * 删除用户信息，并删除用户角色关联信息
	 * @param id
	 */
	public void deleteUser(Long userId){
		//删除用户角色关联系想你
		super.executeUpdateByHql("delete TUserRole ur where ur.userId = " + userId);
		
		//删除用户信息
		super.delete(userId,TUser.class.getName());
	}
	
	/**
	 * 根据IDS删除用户
	 * @param ids
	 */
	public void deleteUserByIds(String ids){
		long[] userIds = ParameterUtils.convertIDSToLongArray(ids);
		for(long id : userIds){
			this.deleteUser(id);
		}
	}
	
	/**
	 * 根据主键列修改其状态：禁用
	 * @param ids
	 * @return	返回成功修改的个数
	 */
	public int updateStateDisableByIds(String ids){
		String hql = "update TUser user set user.state = 0 where user.id in (" + ids + ")";
		return super.updateByHql(hql);
	}
	/**
	 * 根据主键列修改其状态：正常
	 * @param ids
	 * @return	返回成功修改的个数
	 */
	public int updateStateEnableByIds(String ids){
		String hql = "update TUser user set user.state = 1 where user.id in (" + ids + ")";
		return super.updateByHql(hql);
	}
	
	/**
	 * 根据用户ID查询其关联的角色
	 * @param id
	 */
	@SuppressWarnings("unchecked")
	public List<TRole> findRolesByUserId(Long id){
		return super.findListByHql("from TRole role where role.id in (select ur.roleId from TUserRole ur where ur.userId = " + id + ")");
	}
	
	/**
	 * 修改用户信息，修改内容不包含密码
	 * @param user
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public String updateUser(TUser user,File file,String fileName) throws IOException, ParseException{
        user.setShi(getDataNameByCode(user.getShidaima()));
        user.setXian(getDataNameByCode(user.getXiandaima()));
		String result = "SUCCESS";
        String maxFileSize = Resources.getString("QIYEYONGHUZILIAOSIZE", "struts");
			if ((fileName == null) || (file == null)) {
				super.update(user);
				return result;
			}
			if(file.length() > 1024*1024*Integer.parseInt(maxFileSize)){
				return "OUTSIZE";
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			Random rd = new Random();
			fileName = fileName.replace("+","_");
			String fileType = fileName.substring(fileName.lastIndexOf("."));
			if(FileUtils.fileType(fileType)){
				return "OUTSIZE";
			}
			String fName = fileName.substring(0,fileName.indexOf("."));
			String newfileName = fName+"_"+sdf.format(new Date())+(rd.nextInt(90000)+10000)+fileType;
		    //得到工程保存文件的路径
	        String savePath = Resources.getString("QIYEYONGHUZILIAO", "struts");
	        File uploadFolder = new File(savePath);
	        if(!uploadFolder.exists()){
	        	uploadFolder.mkdirs();
	        }
	        FileInputStream is = new FileInputStream(file);
		    File f = new File(savePath,newfileName);
		    OutputStream os = new FileOutputStream(f);
		    byte[] b = new byte[1024];
		    int length = 0;
		    while((length = is.read(b))>0){
		    	os.write(b, 0, length);
		    }
	        is.close();
	        os.close();

	        File oldFj = new File(user.getFilepath());
	        if(oldFj.exists()){
	        	oldFj.delete();
	        }
	        user.setFilepath(savePath+newfileName);
			super.update(user);
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			TQiYeFile qyFile = new TQiYeFile();
			qyFile.setFilePath(user.getFilepath());
			qyFile.setUpdateTime(sdf.parse(sdf.format(new Date())));
			qyFile.setQiyeId(user.getId());
			qyFile.setFileName(fName);
			super.save(qyFile);
		return result;
	}
	
	/**
	 * 更改用户密码
	 * @param userId
	 * @param newPass
	 */
	public void updatePassword(Long userId,String newPass){
		String hql = "update TUser user set user.password = '" + newPass + "' where user.id = " + userId;
		super.executeUpdateByHql(hql);
	}

	/**
	 * 验证登录帐号是否重复
	 * @param loginId
	 */
	public boolean validateLoginId(String loginId,String type,String userid){
		String hql = "select count(user) from TUser user where user.loginId = '" + loginId + "' ";
		if("sh".equals(type)){
			hql += " and user.id != '"+userid+"'";
		}
		long total = super.findTotalByHql(hql);
		return total == 0 ? true : false;
	}
	
	
	
	/**
	 * 查询Tree所需的所有菜单项数据
	 * @param parentId
	 * @param hasBtns
	 * @return
	 */
	public JSONArray findAllListToTree(Long parentId,boolean hasBtns){
		JSONArray menusJSON = new JSONArray();
		List<TOrgan> childsMenu = null;
		if(parentId == null) {
			childsMenu = this.findListByNotParent(hasBtns);
		}
		
		for(TOrgan organ : childsMenu){
			JSONObject menuJSON = new JSONObject();
			menuJSON.put("id", organ.getId());
			menuJSON.put("text", organ.getName());
			menuJSON.put("children", this.findAllListToTreeTUser(organ.getId(),hasBtns));
			menusJSON.add(menuJSON);
		}
		return menusJSON;
	}
	
	public JSONArray findAllListToTreeTUser(Long parentId,boolean hasBtns){
		JSONArray menusJSON = new JSONArray();
		List<TUser> childsUser = null;
		if(parentId != null) {
			childsUser = this.findChildsById(parentId);
		}
		
		for(TUser user : childsUser){
			JSONObject menuJSON = new JSONObject();
			menuJSON.put("id", user.getId());
			menuJSON.put("text", user.getName());
			menuJSON.put("children", this.findAllListToTreeTUser(user.getId(),hasBtns));
			menusJSON.add(menuJSON);
		}
		return menusJSON;
	}
	
	/**
	 * 查询所属子菜单项
	 * @param id		主键
	 * @param hasBtns	是否含有按钮
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TUser> findChildsById(Long id){
		String query = "from TUser user where user.organId = " + id;
//		if(!hasBtns){
//			query += " and menu.btnId is null";
//		}
		query += " order by user.sortNum";
		return super.findListByHql(query);
	}
	
	@SuppressWarnings("unchecked")
	public List<TUser> findChildsById(String ids){
		String query = "from TUser user where user.organId in ("+ids+")";
		query += " order by user.sortNum";
		return super.findListByHql(query);
	}
	
	/**
	 * 
	 * @param ids
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TUser> findChildsByIdFenzu(String ids){
		String[] id = ids.split(",");
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<id.length;i++){
			TDicData dicData = (TDicData) super.findById(Long.parseLong(id[i]), TDicData.class.getName());
			sb.append(" user.fenzuId like '%"+id[i]+"@"+dicData.getCode()+"%' OR ");
		}
		String str = sb.substring(0, sb.lastIndexOf("OR"));
		String query = "from TUser user where "+str+" order by user.sortNum";
		return super.findListByHql(query);
	}
	
	
	/**
	 * 查询父级为空的菜单项
	 * @param hasBtns
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TOrgan> findListByNotParent(boolean hasBtns){
		String query = "from TOrgan organ where organ.parentId is not null";
//		if(!hasBtns){
//			query += " and organ.btnId is null";
//		}
//		query += " order by organ.sortNum";
		return super.findListByHql(query);
	}
	
	//根据机构code查找下属的所有机构id
	public String findOrganIdsByOrganCode(String code){
		String ids = "";
	//	String organIdsHql = "from TOrgan where code like '"+code+"%'";
		String organIdsHql = "from TOrgan where code = '"+code+"'";
		List<TOrgan> list = super.findListByHql(organIdsHql);
		for(TOrgan o : list){
			ids += ","+o.getId();
		}
		if(!"".equals(ids)){
			ids = ids.substring(1);
		}
		return ids;
	}
	
	//根据用户id查询所关联的菜单
	public List<TMenu> getUserByMenu(TUser user){
		List<TMenu> list = null;
		String hql = "from TMenu where id in (select menuId from TRoleMenu where roleId in " +
				"(select roleId from TUserRole where userId = '"+user.getId()+"')) and parentId is null " +
						"order by sortNum";
		
		return super.findListByHql(hql);
	}
	public String getRoleSbxx(TUser user){
		String result = "no";
		String hql = "select sbxx from TRole where id in (select roleId from TUserRole where userId = '"+user.getId()+"')";
		String sbxx = super.findListByHql(hql).toString();
		if(sbxx.indexOf("yes")>=0){
			result = "yes";
		}
		return result;
	}
	public void updSeJyInfoByIds(String ids,String rs){
		String hql = "update TUser set sejyinfo = '"+rs+"' where id in ("+ids+")";
		super.updateByHQL(hql, null);
	}
	public String getRolsByUserId(Long uid,String colName){
		String hql = "select "+colName+" from TRole where id in (select roleId from TUserRole where userId = '"+uid+"')";
		return super.findListByHql(hql).toString().replace("[", "").replace("]", "");
	}
	public String getEditSeField(String code){
		String hql = "select value from TDicData where typeId = (select id from TDicType where code = '"+code+"')";
		return super.findListByHql(hql).toString().replace("[", "").replace("]", "");
	}
	
	/** 
	 * 获取验证码 
	 */  
	public ByteArrayInputStream  getChkNumber(HttpSession session){  
	     int width = 65, height = 25;    
	        BufferedImage image = new  BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);    
	        Graphics g = image.getGraphics();    
	        Random random = new Random();    
	        g.setColor(getRandColor(200, 255));    
	        g.fillRect(0, 0, width, height);    
	            
	        g.setFont(new Font("Times New Roman", Font.PLAIN, 18));    
	        g.setColor(getRandColor(160, 200));    
	        for(int i = 0; i < 155; i++)    
	        {    
	            int x1 = random.nextInt(width);    
	            int y1 = random.nextInt(height);    
	            int x2 = random.nextInt(12);    
	            int y2 = random.nextInt(12);    
	            g.drawLine(x1, y1, x2, y2);    
	        }    
	            
	        String sRand = "";    
	        for(int i = 0; i < 4; i++)    
	        {    
	            String rand = getRandomChar();    
	            sRand += rand;    
	            g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));    
	            g.drawString(rand, 13*i+6, 16);    
	        }  
	        //存进session,用于验证    
	        ActionContext.getContext().getSession().put("yanzhengma", sRand.toLowerCase());
	        g.dispose();    
	        ByteArrayOutputStream output = new ByteArrayOutputStream();    
	        ImageOutputStream imageOut;  
	        try {  
	            imageOut = ImageIO.createImageOutputStream(output);  
	            ImageIO.write(image, "JPEG", imageOut);    
	            imageOut.close();  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }    
	        ByteArrayInputStream input = new ByteArrayInputStream(output.toByteArray());  
	        return input;  
	  }  
	  
	//颜色  
	public Color getRandColor(int fc, int bc){  
	    Random random = new Random();    
	    if(fc > 255) fc = 255;    
	    if(bc > 255) bc = 255;    
	    int r = fc + random.nextInt(bc - fc);    
	    int g = fc + random.nextInt(bc - fc);    
	    int b = fc + random.nextInt(bc - fc);    
	    return new Color(r, g, b);  
	}  
	  
	//产生随机数  
	public String getRandomChar(){  
	    int rand = (int)Math.round(Math.random() * 2);    
	    long itmp = 0;    
	    char ctmp = '\u0000';    
	    switch (rand)    
	    {    
	         case 1:    
	              itmp = Math.round(Math.random() * 25 + 65);    
	              ctmp = (char)itmp;    
	              return String.valueOf(ctmp);    
	         case 2:    
	              itmp = Math.round(Math.random() * 25 + 97);    
	              ctmp = (char)itmp;    
	              return String.valueOf(ctmp);    
	         default :    
	              itmp = Math.round(Math.random() * 9);    
	              
	    }    
	    return String.valueOf(itmp);    
	}
	public String verifyYzm(String yzm){
		String sesYzm = ActionContext.getContext().getSession().get("yanzhengma").toString();
		if(yzm.toLowerCase().equals(sesYzm)){
			return "1";
		}
		return "0";
	}
	
	//根据字典代码获取字典名称
	public String getDataNameByCode(String code){
			String dataquery = "from TDicData data where data.code = '"+code+"'";
			List<TDicData> datalist = super.findListByHql(dataquery);
			if(datalist.size()>0){
				return datalist.get(0).getName();
			}
			return "";
		}

	//保存
	public String register(TUser user,File file,String fileName) throws IOException{
		
		if(findByLiginId(user.getLoginId())){
			return "CHONGFU";
		}
		
		String result = "SUCCESS";
        String maxFileSize = Resources.getString("QIYEYONGHUZILIAOSIZE", "struts");
			if ((fileName == null) || (file == null)
					|| (file.length() > 1024*1024*Integer.parseInt(maxFileSize))) {
				return "OUTSIZE";
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			Random rd = new Random();
			fileName = fileName.replace("+","_");
			String fileType = fileName.substring(fileName.lastIndexOf("."));
			if(FileUtils.fileType(fileType)){
				return "OUTSIZE";
			}
			String fName = fileName.substring(0,fileName.indexOf("."));
			String newfileName = fName+"_"+sdf.format(new Date())+(rd.nextInt(90000)+10000)+fileType;
		    //得到工程保存文件的路径
	        String savePath = Resources.getString("QIYEYONGHUZILIAO", "struts");
	        File uploadFolder = new File(savePath);
	        if(!uploadFolder.exists()){
	        	uploadFolder.mkdirs();
	        }
	        FileInputStream is = new FileInputStream(file);
		    File f = new File(savePath,newfileName);
		    OutputStream os = new FileOutputStream(f);
		    byte[] b = new byte[1024];
		    int length = 0;
		    while((length = is.read(b))>0){
		    	os.write(b, 0, length);
		    }
	        is.close();
	        os.close();
	        	
	        
	        user.setLoginId(user.getLoginId().trim());
	        user.setShstate("0");
	        user.setState(1);
	        user.setFilepath(savePath+newfileName);
	        user.setShi(getDataNameByCode(user.getShidaima()));
	        user.setXian(getDataNameByCode(user.getXiandaima()));
	        user.setShstate("2");
			super.save(user);
		return result;
	}
	/**
	 * 记录用户的登录记录和登录日志信息
	 * @param user
	 * @return
	 */
	public boolean saveLoginNotesAndLog(TUser user){
		//获得最近的登录信息
		UserLoginLog loginLog=findLoginIn(user);
		//如果今天还没有登录信息，那么记录登录日志、同时添加登录记录
		if(loginLog==null){
			saveLoginNotesAndLog(user, LOGININTYPE);
		}else{ 
			//已经登录过 那么需要获得在最近的登录后，是否登出过，如果没有登出，则不记录，如果有登出记录，那么则去记录登录日志、同时 添加登录记录
			List logList=findLoginOutByTime(user,loginLog.getTime());
			//特殊情况，有登录记录，没有登出记录
			if(logList.isEmpty() && loginLog!=null){
				saveLoginNotesAndLog(user, LOGININTYPE);
			}
			//不为空 说明有登出记录，则记录登录日志、添加登录记录
			if(!logList.isEmpty()){
				saveLoginNotesAndLog(user, LOGININTYPE);
			}
		}
		return true;
	}
	
	/**
	 * 记录登出日志
	 * @param user
	 * @return
	 */
	public boolean saveLoginOutLogs(TUser user){
		return this.saveLoginLogs(user, USERTYPE);
	}
	/**
	 * 根据用户信息，获得今天登录最近记录信息
	 * @return
	 */
	public UserLoginLog findLoginIn(TUser user){
		//获得当前天的时间
		String nowDate=DateFormatTool.formate(new Date(), DateFormatTool.NOTIME)+" 00:00";
		String sql=" from UserLoginLog where to_char(time,'yyyy-MM-dd HH24:MI:SS')>'"+nowDate+"' " +
				"and loginType='1' and loginId='"+user.getLoginId()+"' and userId='"+user.getId()+"' ORDER BY time desc ";
		return (UserLoginLog)super.findFirst(sql);
	}
	/**
	 * 记录登录记录及登录日志
	 * @param user
	 * @param loginType
	 */
	private void saveLoginNotesAndLog(TUser user,String loginType){
		saveLoginLogs(user, loginType);
		//先删除下今天的登录记录
		deleteLoginNotes(user);
		saveLoginNotes(user);
	}
	/**
	 * 删除用户的登录记录信息
	 * @param user
	 * @return
	 */
	public boolean deleteLoginNotes(TUser user){
		/*String sql="delete from SYS_USER_LOGIN_NOTES where login_id='"+user.getLoginId()+"'" +
				" and user_id='"+user.getId().toString()+"' and user_type='"+USERTYPE+"'";
		super.executeUpdateBySql(sql, null);*/
		super.deleteByDHql("login_id='"+user.getLoginId()+"' and user_id='"+user.getId().toString()+"' and user_type='"+USERTYPE+"'", null, UserLoginNotes.class.getName());
		return true;
	}
	/**
	 * 记录用户的登录记录信息
	 * @param user
	 * @return
	 */
	public boolean saveLoginNotes(TUser user){
		//获得角色信息
	//	TRole role=roleService.findTRoleByUserId(user.getId().toString());
		UserLoginNotes loginNotes=new UserLoginNotes();
		loginNotes.setId(SeqUtil.getNextKey("SYS_LOGIN_NOTES_ORDER"));
		loginNotes.setLoginId(user.getLoginId());
		loginNotes.setUserId(user.getId().toString());
		loginNotes.setLoginTime(new Date());
	//	loginNotes.setOrgancode(organ.getCode());
		loginNotes.setOrganame(user.getDanweimingcheng());
	//	loginNotes.setRoleid(role.getId().toString());
	//	loginNotes.setRolename(role.getName());
	//	loginNotes.setMobile(user.getMobile());
		loginNotes.setTel(user.getLianxidianhua());
		loginNotes.setName(user.getName());
		loginNotes.setUserType(USERTYPE);
	//	loginNotes.setRegioncode(user.getOrganCode().toString().substring(0,6));
		loginNotes.setType(USERTYPE);
		super.save(loginNotes);
		return true;
	}
	/**
	 * 查询在某个时间之前是否有退出记录
	 * 必须大于今天的0:0之前
	 * login_time>00:00 
	 * login_time<当前时间
	 * @return
	 */
	public List findLoginOutByTime(TUser user,Date time){
		String sql=" select *  from SYS_USER_LOGIN_LOG where to_char(time,'yyyy-MM-dd HH24:MI:SS')>? " +
			"and login_type='0' and login_id=? and user_id=? ORDER BY time desc ";
		String dateTime=DateFormatTool.formate(time, DateFormatTool.COMMONDATE);
		Object[] obj=new Object[]{dateTime,user.getLoginId(),user.getId().toString()};
		return super.findListBySql(sql, obj);
	}
	/**
	 * 记录用户的登录日志信息
	 * @param user 用户信息
	 * @param type 状态 0登出 1登录
	 * @return
	 */
	public boolean saveLoginLogs(TUser user,String type){
		UserLoginLog loginLog=new UserLoginLog();
//		loginLog.setId(SeqUtil.getNextKey("SYS_LOGIN_LOG_ORDER"));
		loginLog.setUserId(user.getId().toString());
		loginLog.setLoginId(user.getLoginId());
		loginLog.setLoginType(type);
		loginLog.setUserType(USERTYPE);
		loginLog.setTime(new Date());
		loginLog.setType(USERTYPE);
		super.save(loginLog);
		return true;
	}
	
	/**
	 * 根据登录token查找用户
	 * @param loginId
	 * @return
	 */
	public TUser findByToken(String token) {
		String query = "from TUser user where user.token = '"+token+"' and user.type='sydw'";
		return (TUser)super.findSingletonByHql(query);
	}
	
	
	
	public boolean findByLiginId(String loginId){
		
		List list = super.findListByHql(" from TUser where loginId = '"+loginId+"' ");
		
		if(list.size() > 0){
			return true;
		}
		
		return false;
	}
}
