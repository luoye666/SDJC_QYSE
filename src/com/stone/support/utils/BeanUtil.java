package com.stone.support.utils;

import org.apache.log4j.Logger;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public class BeanUtil {

	 /**
     * Logger for this class
     */
    private static final Logger logger = Logger.getLogger(BeanUtil.class);
 
    /**
     * 说明：将source中的属性值赋给target中的属性，如果为null或空字符串，不再copy
     * 前提：相关属性是public，且定义了相关的getter，setter方法（内省）
     * 应用：spring的数据绑定配合dao持久化时，如果页面传递为空，再调用attachdirty方法会把数据库里的值全部置null
     *      而且spring的beanUtils类会把所有属性一股脑拷贝，不管是不是空或null，于是乎，这个伟大的方法就诞生了~O(∩_∩)O~
     * @author shown
     */
    public static void copyIgnoreNulls(Object source,Object target){
       BeanInfo beanInfo=null;
       try {
           beanInfo = Introspector.getBeanInfo(source.getClass());
       } catch (IntrospectionException e) {
           logger.debug("------------>bean加载失败！");
           return;
       }
       PropertyDescriptor [] propertieDescritors = beanInfo.getPropertyDescriptors();
       for(PropertyDescriptor propertyDescriptor : propertieDescritors){
           logger.debug("------------>当前操作属性："+propertyDescriptor.getName());
           Method readMethod = propertyDescriptor.getReadMethod();
           Method writeMethod = propertyDescriptor.getWriteMethod();
           if(writeMethod != null&&readMethod != null){
              if(!Modifier.isPublic(readMethod.getDeclaringClass().getModifiers()))
              readMethod.setAccessible(true);
              Object value=null;
              try {
                  value = readMethod.invoke(source, new Object[0]);
              } catch (Exception e) {
                  logger.debug("------------>getter方法读取失败");
                  continue;
              }
              if(!Modifier.isPublic(writeMethod.getDeclaringClass().getModifiers()))
              writeMethod.setAccessible(true);
              if (value!=null&&!"".equals(value.toString())) {
                  //关键在此处的判断，如果为空，不再copy
                  try {
                     writeMethod.invoke(target, new Object[] {value});
                     logger.debug("------------>属性拷贝："+value);
                  } catch (Exception e) {
                     logger.debug("------------>setter方法写入失败");
                     continue;
                  }
              }else {
                  logger.debug("------------>属性为空，不再拷贝");
              }
           }
       }
    }
	
}
