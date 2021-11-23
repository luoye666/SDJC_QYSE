package com.stone.utils.seq;

import frm.ssh.util.SpringUtil;

/**
 * ���м���
 * 
 * <pre>
 * ���ڣ�2010-2-23
 * </pre>
 */
public class SeqUtil {
    public static String[] NumStr = new String[] { "", "0", "00", "000",
            "0000", "00000", "000000", "0000000", "00000000", "000000000" };

    public SeqUtil() {
    }

    /**
     * ��ȡָ�����е���һ������ֵ
     * 
     * @param seqName
     * @return
     */
    public static Long getNextKey(String seqName) {
        SeqDAO seqDAO = (SeqDAO) SpringUtil.getInstance().getBean("seqDAO");
        return seqDAO.getNextKey(seqName);
    }

    /**
     * �õ�ָ�����ȡ�ǰ׺�ı�� WuM
     * 
     * @param pix
     *            ǰ׺
     * @param seq
     *            ���
     * @param length
     *            ���ֳ���
     * @return
     */
    public static String getCode(String pix, int seq, int length) {
        if ((seq + "").length() >= length) {
            return pix + seq;
        } else {
            return pix + NumStr[length - (seq + "").length()] + seq;
        }
    }
}
