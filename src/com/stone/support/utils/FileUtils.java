package com.stone.support.utils;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class FileUtils {
	public FileUtils() {
	}

	public static String getSuffix(String filename) {
		return getSuffix(filename, false);
	}

	public static String getSuffix(String filename, boolean withPeriod) {
		int i = filename.lastIndexOf(".");
		if (i == -1) {
			return "";
		} else {
			if (withPeriod) {
				return filename.substring(i);
			} else {
				return filename.substring(i + 1);
			}
		}
	}

	public static void copy(String srcFile, String destFile) throws Exception {
		java.io.File fs = new java.io.File(srcFile);
		java.io.File ds = new java.io.File(destFile);
		copy(fs, ds);
	}

	public static void copy(java.io.File srcFile, java.io.File destFile)
			throws Exception {
		long k = srcFile.length();
		if (k > 100000) {
			k = 100000;
		} else {
			k = 10000;
		}
		byte[] b = new byte[(int) k];

		int u;
		java.io.FileInputStream fi = new java.io.FileInputStream(srcFile);
		java.io.FileOutputStream fo = new java.io.FileOutputStream(destFile);
		for (;;) {
			u = fi.read(b);
			fo.write(b, 0, u);
			if (u < k) {
				break;
			}
		}
		fi.close();
		fo.close();
	}

	public static void copy(String srcFile, java.io.File destFile)
			throws Exception {
		java.io.File fs = new java.io.File(srcFile);
		copy(fs, destFile);
	}

	public static String getPath(String[] paths) {
		String s = "";
		for (int i = 0; i < paths.length; i++) {
			s += java.io.File.separator + paths[i];
		}
		return s;
	}

	@SuppressWarnings("unchecked")
	public static void delFile(java.util.Vector vt) {
		if (vt != null) {
			java.io.File f;
			for (int i = 0; i < vt.size(); i++) {
				f = new java.io.File(vt.get(i).toString());
				f.delete();
			}
		}
	}

	public static void createFolder(String path) {
		File folder = new File(path);
		if (!folder.exists()) {
			folder.mkdir();
		}
		if (!folder.exists()) {
			folder.mkdirs();
		}

	}

	/**
	 * 取得文件名后缀类型
	 */
	public static String getExtentionExceptPoint(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos + 1);
	}

	/**
	 * 取得文件名后缀
	 */
	public static String getFileName(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(0, pos);
	}

	/**
	 * 取得文件名后缀
	 */
	public static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}

	/**
	 * 获取File类型的Byte数组
	 * @param file
	 * @return
	 */
	public static byte[] getFileBytes(File file) {
		byte[] buffer = null;
		try {
			FileInputStream fis = new FileInputStream(file);
			ByteArrayOutputStream bos = new ByteArrayOutputStream(1000);
			byte[] b = new byte[1000];
			int n;
			while ((n = fis.read(b)) != -1) {
				bos.write(b, 0, n);
			}
			fis.close();
			bos.close();
			buffer = bos.toByteArray();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return buffer;
	}

	/**
	 * 获取文件名称[不含后缀名]
	 * 
	 * @param
	 * @return String
	 */
	public static String getFilePrefix(String fileName) {
		int splitIndex = fileName.lastIndexOf(".");
		return fileName.substring(0, splitIndex).replaceAll("\\s*", "");
	}
	
	/**
     * 文件后缀不能是 jsp exe 等格式
     * @return
     */
    public static boolean fileType(String fileType){
    	boolean flag = false;
    	String type = ".xml,.jsp,.class,.java,.vue,.exe,.jspx,.html,.htmlx,.XML,.JSP,.CLASS,.JAVA,.VUE,.EXE,.JSPX,.HTML,.HTMLX";  //jspx，html，html
    	if(type.contains(fileType)){
			flag = true;
		}
    	
    	return flag;
    }
	
}
