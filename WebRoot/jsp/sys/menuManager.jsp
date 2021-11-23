<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
</head>
	<frameset cols="20%,*" border= "0 " frameborder= "1 " framespacing= "5 ">
	
	  <frame src="menuManagerTree.jsp" name="menuTree" frameborder= "no " bordercolor= "#CADAE8 ">
	  <frame src="" name="showMenuManager" id="showMenuManager" frameborder= "no " bordercolor= "#CADAE8 ">
	
	</frameset>
</html>
