package com.stone.sys.action;

/**
 * <pre>
 *  上传 的Action
 * @author 
 * </pre>
 */


import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;

import org.apache.struts2.ServletActionContext;

import com.stone.support.SupportAction;
import com.stone.support.utils.FileUtils;
import com.stone.support.utils.Resources;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class UploadAction extends SupportAction {

	private File file;
	private String fileFileName;
	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

    /** 
     * 缩放处理 
     *  暂时不用
     * @return 
     */  
    public void zoom(File imageFile,String savePath,String newfileName) throws Exception {  

        //若使用此缩放处理方法，则把以上代码移动到调用此方法的方法中。
        try {  
            // 缩略图存放路径  
            File todir = new File(savePath); 
            if (!imageFile.isFile()) 

                throw new Exception(imageFile + " is not image file error in CreateThumbnail!");  

            File sImg = new File(todir, newfileName);  
            BufferedImage Bi = ImageIO.read(imageFile);  
            // 假设图片宽 高 规定最大为700 900,
            Image Itemp = Bi.getScaledInstance(660, 900, Bi.SCALE_DEFAULT);  
            double Ratio = 0.0;
            if ((Bi.getHeight() > 900) || (Bi.getWidth() > 660)) {  
            	if(Bi.getHeight()>900 && Bi.getWidth()>660){
            		Ratio = 660.0/Bi.getWidth();
            	}else if(Bi.getHeight() > 900){
            		Ratio = 660.0/Bi.getHeight();
            	}else if(Bi.getWidth() > 660){
            		Ratio = 660.0/Bi.getWidth();
            	}
                AffineTransformOp op = new AffineTransformOp(AffineTransform.getScaleInstance(Ratio, Ratio), null);  
                Itemp = op.filter(Bi, null);  
            }  
            ImageIO.write((BufferedImage) Itemp, "jpg", sImg);  
        } catch (IOException e) {  
            e.printStackTrace();  
            throw new Exception(e);  
        }  
    }
    
   
   
    
    
    public void downloadFile() throws IOException{
    	String path = super.getParameter("path");
    	//path = URLDecoder.decode(path, "utf-8");
    	if (path.contains("SDJC4")) {
			path = path.replace("SDJC4", "D:\\SDJC\\");
		}
		if (path.contains("SDAZ4")) {
			path = path.replace("SDAZ4", "D:\\SDAZ\\");
		}
		if (path.contains("QYSE4")) {
			path = path.replace("QYSE4", "D:\\QYSE\\");
		}

		if (path.contains("SDJC5")) {
			path = path.replace("SDJC5", "E:\\SDJC\\");
		}
		if (path.contains("SDAZ5")) {
			path = path.replace("SDAZ5", "E:\\SDAZ\\");
		}
		if (path.contains("QYSE5")) {
			path = path.replace("QYSE5", "E:\\QYSE\\");
		}

		if (path.contains("SDJC4")) {
			path = path.replace("SDJC4", "D:/SDJC/");
		}
		if (path.contains("SDAZ4")) {
			path = path.replace("SDAZ4", "D:/SDAZ/");
		}
		if (path.contains("QYSE4")) {
			path = path.replace("QYSE4", "D:/QYSE/");
		}

		if (path.contains("SDJC5")) {
			path = path.replace("SDJC5", "E:/SDJC/");
		}
		if (path.contains("SDAZ5")) {
			path = path.replace("SDAZ5", "E:/SDAZ/");
		}
		if (path.contains("QYSE5")) {
			path = path.replace("QYSE5", "E:/QYSE/");
		}
    	String fileName = path.substring(path.lastIndexOf("/")+1,path.lastIndexOf("_"));
    	fileName += path.substring(path.lastIndexOf("."));
    	path = path.replace("/","\\");
    	File file = new File(path); 
    	if(file.exists()) { 
    		super.getResponse().setContentType("application/x-msdownload"); 
    		super.getResponse().addHeader("Content-Disposition", "attachment; filename=\"" 
    				+ new String( fileName.getBytes("gb2312"), "ISO8859-1" ) + "\""); 
    	InputStream inputStream = new FileInputStream(file); 
    	BufferedInputStream bis = new BufferedInputStream(inputStream); 

    	byte[] bytes = new byte[1024]; 

    	ServletOutputStream outStream = super.getResponse().getOutputStream(); 
    	BufferedOutputStream bos = new BufferedOutputStream(outStream); 
    	int readLength = 0; 
    	while((readLength = bis.read(bytes)) != -1) { 
    		bos.write(bytes, 0, readLength); 
    	} 
    	inputStream.close(); 
    	bis.close(); 
    	bos.flush(); 
    	outStream.close(); 
    	bos.close(); 
    	}
    }
    
    public void downloadFileByAllPath() throws IOException{
    	String path = super.getParameter("path");
    	path = URLDecoder.decode(path, "utf-8");
    	String fileName = path.substring(path.lastIndexOf("\\")+1,path.lastIndexOf("_"));
    	fileName += path.substring(path.lastIndexOf("."));
    	File file = new File(path); 
    	if(file.exists()) { 
    		super.getResponse().setContentType("application/x-msdownload"); 
    		super.getResponse().addHeader("Content-Disposition", "attachment; filename=\"" 
    				+ new String( fileName.getBytes("gb2312"), "ISO8859-1" ) + "\""); 
    	InputStream inputStream = new FileInputStream(file); 
    	BufferedInputStream bis = new BufferedInputStream(inputStream); 

    	byte[] bytes = new byte[1024]; 

    	ServletOutputStream outStream = super.getResponse().getOutputStream(); 
    	BufferedOutputStream bos = new BufferedOutputStream(outStream); 
    	int readLength = 0; 
    	while((readLength = bis.read(bytes)) != -1) { 
    		bos.write(bytes, 0, readLength); 
    	} 
    	inputStream.close(); 
    	bis.close(); 
    	bos.flush(); 
    	outStream.close(); 
    	bos.close(); 
    	}
    }
    
    public  void reduceImg(String imgsrc, String imgdist, int widthdist,   
            int heightdist) {   
        try {   
            File srcfile = new File(imgsrc);   
            if (!srcfile.exists()) {   
                return;   
            }   
            Image src = javax.imageio.ImageIO.read(srcfile);   
      
            BufferedImage tag= new BufferedImage((int) widthdist, (int) heightdist,   
                    BufferedImage.TYPE_INT_RGB);   
      
            tag.getGraphics().drawImage(src.getScaledInstance(widthdist, heightdist,  Image.SCALE_SMOOTH), 0, 0,  null);   
    ///         tag.getGraphics().drawImage(src.getScaledInstance(widthdist, heightdist,  Image.SCALE_AREA_AVERAGING), 0, 0,  null);   
               
            FileOutputStream out = new FileOutputStream(imgdist);   
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);   
            encoder.encode(tag);   
            out.close();   
      
        } catch (IOException ex) {   
            ex.printStackTrace();   
        }   
    }  
    
    
  //上传WPS
	@SuppressWarnings("deprecation")
	public void updFile() throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Random rd = new Random();
		String fileType = fileFileName.substring(fileFileName.lastIndexOf("."));
		if(FileUtils.fileType(fileType)){
			
		}else{
			String fName = fileFileName.substring(0,fileFileName.indexOf("."));
			String newfileName = fName+"_"+sdf.format(new Date())+(rd.nextInt(90000)+10000)+fileType;
		    //得到工程保存文件的路径
	        String savePath = Resources.getString("JIANCHAZHILINGSHU", "struts");
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
	 
	       String newPath = savePath+newfileName;
	       
	        super.getResponse().setContentType("text/html;utf-8");
	        super.getResponse().setCharacterEncoding("utf-8"); 
	        super.getResponse().getWriter().print(newPath);
		}
		
	}
}
