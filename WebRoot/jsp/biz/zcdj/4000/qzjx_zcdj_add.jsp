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
<link href="<%=path %>/css/page_tabs/page_tabs.css" rel="stylesheet" type="text/css">
<style type="text/css">

.long98{
  width:92%;
}
.long85{
  width:80%;
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
.chanpinshujubiao{
	display: none;
}
.twoWidth{
	width: 85px
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
		   			<div style="width: 80%;text-align: center;font-size: 30px">
		   				特种设备使用登记表
		   			</div>
		   			<br/>
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.filepath"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="起重机械"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="${param.zldm}"/>
	                	 <input type="hidden" name="register.tjstate" value="0"/>
	                </div>
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
								<td style="width: 35%">起重机械</td>
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
								<td >
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
								<td >
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
									<select class="long98" name="register.jianyanjielun" id="jyjl">
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
								<td colspan="3">
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
						</li>
						<li class="tab_con">
							<div id="cpsjb_msg">
								<font color="red">请先选择设备类别！</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<br/>
								<div id="cpsjb_title" style="width: 80%; text-align: center; font-size: 30px"></div>
								<br/>
								<div style="text-align: right;width: 80%">
									编号：<input class="ui-input" name="register.bianhao" />
								</div>
								<table class="tabjcxx">
									<tr>
										<th style="width: 25%">产品品种</th>
										<td style="width: 25%">
											同登记表
										</td>
										<th style="width: 25%">产品总图图号</th>
										<td style="width: 25%">
											<input class="ui-input long98" name="register.chanpintuhao" />
										</td>
									</tr>
									<tr>
										<th>整机制造标准</th>
										<td>
											<input class="ui-input long98" name="register.zhizaobiaozhun" />
										</td>
										<th>设计使用年限</th>
										<td>
											同登记表
										</td>
									</tr>
									<tr>
										<th>型式试验机构</th>
										<td colspan="3">
											同登记表
										</td>
									</tr>
									<tr>
										<th>型式试验日期</th>
										<td>
											<input class="ui-input long98" name="register.xingshishiyanriqi" onclick="WdatePicker()" />
										</td>
										<th>型式试验证书编号</th>
										<td>
											<input class="ui-input long98" name="register.xingshishiyanzhengshu" />
										</td>
									</tr>
								</table>
							<div class="chanpinshujubiao" leibie="4100" >
								<table class="tabjcxx">
									<tr>
										<th colspan="4" style="border-top: none;">主要参数和用途</th>
									</tr>
									<tr>
										<th style="width: 25%">额定起重量</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.edingqizhongliang" />t
										</td>
										<th style="width: 25%">起升速度</th>
										<td style="width: 25%">
											<input class="ui-input twoWidth" name="register.sudu" />m/min
										</td>
									</tr>
									<tr>
										<th>起升高度</th>
										<td>
											<input class="ui-input long98" name="register.qishenggaodu" />m
										</td>
										<th>大车运行速度</th>
										<td>
											<input class="ui-input twoWidth" name="register.dachejiju" />m/min
										</td>
									</tr>
									<tr>
										<th>小车运行速度</th>
										<td>
											<input class="ui-input long85" name="register.xiaocheguiju" />m/min
										</td>
										<th>跨度</th>
										<td>
											<input class="ui-input long85" name="register.kuadu" />m
										</td>
									</tr>
									<tr>
										<th>工作级别</th>
										<td>
											<input class="ui-input long85" name="register.gongzuojibie" />
										</td>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" />kW
										</td>
									</tr>
									<tr>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" />t
										</td>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" />
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>主梁型式</th>
										<td colspan="3">
											<input type="radio" name="register.zhuliangxingshi" value="箱式" checked="checked" />箱式
											<input type="radio" name="register.zhuliangxingshi" value="桁架式" />桁架式
											<input type="radio" name="register.zhuliangxingshi" value="其他" />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" />
										</td>
									</tr>
								</table>
							</div>
							<div class="chanpinshujubiao" leibie="4200" >
								<table class="tabjcxx">
									<tr>
										<th colspan="4" style="border-top: none;">主要参数和用途</th>
									</tr>
									<tr>
										<th style="width: 25%">额定起重量</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.edingqizhongliang" />t
										</td>
										<th style="width: 25%">跨度/有效悬臂长</th>
										<td style="width: 25%">
											<input class="ui-input twoWidth" name="register.kuadu" />
											/
											<input class="ui-input twoWidth" name="register.xuanbichang" />m
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" />
										</td>
										<th>起升高度/下降深度</th>
										<td>
											<input class="ui-input twoWidth" name="register.qishenggaodu" />
											/
											<input class="ui-input twoWidth" name="register.xiajiangshendu" />m
										</td>
									</tr>
									<tr>
										<th>大车基距</th>
										<td>
											<input class="ui-input long85" name="register.dachejiju" />m
										</td>
										<th>小车轨距</th>
										<td>
											<input class="ui-input long85" name="register.xiaocheguiju" />m
										</td>
									</tr>
									<tr>
										<th>主钩左右极限位置</th>
										<td>
											<input class="ui-input long85" name="register.zhugouweizhi" />m
										</td>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" />kW
										</td>
									</tr>
									<tr>
										<th>最大计算轮压</th>
										<td>
											<input class="ui-input long85" name="register.zuidalunya" />kN
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" />t
										</td>
									</tr>
									<tr>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" />Hz
										</td>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" />℃
										</td>
									</tr>
									<tr>
										<th>使用场所</th>
										<td colspan="3">
											<input type="radio" name="register.shiyongchanghe" value="露天" checked="checked" />露天
											<input type="radio" name="register.shiyongchanghe" value="室内" />室内
											<input type="radio" name="register.shiyongchanghe" value="防爆" />防爆
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>主梁型式</th>
										<td colspan="3">
											<input type="radio" name="register.zhuliangxingshi" value="正轨箱形梁" checked="checked" />正轨箱形梁
											<input type="radio" name="register.zhuliangxingshi" value="偏轨箱形梁" />偏轨箱形梁
											<input type="radio" name="register.zhuliangxingshi" value="单腹板梁" />单腹板梁
											<input type="radio" name="register.zhuliangxingshi" value="桁架梁" />桁架梁
											<input type="radio" name="register.zhuliangxingshi" value="导梁" />导梁
											<input type="radio" name="register.zhuliangxingshi" value="其他" />其他
										</td>
									</tr>
									<tr>
										<th>支腿型式</th>
										<td colspan="3">
											<input type="radio" name="register.zhituixingshi" value="箱形" checked="checked" />箱形
											<input type="radio" name="register.zhituixingshi" value="桁架" />桁架
											<input type="radio" name="register.zhituixingshi" value="其他" />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" />
										</td>
									</tr>
								</table>
							</div>
							<div class="chanpinshujubiao" leibie="4300" >
								<table class="tabjcxx">
									<tr>
										<th colspan="4" style="border-top: none;">主要参数和用途</th>
									</tr>
									<tr>
										<th style="width: 25%">额定起重力矩</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.edingqizhongliju" />t•m
										</td>
										<th style="width: 25%">最大起重力矩</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.zuidaqizhongliju" />t•m
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" />
										</td>
										<th>最大起升高度</th>
										<td>
											<input class="ui-input long85" name="register.qishenggaodu" />m
										</td>
									</tr>
									<tr>
										<th>最小/最大工作幅度</th>
										<td>
											<input class="ui-input twoWidth" name="register.zuixiao_gongzuofudu" />/
											<input class="ui-input twoWidth" name="register.zuida_gongzuofudu" />m
										</td>
										<th>最小/最大工作幅度对应的起重量</th>
										<td>
											<input class="ui-input twoWidth" name="register.zuixiao_gongzuofudu_qzl" />/
											<input class="ui-input twoWidth" name="register.zuida_gongzuofudu_qzl" />t
										</td>
									</tr>
									<tr>
										<th>独立高度</th>
										<td>
											<input class="ui-input long85" name="register.gaodu" />m
										</td>
										<th>最大附着高度</th>
										<td>
											<input class="ui-input long85" name="register.fuzhegaodu" />m
										</td>
									</tr>
									<tr>
										<th>最大计算轮压</th>
										<td>
											<input class="ui-input long85" name="register.zuidalunya" />kN
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" />t
										</td>
									</tr>
									<tr>
										<th>运行轨距</th>
										<td>
											<input class="ui-input long85" name="register.guiju" />m
										</td>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" />kW
										</td>
									</tr>
									<tr>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" />Hz
										</td>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" />℃
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>主体结构型式</th>
										<td colspan="3">
											<input type="radio" name="register.jiegouxingshi" value="平头式" checked="checked" />平头式
											<input type="radio" name="register.jiegouxingshi" value="非平头水平臂" />非平头水平臂
											<input type="radio" name="register.jiegouxingshi" value="动臂式" />动臂式
											<input type="radio" name="register.jiegouxingshi" value="上回转" />上回转
											<input type="radio" name="register.jiegouxingshi" value="下回转" />下回转
											<input type="radio" name="register.jiegouxingshi" value="其他" />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" />
										</td>
									</tr>
									<tr>
										<th>变幅方式</th>
										<td colspan="3">
											<input type="radio" name="register.bianfufangshi" value="水平臂小车变幅" checked="checked" />水平臂小车变幅
											<input type="radio" name="register.bianfufangshi" value="倾斜式小车变幅" />倾斜式小车变幅
											<input type="radio" name="register.bianfufangshi" value="动臂变幅" />动臂变幅
										</td>
									</tr>
									<tr>
										<th>塔身标准节型式</th>
										<td>
											<input type="radio" name="register.biaozhunjiexingshi" value="整体式" checked="checked" />整体式
											<input type="radio" name="register.biaozhunjiexingshi" value="组合式" />组合式
										</td>
										<th>基座型式</th>
										<td>
											<input type="radio" name="register.jizuoxingshi" value="固定式" checked="checked" />固定式
											<input type="radio" name="register.jizuoxingshi" value="轨行式" />轨行式
										</td>
									</tr>
								</table>
							</div>
							<div class="chanpinshujubiao" leibie="4400" >
								<table class="tabjcxx">
									<tr>
										<th colspan="4" style="border-top: none;">主要参数和用途</th>
									</tr>
									<tr>
										<th style="width: 25%">额定起重量</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.edingqizhongliang" />t
										</td>
										<th style="width: 25%">额定起重力矩</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.edingqizhongliju" />t•m
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" />
										</td>
										<th>最大起升高度</th>
										<td>
											<input class="ui-input long85" name="register.qishenggaodu" />m
										</td>
									</tr>
									<tr>
										<th>最小/最大工作幅度</th>
										<td>
											<input class="ui-input twoWidth" name="register.zuixiao_gongzuofudu" />/
											<input class="ui-input twoWidth" name="register.zuida_gongzuofudu" />m
										</td>
										<th>最小/最大工作幅度对应的起重量</th>
										<td>
											<input class="ui-input twoWidth" name="register.zuixiao_gongzuofudu_qzl" />/
											<input class="ui-input twoWidth" name="register.zuida_gongzuofudu_qzl" />t
										</td>
									</tr>
									<tr>
										<th>全程变幅时间</th>
										<td>
											<input class="ui-input long85" name="register.bianfushijian" />s
										</td>
										<th>行走机械轨距</th>
										<td>
											<input class="ui-input long85" name="register.guiju" />m
										</td>
									</tr>
									<tr>
										<th>行驶速度</th>
										<td>
											<input class="ui-input" name="register.yidongsudu" />m/min
										</td>
										<th>支腿调节长度</th>
										<td>
											<input class="ui-input long85" name="register.zhituitiaojiechangdu" />mm
										</td>
									</tr>
									<tr>
										<th>最大计算轮压</th>
										<td>
											<input class="ui-input long85" name="register.zuidalunya" />kN
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" />t
										</td>
									</tr>
									<tr>
										<th>整机功率</th>
										<td>
											<input class="ui-input" name="register.zhengjizonggonglv" />kW
										</td>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" />℃
										</td>
									</tr>
									<tr>
										<th>发动机型号/ VIN代号/编号</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.vinma" />
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>臂架型式</th>
										<td colspan="3">
											<input type="radio" name="register.bijiaxingshi" value="定长式" checked="checked" />定长式
											<input type="radio" name="register.bijiaxingshi" value="桁架式" />桁架式
											<input type="radio" name="register.bijiaxingshi" value="伸缩式" />伸缩式
											<input type="radio" name="register.bijiaxingshi" value="立柱式" />立柱式
											<input type="radio" name="register.bijiaxingshi" value="其他" />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" />
										</td>
									</tr>
								</table>
							</div>
							<div class="chanpinshujubiao" leibie="4700" >
								<table class="tabjcxx">
									<tr>
										<th colspan="4" style="border-top: none;">主要参数和用途</th>
									</tr>
									<tr>
										<th style="width: 25%">额定起重力矩</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.edingqizhongliju" />t•m
										</td>
										<th style="width: 25%">最大起重力矩</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.zuidaqizhongliju" />t•m
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" />
										</td>
										<th>起升高度(轨上/轨下)</th>
										<td>
											<input class="ui-input long85" name="register.qishenggaodu" />m
										</td>
									</tr>
									<tr>
										<th>最小/最大工作幅度</th>
										<td>
											<input class="ui-input twoWidth" name="register.zuixiao_gongzuofudu" />/
											<input class="ui-input twoWidth" name="register.zuida_gongzuofudu" />m
										</td>
										<th>最小/最大工作幅度对应的起重量</th>
										<td>
											<input class="ui-input twoWidth" name="register.zuixiao_gongzuofudu_qzl" />/
											<input class="ui-input twoWidth" name="register.zuida_gongzuofudu_qzl" />t
										</td>
									</tr>
									<tr>
										<th>整机最大高度</th>
										<td>
											<input class="ui-input long85" name="register.gaodu" />m
										</td>
										<th>全程变幅时间</th>
										<td>
											<input class="ui-input" name="register.bianfushijian" />m/min
										</td>
									</tr>
									<tr>
										<th>行走机械轨距</th>
										<td>
											<input class="ui-input long85" name="register.guiju" />m
										</td>
										<th>支腿调节长度</th>
										<td>
											<input class="ui-input long85" name="register.zhituitiaojiechangdu" />mm
										</td>
									</tr>
									<tr>
										<th>最大计算轮压</th>
										<td>
											<input class="ui-input long85" name="register.zuidalunya" />kN
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" />t
										</td>
									</tr>
									<tr>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" />Hz
										</td>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" />kW
										</td>
									</tr>
									<tr>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" />℃
										</td>
										<th>用  途</th>
										<td>
											<input class="ui-input long98" name="register.yongtu" />
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>臂架结构型式</th>
										<td colspan="3">
											<input type="radio" name="register.bijiajiegouxingshi" value="组合臂架" checked="checked" />组合臂架
											<input type="radio" name="register.bijiajiegouxingshi" value="单臂架" />单臂架
											<input type="radio" name="register.bijiajiegouxingshi" value="其他" />其他
										</td>
									</tr>
									<tr>
										<th>门架结构型式</th>
										<td>
											<input type="radio" name="register.menjiaxingshi" value="圆筒型" checked="checked" />圆筒型
											<input type="radio" name="register.menjiaxingshi" value="交叉式" />交叉式
											<input type="radio" name="register.menjiaxingshi" value="撑杆式" />撑杆式
											<input type="radio" name="register.menjiaxingshi" value="桁架式" />桁架式
										</td>
										<th>回转支承型式</th>
										<td>
											<input type="radio" name="register.huizhuanxingshi" value="转盘式" checked="checked" />转盘式
											<input type="radio" name="register.huizhuanxingshi" value="柱式" />柱式
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" />
										</td>
									</tr>
								</table>
							</div>
							<div class="chanpinshujubiao" leibie="4800" >
								<table class="tabjcxx">
									<tr>
										<th colspan="4" style="border-top: none;">主要参数和用途</th>
									</tr>
									<tr>
										<th style="width: 25%">额定载重量</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.edingqizhongliang" />t
										</td>
										<th style="width: 25%">额定速度</th>
										<td style="width: 25%">
											<input class="ui-input" name="register.sudu" />m/min
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" />
										</td>
										<th>自由端高度</th>
										<td>
											<input class="ui-input long85" name="register.gaodu" />m
										</td>
									</tr>
									<tr>
										<th>最大提升高度</th>
										<td>
											<input class="ui-input long85" name="register.qishenggaodu" />m
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" />t
										</td>
									</tr>
									<tr>
										<th>吊笼工作行程</th>
										<td>
											<input class="ui-input long85" name="register.diaolonggongzuoxingcheng" />m
										</td>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" />kW
										</td>
									</tr>
									<tr>
										<th>吊笼尺寸(长×宽×高)</th>
										<td colspan="3">
											<input class="ui-input long85" name="register.diaolongchicun" />mm
										</td>
									</tr>
									<tr>
										<th>标准节尺寸(长×宽×高)</th>
										<td colspan="3">
											<input class="ui-input long85" name="register.biaozhunjiechicun" />mm
										</td>
									</tr>
									<tr>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" />Hz
										</td>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" />℃
										</td>
									</tr>
									<tr>
										<th>操纵方式</th>
										<td>
											<input type="radio" name="register.caozuofangshi" value="组合臂架" checked="checked" />组合臂架
											<input type="radio" name="register.caozuofangshi" value="单臂架" />单臂架
											<input type="radio" name="register.caozuofangshi" value="其他" />其他
										</td>
										<th>用  途</th>
										<td>
											<input type="radio" name="register.yongtu" value="人货" checked="checked" />人货
											<input type="radio" name="register.yongtu" value="货用" />货用
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>驱动机构型式</th>
										<td colspan="3">
											<input type="radio" name="register.qudongjigouxingshi" value="曳引式" checked="checked" />曳引式
											<input type="radio" name="register.qudongjigouxingshi" value="钢丝绳式" />钢丝绳式
											<input type="radio" name="register.qudongjigouxingshi" value="齿轮齿条式" />齿轮齿条式
											<input type="radio" name="register.qudongjigouxingshi" value="液压式" />液压式
											<input type="radio" name="register.qudongjigouxingshi" value="强制式" />强制式
											<input type="radio" name="register.qudongjigouxingshi" value="有对重(或平衡重)" />有对重(或平衡重)
											<input type="radio" name="register.qudongjigouxingshi" value="其他" />其他
										</td>
									</tr>
									<tr>
										<th>吊笼数量</th>
										<td>
											<input type="radio" name="register.diaolongshuliang" value="单笼" checked="checked" />单笼
											<input type="radio" name="register.diaolongshuliang" value="双笼" />双笼
										</td>
										<th>导 轨 架</th>
										<td>
											<input type="radio" name="register.daoguijia" value="单" checked="checked" />单
											<input type="radio" name="register.daoguijia" value="双" />双
										</td>
									</tr>
									<tr>
										<th>标准节加节方式</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.biaozhunjiexingshi" />
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" />
										</td>
									</tr>
								</table>
							</div>
							<div class="chanpinshujubiao" leibie="4900" >
								<table class="tabjcxx">
									<tr>
										<th colspan="4" style="border-top: none;">主要参数和用途</th>
									</tr>
									<tr>
										<th style="width: 25%">额定起重量</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.edingqizhongliang" />t
										</td>
										<th style="width: 25%">幅  度</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.fudu" />m
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" />
										</td>
										<th>吊具最高高度</th>
										<td>
											<input class="ui-input long85" name="register.diaojugaodu_zuigao" />m
										</td>
									</tr>
									<tr>
										<th>承载索垂度</th>
										<td>
											<input class="ui-input long85" name="register.chengzaisuochuidu" />m
										</td>
										<th>吊具最低高度</th>
										<td>
											<input class="ui-input long85" name="register.diaojugaodu_zuidi" />m
										</td>
									</tr>
									<tr>
										<th>承载索型号</th>
										<td>
											<input class="ui-input long98" name="register.chengzaisuoxinghao" />
										</td>
										<th>牵引索型号</th>
										<td>
											<input class="ui-input long98" name="register.qianyinsuoxinghao" />
										</td>
									</tr>
									<tr>
										<th>安装高程</th>
										<td>
											<input class="ui-input long85" name="register.anzhuanggaocheng" />m
										</td>
										<th>垂跨比</th>
										<td>
											<input class="ui-input long85" name="register.chuikuabi" />％
										</td>
									</tr>
									<tr>
										<th>回转范围</th>
										<td>
											<input class="ui-input long85" name="register.huizhuanfanwei" />m
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" />t
										</td>
									</tr>
									<tr>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" />kW
										</td>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" />Hz
										</td>
									</tr>
									<tr>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" />℃
										</td>
										<th>其它</th>
										<td>
											<input class="ui-input long98" name="register.qita" />
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>主体结构型式</th>
										<td colspan="3">
											<input type="radio" name="register.jiegouxingshi" value="固定式" checked="checked" />固定式
											<input type="radio" name="register.jiegouxingshi" value="平移式" />平移式
											<input type="radio" name="register.jiegouxingshi" value="辐射式" />辐射式
											<input type="radio" name="register.jiegouxingshi" value="摇摆式" />摇摆式
											<input type="radio" name="register.jiegouxingshi" value="弧动式" />弧动式
											<input type="radio" name="register.jiegouxingshi" value="索轨式" />索轨式
											<input type="radio" name="register.jiegouxingshi" value="其他" />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" />
										</td>
									</tr>
								</table>
							</div>
							<div class="chanpinshujubiao" leibie="4A00" >
								<table class="tabjcxx">
									<tr>
										<th colspan="4" style="border-top: none;">主要参数和用途</th>
									</tr>
									<tr>
										<th style="width: 25%">主钩最大额定起重量</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.zg_edingqizhongliang" />t
										</td>
										<th style="width: 25%">副钩最大额定起重量</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.fg_edingqizhongliang" />t
										</td>
									</tr>
									<tr>
										<th>主钩最大工作幅度</th>
										<td>
											<input class="ui-input long85" name="register.zg_gongzuofudu" />m
										</td>
										<th>副钩最大工作幅度</th>
										<td>
											<input class="ui-input long85" name="register.fg_gongzuofudu" />m
										</td>
									</tr>
									<tr>
										<th>主钩最大工作幅度时的额定起重量</th>
										<td>
											<input class="ui-input long85" name="register.zg_gongzuofudu_qzl" />t
										</td>
										<th>副钩最大工作幅度时的额定起重量</th>
										<td>
											<input class="ui-input long85" name="register.fg_gongzuofudu_qzl" />t
										</td>
									</tr>
									<tr>
										<th>主钩最大起升高度</th>
										<td>
											<input class="ui-input long85" name="register.zg_qishenggaodu" />m
										</td>
										<th>副钩最大起升高度</th>
										<td>
											<input class="ui-input long85" name="register.fg_qishenggaodu" />m
										</td>
									</tr>
									<tr>
										<th>主钩起升速度</th>
										<td>
											<input class="ui-input" name="register.zg_qishengsudu" />m/min
										</td>
										<th>副钩起升速度</th>
										<td>
											<input class="ui-input" name="register.fg_qishengsudu" />m/min
										</td>
									</tr>
									<tr>
										<th>回转角度</th>
										<td>
											<input class="ui-input long85" name="register.huizhuanjiaodu" />°
										</td>
										<th>行走范围</th>
										<td>
											<input class="ui-input long85" name="register.xingzoufanwei" />m
										</td>
									</tr>
									<tr>
										<th>行走速度</th>
										<td>
											<input class="ui-input" name="register.yidongsudu" />m/min
										</td>
										<th>主调速方式</th>
										<td>
											<input class="ui-input long98" name="register.tiaosufangshi" />
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" />
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" />t
										</td>
									</tr>
									<tr>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" />kW
										</td>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" />Hz
										</td>
									</tr>
									<tr>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" />℃
										</td>
										<th>其它</th>
										<td>
											<input class="ui-input long98" name="register.qita" />
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>主体结构型式</th>
										<td colspan="3">
											<input type="radio" name="register.jiegouxingshi" value="摇臂式" checked="checked" />摇臂式
											<input type="radio" name="register.jiegouxingshi" value="人字架式" />人字架式
											<input type="radio" name="register.jiegouxingshi" value="单桅式" />单桅式
											<input type="radio" name="register.jiegouxingshi" value="悬臂式" />悬臂式
											<input type="radio" name="register.jiegouxingshi" value="缆绳式" />缆绳式
											<input type="radio" name="register.jiegouxingshi" value="斜撑式" />斜撑式
											<input type="radio" name="register.jiegouxingshi" value="其他" />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" />
										</td>
									</tr>
								</table>
							</div>
							<div class="chanpinshujubiao" leibie="4D00" >
								<table class="tabjcxx">
									<tr>
										<th colspan="4" style="border-top: none;">主要参数和用途</th>
									</tr>
									<tr>
										<th style="width: 25%">层  数</th>
										<td style="width: 25%">
											<input class="ui-input long98" name="register.ceng" />
										</td>
										<th style="width: 25%">存容量</th>
										<td style="width: 25%">
											<input class="ui-input long98" name="register.cunrongliang" />
										</td>
									</tr>
									<tr>
										<th>适停车辆质量</th>
										<td>
											<input class="ui-input long85" name="register.shitingcheliang_zl" />kg
										</td>
										<th>起升驱动方式</th>
										<td>
											<input class="ui-input long98" name="register.qudongxingshi" />
										</td>
									</tr>
									<tr>
										<th>适停车辆尺寸(长×宽×高)</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.shitingcheliang_cc" />
										</td>
									</tr>
									<tr>
										<th>额定升降速度</th>
										<td>
											<input class="ui-input" name="register.sudu" />m/min
										</td>
										<th>额定横移速度</th>
										<td>
											<input class="ui-input" name="register.yidongsudu" />m/min
										</td>
									</tr>
									<tr>
										<th>单车最大进(出)车时间</th>
										<td>
											<input class="ui-input long85" name="register.danchejinchushijian" />s
										</td>
										<th>层高</th>
										<td>
											<input class="ui-input long85" name="register.gaodu" />mm
										</td>
									</tr>
									<tr>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" />kW
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" />t
										</td>
									</tr>
									<tr>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" />Hz
										</td>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" />℃
										</td>
									</tr>
									<tr>
										<th>操作方式</th>
										<td>
											<input type="radio" name="register.caozuofangshi" value="无人" checked="checked" />无人
											<input type="radio" name="register.caozuofangshi" value="准无人" />准无人
											<input type="radio" name="register.caozuofangshi" value="人车共乘" />人车共乘
										</td>
										<th>其它</th>
										<td>
											<input class="ui-input long98" name="register.qita" />
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>起升方式</th>
										<td colspan="3">
											<input type="radio" name="register.yunxingfangshi" value="钢丝绳" checked="checked" />钢丝绳
											<input type="radio" name="register.yunxingfangshi" value="链条" />链条
											<input type="radio" name="register.yunxingfangshi" value="丝杠" />丝杠
											<input type="radio" name="register.yunxingfangshi" value="液压" />液压
											<input type="radio" name="register.yunxingfangshi" value="齿轮齿条式" />齿轮齿条式
											<input type="radio" name="register.yunxingfangshi" value="其他" />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" />
										</td>
									</tr>
								</table>
							</div>
								<table class="tabjcxx" id="aqbhzz">
									<tr>
										<th colspan="7" style="border-top: none;">
											安全保护装置
											<a class="ui-btn ui-btn-sp" id="xinxi_add">增加行</a>
										</th>
									</tr>
									<tr>
										<th style="width: 15%">名称</th>
										<th style="width: 15%">产品编号</th>
										<th style="width: 15%">型号规格</th>
										<th style="width: 15%">制造单位</th>
										<th style="width: 15%">制造日期</th>
										<th style="width: 15%">型式试验合格证号</th>
										<th style="width: 5%">操作</th>
									</tr>
									<tr>
										<td>
											<input class="ui-input long98" name="fjfj_list[0].mingcheng" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[0].chanpinbianhao" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[0].xinghao" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[0].zhizaochangjia" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[0].zhizaoriqi" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[0].hegezhenghao" />
										</td>
										<td>
											<a href="javascript:void(0)" onclick="delRow(this)">删除</a>
										</td>
									</tr>
								</table>
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
	var xxnum = 1;
	
	$().ready(function(){
		
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${param.zldm}"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie,yzc_shebeipinzhong",data.dirDatas,"200px",true,"<%=path%>");
					//产品数据表类别
					creatCpsjbLb(data.dirDatas);
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			
		//提交表单
		$("#mnubtn_zcdj_add_save${uuid}").click(function(){
			if(!yanzhengCpsjbLb()){
				$.dialog.alert('请先选择产品数据表的设备类别!');
				return false;
			}
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
		//添加行
		$("#xinxi_add").click(function(){
			var tr = "<tr>";
			tr += '<td><input class="ui-input long98" name="fjfj_list['+xxnum+'].mingcheng" /></td>';
			tr += '<td><input class="ui-input long98" name="fjfj_list['+xxnum+'].chanpinbianhao" /></td>';
			tr += '<td><input class="ui-input long98" name="fjfj_list['+xxnum+'].xinghao" /></td>';
			tr += '<td><input class="ui-input long98" name="fjfj_list['+xxnum+'].zhizaochangjia" /></td>';
			tr += '<td><input class="ui-input long98" name="fjfj_list['+xxnum+'].zhizaoriqi" /></td>';
			tr += '<td><input class="ui-input long98" name="fjfj_list['+xxnum+'].hegezhenghao" /></td>';
			tr += '<td><a href="javascript:void(0)" onclick="delRow(this)">删除</a></td>';
			tr += '</tr>';
			$("#aqbhzz").append(tr);
			xxnum++;
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
	function creatCpsjbLb(data){
		$.each(data,function(i,v){
			$("#cpsjb_msg").append('<input type="radio" onClick="checkCpsjbLb(\''+v.daima+'\',\''+v.mingcheng+'\')" name="register.cpsjb_leibie" value="'+v.daima+'" />'+v.mingcheng+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
		});
	}
	function checkCpsjbLb(daima,mingcheng){
		$(".chanpinshujubiao").each(function(){
			if($(this).attr("leibie") != daima){
				$(this).hide();
			}else{
				$(this).show();
				$("#cpsjb_title").html(mingcheng+"产品数据表"+"<span style='font-size: 12px;color:red;'>（所有参数后带单位的请填写数字）</span>");
			}
		});
	}
	function yanzhengCpsjbLb(){
		var cpsjblb = $("#cpsjb_msg > input[type='radio']:checked");
		if(cpsjblb.length == 0){
			return false;
		}
		$(".chanpinshujubiao").each(function(){
			if($(this).attr("leibie") != cpsjblb.val()){
				$(this).remove();
			}
		});
		return true;
	}
  	function delRow(obj){  
            var tr=obj.parentNode.parentNode;  
            var tbody=tr.parentNode;  
            tbody.removeChild(tr);
    }
	</script> 