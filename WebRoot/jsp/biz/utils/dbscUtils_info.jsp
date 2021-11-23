<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/c.tld"  prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style type="text/css">
	body{
		font-size: 15px;
	}
	table{
		width:100%;
		border-collapse:collapse;
		text-align: center;
	}
	
	td{
		border:1px solid #DDDDDD;
	}
	
</style>
</head>
<body>
  <div >
    <table id="tb1">
   		<c:forEach var="item" items="${map}">
   		 <tr>
   		   <td>${item.key} </td>
   		   <td>${item.value} </td>
   		 </tr>
		</c:forEach>
    </table>
  </div>
	</body>
	</html>
	<!-- 脚本 -->
	<script language="javascript">
window.onload=function showtable(){
var tablename=document.getElementById("tb1");
var li=tablename.getElementsByTagName("tr");
for (var i=0;i<=li.length;i++){
if (i%2==0){
li[i].style.backgroundColor="#F8F8FF";
}else li[i].style.backgroundColor="#F5F5F5";
}
}
</script>