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
<body>
	<div class="wrapper">
	  <div class="grid-wrap">
	    <table id="grid">
	    </table>
    	<div id="page"></div>
	  </div>
	</div>
</body>
</html>	
<script>
	var path = "<%=path %>";
</script>
<script src="<%=path %>/js/bs/message/cyxz_list.js"></script>