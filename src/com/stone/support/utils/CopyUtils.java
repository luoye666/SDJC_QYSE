package com.stone.support.utils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;

public class CopyUtils{
	public static void Copy(Object source, Object dest)throws Exception {
		//获取属性
		BeanInfo sourceBean = Introspector.getBeanInfo(source.getClass(), java.lang.Object.class);
		PropertyDescriptor[] sourceProperty = sourceBean.getPropertyDescriptors();
		
		BeanInfo destBean = Introspector.getBeanInfo(dest.getClass(), java.lang.Object.class);
		PropertyDescriptor[] destProperty = destBean.getPropertyDescriptors();
		
		try{
			for(int i=0;i<sourceProperty.length;i++){
				
				for(int j=0;j<destProperty.length;j++){
					
					if("id".equals(sourceProperty[i].getName())){
						
					}else{
						if(sourceProperty[i].getName().equals(destProperty[j].getName())){
							//调用source的getter方法和dest的setter方法
							destProperty[j].getWriteMethod().invoke(dest, sourceProperty[i].getReadMethod().invoke(source));
							break;					
						}
					}
					
				}
			}
		}catch(Exception e){
			throw new Exception("属性复制失败:"+e.getMessage());
		}
	}
	
	
	/**
	 * 复制  属性 过滤null值得属性  
	 * 适合先查询在修改的更新方法，避免有些参数在页面中不存在，因为复制导致参数丢失。
	 * @param source 源文件
	 * @param dest 目标文件
	 * @throws Exception
	 */
	public static void CopyNotNullParam(Object source, Object dest)throws Exception {
		//获取属性
		BeanInfo sourceBean = Introspector.getBeanInfo(source.getClass(), java.lang.Object.class);
		PropertyDescriptor[] sourceProperty = sourceBean.getPropertyDescriptors();
		
		BeanInfo destBean = Introspector.getBeanInfo(dest.getClass(), java.lang.Object.class);
		PropertyDescriptor[] destProperty = destBean.getPropertyDescriptors();
		
		try{
			for(int i=0;i<sourceProperty.length;i++){
				
				for(int j=0;j<destProperty.length;j++){
					
					if(sourceProperty[i].getName().equals(destProperty[j].getName())){
						if(sourceProperty[i].getReadMethod().invoke(source) != null && !"".equals(sourceProperty[i].getReadMethod().invoke(source))){
							//调用source的getter方法和dest的setter方法
							destProperty[j].getWriteMethod().invoke(dest, sourceProperty[i].getReadMethod().invoke(source));
							break;					
						}
					}
				}
			}
		}catch(Exception e){
			throw new Exception("属性复制失败:"+e.getMessage());
		}
	}
}