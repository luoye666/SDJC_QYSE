<%@page import="com.stone.para.IConstant"%>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="/c.tld" %>
<%
String path = request.getContextPath();
%>

<html>
<head>
<link rel="stylesheet" href="<%=path%>/css/print/StickyFooter.css"type="text/css"></link>
<style type="text/css">
* {
margin:0;
padding:0;
} 

.tabdjk {
	border-collapse:collapse; 
	text-align:center; 
	margin:0 0 0 0;
	width: 100%;
}
.tabdjk td{
	border:1px black solid;
	font-size:12px;
	text-align:center; 
	margin:0px; 
	padding:7 0 7 0px;
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
</head>
<body>
<div id="container" class="container" >
	<div class="clearfix page" style="height: 980px; ">
		   			<div style="width: 100%;text-align: center;font-size: 15px;">
		   				<b>气瓶使用登记表</b>
		   			</div><br/><br/>
					<div>
				    	<div style="width: 100%">
		   					使用单位：${register.shiyongdanwei}
		   					<div>
								<table class="tabjyxm">
						    		<tr>
						    			<td style="width: 5%">序号</td>
						    			<td style="width: 10%">设备品种</td>
						    			<td style="width: 5%">充装介质</td>
						    			<td style="width: 10%">制造单位</td>
						    			<td style="width: 5%">制造年月</td>
						    			<td style="width: 5%">公称压力（Mpa）</td>
						    			<td style="width: 5%">容积（L）</td>
						    			<td style="width: 5%">设计壁厚（mm）</td>
						    			<td style="width: 5%">最近一次 检验日期</td>
						    			<td style="width: 5%">下次检验日期</td>
						    			<td style="width: 10%">气瓶使用登记代码</td>
						    			<td style="width: 10%">变更情况</td>
						    			<td style="width: 10%">停用 情况</td>
						    			<td style="width: 5%">出厂编号</td>
						    			<td style="width: 5%">厂内编号</td>
						    		</tr>
									<c:forEach items="${qpList}" var="f" varStatus="i">
										<tr>
											<td>${i.index+1}</td>
											<td>${f.shebeipinzhong}</td>
											<td>${f.chongzhuangjiezhi}</td>
											<td>${f.zhizaodanwei}</td>
											<td>${f.zhizaonianyue}</td>
											<td>${f.gongchengyali}</td>
											<td>${f.rongji}</td>
											<td>${f.shejibihou}</td>
											<td>${f.zhyc_jianyanriqi}</td>
											<td>${f.xiacijianyanriqi}</td>
											<td>${f.dengjidaima}</td>
											<td>${f.biangengqingkuang}</td>
											<td>${f.tingyongqingkuang}</td>
											<td>${f.chuchangbianhao}</td>
											<td>${f.changneibianhao}</td>
										</tr>
									</c:forEach>
						    	</table>
		   					</div>
							<div>
								审请人声明和签署：以上所列气瓶均有唯一的使用登记代码，本人对本表所填内容的真实性负责。
								申请单位法定代表人签名：${register.danweifarendaibiao}
								日期：<fmt:formatDate value="${register.fr_riqi}" pattern="yyyy-MM-dd"/>
							</div>
							<div>
								登记机关经办人：${register.jingbanren}
								日期：<fmt:formatDate value="${register.jbr_riqi}" pattern="yyyy-MM-dd"/>
								安全监察机构负责人：${register.jcjg_fuzeren}
								日期：<fmt:formatDate value="${register.jcjg_riqi}" pattern="yyyy-MM-dd"/>
								 登记机关：${register.zhucedengjijigou}
							</div>
				    	</div>
					</div>
</div>
</div>
</body>
</html>