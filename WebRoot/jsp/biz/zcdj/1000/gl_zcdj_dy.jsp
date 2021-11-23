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
#demo2{
	/*border:1px blue solid;*/
	
	
	position: absolute;
	
	transform-origin: 33% 54%;
	transform:rotate(90deg);
	-webkit-transform-origin:33% 54%;
	
	filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=1)\9;
	transform:rotate(90deg);
	-ms-transform:rotate(90deg); 	/* IE 9 */
	-webkit-transform:rotate(90deg); /* Safari 和 Chrome */
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
							<div >
								<div style="width: 100%; text-align: center; font-size: 15px">
									锅炉产品数据表
								</div>
								<div style="text-align: right;width: 100%">
									编号：${reg.bianhao}
								</div>
								<table class="tabjcxx">
									<tr>
										<td colspan="2">设备类别</td>
										<td >${reg.shebeileibie}</td>
										<td >产品名称</td>
										<td >${reg.shebeimingcheng}</td>
									</tr>
									<tr>
										<td colspan="2">产品型号</td>
										<td >${reg.shebeixinghao}</td>
										<td >产品编号</td>
										<td >${reg.chuchangbianhao}</td>
									</tr>
									<tr>
										<td colspan="2">设备代码</td>
										<td >${reg.shebeidaima}</td>
										<td >设备级别</td>
										<td >${reg.shebeijibie}</td>
									</tr>
									<tr>
										<td rowspan="2">设计情况</td>
										<td >设计文件鉴定日期</td>
										<td >${reg.wenjianjiandingriqi}</td>
										<td >鉴定报告书编号</td>
										<td >${reg.jiandingbaogaobianhao}</td>
									</tr>
									<tr>
										<td >鉴定机构名称</td>
										<td colspan="3">${reg.jiandingjigou}</td>
									</tr>
									<tr>
										<td rowspan="7">主要参数</td>
										<td >额定蒸发量（热功率）</td>
										<td >${reg.edingzhengfaliang}${reg.edingqizhongliang_dw}</td>
										<td >额定工作压力</td>
										<td >${reg.gongzuoyali}MPa</td>
									</tr>
									<tr>
										<td >额定工作温度</td>
										<td >${reg.gongzuowendu}℃</td>
										<td >设计热效率</td>
										<td >${reg.shejireciaolv}%</td>
									</tr>
									<tr>
										<td >给水温度</td>
										<td >${reg.geishuiwendu}℃</td>
										<td >额定出水（油）/回水（油）温度</td>
										<td >${reg.edingchushui}/${reg.huishuiwendu}℃
										</td>
									</tr>
									<tr>
										<td >锅炉本体水（油）容积</td>
										<td >${reg.rongji}L</td>
										<td >整装锅炉本体液压试验介质/压力</td>
										<td >${reg.bentijiezhi}/${reg.bentiyali}MPa
										</td>
									</tr>
									<tr>
										<td >再热器进（出）口温度</td>
										<td >${reg.jinkouwendu}℃</td>
										<td >再热器进（出）口压力</td>
										<td >${reg.chukouyali}MPa</td>
									</tr>
									<tr>
										<td >再热蒸汽流量</td>
										<td >${reg.zhengqiliuliang}t/h</td>
										<td >有机热载体锅炉气密试验介质/压力</td>
										<td >${reg.qimijiezhi}/${reg.qimiyali}MPa</td>
									</tr>
									<tr>
										<td >燃烧方式</td>
										<td >${reg.ranshaofangshi}℃</td>
										<td >燃料（或者热源）种类</td>
										<td >${reg.ranliaozhonglei}MPa</td>
									</tr>
									<tr>
										<td rowspan="2">制造监检情况</td>
										<td >监检机构</td>
										<td colspan="3">${reg.zhizaojianjianjigou}</td>
									</tr>
									<tr>
										<td >机构组织代码</td>
										<td >${reg.jianjiandanweidaima}</td>
										<td >机构核准证编号</td>
										<td >${reg.jianjianjigouhezhunzheng}</td>
									</tr>
								</table>
								<div style="width: 100%;text-align: center;font-size: 15px"><br/>
					   				安全阀数据
					   			</div>
					    		<table class="tabjcxx" id="hzb" style="width: 100%">
					    			<tr>
					    				<td style="width: 5%">型号</td>
					    				<td style="width: 5%">规格</td>
					    				<td style="width: 5%">数量</td>
					    				<td style="width: 5%">制造单位</td>
					    			</tr>
					    			<c:forEach var="g" items="${fjfjList}" varStatus="i">
					    			<tr>
						    			<td>${g.xinghao}&nbsp;</td>
						    			<td>${g.guige}</td>
						    			<td>${g.shuliang}</td>
						    			<td>${g.zhizaochangjia}</td>
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
							
		   		<div class="PageNext"></div>
		   			<div>
					   			<div style="width: 100%;text-align: center;font-size: 15px"><br/>
					   				主要受压部件
					   			</div>
					    		<table class="tabjcxx" id="bj" style="width: 100%">
					    			<tr>
					    				<td rowspan="2" style="width: 5%">主要受压部件</td>
					    				<td rowspan="2" style="width: 5%">材料</td>
					    				<td rowspan="2" style="width: 5%">壁厚mm</td>
					    				<td colspan="2" style="width: 5%">无损检测</td>
					    				<td colspan="2" style="width: 5%">热处理</td>
					    				<td colspan="2" style="width: 5%">水（耐）压试验</td>
					    			</tr>
					    			<tr>
					    				<td style="width: 5%">方法</td>
					    				<td style="width: 5%">比例%</td>
					    				<td style="width: 5%">温度℃</td>
					    				<td style="width: 5%">时间h</td>
					    				<td style="width: 5%">介质</td>
					    				<td style="width: 5%">压力MPa</td>
					    			</tr>
					    			<c:forEach var="g" items="${glhzbList}" varStatus="i">
					    			<tr>
						    			<td>${g.shouyabujian}&nbsp;</td>
						    			<td>${g.cailiao}</td>
						    			<td>${g.bihou}</td>
						    			<td>${g.fangfa}</td>
						    			<td>${g.bili}</td>
						    			<td>${g.wendu}</td>
						    			<td>${g.shijian}</td>
						    			<td>${g.jiezhi}</td>
						    			<td>${g.yali}</td>
						    		</tr>
						    		</c:forEach>
						    		<c:if test="${fn:length(glhzbList) <10 }">
						    			<c:forEach varStatus="y" begin="${fn:length(glhzbList)}" end="9">
						    				<tr>
								    			<td>&nbsp;</td>
								    			<td></td>
								    			<td></td>
								    			<td></td>
								    			<td></td>
								    			<td></td>
								    			<td></td>
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
								<td >是否在城市建成区内</td>
								<td >${reg.chengqu}</td>
							</tr>
							<tr>
								<td >是否配备有效的除尘装置和脱硫脱硝装置</td>
								<td >${reg.chuchenzhuangzhi}</td>
								<td >污染物排放量-PM2.5(吨/年)</td>
								<td >${reg.wuranwu_pm25}</td>
							</tr>
							<tr>
								<td >污染物排放量-PM10(吨/年)</td>
								<td >${reg.wuranwu_pm10}</td>
								<td >污染物排放量-二氧化硫(SO2)(吨/年)</td>
								<td >${reg.wuranwu_pmso2}</td>
							</tr>
							<tr>
								<td >污染物排放量-二氧化氮(NO2)(吨/年)</td>
								<td >${reg.wuranwu_pmno2}</td>
								<td >是否符合山东省排放标准</td>
								<td >${reg.fuhebiaozhun}</td>
							</tr>
							<tr>
								<td >年耗燃烧介质量</td>
								<td >${reg.ranshaojiezhiliang}</td>
								<td >折合标准煤</td>
								<td >${reg.biaozhunmei}</td>
							</tr>
							<tr>
								<td >年耗电量</td>
								<td >${reg.nianhaodianliang}</td>
								<td >是否按规定完成能效测试(定型)</td>
								<td >${reg.nengxiaoceshi_dx}</td>
							</tr>
							<tr>
								<td >是否按规定完成能效测试(定期)</td>
								<td >${reg.nengxiaoceshi_dq}</td>
								<td >热效率(设计值)</td>
								<td >${reg.rexiaolv_sheji}</td>
							</tr>
							<tr>
								<td >热效率(实际值)</td>
								<td >${reg.rexiaolv_shiji}</td>
								<td >制造日期</td>
								<td >${reg.zhizaoriqi_str}</td>
							</tr>
						</table>
				</div>	


<c:if test="${reg.shebeipinzhong == '电站锅炉' }">
<div class="PageNext"></div>
<div class="" style="width:680px;height:980px;margin:0px 0px 0px 0px;" >
	<div id="demo2" style="width:960px;height:600px;">
		   			<div style="width: 99%;text-align: center;font-size: 15px;">
		   				电站范围内压力管道基本信息汇总表
		   			</div>
		    		<table class="tabjcxx" id="hzb" style="width: 99%">
		    			<tr>
		    				<td colspan="3" style="border: none;">工程(装置)名称：</td>
		    				<td colspan="4" style="border: none;text-align: left;">${reg.gongchengmingcheng}</td>
		    				<td colspan="3" style="border: none;">安全管理部门：</td>
		    				<td colspan="9" style="border: none;text-align: left;">${reg.anquanguanlibumen}</td>
		    			</tr>
		    			<tr>
		    				<td rowspan="2" style="width: 2%">序号</td>
		    				<td rowspan="2" style="width: 5%">管道名称(登记单元)</td>
		    				<td rowspan="2" style="width: 5%">管道编号</td>
		    				<td rowspan="2" style="width: 5%">管道级别</td>
		    				<td rowspan="2" style="width: 5%">设计单位</td>
		    				<td rowspan="2" style="width: 5%">安装单位</td>
		    				<td rowspan="2" style="width: 5%">安装年月</td>
		    				<td rowspan="2" style="width: 5%">投用年月</td>
		    				<td colspan="3" style="width: 5%">管道规格</td>
		    				<td colspan="3" style="width: 5%">设计/工作条件</td>
		    				<td rowspan="2" style="width: 5%">检验结论</td>
		    				<td rowspan="2" colspan="2" style="width: 8%">检验机构名称</td>
		    				<td rowspan="2" style="width: 7%">下次检验日期</td>
		    				<td rowspan="2" style="width: 3%">备注</td>
		    			</tr>
		    			<tr>
		    				<td style="width: 5%">公称直径(mm)</td>
		    				<td style="width: 5%">公称壁厚(mm)</td>
		    				<td style="width: 5%">管道长度(m)</td>
		    				<td style="width: 5%">压力(MPa)</td>
		    				<td style="width: 5%">温度(℃)</td>
		    				<td style="width: 5%">介质</td>
		    			</tr>
		   				<c:set var="ye" value="1" />
		   				<c:set var="tiaoshu" value="5" />
		   				<c:forEach var="h" items="${hzbList}" varStatus="i" >
		   				<c:if test="${i.index+1 <= tiaoshu}">
		    			<tr>
		    				<td>${i.index+1}</td>
			    			<td>${h.guandaomingcheng}</td>
			    			<td>${h.guandaobianhao}</td>
			    			<td>${h.guandaojibie}</td>
			    			<td>${h.shejidanwei}</td>
			    			<td>${h.anzhuangdanwei}</td>
			    			<td>${h.anzhuangnianyue}</td>
			    			<td>${h.touyongnianyue}</td>
			    			<td>${h.gongchengzhijing}</td>
			    			<td>${h.gongchengbihou}</td>
			    			<td>${h.guandaochangdu}</td>
			    			<td>${h.yali}</td>
			    			<td>${h.wendu}</td>
			    			<td>${h.jiezhi}</td>
			    			<td>${h.jianyanjielun}</td>
			    			<td colspan="2">${h.jigoumingcheng}</td>
			    			<td>
			    			<fmt:formatDate value="${h.xiacijianyanriqi}" pattern="yyyy-MM-dd"/>
			    			</td>
			    			<td>${h.beizhu}</td>
			    		</tr>
			    		</c:if>
		   				</c:forEach>
		   				
		   				<c:forEach var="h" items="${hzbList}" varStatus="i" begin="${ye * tiaoshu}" >
		   				<c:if test="${i.index%5 == 0 }">
		   				<c:set var="ye" value="${ye + 1}" ></c:set>
		    		</table>
		    		<table style="width: 100%">
		    			<tr>
		    				<td style="border: none;">填表日期：</td>
		    				<td style="border: none;"><fmt:formatDate value="${reg.hzb_tianbiaoriqi}" pattern="yyyy-MM-dd"/></td>
		    				<td style="border: none;">经办人：</td>
		    				<td style="border: none;">${reg.hzb_jingbanren}</td>
		    				<td style="border: none;">联系电话：</td>
		    				<td style="border: none;">${reg.hzb_lianxidianhua}</td>
		    				<td style="border: none;">电子邮箱：</td>
		    				<td style="border: none;">${reg.hzb_dianziyouxiang}</td>
		    			</tr>
		    		</table>
		    </div>
</div>

<div class="" style="width:680px;height:980px;margin:30px 0px 0px 0px;" >
	<div id="demo2" style="width:960px;height:600px;">
		   			<div style="width: 99%;text-align: center;font-size: 15px;">
		   				电站范围内压力管道基本信息汇总表
		   			</div>
		    		<table class="tabjcxx" id="hzb" style="width: 99%">
		    			<tr>
		    				<td colspan="3" style="border: none;">工程(装置)名称：</td>
		    				<td colspan="4" style="border: none;text-align: left;">${reg.gongchengmingcheng}</td>
		    				<td colspan="3" style="border: none;">安全管理部门：</td>
		    				<td colspan="9" style="border: none;text-align: left;">${reg.anquanguanlibumen}</td>
		    			</tr>
		    			<tr>
		    				<td rowspan="2" style="width: 2%">序号</td>
		    				<td rowspan="2" style="width: 5%">管道名称(登记单元)</td>
		    				<td rowspan="2" style="width: 5%">管道编号</td>
		    				<td rowspan="2" style="width: 5%">管道级别</td>
		    				<td rowspan="2" style="width: 5%">设计单位</td>
		    				<td rowspan="2" style="width: 5%">安装单位</td>
		    				<td rowspan="2" style="width: 5%">安装年月</td>
		    				<td rowspan="2" style="width: 5%">投用年月</td>
		    				<td colspan="3" style="width: 5%">管道规格</td>
		    				<td colspan="3" style="width: 5%">设计/工作条件</td>
		    				<td rowspan="2" style="width: 5%">检验结论</td>
		    				<td rowspan="2" colspan="2" style="width: 8%">检验机构名称</td>
		    				<td rowspan="2" style="width: 7%">下次检验日期</td>
		    				<td rowspan="2" style="width: 3%">备注</td>
		    			</tr>
		    			<tr>
		    				<td style="width: 5%">公称直径(mm)</td>
		    				<td style="width: 5%">公称壁厚(mm)</td>
		    				<td style="width: 5%">管道长度(m)</td>
		    				<td style="width: 5%">压力(MPa)</td>
		    				<td style="width: 5%">温度(℃)</td>
		    				<td style="width: 5%">介质</td>
		    			</tr>
		   				</c:if>
		    			<tr>
		    				<td>${i.index+1}</td>
			    			<td>${h.guandaomingcheng}</td>
			    			<td>${h.guandaobianhao}</td>
			    			<td>${h.guandaojibie}</td>
			    			<td>${h.shejidanwei}</td>
			    			<td>${h.anzhuangdanwei}</td>
			    			<td>${h.anzhuangnianyue}</td>
			    			<td>${h.touyongnianyue}</td>
			    			<td>${h.gongchengzhijing}</td>
			    			<td>${h.gongchengbihou}</td>
			    			<td>${h.guandaochangdu}</td>
			    			<td>${h.yali}</td>
			    			<td>${h.wendu}</td>
			    			<td>${h.jiezhi}</td>
			    			<td>${h.jianyanjielun}</td>
			    			<td colspan="2">${h.jigoumingcheng}</td>
			    			<td>
			    			<fmt:formatDate value="${h.xiacijianyanriqi}" pattern="yyyy-MM-dd"/>
			    			</td>
			    			<td>${h.beizhu}</td>
			    		</tr>
			    		
		   				</c:forEach>
		   				
		    		</table>
		    		<table style="width: 100%">
		    			<tr>
		    				<td style="border: none;">填表日期：</td>
		    				<td style="border: none;"><fmt:formatDate value="${reg.hzb_tianbiaoriqi}" pattern="yyyy-MM-dd"/></td>
		    				<td style="border: none;">经办人：</td>
		    				<td style="border: none;">${reg.hzb_jingbanren}</td>
		    				<td style="border: none;">联系电话：</td>
		    				<td style="border: none;">${reg.hzb_lianxidianhua}</td>
		    				<td style="border: none;">电子邮箱：</td>
		    				<td style="border: none;">${reg.hzb_dianziyouxiang}</td>
		    			</tr>
		    		</table>
		    </div>
</div>
</c:if>
<!--endprint-->
</body>
</html>