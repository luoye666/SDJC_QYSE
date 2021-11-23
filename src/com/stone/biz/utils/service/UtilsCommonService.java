package com.stone.biz.utils.service;

import frm.ssh.service.BaseService;
import frm.util.commons.StringUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.struts2.ServletActionContext;

import com.stone.biz.dbsx.pojo.TDaiBanShiXiang;
import com.stone.biz.jcsj.pojo.TApprizes;
import com.stone.biz.jcsj.pojo.TBaseInfo;
import com.stone.biz.jcsj.pojo.TBaseInfoSearch;
import com.stone.biz.sjsh.pojo.TShuJuShenHe;
import com.stone.biz.utils.pojo.TAzUtils;
import com.stone.biz.utils.pojo.TCzUtils;
import com.stone.biz.utils.pojo.TEnterpriseInspect;
import com.stone.biz.utils.pojo.TJyUtils;
import com.stone.biz.utils.pojo.TScUtils;
import com.stone.biz.utils.pojo.TSyUtils;
import com.stone.support.SupportService;
import com.stone.support.utils.DateFormatTool;
import com.stone.support.utils.FileUtils;
import com.stone.support.utils.Resources;
import com.stone.support.utils.StringUtils;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TMenu;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TUser;

public class UtilsCommonService extends SupportService {

	/**
	 * 删除使用单位方法
	 * 1 删除时 需判断使用单位底下是否有设备 
	 * 2 如果有设备 则不能删除
	 * @param ids
	 */
	public String doDelete(String ids) { 
		 String str = "";
		 List<TBaseInfo> equipList = super.findListByHql("from TBaseInfo where shiyongdanweiId in (" + ids + ") and (zcstatus ='1' or zcstatus='3') " +
		 		" and tmpData = '0' ");
		 
		 if(equipList.size() > 0){
			 str = "此单位下有"+equipList.size()+"台设备，不能删除！";
		 }else{
			 super.deleteAll(ids, TSyUtils.class.getName());
			 str = "删除成功";
		 }
		 
//		 super.deleteByDHql("id in (select id from TBaseInfo where shiyongdanweiId in("+ ids + "))", null, TBaseInfo.class.getName());
		return str; 
		 
		 
	}

	//更新安装单位信息
	public void updateAzdw(TAzUtils az,String tjstate,TUser user,String address,String dbid,TAzUtils oldAz,TOrgan organ){
		String neirong = az.getUnitsname()+"&nbsp;&nbsp;&nbsp;"+az.getUnitsadd()+"&nbsp;&nbsp;&nbsp;"+az.getUnitsid()+"&nbsp;&nbsp;&nbsp;"+
		az.getCorporation()+"&nbsp;&nbsp;&nbsp;"+az.getCorporationtel()+"&nbsp;&nbsp;&nbsp;"+az.getShi()+"&nbsp;&nbsp;&nbsp;"+az.getQuxian();
		if("1".equals(tjstate)){//若点击提交按钮  则直接修改   要向待办区中写入数据
			super.update(az);
			long newId = az.getId();
			long dwid = az.getId();
			TAzUtils azClone = az;
			if("db".equals(address)){//如果在待办中的详细信息中点击提交
				dwid = az.getPid();
				updateDbInfo(neirong,user,dbid,tjstate);
				TAzUtils azdw = (TAzUtils)super.findById(az.getPid(),TAzUtils.class.getName());
				super.delete(azdw);
				azClone = az.clone();
				azClone.setTmpData("0");
				azClone.setPid(null);
				super.save(azClone);
		//		super.delete(az);
				newId = azClone.getId();
				super.updateByHQL("update TAzUtils set pid = ? where pid = '"+dwid+"'", new Object[] {newId});
			}else{//在设备列表点击提交,要往待办中插入一条数据
				azClone = oldAz;
				azClone.setId(null);
				azClone.setTmpData("1");
				azClone.setPid(az.getId());
				neirong = azClone.getUnitsname()+"&nbsp;&nbsp;&nbsp;"+azClone.getUnitsadd()+"&nbsp;&nbsp;&nbsp;"+azClone.getUnitsid()+"&nbsp;&nbsp;&nbsp;"+
				azClone.getCorporation()+"&nbsp;&nbsp;&nbsp;"+azClone.getCorporationtel()+"&nbsp;&nbsp;&nbsp;"+azClone.getShi()+"&nbsp;&nbsp;&nbsp;"+azClone.getQuxian();
				super.save(azClone);
				TDaiBanShiXiang db = new TDaiBanShiXiang();
				db.setNeirong(neirong);
				db.setXiugairen(user.getName());
				db.setXiugairiqi(new Date());
				db.setXiugairen_loginId(user.getLoginId());
				db.setDataId(azClone.getId());
				db.setType("安装单位");
				db.setTjstate("1");
				db.setOrgan_code(organ.getCode());
				super.save(db);
			}
			super.updateByHQL(
					"update TApprizes set shigongdanweiId = ? where shigongdanweiId in ("
							+ dwid + ")", new Object[] {newId});
		}else{//若不点击提交按钮  则要向待办区中写入数据
			if("db".equals(address)){//如果在待办中的详细信息中点击保存
				updateDbInfo(neirong,user,dbid,tjstate);
				super.update(az);
			}else{
				TDaiBanShiXiang db = null;
				String hql = "from TDaiBanShiXiang where dataId = '"+az.getId()+"' and xiugairen_loginId = '"+user.getLoginId()+"' and type = '安装单位'";
				List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
				if(dbList.size()>0){
					db = dbList.get(0);
					db.setNeirong(neirong);
					db.setXiugairiqi(new Date());
					super.update(db);
				}else{
					az.setTmpData("1");
					az.setPid(az.getId());
					az.setId(null);
					super.save(az);
					db = new TDaiBanShiXiang();
					db.setNeirong(neirong);
					db.setXiugairen(user.getName());
					db.setXiugairiqi(new Date());
					db.setXiugairen_loginId(user.getLoginId());
					db.setDataId(az.getId());
					db.setType("安装单位");
					db.setTjstate("0");
					db.setOrgan_code(organ.getCode());
					super.save(db);
				}
			}
		}
	}
	//更新使用单位信息
	public String updateSydw(TSyUtils sy,String tjstate,TUser user,File file,String fileName) throws IOException{
		String oldFujian = sy.getFujian();
		String result = "SUCCESS";
        String maxFileSize = Resources.getString("DANWEIBIANGENGZILIAOSIZE", "struts");
		if ((fileName == null) || (file == null)
				|| (file.length() > 1024*1024*Integer.parseInt(maxFileSize))) {
			return "OUTSIZE";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Random rd = new Random();
		String fileType = fileName.substring(fileName.lastIndexOf("."));
		if(FileUtils.fileType(fileType)){
			return "OUTSIZE";
		}
		String fName = fileName.substring(0,fileName.indexOf("."));
		String newfileName = fName+"_"+sdf.format(new Date())+(rd.nextInt(90000)+10000)+fileType;
		   //得到工程保存文件的路径
	    String savePath = Resources.getString("DANWEIBIANGENGZILIAO", "struts");
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
		String neirong = sy.getDwmc()+"&nbsp;&nbsp;&nbsp;"+sy.getDwdz()+"&nbsp;&nbsp;&nbsp;"+sy.getLxr()+
		"&nbsp;&nbsp;&nbsp;"+sy.getLxdh()+"&nbsp;&nbsp;&nbsp;"+sy.getShi()+"&nbsp;&nbsp;&nbsp;"+sy.getQuxian();
		TDaiBanShiXiang db = null;
		String hql = "from TDaiBanShiXiang where dataId = '"+sy.getId()+"' and xiugairen_loginId = '"+user.getLoginId()+"' and type = '使用单位'";
		List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
		if(dbList.size()>0){
			db = dbList.get(0);
			db.setNeirong(neirong);
			db.setXiugairiqi(new Date());
			super.update(db);
		}else{
			sy.setTmpData("1");
			sy.setPid(sy.getId());
			sy.setId(null);
			sy.setFujian(savePath+newfileName);
			super.save(sy);
			db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(sy.getId());
			db.setType("使用单位");
			db.setTjstate("0");
			db.setOrgan_code(sy.getQuxiandaima());
			db.setQiyetijiao("1");
			TShuJuShenHe sj = new TShuJuShenHe();
			sj.setNeirong(neirong);
			sj.setDataId(sy.getId());
			sj.setOrgan_code(sy.getQuxiandaima());
			sj.setTijiaoren(user.getName());
			sj.setTijiaoren_loginId(user.getLoginId());
			sj.setTijiaoriqi(new Date());
			sj.setType("使用单位");
			sj.setShenheleixing("信息变更");
			sj.setShstate("0");
			sj.setDbId(super.saveReturnId(db));
			super.save(sj);
		}
		if(!"".equals(oldFujian) && null != oldFujian){
			File oldFile = new File(oldFujian);
			if(oldFile.exists()){
				oldFile.delete();
			}
		}
		return result;
	}
	//更新充装单位信息
	public void updateCzdw(TCzUtils cz,String tjstate,TUser user,String address,String dbid,TCzUtils oldCz,TOrgan organ){
		String neirong = cz.getDwmc()+"&nbsp;&nbsp;&nbsp;"+cz.getDwdz()+"&nbsp;&nbsp;&nbsp;"+cz.getQtzl()+"&nbsp;&nbsp;&nbsp;"+cz.getQtlb()+
		"&nbsp;&nbsp;&nbsp;"+cz.getFrdb()+"&nbsp;&nbsp;&nbsp;"+cz.getFrtel()+"&nbsp;&nbsp;&nbsp;"+cz.getShi()+"&nbsp;&nbsp;&nbsp;"+cz.getQuxian();
		if("1".equals(tjstate)){//若点击提交按钮  则直接修改   要向待办区中写入数据
			super.update(cz);
			TCzUtils czClone = null;
			if("db".equals(address)){//如果在待办中的详细信息中点击提交
				long oldId = cz.getPid();
				updateDbInfo(neirong,user,dbid,tjstate);
				TCzUtils czdw = (TCzUtils)super.findById(cz.getPid(),TCzUtils.class.getName());
				super.delete(czdw);
				czClone = cz.clone();
				czClone.setTmpData("0");
				czClone.setPid(null);
				super.save(czClone);
		//		super.delete(cz);
				super.updateByHQL("update TCzUtils set pid = ? where pid = '"+oldId+"'", new Object[] {czClone.getId()});
			}else{//在设备列表点击提交,要往待办中插入一条数据
				czClone = oldCz;
				czClone.setId(null);
				czClone.setTmpData("1");
				czClone.setPid(cz.getId());
				neirong = czClone.getDwmc()+"&nbsp;&nbsp;&nbsp;"+czClone.getDwdz()+"&nbsp;&nbsp;&nbsp;"+czClone.getQtzl()+"&nbsp;&nbsp;&nbsp;"+
				czClone.getQtlb()+"&nbsp;&nbsp;&nbsp;"+czClone.getFrdb()+"&nbsp;&nbsp;&nbsp;"+czClone.getShi()+"&nbsp;&nbsp;&nbsp;"+czClone.getQuxian();
				super.save(czClone);
				TDaiBanShiXiang db = new TDaiBanShiXiang();
				db.setNeirong(neirong);
				db.setXiugairen(user.getName());
				db.setXiugairiqi(new Date());
				db.setXiugairen_loginId(user.getLoginId());
				db.setDataId(czClone.getId());
				db.setType("充装单位");
				db.setTjstate("1");
				db.setOrgan_code(organ.getCode());
				super.save(db);
			}
		}else{//若不点击提交按钮  则要向待办区中写入数据
			if("db".equals(address)){//如果在待办中的详细信息中点击保存
				updateDbInfo(neirong,user,dbid,tjstate);
				super.update(cz);
			}else{
				TDaiBanShiXiang db = null;
				String hql = "from TDaiBanShiXiang where dataId = '"+cz.getId()+"' and xiugairen_loginId = '"+user.getLoginId()+"' and type = '充装单位'";
				List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
				if(dbList.size()>0){
					db = dbList.get(0);
					db.setNeirong(neirong);
					db.setXiugairiqi(new Date());
					super.update(db);
				}else{
					cz.setTmpData("1");
					cz.setPid(cz.getId());
					cz.setId(null);
					super.save(cz);
					db = new TDaiBanShiXiang();
					db.setNeirong(neirong);
					db.setXiugairen(user.getName());
					db.setXiugairiqi(new Date());
					db.setXiugairen_loginId(user.getLoginId());
					db.setDataId(cz.getId());
					db.setType("充装单位");
					db.setTjstate("0");
					db.setOrgan_code(organ.getCode());
					super.save(db);
				}
			}
		}
	}
	//更新检验单位信息
	public void updateJydw(TJyUtils jy,String tjstate,TUser user,String address,String dbid,TJyUtils oldJy,TOrgan organ){
		String neirong = jy.getDwmc()+"&nbsp;&nbsp;&nbsp;"+jy.getDwdz()+"&nbsp;&nbsp;&nbsp;"+jy.getJynr()+"&nbsp;&nbsp;&nbsp;"+jy.getFrdb()+
		"&nbsp;&nbsp;&nbsp;"+jy.getFrtel()+"&nbsp;&nbsp;&nbsp;"+jy.getShi()+"&nbsp;&nbsp;&nbsp;"+jy.getQuxian();
		if("1".equals(tjstate)){//若点击提交按钮  则直接修改   要向待办区中写入数据
			super.update(jy);
			TJyUtils jyClone = null;
			if("db".equals(address)){//如果在待办中的详细信息中点击提交
				long oldId = jy.getPid();
				updateDbInfo(neirong,user,dbid,tjstate);
				TJyUtils jydw = (TJyUtils)super.findById(jy.getPid(),TJyUtils.class.getName());
				super.delete(jydw);
				jyClone = jy.clone();
				jyClone.setTmpData("0");
				jyClone.setPid(null);
				super.save(jyClone);
		//		super.delete(jy);
				super.updateByHQL("update TJyUtils set pid = ? where pid = '"+oldId+"'", new Object[] {jyClone.getId()});
			}else{//在设备列表点击提交,要往待办中插入一条数据
				jyClone = oldJy;
				jyClone.setId(null);
				jyClone.setTmpData("1");
				jyClone.setPid(jy.getId());
				neirong = jyClone.getDwmc()+"&nbsp;&nbsp;&nbsp;"+jyClone.getDwdz()+"&nbsp;&nbsp;&nbsp;"+jyClone.getJynr()+"&nbsp;&nbsp;&nbsp;"+
				jyClone.getFrdb()+"&nbsp;&nbsp;&nbsp;"+jyClone.getFrtel()+"&nbsp;&nbsp;&nbsp;"+jyClone.getShi()+"&nbsp;&nbsp;&nbsp;"+jyClone.getQuxian();
				super.save(jyClone);
				TDaiBanShiXiang db = new TDaiBanShiXiang();
				db.setNeirong(neirong);
				db.setXiugairen(user.getName());
				db.setXiugairiqi(new Date());
				db.setXiugairen_loginId(user.getLoginId());
				db.setDataId(jyClone.getId());
				db.setType("检验单位");
				db.setTjstate("1");
				db.setOrgan_code(organ.getCode());
				super.save(db);
			}
		}else{//若不点击提交按钮  则要向待办区中写入数据
			if("db".equals(address)){//如果在待办中的详细信息中点击保存
				updateDbInfo(neirong,user,dbid,tjstate);
				super.update(jy);
			}else{
				TDaiBanShiXiang db = null;
				String hql = "from TDaiBanShiXiang where dataId = '"+jy.getId()+"' and xiugairen_loginId = '"+user.getLoginId()+"' and type = '检验单位'";
				List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
				if(dbList.size()>0){
					db = dbList.get(0);
					db.setNeirong(neirong);
					db.setXiugairiqi(new Date());
					super.update(db);
				}else{
					jy.setTmpData("1");
					jy.setPid(jy.getId());
					jy.setId(null);
					super.save(jy);
					db = new TDaiBanShiXiang();
					db.setNeirong(neirong);
					db.setXiugairen(user.getName());
					db.setXiugairiqi(new Date());
					db.setXiugairen_loginId(user.getLoginId());
					db.setDataId(jy.getId());
					db.setType("检验单位");
					db.setTjstate("0");
					db.setOrgan_code(organ.getCode());
					super.save(db);
				}
			}
		}
	}
	//更新生产单位信息
	public void updateScdw(TScUtils sc,String tjstate,TUser user,String address,String dbid,TScUtils oldSc,TOrgan organ){
		String neirong = sc.getDwmc()+"&nbsp;&nbsp;&nbsp;"+sc.getDwdz()+"&nbsp;&nbsp;&nbsp;"+sc.getGlzdb()+"&nbsp;&nbsp;&nbsp;"+sc.getFrdb()+
		"&nbsp;&nbsp;&nbsp;"+sc.getFrtel()+"&nbsp;&nbsp;&nbsp;"+sc.getShi()+"&nbsp;&nbsp;&nbsp;"+sc.getQuxian();
		if("1".equals(tjstate)){//若点击提交按钮  则直接修改   要向待办区中写入数据
			super.update(sc);
			TScUtils scClone = null;
			if("db".equals(address)){//如果在待办中的详细信息中点击提交
				long fid = sc.getPid();
				long oldId = sc.getPid();
				updateDbInfo(neirong,user,dbid,tjstate);
				TScUtils scdw = (TScUtils)super.findById(sc.getPid(),TScUtils.class.getName());
				super.delete(scdw);
				scClone = sc.clone();
				scClone.setTmpData("0");
				scClone.setPid(null);
				super.save(scClone);
	//			super.delete(sc);
				//更新证书的外键
				super.updateByHQL("update TScUtilsLi set fid = ? where fid = '"+fid+"'", new Object[] {scClone.getId()});
				super.updateByHQL("update TScUtils set pid = ? where pid = '"+oldId+"'", new Object[] {scClone.getId()});
			}else{//在设备列表点击提交,要往待办中插入一条数据
				scClone = oldSc;
				scClone.setId(null);
				scClone.setTmpData("1");
				scClone.setPid(sc.getId());
				neirong = scClone.getDwmc()+"&nbsp;&nbsp;&nbsp;"+scClone.getDwdz()+"&nbsp;&nbsp;&nbsp;"+scClone.getGlzdb()+"&nbsp;&nbsp;&nbsp;"+
				scClone.getFrdb()+"&nbsp;&nbsp;&nbsp;"+scClone.getFrtel()+"&nbsp;&nbsp;&nbsp;"+scClone.getShi()+"&nbsp;&nbsp;&nbsp;"+scClone.getQuxian();
				super.save(scClone);
				TDaiBanShiXiang db = new TDaiBanShiXiang();
				db.setNeirong(neirong);
				db.setXiugairen(user.getName());
				db.setXiugairiqi(new Date());
				db.setXiugairen_loginId(user.getLoginId());
				db.setDataId(scClone.getId());
				db.setType("生产单位");
				db.setTjstate("1");
				db.setOrgan_code(organ.getCode());
				super.save(db);
			}
		}else{//若不点击提交按钮  则要向待办区中写入数据
			if("db".equals(address)){//如果在待办中的详细信息中点击保存
				updateDbInfo(neirong,user,dbid,tjstate);
				super.update(sc);
			}else{
				TDaiBanShiXiang db = null;
				String hql = "from TDaiBanShiXiang where dataId = '"+sc.getId()+"' and xiugairen_loginId = '"+user.getLoginId()+"' and type = '生产单位'";
				List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
				if(dbList.size()>0){
					db = dbList.get(0);
					db.setNeirong(neirong);
					db.setXiugairiqi(new Date());
					super.update(db);
				}else{
					sc.setTmpData("1");
					sc.setPid(sc.getId());
					sc.setId(null);
					super.save(sc);
					db = new TDaiBanShiXiang();
					db.setNeirong(neirong);
					db.setXiugairen(user.getName());
					db.setXiugairiqi(new Date());
					db.setXiugairen_loginId(user.getLoginId());
					db.setDataId(sc.getId());
					db.setType("生产单位");
					db.setTjstate("0");
					db.setOrgan_code(organ.getCode());
					super.save(db);
				}
			}
		}
	}
	
	public String deleteAzdw(String id) {
		List gzList = super.findListByHql("select id from TBaseInfo where shigongdanweiId in ("
						+ id + ") and zcstatus='2' and state != '0'");
		if (gzList.size() > 0) {
			return "exit";
		}
		super.deleteByDHql("shigongdanweiId in (" + id + ") and state='0' and zcstatus = '2'", null,
				TBaseInfo.class.getName());

		super.deleteByDHql("id in (" + id + ")", null, TAzUtils.class.getName());
		return "del";
	}
	public String getNameByCode(String code){
		String name = "";
		List<TDicData> list = super.findListByHql("from TDicData where code = '"+code+"'");
		if(list.size()>0){
			name = list.get(0).getName();
		}
		return name;
	}

	public int verifyByDwmcToAz(String dwid,String dwmc){
		String hql = "from TAzUtils where unitsname = '"+dwmc.trim()+"' and tmpData = '0'";
		if(!"".equals(dwid)){
			hql += " and id != '"+dwid+"'";
		}
		return super.findListByHql(hql).size();
	}
	public int verifyByDwmcToCz(String dwid,String dwmc){
		String hql = "from TCzUtils where dwmc = '"+dwmc.trim()+"' and tmpData = '0'";
		if(!"".equals(dwid)){
			hql += " and id != '"+dwid+"'";
		}
		return super.findListByHql(hql).size();
	}
	public int verifyByDwmcToJy(String dwid,String dwmc){
		String hql = "from TJyUtils where dwmc = '"+dwmc.trim()+"' and tmpData = '0'";
		if(!"".equals(dwid)){
			hql += " and id != '"+dwid+"'";
		}
		return super.findListByHql(hql).size();
	}
	public int verifyByDwmcToSc(String dwid,String dwmc){
		String hql = "from TScUtils where dwmc = '"+dwmc.trim()+"' and tmpData = '0'";
		if(!"".equals(dwid)){
			hql += " and id != '"+dwid+"'";
		}
		return super.findListByHql(hql).size();
	}
	/**
	 * 判断单位是否重复
	 * 1 判断使用单位是否重复 判断条件  单位名称+市+区县+乡镇
	 * 2 如果重复添加提示单位重复，否则添加成功
	 * 2016-04-26 
	 * @param dwid 
	 * @param dwmc
	 * @param shi
	 * @param quxian
	 * @param xiangzhen
	 * @return
	 */
	public int verifyByDwmcToSy(String dwid,String dwmc,String shi,String quxian,String xiangzhen){
		
		String hql = "";
		
		if(!"".equals(xiangzhen)){
			hql = "from TSyUtils where dwmc = '"+dwmc.trim()+"' " +
			"and shidaima='"+shi+"' and quxiandaima='"+quxian+"' and xiangzhendaima='"+xiangzhen+"' and tmpData = '0' ";
		}else{
			hql = "from TSyUtils where dwmc = '"+dwmc.trim()+"' " +
			"and shidaima='"+shi+"' and quxiandaima='"+quxian+"' and xiangzhendaima is null and tmpData = '0' ";
		}
		
		if(!"".equals(dwid)){
			hql += " and id != '"+dwid+"'";
		}
		return super.findListByHql(hql).size();
	}
	
	//单位变更
	public void changeUtils(TSyUtils sy,String oldDwmc,TUser user,TOrgan organ){
		sy.setShi(getNameByCode(sy.getShidaima()));
		sy.setQuxian(getNameByCode(sy.getQuxiandaima()));
		sy.setXiangzhen(getNameByCode(sy.getXiangzhendaima()));
		super.update(sy);
		//修改设备单位
		String hql = "from TBaseInfoSearch where shiyongdanweiId = '"+sy.getId()+"' and (zcstatus='1' or zcstatus='3') and tmpData='0' ";
		List<TBaseInfoSearch> list = super.findListByHql(hql);
		if(list.size()>0){
			for(TBaseInfoSearch b : list){
				b.setShiyongdanwei(sy.getDwmc());
				b.setShiyongdanwei_dizhi(sy.getDwdz());
				b.setShiyongdanwei_lianxiren(sy.getLxr());
				b.setShiyongdanwei_lianxidianhua(sy.getLxdh());
				b.setShi(sy.getShi());
				b.setShidaima(sy.getShidaima());
				b.setQuhuamingcheng(sy.getQuxian());
				b.setQuhuadaima(sy.getQuxiandaima());
				b.setXiangzhen(sy.getXiangzhen());
				b.setXiangzhendaima(sy.getXiangzhendaima());
				b.setShiyongdanweiId(sy.getId());
				super.update(b);
			}
			
			TDaiBanShiXiang db = new TDaiBanShiXiang();
			String neirong = oldDwmc+"变更为："+sy.getDwmc();
			db.setNeirong(neirong.replace("null",""));
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(sy.getId());
			db.setType("使用单位");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
			
			
		}
	}
	//获取证书信息菜单的id
	public long getZhengShuId(String mid){
		long id = 0;
		TMenu menu = (TMenu)super.findById(Long.parseLong(mid), TMenu.class.getName());
		String hql = "from TMenu where parentId = '"+menu.getParentId()+"' and title = '证书信息'";
		List<TMenu> list = super.findListByHql(hql);
		if(list.size()>0){
			id = list.get(0).getId();
		}
		return id;
	}
	//更新待办的信息
	public void updateDbInfo(String neirong,TUser user,String dbid,String state){
		TDaiBanShiXiang db = (TDaiBanShiXiang)super.findById(Long.parseLong(dbid),TDaiBanShiXiang.class.getName());
		if("1".equals(state)){//在待办中提交,直接删除待办信息
	//		super.delete(dbid,TDaiBanShiXiang.class.getName());
			db.setTjstate(state);
		}else{
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
		}
		super.update(db);
	}
	
	
	/**
	 * 判断单位是否存在
	 * 1 判断使用单位是否重复 判断条件  单位名称+市+区县+乡镇
	 * 2 如果重复添加提示单位重复，否则添加成功
	 * 2016-04-26 
	 * @param sydwid
	 * @param dwmc
	 * @param shi
	 * @param quxian
	 * @param xiangzhen
	 * @return
	 */
	public TSyUtils verifyByDwmcToSyHb(String dwmc,String shi,String quxian,String xiangzhen,String sydwid){
		
		String hql = "";
		
		if(!"".equals(xiangzhen)){
			hql = "from TSyUtils where dwmc = '"+dwmc.trim()+"' " +
			"and shidaima='"+shi+"' and quxiandaima='"+quxian+"' and xiangzhendaima='"+xiangzhen+"' and tmpData = '0' ";
		}else{
			hql = "from TSyUtils where dwmc = '"+dwmc.trim()+"' " +
			"and shidaima='"+shi+"' and quxiandaima='"+quxian+"' and xiangzhendaima is null and tmpData = '0' ";
		}
		
		if(sydwid != ""){
			hql += " and id not in  ("+sydwid+") ";
		}
		
		return (TSyUtils) super.findSingletonByHql(hql);
	}
	
	
	/**
	 * 批量修改使用单位区县
	 * 1 单位判重   如果重复不做任务操作，提示重复的单位名称，并使用合并功能操作 （如果有重复的则进行合并）
	 * 2 更改设备的市 区县 乡镇 信息
	 * @param sydwid
	 * @param syUtils
	 */
	public String updPLQX(String sydwid,TSyUtils syUtils,TUser user,TOrgan organ){
		
		String mingcheng = ""; //用于存储发现重复的单位名称
		//查找出 要修改的使用单位
		List<TSyUtils> list = super.findListByIds(sydwid, TSyUtils.class);
		//对要修改的使用单位进行判重
		TDaiBanShiXiang db = null;
		String neirong = "";
		String shi = "";
		String qx = "";
		String xz = "";
		for(TSyUtils l : list){
			
			shi = this.getNameByCode(syUtils.getShidaima());
			qx = this.getNameByCode(syUtils.getQuxiandaima());
			xz = this.getNameByCode(syUtils.getXiangzhendaima());
			
			db = new TDaiBanShiXiang();
			neirong = l.getDwmc()+"的所在地修改为："+shi+qx+xz;
			db.setNeirong(neirong.replace("null",""));
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(l.getId());
			db.setType("使用单位");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
			
			TSyUtils osy = (TSyUtils) super.findSingletonByHql(" from TSyUtils t where t.dwmc = '"+l.getDwmc()+"' " +
					" and t.shidaima = '"+syUtils.getShidaima()+"' and t.quxiandaima = '"+syUtils.getQuxiandaima()+"' and t.xiangzhendaima = '"+syUtils.getXiangzhendaima()+"' and t.id <> '"+l.getId()+"'" +
							" and t.tmpData = '0' ");
			if(osy == null){//如果osy等于null则说明 没有重复的单位  可以对本单位进行修改区县
				l.setShi(shi);
				l.setShidaima(syUtils.getShidaima());
				l.setQuxian(qx);
				l.setQuxiandaima(syUtils.getQuxiandaima());
				l.setXiangzhen(xz);
				l.setXiangzhendaima(syUtils.getXiangzhendaima());
				super.update(l);
				
				//更改设备信息
				// 更改设备使用单位信息
				super.updateByHQL(
					"update TBaseInfo set shi=?, shidaima=?, quhuamingcheng=?, quhuadaima=?, xiangzhen=?, xiangzhendaima=? where shiyongdanweiId = '"
							+ l.getId() + "' and ( zcstatus ='1' or zcstatus='3' ) and tmpdata = '0' ", new Object[] {
									 l.getShi(),l.getShidaima(),l.getQuxian(),l.getQuxiandaima(),l.getXiangzhen(),l.getXiangzhendaima() });
			}else{
				//与其他的单位有重复  进行合并  现单位进行删除  并把设备转移到以前的设备下
				// 作废使用单位信息
//				super.updateByHQL("update TSyUtils set flag = '9' where id = "+ l.getId() , null);
//				super.updateByHQL("delete from TSyUtils  where id = "+ l.getId(), null);
				//更改设备信息
				// 更改设备使用单位信息
//				super.updateByHQL(
//					"update TBaseInfo set shiyongdanweiId = ?, shiyongdanwei = ?, shi=?, shidaima=?, quhuamingcheng=?, quhuadaima=?, xiangzhen=?, xiangzhendaima=? where shiyongdanweiId = '"
//							+ l.getId() + "' and ( zcstatus ='1' or zcstatus='3' ) and tmpdata = '0' ", new Object[] {
//								osy.getId(), osy.getDwmc(), osy.getShi(),osy.getShidaima(),osy.getQuxian(),osy.getQuxiandaima(),osy.getXiangzhen(),osy.getXiangzhendaima() });
				
				
				//重复的记录单位名称，给以提示
				mingcheng += l.getDwmc()+" ";
			}
		}
		
		return mingcheng;
		
	}
	//导出excel表格
	public void expExcel(String query,OutputStream os,String columns,String lx) throws UnsupportedEncodingException{
		columns = URLDecoder.decode(columns,"utf-8");
		WritableWorkbook workbook = null;
		String title = "";//标题
		String colName = "";//表列名
		String[] clnArr = columns.split(",");
		String[] colArr = null;
		for(String c : clnArr){
			colArr = c.split("\\|");
			title += colArr[0]+",";
			colName += colArr[1]+",";
		}
		if(title.endsWith(",")){
			title = title.substring(0,title.length()-1);
			colName = colName.substring(0,colName.length()-1);
		}
		
		try {
			// 创建Excel
			workbook = Workbook.createWorkbook(os);
			// 在Excel中新建一个sheet
			WritableSheet wsheet = workbook.createSheet("列表", 0);
	
			// 根据标题列数设置每列宽度
			String[] titles = title.split(",");
			for (int i = 0; i < titles.length; i++) {
				wsheet.setColumnView(i, 20);
			}
			// 标题字体
			WritableFont font = new WritableFont(WritableFont.ARIAL, 12,
					WritableFont.BOLD, false,
					jxl.format.UnderlineStyle.NO_UNDERLINE,
					jxl.format.Colour.BLACK);
			WritableCellFormat format = new WritableCellFormat(font);
			// 标题设置		
			for (int i = 0; i < titles.length; i++) {
				Label wlabel = new Label(i, 0, String.valueOf(titles[i]), format);
				wsheet.addCell(wlabel);
			}
			// 内容字体
			font = new jxl.write.WritableFont(WritableFont.createFont("宋体"),
					12, WritableFont.NO_BOLD, false,
					jxl.format.UnderlineStyle.NO_UNDERLINE,
					jxl.format.Colour.BLACK);
			format = new jxl.write.WritableCellFormat(font);
	
			if("sb".equals(lx)){
				query = query.substring(query.indexOf("from"), query.length());
				query = "select "+ colName+ " " + query ;
			}else{
				query = "select "+ colName+ " " + query.replace("TSyUtils", "TAB_SYUNITS");
			}
			
			List<HashMap<String,Object>> list = super.findListBySql(query);
			String v = "";
			for(int i = 0;i<list.size();i++){
				String[] colNameArr = colName.split(",");
				HashMap<String,Object> m = list.get(i);
				for(int c = 0;c<colNameArr.length;c++){
					v = "";
					if ((m.get(colNameArr[c]) instanceof Date)) {
						v = DateFormatTool.format((Date) m.get(colNameArr[c]), false);
					} else {
						v = m.get(colNameArr[c]) == null ? "" : m.get(colNameArr[c]).toString();
					}
					Label wlabel = new Label(c, i+1, v, format);
					wsheet.addCell(wlabel);
				}
			}
			workbook.write();
			workbook.close();
			os.close();
		} catch (Exception e) {
			
		}
	}
	public void getZuobiao(String id,String[] zb){
		TSyUtils sy = (TSyUtils)super.findById(Long.parseLong(id),TSyUtils.class.getName());
		if(!"".equals(sy.getJingdu()) && null != sy.getJingdu()){
			zb[0] = sy.getJingdu();
			zb[1] = sy.getWeidu();
			zb[2] = "true";
			zb[3] = "16";
		}else{
			if(!"".equals(sy.getShidaima())){
				String hql = "from TOrgan where code = '"+sy.getShidaima()+"' and parentId = (select id from TOrgan where nameEN = 'SDJC')";
				List<TOrgan> list = super.findListByHql(hql);
				if(list.size()>0){
					zb[0] = list.get(0).getJingdu();
					zb[1] = list.get(0).getWeidu();
				}
			}
		}
	}
	public void saveBz(String id,String jingdu,String weidu){
		TSyUtils sy = (TSyUtils)super.findById(Long.parseLong(id),TSyUtils.class.getName());
		sy.setJingdu(jingdu);
		sy.setWeidu(weidu);
		super.update(sy);
		String hql = "update TBaseInfo set jingdu = '"+jingdu+"',weidu = '"+weidu+"' where shiyongdanweiId = '"+id+"'";
		super.updateByHQL(hql, null);
	}
	
	 /**
     * 根据社会组织统一信用代码拉取使用单位信息
     *
     * @param xydm 社会组织统一信用代码
     * @param dwmc 使用单位名称
     * @return 查询结果信息
     */
    public HashMap<String, Object> findSydwBaseByXydm(String xydm, String dwmc) {
        if (StringUtil.IsNull(xydm) && StringUtil.IsNull(dwmc)) {
            return null;
        }
        // TODO: 2021/2/27 正式连接省局数据库拉取企业单位信息
          String sql = "select uniscid,entname,dom from e_baseinfo@lcqzj where 1=1 ";
        // TODO: 2021/2/27 本地测试运行连接47测试数据库
//        String sql = "select uniscid,entname,dom,name,tel from e_baseinfo where 1=1 ";
        if (StringUtil.canUse(xydm)) {
            sql += "and UNISCID = '" + xydm + "' ";
        }
        if (StringUtil.canUse(dwmc)) {
            sql += "and ENTNAME = '" + dwmc + "' ";
        }
        List<HashMap<String, Object>> sydwMap = super.findListBySql(sql);
        return sydwMap.size() > 0 ? sydwMap.get(0) : null;
    }
	
    
    
  
  	/**
  	 * 保存企业自查信息
  	 * @param inspect
  	 * @param file
  	 * @param fileName
  	 * @return
  	 */
  	public String saveEnterpriseInspect(TEnterpriseInspect inspect, File file,String fileName) {
  		String result = "SUCCESS";
  	    String inspectReportFile = "SUCCESS";
  		if(file != null){
  			inspectReportFile = uploadFile(file,fileName);
  		}
  		
  		if("OUTSIZE".equals(inspectReportFile)){
  			return "OUTSIZE";
  		}
  		inspect.setInspectReportFile(inspectReportFile);
  		super.save(inspect);
  		return result;
  	}
  	
  	
  	/**
  	 * 保存企业自查信息
  	 * @param inspect
  	 * @param file
  	 * @param fileName
  	 * @return
  	 */
  	public String updateEnterpriseInspect(TEnterpriseInspect inspect, File file,String fileName) {
  		String result = "SUCCESS";
  		
  		if(fileName != null && file != null){
            if (!(fileName.endsWith(".pdf") || fileName.endsWith(".zip") || fileName.endsWith(".rar")
            		|| fileName.endsWith(".doc") || fileName.endsWith(".docx"))) {
                return "FILE_TYPE_NOT_SUPPORT";
            }

  			if(!"".equals(inspect.getInspectReportFile()) && null != inspect.getInspectReportFile()){
  				File oldFile = new File(inspect.getInspectReportFile());
  				if(oldFile.exists()){
  					oldFile.delete();
  				}
  			}
  	  		
  	        String inspectReportFile = uploadFile(file,fileName);
  	  		if("OUTSIZE".equals(inspectReportFile)){
  	  			return "OUTSIZE";
  	  		}
  	  		inspect.setInspectReportFile(inspectReportFile);
  		}
  		super.update(inspect);
  		return result;
  	}
  	
  	
  	
  	/**
  	 * 上传自查报告
  	 */
  	public String uploadFile(File file,String fileName){
  		String inspectReportFile = "";
  		try {
  			String maxFileSize = Resources.getString("DANWEIBIANGENGZILIAOSIZE", "struts");
  	  		if ((fileName == null) || (file == null)
  	  				|| (file.length() > 1024*1024*Integer.parseInt(maxFileSize))) {
  	  			
  	  			return "OUTSIZE";
  	  		}
  	  		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
  	  		Random rd = new Random();
  	  		String fileType = fileName.substring(fileName.lastIndexOf("."));
	  	  	if(FileUtils.fileType(fileType)){
				return "OUTSIZE";
			}
  	  		String fName = fileName.substring(0,fileName.indexOf("."));
  	  		String newfileName = fName+"_"+sdf.format(new Date())+(rd.nextInt(90000)+10000)+fileType;
  	  		   //得到工程保存文件的路径
  	  	    String savePath = Resources.getString("DANWEIBIANGENGZILIAO", "struts");
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
  	  	    inspectReportFile = savePath+newfileName;
		} catch (Exception e) {
			e.printStackTrace();
		}
  	    
  	    return inspectReportFile;
  	}
}
 