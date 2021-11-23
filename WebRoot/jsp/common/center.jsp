<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>
    
    <link rel="stylesheet" href="<%=path%>/css/base/jquery-ui.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=path%>/css/ui.jqgrid.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=path%>/css/jquery.ui.selectmenu.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=path%>/css/validationEngine.jquery.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=path%>/css/zTreeStyle/zTreeStyle.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=path%>/css/jquery.layout-default.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=path%>/css/jquery-ui.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=path%>/css/base.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=path%>/css/portal.css" type="text/css"></link>
	
	<script type="text/javascript" src="<%=path%>/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.jqGrid.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/grid.locale-cn.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.form.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.ui.selectmenu.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.validationEngine-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.validationEngine.js"></script>
  	<script type="text/javascript" src="<%=path%>/js/jquery.ztree.core-3.5.min.js"></script>
  	<script type="text/javascript" src="<%=path%>/js/jquery.layout.min.js"></script>
  	<script type="text/javascript" src="<%=path%>/js/jquery.portal.js"></script>
  </head>

	<div>  
       <iframe src="<%=path%>/jsp/portal/portal.jsp" width="100%" height="100%" border=0></iframe>
    </div>  

</html>
<script type="text/javascript">
</script>