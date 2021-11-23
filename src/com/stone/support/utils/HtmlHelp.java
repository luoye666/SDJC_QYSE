package com.stone.support.utils;

import java.util.List;
import java.util.Map;

public class HtmlHelp {

    @SuppressWarnings("unchecked")
	public static String getSelectByMap(Map m, String name, String value) {
        if (m == null) {
            return "";
        }
        if (value == null) {
            value = "";
        }
        Object[] keys = (Object[]) m.keySet().toArray();
        StringBuffer sb = new StringBuffer();
        sb.append(" <select id='");
        sb.append(name);
        sb.append("' name='");
        sb.append(name);
        sb.append("' value='");
        sb.append(value);
        sb.append("'>\n ");
        for (int i = 0; i < keys.length; i++) {
            sb.append(" <option value='");
            sb.append(keys[i]);
            sb.append("'");
            if (keys[i].equals(value)) {
                sb.append(" selected ");
            }
            sb.append(" > ");
            sb.append(m.get(keys[i]));
            sb.append(" </option>\n ");
        }
        sb.append(" </select>\n ");
        return sb.toString();
    }

    /**
     * 根据list得到下拉框 list里面放key、value
     * 
     * @param l
     * @param name
     * @param value
     * @return
     */
    @SuppressWarnings("unchecked")
	public static String getSelectByList(List l, String name, String value,
            String firstDesc) {
        if (l == null || l.size() <= 0) {
            return "";
        }
        if (value == null) {
            value = "";
        }

        StringBuffer sb = new StringBuffer();
        sb.append(" <select id='");
        sb.append(name);
        sb.append("' name='");
        sb.append(name);
        sb.append("' value='");
        sb.append(value);
        sb.append("'>\n ");
        if (firstDesc != null && !firstDesc.equals("")) {
            sb.append(" <option value=''> ");
            sb.append(firstDesc);
            sb.append(" </option>\n ");
        }
        for (int i = 0; i < l.size(); i++) {
            Map keys = (Map) l.get(i);
            String lKey = ((Object) keys.get("key")).toString();
            String lValue = (String) keys.get("value");
            sb.append(" <option value='");
            sb.append(lKey);
            sb.append("'");
            if (lKey.equals(value)) {
                sb.append(" selected ");
            }
            sb.append(" > ");
            sb.append(lValue);
            sb.append(" </option>\n ");
        }
        sb.append(" </select>\n ");
        return sb.toString();
    }

    public static void O(Object obj) {
        System.out.println(obj);
    }
}