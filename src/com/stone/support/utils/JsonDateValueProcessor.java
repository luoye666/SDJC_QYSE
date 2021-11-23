package com.stone.support.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class JsonDateValueProcessor implements JsonValueProcessor{

	public Object processArrayValue(Object obj, JsonConfig jsonconfig) {
		// TODO Auto-generated method stub
		return process(obj);
	}

	public Object processObjectValue(String s, Object obj, JsonConfig jsonconfig) {
		// TODO Auto-generated method stub
		return process(obj);
	}
	
	private Object process(Object obj) {
        if (obj == null) {// 如果时间为null，则返回空字串
            return "";
        }
        if (obj instanceof Date) {
            obj = new java.util.Date(((Date) obj).getTime());
        }
        if (obj instanceof java.util.Date) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd",
                    Locale.CHINA);// 格式化时间为yyyy-MM-dd类型
            return sdf.format(obj);
        } else {
            return new Object();
        }
    }

}
