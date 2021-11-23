<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	.long98{
		width: 98%
	}
	th{
		text-align: right;
		width: 13%;
	}
</style>
</head>
<body style="background-color: white;">
</body>
</html>
<script type="text/javascript">
  	$.dialog({
		title:'个人信息',
		width: '550px',
		height: '350px',
		max:false,
		min:false,
		close:function(){
  			return false;
		},
		cache:false,
		content: 'url:<%=path%>/user!openUserInfo.do?id=${SESSION_TUSER.id}&adr=index&type=sh'
	}).max()
</script>