<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.sys.pojo.TOrgan"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ taglib prefix="c" uri="/c.tld" %>
<%@ taglib prefix="fn" uri="/fn.tld"%>
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
	padding:4px 0 4px 0px;
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
								<td>投入使用日期(日期)</td>
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
		   		<c:if test="${reg.shebeileibiedaima != '3300'}">
		   			<div>
								<div style="width: 100%; text-align: center; font-size: 15px">
									电梯产品数据表（自动扶梯与自动人行道除外）
								</div>
								<br/>
								<table class="tabjcxx">
									<tr>
										<td colspan="2">产品品种</td>
										<td>${reg.shebeipinzhong}</td>
										<td>产品名称</td>
										<td>${reg.shebeimingcheng}</td>
									</tr>
									<tr>
										<td colspan="2">出厂编号</td>
										<td>${reg.chuchangbianhao}</td>
										<td>出厂日期</td>
										<td><fmt:formatDate value='${reg.chuchangriqi}' pattern='yyyy-MM-dd'/></td>
									</tr>
									<tr>
										<td colspan="2">产品型号</td>
										<td>${reg.shebeixinghao}</td>
										<td>额定速度</td>
										<td>
											上行：${reg.edingsudu_sx}m/s
											下行：${reg.edingsudu_xx}m/s
										</td>
									</tr>
									<tr>
										<td colspan="2">额定载重量</td>
										<td>${reg.edingzaizhongliang}kg</td>
										<td>轿厢尺寸</td>
										<td>${reg.jiaoxiangchicun}mm</td>
									</tr>
									<tr>
										<td colspan="2">提升高度</td>
										<td>${reg.tishenggaodu}m</td>
										<td>层/站/门数</td>
										<td>${reg.ceng}/${reg.zhan}/${reg.men}</td>
									</tr>
									<tr>
										<td colspan="2">防爆型式</td>
										<td>${reg.fangbaoxingshi}</td>
										<td>防爆等级</td>
										<td>${reg.fangbaodengji}</td>
									</tr>
									<tr>
										<td rowspan="2" style="width: 10%">驱动主机</td>
										<td style="width: 20%">额定功率</td>
										<td style="width: 20%">${reg.qdzj_edinggonglv}kW</td>
										<td style="width: 20%">额定转速</td>
										<td style="width: 30%">${reg.qdzj_edingzhuansu}r/min</td>
									</tr>
									<tr>
										<td>减速比</td>
										<td colspan="3">${reg.qdzj_jiansubi}</td>
									</tr>
									<tr>
										<td>液压泵站</td>
										<td>满载工作压力 (适用于液压驱动电梯)</td>
										<td colspan="3">${reg.yybz_gongzuoyali}MPa</td>
									</tr>
									<tr>
										<td rowspan="2">悬挂系统</td>
										<td>悬挂介质种类</td>
										<td>${reg.xgxt_jiezhizhonglei}</td>
										<td>悬挂介质数量</td>
										<td>${reg.xgxt_jiezhishuliang}</td>
									</tr>
									<tr>
										<td>悬挂介质型号</td>
										<td>${reg.xgxt_jiezhixinghao}</td>
										<td>悬挂介质规格</td>
										<td>${reg.xgxt_jiezhiguige}</td>
									</tr>
									<tr>
										<td colspan="2">名称</td>
										<td>型号</td>
										<td>产品编号</td>
										<td>制造单位</td>
									</tr>
									<c:forEach var="d" items="${fjfjList}" varStatus="i">
									<tr>
										<td colspan="2" style="width: 30%">${d.mingcheng}</td>
										<td style="width: 20%">${d.xinghao}&nbsp;</td>
										<td style="width: 20%">${d.chanpinbianhao}</td>
										<td style="width: 30%">${d.zhizaochangjia}</td>
									</tr>
									</c:forEach>
									<c:if test="${fn:length(fjfjList) <10 }">
						    			<c:forEach varStatus="y" begin="${fn:length(fjfjList)}" end="9">
						    				<tr>
								    			<td colspan="2">&nbsp;</td>
								    			<td></td>
								    			<td></td>
								    			<td></td>
								    		</tr>
						    			</c:forEach>
						    		</c:if>
								</table>
							</div>
		   		</c:if>
		   		<c:if test="${reg.shebeileibiedaima == '3300'}">
							<div>
								<div style="width: 100%; text-align: center; font-size: 15px">
									电梯产品数据表（适用于自动扶梯与自动人行道）
								</div>
								<br/>
								<table class="tabjcxx">
									<tr>
										<td colspan="2">产品品种</td>
										<td>${reg.shebeipinzhong}</td>
										<td>产品名称</td>
										<td>${reg.shebeimingcheng}</td>
									</tr>
									<tr>
										<td colspan="2">名义速度</td>
										<td>${reg.mingyisudu}m/s</td>
										<td>倾斜角</td>
										<td>${reg.qingxiejiaodu}°</td>
									</tr>
									<tr>
										<td colspan="2">名义宽度</td>
										<td>${reg.mingyikuandu}mm</td>
										<td>提升高度或使用区段长度</td>
										<td>${reg.tishenggaodu}m</td>
									</tr>
									<tr>
										<td colspan="2">工作环境</td>
										<td>${reg.gongzuohuanjing}</td>
										<td>工作类型</td>
										<td>${reg.gongzuoleixing}</td>
									</tr>
									<tr>
										<td rowspan="3" style="width: 10%">驱动主机</td>
										<td style="width: 10%">型号</td>
										<td style="width: 30%">${reg.qdzj_xinghao}</td>
										<td style="width: 20%">产品编号</td>
										<td style="width: 30%">${reg.qdzj_chanpinbianhao}</td>
									</tr>
									<tr>
										<td>额定转速</td>
										<td>${reg.qdzj_edingzhuansu}r/min</td>
										<td>额定功率</td>
										<td>${reg.qdzj_edinggonglv}kW</td>
									</tr>
									<tr>
										<td>制造单位</td>
										<td colspan="3">${reg.qdzj_zhizaodanwei}</td>
									</tr>
									<tr>
										<td rowspan="2">控制柜</td>
										<td>型号</td>
										<td>${reg.kzg_xinghao}</td>
										<td>节能运行方式</td>
										<td>${reg.kzg_yunxingfangshi}</td>
									</tr>
									<tr>
										<td>产品编号</td>
										<td>${reg.kzg_chanpinbianhao}</td>
										<td>制造单位</td>
										<td>${reg.kzg_zhizaodanwei}</td>
									</tr>
								</table>
							</div>
		   		</c:if>
		   		
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
								<td >电梯使用场所分类</td>
								<td >${reg.shiyongchanghe}</td>
							</tr>
							<tr>
								<td >制造许可证编号</td>
								<td >${reg.zzdw_zigezhengshuhao}</td>
								<td >制造日期</td>
								<td >${reg.zhizaoriqi_str}</td>
							</tr>
						</table>
				</div>	
<!--endprint-->
</body>
</html>