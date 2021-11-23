package com.stone.support.utils;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.io.Writer;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


/**
 *
 * @author lz
 * @since 2007-09-19
 */
public class JsonUtils {
    /** * logger. */
    private static Log logger = LogFactory.getLog(JsonUtils.class);


    protected JsonUtils() {
    }

    /**
     * write.
     *
     */
    public static void write(Object bean, Writer writer,
        String[] excludes, String datePattern) throws Exception {
        String pattern = null;

        if (datePattern != null) {
            pattern = datePattern;
        } else {
            pattern = "yyyy-MM-dd";
        }

        JsonConfig jsonConfig = configJson(excludes, pattern);
try{
        JSON json = JSONSerializer.toJSON(bean, jsonConfig);

        json.write(writer);
} catch (Exception e) {
	System.out.println(e);
}

    }

    /**
     */
    public static void write(Object bean, Writer writer, String excludes,
        String datePattern) throws Exception {
        if (excludes == null) {
            JsonUtils.write(bean, writer,
                new String[] {"hibernateLazyInitializer"}, datePattern);
        } else {
            JsonUtils.write(bean, writer, excludes.split(","), datePattern);
        }
    }

    /**
     */
    public static void write(Object bean, Writer writer)
        throws Exception {
        JsonUtils.write(bean, writer,
            new String[] {"hibernateLazyInitializer"}, "yyyy-MM-dd");
    }

    /**
     */
    public static JsonConfig configJson(String[] excludes,
        String datePattern) {
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(excludes);
        jsonConfig.setIgnoreDefaultExcludes(false);
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        jsonConfig.registerJsonValueProcessor(Date.class,
            new DateJsonValueProcessor(datePattern));
        jsonConfig.registerJsonValueProcessor(java.sql.Date.class,
            new DateJsonValueProcessor(datePattern));
        jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
            new DateJsonValueProcessor(datePattern));

        return jsonConfig;
    }

    /**
     */
    public static <T extends Object> T json2Bean(String data,
        Class<T> clazz, String[] excludes, String datePattern)
        throws Exception {
        // JsonUtils.configJson(excludes, datePattern);
        T entity = clazz.newInstance();

        return json2Bean(data, entity, excludes, datePattern);
    }

    /**
     */
    public static <T extends Object> T json2Bean(String data,
        Class<T> clazz) throws Exception {
        return json2Bean(data, clazz, null, null);
    }

    /**
     */
    public static <T extends Object> T json2Bean(String data, T entity,
        String[] excludes, String datePattern) throws Exception {
        // JsonUtils.configJson(excludes, datePattern);
        JSONObject jsonObject = JSONObject.fromObject(data);

        return json2Bean(jsonObject, entity, excludes, datePattern);
    }

    /**
     */
    public static <T extends Object> T json2Bean(String data, T entity)
        throws Exception {
        return json2Bean(data, entity, null, null);
    }

    /**
     */
    public static <T extends Object> T json2Bean(JSONObject jsonObject,
        Class<T> clazz, String[] excludes, String datePattern)
        throws Exception {
        // JsonUtils.configJson(excludes, datePattern);
        T entity = clazz.newInstance();

        return json2Bean(jsonObject, entity, excludes, datePattern);
    }

    /**
     */
    public static <T extends Object> T json2Bean(JSONObject jsonObject,
        Class<T> clazz) throws Exception {
        return json2Bean(jsonObject, clazz, null, null);
    }

    /**
     */
    @SuppressWarnings("unchecked")
	public static <T extends Object> T json2Bean(JSONObject jsonObject,
        T entity, String[] excludes, String datePattern)
        throws Exception {
        // JsonUtils.configJson(excludes, datePattern);
        Set<String> excludeSet = createExcludeSet(excludes);

        for (Object object : jsonObject.entrySet()) {
            Map.Entry entry = (Map.Entry) object;
            String propertyName = entry.getKey().toString();

            if (excludeSet.contains(propertyName)) {
                continue;
            }

            String propertyValue = entry.getValue().toString();

            try {
                PropertyDescriptor propertyDescriptor = new PropertyDescriptor(propertyName,
                        entity.getClass());
                Class propertyType = propertyDescriptor.getPropertyType();

                Method writeMethod = propertyDescriptor.getWriteMethod();
                invokeWriteMethod(entity, writeMethod, propertyType,
                    propertyValue, datePattern);
            } catch (IntrospectionException ex) {
                logger.warn(ex);

                continue;
            } catch (NumberFormatException ex) {
                logger.warn(ex);

                continue;
            } catch (ParseException ex) {
                logger.warn(ex);

                continue;
            }
        }

        return entity;
    }

    /**
     * @param excludes String[]
     * @return exclude set
     */
    public static Set<String> createExcludeSet(String[] excludes) {
        Set<String> excludeSet = new HashSet<String>();

        if (excludes != null) {
            for (String exclude : excludes) {
                excludeSet.add(exclude);
            }
        } else {
            excludeSet.add("hibernateLazyInitializer");
        }

        return excludeSet;
    }

    /**
     */
    @SuppressWarnings("unchecked")
	public static void invokeWriteMethod(Object entity,
        Method writeMethod, Class propertyType, String propertyValue,
        String datePattern) throws Exception {
        if (isPrimivite(propertyType)) {
            invokePrimivite(entity, writeMethod, propertyType,
                propertyValue);
        } else if (propertyType == String.class) {
            writeMethod.invoke(entity, propertyValue);
        } else if (propertyType == Date.class) {
            SimpleDateFormat dateFormat = getDateFormat(datePattern);

            writeMethod.invoke(entity, dateFormat.parse(propertyValue));
        }
    }

    /**
     */
    @SuppressWarnings("unchecked")
	public static void invokePrimivite(Object entity, Method writeMethod,
        Class propertyType, String propertyValue) throws Exception {
        if (isByte(propertyType)) {
            writeMethod.invoke(entity, Byte.parseByte(propertyValue));
        } else if (isShort(propertyType)) {
            writeMethod.invoke(entity, Short.parseShort(propertyValue));
        } else if (isInt(propertyType)) {
            writeMethod.invoke(entity, Integer.parseInt(propertyValue));
        } else if (isLong(propertyType)) {
            writeMethod.invoke(entity, Long.parseLong(propertyValue));
        } else if (isFloat(propertyType)) {
            writeMethod.invoke(entity, Float.parseFloat(propertyValue));
        } else if (isDouble(propertyType)) {
            writeMethod.invoke(entity, Double.parseDouble(propertyValue));
        } else if (isBoolean(propertyType)) {
            writeMethod.invoke(entity, Boolean.parseBoolean(propertyValue));
        } else if (isChar(propertyType)) {
            writeMethod.invoke(entity, propertyValue.charAt(0));
        }
    }

    /**
     * @return boolean
     */
    @SuppressWarnings("unchecked")
	public static boolean isPrimivite(Class clazz) {
        if (isByte(clazz)) {
            return true;
        } else if (isShort(clazz)) {
            return true;
        } else if (isInt(clazz)) {
            return true;
        } else if (isLong(clazz)) {
            return true;
        } else if (isFloat(clazz)) {
            return true;
        } else if (isDouble(clazz)) {
            return true;
        } else if (isBoolean(clazz)) {
            return true;
        } else if (isChar(clazz)) {
            return true;
        }

        return false;
    }

    /**
     * @return boolean
     */
    public static boolean isByte(Class clazz) {
        return (clazz == Byte.class) || (clazz == byte.class);
    }

    /**
     * @return boolean
     */
    public static boolean isShort(Class clazz) {
        return (clazz == Short.class) || (clazz == short.class);
    }

    /**
     * @return boolean
     */
    public static boolean isInt(Class clazz) {
        return (clazz == Integer.class) || (clazz == int.class);
    }

    /**
     * @return boolean
     */
    public static boolean isLong(Class clazz) {
        return (clazz == Long.class) || (clazz == long.class);
    }

    /**
     * @return boolean
     */
    public static boolean isFloat(Class clazz) {
        return (clazz == Float.class) || (clazz == float.class);
    }

    /**
     * @return boolean
     */
    public static boolean isDouble(Class clazz) {
        return (clazz == Double.class) || (clazz == double.class);
    }

    /**
     * @return boolean
     */
    public static boolean isBoolean(Class clazz) {
        return (clazz == Boolean.class) || (clazz == boolean.class);
    }

    /**
     * @return boolean
     */
    public static boolean isChar(Class clazz) {
        return (clazz == Character.class) || (clazz == char.class);
    }

    /**
     *
     * @param datePattern String
     * @return SimpleDateFormat
     */
    public static SimpleDateFormat getDateFormat(String datePattern) {
        if (datePattern == null) {
            return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        } else {
            return new SimpleDateFormat(datePattern);
        }
    }

    /**
     */
    public static <T extends Object> T json2Bean(JSONObject jsonObject,
        T entity) throws Exception {
        return json2Bean(jsonObject, entity, null, null);
    }

    /**
     * @return List
     * @throws Exception java.lang.InstantiationException,
     *                   java.beans.IntrospectionException,
     *                   java.lang.IllegalAccessException
     */
    public static <T extends Object> List<T> json2List(String data,
        Class<T> clazz, String[] excludes, String datePattern)
        throws Exception {
        JSONArray jsonArray = JSONArray.fromObject(data);

        return json2List(jsonArray, clazz, excludes, datePattern);
    }

    /**
     */
    public static <T extends Object> List<T> json2List(String data,
        Class<T> clazz) throws Exception {
        return json2List(data, clazz, null, null);
    }

    /**
     * @return List
     * @throws Exception java.lang.InstantiationException,
     *                   java.beans.IntrospectionException,
     *                   java.lang.IllegalAccessException
     */
    public static <T extends Object> List<T> json2List(
        JSONArray jsonArray, Class<T> clazz, String[] excludes,
        String datePattern) throws Exception {
        List<T> list = new ArrayList<T>();

        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            T node = json2Bean(jsonObject, clazz, excludes, datePattern);
            list.add(node);
        }

        return list;
    }

    /**
     * json转成list列表.
     *
     * @param jsonArray JSONArray
     * @param clazz 类型
     * @param <T> 泛型
     * @return 列表
     * @throws Exception 可能抛出任何异常
     */
    public static <T extends Object> List<T> json2List(
        JSONArray jsonArray, Class<T> clazz) throws Exception {
        return json2List(jsonArray, clazz, null, null);
    }
}
