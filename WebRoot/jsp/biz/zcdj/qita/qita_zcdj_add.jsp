<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.sys.pojo.TOrgan"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
TOrgan organ = (TOrgan)session.getAttribute(IConstant.SESSION_TORGAN_CODE);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date d = new Date();
long datetime = d.getTime();
String riqi = sdf.format(d);
%>
<!doctype html>
<html>
<head>
<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style type="text/css">

.long98{
  width:92%;
}
.long85{
  width:85%;
}
.tabjcxx {
	border-collapse:collapse; 
	text-align:center; 
	margin:0 0 0 0;
	width: 80%;
}
.tabjcxx th{
	border:1px black solid;
	text-align:center; 
	font-size:14px;
}
.tabjcxx td{
	border:1px black solid;
	font-size:12px;
	text-align:center; 
	margin:0px; 
	padding:0 0 0 0px;
}
input{
	text-align: center;
	vertical-align: middle;
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
.redStyle{
	color: red;
}
p{
	color:red;
	display: none;
}


</style>
</head>
<body>
	<div class="wrapper">
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_add_save">保存</a>
	  </div>
	   		<div>
		    	<form id="frm_zcdj_add${uuid}" method="post">
		   			<div style="width: 80%;text-align: center;font-size: 30px">
		   				特种设备使用登记表
		   			</div>
		   			<br/>
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.filepath"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="${param.zl}"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="${param.zldm}"/>
	                	 <input type="hidden" name="register.tjstate" value="0"/>
	                	 <input type="hidden" name="register.shiyongdanwei" value="${register.shiyongdanwei}" id="reg_add_sydw"/>
	                </div>
					<div>
						<table>
							<tr>
								<th>登记类别：</th>
								<td>
									<select class="long98" name="register.dengjileibie" id="djlb">
										<option value=""></option>
										<option value="新设备首次启用">新设备首次启用</option>
										<option value="停用后启用">停用后启用</option>
										<option value="改造">改造</option>
										<option value="使用单位更名">使用单位更名</option>
										<option value="使用地址变更">使用地址变更</option>
										<option value="过户">过户</option>
										<option value="移装">移装</option>
										<option value="达到设计使用年限">达到设计使用年限</option>
									</select>
								</td>
							</tr>
						</table>
						<table class="tabjcxx">
							<tr>
								<th rowspan="6" style="width: 10%">设备基本情况</th>
								<th style="width: 15%">设备种类</th>
								<td style="width: 35%">${param.zl}</td>
								<th colspan="2" style="width: 20%">设备类别</th>
								<td style="width: 20%">
									<div id="yzc_shebeileibie_div" onclick="delay()">
										<select name="register.shebeileibiedaima" class="long98" id="yzc_shebeileibie"></select>
									</div>
					    		</td>
							</tr>
							<tr>
								<th>设备品种</th>
								<td>
									<div id="yzc_shebeipinzhong_div" onclick="delay()">
					    				<select class="long98" name="register.shebeipinzhongdaima" id="yzc_shebeipinzhong"></select>
									</div>
					    		</td>
								<th colspan="2">产品名称</th>
								<td>
									<input class="ui-input long98" name="register.shebeimingcheng" value="${register.shebeimingcheng}" />
								</td>
							</tr>
							<tr>
								<th>设备代码</th>
								<td>
									<input class="ui-input long98" name="register.shebeidaima" value="${register.shebeidaima}" />
								</td>
								<th colspan="2">型号(规格)</th>
								<td>
									<input class="ui-input long98" name="register.shebeixinghao" value="${register.shebeixinghao}" />
								</td>
							</tr>
							<tr>
								<th>设计使用年限</th>
								<td>
									<input class="ui-input" name="register.shejishiyongnianxian" />年
								</td>
								<th colspan="2">设计单位名称</th>
								<td>
									<input class="ui-input long98" name="register.shejidanwei" />
								</td>
							</tr>
							<tr>
								<th>制造单位名称</th>
								<td>
									<input class="ui-input long98" name="register.zhizaodanwei" />
								</td>
								<th colspan="2">施工单位名称</th>
								<td>
									<input class="ui-input long98" name="register.shigongdanwei" />
								</td>
							</tr>
							<tr>
								<th>监督检验机构名称</th>
								<td>
									<input class="ui-input long98" name="register.jianjiandanwei" />
								</td>
								<th colspan="2">型式试验机构名称</th>
								<td>
									<input class="ui-input long98" name="register.xingshishiyanjiegou" />
								</td>
							</tr>
							<tr>
								<th rowspan="11" style="width: 10%">设备使用情况</th>
								<th>使用单位名称</th>
								<td colspan="4">
									${register.shiyongdanwei}
								</td>
							</tr>
							<tr>
								<th>使用单位地址</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.shiyongdanweidizhi" value="${register.shiyongdanweidizhi}" />
								</td>
							</tr>
							<tr>
								<th>市</th>
								<td>
									<div id="shi_div">
										<select class="long98" sltValue="${register.shiyongdanweidizhi_shi_daima}" name="register.shiyongdanweidizhi_shi_daima" id="shi"></select>
									</div>
								</td>
								<th colspan="2">区县</th>
								<td >
									<div id="quxian_div">
										<select class="long98" sltValue="${register.shiyongdanweidizhi_qu_daima}" name="register.shiyongdanweidizhi_qu_daima" id="quxian"></select>
									</div>
								</td>
							</tr>
							<tr>
								<th>乡镇</th>
								<td>
									<div id="xiangzhen_div">
										<select class="long98" sltValue="${register.suozaixiangzhen_daima}" name="register.suozaixiangzhen_daima" id="xiangzhen"></select>
									</div>
								</td>
								<th colspan="2">产品编号</th>
								<td >
									<input class="ui-input long98" name="register.chuchangbianhao" />
								</td>
							</tr>
							<tr>
								<th>使用单位统一社会</br>信用代码</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdanweidaima" />
								</td>
								<th colspan="2">邮政编码</th>
								<td>
									<input class="ui-input long98" name="register.sydw_youzhengbianma" value="${register.sydw_youzhengbianma}" />
								</td>
							</tr>
							<tr>
								<th>单位内编号</th>
								<td>
									<input class="ui-input long98" name="register.neibubianhao" />
								</td>
								<th colspan="2">设备使用地点</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdidian" value="${register.shiyongdidian}" />
								</td>
							</tr>
							<tr>
								<th>投入使用日期(日期)</th>
								<td>
									日期：<input class="ui-input" name="register.touyongriqi" onclick="WdatePicker()" />
									文本：<input class="ui-input" name="register.touyongriqi_str" />
								</td>
								<th colspan="2">单位固定电话</th>
								<td>
									<input class="ui-input long98" name="register.sydw_gudingdianhua" />
								</td>
							</tr>
							<tr>
								<th>安全管理人员</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlirenyuan"/>
								</td>
								<th colspan="2">移动电话</th>
								<td>
									<input class="ui-input long98" name="register.aqglry_lianxidianhua" />
								</td>
							</tr>
							<tr>
								<th>产权单位名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.chanquandanwei"/>
								</td>
							</tr>
							<tr>
								<th>产权单位统一社会</br>信用代码</th>
								<td>
									<input class="ui-input long98" name="register.chanquandanweidaima" />
								</td>
								<th colspan="2">联系电话</th>
								<td>
									<input class="ui-input long98" name="register.cqdw_dianhua"/>
								</td>
							</tr>
							<tr>
								<th>维保单位</th>
								<td>
									<input class="ui-input long98" name="register.weibaodanwei" />
								</td>
								<th colspan="2">联系电话</th>
								<td>
									<input class="ui-input long98" name="register.weibaofuzerendianhua"/>
								</td>
							</tr>
							<tr>
								<th rowspan="4">设备检验情况</th>
								<th>检验机构名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.jianyandanwei" />
								</td>
							</tr>
							<tr>
								<th>检验类别</th>
								<td>
									<select class="long98" name="register.jianyanleibie" id="jylb">
										<option value=""></option>
										<option value="安装监督检验">安装监督检验</option>
										<option value="改造监督检验">改造监督检验</option>
										<option value="重大修理监督检验">重大修理监督检验</option>
										<option value="首次检验">首次检验</option>
										<option value="定期检验">定期检验</option>
										<option value="达到设计使用年限检验">达到设计使用年限检验</option>
										<option value="安全评估">安全评估</option>
										<option value="基于风险检验">基于风险检验</option>
										<option value="事故检验">事故检验</option>
									</select>
								</td>
								<th colspan="2">检验报告编号</th>
								<td>
									<input class="ui-input long98" name="register.baogaoshubianhao" />
								</td>
							</tr>
							<tr>
								<th>检验日期</th>
								<td>
									<input class="ui-input long98" name="register.jianyanriqi" onclick="WdatePicker()" />
								</td>
								<th colspan="2">检验结论</th>
								<td>
									<select class="long98" name="register.jianyanjielun" id="jyjl">
										<option value=""></option>
										<option value="符合要求">符合要求</option>
										<option value="基本符合要求 ">基本符合要求</option>
										<option value="不符合要求">不符合要求</option>
										<option value="合格">合格</option>
										<option value="复检合格">复检合格</option>
										<option value="不合格">不合格</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>下次检验日期</th>
								<td>
									<input class="ui-input long98" name="register.xiacijianyanriqi" onclick="WdatePicker()" />
								</td>
								<td colspan="3">
								</td>
							</tr>
							<tr class="gongzuocanshu" type="1000">
								<th rowspan="11">设备工作参数</th>
								<th>工作压力</th>
								<td>
									<input class="ui-input" name="register.gongzuoyali" />Mpa
								</td>
								<th colspan="2">工作温度</th>
								<td>
									<input class="ui-input" name="register.gongzuowendu" />℃
								</td>
							</tr>
							<tr class="gongzuocanshu" type="1000">
								<th>介质</th>
								<td>
									<input class="ui-input long98" name="register.jiezhi" />
								</td>
								<th colspan="2">运行热效率</th>
								<td>
									<input class="ui-input long98" name="register.yunxingrexiaolv" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="1000">
								<th>燃料种类</th>
								<td>
									<select class="long98" name="register.ranshaozhonglei" id="rlzl">
										<option value=""></option>
										<option value="燃煤" selected="selected">燃煤</option>
										<option value="煤粉">煤粉</option>
										<option value="燃油">燃油</option>
										<option value="燃气">燃气</option>
										<option value="生物质">生物质</option>
										<option value="电加热">电加热</option>
										<option value="其他">其他</option>
									</select>
								</td>
								<th colspan="2">压力等级</th>
								<td>
									<select class="long98" name="register.yalidengji" id="yldj">
										<option value=""></option>
										<option value="超临界锅炉≥22.1MPa">超临界锅炉≥22.1MPa</option>
										<option value="亚临界锅炉16.7MPa≤p＜22.1MPa">亚临界锅炉16.7MPa≤p＜22.1MPa</option>
										<option value="超高压锅炉13.7MPa≤p＜16.7MPa">超高压锅炉13.7MPa≤p＜16.7MPa</option>
										<option value="高压锅炉9.8MPa≤p＜13.7MPa">高压锅炉9.8MPa≤p＜13.7MPa</option>
										<option value="次高压锅炉5.3MPa≤p＜9.8MPa">次高压锅炉5.3MPa≤p＜9.8MPa</option>
										<option value="中压锅炉3.8MPa≤p＜5.3MPa">中压锅炉3.8MPa≤p＜5.3MPa</option>
										<option value="低压锅炉＜3.8MPa">低压锅炉＜3.8MPa</option>
										<option value="高压">高压</option>
										<option value="次高压">次高压</option>
										<option value="中压">中压</option>
									</select>
								</td>
							</tr>
							<tr class="gongzuocanshu" type="1000">
								<th>额定蒸发量(蒸吨/时)</th>
								<td>
									<input class="ui-input long98" name="register.edingzhengfaliang" onkeyup="value=value.replace(/[^\d.]/g,'')" />
								</td>
								<th colspan="2">是否在城市建成区内</th>
								<td>
									<select class="long98" name="register.chengqu" id="csjcq">
										<option value=""></option>
										<option value="是">是</option>
										<option value="否" selected="selected">否</option>
									</select>
								</td>
							</tr>
							<tr class="gongzuocanshu" type="1000">
								<th>是否配备有效的除尘装置和脱硫脱硝装置</th>
								<td>
									<select class="long98" name="register.chuchenzhuangzhi" id="cczz_tltx">
										<option value=""></option>
										<option value="是" selected="selected">是</option>
										<option value="否">否</option>
									</select>
								</td>
								<th colspan="2">污染物排放量-PM2.5(吨/年)</th>
								<td>
									<input class="ui-input long98" name="register.wuranwu_pm25" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="1000">
								<th>污染物排放量-PM10(吨/年)</th>
								<td>
									<input class="ui-input long98" name="register.wuranwu_pm10" />
								</td>
								<th colspan="2">污染物排放量-二氧化硫(SO2)(吨/年)</th>
								<td>
									<input class="ui-input long98" name="register.wuranwu_pmso2" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="1000">
								<th>污染物排放量-二氧化氮(NO2)(吨/年)</th>
								<td>
									<input class="ui-input long98" name="register.wuranwu_pmno2" />
								</td>
								<th colspan="2">是否符合山东省排放标准</th>
								<td>
									<select class="long98" name="register.fuhebiaozhun" id="pfbz">
										<option value=""></option>
										<option value="是" selected="selected">是</option>
										<option value="否">否</option>
									</select>
								</td>
							</tr>
							<tr class="gongzuocanshu" type="1000">
								<th>年耗燃烧介质量</th>
								<td>
									<input class="ui-input long98" name="register.ranshaojiezhiliang" />
								</td>
								<th colspan="2">折合标准煤</th>
								<td>
									<input class="ui-input long98" name="register.biaozhunmei" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="1000">
								<th>年耗电量</th>
								<td>
									<input class="ui-input long98" name="register.nianhaodianliang" />
								</td>
								<th colspan="2">是否按规定完成能效测试(定型)</th>
								<td>
									<select class="long98" name="register.nengxiaoceshi_dx" id="nxcs_dx">
										<option value=""></option>
										<option value="是" selected="selected">是</option>
										<option value="否">否</option>
									</select>
								</td>
							</tr>
							<tr class="gongzuocanshu" type="1000">
								<th>是否按规定完成能效测试(定期)</th>
								<td>
									<select class="long98" name="register.nengxiaoceshi_dq" id="nxcs_dq">
										<option value=""></option>
										<option value="是" selected="selected">是</option>
										<option value="否">否</option>
									</select>
								</td>
								<th colspan="2">热效率(设计值)</th>
								<td>
									<input class="ui-input long98" name="register.rexiaolv_sheji" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="1000">
								<th>热效率(实际值)</th>
								<td>
									<input class="ui-input long98" name="register.rexiaolv_shiji" />
								</td>
								<th colspan="2">额定出力</th>
								<td>
									<input class="ui-input long98" name="register.edingchuli" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="2000">
								<th rowspan="3">设备工作参数</th>
								<th>工作压力</th>
								<td>
									<input class="ui-input" name="register.gongzuoyali" />Mpa
								</td>
								<th colspan="2">工作温度</th>
								<td>
									<input class="ui-input" name="register.gongzuowendu" />℃
								</td>
							</tr>
							<tr class="gongzuocanshu" type="2000">
								<th>介质</th>
								<td>
									<input class="ui-input long98" name="register.jiezhi" />
								</td>
								<th colspan="2">充装量/额定人数</th>
								<td>
									<input class="ui-input long98" name="register.chongzhuangliang" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="2000">
								<th>容积(换热面积)</th>
								<td>
									<input class="ui-input" name="register.rongji" />
									<input type="radio" name="register.rongji_dw" value="㎡" checked />㎡
									<input type="radio" name="register.rongji_dw" value="m³" />m³
								</td>
								<th colspan="2"></th>
								<td>
								</td>
							</tr>
							<tr class="gongzuocanshu" type="3000">
								<th rowspan="7">设备工作参数</th>
								<th>管理方式</th>
								<td>
									<select class="long98" name="register.guanlifangshi" id="glfs" >
										<option value=""></option>
										<option value="常规管理">常规管理</option>
										<option value="现代管理">现代管理</option>
									</select>
								</td>
								<th colspan="2">电梯运行速度（m/s）</th>
								<td>
									<input class="ui-input long98" name="register.yunxingsudu" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="3000">
								<th>电梯额定载荷（kg）</th>
								<td>
									<input class="ui-input long98" name="register.edingzaihe" />
								</td>
								<th colspan="2">电梯层站</th>
								<td>
									<input class="ui-input long98" name="register.cengzhan" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="3000">
								<th>电梯提升高度（m）</th>
								<td>
									<input class="ui-input long98" name="register.tishenggaodu" />
								</td>
								<th colspan="2">电梯走形距离（m）</th>
								<td>
									<input class="ui-input long98" name="register.zouxingjuli" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="3000">
								<th>电梯层</th>
								<td>
									<input class="ui-input long98" name="register.ceng" />
								</td>
								<th colspan="2">电梯站</th>
								<td>
									<input class="ui-input long98" name="register.zhan" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="3000">
								<th>电梯门</th>
								<td>
									<input class="ui-input long98" name="register.men" />
								</td>
								<th colspan="2">梯级宽度（mm）</th>
								<td>
									<input class="ui-input long98" name="register.tijikuandu" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="3000">
								<th>油缸压力（Mpa）</th>
								<td>
									<input class="ui-input long98" name="register.yougangyali" />
								</td>
								<th colspan="2">使用区段长度（m）</th>
								<td>
									<input class="ui-input long98" name="register.quduanchangdu" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="3000">
								<th>倾斜角度（度）</th>
								<td>
									<input class="ui-input long98" name="register.qingxiejiaodu" />
								</td>
								<th colspan="2">输送能力</th>
								<td>
									<input class="ui-input long98" name="register.shusongnengli" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="4000">
								<th rowspan="3">设备主要性能参数</th>
								<th>额定起重量(起重力矩)</th>
								<td>
									<input class="ui-input" name="register.edingqizhongliang" />
									<input type="radio" name="register.edingqizhongliang_dw" value="t" checked />t
									<input type="radio" name="register.edingqizhongliang_dw" value="kN·m" />kN·m
								</td>
								<th colspan="2">跨度</th>
								<td>
									<input class="ui-input" name="register.kuadu" />m
								</td>
							</tr>
							<tr class="gongzuocanshu" type="4000">
								<th>起升高度</th>
								<td>
									<input class="ui-input" name="register.tishenggaodu" />m
								</td>
								<th colspan="2">起升速度</th>
								<td>
									<input class="ui-input" name="register.yunxingsudu" />m/s
								</td>
							</tr>
							<tr class="gongzuocanshu" type="4000">
								<th>移动速度</th>
								<td>
									<input class="ui-input long98" name="register.yidongsudu" />
								</td>
								<th colspan="2">司机室</th>
								<td>
									<select name="register.sijishi" class="long98" id="sijishi">
										<option value=""></option>
										<option value="是">是</option>
										<option value="否">否</option>
									</select>
								</td>
							</tr>
							<tr class="gongzuocanshu" type="5000">
								<th rowspan="2">设备主要性能参数</th>
								<th>厂车牌照编号</th>
								<td>
									<input class="ui-input long98" name="register.paizhaobianhao" />
								</td>
								<th colspan="2">厂内车辆运行速度（km/h）</th>
								<td>
									<input class="ui-input long98" name="register.yunxingsudu" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="5000">
								<th>厂内车辆额定载荷（kg）</th>
								<td>
									<input class="ui-input long98" name="register.edingzaihe" />
								</td>
								<th colspan="2">动力方式</th>
								<td>
									<select name="register.yunxingfangshi" class="long98" id="yxfs">
										<option value=""></option>
										<option value="电动">电动</option>
										<option value="内燃">内燃</option>
									</select>
								</td>
							</tr>
							<tr class="gongzuocanshu" type="6000">
								<th rowspan="9">设备主要性能参数</th>
								<th>游乐设施线速度(m/s)</th>
								<td>
									<input class="ui-input long98" name="register.xiansudu" />
								</td>
								<th colspan="2">游乐设施高度(m)</th>
								<td>
									<input class="ui-input long98" name="register.ylss_gaodu" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="6000">
								<th>额定乘客人数(人)</th>
								<td>
									<input class="ui-input long98" name="register.edingchengkerenshu" />
								</td>
								<th colspan="2">额定载荷(Kg)</th>
								<td>
									<input class="ui-input long98" name="register.edingzaihe" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="6000">
								<th>额定速度(m/s)</th>
								<td>
									<input class="ui-input long98" name="register.sudu" />
								</td>
								<th colspan="2">倾夹角或坡度(度)</th>
								<td>
									<input class="ui-input long98" name="register.qingjiao" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="6000">
								<th>副速度(m/s)</th>
								<td>
									<input class="ui-input long98" name="register.fusudu" />
								</td>
								<th colspan="2">驱动形式</th>
								<td>
									<input class="ui-input long98" name="register.qudongxingshi" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="6000">
								<th>驱动主功率(kw)</th>
								<td>
									<input class="ui-input long98" name="register.qudongzhugonglv" />
								</td>
								<th colspan="2">电压(v)</th>
								<td>
									<input class="ui-input long98" name="register.dianya" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="6000">
								<th>副功率(kw)</th>
								<td>
									<input class="ui-input long98" name="register.fugonglv" />
								</td>
								<th colspan="2">座舱高度(m)</th>
								<td>
									<input class="ui-input long98" name="register.gaodu" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="6000">
								<th>回转直径(m)</th>
								<td>
									<input class="ui-input long98" name="register.huizhuanzhijing" />
								</td>
								<th colspan="2">轨矩</th>
								<td>
									<input class="ui-input long98" name="register.guiju" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="6000">
								<th>轨矩长度(m)</th>
								<td>
									<input class="ui-input long98" name="register.guijuchangdu" />
								</td>
								<th colspan="2">水滑梯高度(m)</th>
								<td>
									<input class="ui-input long98" name="register.shuihuatigaodu" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="6000">
								<th>游乐池水深(m)</th>
								<td>
									<input class="ui-input long98" name="register.youlechishuishen" />
								</td>
								<th colspan="2"></th>
								<td>
								</td>
							</tr>
							<tr class="gongzuocanshu" type="9000">
								<th rowspan="2">设备主要参数</th>
								<th>运行速度(m/s)</th>
								<td>
									<input class="ui-input long98" name="register.yunxingsudu" />
								</td>
								<th colspan="2">索道长度(m)</th>
								<td>
									<input class="ui-input long98" name="register.changdu" />
								</td>
							</tr>
							<tr class="gongzuocanshu" type="9000">
								<th>运载能力(p/h)</th>
								<td>
									<input class="ui-input long98" name="register.yunzainengli" />
								</td>
								<th colspan="2">运载车辆形式</th>
								<td>
									<select class="long98" name="register.yunzaicheliangxingshi" id="clxs">
										<option value=""></option>
										<option value="吊厢式">吊厢式</option>
										<option value="吊蓝式">吊蓝式</option>
										<option value="吊椅式">吊椅式</option>
										<option value="拖牵式">拖牵式</option>
									</select>
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
											<td style="width: 15%">
												<input class="ui-input long98" name="register.tianbiaorenyuan" />
											</td>
											<td style="width: 10%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.tianbiaoriqi" onclick="WdatePicker()" />
											</td>
											<td style="width: 20%">(使用单位公章)</td>
										</tr>
										<tr>
											<td>使用单位安全管理人员：</td>
											<td></td>
											<td>日期：</td>
											<td>
												<input class="ui-input long98" name="register.aqglry_riqi" onclick="WdatePicker()" />
											</td>
											<td><input class="ui-input long98" name="register.shiyongdanwei_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;">
										说明：<textarea rows="3" style="width: 98%" name="register.beizhu"></textarea>
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">登记机关登记人员：</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.zhucedengjirenyuan" />
											</td>
											<td style="width: 20%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.zhucedengjiriqi" onclick="WdatePicker()" required="required" />
											</td>
											<td style="width: 20%">（登记机关专用章）</td>
										</tr>
										<tr>
											<td>使用登记证编号：</td>
											<td>
											</td>
											<td>登记机关</td>
											<td>
												<input class="ui-input long98" name="register.zhucedengjijigou" />
											</td>
											<td><input class="ui-input long98" name="register.dengjijiguan_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})"/></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
		   			</div>
		    	</form>
		    </div>
		</div>
</body>
</html>
	<script type="text/javascript">
	
	$("#djlb").selectmenu();
	$("#jylb").selectmenu();
	$("#jyjl").selectmenu();
	//锅炉参数
	$("#rlzl").selectmenu();
	$("#yldj").selectmenu();
	$("#csjcq").selectmenu();
	$("#cczz_tltx").selectmenu();
	$("#pfbz").selectmenu();
	$("#nxcs_dx").selectmenu();
	$("#nxcs_dq").selectmenu();
	//电梯参数
	$("#glfs").selectmenu();
	//起重机
	$("#sijishi").selectmenu();
	//厂车
	$("#yxfs").selectmenu();
	//客运索道
	$("#clxs").selectmenu();
	
	$().ready(function(){
		
		$(".gongzuocanshu").each(function(){
			if($(this).attr("type") != "${param.zldm}"){
				$(this).remove();
			}
		});
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${param.zldm}"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie,yzc_shebeipinzhong",data.dirDatas,"200px",true,"<%=path%>");
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			
		//提交表单
		$("#mnubtn_zcdj_add_save${uuid}").click(function(){
			var options = {
			    url:"<%=path%>/register!save.do?gzid=${gzid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if(!verifySelect()){ return false;}
					if($("#frm_zcdj_add${uuid}").validate().form()){
						parent.showMask("正在保存......");
						return true;
					}
			    	return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
	            		parent.frames["${param.fid}"].reloadGrid();
						parent.addTabsItem("add_djb_${param.zldm}",rsp.sydw+"_登记表_"+rsp.id,"<%=path%>/register!openZcdjbById.do?id="+rsp.id+"&zldm=${param.zldm}&fid=${param.fid}");
	            	}else{
						$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_zcdj_add${uuid}").ajaxSubmit(options);
	         return false;
		});
		appendSelTo();
	});
	
  	//验证注册代码和使用单位
  	function checkZcdmDw(){
  		var result = false;
  		var zcdm = $("#reg_add").val();
  		var sydw = $("#reg_add_sydw").val();
  		if(zcdm.length < 17 || zcdm.length > 20){
			$.dialog.alert('注册代码位数不正确!');
			return false;
  		}
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/register!verifyByDwmcOrZcdm.do",
		   data:'dwmc='+encodeURI(encodeURI(sydw))+'&zcdm='+zcdm,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result == "0"){
					$.dialog.alert('注册代码重复!');
		   		}else{
		   			result = true;
		   		}
		   }
		});
  		return result;
  	}
	//验证select 是否有值
	function verifySelect(){
		var s = $('#shi').val();
		var q = $('#quxian').val();
		var sblb = $("#yzc_shebeileibie").val();
		var sbpz = $("#yzc_shebeipinzhong").val();
		var flag = false;
		
		if(s == ""){
			$("#shi_div  p").show();
			flag = false;
		}else{
			$("#shi_div  p").hide();
			flag = true;
		}
		if(q == "" || q == null){
			$("#quxian_div  p").show();
			flag = false;
		}else{
			$("#quxian_div  p").hide();
			flag = true;
		}
		if(sblb == ""){
			$("#yzc_shebeileibie_div  p").show();
			flag = false;
		}else{
			$("#yzc_shebeileibie_div  p").hide();
			flag = true;
		}
		if(sbpz == "" || sbpz == null){
			$("#yzc_shebeipinzhong_div  p").show();
			flag = false;
		}else{
			$("#yzc_shebeipinzhong_div  p").hide();
			flag = true;
		}
		return flag;
	}
	
	//对select 进行追加元素 p
	function appendSelTo(){
		var divS = $('td > div');
		for(var i=0;i<divS.length-1;i++){
			$("<p>不能为空</p>").appendTo(divS[i]);
		}
	}
	
	//对select 选中数据后延迟执行方法
	function delay(){
		
		setTimeout(function(){verifySelect()},3000);
	}
	</script> 