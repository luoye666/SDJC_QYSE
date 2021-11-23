package com.stone.support.utils;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Scanner;

public class AddrTool {
	
	public String getAddr(String telno) throws MalformedURLException, IOException{
		String content="";
		HttpURLConnection conn=(HttpURLConnection) new URL("http://api.showji.com/locating/?m="+telno+"&output=xml").openConnection();
		
		if(conn.getResponseCode()==200){
			Scanner in=new Scanner(conn.getInputStream());
			while(in.hasNextLine()){
				String line=in.nextLine();
				content+=(new String(line.getBytes(),"utf-8"));
			}
			in.close();
		}
		conn.disconnect();
		return content;
	}
}
