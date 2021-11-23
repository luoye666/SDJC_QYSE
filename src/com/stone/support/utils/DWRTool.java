package com.stone.support.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * <pre>
 * ���ߣ�JZ
 * ���ڣ�2010-2-24
 * </pre>
 */
public class DWRTool{

    /**
     * 0����Ȩ�ޣ�1����Ȩ�ޣ�2�����ӳ�ʱ
     */
    public static String[] DWR_CHECK_INFO = new String[] { "PASS", "û��Ȩ��",
            "���ӳ�ʱ��δ��¼", "ϵͳ����", "����" };
	
	public DWRTool(){
	}

    /**
     * 
     * @param req
     * @return
     */
    public static int checkRole(HttpServletRequest req) {
        if(req.getSession().getAttribute("usrinfo")==null){
            return 2;
        }
        //User user = (User) req.getSession().getAttribute("userInfo");
//        if (user == null || user.getId().equals("")) {
//            return 2;
//        }
        return 0;
    }
	
}
