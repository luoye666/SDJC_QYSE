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
* {
	font-family:Microsoft YaHei;
	margin:0;
	padding:0;
} 

.tabjcxx {
	border-collapse:collapse; 
	text-align:center; 
	margin:0 0 0 0;
	width: 100%;
}
.tabjcxx td{
	border:1px black solid;
	font-size:12px;
	text-align:center; 
	margin:0px; 
	padding:2.5 0 2.5 0px;
}
.tabjyxm {
	border-collapse:collapse; 
	text-align:center; 
	margin:0 0 0 0;
	width: 100%;
}
.tabjyxm td{
	border:1px black solid;
	font-size:15px;
	text-align:center; 
	padding:5 4 5 4px;
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
						<table class="tabjcxx">
							<tr>
								<td>使用单位</td>
								<td colspan="3">
									${register.shiyongdanwei}
								</td>
								<td>使用单位地址</td>
								<td>
									${register.shiyongdanweidizhi}
								</td>
							</tr>
							<tr>
								<td>主管部门</td>
								<td colspan="3">
									${register.zhuguanbumen}
								</td>
								<td>行业</td>
								<td>
									${register.suoshuhangye}
								</td>
							</tr>
							<tr>
								<td>联系电话</td>
								<td colspan="3">
									${register.zhuguanfuzerendianhua}
								</td>
								<td>安全管理部门</td>
								<td>
									${register.anquanguanlibumen}
								</td>
							</tr>
							<tr>
								<td>安全管理人员</td>
								<td colspan="3">
									${register.anquanguanlirenyuan}
								</td>
								<td>经办人</td>
								<td>
									${register.jingbanren}
								</td>
							</tr>
							<tr>
								<td>压力管道类别</td>
								<td colspan="3">
									${register.shebeileibie}
								</td>
								<td>工程(装置)名称</td>
								<td>
									${register.gongchengmingcheng}
								</td>
							</tr>
							<tr>
								<td>设计单位</td>
								<td colspan="3">
									${register.shejidanwei}
								</td>
								<td>设计单位代码</td>
								<td>
									${register.shejidanweidaima}
								</td>
							</tr>
							<tr>
								<td>安装单位</td>
								<td colspan="3">
									${register.anzhuangdanwei}
								</td>
								<td>安装单位代码</td>
								<td>
									${register.anzhuangdanweidaima}
								</td>
							</tr>
							<tr>
								<td style="width: 13%">竣工验收日期</td>
								<td style="width: 20%">
									<fmt:formatDate value='${register.jungongriqi}' pattern='yyyy-MM-dd'/>
								</td>
								<td style="width: 10%">投用日期</td>
								<td style="width: 20%">
									<c:if test="${!empty register.touyongriqi}">
										<fmt:formatDate value="${register.touyongriqi}" pattern="yyyy-MM-dd"/>
									</c:if>
									<c:if test="${empty register.touyongriqi}">
										${register.touyongriqi_str}
									</c:if>
								</td>
								<td style="width: 15%">管道规格</td>
								<td style="width: 22%">
									${register.guandaoguige}
								</td>
							</tr>
							<tr>
								<td>管道名称</td>
								<td>
									${register.shebeimingcheng}
								</td>
								<td>管道编号</td>
								<td>
									${register.guandaobianhao}
								</td>
								<td>管道级别</td>
								<td>
									${register.guandaojibie}
								</td>
							</tr>
							<tr>
								<td>公称直径</td>
								<td>
									${register.gongchengzhijing}mm
								</td>
								<td>公称壁厚</td>
								<td>
									${register.gongchengbihou}mm
								</td>
								<td>管道长度</td>
								<td>
									${register.guandaochangdu}km
								</td>
							</tr>
							<tr>
								<td>设计压力</td>
								<td>
									${register.shejiyali}Mpa
								</td>
								<td>设计温度</td>
								<td>
									${register.shejiwendu}℃
								</td>
								<td>输送介质</td>
								<td>
									${register.shusongjiezhi}
								</td>
							</tr>
							<tr>
								<td>最高工作压力</td>
								<td>
									${register.gongzuoyali}Mpa
								</td>
								<td>最高工作温度</td>
								<td>
									${register.gongzuowendu}℃
								</td>
								<td>是否重要管道</td>
								<td>
									${register.shifouzhongyaoguandao}
								</td>
							</tr>
							<tr>
								<td>所属车间</td>
								<td colspan="3">
									${register.chejianfenchang}
								</td>
								<td>检验结论</td>
								<td>
									${register.jianyanjielun}
								</td>
							</tr>
							<tr>
								<td>压力管道代码</td>
								<td colspan="3">
									${register.zhucedaima}
								</td>
								<td>检验日期</td>
								<td>
									<fmt:formatDate value='${register.jianyanriqi}' pattern='yyyy-MM-dd'/>
								</td>
							</tr>
							<tr>
								<td>下次检验日期</td>
								<td colspan="3">
									<fmt:formatDate value='${register.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>
								</td>
								<td>固定资产值</td>
								<td>
									${register.gudingzichan}
								</td>
							</tr>
							<tr>
								<td>备注</td>
								<td colspan="5">
									${register.beizhu}
								</td>
							</tr>
							<tr>
								<td>审核日期</td>
								<td colspan="3">
									<fmt:formatDate value='${register.shenheriqi}' pattern='yyyy-MM-dd'/>
								</td>
								<td>登记意见</td>
								<td>
									${register.shenheyijian}
								</td>
							</tr>
							<tr>
								<td>注册登记日期</td>
								<td colspan="3">
									<fmt:formatDate value='${register.zhucedengjiriqi}' pattern='yyyy-MM-dd'/>
								</td>
								<td>注册登记人员</td>
								<td>
									${register.zhucedengjirenyuan}
								</td>
							</tr>
							<tr>
								<td>注册登记机构</td>
								<td colspan="3">
									${register.zhucedengjijigou}
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td >市：</td>
								<td>${register.shiyongdanweidizhi_shi }</td>
								<td>区县：</td>
								<td>${register.shiyongdanweidizhi_qu }</td>
								<td>乡镇：</td>
								<td>${register.suozaixiangzhen }</td>
							</tr>
						</table>
					 </div>
<!--endprint-->
	</body>
	</html>
