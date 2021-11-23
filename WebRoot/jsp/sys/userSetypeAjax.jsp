<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:iterator value="dicList" status="item">
     <%
     	System.out.println("跳过来了。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。");
     %>
	<input type="checkbox"  class="myselfDesk" name="user.myselfDesk" value='<s:property value="value" />' /><s:property value="name" />
</s:iterator>