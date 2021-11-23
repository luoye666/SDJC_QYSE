package com.stone.biz.message.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import com.stone.biz.jcsj.pojo.TApprizes;
import com.stone.biz.message.pojo.MessageBox;
import com.stone.biz.message.pojo.TMessage;
import com.stone.biz.message.pojo.TMessageBoxOrgan;
import com.stone.support.SupportService;
import com.stone.support.utils.FileUtils;
import com.stone.support.utils.Resources;


/**
 * 消息公告
 * @author Chao
 * 20140-05-04
 */
public class MessageBoxService extends SupportService{

	
	public void getList(){
		
		List list = super.findListByHql("from TFlowInfo where 1=1");
		
		System.out.println(list.size());
		
	}
	
	
	public String addMessage(MessageBox box,File file,String fileName) throws IOException{
		String result = "SUCCESS";
        if(fileName == null || file == null){
        	super.save(box);
    		return result;
        }
        String maxFileSize = Resources.getString("MESSAGEZILIAOSIZE", "struts");
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
        String savePath = Resources.getString("MESSAGEZILIAO", "struts");
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

        box.setFilePath(savePath+newfileName);
		super.save(box);
		return result;
	}
	
	
	/**
	 * 删除消息
	 * 先删除消息关联表再删除附件
	 * 最后删除消息
	 * @return
	 */
	public String deleteMessage(String ids){
		
		List<MessageBox> messList = super.findListByIds(ids, MessageBox.class);
		for(MessageBox me : messList){
			
			super.deleteByDHql("mid = '"+me.getId()+"'", null, TMessageBoxOrgan.class.getName());
			if(!"".equals(me.getFilePath()) && null != me.getFilePath() && !"null".equals(me.getFilePath())){
				File file = new File(me.getFilePath());
				if(file.exists()){
					file.delete();
				}
			}
			
		}
		
		
		return "SUCCESS";
	}
	
}
