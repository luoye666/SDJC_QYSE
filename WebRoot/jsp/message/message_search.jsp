<%@page import="com.stone.para.IConstant"%>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="/c.tld" %>
<%
String path = request.getContextPath();
Calendar now = Calendar.getInstance(); 
%>

<html>
<head>

 <link href="<%=path %>/css/base/jquery-ui.css" rel="stylesheet" type="text/css">
 <link href="<%=path %>/js/plugin/skins/blue.css" rel="stylesheet" type="text/css">
<script src="<%=path %>/js/jquery.js"></script>

<script src="<%=path %>/js/jquery-ui-1.10.4.custom.min.js"></script>
 <style>
   .ui-dialog .ui-dialog-title{
   		
   		color: #000000;
   }
  </style>
  <script>
 	$(function(){
 		$('#dialog').dialog({
 			autoOpen: false,
 			width: 300 ,
 			height: 400,
 			min: true,
 			position: ['right','bottom']
 		});
 		
 		
 	
 		$( "#dialog" ).dialog('open');
 	
 		
 	})
 	
 	
  </script>
</head>
<body>
 <div id="dialog" title="发布消息">
  
  <form method="post" action="<%=path%>/messageBox!sendMessage.do">
  
    <label >标题</label>
    <input type="text" name="title" /><br/>
    <br/>
    <label style="text-align: top;">内容</label>
    <textarea type="text" name="content" id="email" style="height: 100px;"></textarea>
  	
  	<br/><br/><br/>
  	<input type="submit" value="发布" style="text-align: right ;"/>
  </form>
  
</div>
</body>
</html>