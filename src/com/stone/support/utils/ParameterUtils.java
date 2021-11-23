package com.stone.support.utils;

public class ParameterUtils {
	/**
	 * IDS中间间隔符
	 */
	public static final String IDS_SEPARATOR = ",";
	
	/**
	 * 将IDS字符串转为long数组
	 * @param ids
	 * @return
	 */
	public static long[] convertIDSToLongArray(String ids){
		if(ids == null) return null;
		String[] idsStringArray = ids.split(IDS_SEPARATOR);
		
		long[] idsLongArray = new long[idsStringArray.length];
		for(int i = 0 ; i < idsStringArray.length ; i++){
			String idString = idsStringArray[i];
			if(idString != null){
				idString = idString.trim();
				if(!"".equals(idString)){
					idsLongArray[i] = Long.parseLong(idString);
				}
			}else{
				idsLongArray = new long[idsStringArray.length-1];
				continue;
			}
		}
		
		return idsLongArray;
	}
}
