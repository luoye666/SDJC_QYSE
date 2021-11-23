<%@page import="com.stone.para.IConstant"%>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="/c.tld" %>
<%@ taglib prefix="fn" uri="/fn.tld"%>
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
							<td style="width:50%;border: none;text-align: left;">登记类别：${reg.dengjileibie }</td>
						</table>
						<table class="tabjcxx" cellpadding="0" cellspacing="0">
							<tr>
								<td  rowspan="7" style="width: 7%">设备基本情况</td>
								<td style="width: 15%">设备种类</td>
								<td style="width: 35%">${reg.shebeizhonglei}</td>
								<td  colspan="2" style="width: 17%">设备类别</td>
								<td style="width: 26%">${reg.shebeileibie}</td>
							</tr>
							<tr>
								<td >设备品种</td>
								<td >${reg.shebeipinzhong}</td>
								<td  colspan="2">产品名称</td>
								<td >${reg.shebeimingcheng}</td>
							</tr>
							<tr>
								<td >设备代码</td>
								<td >${reg.shebeidaima}</td>
								<td  colspan="2">型号(规格)</td>
								<td >${reg.shebeixinghao}</td>
							</tr>
							<tr>
								<td >设备使用年限</td>
								<td >${reg.shejishiyongnianxian}年</td>
								<td  colspan="2">设计单位名称</td>
								<td >${reg.shejidanwei}</td>
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
								<td  rowspan="8" style="width: 7%">设备使用情况</td>
								<td >使用单位名称</td>
								<td  colspan="4">${reg.shiyongdanwei}</td>
							</tr>
							<tr>
								<td >使用单位地址</td>
								<td  colspan="4">
									${reg.shiyongdanweidizhi}
								</td>
							</tr>
							<tr>
								<td >使用单位统一社会信用代码</td>
								<td >${reg.shiyongdanweidaima}</td>
								<td  colspan="2">邮政编码</td>
								<td >${reg.sydw_youzhengbianma}</td>
							</tr>
							<tr>
								<td >单位内编号</td>
								<td >${reg.neibubianhao}</td>
								<td  colspan="2">设备使用地点</td>
								<td >${reg.shiyongdidian}</td>
							</tr>
							<tr>
								<td >投入使用日期</td>
								<td >
									<c:if test="${!empty reg.touyongriqi_str && empty reg.touyongriqi}">
										${reg.touyongriqi_str}
									</c:if>
									<c:if test="${!empty reg.touyongriqi }">
										<fmt:formatDate value='${reg.touyongriqi}' pattern='yyyy-MM-dd'/>
									</c:if>
								</td>
								<td  colspan="2">单位固定电话</td>
								<td >${reg.sydw_gudingdianhua}</td>
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
								<td  rowspan="4">设备检验情况</td>
								<td >检验机构名称</td>
								<td  colspan="4">${reg.jianyandanwei}</td>
							</tr>
							<tr>
								<td >检验类别</td>
								<td >${reg.jianyanleibie}</td>
								<td  colspan="2">检验报告编号</td>
								<td >${reg.baogaoshubianhao}</td>
							</tr>
							<tr>
								<td >检验日期</td>
								<td >
									<fmt:formatDate value="${reg.jianyanriqi}" pattern="yyyy-MM-dd"/>
								</td>
								<td  colspan="2">检验结论</td>
								<td >${reg.jianyanjielun}</td>
							</tr>
							<tr>
								<td>下次检验日期</td>
								<td colspan="4">
									<fmt:formatDate value="${reg.xiacijianyanriqi}" pattern="yyyy-MM-dd"/>
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
											<td class="smtd" style="width: 15%">${reg.tianbiaorenyuan }</td>
											<td class="smtd" style="width: 15%">日期：</td>
											<td class="smtd" style="width: 20%">
												<fmt:formatDate value="${reg.tianbiaoriqi}" pattern="yyyy-MM-dd"/>
											</td>
											<td class="smtd" style="width: 25%">(使用单位公章)</td>
										</tr>
										<tr>
											<td class="smtd">使用单位安全管理人员：</td>
											<td class="smtd">${reg.anquanguanlirenyuan }</td>
											<td class="smtd">日期：</td>
											<td class="smtd">
												<fmt:formatDate value="${reg.aqglry_riqi}" pattern="yyyy-MM-dd"/>
											</td>
											<td class="smtd">${reg.shiyongdanwei_nyr}</td>
										</tr>
										<tr>
											<td style="height: 30px;"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td  colspan="6">
									<div style="text-align: left;height: 10px;">
									</div>
									<div style="text-align: left;height: 30px;">
										说明：${reg.beizhu}
									</div>
									<table class="shuoming">
										<tr>
											<td class="smtd" style="width: 25%">登记机关登记人员：</td>
											<td class="smtd" style="width: 15%">${reg.zhucedengjirenyuan }</td>
											<td class="smtd" style="width: 20%">日期：</td>
											<td class="smtd" style="width: 20%">
												<fmt:formatDate value="${reg.zhucedengjiriqi}" pattern="yyyy-MM-dd"/>
											</td>
											<td class="smtd" style="width: 20%">（登记机关专用章）</td>
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
					 <c:if test="${reg.shebeileibiedaima == '5100'}">
					 <div>
								<div style="width: 100%; text-align: center; font-size: 15px">
									叉车产品数据表
								</div>
								<br/>
								<table class="tabjcxx">
									<tr>
										<td colspan="2">设备品种（名称）</td>
										<td>${reg.shebeipinzhong}</td>
										<td colspan="2">产品型号</td>
										<td>${reg.shebeixinghao}</td>
									</tr>
									<tr>
										<td colspan="2">设备代码</td>
										<td>${reg.shebeidaima}</td>
										<td colspan="2">产品编号</td>
										<td>${reg.chuchangbianhao}</td>
									</tr>
									<tr>
										<td colspan="2">制造许可证编号</td>
										<td>${reg.zzdw_zigezhengshuhao}</td>
										<td colspan="2">型式试验证书编号</td>
										<td>${reg.xingshishiyanzhengshu}</td>
									</tr>
									<tr>
										<td colspan="2">发动机（电机）编号</td>
										<td>${reg.fadongjibianhao}</td>
										<td colspan="2">车架编号</td>
										<td>${reg.chejiabianhao}</td>
									</tr>
									<tr>
										<td colspan="6">主要参数</td>
									</tr>
									<tr>
										<td colspan="2">额定起重量</td>
										<td>${reg.edingqizhongliang}kg</td>
										<td colspan="2">载荷中心距</td>
										<td>${reg.zaihezhongxinju}mm</td>
									</tr>
									<tr>
										<td colspan="2">自重</td>
										<td>${reg.zizhong}kg</td>
										<td colspan="2">动力方式</td>
										<td>${reg.donglifangshi}</td>
									</tr>
									<tr>
										<td colspan="2">系统电压</td>
										<td>${reg.xitongdianya}V</td>
										<td colspan="2">发动机（电机）额定功率</td>
										<td>${reg.fadongjiedinggonglv}kW</td>
									</tr>
									<tr>
										<td rowspan="2">最大运行速度（km/h）</td>
										<td >空载</td>
										<td>${reg.yxsd_kongzai}</td>
										<td rowspan="2">防爆</td>
										<td >等级</td>
										<td>${reg.dengji}</td>
									</tr>
									<tr>
										<td >额定起重量</td>
										<td>${reg.yxsd_edingqizhongliang}</td>
										<td >防爆使用场所</td>
										<td>${reg.fangbaoshiyongchangsuo}</td>
									</tr>
									<tr>
										<td colspan="6">工作装置主要特征和参数</td>
									</tr>
									<tr>
										<td colspan="2">门架形式</td>
										<td>${reg.menjiaxingshi}</td>
										<td colspan="2">空载最大起升高度</td>
										<td>${reg.qishenggaodu}mm</td>
									</tr>
									<tr>
										<td colspan="2" rowspan="2">（全）自由起升高度</td>
										<td rowspan="2">${reg.ziyougaodu}mm</td>
										<td rowspan="2">门架倾角(°)</td>
										<td>前</td>
										<td>${reg.menjiaqingjiao_qian}mm</td>
									</tr>
									<tr>
										<td>后</td>
										<td>${reg.menjiaqingjiao_hou}mm</td>
									</tr>
									<tr>
										<td rowspan="2">最大起升速度（mm/s)</td>
										<td >空载</td>
										<td>${reg.qssd_kongzai}</td>
										<td rowspan="2">最大下降速度(mm/s)</td>
										<td >空载</td>
										<td>${reg.xjsd_kongzai}</td>
									</tr>
									<tr>
										<td >额定起重量</td>
										<td>${reg.qssd_edingqizhongliang}</td>
										<td >额定起重量</td>
										<td>${reg.xjsd_edingqizhongliang}</td>
									</tr>
								</table>
								<div style="width: 100%;text-align: center;font-size: 15px"><br/>
					   				主要零部件、安全保护和防护装置
					   			</div>
					   			<br/>
					    		<table class="tabjcxx" id="hzb" style="width: 100%">
					    			<tr>
					    				<td style="width: 5%">序号</td>
					    				<td style="width: 5%">名称</td>
					    				<td style="width: 5%">型号规格</td>
					    				<td style="width: 5%">制造单位</td>
					    			</tr>
					    			<c:forEach var="c" items="${fjfjList}" varStatus="i">
					    			<tr>
						    			<td>${c.xinghao}&nbsp;</td>
						    			<td>${c.mingcheng}</td>
						    			<td>${c.guige}</td>
						    			<td>${c.zhizaochangjia}</td>
						    		</tr>
						    		</c:forEach>
						    		<c:if test="${fn:length(fjfjList) <10 }">
						    			<c:forEach varStatus="y" begin="${fn:length(fjfjList)}" end="9">
						    				<tr>
								    			<td>&nbsp;</td>
								    			<td></td>
								    			<td></td>
								    			<td></td>
								    		</tr>
						    			</c:forEach>
						    		</c:if>
					    		</table>
							</div>
					 </c:if>
					 
					 <c:if test="${reg.shebeileibiedaima == '5200'}">
					 <div>
								<div style="width: 100%; text-align: center; font-size: 15px">
									非公路用旅游观光车辆产品数据表
								</div>
								<br/>
								<table class="tabjcxx">
									<tr>
										<td colspan="2">设备品种（名称）</td>
										<td>${reg.shebeipinzhong}</td>
										<td colspan="2">产品型号</td>
										<td>${reg.shebeixinghao}</td>
									</tr>
									<tr>
										<td colspan="2">设备代码</td>
										<td>${reg.shebeidaima}</td>
										<td colspan="2">产品编号</td>
										<td>${reg.chuchangbianhao}</td>
									</tr>
									<tr>
										<td colspan="2">制造许可证编号</td>
										<td>${reg.zzdw_zigezhengshuhao}</td>
										<td colspan="2">型式试验证书编号</td>
										<td>${reg.xingshishiyanzhengshu}</td>
									</tr>
									<tr>
										<td colspan="2">发动机（电机）编号</td>
										<td>${reg.fadongjibianhao}</td>
										<td colspan="2">车架编号</td>
										<td>${reg.chejiabianhao}</td>
									</tr>
									<tr>
										<td colspan="6">主要参数</td>
									</tr>
									<tr>
										<td colspan="2">整机整备质量</td>
										<td>${reg.zhengchezhiliang}kg</td>
										<td colspan="2">额定载客人数</td>
										<td>${reg.edingzaikerenshu}</td>
									</tr>
									<tr>
										<td colspan="2">全长</td>
										<td>${reg.chang}mm</td>
										<td colspan="2">全宽</td>
										<td>${reg.kuan}mm</td>
									</tr>
									<tr>
										<td colspan="2">全高</td>
										<td>${reg.gao}mm</td>
										<td colspan="2">最小离地间隙</td>
										<td>${reg.jianxi}mm</td>
									</tr>
									<tr>
										<td rowspan="2">轴距（mm）</td>
										<td >左</td>
										<td>${reg.zhouju_zuo}</td>
										<td rowspan="2">轮距（mm）</td>
										<td >前</td>
										<td>${reg.lunju_qian}</td>
									</tr>
									<tr>
										<td >右</td>
										<td>${reg.zhouju_you}</td>
										<td >后</td>
										<td>${reg.lunju_hou}</td>
									</tr>
									<tr>
										<td colspan="2">最小外侧转弯半径</td>
										<td>${reg.banjing}mm</td>
										<td colspan="2">最大运行速度</td>
										<td>${reg.sudu}km/h</td>
									</tr>
									<tr>
										<td colspan="2">最大行驶坡度</td>
										<td>${reg.podu}%</td>
										<td colspan="2">制动距离</td>
										<td>${reg.zhidongjuli}m</td>
									</tr>
									<tr>
										<td colspan="2">发动机（电机）额定功率</td>
										<td>${reg.fadongjiedinggonglv}kW</td>
										<td colspan="2">观光列车牵引车头座位数</td>
										<td>${reg.qianyin_zuoweishu}个</td>
									</tr>
									<tr>
										<td colspan="2">观光列车车厢数</td>
										<td>${reg.liechechexiangshu}节</td>
										<td colspan="2">观光列车每节车厢座位数</td>
										<td>${reg.chexiangzuoweishu}个</td>
									</tr>
								</table>
								<div style="width: 100%;text-align: center;font-size: 15px"><br/>
					   				主要零部件、安全保护和防护装置
					   			</div>
					   			<br/>
					    		<table class="tabjcxx" id="hzb" style="width: 100%">
					    			<tr>
					    				<td style="width: 5%">序号</td>
					    				<td style="width: 5%">名称</td>
					    				<td style="width: 5%">型号规格</td>
					    				<td style="width: 5%">制造单位</td>
					    			</tr>
					    			<c:forEach var="c" items="${fjfjList}" varStatus="i">
					    			
					    			<tr>
						    			<td>${c.xinghao}</td>
						    			<td>${c.mingcheng}</td>
						    			<td>${c.guige}</td>
						    			<td>${c.zhizaochangjia}</td>
						    		</tr>
						    		</c:forEach>
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
								<td >厂车牌照编号</td>
								<td >${reg.paizhaobianhao}</td>
							</tr>
							<tr>
								<td >制造日期</td>
								<td >${reg.zhizaoriqi_str}</td>
							</tr>
						</table>
				</div>	
<!--endprint-->
</body>
</html>