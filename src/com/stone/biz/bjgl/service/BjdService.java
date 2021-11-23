package com.stone.biz.bjgl.service;

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

import com.stone.biz.bjgl.pojo.TBjd;
import com.stone.biz.jcsj.pojo.TBaseFile;
import com.stone.biz.jcsj.pojo.TBaseInfoSearch;
import com.stone.support.SupportService;
import com.stone.support.utils.FileUtils;
import com.stone.support.utils.Resources;
import com.stone.sys.pojo.TUser;

public class BjdService extends SupportService{

	/**
	 * 根据设备id查询出设备信息填充到bjd里
	 * @param seId
	 * @return
	 */
	public TBjd findSe(String seId){
		TBjd bjd = new TBjd();
		seId = seId.split(",")[0];
		TBaseInfoSearch base = (TBaseInfoSearch) super.findById(Long.parseLong(seId), TBaseInfoSearch.class.getName());
		if(base != null){
			bjd.setJianyanleibie("定期检验");
			bjd.setShebeizhonglei(base.getShebeizhonglei());
			bjd.setShebeizhongleidaima(base.getShebeizhongleidaima());
			bjd.setShiyongdanwei(base.getShiyongdanwei());
			bjd.setShiyongdanweiDizhi(base.getShiyongdanwei_dizhi());
			bjd.setShiyongdanweiShebeidizhi(base.getShebeididian());
			bjd.setShiyongdanweiLianxiren(base.getShiyongdanwei_lianxiren());
			bjd.setShiyongdanweiLianxidianhua(bjd.getShiyongdanweiLianxidianhua());
			bjd.setShi(base.getShi());
			bjd.setShidaima(base.getShidaima());
			bjd.setQuhuadaima(base.getQuhuadaima());
			bjd.setQuhuamingcheng(base.getQuhuamingcheng());
		}
		
		
		return bjd;
	}
	
	
	/**
	 * 根据bjd的设备id查询出所报检的设备
	 * @param seId
	 * @return
	 */
	public List<TBaseInfoSearch> findBjdSe(String seId){
		
		List<TBaseInfoSearch> seList = super.findListByIds(seId, TBaseInfoSearch.class);
		
		return seList;
		
	}
	
	/**
	 * 保存bjd信息
	 * @param bjd
	 * @param user
	 * @return
	 * @throws IOException 
	 */
	public String saveBjd(TBjd bjd,TUser user,File uploadify,String fileFileName) throws IOException{
		String msg = "";
		bjd.setTijiaoriqi(new Date());
		bjd.setBjState("1");
		bjd.setRole(user.getLoginId());
		
		if(fileFileName == null || uploadify == null){ //没有附件 直接保存设备
			Long id = super.saveReturnId(bjd);
			if(id > 0){
				msg = "成功";
			}else{
				msg = "失败";
			}
    		return msg;
        }
		String maxFileSize = Resources.getString("DANWEIBIANGENGZILIAOSIZE", "struts");
		if ((fileFileName == null) || (uploadify == null)
				|| (uploadify.length() > 1024*1024*10)) { //有附件 但是过大 不保存
			return "OUTSIZE";
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Random rd = new Random();
		String fileType = fileFileName.substring(fileFileName.indexOf("."));
		if(FileUtils.fileType(fileType)){
			return "OUTSIZE";
		}
		String fileName = fileFileName.substring(0,fileFileName.indexOf("."));
		String newfileName = fileName+"_"+sdf.format(new Date())+(rd.nextInt(90000)+10000)+fileType;
	    //得到工程保存文件的路径
	    String savePath = Resources.getString("QIYEBJDZILIAO", "struts");
        File uploadFolder = new File(savePath);
        if(!uploadFolder.exists()){
        	uploadFolder.mkdirs();
        }
        FileInputStream is = new FileInputStream(uploadify);
        File file = new File(savePath,newfileName);
        OutputStream os = new FileOutputStream(file);
        byte[] b = new byte[1024];
        int length = 0;
        while((length = is.read(b))>0){
        	os.write(b, 0, length);
        }
        is.close();
        os.close();
		
		bjd.setFujian(savePath+newfileName);
		Long id = super.saveReturnId(bjd);
		
		if(id > 0){
			msg = "成功";
		}else{
			msg = "失败";
		}
		
		return msg;
		
	}
	
	
	
	/**
	 * 查询报检单列表
	 * @param hql
	 * @param page
	 * @param rows
	 * @return
	 */
	public List<TBjd> findListBjd(String hql,int page,int rows){
		
		List<TBjd> bjdList = super.findPageListByHql(hql, page, rows);
		
		return bjdList;
	} 
	
	
	
	/**
	 * bjd资料上传
	 * @param user
	 * @param ids
	 * @param type
	 * @param uploadify
	 * @param fileFileName
	 * @param text
	 * @throws IOException
	 */
	public String saveuploadBjFile(String id,File uploadify,String fileFileName) throws IOException{
		
		String maxFileSize = Resources.getString("DANWEIBIANGENGZILIAOSIZE", "struts");
		if ((fileFileName == null) || (uploadify == null)
				|| (uploadify.length() > 1024*1024*Integer.parseInt(maxFileSize))) { //有附件 但是过大 不保存
			return "OUTSIZE";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Random rd = new Random();
		String fileType = fileFileName.substring(fileFileName.indexOf("."));
		if(FileUtils.fileType(fileType)){
			return "OUTSIZE";
		}
		String fileName = fileFileName.substring(0,fileFileName.indexOf("."));
		String newfileName = fileName+"_"+sdf.format(new Date())+(rd.nextInt(90000)+10000)+fileType;
	    //得到工程保存文件的路径
	    String savePath = Resources.getString("QIYEBJDZILIAO", "struts");
        File uploadFolder = new File(savePath);
        if(!uploadFolder.exists()){
        	uploadFolder.mkdirs();
        }
        FileInputStream is = new FileInputStream(uploadify);
        File file = new File(savePath,newfileName);
        OutputStream os = new FileOutputStream(file);
        byte[] b = new byte[1024];
        int length = 0;
        while((length = is.read(b))>0){
        	os.write(b, 0, length);
        }
        is.close();
        os.close();
        
        TBjd bjd = (TBjd) super.findById(Long.parseLong(id), TBjd.class.getName());
        String oldFujian = bjd.getJiaofeipingzheng();
        if(bjd != null){
        	bjd.setJiaofeipingzheng(savePath+newfileName);
        	super.update(bjd);
        	if(!"".equals(oldFujian) && null != oldFujian){
    			File oldFile = new File(oldFujian);
    			if(oldFile.exists()){
    				oldFile.delete();
    			}
    		}
        }
        
        return "success";
        
	}
	
}
