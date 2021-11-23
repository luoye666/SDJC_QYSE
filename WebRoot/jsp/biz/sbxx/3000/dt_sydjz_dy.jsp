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
<link rel="stylesheet" href="<%=path%>/css/print/StickyFooter.css"type="text/css"></link>
<style type="text/css">
* {
margin:0;
padding:0;
} 
.neirong {
	border-collapse:collapse; 
	text-align:center; 
	margin:0 0 0 0;
	width: 100%;
}
.neirong td{
	text-align:left; 
	margin:0px; 
	font-size: 22px;
	font-family: 黑体;
	height: 1.3cm;
}

</style>
</head>
<body>
<div id="container" class="container" >
		   			<div style="height: 5.5cm;"></div>
		   			
					<table style="width: 100%">
						<tr>
							<td style="width: 75%;height: 1cm"></td>
							<td style="font-size: 22px;font-family: 黑体;text-align: left;">
								${reg.shiyongdengjizhenghaoma}
							</td>
						</tr>
					</table>
					
		   			<div style="height: 3.2cm;"></div>
		   			
					<table class="neirong">
						<tr>
							<td></td>
							<td colspan="3" style="padding-top: 15px">
								${reg.shiyongdanwei}
							</td>
						</tr>
						<tr>
							<td style="width: 26%"></td>
							<td style="width: 28%">
								${reg.shebeizhonglei}
							</td>
							<td style="width: 16%"></td>
							<td style="width: 30%">
								${reg.shebeileibie}
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								${reg.shebeimingcheng}
							</td>
							<td></td>
							<td>
								${reg.zhucedaima}
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="3">
								${reg.zhizaodanwei}
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								${reg.chuchangbianhao}
							</td>
							<td></td>
							<td>
								&nbsp;&nbsp;${reg.neibubianhao}
							</td>
						</tr>
						<tr>
							<td colspan="4" style="height: 1.5cm"></td>
						</tr>
					</table>
					
					<table style="width: 100%">
						<tr>
							<td style="width: 69%;height: 1cm"></td>
							<td style="font-size: 18px;font-family: 黑体;text-align: left;">
								<%=now.get(Calendar.YEAR) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(now.get(Calendar.MONTH))+1 %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=now.get(Calendar.DAY_OF_MONTH) %>
							</td>
						</tr>
					</table>
		   			
</div>
</body>
</html>