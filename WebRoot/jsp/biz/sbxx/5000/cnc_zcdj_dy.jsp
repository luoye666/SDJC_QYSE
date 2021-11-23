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
	margin:0;
	padding:0;
	font-family:Microsoft YaHei;
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
	padding:1.5 0 1.5 0px;
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
								<td>注册登记机构</td>
								<td colspan="3">
									${register.zhucedengjijigou}
								</td>
								<td>注册登记日期</td>
								<td>
									<fmt:formatDate value="${register.zhucedengjiriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td>设备注册代码</td>
								<td colspan="3">
									${register.zhucedaima}
								</td>
								<td>更新日期</td>
								<td>
									<fmt:formatDate value="${register.gengxinriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td style="width: 15%">单位内部编号</td>
								<td style="width: 20%">
									${register.neibubianhao}
								</td>
								<td style="width: 13%">厂车牌照编号</td>
								<td style="width: 20%">
									${register.paizhaobianhao}
								</td>
								<td style="width: 12%">注册登记人员</td>
								<td style="width: 20%">
									${register.zhucedengjirenyuan}
								</td>
							</tr>
							<tr>
								<td>产权单位</td>
								<td colspan="3">
									${register.chanquandanwei}
								</td>
								<td>产权单位代码</td>
								<td>
									${register.chanquandanweidaima}
								</td>
							</tr>
							<tr>
								<td>产权单位地址</td>
								<td colspan="3">
									${register.chanquandanweidizhi}
								</td>
								<td>邮政编码</td>
								<td>
									${register.cqdw_youzhengbianma}
								</td>
							</tr>
							<tr>
								<td>单位法人代表</td>
								<td colspan="3">
									${register.danweifarendaibiao}
								</td>
								<td>联系电话</td>
								<td>
									${register.farenlianxidianhua}
								</td>
							</tr>
							<tr>
								<td>使用单位</td>
								<td colspan="3">
									${register.shiyongdanwei}
								</td>
								<td>使用单位代码</td>
								<td>
									${register.shiyongdanweidaima}
								</td>
							</tr>
							<tr>
								<td>使用单位地址</td>
								<td colspan="3">
									${register.shiyongdanweidizhi}
								</td>
								<td>邮政编码</td>
								<td>
									${register.sydw_youzhengbianma}
								</td>
							</tr>
							<tr>
								<td>安全管理部门</td>
								<td>
									${register.anquanguanlibumen}
								</td>
								<td>安全管理人员</td>
								<td>
									${register.anquanguanlirenyuan}
								</td>
								<td>联系电话</td>
								<td>
									${register.aqglry_lianxidianhua}
								</td>
							</tr>
							<tr>
								<td>设备使用地点</td>
								<td colspan="3">
									${register.shiyongdidian}
								</td>
								<td>操作人员</td>
								<td>
									${register.caozuorenyuan}
								</td>
							</tr>
							<tr>
								<td>设备类别</td>
								<td>
									${register.shebeileibie}
								</td>
								<td>设备名称</td>
								<td>
									${register.shebeimingcheng}
								</td>
								<td>设备型号</td>
								<td>
									${register.shebeixinghao}
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
								<td>制造单位</td>
								<td colspan="3">
									${register.zhizaodanwei}
								</td>
								<td>制造单位代码</td>
								<td>
									${register.zhizaodanweidaima}
								</td>
							</tr>
							<tr>
								<td>资格证书名称</td>
								<td>
									${register.zzdw_zigezhengshumingcheng}
								</td>
								<td>资格证书号</td>
								<td>
									${register.zzdw_zigezhengshuhao}
								</td>
								<td>联系电话</td>
								<td>
									${register.zzdw_lianxidianhua}
								</td>
							</tr>
							<tr>
								<td>制造日期</td>
								<td>
									<c:if test="${!empty register.zhizaoriqi}">
										<fmt:formatDate value="${register.zhizaoriqi}" pattern="yyyy-MM-dd"/>
									</c:if>
									<c:if test="${empty register.zhizaoriqi}">
										${register.zhizaoriqi_str}
									</c:if>
								</td>
								<td>出厂编号</td>
								<td>
									${register.chuchangbianhao}
								</td>
								<td>适用场合</td>
								<td>
									${register.shiyongchanghe}
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
								<td>资格证书编号</td>
								<td>
									${register.azdw_zigezhengshubianhao}
								</td>
								<td>项目负责人</td>
								<td>
									${register.xiangmufuzeren}
								</td>
								<td>联系电话</td>
								<td>
									${register.xmfzr_lianxidianhua}
								</td>
							</tr>
							<tr>
								<td>土建施工单位</td>
								<td colspan="3">
									${register.shigongdanwei}
								</td>
								<td>开始施工日期</td>
								<td>
									<fmt:formatDate value="${register.shigongriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td>土建验收单位</td>
								<td colspan="3">
									${register.yanshoudanwei}
								</td>
								<td>竣工验收日期</td>
								<td>
									<fmt:formatDate value="${register.jungongriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td>验收检验机构</td>
								<td colspan="3">
									${register.yanshoujianyanjigou}
								</td>
								<td>验收报告编号</td>
								<td>
									${register.yanshoubaogaobianhao}
								</td>
							</tr>
							<tr>
								<td>投用日期</td>
								<td>
									<c:if test="${!empty register.touyongriqi}">
										<fmt:formatDate value="${register.touyongriqi}" pattern="yyyy-MM-dd"/>
									</c:if>
									<c:if test="${empty register.touyongriqi}">
										${register.touyongriqi_str}
									</c:if>
								</td>
								<td>维修周期(周)</td>
								<td>
									${register.weibaozhouqi}
								</td>
								<td>大修周期(月)</td>
								<td>
									${register.daxiuzhouqi}
								</td>
							</tr>
							<tr>
								<td>维修保养单位</td>
								<td colspan="3">
									${register.weibaodanwei}
								</td>
								<td>维保单位代码</td>
								<td>
									${register.weibaodanweidaima}
								</td>
							</tr>
							<tr>
								<td>资格证书号</td>
								<td>
									${register.wbdw_zigezhengshuhao}
								</td>
								<td>维保责任人</td>
								<td>
									${register.weibaofuzeren}
								</td>
								<td>电话</td>
								<td>
									${register.weibaofuzerendianhua}
								</td>
							</tr>
							<tr>
								<td>所在车间分厂</td>
								<td colspan="3">
									${register.chejianfenchang}
								</td>
								<td></td>
								<td>
								</td>
							</tr>
							<tr>
								<td>检验单位</td>
								<td colspan="3">
									${register.jianyandanwei}
								</td>
								<td>检验单位代码</td>
								<td>
									${register.jianyandanweidaima}
								</td>
							</tr>
							<tr>
								<td>检验日期</td>
								<td>
									<fmt:formatDate value="${register.jianyanriqi}" pattern="yyyy-MM-dd"/>
								</td>
								<td>检验类别</td>
								<td>
									${register.jianyanleibie}
								</td>
								<td>主要问题</td>
								<td>
									${register.zhuyaowenti}
								</td>
							</tr>
							<tr>
								<td>检验结论</td>
								<td>
									${register.jianyanjielun}
								</td>
								<td>报告书编号</td>
								<td>
									${register.baogaoshubianhao}
								</td>
								<td>下次检验日期</td>
								<td>
									<fmt:formatDate value="${register.xiacijianyanriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td>事故类别</td>
								<td>
									${register.shiguleibie}
								</td>
								<td>事故发生日期</td>
								<td>
									<fmt:formatDate value="${register.shigufashengriqi}" pattern="yyyy-MM-dd"/>
								</td>
								<td>事故处理结果</td>
								<td>
									${register.shiguchulijieguo}
								</td>
							</tr>
							<tr>
								<td>设备变动方式</td>
								<td>
									${register.biandongfangshi}
								</td>
								<td>设备变动项目</td>
								<td>
									${register.biandongxiangmu}
								</td>
								<td>设备变动日期</td>
								<td>
									<fmt:formatDate value="${register.biandongriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td>设备承担单位</td>
								<td colspan="3">
									${register.chengdandanwei}
								</td>
								<td>承担单位代码</td>
								<td>
									${register.chengdandanweidaima}
								</td>
							</tr>
							<tr>
								<td>厂车牌照编号</td>
								<td>${register.paizhaobianhao }</td>
								<td>厂内车辆运行速度（km/h）</td>
								<td>
									${register.yunxingsudu }
								</td>
								<td>厂内车辆额定载荷（kg）</td>
								<td>
									${register.edingzaihe }
								</td>
							</tr>
						</table>
					 </div>
		   			<div style="width: 100%;text-align: center;font-size: 15px">
		   				<b>厂内机动车辆登记卡（基本信息）</b>
		   			</div>
		   			<div>
		   				<table class="tabjcxx">
							<tr>
								<td>使用登记证号码</td>
								<td colspan="3">
									${register.shiyongdengjizhenghaoma}
								</td>
								<td>注册代码</td>
								<td colspan="2">${register.zhucedaima}</td>
							</tr>
							<tr>
								<td>使用单位</td>
								<td colspan="6">${register.shiyongdanwei}</td>
							</tr>
							<tr>
								<td>详细地址</td>
								<td colspan="4">${register.shiyongdidian}</td>
								<td>邮政编码</td>
								<td>${register.sydw_youzhengbianma}</td>
							</tr>
							<tr>
								<td style="width: 15%">使用单位地址(省)</td>
								<td style="width: 10%">鲁</td>
								<td style="width: 10%">市</td>
								<td style="width: 20%">
									${register.shiyongdanweidizhi_shi}
								</td>
								<td style="width: 10%">区县</td>
								<td colspan="2">
									${register.shiyongdanweidizhi_qu}
								</td>
							</tr>
							<tr>
								<td colspan="2">所在乡镇</td>
								<td colspan="3">
									${register.suozaixiangzhen}
								</td>
								<td style="width: 10%">所在村</td>
								<td style="width: 20%">
									${register.suozaicun}
								</td>
							</tr>
							<tr>
								<td>法定代表人</td>
								<td>
									${register.sydw_fadingdaibiaoren}
								</td>
								<td colspan="2">电话(或总机)</td>
								<td colspan="3">
									${register.sydw_farendianhua}
								</td>
							</tr>
							<tr>
								<td>E-Mail</td>
								<td colspan="2">
									${register.sydw_farenemail}
								</td>
								<td>传真</td>
								<td colspan="3">
									${register.sydw_farenchuanzhen}
								</td>
							</tr>
							<tr>
								<td>主管负责人</td>
								<td>
									${register.zhuguanfuzeren}
								</td>
								<td colspan="2">主管负责人电话</td>
								<td colspan="3">
									${register.zhuguanfuzerendianhua}
								</td>
							</tr>
							<tr>
								<td>经办人</td>
								<td>
									${register.jingbanren}
								</td>
								<td colspan="2">经办人电话</td>
								<td>
									${register.jingbanrendianhua}
								</td>
								<td>手机或传呼</td>
								<td>
									${register.jingbanrenshouji}
								</td>
							</tr>
							<tr>
								<td>填表日期</td>
								<td>
									<fmt:formatDate value="${register.tianbiaoriqi}" pattern="yyyy-MM-dd"/>
								</td>
								<td colspan="3">是否在人口密集区</td>
								<td colspan="2">
									${register.renkoumijiqu}
								</td>
							</tr>
							<tr>
								<td>是否重大危险源</td>
								<td>
									${register.zhongdaweixianyuan}
								</td>
								<td colspan="4">是否制定事故应急措施和救援预案</td>
								<td>
									${register.yingjicuoshi}
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td colspan="4">是否重点监控特种设备</td>
								<td>
									${register.zhongdianjiankong}
								</td>
							</tr>
							<tr>
								<td>备注</td>
								<td colspan="6">
									${register.beizhu}
								</td>
							</tr>
		   				</table>
		   			</div>
		   		<div class="PageNext"></div>
		   		<div style="width: 100%;text-align: center;font-size: 15px;">
		   			<b>主要安全附件及附属设备、水处理设备</b>
		   		</div>
	   			<br/>
				<table class="tabjyxm">
		    		<tr>
		    			<td style="width: 20%">名称</td>
		    			<td style="width: 20%">型号</td>
		    			<td style="width: 20%">规格</td>
		    			<td style="width: 10%">数量</td>
		    			<td style="width: 30%">制造厂家</td>
		    		</tr>
					<c:forEach items="${fjList}" var="f" varStatus="i">
						<tr>
							<td>${f.mingcheng}</td>
							<td>${f.xinghao}</td>
							<td>${f.guige}</td>
							<td>${f.shuliang}</td>
							<td>${f.zhizaochangjia}</td>
						</tr>
					</c:forEach>
		    	</table>
		    	
<!--endprint-->
	</body>
	</html>
