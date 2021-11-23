package com.stone.support.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

/**
 * �����ֻ�
 * 
 * @author Winter
 */
public class IllegalGlossary {

    private final static String file_glossary = "/illegal_glossary.dat";

    private static List<Object> glossary = null;

    public static void init() throws IOException {
        glossary = new ArrayList<Object>(1000);
        loadIllegalGlossary();
    }

    public static void destroy() {
        if (glossary != null)
            glossary.clear();
    }

    /**
     * �������дʻ��
     * 
     * @throws IOException
     */
    private static void loadIllegalGlossary() throws IOException {
        InputStream in = IllegalGlossary.class
                .getResourceAsStream(file_glossary);
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new InputStreamReader(in));
            do {
                String line = reader.readLine();
                if (line == null)
                    break;
                glossary.add(line.trim());
            } while (true);
        } finally {
            in.close();
        }
    }

    /**
     * �Զ������дʻ���XXX�滻
     * 
     * @param content
     * @return
     */
    public static String autoGlossaryFiltrate(String content) {
        if (StringUtils.isEmpty(content))
            return content;
        for (int i = 0; i < glossary.size(); i++) {
            String word = (String) glossary.get(i);
            content = StringUtils.replace(content, word, StringUtils.repeat(
                    "X", word.length()));
        }
        return content;
    }

    /**
     * �ж��Ƿ���ڷǷ�����
     * 
     * @param content
     * @return true ���� false ������
     */
    public static boolean existIllegalWord(String content) {
        if (StringUtils.isEmpty(content))
            return false;
        for (int i = 0; i < glossary.size(); i++) {
            String word = (String) glossary.get(i);
            if (content.indexOf(word) >= 0)
                return true;
        }
        return false;
    }

    /**
     * ɾ�������д��ڵĹؼ���
     * 
     * @param content
     * @return
     */
    public static String deleteIllegalWord(String content) {
        if (StringUtils.isEmpty(content))
            return content;
        for (int i = 0; i < glossary.size(); i++) {
            String word = (String) glossary.get(i);
            content = StringUtils.remove(content, word);
        }
        return content;
    }

}
