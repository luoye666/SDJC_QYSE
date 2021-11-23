<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.sys.pojo.TOrgan"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ taglib prefix="c" uri="/c.tld" %>
<%@ taglib prefix="fn" uri="/fn.tld" %>
<%
String path = request.getContextPath();
%>
<!doctype html>
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
	margin:0 0 0 0;
	width: 100%;
}
.tabjcxx td{
	border:1px black solid;
	font-size:12px;
	text-align:center;
	margin:0px; 
	padding:3px 0 3px 0px;
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
		   			<br/>
		   			<div>
						<table style="width: 100%">
							<td style="width:50%;border: none;text-align: left;">登记类别：${reg.dengjileibie }</td>
						</table>
						<table class="tabjcxx">
							<tr>
								<td rowspan="7" style="width: 5%">设备基本情况</td>
								<td style="width: 17%">设备种类</td>
								<td style="width: 30%">${reg.shebeizhonglei}</td>
								<td colspan="2" style="width: 18%">设备类别</td>
								<td style="width: 30%">${reg.shebeileibie}</td>
							</tr>
							<tr>
								<td>设备品种</td>
								<td>${reg.shebeipinzhong}</td>
								<td colspan="2">产品名称</td>
								<td>${reg.shebeimingcheng}</td>
							</tr>
							<tr>
								<td>设备代码</td>
								<td>${reg.shebeidaima}</td>
								<td colspan="2">型号(规格)</td>
								<td>${reg.shebeixinghao}</td>
							</tr>
							<tr>
								<td>设计使用年限</td>
								<td>${reg.shejishiyongnianxian}年</td>
								<td colspan="2">设计单位名称</td>
								<td>${reg.shejidanwei}</td>
							</tr>
							<tr>
								<td>制造单位名称</td>
								<td>${reg.zhizaodanwei}</td>
								<td colspan="2">施工单位名称</td>
								<td>${reg.shigongdanwei}</td>
							</tr>
							<tr>
								<td>监督检验机构名称</td>
								<td>${reg.jianjiandanwei}</td>
								<td colspan="2">型式试验机构名称</td>
								<td>${reg.xingshishiyanjiegou}</td>
							</tr>
							<tr>
								<td>产品编号</td>
								<td>${reg.chuchangbianhao}</td>
								<td colspan="2"></td>
								<td></td>
							</tr>
							<tr>
								<td rowspan="9">设备使用情况</td>
								<td>使用单位名称</td>
								<td colspan="4">${reg.shiyongdanwei}</td>
							</tr>
							<tr>
								<td>使用单位地址</td>
								<td colspan="4">${reg.shiyongdanweidizhi}</td>
							</tr>
							<tr>
								<td>使用单位统一社会信用代码</td>
								<td>${reg.shiyongdanweidaima}</td>
								<td colspan="2">邮政编码</td>
								<td>${reg.sydw_youzhengbianma}</td>
							</tr>
							<tr>
								<td>单位内编号</td>
								<td>${reg.neibubianhao}</td>
								<td colspan="2">设备使用地点</td>
								<td>${reg.shiyongdidian}</td>
							</tr>
							<tr>
								<td>投入使用日期</td>
								<td>
									<c:if test="${!empty reg.touyongriqi_str && empty reg.touyongriqi}">
										${reg.touyongriqi_str}
									</c:if>
									<c:if test="${!empty reg.touyongriqi }">
										<fmt:formatDate value='${reg.touyongriqi}' pattern='yyyy-MM-dd'/>
									</c:if>
								</td>
								<td colspan="2">单位固定电话</td>
								<td>${reg.sydw_gudingdianhua}</td>
							</tr>
							<tr>
								<td>安全管理人员</td>
								<td>${reg.anquanguanlirenyuan}</td>
								<td colspan="2">移动电话</td>
								<td>${reg.aqglry_lianxidianhua}</td>
							</tr>
							<tr>
								<td>产权单位名称</td>
								<td colspan="4">${reg.chanquandanwei}</td>
							</tr>
							<tr>
								<td>产权单位统一社会</br>信用代码</td>
								<td>${reg.chanquandanweidaima}</td>
								<td colspan="2">联系电话</td>
								<td>${reg.cqdw_dianhua}</td>
							</tr>
							<tr>
								<td>维保单位</td>
								<td>${reg.weibaodanwei}</td>
								<td colspan="2">联系电话</td>
								<td>${reg.weibaofuzerendianhua}</td>
							</tr>
							<tr>
								<td rowspan="4">设备检验情况</td>
								<td>检验机构名称</td>
								<td colspan="4">${reg.jianyandanwei}</td>
							</tr>
							<tr>
								<td>检验类别</td>
								<td>${reg.jianyanleibie}</td>
								<td>检验报告编号</td>
								<td colspan="2">${reg.baogaoshubianhao}</td>
							</tr>
							<tr>
								<td>检验日期</td>
								<td><fmt:formatDate value="${reg.jianyanriqi}" pattern="yyyy-MM-dd"/></td>
								<td colspan="2">检验结论</td>
								<td>${reg.jianyanjielun}</td>
							</tr>
							<tr>
								<td>下次检验日期</td>
								<td><fmt:formatDate value='${reg.xiacijianyanriqi}' pattern='yyyy-MM-dd'/></td>
								<td colspan="2"></td>
								<td>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;">
										    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在此申明：所申报的内容真实；在使用过程中，将严格执行《中华人民共和国特种设备安全法》及相关规定，并且接受特种设备安全监督管理部门的监督管理。
									</div>
									<div style="text-align: left;">
										 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;附：含产品数据表
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">使用单位填表人员：</td>
											<td style="width: 15%">${reg.tianbiaorenyuan}</td>
											<td style="width: 10%">日期：</td>
											<td style="width: 20%"><fmt:formatDate value='${reg.tianbiaoriqi}' pattern='yyyy-MM-dd'/></td>
											<td style="width: 20%">(使用单位公章)</td>
										</tr>
										<tr>
											<td>使用单位安全管理人员：</td>
											<td>${reg.anquanguanlirenyuan}</td>
											<td>日期：</td>
											<td><fmt:formatDate value='${reg.aqglry_riqi}' pattern='yyyy-MM-dd'/></td>
											<td>${reg.shiyongdanwei_nyr}</td>
										</tr>
										<tr>
											<td style="height: 30px;"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;height: 10px;">
									</div>
									<div style="text-align: left;height: 30px;">
										说明：${reg.beizhu}
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">登记机关登记人员：</td>
											<td style="width: 20%">${reg.zhucedengjirenyuan}</td>
											<td style="width: 15%">日期：</td>
											<td style="width: 20%"><fmt:formatDate value='${reg.zhucedengjiriqi}' pattern='yyyy-MM-dd'/></td>
											<td style="width: 20%">（登记机关专用章）</td>
										</tr>
										<tr>
											<td>使用登记证编号：</td>
											<td>${reg.shiyongdengjizhenghaoma}</td>
											<td>登记机关：</td>
											<td>${reg.zhucedengjijigou}</td>
											<td>${reg.dengjijiguan_nyr}</td>
										</tr>
										<tr>
											<td style="height: 20px;"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
				</div>
				
		   		<div class="PageNext"></div>
				<div>
				<div style="width: 100%; text-align: center; font-size: 15px">
		   		<c:if test="${reg.shebeileibiedaima == '4100'}">
					桥式起重机产品数据表
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4200'}">
					门式起重机产品数据表
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4300'}">
					塔式起重机产品数据表
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4400'}">
					流动式起重机产品数据表
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4700'}">
					门座式起重机产品数据表
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4800'}">
					升降机产品数据表
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4900'}">
					缆索式起重机产品数据表
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4A00'}">
					桅杆式起重机产品数据表
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4D00'}">
					机械式停车设备产品数据表
		   		</c:if>
				</div>
								<div style="text-align: right;width: 100%">
									编号：${reg.bianhao}
								</div>
								<table class="tabjcxx">
									<tr>
										<td style="width: 25%">产品品种</td>
										<td style="width: 25%">${reg.shebeipinzhong}</td>
										<td style="width: 25%">产品总图图号</td>
										<td style="width: 25%">${reg.chanpintuhao}</td>
									</tr>
									<tr>
										<td>整机制造标准</td>
										<td>${reg.zhizaobiaozhun}</td>
										<td>设计使用年限</td>
										<td>${reg.shejishiyongnianxian}年</td>
									</tr>
									<tr>
										<td>型式试验机构</td>
										<td colspan="3">${reg.xingshishiyanjiegou}</td>
									</tr>
									<tr>
										<td>型式试验日期</td>
										<td>${reg.xingshishiyanriqi}</td>
										<td>型式试验证书编号</td>
										<td>${reg.xingshishiyanzhengshu}</td>
									</tr>
								</table>
					</div>
					
		   		<c:if test="${reg.shebeileibiedaima == '4100'}">
					<div>
								<table class="tabjcxx">
									<tr>
										<td colspan="4" style="border-top: none;">主要参数和用途</td>
									</tr>
									<tr>
										<td style="width: 25%">额定起重量</td>
										<td style="width: 25%">${reg.edingqizhongliang}t</td>
										<td style="width: 25%">起升速度</td>
										<td style="width: 25%">${reg.sudu}m/min</td>
									</tr>
									<tr>
										<td>起升高度</td>
										<td>${reg.qishenggaodu}m</td>
										<td>大车运行速度</td>
										<td>${reg.dachejiju}m/min</td>
									</tr>
									<tr>
										<td>小车运行速度</td>
										<td>${reg.xiaocheguiju}m/min</td>
										<td>跨度</td>
										<td>${reg.kuadu}m</td>
									</tr>
									<tr>
										<td>工作级别</td>
										<td>${reg.gongzuojibie}</td>
										<td>整机功率</td>
										<td>${reg.zhengjizonggonglv}kW</td>
									</tr>
									<tr>
										<td>整机设计重量</td>
										<td>${reg.zhengjizhongliang}t</td>
										<td>工作环境温度</td>
										<td>${reg.gongzuowendu}</td>
									</tr>
									<tr>
										<td colspan="4">主要结构型式</td>
									</tr>
									<tr>
										<td>主梁型式</td>
										<td colspan="3">${reg.zhuliangxingshi}</td>
									</tr>
									<tr>
										<td>主要受力结构件材料</td>
										<td colspan="3">${reg.jiegoujiancailiao}</td>
									</tr>
								</table>
							</div>
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4200'}">
							<div>
								<table class="tabjcxx">
									<tr>
										<td colspan="4" style="border-top: none;">主要参数和用途</td>
									</tr>
									<tr>
										<td style="width: 25%">额定起重量</td>
										<td style="width: 25%">${reg.edingqizhongliang}t</td>
										<td style="width: 25%">跨度/有效悬臂长</td>
										<td style="width: 25%">${reg.kuadu}/${reg.xuanbichang}m</td>
									</tr>
									<tr>
										<td>整机工作级别</td>
										<td>${reg.gongzuojibie}</td>
										<td>起升高度/下降深度</td>
										<td>${reg.qishenggaodu}/${reg.xiajiangshendu}m</td>
									</tr>
									<tr>
										<td>大车基距</td>
										<td>${reg.dachejiju}m</td>
										<td>小车轨距</td>
										<td>${reg.xiaocheguiju}m</td>
									</tr>
									<tr>
										<td>主钩左右极限位置</td>
										<td>${reg.zhugouweizhi}m</td>
										<td>整机功率</td>
										<td>${reg.zhengjizonggonglv}kW</td>
									</tr>
									<tr>
										<td>最大计算轮压</td>
										<td>${reg.zuidalunya}kN</td>
										<td>整机设计重量</td>
										<td>${reg.zhengjizhongliang}t</td>
									</tr>
									<tr>
										<td>供电电源</td>
										<td>${reg.gongdiandianyuan_v}V${reg.gongdiandianyuan_hz}Hz</td>
										<td>工作环境温度</td>
										<td>${reg.gongzuowendu}~${reg.gongzuowendu_sx}℃</td>
									</tr>
									<tr>
										<td>使用场所</td>
										<td colspan="3">${reg.shiyongchanghe}</td>
									</tr>
									<tr>
										<td colspan="4">主要结构型式</td>
									</tr>
									<tr>
										<td>主梁型式</td>
										<td colspan="3">${reg.zhuliangxingshi}</td>
									</tr>
									<tr>
										<td>支腿型式</td>
										<td colspan="3">${reg.zhituixingshi}</td>
									</tr>
									<tr>
										<td>主要受力结构件材料</td>
										<td colspan="3">${reg.jiegoujiancailiao}</td>
									</tr>
								</table>
							</div>
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4300'}">
							<div>
								<table class="tabjcxx">
									<tr>
										<td colspan="4" style="border-top: none;">主要参数和用途</td>
									</tr>
									<tr>
										<td style="width: 25%">额定起重力矩</td>
										<td style="width: 25%">${reg.edingqizhongliju}t•m</td>
										<td style="width: 25%">最大起重力矩</td>
										<td style="width: 25%">${reg.zuidaqizhongliju}t•m</td>
									</tr>
									<tr>
										<td>整机工作级别</td>
										<td>${reg.gongzuojibie}</td>
										<td>最大起升高度</td>
										<td>${reg.qishenggaodu}m</td>
									</tr>
									<tr>
										<td>最小/最大工作幅度</td>
										<td>${reg.zuixiao_gongzuofudu}/${reg.zuida_gongzuofudu}m</td>
										<td>最小/最大工作幅度对应的起重量</td>
										<td>${reg.zuixiao_gongzuofudu_qzl}/${reg.zuida_gongzuofudu_qzl}t</td>
									</tr>
									<tr>
										<td>独立高度</td>
										<td>${reg.gaodu}m</td>
										<td>最大附着高度</td>
										<td>${reg.fuzhegaodu}m</td>
									</tr>
									<tr>
										<td>最大计算轮压</td>
										<td>${reg.zuidalunya}kN</td>
										<td>整机设计重量</td>
										<td>${reg.zhengjizhongliang}t</td>
									</tr>
									<tr>
										<td>运行轨距</td>
										<td>${reg.guiju}m</td>
										<td>整机功率</td>
										<td>${reg.zhengjizonggonglv}kW</td>
									</tr>
									<tr>
										<td>供电电源</td>
										<td>${reg.gongdiandianyuan_v}V${reg.gongdiandianyuan_hz}Hz</td>
										<td>工作环境温度</td>
										<td>${reg.gongzuowendu}~${reg.gongzuowendu_sx}℃</td>
									</tr>
									<tr>
										<td colspan="4">主要结构型式</td>
									</tr>
									<tr>
										<td>主体结构型式</td>
										<td colspan="3">${reg.jiegouxingshi}</td>
									</tr>
									<tr>
										<td>主要受力结构件材料</td>
										<td colspan="3">${reg.jiegoujiancailiao}</td>
									</tr>
									<tr>
										<td>变幅方式</td>
										<td colspan="3">${reg.bianfufangshi}</td>
									</tr>
									<tr>
										<td>塔身标准节型式</td>
										<td>${reg.biaozhunjiexingshi}</td>
										<td>基座型式</td>
										<td>${reg.jizuoxingshi}</td>
									</tr>
								</table>
							</div>
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4400'}">
							<div>
								<table class="tabjcxx">
									<tr>
										<td colspan="4" style="border-top: none;">主要参数和用途</td>
									</tr>
									<tr>
										<td style="width: 25%">额定起重量</td>
										<td style="width: 25%">${reg.edingqizhongliang}t</td>
										<td style="width: 25%">额定起重力矩</td>
										<td style="width: 25%">${reg.edingqizhongliju}t•m</td>
									</tr>
									<tr>
										<td>整机工作级别</td>
										<td>${reg.gongzuojibie}</td>
										<td>最大起升高度</td>
										<td>${reg.qishenggaodu}m</td>
									</tr>
									<tr>
										<td>最小/最大工作幅度</td>
										<td>${reg.zuixiao_gongzuofudu}/${reg.zuida_gongzuofudu}m
										</td>
										<td>最小/最大工作幅度对应的起重量</td>
										<td>${reg.zuixiao_gongzuofudu_qzl}/${reg.zuida_gongzuofudu_qzl}t</td>
									</tr>
									<tr>
										<td>全程变幅时间</td>
										<td>${reg.bianfushijian}s</td>
										<td>行走机械轨距</td>
										<td>${reg.guiju}m</td>
									</tr>
									<tr>
										<td>行驶速度</td>
										<td>${reg.yidongsudu}m/min</td>
										<td>支腿调节长度</td>
										<td>${reg.zhituitiaojiechangdu}mm</td>
									</tr>
									<tr>
										<td>最大计算轮压</td>
										<td>${reg.zuidalunya}kN</td>
										<td>整机设计重量</td>
										<td>${reg.zhengjizhongliang}t</td>
									</tr>
									<tr>
										<td>整机功率</td>
										<td>${reg.zhengjizonggonglv}kW</td>
										<td>工作环境温度</td>
										<td>${reg.gongzuowendu}~${reg.gongzuowendu_sx}℃</td>
									</tr>
									<tr>
										<td>发动机型号/ VIN代号/编号</td>
										<td colspan="3">${reg.vinma}</td>
									</tr>
									<tr>
										<td colspan="4">主要结构型式</td>
									</tr>
									<tr>
										<td>臂架型式</td>
										<td colspan="3">${reg.bijiaxingshi}</td>
									</tr>
									<tr>
										<td>主要受力结构件材料</td>
										<td colspan="3">${reg.jiegoujiancailiao}</td>
									</tr>
								</table>
							</div>
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4700'}">
							<div>
								<table class="tabjcxx">
									<tr>
										<td colspan="4" style="border-top: none;">主要参数和用途</td>
									</tr>
									<tr>
										<td style="width: 25%">额定起重力矩</td>
										<td style="width: 25%">${reg.edingqizhongliju}t•m</td>
										<td style="width: 25%">最大起重力矩</td>
										<td style="width: 25%">${reg.zuidaqizhongliju}t•m</td>
									</tr>
									<tr>
										<td>整机工作级别</td>
										<td>${reg.gongzuojibie}</td>
										<td>起升高度(轨上/轨下)</td>
										<td>${reg.qishenggaodu}m</td>
									</tr>
									<tr>
										<td>最小/最大工作幅度</td>
										<td>${reg.zuixiao_gongzuofudu}/${reg.zuida_gongzuofudu}m</td>
										<td>最小/最大工作幅度对应的起重量</td>
										<td>${reg.zuixiao_gongzuofudu_qzl}/${reg.zuida_gongzuofudu_qzl}t</td>
									</tr>
									<tr>
										<td>整机最大高度</td>
										<td>${reg.gaodu}m</td>
										<td>全程变幅时间</td>
										<td>${reg.bianfushijian}m/min</td>
									</tr>
									<tr>
										<td>行走机械轨距</td>
										<td>${reg.guiju}m</td>
										<td>支腿调节长度</td>
										<td>${reg.zhituitiaojiechangdu}mm</td>
									</tr>
									<tr>
										<td>最大计算轮压</td>
										<td>${reg.zuidalunya}kN</td>
										<td>整机设计重量</td>
										<td>${reg.zhengjizhongliang}t</td>
									</tr>
									<tr>
										<td>供电电源</td>
										<td>${reg.gongdiandianyuan_v}V${reg.gongdiandianyuan_hz}Hz</td>
										<td>整机功率</td>
										<td>${reg.zhengjizonggonglv}kW</td>
									</tr>
									<tr>
										<td>工作环境温度</td>
										<td>${reg.gongzuowendu}~${reg.gongzuowendu_sx}℃</td>
										<td>用  途</td>
										<td>${reg.yongtu}</td>
									</tr>
									<tr>
										<td colspan="4">主要结构型式</td>
									</tr>
									<tr>
										<td>臂架结构型式</td>
										<td colspan="3">${reg.bijiajiegouxingshi}</td>
									</tr>
									<tr>
										<td>门架结构型式</td>
										<td>${reg.menjiaxingshi}</td>
										<td>回转支承型式</td>
										<td>${reg.huizhuanxingshi}</td>
									</tr>
									<tr>
										<td>主要受力结构件材料</td>
										<td colspan="3">${reg.jiegoujiancailiao}</td>
									</tr>
								</table>
							</div>
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4800'}">
							<div>
								<table class="tabjcxx">
									<tr>
										<td colspan="4" style="border-top: none;">主要参数和用途</td>
									</tr>
									<tr>
										<td style="width: 25%">额定载重量</td>
										<td style="width: 25%">${reg.edingqizhongliang}t</td>
										<td style="width: 25%">额定速度</td>
										<td style="width: 25%">${reg.sudu}m/min</td>
									</tr>
									<tr>
										<td>整机工作级别</td>
										<td>${reg.gongzuojibie}</td>
										<td>自由端高度</td>
										<td>${reg.gaodu}m</td>
									</tr>
									<tr>
										<td>最大提升高度</td>
										<td>${reg.qishenggaodu}m</td>
										<td>整机设计重量</td>
										<td>${reg.zhengjizhongliang}t</td>
									</tr>
									<tr>
										<td>吊笼工作行程</td>
										<td>${reg.diaolonggongzuoxingcheng}m</td>
										<td>整机功率</td>
										<td>${reg.zhengjizonggonglv}kW</td>
									</tr>
									<tr>
										<td>吊笼尺寸(长×宽×高)</td>
										<td colspan="3">${reg.diaolongchicun}mm</td>
									</tr>
									<tr>
										<td>标准节尺寸(长×宽×高)</td>
										<td colspan="3">${reg.biaozhunjiechicun}mm</td>
									</tr>
									<tr>
										<td>供电电源</td>
										<td>${reg.gongdiandianyuan_v}V${reg.gongdiandianyuan_hz}Hz</td>
										<td>工作环境温度</td>
										<td>${reg.gongzuowendu}~${reg.gongzuowendu_sx}℃</td>
									</tr>
									<tr>
										<td>操纵方式</td>
										<td>${reg.caozuofangshi}</td>
										<td>用  途</td>
										<td>${reg.yongtu}</td>
									</tr>
									<tr>
										<td colspan="4">主要结构型式</td>
									</tr>
									<tr>
										<td>驱动机构型式</td>
										<td colspan="3">${reg.qudongjigouxingshi}</td>
									</tr>
									<tr>
										<td>吊笼数量</td>
										<td>${reg.diaolongshuliang}</td>
										<td>导 轨 架</td>
										<td>${reg.daoguijia}</td>
									</tr>
									<tr>
										<td>标准节加节方式</td>
										<td colspan="3">${reg.biaozhunjiexingshi}</td>
									</tr>
									<tr>
										<td>主要受力结构件材料</td>
										<td colspan="3">${reg.jiegoujiancailiao}</td>
									</tr>
								</table>
							</div>
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4900'}">
							<div>
								<table class="tabjcxx">
									<tr>
										<td colspan="4" style="border-top: none;">主要参数和用途</td>
									</tr>
									<tr>
										<td style="width: 25%">额定起重量</td>
										<td style="width: 25%">${reg.edingqizhongliang}t</td>
										<td style="width: 25%">幅  度</td>
										<td style="width: 25%">${reg.fudu}m</td>
									</tr>
									<tr>
										<td>整机工作级别</td>
										<td>${reg.gongzuojibie}</td>
										<td>吊具最高高度</td>
										<td>${reg.diaojugaodu_zuigao}m</td>
									</tr>
									<tr>
										<td>承载索垂度</td>
										<td>${reg.chengzaisuochuidu}m</td>
										<td>吊具最低高度</td>
										<td>${reg.diaojugaodu_zuidi}m</td>
									</tr>
									<tr>
										<td>承载索型号</td>
										<td>${reg.chengzaisuoxinghao}</td>
										<td>牵引索型号</td>
										<td>${reg.qianyinsuoxinghao}</td>
									</tr>
									<tr>
										<td>安装高程</td>
										<td>${reg.anzhuanggaocheng}m</td>
										<td>垂跨比</td>
										<td>${reg.chuikuabi}％</td>
									</tr>
									<tr>
										<td>回转范围</td>
										<td>${reg.huizhuanfanwei}m</td>
										<td>整机设计重量</td>
										<td>${reg.zhengjizhongliang}t</td>
									</tr>
									<tr>
										<td>整机功率</td>
										<td>${reg.zhengjizonggonglv}kW</td>
										<td>供电电源</td>
										<td>${reg.gongdiandianyuan_v}V${reg.gongdiandianyuan_hz}Hz</td>
									</tr>
									<tr>
										<td>工作环境温度</td>
										<td>${reg.gongzuowendu}~${reg.gongzuowendu_sx}℃</td>
										<td>其它</td>
										<td>${reg.qita}</td>
									</tr>
									<tr>
										<td colspan="4">主要结构型式</td>
									</tr>
									<tr>
										<td>主体结构型式</td>
										<td colspan="3">${reg.jiegouxingshi}</td>
									</tr>
									<tr>
										<td>主要受力结构件材料</td>
										<td colspan="3">${reg.jiegoujiancailiao}</td>
									</tr>
								</table>
							</div>
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4A00'}">
							<div>
								<table class="tabjcxx">
									<tr>
										<td colspan="4" style="border-top: none;">主要参数和用途</td>
									</tr>
									<tr>
										<td style="width: 25%">主钩最大额定起重量</td>
										<td style="width: 25%">${reg.zg_edingqizhongliang}t</td>
										<td style="width: 25%">副钩最大额定起重量</td>
										<td style="width: 25%">${reg.fg_edingqizhongliang}t</td>
									</tr>
									<tr>
										<td>主钩最大工作幅度</td>
										<td>${reg.zg_gongzuofudu}m</td>
										<td>副钩最大工作幅度</td>
										<td>${reg.fg_gongzuofudu}m</td>
									</tr>
									<tr>
										<td>主钩最大工作幅度时的额定起重量</td>
										<td>${reg.zg_gongzuofudu_qzl}t</td>
										<td>副钩最大工作幅度时的额定起重量</td>
										<td>${reg.fg_gongzuofudu_qzl}t</td>
									</tr>
									<tr>
										<td>主钩最大起升高度</td>
										<td>${reg.zg_qishenggaodu}m</td>
										<td>副钩最大起升高度</td>
										<td>${reg.fg_qishenggaodu}m</td>
									</tr>
									<tr>
										<td>主钩起升速度</td>
										<td>${reg.zg_qishengsudu}m/min</td>
										<td>副钩起升速度</td>
										<td>${reg.fg_qishengsudu}m/min</td>
									</tr>
									<tr>
										<td>回转角度</td>
										<td>${reg.huizhuanjiaodu}°</td>
										<td>行走范围</td>
										<td>${reg.xingzoufanwei}m</td>
									</tr>
									<tr>
										<td>行走速度</td>
										<td>${reg.yidongsudu}m/min</td>
										<td>主调速方式</td>
										<td>${reg.tiaosufangshi}</td>
									</tr>
									<tr>
										<td>整机工作级别</td>
										<td>${reg.gongzuojibie}</td>
										<td>整机设计重量</td>
										<td>${reg.zhengjizhongliang}t</td>
									</tr>
									<tr>
										<td>整机功率</td>
										<td>${reg.zhengjizonggonglv}kW</td>
										<td>供电电源</td>
										<td>${reg.gongdiandianyuan_v}V${reg.gongdiandianyuan_hz}Hz</td>
									</tr>
									<tr>
										<td>工作环境温度</td>
										<td>${reg.gongzuowendu}~${reg.gongzuowendu_sx}℃</td>
										<td>其它</td>
										<td>${reg.qita}</td>
									</tr>
									<tr>
										<td colspan="4">主要结构型式</td>
									</tr>
									<tr>
										<td>主体结构型式</td>
										<td colspan="3">${reg.jiegouxingshi}</td>
									</tr>
									<tr>
										<td>主要受力结构件材料</td>
										<td colspan="3">${reg.jiegoujiancailiao}</td>
									</tr>
								</table>
							</div>
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '4D00'}">
							<div>
								<table class="tabjcxx">
									<tr>
										<td colspan="4" style="border-top: none;">主要参数和用途</td>
									</tr>
									<tr>
										<td style="width: 25%">层  数</td>
										<td style="width: 25%">${reg.ceng}</td>
										<td style="width: 25%">存容量</td>
										<td style="width: 25%">${reg.cunrongliang}</td>
									</tr>
									<tr>
										<td>适停车辆质量</td>
										<td>${reg.shitingcheliang_zl}kg</td>
										<td>起升驱动方式</td>
										<td>${reg.qudongxingshi}</td>
									</tr>
									<tr>
										<td>适停车辆尺寸(长×宽×高)</td>
										<td colspan="3">${reg.shitingcheliang_cc}</td>
									</tr>
									<tr>
										<td>额定升降速度</td>
										<td>${reg.sudu}m/min</td>
										<td>额定横移速度</td>
										<td>${reg.yidongsudu}m/min</td>
									</tr>
									<tr>
										<td>单车最大进(出)车时间</td>
										<td>${reg.danchejinchushijian}s</td>
										<td>层高</td>
										<td>${reg.gaodu}mm</td>
									</tr>
									<tr>
										<td>整机功率</td>
										<td>${reg.zhengjizonggonglv}kW</td>
										<td>整机设计重量</td>
										<td>${reg.zhengjizhongliang}t</td>
									</tr>
									<tr>
										<td>供电电源</td>
										<td>${reg.gongdiandianyuan_v}V${reg.gongdiandianyuan_hz}Hz</td>
										<td>工作环境温度</td>
										<td>${reg.gongzuowendu}~${reg.gongzuowendu_sx}℃</td>
									</tr>
									<tr>
										<td>操作方式</td>
										<td>${reg.caozuofangshi}</td>
										<td>其它</td>
										<td>${reg.qita}</td>
									</tr>
									<tr>
										<td colspan="4">主要结构型式</td>
									</tr>
									<tr>
										<td>起升方式</td>
										<td colspan="3">${reg.yunxingfangshi}</td>
									</tr>
									<tr>
										<td>主要受力结构件材料</td>
										<td colspan="3">${reg.jiegoujiancailiao}</td>
									</tr>
								</table>
							</div>
		   		</c:if>
		   		<div>
								<table class="tabjcxx" id="aqbhzz">
									<tr>
										<td colspan="7" style="border-top: none;">
											安全保护装置
										</td>
									</tr>
									<tr>
										<td style="width: 15%">名称</td>
										<td style="width: 15%">产品编号</td>
										<td style="width: 15%">型号规格</td>
										<td style="width: 20%" colspan="2">制造单位</td>
										<td style="width: 15%">制造日期</td>
										<td style="width: 15%">型式试验合格证号</td>
									</tr>
									<c:forEach items="${fjfjList}" var="f" varStatus="i">
									<tr>
										<td>${f.mingcheng}&nbsp;</td>
										<td>${f.chanpinbianhao}</td>
										<td>${f.xinghao}</td>
										<td colspan="2">${f.zhizaochangjia}</td>
										<td>${f.zhizaoriqi}</td>
										<td>${f.hegezhenghao}</td>
									</tr>
									</c:forEach>
									<c:if test="${fn:length(fjfjList) <10 }">
						    			<c:forEach varStatus="y" begin="${fn:length(fjfjList)}" end="9">
						    				<tr>
								    			<td>&nbsp;</td>
								    			<td></td>
								    			<td></td>
								    			<td colspan="2"></td>
								    			<td></td>
								    			<td></td>
								    		</tr>
						    			</c:forEach>
						    		</c:if>
								</table>
								</div>
								
								<div class="PageNext"></div>
		<div style="width: 100%;text-align: center;font-size: 15px;">
		   				<b>补充参数表</b>
		   			</div>
		   			<br/>
		   			<div>
						<table class="tabjcxx">
							<tr>
								<td style="width:30px;">注册代码</td>
								<td style="width:20px;">${reg.zhucedaima}</td>
								<td style="width:30px;">使用单位名称备注</td>
								<td style="width:20px;">${reg.shiyongdanweibeizhu}</td>
							</tr>
							<tr>
								<td >是否在人口密集区</td>
								<td >${reg.renkoumijiqu}</td>
								<td >是否重大危险源</td>
								<td >${reg.zhongdaweixianyuan}</td>
							</tr>
							<tr>
								<td >是否冷库设备</td>
								<td >${reg.lengku}</td>
								<td >制造日期</td>
								<td >${reg.zhizaoriqi_str}</td>
							</tr>
							
						</table>
				</div>	
<!--endprint-->
</body>
</html>