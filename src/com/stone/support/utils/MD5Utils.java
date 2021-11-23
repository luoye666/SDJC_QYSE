package com.stone.support.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {
	
	/**
	 * MD5 加密
	 * @param sourceStr
	 * @return
	 */
	public static String MD5(String sourceStr){
		String result = "";
		try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            try {
				md.update(sourceStr.getBytes("utf-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            byte b[] = md.digest();
            int i;
            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
            result = buf.toString().toUpperCase();
        } catch (NoSuchAlgorithmException e) {
            System.out.println(e);
        }
		
		return result;
		
	}

}
