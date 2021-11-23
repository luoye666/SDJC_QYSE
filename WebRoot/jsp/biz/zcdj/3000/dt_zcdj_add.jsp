<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.sys.pojo.TOrgan"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ taglib prefix="c" uri="/c.tld" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	TUser user = (TUser) session.getAttribute(IConstant.SESSION_TUSER);
	TOrgan organ = (TOrgan) session.getAttribute(IConstant.SESSION_TORGAN_CODE);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date d = new Date();
	long datetime = d.getTime();
	String riqi = sdf.format(d);
%>
<!doctype html>
<html>
<head>
<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<link href="<%=path %>/css/page_tabs/page_tabs.css" rel="stylesheet" type="text/css">
<style type="text/css">

.long98{
  width:92%;
}
.long80{
  width:70%;
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
			<form id="frm_zcdj_add${uuid}" method="post">
				<div id="tabbox">
					<ul class="tabs" id="tabs">
						<li><a href="javascript:void(0)">登记表</a></li>
						<li><a href="javascript:void(0)">产品数据表</a></li>
						<li><a href="javascript:void(0)">补充参数表 </a></li>
					</ul>
					<ul class="tab_conbox" id="tab_conbox">
						<li class="tab_con">
							<div style="width: 80%; text-align: center; font-size: 30px">
								特种设备使用登记表
							</div>
							<div class="formHiddenRegion">
								<input type="hidden" name="register.filepath" />
								<input type="hidden" name="register.shebeizhonglei" value="电梯" />
								<input type="hidden" name="register.shebeizhongleidaima" value="${param.zldm}" />
								<input type="hidden" name="register.tjstate" value="0" />
							</div>
							<table>
								<tr>
									<th>
										登记类别：
									</th>
									<td>
										<select name="register.dengjileibie" id="djlb" style="width:179px">
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
									<td style="width: 35%">电梯</td>
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
										<input class="ui-input long98" name="register.shiyongdanwei" value="${register.shiyongdanwei}" id="reg_add_sydw" placeholder="根据社会信用代码自动提取"/>
									</td>
								</tr>
								<tr>
									<th>使用单位地址</th>
									<td colspan="4">
										<input class="ui-input long98" name="register.shiyongdanweidizhi" value="${register.shiyongdanweidizhi}" id="reg_add_sydw_dz"/>
									</td>
								</tr>
								<tr>
									<th>市</th>
									<td>
										<div id="shi_div" onclick="delay()">
											<select class="long98" sltValue="${register.shiyongdanweidizhi_shi_daima}" name="register.shiyongdanweidizhi_shi_daima" id="shi"></select>
										</div>
									</td>
									<th colspan="2">区县</th>
									<td>
										<div id="quxian_div" onclick="delay()">
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
									<td>
										<input class="ui-input long98" name="register.chuchangbianhao" />
									</td>
								</tr>
								<tr>
									<th>使用单位统一社会</br>信用代码</th>
									<td>
										<input class="ui-input long80" name="register.shiyongdanweidaima" value="${register.shiyongdanweidaima}" required="required" id="xydm"/> <a id="xydmtq"><span style="color:red">提取</span></a> 
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
										<input class="ui-input long98" name="register.anquanguanlirenyuan" />
									</td>
									<th colspan="2">移动电话</th>
									<td>
										<input class="ui-input long98" name="register.aqglry_lianxidianhua" />
									</td>
								</tr>
								<tr>
									<th>产权单位名称</th>
									<td colspan="4">
										<input class="ui-input long98" name="register.chanquandanwei" />
									</td>
								</tr>
								<tr>
									<th>产权单位统一社会</br>信用代码
									</th>
									<td>
										<input class="ui-input long98" name="register.chanquandanweidaima" />
									</td>
									<th colspan="2">联系电话</th>
									<td>
										<input class="ui-input long98" name="register.cqdw_dianhua" />
									</td>
								</tr>
								<tr>
									<th>维保单位</th>
									<td>
										<input class="ui-input long98" name="register.weibaodanwei" />
									</td>
									<th colspan="2">联系电话</th>
									<td>
										<input class="ui-input long98" name="register.weibaofuzerendianhua" />
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
										<select name="register.jianyanleibie" id="jylb" style="width:179px">
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
											<option value="现场安全确认">现场安全确认</option>
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
										<select name="register.jianyanjielun" id="jyjl" style="width:179px">
											<option value=""></option>
											<option value="符合要求">符合要求</option>
											<option value="基本符合要求">基本符合要求</option>
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
									<td colspan="3"></td>
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
												<td>
													<input class="ui-input long98" name="register.shiyongdanwei_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})" />
												</td>
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
												<td></td>
												<td>登记机关</td>
												<td>
													<input class="ui-input long98" name="register.zhucedengjijigou"/>
												</td>
												<td>
													<input class="ui-input long98" name="register.dengjijiguan_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})" />
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</li>
						<li class="tab_con">
							<div id="cpsjb_msg">请先选择设备类别！</div>
							<div id="zdftzdrxd_cw" style="display: none;">
								<div style="width: 80%; text-align: center; font-size: 30px">
									电梯产品数据表（自动扶梯与自动人行道除外）<span style="font-size: 12px;color:red;">（所有参数后带单位的请填写数字）</span>
								</div>
								<br/>
								<table class="tabjcxx">
									<tr>
										<th colspan="2">产品品种</th>
										<td>
											同登记表
										</td>
										<th>产品名称</th>
										<td>
											同登记表
										</td>
									</tr>
									<tr>
										<th colspan="2">出厂编号</th>
										<td>
											同登记表
										</td>
										<th>出厂日期</th>
										<td>
											<input class="ui-input long98" name="register.chuchangriqi" onclick="WdatePicker()" />
										</td>
									</tr>
									<tr>
										<th colspan="2">产品型号</th>
										<td>
											同登记表
										</td>
										<th>额定速度</th>
										<td>
											上行：<input class="ui-input" name="register.edingsudu_sx" style="width: 70px" />m/s
											下行：<input class="ui-input" name="register.edingsudu_xx" style="width: 70px" />m/s
										</td>
									</tr>
									<tr>
										<th colspan="2">额定载重量</th>
										<td>
											<input class="ui-input long80" name="register.edingzaizhongliang" />kg
										</td>
										<th>轿厢尺寸</th>
										<td>
											<input class="ui-input long80" name="register.jiaoxiangchicun" />mm
										</td>
									</tr>
									<tr>
										<th colspan="2">提升高度</th>
										<td>
											<input class="ui-input long80" name="register.tishenggaodu" />m
										</td>
										<th>层/站/门数</th>
										<td>
											<input class="ui-input" name="register.ceng" style="width: 70px" />层
											<input class="ui-input" name="register.zhan" style="width: 70px" />站
											<input class="ui-input" name="register.men" style="width: 70px" />门
										</td>
									</tr>
									<tr>
										<th colspan="2">防爆型式</th>
										<td>
											<input class="ui-input long98" name="register.fangbaoxingshi" />
										</td>
										<th>防爆等级</th>
										<td>
											<input class="ui-input long98" name="register.fangbaodengji" />
										</td>
									</tr>
									<tr>
										<th rowspan="2" style="width: 10%">驱动主机</th>
										<th style="width: 10%">额定功率</th>
										<td style="width: 30%">
											<input class="ui-input long80" name="register.qdzj_edinggonglv" />kW
										</td>
										<th style="width: 20%">额定转速</th>
										<td style="width: 30%">
											<input class="ui-input long80" name="register.qdzj_edingzhuansu" />r/min
										</td>
									</tr>
									<tr>
										<th>减速比</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.qdzj_jiansubi" />
										</td>
									</tr>
									<tr>
										<th>液压泵站</th>
										<th>满载工作压力 (适用于液压驱动电梯)</th>
										<td colspan="3">
											<input class="ui-input long80" name="register.yybz_gongzuoyali" />MPa
										</td>
									</tr>
									<tr>
										<th rowspan="2">悬挂系统</th>
										<th>悬挂介质种类</th>
										<td>
											<input type="radio" name="register.xgxt_jiezhizhonglei" value="钢丝绳" checked="checked" />钢丝绳
											<input type="radio" name="register.xgxt_jiezhizhonglei" value="复合带" />复合带
										</td>
										<th>悬挂介质数量</th>
										<td>
											<input class="ui-input long98" name="register.xgxt_jiezhishuliang" />
										</td>
									</tr>
									<tr>
										<th>悬挂介质型号</th>
										<td>
											<input class="ui-input long98" name="register.xgxt_jiezhixinghao" />
										</td>
										<th>悬挂介质规格</th>
										<td>
											<input class="ui-input long98" name="register.xgxt_jiezhiguige" />
										</td>
									</tr>
									<tr>
										<th colspan="2">名称</th>
										<th>型号</th>
										<th>产品编号</th>
										<th>制造单位</th>
									</tr>
									<c:forEach var="d" items="${dtCpsjblist}" varStatus="i">
									<tr>
										<td colspan="2">
											${d.name}
											<input type="hidden" name="fjfj_list[${i.index}].mingcheng" value="${d.name}" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[${i.index}].xinghao" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[${i.index}].chanpinbianhao" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[${i.index}].zhizaochangjia" />
										</td>
									</tr>
									</c:forEach>
								</table>
							</div>
							<div id="zdftzdrxd" style="display: none;">
								<div style="width: 80%; text-align: center; font-size: 30px">
									电梯产品数据表（适用于自动扶梯与自动人行道）<span style="font-size: 12px;color:red;">（所有参数后带单位的请填写数字）</span>
								</div>
								<br/>
								<table class="tabjcxx">
									<tr>
										<th colspan="2">产品品种</th>
										<td>
											同登记表
										</td>
										<th>产品名称</th>
										<td>
											同登记表
										</td>
									</tr>
									<tr>
										<th colspan="2">名义速度</th>
										<td>
											<input class="ui-input long80" name="register.mingyisudu" />m/s
										</td>
										<th>倾斜角</th>
										<td>
											<input class="ui-input long98" name="register.qingxiejiaodu" />°
										</td>
									</tr>
									<tr>
										<th colspan="2">名义宽度</th>
										<td>
											<input class="ui-input long80" name="register.mingyikuandu" />mm
										</td>
										<th>提升高度或使用区段长度</th>
										<td>
											<input class="ui-input long98" name="register.tishenggaodu" style="width: 70px" />m
										</td>
									</tr>
									<tr>
										<th colspan="2">工作环境</th>
										<td>
											<input class="ui-input long98" name="register.gongzuohuanjing" />
										</td>
										<th>工作类型</th>
										<td>
											<input type="radio" name="register.gongzuoleixing" value="公共交通型" checked="checked" />公共交通型
											<input type="radio" name="register.gongzuoleixing" value="普通型" />普通型
										</td>
									</tr>
									<tr>
										<th rowspan="3" style="width: 10%">驱动主机</th>
										<th style="width: 10%">型号</th>
										<td style="width: 30%">
											<input class="ui-input long98" name="register.qdzj_xinghao" />
										</td>
										<th style="width: 20%">产品编号</th>
										<td style="width: 30%">
											<input class="ui-input long98" name="register.qdzj_chanpinbianhao" />
										</td>
									</tr>
									<tr>
										<th>额定转速</th>
										<td>
											<input class="ui-input long80" name="register.qdzj_edingzhuansu" />r/min
										</td>
										<th>额定功率</th>
										<td>
											<input class="ui-input long80" name="register.qdzj_edinggonglv" />kW
										</td>
									</tr>
									<tr>
										<th>制造单位</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.qdzj_zhizaodanwei" />
										</td>
									</tr>
									<tr>
										<th rowspan="2">控制柜</th>
										<th>型号</th>
										<td>
											<input class="ui-input long98" name="register.kzg_xinghao" />
										</td>
										<th>节能运行方式</th>
										<td>
											<input class="ui-input long98" name="register.kzg_yunxingfangshi" />
										</td>
									</tr>
									<tr>
										<th>产品编号</th>
										<td>
											<input class="ui-input long98" name="register.kzg_chanpinbianhao" />
										</td>
										<th>制造单位</th>
										<td>
											<input class="ui-input long98" name="register.kzg_zhizaodanwei" />
										</td>
									</tr>
								</table>
							</div>
						</li>
						<li class="tab_con">
					   			<div style="width: 100%;text-align: center;font-size: 30px"><br/>
					   				补充参数表
					   			</div>
					   			<br/>
					    		<table class="tabjcxx" id="bj" style="width: 100%">
					    			<tr>
										<th>注册代码</th>
										<td>
											<input class="ui-input long98" name="register.zhucedaima" />
										</td>
										<th >使用单位名称备注</th>
										<td>
											<input class="ui-input long98" name="register.shiyongdanweibeizhu" />
										</td>
									</tr>
									<tr>
										<th>是否在人口密集区</th>
										<td>
											<select class="long98" name="register.renkoumijiqu" id="rkmj">
												<option value=""></option>
												<option value="是">是</option>
												<option value="否" selected="selected">否</option>
											</select>
										</td>
										<th >是否重大危险源</th>
										<td>
											<select class="long98" name="register.zhongdaweixianyuan" id="zdwx">
												<option value=""></option>
												<option value="是">是</option>
												<option value="否" selected="selected">否</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>是否冷库设备</th>
										<td>
											<select class="long98" name="register.lengku" id="lengku">
												<option value=""></option>
												<option value="是">是</option>
												<option value="否" selected="selected">否</option>
											</select>
										</td>
										<th>电梯使用场所分类</th>
										<td>
											<select class="long98" name="register.shiyongchanghe" id="sych">
												<option value=""></option>
												<option value="住宅小区">住宅小区</option>
												<option value="写字楼">写字楼</option>
												<option value="宾馆">宾馆</option>
												<option value="学校">学校</option>
												<option value="医院" >医院</option>
												<option value="商场超市">商场超市</option>
												<option value="餐饮场所" >餐饮场所</option>
												<option value="娱乐场所">娱乐场所</option>
												<option value="旅游景点" >旅游景点</option>
												<option value="厂区">厂区</option>
												<option value="其他">其他</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>制造许可证编号</th>
										<td>
											<input class="ui-input long80" name="register.zzdw_zigezhengshuhao" />
										</td>
										<th>制造日期</th>
										<td>
											<input class="ui-input long98" name="register.zhizaoriqi_str" />
										</td>
									</tr>
									<tr>
										<th>制造单位统一社会信用代码</th>
										<td>
											<input class="ui-input long98" name="register.zhizaodanweidaima" />
										</td>
										<th>产品品牌</th>
										<td>
											<input class="ui-input long98" name="register.chanpinpinpai" />
										</td>
									</tr>
								</table>
	        			</li>
					</ul>

				</div>
			</form>
		</div>
	</body>
</html>
<script src="<%=path %>/js/page_tabs/page_tabs.js"></script>
<script type="text/javascript">
	
	$("#djlb").selectmenu();
	$("#jylb").selectmenu();
	$("#jyjl").selectmenu();
	$("#rkmj").selectmenu();
	$("#zdwx").selectmenu();
	$("#lengku").selectmenu();
	$("#sych").selectmenu();
	var sblbdm = "";
	
	$().ready(function(){
		
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${param.zldm}"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie,yzc_shebeipinzhong",data.dirDatas,"200px",false,"<%=path%>");
					$("#yzc_shebeileibie").selectmenu({
						change:function(){
							sblbdm = $("#yzc_shebeileibie").val();
							$STONE.creatChildSelectMenuBySeType("yzc_shebeileibie,yzc_shebeipinzhong","yzc_shebeileibie",sblbdm,"200px","<%=path%>");
			    			showCpsjb(sblbdm,"");
					}
					});
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			
		//提交表单
		$("#mnubtn_zcdj_add_save${uuid}").click(function(){
			showCpsjb(sblbdm,"del");
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
		
		//通过信用代码进行提取
		$("#xydmtq").click(function(){
			const data = { xydm: $('#xydm').val() }
			let flag = false;
			$.ajax({
				type: "POST",
				url: "<%=path%>/syUtils!findSydwBaseByXydm.do",
				data: data,
				dataType:"json",
				async: false,
				success: function(data, textStatus){
					const result = data.dwMap
					if(result !== null && result !== undefined){
						flag = true;
						$("#reg_add_sydw").val(result.entname);
						$("#reg_add_sydw").attr("onfocus","this.blur()");
						$("#reg_add_sydw_dz").val(result.dom);
						$("#xydm").attr("onfocus","this.blur()");
						$("#xydmtq").hide();
					}else if (state === 0) {
						$.dialog.alert("请确认信用代码是否填写正确");
						$("#reg_add_sydw").attr("onfocus","");
					}
				}
			});
			return flag;
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
	function showCpsjb(sblbdm,type){
		$("#cpsjb_msg").hide();
		if(sblbdm == "3300"){//自动扶梯
			if("del" == type){
				$("#zdftzdrxd_cw").remove();
			}else{
				$("#zdftzdrxd_cw").hide();
			}
			$("#zdftzdrxd").show();
		}else{
			$("#zdftzdrxd_cw").show();
			if("del" == type){
				$("#zdftzdrxd").remove();
			}else{
				$("#zdftzdrxd").hide();
			}
		}
	}
	</script> 