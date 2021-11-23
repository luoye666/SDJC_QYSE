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
		   			<div style="width: 100%;text-align: center;font-size: 18px;">
		   				<b>特种设备使用登记表</b>
		   			</div>
		   			<br/>
					<div>
						<table style="width: 100%">
							<td style="width:50%;border: none;text-align: left;font-size: 12px">（使用单位印章）</td>
							<td style="width:50%;border: none;text-align: right;font-size: 12px">（注册单位印章）</td>
						</table>
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
								<td>单位内部编号</td>
								<td colspan="3">
									${register.neibubianhao}
								</td>
								<td>注册登记人员</td>
								<td>
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
									鲁${register.chanquandanweidizhi_shi}${register.chanquandanweidizhi_qu}
								</td>
								<td>邮政编码</td>
								<td>
									${register.cqdw_youzhengbianma}
								</td>
							</tr>
							<tr>
								<td style="width: 15%">单位法人代表</td>
								<td style="width: 20%">
									${register.danweifarendaibiao}
								</td>
								<td style="width: 13%">管理负责人</td>
								<td style="width: 20%">
									${register.cqdw_guanlifuzeren}
								</td>
								<td style="width: 12%">联系电话</td>
								<td style="width: 20%">
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
									鲁${register.shiyongdanweidizhi_shi}${register.shiyongdanweidizhi_qu}${register.suozaixiangzhen}
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
									鲁${register.shiyongdidian_shi}${register.shiyongdidian_qu}
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
								<td>制造年月</td>
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
								<td colspan="6">设备主要参数</td>
							</tr>
							<tr>
								<td>游乐设施线速度</td>
								<td>
									${register.xiansudu}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;m/s
								</td>
								<td>游乐设施高度</td>
								<td>
									${register.ylss_gaodu}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;m
								</td>
								<td>额定乘客人数</td>
								<td>
									${register.edingchengkerenshu}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人
								</td>
							</tr>
							<tr>
								<td>额定载荷</td>
								<td>
									${register.edingzaihe}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kg
								</td>
								<td>额定速度</td>
								<td>
									${register.sudu}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;m/s
								</td>
								<td>倾夹角或坡度</td>
								<td>
									${register.qingjiao}度
								</td>
							</tr>
							<tr>
								<td>副速度</td>
								<td>
									${register.fusudu}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;m/s
								</td>
								<td>驱动形式</td>
								<td>
									${register.qudongxingshi}
								</td>
								<td>驱动主功率</td>
								<td>
									${register.qudongzhugonglv}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kw
								</td>
							</tr>
							<tr>
								<td>电压</td>
								<td>
									${register.dianya}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;v
								</td>
								<td>副功率</td>
								<td>
									${register.fugonglv}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kw
								</td>
								<td>座舱高度</td>
								<td>
									${register.gaodu}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;m
								</td>
							</tr>
							<tr>
								<td>回转直径</td>
								<td>
									${register.huizhuanzhijing}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;m
								</td>
								<td>轨矩</td>
								<td>
									${register.guiju}
								</td>
								<td>轨矩长度</td>
								<td>
									${register.guijuchangdu}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;m
								</td>
							</tr>
							<tr>
								<td>水滑梯高度</td>
								<td>
									${register.shuihuatigaodu}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;m
								</td>
								<td>游乐池水深</td>
								<td>
									${register.youlechishuishen}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;m
								</td>
								<th></th>
								<td></td>
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
								<td>变动主要项目</td>
								<td>
									${register.biandongxiangmu}
								</td>
								<td>设备变动日期</td>
								<td>
									<fmt:formatDate value="${register.biandongriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td>变动承担单位</td>
								<td colspan="3">
									${register.chengdandanwei}
								</td>
								<td>承担单位代码</td>
								<td>
									${register.chengdandanweidaima}
								</td>
							</tr>
						</table>
					 </div>
<!--endprint-->
	</body>
	</html>
