<%@page import="com.stone.para.IConstant"%>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="/c.tld" %>
<%@ taglib prefix="fn" uri="/fn.tld" %>
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
.shuoming {
	border-collapse:collapse; 
	text-align:center; 
	margin:0 0 0 0;
	width: 100%;
	border: none;
}
.shuoming td {
	border: none;
}
.zzqk{
	border-collapse:collapse; 
	margin:0 0 0 0;
	width: 100%;
	border: none;
}
.zzqk th{
	padding:0 0 0 0px;
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
					<div class="PageNext">
						<table style="width: 100%">
							<td style="width:50%;border: none;text-align: left;font-size: 11px">登记类别：${register.dengjileibie }</td>
							<td style="width:50%;border: none;font-size: 11px">注册代码：${register.zhucedaima}</td>
						</table>
						<table class="tabjcxx">
							<tr>
								<td rowspan="4">设备基本情况</td>
								<td>设备种类</td>
								<td>起重机械</td>
								<td colspan="2">设备类别</td>
								<td>
									${register.shebeileibie}
					    		</td>
							</tr>
							<tr>
								<td>设备品种</td>
								<td>
									${register.shebeipinzhong}
					    		</td>
								<td colspan="2">设备名称</td>
								<td>
									${register.shebeimingcheng}
								</td>
							</tr>
							<tr>
								<td>设备代码</td>
								<td>
									${register.shebeidaima}
								</td>
								<td colspan="2">设备型号</td>
								<td>
									${register.shebeixinghao}
								</td>
							</tr>
							<tr>
								<td>设备级别</td>
								<td>
									${register.shebeijibie}
								</td>
								<td colspan="2">固定资产值</td>
								<td>
									${register.gudingzichan}万元
								</td>
							</tr>
							<tr>
								<td rowspan="2">设备结构型式</td>
								<td>主体结构型式</td>
								<td>
									${register.jiegouxingshi}
								</td>
								<td colspan="2">防爆型式</td>
								<td>
									${register.fangbaoxingshi}
								</td>
							</tr>
							<tr>
								<td>吊具型式</td>
								<td>
									${register.diaojuxingshi}
								</td>
								<td colspan="2">操作方式</td>
								<td>
									${register.caozuofangshi}
								</td>
							</tr>
							<tr>
								<td rowspan="3">设备主要性能参数</td>
								<td>额定起重量(起重力矩)</td>
								<td>
									${register.edingqizhongliang}${register.edingqizhongliang_dw}
								</td>
								<td colspan="2">跨度</td>
								<td>
									${register.kuadu}m
								</td>
							</tr>
							<tr>
								<td>起升高度</td>
								<td>
									${register.tishenggaodu}m
								</td>
								<td colspan="2">起升速度</td>
								<td>
									${register.yunxingsudu}m/s
								</td>
							</tr>
							<tr>
								<td>工作级别</td>
								<td>
									${register.gongzuojibie}
								</td>
								<td colspan="2">整机总功率</td>
								<td>
									${register.zhengjizonggonglv}kw
								</td>
							</tr>
							<tr>
								<td rowspan="13" style="width: 10%">设备使用情况</td>
								<td>使用单位名称</td>
								<td colspan="4">
									${register.shiyongdanwei}
								</td>
							</tr>
							<tr>
								<td>单位地址</td>
								<td colspan="4">
									${register.shiyongdanweidizhi}
								</td>
							</tr>
							<tr>
								<td>机构代码或信用代码</td>
								<td>
									${register.shiyongdanweidaima}
								</td>
								<td colspan="2">邮政编码</td>
								<td>
									${register.sydw_youzhengbianma}
								</td>
							</tr>
							<tr>
								<td>经济类型</td>
								<td>
									${register.danweixingzhi}
								</td>
								<td colspan="2">所属行业</td>
								<td>
									${register.suoshuhangye}
								</td>
							</tr>
							<tr>
								<td>法定代表人</td>
								<td>
									${register.sydw_fadingdaibiaoren}
								</td>
								<td colspan="2">安全管理部门</td>
								<td>
									${register.anquanguanlibumen}
								</td>
							</tr>
							<tr>
								<td>安全管理人员</td>
								<td>
									${register.anquanguanlirenyuan}
								</td>
								<td colspan="2">联系电话</td>
								<td>
									${register.aqglry_lianxidianhua}
								</td>
							</tr>
							<tr>
								<td>产权单位名称</td>
								<td colspan="4">
									${register.chanquandanwei}
								</td>
							</tr>
							<tr>
								<td>产权单位地址</td>
								<td colspan="4">
									${register.chanquandanweidizhi}
								</td>
							</tr>
							<tr>
								<td>产权单位负责人</td>
								<td>
									${register.cqdw_fuzeren}
								</td>
								<td colspan="2">产权单位联系电话</td>
								<td>
									${register.cqdw_dianhua}
								</td>
							</tr>
							<tr>
								<td>设备用途</td>
								<td>
									${register.shebeiyongtu}
								</td>
								<td colspan="2">单位内编号</td>
								<td>
									${register.neibubianhao}
								</td>
							</tr>
							<tr>
								<td style="width: 18%">单位内使用地点</td>
								<td style="width: 25%">
									${register.shiyongdidian}
								</td>
								<td rowspan="3" style="width: 8%">设备地理信息</td>
								<td style="width: 13%">经度</td>
								<td style="width: 26%">
									${register.jingdu}
								</td>
							</tr>
							<tr>
								<td>投入使用日期</td>
								<td>
									<c:if test="${!empty register.touyongriqi}">
										<fmt:formatDate value="${register.touyongriqi}" pattern="yyyy-MM-dd"/>
									</c:if>
									<c:if test="${empty register.touyongriqi}">
										${register.touyongriqi_str}
									</c:if>
								</td>
								<td>纬度</td>
								<td>
									${register.weidu}
								</td>
							</tr>
							<tr>
								<td>设备布置数量</td>
								<td>
									${register.buzhishuliang}
								</td>
								<td>海拔高度</td>
								<td>
									${register.haibagaodu}
								</td>
							</tr>
							<tr>
								<td rowspan="8">设备制造与监检情况</td>
								<td>制造单位名称</td>
								<td colspan="4">
									${register.zhizaodanwei}
								</td>
							</tr>
							<tr>
								<td>机构代码或信用代码</td>
								<td>
									${register.zhizaodanweidaima}
								</td>
								<td colspan="2">制造许可证编号</td>
								<td>
									${register.zzdw_zigezhengshuhao}
								</td>
							</tr>
							<tr>
								<td>产品编号</td>
								<td>
									${register.chuchangbianhao}
								</td>
								<td colspan="2">制造日期</td>
								<td>
									<c:if test="${!empty register.zhizaoriqi}">
										<fmt:formatDate value="${register.zhizaoriqi}" pattern="yyyy-MM-dd"/>
									</c:if>
									<c:if test="${empty register.zhizaoriqi}">
										${register.zhizaoriqi_str}
									</c:if>
								</td>
							</tr>
							<tr>
								<td>质量证明书编号</td>
								<td>
									${register.chanpinhegezhengbianhao}
								</td>
								<td colspan="2"></td>
								<td>
								</td>
							</tr>
							<tr>
								<td>制造监检机构</td>
								<td colspan="4">
									${register.zhizaojianjianjigou}
								</td>
							</tr>
							<tr>
								<td>核准证编号</td>
								<td>
									${register.jianjianjigouhezhunzheng}
								</td>
								<td colspan="2">监检证书编号</td>
								<td>
									${register.zhizaojianjianzhengshu}
								</td>
							</tr>
							<tr>
								<td>型式试验机构</td>
								<td colspan="4">
									${register.xingshishiyanjiegou}
								</td>
							</tr>
							<tr>
								<td>核准证编号</td>
								<td>
									${register.shiyanjiegouhezhunzheng}
								</td>
								<td colspan="2">型式试验证书编号</td>
								<td>
									${register.xingshishiyanzhengshu}
								</td>
							</tr>
							<tr>
								<td rowspan="4">设备施工情况</td>
								<td>施工单位</td>
								<td colspan="4">
									${register.anzhuangdanwei}
								</td>
							</tr>
							<tr>
								<td>机构代码或信用代码</td>
								<td>
									${register.anzhuangdanweidaima}
								</td>
								<td colspan="2"></td>
								<td>
								</td>
							</tr>
							<tr>
								<td>施工类别</td>
								<td>
									${register.shigongleibie}
								</td>
								<td colspan="2">施工许可证编号</td>
								<td>
									${register.azdw_zigezhengshubianhao}
								</td>
							</tr>
							<tr>
								<td>施工告知日期</td>
								<td>
									<fmt:formatDate value="${register.shigongriqi}" pattern="yyyy-MM-dd"/>
								</td>
								<td colspan="2">施工竣工日期</td>
								<td>
									<fmt:formatDate value="${register.jungongriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td rowspan="2">设备维护保养情况</td>
								<td>维护保养单位</td>
								<td colspan="4">
									${register.weibaodanwei}
								</td>
							</tr>
							<tr>
								<td>机构代码或信用代码</td>
								<td>
									${register.weibaodanweidaima}
								</td>
								<td colspan="2">维护保养形式</td>
								<td>
									${register.weibaoxingshi}
								</td>
							</tr>
							<tr>
								<td>设备主要安全保护装置情况</td>
								<td colspan="5" style="padding: 0 0 0 0px;border: none;">
									<table class="zzqk">
										<tr>
							    			<td style="width: 20%;border-top: none;border-left: none;">品种(名称)</td>
							    			<td style="width: 20%;border-top: none">型号</td>
							    			<td style="width: 20%;border-top: none">规格</td>
							    			<td style="width: 10%;border-top: none">数量</td>
							    			<td style="width: 30%;border-top: none;">制造单位</td>
										</tr>
										<c:forEach items="${fjList}" var="f" varStatus="i" end="5">
											<tr>
												<td style="border-left: none;">${f.mingcheng}</td>
												<td>${f.xinghao}</td>
												<td>${f.guige}</td>
												<td>${f.shuliang}</td>
												<td>${f.zhizaochangjia}</td>
											</tr>
										</c:forEach>
										<c:if test="${fn:length(fjList)<5}">
											<c:forEach begin="1" end="${5-fn:length(fjList)}">
												<tr>
													<td style="border-left: none;">&nbsp;</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
											</c:forEach>
										</c:if>
									</table>
								</td>
							</tr>
							</table>
				</div>
					<div>
						<table class="tabjcxx">
							<tr>
								<td rowspan="2">设备运行情况</td>
								<td>工作环境</td>
								<td>
									${register.gongzuohuanjing}
								</td>
								<td colspan="2">运行方式</td>
								<td >
									${register.yunxingfangshi}
								</td>
							</tr>
							<tr>
								<td>运行操作形式</td>
								<td>
									${register.yunxingcaozuoxingshi}
								</td>
								<td colspan="2"></td>
								<td>
								</td>
							</tr>
							<tr>
								<td rowspan="4">设备保险情况</td>
								<td>保险机构</td>
								<td colspan="4">
									${register.baoxianjigou}
								</td>
							</tr>
							<tr>
								<td>机构代码或信用代码</td>
								<td>
									${register.baoxianjigoudaima}
								</td>
								<td colspan="2">保险险种</td>
								<td>
									${register.baoxianpinzhong}
								</td>
							</tr>
							<tr>
								<td>保险价值</td>
								<td>
									${register.baoxianjiazhi}万元
								</td>
								<td colspan="2">保险费</td>
								<td>
									${register.baoxianfei}万元
								</td>
							</tr>
							<tr>
								<td>保险金额</td>
								<td>
									${register.baoxianjine}万元
								</td>
								<td colspan="2"></td>
								<td></td>
							</tr>
							<tr>
								<td rowspan="4" style="width: 10%">设备变更情况</td>
								<td style="width: 17%">变更项目</td>
								<td style="width: 23%">变更方式</td>
								<td colspan="2" style="width: 15%">变更原因</td>
								<td style="width: 25%">变更日期</td>
							</tr>
							<tr>
								<td>
									${register.biandongxiangmu}&nbsp;
								</td>
								<td>
									${register.biandongfangshi}
								</td>
								<td colspan="2">
									${register.biandongyuanyin}
								</td>
								<td>
									<fmt:formatDate value="${register.biandongriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
								<td>
									${register.biandongxiangmu_2}&nbsp;
								</td>
								<td>
									${register.biandongfangshi_2}
								</td>
								<td colspan="2">
									${register.biandongyuanyin_2}
								</td>
								<td>
									<fmt:formatDate value="${register.biandongriqi_2}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td>
									${register.biandongxiangmu_3}&nbsp;
								</td>
								<td>
									${register.biandongfangshi_3}
								</td>
								<td colspan="2">
									${register.biandongyuanyin_3}
								</td>
								<td>
									<fmt:formatDate value="${register.biandongriqi_3}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td rowspan="4">设备检验情况</td>
								<td>检验机构名称</td>
								<td colspan="4">
									${register.jianyandanwei}
								</td>
							</tr>
							<tr>
								<td>机构组织代码</td>
								<td>
									${register.jianyandanweidaima}
								</td>
								<td colspan="2">检验类别</td>
								<td>
									${register.jianyanleibie}
								</td>
							</tr>
							<tr>
								<td>检验日期</td>
								<td>
									<fmt:formatDate value="${register.jianyanriqi}" pattern="yyyy-MM-dd"/>
								</td>
								<td colspan="2">检验结论</td>
								<td>
									${register.jianyanjielun}
								</td>
							</tr>
							<tr>
								<td>检验报告编号</td>
								<td>
									${register.baogaoshubianhao}
								</td>
								<td colspan="2">下次检验日期</td>
								<td>
									<fmt:formatDate value="${register.xiacijianyanriqi}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;">
										说明：${register.shuoming_2}
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">使用单位填表人员：</td>
											<td style="width: 15%">
												${register.tianbiaorenyuan}
											</td>
											<td style="width: 10%">日期：</td>
											<td style="width: 20%">
												<fmt:formatDate value="${register.tianbiaoriqi}" pattern="yyyy-MM-dd"/>
											</td>
											<td style="width: 20%">使用单位(公章)</td>
										</tr>
										<tr>
											<td>使用单位安全管理人员：</td>
											<td>${register.anquanguanlirenyuan}</td>
											<td>日期：</td>
											<td>
												<fmt:formatDate value="${register.aqglry_riqi}" pattern="yyyy-MM-dd"/>
											</td>
											<td>${register.shiyongdanwei_nyr}</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;">
										说明：${register.shuoming}
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">登记机关登记人员：</td>
											<td style="width: 15%">
												${register.dengjirenyuan}
											</td>
											<td style="width: 20%">日期：</td>
											<td style="width: 20%">
												<fmt:formatDate value="${register.zhucedengjiriqi}" pattern="yyyy-MM-dd"/>
											</td>
											<td style="width: 20%">登记机关（专用章）</td>
										</tr>
										<tr>
											<td colspan="4"></td>
											<td>${register.dengjijiguan_nyr}</td>
										</tr>
										<tr>
											<td colspan="2">使用登记证编号：</td>
											<td colspan="3" style="text-align: left;">
												${register.shiyongdengjizhenghaoma}
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<tr>
									<td >市：</td>
									<td>${register.shiyongdanweidizhi_shi }</td>
									<td>区县：</td>
									<td>${register.shiyongdanweidizhi_qu }</td>
									<td>乡镇：</td>
									<td>${register.suozaixiangzhen }</td>
								</tr>
							</tr>
						</table>
					 </div>
<!--endprint-->
</body>
</html>
