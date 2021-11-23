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
	text-align:center;
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
	  <div class="mod-search cf" style="display:none;">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_edit_save">临时保存</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_edit_tj">提交至审核</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_zcdj_edit_dy">打印</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_zcdj_edit_fj">上传附件</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_fj">资料分类上传</a>
	  </div>
		    	<form id="frm_zcdj_edit${uuid}" method="post" >
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
	                	 <input type="hidden" name="register.id" id="reg_id_${uuid}" value="${register.id}"/>
	                	 <input type="hidden" name="register.filepath" id="zcdjb_filepath_${uuid}" value="${register.filepath}"/>
	                	 <input type="hidden" name="register.fj_filepath" id="zcdjb_filepath_hid_${uuid}" value="${register.fj_filepath}"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="${register.shebeizhonglei}"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="${register.shebeizhongleidaima}"/>
	                	 <input type="hidden" name="register.tjstate" value="${register.tjstate}"/>
	                	 <input type="hidden" name="register.organ_code" value="${register.organ_code}"/>
	                	 <input type="hidden" name="register.creat_user" value="${register.creat_user}"/>
	                	 <input type="hidden" name="register.wtg_yuanyin" value="${register.wtg_yuanyin}"/>
	                	 <input type="hidden" name="register.djz_bf" value="${register.djz_bf}"/>
	                	 <input type="hidden" name="register.djz_af" value="${register.djz_af}"/>
	                	 <input type="hidden" name="register.djz_liushuihao" value="${register.djz_liushuihao}"/>
	                	 <input type="hidden" name="register.shiyongdengjizhenghaoma" value="${register.shiyongdengjizhenghaoma}"/>
	                	 <input type="hidden" name="register.shiyongdanweidizhi_qu" value="${register.shiyongdanweidizhi_qu}"/>
	                </div>
						<div id="message_${uuid}" style="text-align: center;width: 80%"></div>
						<table>
							<tr>
								<th>登记类别：</th>
								<td>
									<select class="long98" name="register.dengjileibie" id="djlb">
										<option value=""></option>
										<option value="新设备首次启用" ${register.dengjileibie=="新设备首次启用" ? "selected":""}>新设备首次启用</option>
										<option value="停用后启用" ${register.dengjileibie=="停用后启用" ? "selected":""}>停用后启用</option>
										<option value="改造" ${register.dengjileibie=="改造" ? "selected":""}>改造</option>
										<option value="使用单位更名" ${register.dengjileibie=="使用单位更名" ? "selected":""}>使用单位更名</option>
										<option value="使用地址变更" ${register.dengjileibie=="使用地址变更" ? "selected":""}>使用地址变更</option>
										<option value="过户" ${register.dengjileibie=="过户" ? "selected":""}>过户</option>
										<option value="移装" ${register.dengjileibie=="移装" ? "selected":""}>移装</option>
										<option value="达到设计使用年限" ${register.dengjileibie=="达到设计使用年限" ? "selected":""}>达到设计使用年限</option>
									</select>
								</td>
							</tr>
						</table>
						<table class="tabjcxx">
							<tr>
								<th rowspan="6" style="width: 10%">设备基本情况</th>
								<th style="width: 15%">设备种类</th>
								<td style="width: 35%">${register.shebeizhonglei}</td>
								<th colspan="2" style="width: 20%">设备类别</th>
								<td style="width: 20%">
									<div id="yzc_shebeileibie_div">
										<select name="register.shebeileibiedaima" sltValue="${register.shebeileibiedaima}" class="long98" id="yzc_shebeileibie"></select>
									</div>
					    		</td>
							</tr>
							<tr>
								<th>设备品种</th>
								<td>
									<div id="yzc_shebeipinzhong_div">
					    				<select class="long98" name="register.shebeipinzhongdaima" sltValue="${register.shebeipinzhongdaima}" id="yzc_shebeipinzhong"></select>
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
									<input class="ui-input long98 required" name="register.shebeidaima"  value="${register.shebeidaima}" />
								</td>
								<th colspan="2">型号(规格)</th>
								<td>
									<input class="ui-input long98" name="register.shebeixinghao" value="${register.shebeixinghao}" />
								</td>
							</tr>
							<tr>
								<th>设计使用年限</th>
								<td>
									<input class="ui-input long98" name="register.shejishiyongnianxian" value="${register.shejishiyongnianxian}" required="required"/>年
								</td>
								<th colspan="2">设计单位名称</th>
								<td>
									<input class="ui-input long98" name="register.shejidanwei" value="${register.shejidanwei}" />
								</td>
							</tr>
							<tr>
								<th>制造单位名称</th>
								<td>
									<input class="ui-input long98" name="register.zhizaodanwei" value="${register.zhizaodanwei}" required="required"/>
								</td>
								<th colspan="2">施工单位名称</th>
								<td>
									<input class="ui-input long98" name="register.shigongdanwei" value="${register.shigongdanwei}" />
								</td>
							</tr>
							<tr>
								<th>监督检验机构名称</th>
								<td>
									<input class="ui-input long98" name="register.jianjiandanwei" value="${register.jianjiandanwei}" />
								</td>
								<th colspan="2">型式试验机构名称</th>
								<td>
									<input class="ui-input long98" name="register.xingshishiyanjiegou" value="${register.xingshishiyanjiegou}" />
								</td>
							</tr>
							<tr>
								<th rowspan="11" style="width: 10%">设备使用情况</th>
								<th>使用单位名称</th>
								<td colspan="4">
									<c:if test="${register.tjstate == '3' || register.tjstate == '0'}">
										<input class="ui-input long98" name="register.shiyongdanwei" value="${register.shiyongdanwei}" id="reg_add_sydw_${uuid}"/>
									</c:if>
									
									<c:if test="${register.tjstate == '1' || register.tjstate == '2' || register.tjstate == '4'}">
										<input class="ui-input long98" name="register.shiyongdanwei" value="${register.shiyongdanwei}" onfocus="this.blur()"/>
									</c:if>
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
									<input class="ui-input long98" name="register.chuchangbianhao" value="${register.chuchangbianhao}" />
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
									<input class="ui-input long98" name="register.neibubianhao" value="${register.neibubianhao}" />
								</td>
								<th colspan="2">设备使用地点</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdidian" value="${register.shiyongdidian}" />
								</td>
							</tr>
							<tr>
								<th>投入使用日期(日期)</th>
								<td>
									日期：<input class="ui-input" name="register.touyongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.touyongriqi}' pattern='yyyy-MM-dd'/>" required="required"/>
									文本：<input class="ui-input" name="register.touyongriqi_str" value="${register.touyongriqi_str}" />
								</td>
								<th colspan="2">单位固定电话</th>
								<td>
									<input class="ui-input long98" name="register.sydw_gudingdianhua" value="${register.sydw_gudingdianhua}" />
								</td>
							</tr>
							<tr>
								<th>安全管理人员</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlirenyuan" value="${register.anquanguanlirenyuan}"/>
								</td>
								<th colspan="2">移动电话</th>
								<td>
									<input class="ui-input long98" name="register.aqglry_lianxidianhua" value="${register.aqglry_lianxidianhua}" />
								</td>
							</tr>
							<tr>
								<th>产权单位名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.chanquandanwei" value="${register.chanquandanwei}"/>
								</td>
							</tr>
							<tr>
								<th>产权单位统一社会</br>信用代码</th>
								<td>
									<input class="ui-input long98" name="register.chanquandanweidaima" value="${register.chanquandanweidaima}" required="required"/>
								</td>
								<th colspan="2">联系电话</th>
								<td>
									<input class="ui-input long98" name="register.cqdw_dianhua" value="${register.cqdw_dianhua}"/>
								</td>
							</tr>
							<tr>
								<th>维保单位</th>
								<td>
									<input class="ui-input long98" name="register.weibaodanwei" value="${register.weibaodanwei}" />
								</td>
								<th colspan="2">联系电话</th>
								<td>
									<input class="ui-input long98" name="register.weibaofuzerendianhua" value="${register.weibaofuzerendianhua}"/>
								</td>
							</tr>
							<tr>
								<th rowspan="4">设备检验情况</th>
								<th>检验机构名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.jianyandanwei" value="${register.jianyandanwei}" required="required"/>
								</td>
							</tr>
							<tr>
								<th>检验类别</th>
								<td>
									<select class="long98" name="register.jianyanleibie" id="jylb">
										<option value=""></option>
										<option value="安装监督检验" ${register.jianyanleibie=="安装监督检验" ? "selected" : ""}>安装监督检验</option>
										<option value="改造监督检验" ${register.jianyanleibie=="改造监督检验" ? "selected" : ""}>改造监督检验</option>
										<option value="重大修理监督检验" ${register.jianyanleibie=="重大修理监督检验" ? "selected" : ""}>重大修理监督检验</option>
										<option value="首次检验" ${register.jianyanleibie=="首次检验" ? "selected" : ""}>首次检验</option>
										<option value="定期检验" ${register.jianyanleibie=="定期检验" ? "selected" : ""}>定期检验</option>
										<option value="达到设计使用年限检验" ${register.jianyanleibie=="达到设计使用年限检验" ? "selected" : ""}>达到设计使用年限检验</option>
										<option value="安全评估" ${register.jianyanleibie=="安全评估" ? "selected" : ""}>安全评估</option>
										<option value="基于风险检验" ${register.jianyanleibie=="基于风险检验" ? "selected" : ""}>基于风险检验</option>
										<option value="事故检验" ${register.jianyanleibie=="事故检验" ? "selected" : ""}>事故检验</option>
										<option value="现场安全确认" ${register.jianyanleibie=="现场安全确认" ? "selected" : ""}>现场安全确认</option>
									</select>
								</td>
								<th>检验报告编号</th>
								<td colspan="2">
									<input class="ui-input long98" name="register.baogaoshubianhao" value="${register.baogaoshubianhao}"/>
								</td>
							</tr>
							<tr>
								<th>检验日期</th>
								<td>
									<input class="ui-input long98" name="register.jianyanriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.jianyanriqi}' pattern='yyyy-MM-dd'/>" required="required"/>
								</td>
								<th colspan="2">检验结论</th>
								<td>
									<select class="long98" name="register.jianyanjielun" id="jyjl">
										<option value=""></option>
										<option value="符合要求" ${register.jianyanjielun == "符合要求" ? "selected":""}>符合要求</option>
										<option value="基本符合要求" ${register.jianyanjielun == "基本符合要求" ? "selected":""}>基本符合要求</option>
										<option value="不符合要求" ${register.jianyanjielun == "不符合要求" ? "selected":""}>不符合要求</option>
										<option value="合格" ${register.jianyanjielun == "合格" ? "selected":""}>合格</option>
										<option value="复检合格" ${register.jianyanjielun == "复检合格" ? "selected":""}>复检合格</option>
										<option value="不合格" ${register.jianyanjielun == "不合格" ? "selected":""}>不合格</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>下次检验日期</th>
								<td>
									<input class="ui-input long98" name="register.xiacijianyanriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" required="required"/>
								</td>
								<th colspan="2"></th>
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
											<td style="width: 15%">
												<input class="ui-input long98" name="register.tianbiaorenyuan" value="${register.tianbiaorenyuan}" />
											</td>
											<td style="width: 10%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.tianbiaoriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.tianbiaoriqi}' pattern='yyyy-MM-dd'/>"/>
											</td>
											<td style="width: 20%">(使用单位公章)</td>
										</tr>
										<tr>
											<td>使用单位安全管理人员：</td>
											<td>${register.anquanguanlirenyuan}</td>
											<td>日期：</td>
											<td>
												<input class="ui-input long98" name="register.aqglry_riqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.aqglry_riqi}' pattern='yyyy-MM-dd'/>"/>
											</td>
											<td><input class="ui-input long98" name="register.shiyongdanwei_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})" value="${register.shiyongdanwei_nyr}"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;">
										说明：<textarea rows="3" style="width: 98%" name="register.beizhu">${register.beizhu}</textarea>
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">登记机关登记人员：</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.zhucedengjirenyuan" value="${register.zhucedengjirenyuan}"/>
											</td>
											<td style="width: 20%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.zhucedengjiriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.zhucedengjiriqi}' pattern='yyyy-MM-dd'/>" />
											</td>
											<td style="width: 20%">（登记机关专用章）</td>
										</tr>
										<tr>
											<td>使用登记证编号：</td>
											<td>
												${register.shiyongdengjizhenghaoma}
											</td>
											<td>登记机关</td>
											<td>
												<input class="ui-input long98" name="register.zhucedengjijigou" value="${register.zhucedengjijigou}" />
											</td>
											<td><input class="ui-input long98" name="register.dengjijiguan_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})" value="${register.dengjijiguan_nyr}"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<th>附件</th>
								<td>
									<div id="zcdjb_fj_${uuid}" style="text-align: center;">没有附件</div>
								</td>
								<td colspan="4">
									<div id="zcdjb_fj_input_${uuid}" style="display: inline;">
									</div>
								</td>
							</tr>
						</table>
						</li>
						<li class="tab_con">
							<div id="cpsjb_msg"></div>
							<br/>
								<div id="cpsjb_title" leibie="4200" style="width: 80%; text-align: center; font-size: 30px"></div>
								<br/>
								<div style="text-align: right;width: 80%">
									编号：<input class="ui-input" name="register.bianhao" value="${register.bianhao}" />
								</div>
								<table class="tabjcxx">
									<tr>
										<th style="width: 25%">产品品种</th>
										<td style="width: 25%">
											${register.shebeipinzhong}
										</td>
										<th style="width: 25%">产品总图图号</th>
										<td style="width: 25%">
											<input class="ui-input long98" name="register.chanpintuhao" value="${register.chanpintuhao}" />
										</td>
									</tr>
									<tr>
										<th>整机制造标准</th>
										<td>
											<input class="ui-input long98" name="register.zhizaobiaozhun" value="${register.zhizaobiaozhun}" />
										</td>
										<th>设计使用年限</th>
										<td>
											${register.shejishiyongnianxian}
										</td>
									</tr>
									<tr>
										<th>型式试验机构</th>
										<td colspan="3">
											${register.xingshishiyanjiegou}
										</td>
									</tr>
									<tr>
										<th>型式试验日期</th>
										<td>
											<input class="ui-input long98" name="register.xingshishiyanriqi" onclick="WdatePicker()" value="${register.xingshishiyanriqi}" />
										</td>
										<th>型式试验证书编号</th>
										<td>
											<input class="ui-input long98" name="register.xingshishiyanzhengshu" value="${register.xingshishiyanzhengshu}" />
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
											<input class="ui-input long85" name="register.edingqizhongliang" value="${register.edingqizhongliang}"/>t
										</td>
										<th style="width: 25%">起升速度</th>
										<td style="width: 25%">
											<input class="ui-input twoWidth" name="register.sudu" value="${register.sudu}"/>m/min
										</td>
									</tr>
									<tr>
										<th>起升高度</th>
										<td>
											<input class="ui-input long98" name="register.qishenggaodu" value="${register.qishenggaodu}"/>m
										</td>
										<th>大车运行速度</th>
										<td>
											<input class="ui-input twoWidth" name="register.dachejiju" value="${register.dachejiju}"/>m/min
										</td>
									</tr>
									<tr>
										<th>小车运行速度</th>
										<td>
											<input class="ui-input long85" name="register.xiaocheguiju" value="${register.xiaocheguiju}"/>m/min
										</td>
										<th>跨度</th>
										<td>
											<input class="ui-input long85" name="register.kuadu" value="${register.kuadu}"/>m
										</td>
									</tr>
									<tr>
										<th>工作级别</th>
										<td>
											<input class="ui-input long85" name="register.gongzuojibie" value="${register.gongzuojibie}"/>
										</td>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" value="${register.zhengjizonggonglv}"/>kW
										</td>
									</tr>
									<tr>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" value="${register.zhengjizhongliang}"/>t
										</td>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" value="${register.gongzuowendu}"/>
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>主梁型式</th>
										<td colspan="3">
											<td colspan="3">
												<input type="radio" name="register.zhuliangxingshi" value="箱式" ${register.zhuliangxingshi == "箱式" ? "checked" : ""} />箱式
												<input type="radio" name="register.zhuliangxingshi" value="桁架式" ${register.zhuliangxingshi == "桁架式" ? "checked" : ""} />桁架式
												<input type="radio" name="register.zhuliangxingshi" value="其他" ${register.zhuliangxingshi == "其他" ? "checked" : ""} />其他
											</td>
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" value="${register.jiegoujiancailiao}"/>
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
											<input class="ui-input long85" name="register.edingqizhongliang" value="${register.edingqizhongliang}" />t
										</td>
										<th style="width: 25%">跨度/有效悬臂长</th>
										<td style="width: 25%">
											<input class="ui-input twoWidth" name="register.kuadu" value="${register.kuadu}" />
											/
											<input class="ui-input twoWidth" name="register.xuanbichang" value="${register.xuanbichang}" />m
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" value="${register.gongzuojibie}" />
										</td>
										<th>起升高度/下降深度</th>
										<td>
											<input class="ui-input twoWidth" name="register.qishenggaodu" value="${register.qishenggaodu}" />
											/
											<input class="ui-input twoWidth" name="register.xiajiangshendu" value="${register.xiajiangshendu}" />m
										</td>
									</tr>
									<tr>
										<th>大车基距</th>
										<td>
											<input class="ui-input long85" name="register.dachejiju" value="${register.dachejiju}" />m
										</td>
										<th>小车轨距</th>
										<td>
											<input class="ui-input long85" name="register.xiaocheguiju" value="${register.xiaocheguiju}" />m
										</td>
									</tr>
									<tr>
										<th>主钩左右极限位置</th>
										<td>
											<input class="ui-input long85" name="register.zhugouweizhi" value="${register.zhugouweizhi}" />m
										</td>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" value="${register.zhengjizonggonglv}" />kW
										</td>
									</tr>
									<tr>
										<th>最大计算轮压</th>
										<td>
											<input class="ui-input long85" name="register.zuidalunya" value="${register.zuidalunya}" />kN
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" value="${register.zhengjizhongliang}" />t
										</td>
									</tr>
									<tr>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" value="${register.gongdiandianyuan_v}" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" value="${register.gongdiandianyuan_hz}" />Hz
										</td>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" value="${register.gongzuowendu}" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" value="${register.gongzuowendu_sx}" />℃
										</td>
									</tr>
									<tr>
										<th>使用场所</th>
										<td colspan="3">
											<input type="radio" name="register.shiyongchanghe" value="露天" ${register.shiyongchanghe == "露天" ? "checked" : ""} />露天
											<input type="radio" name="register.shiyongchanghe" value="室内" ${register.shiyongchanghe == "室内" ? "checked" : ""} />室内
											<input type="radio" name="register.shiyongchanghe" value="防爆" ${register.shiyongchanghe == "防爆" ? "checked" : ""} />防爆
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>主梁型式</th>
										<td colspan="3">
											<input type="radio" name="register.zhuliangxingshi" value="正轨箱形梁" ${register.zhuliangxingshi == "正轨箱形梁" ? "checked" : ""} />正轨箱形梁
											<input type="radio" name="register.zhuliangxingshi" value="偏轨箱形梁" ${register.zhuliangxingshi == "偏轨箱形梁" ? "checked" : ""} />偏轨箱形梁
											<input type="radio" name="register.zhuliangxingshi" value="单腹板梁" ${register.zhuliangxingshi == "单腹板梁" ? "checked" : ""} />单腹板梁
											<input type="radio" name="register.zhuliangxingshi" value="桁架梁" ${register.zhuliangxingshi == "桁架梁" ? "checked" : ""} />桁架梁
											<input type="radio" name="register.zhuliangxingshi" value="导梁" ${register.zhuliangxingshi == "导梁" ? "checked" : ""} />导梁
											<input type="radio" name="register.zhuliangxingshi" value="其他" ${register.zhuliangxingshi == "其他" ? "checked" : ""} />其他
										</td>
									</tr>
									<tr>
										<th>支腿型式</th>
										<td colspan="3">
											<input type="radio" name="register.zhituixingshi" value="箱形" ${register.zhituixingshi == "箱形" ? "checked" : ""} />箱形
											<input type="radio" name="register.zhituixingshi" value="桁架" ${register.zhituixingshi == "桁架" ? "checked" : ""} />桁架
											<input type="radio" name="register.zhituixingshi" value="其他" ${register.zhituixingshi == "其他" ? "checked" : ""} />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" value="${register.jiegoujiancailiao}" />
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
											<input class="ui-input long85" name="register.edingqizhongliju" value="${register.edingqizhongliju}" />t•m
										</td>
										<th style="width: 25%">最大起重力矩</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.zuidaqizhongliju" value="${register.zuidaqizhongliju}" />t•m
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" value="${register.gongzuojibie}" />
										</td>
										<th>最大起升高度</th>
										<td>
											<input class="ui-input long85" name="register.qishenggaodu" value="${register.qishenggaodu}" />m
										</td>
									</tr>
									<tr>
										<th>最小/最大工作幅度</th>
										<td>
											<input class="ui-input twoWidth" name="register.zuixiao_gongzuofudu" value="${register.zuixiao_gongzuofudu}" />/
											<input class="ui-input twoWidth" name="register.zuida_gongzuofudu" value="${register.zuida_gongzuofudu}" />m
										</td>
										<th>最小/最大工作幅度对应的起重量</th>
										<td>
											<input class="ui-input twoWidth" name="register.zuixiao_gongzuofudu_qzl" value="${register.zuixiao_gongzuofudu_qzl}" />/
											<input class="ui-input twoWidth" name="register.zuida_gongzuofudu_qzl" value="${register.zuida_gongzuofudu_qzl}" />t
										</td>
									</tr>
									<tr>
										<th>独立高度</th>
										<td>
											<input class="ui-input long85" name="register.gaodu" value="${register.gaodu}" />m
										</td>
										<th>最大附着高度</th>
										<td>
											<input class="ui-input long85" name="register.fuzhegaodu" value="${register.fuzhegaodu}" />m
										</td>
									</tr>
									<tr>
										<th>最大计算轮压</th>
										<td>
											<input class="ui-input long85" name="register.zuidalunya" value="${register.zuidalunya}" />kN
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" value="${register.zhengjizhongliang}" />t
										</td>
									</tr>
									<tr>
										<th>运行轨距</th>
										<td>
											<input class="ui-input long85" name="register.guiju" value="${register.guiju}" />m
										</td>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" value="${register.zhengjizonggonglv}" />kW
										</td>
									</tr>
									<tr>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" value="${register.gongdiandianyuan_v}" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" value="${register.gongdiandianyuan_hz}" />Hz
										</td>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" value="${register.gongzuowendu}" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" value="${register.gongzuowendu_sx}" />℃
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>主体结构型式</th>
										<td colspan="3">
											<input type="radio" name="register.jiegouxingshi" value="平头式" ${register.jiegouxingshi == "平头式" ? "checked" : ""} />平头式
											<input type="radio" name="register.jiegouxingshi" value="非平头水平臂" ${register.jiegouxingshi == "非平头水平臂" ? "checked" : ""} />非平头水平臂
											<input type="radio" name="register.jiegouxingshi" value="动臂式" ${register.jiegouxingshi == "动臂式" ? "checked" : ""} />动臂式
											<input type="radio" name="register.jiegouxingshi" value="上回转" ${register.jiegouxingshi == "上回转" ? "checked" : ""} />上回转
											<input type="radio" name="register.jiegouxingshi" value="下回转" ${register.jiegouxingshi == "下回转" ? "checked" : ""} />下回转
											<input type="radio" name="register.jiegouxingshi" value="其他" ${register.jiegouxingshi == "其他" ? "checked" : ""} />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" value="${register.jiegoujiancailiao}" />
										</td>
									</tr>
									<tr>
										<th>变幅方式</th>
										<td colspan="3">
											<input type="radio" name="register.bianfufangshi" value="水平臂小车变幅" ${register.bianfufangshi == "水平臂小车变幅" ? "checked" : ""} />水平臂小车变幅
											<input type="radio" name="register.bianfufangshi" value="倾斜式小车变幅" ${register.bianfufangshi == "倾斜式小车变幅" ? "checked" : ""} />倾斜式小车变幅
											<input type="radio" name="register.bianfufangshi" value="动臂变幅" ${register.bianfufangshi == "动臂变幅" ? "checked" : ""} />动臂变幅
										</td>
									</tr>
									<tr>
										<th>塔身标准节型式</th>
										<td>
											<input type="radio" name="register.biaozhunjiexingshi" value="整体式" ${register.biaozhunjiexingshi == "整体式" ? "checked" : ""} />整体式
											<input type="radio" name="register.biaozhunjiexingshi" value="组合式" ${register.biaozhunjiexingshi == "组合式" ? "checked" : ""} />组合式
										</td>
										<th>基座型式</th>
										<td>
											<input type="radio" name="register.jizuoxingshi" value="固定式" ${register.jizuoxingshi == "固定式" ? "checked" : ""} />固定式
											<input type="radio" name="register.jizuoxingshi" value="轨行式" ${register.jizuoxingshi == "轨行式" ? "checked" : ""} />轨行式
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
											<input class="ui-input long85" name="register.edingqizhongliang" value="${register.edingqizhongliang}" />t
										</td>
										<th style="width: 25%">额定起重力矩</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.edingqizhongliju" value="${register.edingqizhongliju}" />t•m
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" value="${register.gongzuojibie}" />
										</td>
										<th>最大起升高度</th>
										<td>
											<input class="ui-input long85" name="register.qishenggaodu" value="${register.qishenggaodu}" />m
										</td>
									</tr>
									<tr>
										<th>最小/最大工作幅度</th>
										<td>
											<input class="ui-input twoWidth" name="register.zuixiao_gongzuofudu" value="${register.zuixiao_gongzuofudu}" />/
											<input class="ui-input twoWidth" name="register.zuida_gongzuofudu" value="${register.zuida_gongzuofudu}" />m
										</td>
										<th>最小/最大工作幅度对应的起重量</th>
										<td>
											<input class="ui-input twoWidth" name="register.zuixiao_gongzuofudu_qzl" value="${register.zuixiao_gongzuofudu_qzl}" />/
											<input class="ui-input twoWidth" name="register.zuida_gongzuofudu_qzl" value="${register.zuida_gongzuofudu_qzl}" />t
										</td>
									</tr>
									<tr>
										<th>全程变幅时间</th>
										<td>
											<input class="ui-input long85" name="register.bianfushijian" value="${register.bianfushijian}" />s
										</td>
										<th>行走机械轨距</th>
										<td>
											<input class="ui-input long85" name="register.guiju" value="${register.guiju}" />m
										</td>
									</tr>
									<tr>
										<th>行驶速度</th>
										<td>
											<input class="ui-input" name="register.yidongsudu" value="${register.yidongsudu}" />m/min
										</td>
										<th>支腿调节长度</th>
										<td>
											<input class="ui-input long85" name="register.zhituitiaojiechangdu" value="${register.zhituitiaojiechangdu}" />mm
										</td>
									</tr>
									<tr>
										<th>最大计算轮压</th>
										<td>
											<input class="ui-input long85" name="register.zuidalunya" value="${register.zuidalunya}" />kN
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" value="${register.zhengjizhongliang}" />t
										</td>
									</tr>
									<tr>
										<th>整机功率</th>
										<td>
											<input class="ui-input" name="register.zhengjizonggonglv" value="${register.zhengjizonggonglv}" />kW
										</td>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" value="${register.gongzuowendu}" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" value="${register.gongzuowendu_sx}" />℃
										</td>
									</tr>
									<tr>
										<th>发动机型号/ VIN代号/编号</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.vinma" value="${register.vinma}" />
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>臂架型式</th>
										<td colspan="3">
											<input type="radio" name="register.bijiaxingshi" value="定长式" ${register.bijiaxingshi == "定长式" ? "checked" : ""} />定长式
											<input type="radio" name="register.bijiaxingshi" value="桁架式" ${register.bijiaxingshi == "桁架式" ? "checked" : ""} />桁架式
											<input type="radio" name="register.bijiaxingshi" value="伸缩式" ${register.bijiaxingshi == "伸缩式" ? "checked" : ""} />伸缩式
											<input type="radio" name="register.bijiaxingshi" value="立柱式" ${register.bijiaxingshi == "立柱式" ? "checked" : ""} />立柱式
											<input type="radio" name="register.bijiaxingshi" value="其他" ${register.bijiaxingshi == "其他" ? "checked" : ""} />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" value="${register.jiegoujiancailiao}" />
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
											<input class="ui-input long85" name="register.edingqizhongliju" value="${register.edingqizhongliju}" />t•m
										</td>
										<th style="width: 25%">最大起重力矩</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.zuidaqizhongliju" value="${register.zuidaqizhongliju}" />t•m
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" value="${register.gongzuojibie}" />
										</td>
										<th>起升高度(轨上/轨下)</th>
										<td>
											<input class="ui-input long85" name="register.qishenggaodu" value="${register.qishenggaodu}" />m
										</td>
									</tr>
									<tr>
										<th>最小/最大工作幅度</th>
										<td>
											<input class="ui-input twoWidth" name="register.zuixiao_gongzuofudu" value="${register.zuixiao_gongzuofudu}" />/
											<input class="ui-input twoWidth" name="register.zuida_gongzuofudu" value="${register.zuida_gongzuofudu}" />m
										</td>
										<th>最小/最大工作幅度对应的起重量</th>
										<td>
											<input class="ui-input twoWidth" name="register.zuixiao_gongzuofudu_qzl" value="${register.zuixiao_gongzuofudu_qzl}" />/
											<input class="ui-input twoWidth" name="register.zuida_gongzuofudu_qzl" value="${register.zuida_gongzuofudu_qzl}" />t
										</td>
									</tr>
									<tr>
										<th>整机最大高度</th>
										<td>
											<input class="ui-input long85" name="register.gaodu" value="${register.gaodu}" />m
										</td>
										<th>全程变幅时间</th>
										<td>
											<input class="ui-input" name="register.bianfushijian" value="${register.bianfushijian}" />m/min
										</td>
									</tr>
									<tr>
										<th>行走机械轨距</th>
										<td>
											<input class="ui-input long85" name="register.guiju" value="${register.guiju}" />m
										</td>
										<th>支腿调节长度</th>
										<td>
											<input class="ui-input long85" name="register.zhituitiaojiechangdu" value="${register.zhituitiaojiechangdu}" />mm
										</td>
									</tr>
									<tr>
										<th>最大计算轮压</th>
										<td>
											<input class="ui-input long85" name="register.zuidalunya" value="${register.zuidalunya}" />kN
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" value="${register.zhengjizhongliang}" />t
										</td>
									</tr>
									<tr>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" value="${register.gongdiandianyuan_v}" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" value="${register.gongdiandianyuan_hz}" />Hz
										</td>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" value="${register.zhengjizonggonglv}" />kW
										</td>
									</tr>
									<tr>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" value="${register.gongzuowendu}" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" value="${register.gongzuowendu_sx}" />℃
										</td>
										<th>用  途</th>
										<td>
											<input class="ui-input long98" name="register.yongtu" value="${register.yongtu}" />
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>臂架结构型式</th>
										<td colspan="3">
											<input type="radio" name="register.bijiajiegouxingshi" value="组合臂架" ${register.bijiajiegouxingshi == "组合臂架" ? "checked" : ""} />组合臂架
											<input type="radio" name="register.bijiajiegouxingshi" value="单臂架" ${register.bijiajiegouxingshi == "单臂架" ? "checked" : ""} />单臂架
											<input type="radio" name="register.bijiajiegouxingshi" value="其他" ${register.bijiajiegouxingshi == "其他" ? "checked" : ""} />其他
										</td>
									</tr>
									<tr>
										<th>门架结构型式</th>
										<td>
											<input type="radio" name="register.menjiaxingshi" value="圆筒型" ${register.menjiaxingshi == "圆筒型" ? "checked" : ""} />圆筒型
											<input type="radio" name="register.menjiaxingshi" value="交叉式" ${register.menjiaxingshi == "交叉式" ? "checked" : ""} />交叉式
											<input type="radio" name="register.menjiaxingshi" value="撑杆式" ${register.menjiaxingshi == "撑杆式" ? "checked" : ""} />撑杆式
											<input type="radio" name="register.menjiaxingshi" value="桁架式" ${register.menjiaxingshi == "桁架式" ? "checked" : ""} />桁架式
										</td>
										<th>回转支承型式</th>
										<td>
											<input type="radio" name="register.huizhuanxingshi" value="转盘式" ${register.huizhuanxingshi == "转盘式" ? "checked" : ""} />转盘式
											<input type="radio" name="register.huizhuanxingshi" value="柱式" ${register.huizhuanxingshi == "柱式" ? "checked" : ""} />柱式
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" value="${register.jiegoujiancailiao}" />
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
											<input class="ui-input long85" name="register.edingqizhongliang" value="${register.edingqizhongliang}" />t
										</td>
										<th style="width: 25%">额定速度</th>
										<td style="width: 25%">
											<input class="ui-input" name="register.sudu" value="${register.sudu}" />m/min
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" value="${register.gongzuojibie}" />
										</td>
										<th>自由端高度</th>
										<td>
											<input class="ui-input long85" name="register.gaodu" value="${register.gaodu}" />m
										</td>
									</tr>
									<tr>
										<th>最大提升高度</th>
										<td>
											<input class="ui-input long85" name="register.qishenggaodu" value="${register.qishenggaodu}" />m
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" value="${register.zhengjizhongliang}" />t
										</td>
									</tr>
									<tr>
										<th>吊笼工作行程</th>
										<td>
											<input class="ui-input long85" name="register.diaolonggongzuoxingcheng" value="${register.diaolonggongzuoxingcheng}" />m
										</td>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" value="${register.zhengjizonggonglv}" />kW
										</td>
									</tr>
									<tr>
										<th>吊笼尺寸(长×宽×高)</th>
										<td colspan="3">
											<input class="ui-input long85" name="register.diaolongchicun" value="${register.diaolongchicun}" />mm
										</td>
									</tr>
									<tr>
										<th>标准节尺寸(长×宽×高)</th>
										<td colspan="3">
											<input class="ui-input long85" name="register.biaozhunjiechicun" value="${register.biaozhunjiechicun}" />mm
										</td>
									</tr>
									<tr>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" value="${register.gongdiandianyuan_v}" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" value="${register.gongdiandianyuan_hz}" />Hz
										</td>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" value="${register.gongzuowendu}" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" value="${register.gongzuowendu_sx}" />℃
										</td>
									</tr>
									<tr>
										<th>操纵方式</th>
										<td>
											<input type="radio" name="register.caozuofangshi" value="组合臂架" ${register.caozuofangshi == "组合臂架" ? "checked" : ""} />组合臂架
											<input type="radio" name="register.caozuofangshi" value="单臂架" ${register.caozuofangshi == "单臂架" ? "checked" : ""} />单臂架
											<input type="radio" name="register.caozuofangshi" value="其他" ${register.caozuofangshi == "其他" ? "checked" : ""} />其他
										</td>
										<th>用  途</th>
										<td>
											<input type="radio" name="register.yongtu" value="人货" ${register.yongtu == "人货" ? "checked" : ""} />人货
											<input type="radio" name="register.yongtu" value="货用" ${register.yongtu == "货用" ? "checked" : ""} />货用
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>驱动机构型式</th>
										<td colspan="3">
											<input type="radio" name="register.qudongjigouxingshi" value="曳引式" ${register.qudongjigouxingshi == "曳引式" ? "checked" : ""} />曳引式
											<input type="radio" name="register.qudongjigouxingshi" value="钢丝绳式" ${register.qudongjigouxingshi == "钢丝绳式" ? "checked" : ""} />钢丝绳式
											<input type="radio" name="register.qudongjigouxingshi" value="齿轮齿条式" ${register.qudongjigouxingshi == "齿轮齿条式" ? "checked" : ""} />齿轮齿条式
											<input type="radio" name="register.qudongjigouxingshi" value="液压式" ${register.qudongjigouxingshi == "液压式" ? "checked" : ""} />液压式
											<input type="radio" name="register.qudongjigouxingshi" value="强制式" ${register.qudongjigouxingshi == "强制式" ? "checked" : ""} />强制式
											<input type="radio" name="register.qudongjigouxingshi" value="有对重(或平衡重)" ${register.qudongjigouxingshi == "有对重(或平衡重)" ? "checked" : ""} />有对重(或平衡重)
											<input type="radio" name="register.qudongjigouxingshi" value="其他" ${register.qudongjigouxingshi == "其他" ? "checked" : ""} />其他
										</td>
									</tr>
									<tr>
										<th>吊笼数量</th>
										<td>
											<input type="radio" name="register.diaolongshuliang" value="单笼" ${register.diaolongshuliang == "单笼" ? "checked" : ""} />单笼
											<input type="radio" name="register.diaolongshuliang" value="双笼" ${register.diaolongshuliang == "双笼" ? "checked" : ""} />双笼
										</td>
										<th>导 轨 架</th>
										<td>
											<input type="radio" name="register.daoguijia" value="单" ${register.daoguijia == "单" ? "checked" : ""} />单
											<input type="radio" name="register.daoguijia" value="双" ${register.daoguijia == "双" ? "checked" : ""} />双
										</td>
									</tr>
									<tr>
										<th>标准节加节方式</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.biaozhunjiexingshi" value="${register.biaozhunjiexingshi}" />
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" value="${register.jiegoujiancailiao}" />
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
											<input class="ui-input long85" name="register.edingqizhongliang" value="${register.edingqizhongliang}" />t
										</td>
										<th style="width: 25%">幅  度</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.fudu" value="${register.fudu}" />m
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" value="${register.gongzuojibie}" />
										</td>
										<th>吊具最高高度</th>
										<td>
											<input class="ui-input long85" name="register.diaojugaodu_zuigao" value="${register.diaojugaodu_zuigao}" />m
										</td>
									</tr>
									<tr>
										<th>承载索垂度</th>
										<td>
											<input class="ui-input long85" name="register.chengzaisuochuidu" value="${register.chengzaisuochuidu}" />m
										</td>
										<th>吊具最低高度</th>
										<td>
											<input class="ui-input long85" name="register.diaojugaodu_zuidi" value="${register.diaojugaodu_zuidi}" />m
										</td>
									</tr>
									<tr>
										<th>承载索型号</th>
										<td>
											<input class="ui-input long98" name="register.chengzaisuoxinghao" value="${register.chengzaisuoxinghao}" />
										</td>
										<th>牵引索型号</th>
										<td>
											<input class="ui-input long98" name="register.qianyinsuoxinghao" value="${register.qianyinsuoxinghao}" />
										</td>
									</tr>
									<tr>
										<th>安装高程</th>
										<td>
											<input class="ui-input long85" name="register.anzhuanggaocheng" value="${register.anzhuanggaocheng}" />m
										</td>
										<th>垂跨比</th>
										<td>
											<input class="ui-input long85" name="register.chuikuabi" value="${register.chuikuabi}" />％
										</td>
									</tr>
									<tr>
										<th>回转范围</th>
										<td>
											<input class="ui-input long85" name="register.huizhuanfanwei" value="${register.huizhuanfanwei}" />m
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" value="${register.zhengjizhongliang}" />t
										</td>
									</tr>
									<tr>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" value="${register.zhengjizonggonglv}" />kW
										</td>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" value="${register.gongdiandianyuan_v}" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" value="${register.gongdiandianyuan_hz}" />Hz
										</td>
									</tr>
									<tr>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" value="${register.gongzuowendu}" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" value="${register.gongzuowendu_sx}" />℃
										</td>
										<th>其它</th>
										<td>
											<input class="ui-input long98" name="register.qita" value="${register.qita}" />
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>主体结构型式</th>
										<td colspan="3">
											<input type="radio" name="register.jiegouxingshi" value="固定式" ${register.jiegouxingshi == "固定式" ? "checked" : ""} />固定式
											<input type="radio" name="register.jiegouxingshi" value="平移式" ${register.jiegouxingshi == "平移式" ? "checked" : ""} />平移式
											<input type="radio" name="register.jiegouxingshi" value="辐射式" ${register.jiegouxingshi == "辐射式" ? "checked" : ""} />辐射式
											<input type="radio" name="register.jiegouxingshi" value="摇摆式" ${register.jiegouxingshi == "摇摆式" ? "checked" : ""} />摇摆式
											<input type="radio" name="register.jiegouxingshi" value="弧动式" ${register.jiegouxingshi == "弧动式" ? "checked" : ""} />弧动式
											<input type="radio" name="register.jiegouxingshi" value="索轨式" ${register.jiegouxingshi == "索轨式" ? "checked" : ""} />索轨式
											<input type="radio" name="register.jiegouxingshi" value="其他" ${register.jiegouxingshi == "其他" ? "checked" : ""} />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" value="${register.jiegoujiancailiao}" />
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
											<input class="ui-input long85" name="register.zg_edingqizhongliang" value="${register.zg_edingqizhongliang}" />t
										</td>
										<th style="width: 25%">副钩最大额定起重量</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.fg_edingqizhongliang" value="${register.fg_edingqizhongliang}" />t
										</td>
									</tr>
									<tr>
										<th>主钩最大工作幅度</th>
										<td>
											<input class="ui-input long85" name="register.zg_gongzuofudu" value="${register.zg_gongzuofudu}" />m
										</td>
										<th>副钩最大工作幅度</th>
										<td>
											<input class="ui-input long85" name="register.fg_gongzuofudu" value="${register.fg_gongzuofudu}" />m
										</td>
									</tr>
									<tr>
										<th>主钩最大工作幅度时的额定起重量</th>
										<td>
											<input class="ui-input long85" name="register.zg_gongzuofudu_qzl" value="${register.zg_gongzuofudu_qzl}" />t
										</td>
										<th>副钩最大工作幅度时的额定起重量</th>
										<td>
											<input class="ui-input long85" name="register.fg_gongzuofudu_qzl" value="${register.fg_gongzuofudu_qzl}" />t
										</td>
									</tr>
									<tr>
										<th>主钩最大起升高度</th>
										<td>
											<input class="ui-input long85" name="register.zg_qishenggaodu" value="${register.zg_qishenggaodu}" />m
										</td>
										<th>副钩最大起升高度</th>
										<td>
											<input class="ui-input long85" name="register.fg_qishenggaodu" value="${register.fg_qishenggaodu}" />m
										</td>
									</tr>
									<tr>
										<th>主钩起升速度</th>
										<td>
											<input class="ui-input" name="register.zg_qishengsudu" value="${register.zg_qishengsudu}" />m/min
										</td>
										<th>副钩起升速度</th>
										<td>
											<input class="ui-input" name="register.fg_qishengsudu" value="${register.fg_qishengsudu}" />m/min
										</td>
									</tr>
									<tr>
										<th>回转角度</th>
										<td>
											<input class="ui-input long85" name="register.huizhuanjiaodu" value="${register.huizhuanjiaodu}" />°
										</td>
										<th>行走范围</th>
										<td>
											<input class="ui-input long85" name="register.xingzoufanwei" value="${register.xingzoufanwei}" />m
										</td>
									</tr>
									<tr>
										<th>行走速度</th>
										<td>
											<input class="ui-input" name="register.yidongsudu" value="${register.yidongsudu}" />m/min
										</td>
										<th>主调速方式</th>
										<td>
											<input class="ui-input long98" name="register.tiaosufangshi" value="${register.tiaosufangshi}" />
										</td>
									</tr>
									<tr>
										<th>整机工作级别</th>
										<td>
											<input class="ui-input long98" name="register.gongzuojibie" value="${register.gongzuojibie}" />
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" value="${register.zhengjizhongliang}" />t
										</td>
									</tr>
									<tr>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" value="${register.zhengjizonggonglv}" />kW
										</td>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" value="${register.gongdiandianyuan_v}" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" value="${register.gongdiandianyuan_hz}" />Hz
										</td>
									</tr>
									<tr>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" value="${register.gongzuowendu}" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" value="${register.gongzuowendu_sx}" />℃
										</td>
										<th>其它</th>
										<td>
											<input class="ui-input long98" name="register.qita" value="${register.qita}" />
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>主体结构型式</th>
										<td colspan="3">
											<input type="radio" name="register.jiegouxingshi" value="摇臂式" ${register.jiegouxingshi == "摇臂式" ? "checked" : "" } />摇臂式
											<input type="radio" name="register.jiegouxingshi" value="人字架式" ${register.jiegouxingshi == "人字架式" ? "checked" : "" } />人字架式
											<input type="radio" name="register.jiegouxingshi" value="单桅式" ${register.jiegouxingshi == "单桅式" ? "checked" : "" } />单桅式
											<input type="radio" name="register.jiegouxingshi" value="悬臂式" ${register.jiegouxingshi == "悬臂式" ? "checked" : "" } />悬臂式
											<input type="radio" name="register.jiegouxingshi" value="缆绳式" ${register.jiegouxingshi == "缆绳式" ? "checked" : "" } />缆绳式
											<input type="radio" name="register.jiegouxingshi" value="斜撑式" ${register.jiegouxingshi == "斜撑式" ? "checked" : "" } />斜撑式
											<input type="radio" name="register.jiegouxingshi" value="其他" ${register.jiegouxingshi == "其他" ? "checked" : "" } />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" value="${register.jiegoujiancailiao}" />
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
											<input class="ui-input long98" name="register.ceng" value="${register.ceng}" />
										</td>
										<th style="width: 25%">存容量</th>
										<td style="width: 25%">
											<input class="ui-input long98" name="register.cunrongliang" value="${register.cunrongliang}" />
										</td>
									</tr>
									<tr>
										<th>适停车辆质量</th>
										<td>
											<input class="ui-input long85" name="register.shitingcheliang_zl" value="${register.shitingcheliang_zl}" />kg
										</td>
										<th>起升驱动方式</th>
										<td>
											<input class="ui-input long98" name="register.qudongxingshi" value="${register.qudongxingshi}" />
										</td>
									</tr>
									<tr>
										<th>适停车辆尺寸(长×宽×高)</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.shitingcheliang_cc" value="${register.shitingcheliang_cc}" />
										</td>
									</tr>
									<tr>
										<th>额定升降速度</th>
										<td>
											<input class="ui-input" name="register.sudu" value="${register.sudu}" />m/min
										</td>
										<th>额定横移速度</th>
										<td>
											<input class="ui-input" name="register.yidongsudu" value="${register.yidongsudu}" />m/min
										</td>
									</tr>
									<tr>
										<th>单车最大进(出)车时间</th>
										<td>
											<input class="ui-input long85" name="register.danchejinchushijian" value="${register.danchejinchushijian}" />s
										</td>
										<th>层高</th>
										<td>
											<input class="ui-input long85" name="register.gaodu" value="${register.gaodu}" />mm
										</td>
									</tr>
									<tr>
										<th>整机功率</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizonggonglv" value="${register.zhengjizonggonglv}" />kW
										</td>
										<th>整机设计重量</th>
										<td>
											<input class="ui-input long85" name="register.zhengjizhongliang" value="${register.zhengjizhongliang}" />t
										</td>
									</tr>
									<tr>
										<th>供电电源</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_v" value="${register.gongdiandianyuan_v}" />V
											<input class="ui-input twoWidth" name="register.gongdiandianyuan_hz" value="${register.gongdiandianyuan_hz}" />Hz
										</td>
										<th>工作环境温度</th>
										<td>
											<input class="ui-input twoWidth" name="register.gongzuowendu" value="${register.gongzuowendu}" />
											~
											<input class="ui-input twoWidth" name="register.gongzuowendu_sx" value="${register.gongzuowendu_sx}" />℃
										</td>
									</tr>
									<tr>
										<th>操作方式</th>
										<td>
											<input type="radio" name="register.caozuofangshi" value="无人" ${register.caozuofangshi == "无人" ? "checked" : "" } />无人
											<input type="radio" name="register.caozuofangshi" value="准无人" ${register.caozuofangshi == "准无人" ? "checked" : "" } />准无人
											<input type="radio" name="register.caozuofangshi" value="人车共乘" ${register.caozuofangshi == "人车共乘" ? "checked" : "" } />人车共乘
										</td>
										<th>其它</th>
										<td>
											<input class="ui-input long98" name="register.qita" value="${register.qita}" />
										</td>
									</tr>
									<tr>
										<th colspan="4">主要结构型式</th>
									</tr>
									<tr>
										<th>起升方式</th>
										<td colspan="3">
											<input type="radio" name="register.yunxingfangshi" value="钢丝绳" ${register.yunxingfangshi == "钢丝绳" ? "checked" : "" } />钢丝绳
											<input type="radio" name="register.yunxingfangshi" value="链条" ${register.yunxingfangshi == "链条" ? "checked" : "" } />链条
											<input type="radio" name="register.yunxingfangshi" value="丝杠" ${register.yunxingfangshi == "丝杠" ? "checked" : "" } />丝杠
											<input type="radio" name="register.yunxingfangshi" value="液压" ${register.yunxingfangshi == "液压" ? "checked" : "" } />液压
											<input type="radio" name="register.yunxingfangshi" value="齿轮齿条式" ${register.yunxingfangshi == "齿轮齿条式" ? "checked" : "" } />齿轮齿条式
											<input type="radio" name="register.yunxingfangshi" value="其他" ${register.yunxingfangshi == "其他" ? "checked" : "" } />其他
										</td>
									</tr>
									<tr>
										<th>主要受力结构件材料</th>
										<td colspan="3">
											<input class="ui-input long98" name="register.jiegoujiancailiao" value="${register.jiegoujiancailiao}" />
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
									<c:forEach items="${fjfjList}" var="f" varStatus="i">
									<tr>
										<td>
											<input class="ui-input long98" name="fjfj_list[${i.index}].mingcheng" value="${f.mingcheng}" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[${i.index}].chanpinbianhao" value="${f.chanpinbianhao}" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[${i.index}].xinghao" value="${f.xinghao}" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[${i.index}].zhizaochangjia" value="${f.zhizaochangjia}" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[${i.index}].zhizaoriqi" value="${f.zhizaoriqi}" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[${i.index}].hegezhenghao" value="${f.hegezhenghao}" />
										</td>
										<td>
											<a href="javascript:void(0)" onclick="delRow(this)">删除</a>
										</td>
									</tr>
									</c:forEach>
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
											<input class="ui-input long98" name="register.zhucedaima" value="${register.zhucedaima}"/>
										</td>
										<th >使用单位名称备注</th>
										<td>
											<input class="ui-input long98" name="register.shiyongdanweibeizhu" value="${register.shiyongdanweibeizhu}"/>
										</td>
									</tr>
									<tr>
										<th>是否在人口密集区</th>
										<td>
											<select class="long98" name="register.renkoumijiqu" id="rkmj">
												<option value=""></option>
												<option value="是" ${register.renkoumijiqu=="是" ? "selected":""}>是</option>
												<option value="否" ${register.renkoumijiqu=="否" ? "selected":""}>否</option>
											</select>
										</td>
										<th >是否重大危险源</th>
										<td>
											<select class="long98" name="register.zhongdaweixianyuan" id="zdwx">
												<option value=""></option>
												<option value="是" ${register.zhongdaweixianyuan=="是" ? "selected":""}>是</option>
												<option value="否" ${register.zhongdaweixianyuan=="否" ? "selected":""}>否</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>是否冷库设备</th>
										<td>
											<select class="long98" name="register.lengku" id="lengku">
												<option value=""></option>
												<option value="是" ${register.lengku=="是" ? "selected":""}>是</option>
												<option value="否" ${register.lengku=="否" ? "selected":""}>否</option>
											</select>
										</td>
										<th>制造日期</th>
										<td>
											<input class="ui-input long98" name="register.zhizaoriqi_str" value="${register.zhizaoriqi_str}"/>
										</td>
									</tr>
									<tr>
										<th>制造单位统一社会信用代码</th>
										<td>
											<input class="ui-input long98" name="register.zhizaodanweidaima" value="${register.zhizaodanweidaima}" required="required"/>
										</td>
										<th>产品品牌</th>
										<td>
											<input class="ui-input long98" name="register.chanpinpinpai" value="${register.chanpinpinpai}" required="required"/>
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
<script src="<%=path %>/js/bs/zcdj/register.js"></script>
<script type="text/javascript" >
	
	$("#djlb").selectmenu();
	$("#jylb").selectmenu();
	$("#jyjl").selectmenu();
	$("#rkmj").selectmenu();
	$("#zdwx").selectmenu();
	$("#lengku").selectmenu();
	var xxnum = "${fn:length(fjfjList)}";
	var tj = 0;
	$().ready(function(){
		
		if("${register.tjstate}" == "1" || "${register.tjstate}" == "2"){
			$("#mnubtn_zcdj_edit_tj").remove();
			$("#mnubtn_zcdj_edit_save").remove();
			$("#mnubtn_jcsj_zcdj_edit_fj").remove();
			$("#mnubtn_zcdj_fj").remove();
			$("#xydmtq").hide();
		}else if("${register.tjstate}" == "3"){
			tj = 3;
		}else if("${register.tjstate}" == "4"){
			tj = 4;
		}
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${register.shebeizhongleidaima}"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie,yzc_shebeipinzhong",data.dirDatas,"200px",true,"<%=path%>");
					//产品数据表类别
					creatCpsjbLb(data.dirDatas);
			},"JSON");
		
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
					subSomething();
			},"JSON");
		if("${register.fj_filepath}" != ""){
			var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\'${register.fj_filepath}\')">下载附件</a>';
			$("#zcdjb_fj_${uuid}").html(down);
		}
	//提交至审核
		$("#mnubtn_zcdj_edit_tj").click(function(){
			if($('#quxian').val() == ""){
				$.dialog.alert('区县不能为空！');
				return false;
			}
			if(!verifyRequired()){
				return false;
			}
			$.dialog.confirm("确定要提交至审核吗?提交后将不能修改!", function(){
				save("2");
			});
		});
		//保存表单
		$("#mnubtn_zcdj_edit_save").click(function(){
			save(tj);
			return false;
		});
		
		//下载登记表
		$("#mnubtn_baseInfo_edit_djb_xz${uuid}").click(function(){
			var path = $("#zcdjb_filepath_${uuid}").attr("value");
			if(path == ""){
				$.dialog.alert('未找到源文件，该登记表可能是新建的');
				return false;
			}else{
				parent.downloadFile(path);
			}
		});
			//打印
			$("#mnubtn_jcsj_zcdj_edit_dy${uuid}").click(function(){
				var id = $("#reg_id_${uuid}").attr("value");
			//	openwindow("<%=path%>/jsp/biz/sbxx/zcdj/PrintPage.html?urls="+id+"&bglx=yl",400,200);
				window.open ('<%=path%>/register!djbDyByJsp.do?id='+id,'登记表打印窗口','height=500,width=650,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no'); 
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
			
		appendSelTo();
			
		//上传附件
		$("#mnubtn_jcsj_zcdj_edit_fj").click(function(){
 				$.dialog({
				title:'上传附件',
			    width: '550px',
			    lock:true,
			    content: 'url:<%=path%>/jsp/biz/zcdj/SimpleFileUpload_DJFJ.jsp?id=${register.id}'
			});
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
						$("#reg_add_sydw_${uuid}").val(result.entname);
						$("#reg_add_sydw_${uuid}").attr("onfocus","this.blur()");
						$("#reg_add_sydw_dz").val(result.dom);
						$("#xydm").attr("onfocus","this.blur()");
						$("#xydmtq").hide();
					}else if (state === 0) {
						$.dialog.alert("请确认信用代码是否填写正确");
						$("#reg_add_sydw_${uuid}").attr("onfocus","");
					}
				}
			});
			return flag;
		});
		
		//资料分类上传
		$("#mnubtn_zcdj_fj").click(function(){
			$.dialog({
					title:'使用登记分类上传',
					lock: true,
				    width: '550px',
				    height: '450px',
				    content: 'url:<%=path%>/jsp/biz/zcdj/check_zcdjb_fj_upload.jsp?id='+${register.id}+'&tjstate='+${register.tjstate}+'&zldm=1000'
			});
		});
		
	});
	
			//使window.open弹出的窗口居中
			function openwindow(url,iWidth,iHeight) {
				var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
				var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
				var i=window.open("","批量打印",'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
				setTimeout(function(){
					i.location=url;
				}, 600);
			}
			function save(tjstate){
				if(!yanzhengCpsjbLb()){
					$.dialog.alert('请先选择产品数据表的设备类别!');
					return false;
				}
				if(!verifySelect()){ return false;}
				var options = {
				    url:"<%=path%>/register!update.do?tjstate="+tjstate,
					dataType:'json',
		            beforeSubmit:function(formData, jqForm, options){
				    	$STONE.inpFoucs();
						if(!verifySelect()){ return false;}
						if($("#frm_zcdj_edit${uuid}").validate().form()){
							parent.showMask("正在保存......");
							return true;
						}
						return false;
		           	},
		            success:function(rsp, statusText, xhr, $form){
		            	parent.hideMask();
		            	parent.frames["${param.fid}"].reloadGrid();
		            	if(rsp.msg == "SUCCESS"){
		            		if(tjstate == '2'){
		            			$.dialog.tips('<font color="blue">已成功提交至审核！</font>',3,'success.gif');
		            		}else{
		            			$.dialog.tips('<font color="blue">保存成功！</font>',3,'success.gif');
		            		}
							
						    $("#zcdjb_filepath_hid_${uuid}").attr("value",rsp.fjpath);
						    if(rsp.fjpath != ""){
						    	var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\''+rsp.fjpath.replace(/\\/g,"/")+'\')">下载附件</a>';
						    	$("#zcdjb_fj_${uuid}").html(down);
						    }
						    $("#zcdjb_fj_input_${uuid}").html($("#zcdjb_fj_input_${uuid}").html());
						    if(tjstate == "2"){
								$("#mnubtn_zcdj_edit_tj").hide();
								$("#mnubtn_zcdj_edit_save").hide();
								$("#mnubtn_jcsj_zcdj_edit_fj").remove();
								$("#mnubtn_zcdj_fj").remove();
							}
		            	}else if(rsp.msg == "OUTSIZE"){
							$.dialog.tips('<font color="blue">保存成功！附件上传失败！</font>',3,'success.gif');
		            	}else {
							$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
		            	}
		            }
		         };
		         $("#frm_zcdj_edit${uuid}").ajaxSubmit(options);
		         return false;
			}
	//验证注册代码
	function verifyCode(){
		var sydjz = $('#sydjz').val();
		var flag = false;
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/se!findSeSydjz.do",
		   data:'sydjz='+sydjz,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.count>0){
		   			$.dialog.alert('使用登记证编号重复！');
		   		}else{
		   			flag = true;
		   		}
		   }
		});
		return flag;
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
			return flag;
		}else{
			$("#shi_div  p").hide();
			flag = true;
		}
		if(q == ""){
			$("#quxian_div  p").show();
			flag = false;
			return flag;
		}else{
			$("#quxian_div  p").hide();
			flag = true;
		}
		if(sblb == ""){
			$("#yzc_shebeileibie_div  p").show();
			flag = false;
			return flag;
		}else{
			$("#yzc_shebeileibie_div  p").hide();
			flag = true;
		}
		if(sbpz == ""){
			$("#yzc_shebeipinzhong_div  p").show();
			flag = false;
			return flag;
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
		var inpCheck = "";
		$.each(data,function(i,v){
			inpCheck = "${register.cpsjb_leibie}" == v.daima ? "checked" : "";
			$("#cpsjb_msg").append('<input type="radio" onClick="checkCpsjbLb(\''+v.daima+'\',\''+v.mingcheng+'\')" name="register.cpsjb_leibie" value="'+v.daima+'" '+inpCheck+' />'+v.mingcheng+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
			if(inpCheck == "checked"){
				checkCpsjbLb(v.daima,v.mingcheng);
			}
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
  	
	//document.onreadystatechange = subSomething;//当页面加载状态改变的时候执行这个方法.
	function subSomething(){
		if(document.readyState == "complete"){
			$(".mod-search").show();
		} //当页面加载状态
	}
	</script> 