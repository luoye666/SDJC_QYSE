<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.para.IConstant"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ taglib prefix="c" uri="/c.tld" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
 
<link href="<%=path %>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/blue/ui.css" rel="stylesheet" type="text/css" id="uiFile">
<link href="<%=path %>/css/base/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/base/jquery.ui.core.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/base/jquery.ui.theme.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/base/jquery.ui.datepicker.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/base/jquery.ui.autocomplete.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/base/ui.jqgrid.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/js/resources/uploadify.css" rel="stylesheet" type="text/css" />
<script src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
<script src="<%=path %>/js/jquery.js"></script>
<script src="<%=path %>/js/json2.js"></script>
<script src="<%=path %>/js/common.js"></script>
<script src="<%=path %>/js/jquery.combo.js"></script>
<script src="<%=path %>/js/grid/i18n/grid.locale-cn.js"></script>
<script src="<%=path %>/js/grid/grid.base.js"></script>
<script src="<%=path %>/js/grid/grid.custom.js"></script>
<script src="<%=path %>/js/grid/jquery.fmatter.js"></script>
<script src="<%=path %>/js/grid/grid.common.js"></script>
<script src="<%=path %>/js/grid/grid.celledit.js"></script>
<script src="<%=path %>/js/ui/jquery-ui.js"></script>
<script src="<%=path %>/js/ui/jquery.ui.core.js"></script>
<script src="<%=path %>/js/ui/jquery.ui.widget.js"></script>
<script src="<%=path %>/js/ui/jquery.ui.datepicker.js"></script>
<script src="<%=path %>/js/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<script src="<%=path %>/js/plugin/lhgdialog.js?self=true&skin=blue"></script>
<script src="<%=path %>/js/ui/jquery.validate.js"></script>
<script src="<%=path %>/js/ui/jquery-validate-msg-zh.js"></script>
<script src="<%=path %>/js/ui/jquery-powerFloat-min.js"></script>
<script src="<%=path %>/js/jquery.form.js"></script>
<script src="<%=path %>/js/resources/swfobject.js"></script>
<script type="text/javascript" src="<%=path%>/js/resources/jquery.uploadify.v2.0.3.min.js"></script>
<script src="<%=path %>/js/jdjcjl.js"></script>
<script src="<%=path %>/js/baseSupportScript.js"></script>
<script src="<%=path %>/js/plugin/echarts.js"></script>

  <script type="text/javascript">
  var LastAccessedTime =  "<%=session.getLastAccessedTime()%>";
  sessionStorage.setItem("maxtime", LastAccessedTime);

</script>
