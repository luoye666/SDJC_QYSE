<%@page import="com.stone.para.IConstant"%>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="/c.tld" %>
<%
String path = request.getContextPath();
%>

<html>
<head>
<title>登记表_预览</title>
<meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
<style type="text/css">
*{
	font-family:Microsoft YaHei;
}
.tabjcxx {
	border-collapse:collapse; 
	text-align:center; 
	margin:0 0 0 0;
	width: 100%;
}
td{
	border:1px black solid;
	font-size:11px;
	text-align:center; 
	margin:0px; 
	padding:3px 0 3px 0px;
}
.shuoming td{
	border:none;
	font-size:11px;
	text-align:center; 
	margin:0px; 
	padding:3px 0 3px 0px;
}
.shuoming{
	width: 100%;
}

</style>

<script>
	function doPrint() { 
		bdhtml=window.document.body.innerHTML; 
		sprnstr="<!--startprint-->"; 
		eprnstr="<!--endprint-->"; 
		prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
		prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
		window.document.body.innerHTML=prnhtml; 
		window.print(); 
	}
</script>
</head>
<body>
<DIV align=center> 
	<input name="Button" onClick="doPrint()" type="button" value="打印" class='noprint' style="padding: 2px 4px 2px 4px"/> 
</DIV>
<!--startprint-->
		   			<div style="width: 100%;text-align: center;font-size: 15px;">
		   				<b>特种设备使用登记表</b>
		   			</div>
					<div>
						<table style="width: 100%">
							<td style="width:50%;border: none;text-align: left;">登记类别：${register.dengjileibie }</td>
						</table>
						<table class="tabjcxx" cellpadding="0" cellspacing="0">
							<tr>
								<td  rowspan="6" style="width: 7%">设备基本情况</td>
								<td style="width: 15%">设备种类</td>
								<td style="width: 35%">${register.shebeizhonglei}</td>
								<td  colspan="2" style="width: 17%">设备类别</td>
								<td style="width: 26%">${register.shebeileibie}</td>
							</tr>
							<tr>
								<td >设备品种</td>
								<td >${register.shebeipinzhong}</td>
								<td  colspan="2">产品名称</td>
								<td >${register.shebeimingcheng}</td>
							</tr>
							<tr>
								<td >设备代码</td>
								<td >${register.shebeidaima}</td>
								<td  colspan="2">型号(规格)</td>
								<td >${register.shebeixinghao}</td>
							</tr>
							<tr>
								<td >设备使用年限</td>
								<td >${register.shejishiyongnianxian}年</td>
								<td  colspan="2">设计单位名称</td>
								<td >${register.shejidanwei}</td>
							</tr>
							<tr>
								<td>制造单位名称</td>
								<td>${register.zhizaodanwei}</td>
								<td colspan="2">施工单位名称</td>
								<td>${register.shigongdanwei}</td>
							</tr>
							<tr>
								<td>监督检验机构名称</td>
								<td>${register.jianjiandanwei}</td>
								<td colspan="2">型式试验机构名称</td>
								<td>${register.xingshishiyanjiegou}</td>
							</tr>
							<tr>
								<td  rowspan="8" style="width: 7%">设备使用情况</td>
								<td >使用单位名称</td>
								<td  colspan="4">${register.shiyongdanwei}</td>
							</tr>
							<tr>
								<td >使用单位地址</td>
								<td  colspan="4">
									${register.shiyongdanweidizhi}
								</td>
							</tr>
							<tr>
								<td >使用单位统一社会信用代码</td>
								<td >${register.shiyongdanweidaima}</td>
								<td  colspan="2">邮政编码</td>
								<td >${register.sydw_youzhengbianma}</td>
							</tr>
							<tr>
								<td >单位内编号</td>
								<td >${register.neibubianhao}</td>
								<td  colspan="2">设备使用地点</td>
								<td >${register.shiyongdidian}</td>
							</tr>
							<tr>
								<td >投入使用日期</td>
								<td >
									<c:if test="${!empty register.touyongriqi}">
										<fmt:formatDate value="${register.touyongriqi}" pattern="yyyy-MM-dd"/>
									</c:if>
									<c:if test="${empty register.touyongriqi}">
										${register.touyongriqi_str}
									</c:if>
								</td>
								<td  colspan="2">单位固定电话</td>
								<td >${register.sydw_gudingdianhua}</td>
							</tr>
							<tr>
								<td>安全管理人员</td>
								<td>${register.anquanguanlirenyuan}</td>
								<td colspan="2">移动电话</td>
								<td>${register.aqglry_lianxidianhua}</td>
							</tr>
							<tr>
								<td>产权单位名称</td>
								<td colspan="4">${register.chanquandanwei}</td>
							</tr>
							<tr>
								<td>产权单位统一社会</br>信用代码</td>
								<td>${register.chanquandanweidaima}</td>
								<td colspan="2">联系电话</td>
								<td>${register.cqdw_dianhua}</td>
							</tr>
							<tr>
								<td  rowspan="4">设备检验情况</td>
								<td >检验机构名称</td>
								<td  colspan="4">${register.jianyandanwei}</td>
							</tr>
							<tr>
								<td >检验类别</td>
								<td >${register.jianyanleibie}</td>
								<td  colspan="2">检验报告编号</td>
								<td >${register.baogaoshubianhao}</td>
							</tr>
							<tr>
								<td >检验日期</td>
								<td >
									<fmt:formatDate value="${register.jianyanriqi}" pattern="yyyy-MM-dd"/>
								</td>
								<td  colspan="2">检验结论</td>
								<td >${register.jianyanjielun}</td>
							</tr>
							<tr>
								<td>下次检验日期</td>
								<td colspan="4">
									<fmt:formatDate value="${register.xiacijianyanriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td colspan="6" >
									<div style="text-align: left;">
										    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在此申明：所申报的内容真实；在使用过程中，将严格执行《中华人民共和国特种设备安全法》及相关规定，并且接受特种设备安全监督管理部门的监督管理。
									</div>
									<div style="text-align: left;">
										 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;附：含产品数据表
									</div>
									<table class="shuoming">
										<tr>
											<td class="smtd" style="width: 25%">使用单位填表人员：</td>
											<td class="smtd" style="width: 15%">${register.tianbiaorenyuan }</td>
											<td class="smtd" style="width: 15%">日期：</td>
											<td class="smtd" style="width: 20%">
												<fmt:formatDate value="${register.tianbiaoriqi}" pattern="yyyy-MM-dd"/>
											</td>
											<td class="smtd" style="width: 25%">(使用单位公章)</td>
										</tr>
										<tr>
											<td class="smtd">使用单位安全管理人员：</td>
											<td class="smtd">${register.anquanguanlirenyuan }</td>
											<td class="smtd">日期：</td>
											<td class="smtd">
												<fmt:formatDate value="${register.aqglry_riqi}" pattern="yyyy-MM-dd"/>
											</td>
											<td class="smtd">${register.shiyongdanwei_nyr}</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td  colspan="6">
									<div style="text-align: left;">
										说明：${register.beizhu }
									</div>
									<table class="shuoming">
										<tr>
											<td class="smtd" style="width: 25%">登记机关登记人员：</td>
											<td class="smtd" style="width: 15%">${register.zhucedengjirenyuan }</td>
											<td class="smtd" style="width: 20%">日期：</td>
											<td class="smtd" style="width: 20%">
												<fmt:formatDate value="${register.zhucedengjiriqi}" pattern="yyyy-MM-dd"/>
											</td>
											<td class="smtd" style="width: 20%">（登记机关专用章）</td>
										</tr>
										<tr>
											<td class="smtd">使用登记证编号：</td>
											<td class="smtd" colspan="2">${register.shiyongdengjizhenghaoma }</td>
											<td class="smtd"></td>
											<td class="smtd">${register.dengjijiguan_nyr}</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					 </div>
<!--endprint-->
</body>
</html>