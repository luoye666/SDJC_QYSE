package com.stone.support;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import ognl.DefaultTypeConverter;

public class SupportDataTypeConverter extends DefaultTypeConverter  {

	private static final DateFormat[] ACCEPT_DATE_FORMATS = {
        new SimpleDateFormat("dd/MM/yyyy"),
        new SimpleDateFormat("yyyy-MM-dd"),
        new SimpleDateFormat("yyyy/MM/dd") }; 
	
	@SuppressWarnings("unchecked")
	@Override
    public Object convertValue(Map context, Object value, Class toType) {
        if (toType == Date.class) { 
//            Date date = null;
            String dateString = null;
            String[] params = (String[]) value;
            dateString = params[0];
            for (DateFormat format : ACCEPT_DATE_FORMATS) {
                try {
                    return format.parse(dateString);
                } catch (Exception e) {
                    continue;
                }
            }
            return null;
        } else if (toType == String.class) { 
            Date date = (Date)value;
            return new SimpleDateFormat("yyyy-MM-dd").format(date);
        }
        return null;
    }

}
