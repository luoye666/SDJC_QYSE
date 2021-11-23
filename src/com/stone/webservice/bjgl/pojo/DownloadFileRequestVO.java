package com.stone.webservice.bjgl.pojo;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="reqVo")
public class DownloadFileRequestVO implements Serializable{
	
	private static final long serialVersionUID = -6691657264549214018L;
	
	// 文件路径
    private String filePath;

    // 读文件数据起始位置
    private int start;

    // 第一次读取文件时间(用于在分批传送文件过程中判断文件是否被修改了)
    private long fileLastModifiedTime;

    DownloadFileRequestVO() 
    {
        setFilePath("");
        setStart(0);
        setFileLastModifiedTime(-1);
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public long getFileLastModifiedTime() {
        return fileLastModifiedTime;
    }

    public void setFileLastModifiedTime(long fileLastModifiedTime) {
        this.fileLastModifiedTime = fileLastModifiedTime;
    }

    @Override
    public String toString() {
        return "filePath: " + filePath + "\n"
                + "start: " + String.valueOf(start);
    }

}
