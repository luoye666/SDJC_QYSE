package com.stone.webservice.bjgl.action;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.util.Arrays;

import com.stone.biz.bjgl.pojo.TBjd;
import com.stone.webservice.bjgl.pojo.DownloadErrCodeEnum;
import com.stone.webservice.bjgl.pojo.DownloadFileRequestVO;
import com.stone.webservice.bjgl.pojo.DownloadFileResponseVO;
import com.stone.webservice.bjgl.service.BjdWebService;

public class BjdWebImpl implements BjdWeb,Serializable{

	private static final long serialVersionUID = 3143214456308013952L;
	
	// 单次传送最大字节数20M。
    private final static int maxsize_once;

    static{
        maxsize_once = 1024 * 1024 * 20;
    }
	
	BjdWebService bjdWebService;
	

	public void setBjdWebService(BjdWebService bjdWebService) {
		this.bjdWebService = bjdWebService;
	}


	@Override
	public String findBjdTj(String name, String pwd, String shidaima) {
		String s = bjdWebService.findBjd(name,pwd,shidaima);
		return s;
	}


	@Override
	public String findBjdSe(String name, String pwd, String shidaima,
			String zhucedaima) {
		String s = bjdWebService.findBjdSe(name,pwd,shidaima,zhucedaima);
		
		return s;
	}
	

	@Override
	public String updBjd(String name, String pwd, String bjd) {
		String s = bjdWebService.updBjd(name,pwd,bjd);
		
		return s;
	}


	@Override
	public DownloadFileResponseVO downloadFile(DownloadFileRequestVO req) {
		try {
            return readFileByte(req);
        } catch (IOException e) {
            e.printStackTrace();
            DownloadFileResponseVO vo = new DownloadFileResponseVO();
            vo.setErrCode(DownloadErrCodeEnum.READ_FILE_EXCEPTION);
            return vo;
        }
	}
	
	/**
     * 读取文件内容，构建文件字节流返回对象。
     * @param req 请求参数
     * @return 读取文件返回值。
     * @throws IOException IO异常
     */
    private DownloadFileResponseVO readFileByte(DownloadFileRequestVO req) throws IOException { 

        DownloadFileResponseVO vo = new DownloadFileResponseVO();

        // 获取判断文件最近修改时间
        File fileObject = new File(req.getFilePath());
        final long fileLastModifiedTime = fileObject.lastModified();

        // 判断分批传过程中文件是否修改
        if (fileLastModifiedTime != req.getFileLastModifiedTime()
                && req.getFileLastModifiedTime() != -1) 
        {   
            vo.setErrCode(DownloadErrCodeEnum.FILE_HAS_MODIFIED_WHILE_DOWNLOAD);
            return vo;
        }

        // 读取文件字节流。
        ByteArrayOutputStream fileStream = new ByteArrayOutputStream(1024);
        FileInputStream file = new FileInputStream(req.getFilePath());

        byte[] readbuff = new byte[1024];
        while(file.read(readbuff) != -1) {
            fileStream.write(readbuff);
        }
        file.close();

        // 构建返回文件字节信息。超过20M, 一次只返回20M。
        final byte[] fileBuff = fileStream.toByteArray();
        int end = 0;
        if (fileBuff.length - req.getStart() > maxsize_once) {
            end = req.getStart() + maxsize_once;
            vo.setEof(false);
        } else {    
            end = fileBuff.length;
            vo.setEof(true);
        }

        // 拷贝[start, end)范围内的字节到返回值中。
        vo.setFileByteBuff(Arrays.copyOfRange(fileBuff, req.getStart(), end));
        vo.setStart(end);
        vo.setErrCode(DownloadErrCodeEnum.DOWN_LOAD_SUCCESS);
        vo.setFileLastModifiedTime(fileLastModifiedTime);

        fileStream.close();

        return vo;
    }


	@Override
	public String downloadFileByte(String fileName) {
		
//		JSONObject josn = JSONObject.fromObject(fileName);
//		fileName = josn.get("name").toString();
		
		TBjd bjd = (TBjd) bjdWebService.findById(Long.parseLong(fileName), TBjd.class.getName());
		
		if(bjd == null){
			return null;
		}
		
        return bjd.getJiaofeipingzheng();  
		
		
	}


	@Override
	public String findBjdKggz(String name, String pwd, String shidaima,
			String seid) {
		String s = bjdWebService.findBjdKggz(name,pwd,seid);
		return s;
	}


}
