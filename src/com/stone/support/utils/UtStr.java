package com.stone.support.utils;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * 字符串处理
 * <pre>
 * 日期：Jul 13, 2009
 * </pre>
 */
public class UtStr{

	/**
	 * 将byte数组转换为表示16进制值的字符串，如：byte[]{8,18}转换为：0813
	 * 和hexStr2ByteArr方法互为可逆的转换过程
	 *
	 * @param arrB 需要转换的byte数组
	 * @return 转换后的字符串
	 * @throws Exception 本方法不处理任何异常，所有异常全部抛出
	 */
	public static String byteArr2HexStr(byte[] arrB) throws Exception{
		int iLen=arrB.length;
		//每个byte用两个字符才能表示，所以字符串的长度是数组长度的两倍
		StringBuffer sb=new StringBuffer(iLen*2);
		for(int i=0;i<iLen;i++){
			int intTmp=arrB[i];
			//把负数转换为正数
			while(intTmp<0){
				intTmp=intTmp+256;
			}
			//小于0F的数需要在前面补0
			if(intTmp<16){
				sb.append("0");
			}
			sb.append(Integer.toString(intTmp,16));
		}
		return sb.toString();
	}

	/**
	 * 将表示16进制值的字符串转换为byte数组
	 * 和byteArr2HexStr方法互为可逆的转换过程
	 *
	 * @param strIn 需要转换的字符串
	 * @return 转换后的byte数组
	 * @throws Exception 本方法不处理任何异常，所有异常全部抛出
	 */
	public static byte[] hexStr2ByteArr(String strIn) throws Exception{
		byte[] arrB=strIn.getBytes();
		int iLen=arrB.length;
		//两个字符表示一个字节，所以字节数组长度是字符串长度除以2
		byte[] arrOut=new byte[iLen/2];
		for(int i=0;i<iLen;i=i+2){
			String strTmp=new String(arrB,i,2);
			arrOut[i/2]=(byte)Integer.parseInt(strTmp,16);
		}
		return arrOut;
	}

	/**
	 * MD5加密
	 * @param origin
	 * @return
	 */
	public static String MD5Encode(String origin){
		String resStr=null;
		try{
			resStr=origin;
			MessageDigest md=MessageDigest.getInstance("MD5");
			resStr=byteArr2HexStr(md.digest(resStr.getBytes()));
		}catch(Exception e){
			e.printStackTrace();
		}
		return resStr;
	}

	/**  
	 * 替换字符串  
	 * @param source String 母字符串
	 * @param from String 原始字符串
	 * @param to String 目标字符串
	 * @return String 替换后的字符串
	 */
	public static String replace(String source,String from,String to){
		if(source==null||from==null||to==null){
			return null;
		}
		StringBuffer sb=new StringBuffer("");
		int index=-1;
		while(true){
			index=source.indexOf(from);
			if(index==-1){
				break;
			}
			sb.append(source.substring(0,index)).append(to);
			source=source.substring(index+from.length());
		}
		sb.append(source);
		return sb.toString();
	}

	/**
	 * 去掉给定字符串中的相关符号
	 * @param str
	 * @return
	 */
	public static String replaceBlank(String str){
		//String str="I am a, I am Hello  ok, \n new line ffdsa!";
		Pattern p=Pattern.compile("\\t|\r|\n");
		Matcher m=p.matcher(str);
		String after=m.replaceAll("");
		return after;
	}

	/**
	 * 截取某个字符串的前byteCount个字节的长度（考虑汉字不能拆开）
	 * @param str
	 * @param subBytes
	 * @return
	 */
	public static String subStr(String str,int subBytes){
		int bytes=0; // 用来存储字符串的总字节数
		for(int i=0;i<str.length();i++){
			if(bytes==subBytes){
				return str.substring(0,i);
			}
			char c=str.charAt(i);
			if(c<256){
				bytes+=1; // 英文字符的字节数看作1
			}else{
				bytes+=2; // 中文字符的字节数看作2
				if(bytes-subBytes==1){
					return str.substring(0,i);
				}
			}
		}
		return str;
		//另一實現方案
		/*int bytes=0; //存储字符串的总字节数
		if(str.getBytes().length<=subBytes)
			return str;
		for(int i=0;i<str.length();i++){
			String s=str.charAt(i)+"";
			int bytenumber=s.getBytes().length;
			if(bytenumber==2)
				bytes+=2;
			else bytes+=1;
			if(bytes>=subBytes)
				return str.substring(0,i);

		}
		return str;*/
	}

	/**
	 * 把s中的所有s1替换为s2
	 * @param s
	 * @param s1
	 * @param s2
	 * @return
	 */
	public static String replaceAll(String s,String s1,String s2){
		return s.replaceAll(s1,s2);
	}

	/**
	 * 规范数据库字段值
	 * 将单引号转换为两个单引号
	 * @param s
	 * @return
	 */
	public static String dbVal(String s){
		return replaceAll(s,"'","''");
	}

	/**
	 * base64编码
	 * @param s
	 * @return
	 */
	public static String base64Encode(String s){
		if(s==null){
			return null;
		}
		return new BASE64Encoder().encode(s.getBytes());
	}

	/**
	 * base64解码
	 * @param s
	 * @return
	 */
	public static String base64Decode(String s){
		if(s==null){
			return null;
		}
		try{
			return new String(new BASE64Decoder().decodeBuffer(s));
		}catch(Exception e){
			return null;
		}
	}

	/**
	 * 切割字符串
	 * @param s
	 * @param d
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String[] split(String s,String d){
		ArrayList arr=new ArrayList();
		int posb=0;
		int pose=-1;
		int dlen=d.length();
		while(true){
			pose=s.indexOf(d,posb);
			if(pose==-1){
				arr.add(s.substring(posb,s.length()));
				break;
			}else{
				arr.add(s.substring(posb,pose));
				posb=pose+dlen;
			}
		}
		String[] res=new String[arr.size()];
		for(int i=0;i<arr.size();i++){
			res[i]=(String)arr.get(i);
		}
		return res;
	}

	/**
	 * 生成指定位数的随机字符串
	 * @return
	 */
	public static String getRandomStr(int len){
		StringBuffer res=new StringBuffer("");
		String[] symbols=new String[]{"A","a","B","b","C","0","c","D","d","E","e","1","F","f","G","g","H","2","h","I","i","J","j","3","K","k","L","l","M","4","m","N","n","O","o","5","P","p","Q","q",
				"R","6","r","S","s","T","t","7","U","u","V","v","W","8","w","X","x","Y","y","9","Z","z"};
		Random random=new Random();
		for(int i=0;i<len;i++){
			res.append(symbols[Math.abs(random.nextInt())%62]);
		}
		return res.toString();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args){
		System.out.println(getRandomStr(8));
	}

}
