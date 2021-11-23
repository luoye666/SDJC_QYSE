package com.stone.support.utils;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.XPath;
import org.dom4j.io.SAXReader;

import frm.ssh.exception.AppException;

public class XmlUtil {

	public static void allElementOut(Element element, int level, List list) {

		HashMap map = new HashMap();
		List attributes = element.attributes();
		for (int i = 0; i < attributes.size(); i++) {
			Attribute a = ((Attribute) attributes.get(i));
			map.put(a.getName(), a.getValue());
		}
		// System.out.println("ele map:"+map.toString());
		list.add(map);
		Iterator iter = element.elementIterator();
		while (iter.hasNext()) {
			Element sub = (Element) iter.next();
			allElementOut(sub, level + 2, list);
		}

		return;
	}

	public static void singleElementOut(Element element, Map map) {

		List attributes = element.attributes();
		for (int i = 0; i < attributes.size(); i++) {
			Attribute a = ((Attribute) attributes.get(i));
			map.put(a.getName(), a.getValue());
		}
		// System.out.println("ele map:"+map.toString());
		return;
	}

	public static String singleElementParmByKey(Element element, String key) {
		String value = "";
		List attributes = element.attributes();
		for (int i = 0; i < attributes.size(); i++) {
			Attribute a = ((Attribute) attributes.get(i));
			if (a.getName().equals(key)) {
				value = a.getValue();
				break;
			}
		}
		return value;
	}
	
	/**
	 * 创建创建SAX阅读器生成Document对象
	 * @param file
	 * @return
	 * @throws AppException
	 * @throws Exception
	 */
	public static Document createXml(File file) throws AppException,Exception {
		
		// 创建SAX阅读器
		SAXReader reader= new SAXReader();
		
		// 读取内容生成Document对象
		Document doc = reader.read(file);
		
		return doc;
	}
	
	/**
	 * 获得指定xpath的node列表
	 * @param doc
	 * @param xpath
	 * @return
	 */
	public static List<Element> getNodeList(Document doc, String xpath) {
		
		Map<String,String> map = new HashMap<String,String>();	
	    map.put("base", "http://jbpm.org/4.3/jpdl");  
	    
		XPath x = doc.createXPath(xpath);
		x.setNamespaceURIs(map);
		List<Element> nodeList = x.selectNodes(doc);
		
		return nodeList;
	}
	
	
}
