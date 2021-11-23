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
	padding:1px 0 1px 0px;
}
.shuoming td{
	border:none;
	font-size:11px;
	text-align:center; 
	margin:0px; 
	padding:1px 0 1px 0px;
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
							<td style="width:50%;border: none;">注册代码：${register.zhucedaima}</td>
						</table>
						<table class="tabjcxx" cellpadding="0" cellspacing="0">
							<tr>
								<td  rowspan="4">设备基本情况</td>
								<td >设备种类</td>
								<td >${register.shebeizhonglei}</td>
								<td  colspan="2">设备类别</td>
								<td >${register.shebeileibie}</td>
							</tr>
							<tr>
								<td >设备品种</td>
								<td >${register.shebeipinzhongdaima}</td>
								<td  colspan="2">产品名称</td>
								<td >${register.shebeimingcheng}</td>
							</tr>
							<tr>
								<td >设备代码</td>
								<td >${register.shebeidaima}</td>
								<td  colspan="2">设备型号</td>
								<td >${register.shebeixinghao}</td>
							</tr>
							<tr>
								<td >设备使用年限</td>
								<td >${register.shejishiyongnianxian}年</td>
								<td  colspan="2">固定资产值</td>
								<td >${register.gudingzichan}万元</td>
							</tr>
							<tr>
								<td  rowspan="13" style="width: 7%">设备使用情况</td>
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
								<td >机构代码或信用代码</td>
								<td >${register.shiyongdanweidaima}</td>
								<td  colspan="2">邮政编码</td>
								<td >${register.sydw_youzhengbianma}</td>
							</tr>
							<tr>
								<td >单位性质</td>
								<td >${register.danweixingzhi}</td>
								<td  colspan="2">所属行业</td>
								<td >${register.suoshuhangye}</td>
							</tr>
							<tr>
								<td >法定代表人</td>
								<td >${register.sydw_fadingdaibiaoren}</td>
								<td  colspan="2">安全管理机构</td>
								<td >${register.anquanguanlibumen}</td>
							</tr>
							<tr>
								<td >安全管理人员</td>
								<td >${register.anquanguanlirenyuan}</td>
								<td  colspan="2">联系电话</td>
								<td >${register.aqglry_lianxidianhua}</td>
							</tr>
							<tr>
								<td >单位内编号</td>
								<td >${register.neibubianhao}</td>
								<td  colspan="2">设备使用地点</td>
								<td >${register.shiyongdidian}</td>
							</tr>
							<tr>
								<td  style="width: 20%">使用场所类别</td>
								<td  style="width: 23%">${register.shiyongchanghe}</td>
								<td  rowspan="3" style="width: 10%">设备地理信息</td>
								<td  style="width: 15%">经度</td>
								<td  style="width: 25%">${register.jingdu}</td>
							</tr>
							<tr>
								<td >运行状态</td>
								<td >
									${register.yxzt_yongtu}
								</td>
								<td >纬度</td>
								<td >${register.weidu}</td>
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
								<td >海拔高度</td>
								<td >${register.haibagaodu}</td>
							</tr>
							<tr>
								<td >产权单位名称</td>
								<td  colspan="4">${register.chanquandanwei}</td>
							</tr>
							<tr>
								<td >机构代码或信用代码</td>
								<td >${register.chanquandanweidaima}</td>
								<td  colspan="2">联系电话</td>
								<td >${register.cqdw_dianhua}</td>
							</tr>
							<tr>
								<td >单位性质</td>
								<td >${register.cqdw_xingzhi}</td>
								<td  colspan="2">所属行业</td>
								<td >${register.cqdw_suoshuhangye}</td>
							</tr>
							<tr>
								<td  rowspan="7">设备制造与监检情况</td>
								<td >制造单位名称</td>
								<td  colspan="4">${register.zhizaodanwei}</td>
							</tr>
							<tr>
								<td >制造许可证编号</td>
								<td >${register.zzdw_zigezhengshuhao}</td>
								<td  colspan="2">产品编号</td>
								<td >${register.chuchangbianhao}</td>
							</tr>
							<tr>
								<td >制造日期</th>
								<td >
									<c:if test="${!empty register.zhizaoriqi}">
										<fmt:formatDate value="${register.zhizaoriqi}" pattern="yyyy-MM-dd"/>
									</c:if>
									<c:if test="${empty register.zhizaoriqi}">
										${register.zhizaoriqi_str}
									</c:if>
								</td>
								<td  colspan="2">产品合格证编号</td>
								<td >${register.chanpinhegezhengbianhao}</td>
							</tr>
							<tr>
								<td >设计文件鉴定机构</td>
								<td  colspan="4">
									${register.xingshishiyanjiegou }
								</td>
							</tr>
							<tr>
								<td >鉴定报告书编号</td>
								<td >
									${register.xingshishiyanzhengshu }
								</td>
								<td  colspan="2">产品图号</td>
								<td >
									${register.chanpintuhao }
								</td>
							</tr>
							<tr>
								<td >制造监检机构</td>
								<td  colspan="4">${register.zhizaojianjianjigou}</td>
							</tr>
							<tr>
								<td >监检机构核准证编号</td>
								<td >${register.jianjianjigouhezhunzheng}</td>
								<td  colspan="2">制造监检证书编号</td>
								<td >${register.zhizaojianjianzhengshu}</td>
							</tr>
							<tr>
								<td  rowspan="3">设备施工情况</td>
								<td >施工单位名称</td>
								<td  colspan="4">${register.anzhuangdanwei}</td>
							</tr>
							<tr>
								<td >施工许可证编号</td>
								<td >${register.azdw_zigezhengshubianhao}</td>
								<td  colspan="2">施工类别</td>
								<td >${register.shigongleibie}</td>
							</tr>
							<tr>
								<td >施工告知日期</td>
								<td >
									<fmt:formatDate value="${register.shigongriqi}" pattern="yyyy-MM-dd"/>
								</td>
								<td  colspan="2">施工竣工日期</td>
								<td >
									<fmt:formatDate value="${register.jungongriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td  rowspan="2">设备工作参数</td>
								<td >工作压力</td>
								<td >${register.gongzuoyali }Mpa</td>
								<td  colspan="2">工作温度</td>
								<td >${register.gongzuowendu}℃</td>
							</tr>
							<tr>
								<td >介质</td>
								<td >${register.jiezhi}</td>
								<td  colspan="2">运行热效率</td>
								<td >${register.yunxingrexiaolv}</td>
							</tr>
							<tr>
								<td  rowspan="3">设备保险情况</td>
								<td >保险机构</td>
								<td  colspan="4">${register.baoxianjigou}</td>
							</tr>
							<tr>
								<td >保险险种</td>
								<td >${register.baoxianpinzhong}</td>
								<td  colspan="2">保险价值</td>
								<td >${register.baoxianjiazhi }万元</td>
							</tr>
							<tr>
								<td  >保险费</td>
								<td >${register.baoxianfei}万元</td>
								<td  colspan="2">保险金额</td>
								<td >${register.baoxianjine }万元</td>
							</tr>
							<tr>
								<td  rowspan="4">设备变更情况</td>
								<td >变更项目</td>
								<td >变更类别</td>
								<td  colspan="2">变更原因</td>
								<td >变更日期</td>
							</tr>
							<tr>
								<td >${register.biandongxiangmu}&nbsp;</td>
								<td >${register.biandongfangshi}</td>
								<td  colspan="2">${register.biandongyuanyin}</td>
								<td >
									<fmt:formatDate value="${register.biandongriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
								<td >${register.biandongxiangmu_2}&nbsp;</td>
								<td >${register.biandongfangshi_2}</td>
								<td  colspan="2">${register.biandongyuanyin_2}</td>
								<td >
									<fmt:formatDate value="${register.biandongriqi_2}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td >${register.biandongxiangmu_3}&nbsp;</td>
								<td >${register.biandongfangshi_3}</td>
								<td  colspan="2">${register.biandongyuanyin_3}</td>
								<td >
									<fmt:formatDate value="${register.biandongriqi_3}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td  rowspan="4">设备检验情况</td>
								<td >检验机构</td>
								<td  colspan="4">${register.jianyandanwei}</td>
							</tr>
							<tr>
								<td >机构代码或信用代码</td>
								<td >${register.jianyandanweidaima}</td>
								<td  colspan="2">检验类别</td>
								<td >${register.jianyanleibie}</td>
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
								<td >检验报告编号</td>
								<td >${register.baogaoshubianhao}</td>
								<td  colspan="2">下次检验日期</td>
								<td >
									<fmt:formatDate value="${register.xiacijianyanriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td colspan="6" >
									<div style="text-align: left;">
										    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在此申明：所申报的内容真实；在使用过程中，将严格执行《中华人民共和国特种设备安全法》、《特种设备安全监察条例》及其相关规定，并接受特种设备安全监督管理部门的监督管理。
									</div>
									<div style="text-align: left;">
										 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;附：合格证(含产品数据表)
									</div>
									<table class="shuoming">
										<tr>
											<td class="smtd" style="width: 25%">使用单位填表人员：</td>
											<td class="smtd" style="width: 15%">${register.tianbiaorenyuan }</td>
											<td class="smtd" style="width: 15%">日期：</td>
											<td class="smtd" style="width: 20%">
												<fmt:formatDate value="${register.tianbiaoriqi}" pattern="yyyy-MM-dd"/>
											</td>
											<td class="smtd" style="width: 25%">(使用单位公章或者专用章)</td>
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
										<tr>
											<td class="smtd" colspan="2">首次定期检验日期：</td>
											<td class="smtd" colspan="3"><fmt:formatDate value="${register.dingqijianyanriqi}" pattern="yyyy-MM-dd"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td  colspan="6">
									<div style="text-align: left;">
										说明：${register.shuoming }
									</div>
									<table class="shuoming">
										<tr>
											<td class="smtd" style="width: 25%">登记机关登记人员：</td>
											<td class="smtd" style="width: 15%">${register.zhucedengjirenyuan }</td>
											<td class="smtd" style="width: 20%">日期：</td>
											<td class="smtd" style="width: 20%">
												<fmt:formatDate value="${register.zhucedengjiriqi}" pattern="yyyy-MM-dd"/>
											</td>
											<td class="smtd" style="width: 20%">登记机关（专用章）</td>
										</tr>
										<tr>
											<td class="smtd" colspan="4"></td>
											<td class="smtd">${register.dengjijiguan_nyr}</td>
										</tr>
										<tr>
											<td class="smtd"></td>
											<td class="smtd">监管类别：</td>
											<td class="smtd">${register.jianguanleibie }</td>
											<td class="smtd">使用登记证编号：</td>
											<td class="smtd">${register.shiyongdengjizhenghaoma }</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<tr>
									<td  >市：</td>
									<td >${register.shiyongdanweidizhi_shi }</td>
									<td >区县：</td>
									<td >${register.shiyongdanweidizhi_qu }</td>
									<td >乡镇：</td>
									<td >${register.suozaixiangzhen }</td>
								</tr>
							</tr>
						</table>
					 </div>
<!--endprint-->
</body>
</html>