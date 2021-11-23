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
									<input class="ui-input long98" name="register.chanquandanweidaima" value="${register.chanquandanweidaima}" />
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
								<div style="width: 80%; text-align: center; font-size: 30px">
									客运索道产品数据表
								</div>
								<br/>
								<table class="tabjcxx" id="cksfzz">
									<tr>
										<th>设备品种(名称)</th>
										<td>
											${register.shebeipinzhong}
										</td>
										<th>产品总图图号</th>
										<td colspan="2">
											<input class="ui-input long98" name="register.chanpintuhao" value="${register.chanpintuhao}" />
										</td>
									</tr>
									<tr>
										<th colspan="5">主要参数</th>
									</tr>
									<tr>
										<th>平  距</th>
										<td>
											<input class="ui-input long85" name="register.pingju" value="${register.pingju}" />m
										</td>
										<th>支架数目</th>
										<td colspan="2">
											<input class="ui-input long85" name="register.zhijiashumu" value="${register.zhijiashumu}" />个
										</td>
									</tr>
									<tr>
										<th>斜  长</th>
										<td>
											<input class="ui-input long85" name="register.changdu" value="${register.changdu}" />m
										</td>
										<th>主电机型号和功率</th>
										<td colspan="2">
											<input class="ui-input long85" name="register.dianjixinghao" value="${register.dianjixinghao}" />kW
										</td>
									</tr>
									<tr>
										<th>高  差</th>
										<td>
											<input class="ui-input long85" name="register.gaocha" value="${register.gaocha}" />m
										</td>
										<th>张紧油压(重锤重量)</th>
										<td colspan="2">
											<input class="ui-input long98" name="register.zhangjinyouya" value="${register.zhangjinyouya}" />
										</td>
									</tr>
									<tr>
										<th>运  量</th>
										<td>
											<input class="ui-input" name="register.yunzainengli" value="${register.yunzainengli}" />人/小时
										</td>
										<th>运载索(牵引索、平衡索)</th>
										<td colspan="2">
											<input class="ui-input long98" name="register.qianyinsuoxinghao" value="${register.qianyinsuoxinghao}" />
										</td>
									</tr>
									<tr>
										<th>速  度</th>
										<td>
											<input class="ui-input long85" name="register.sudu" value="${register.sudu}" />m/s
										</td>
										<th>承载索</th>
										<td colspan="2">
											<input class="ui-input long98" name="register.chengzaisuoxinghao" value="${register.chengzaisuoxinghao}" />
										</td>
									</tr>
									<tr>
										<th>索  距</th>
										<td>
											<input class="ui-input long85" name="register.suoju" value="${register.suoju}" />m
										</td>
										<th>运载工具数量和类型</th>
										<td colspan="2">
											<input class="ui-input long98" name="register.yunzaicheliangxingshi" value="${register.yunzaicheliangxingshi}"/>
										</td>
									</tr>
									<tr>
										<th colspan="6">
											主要部件
											<a class="ui-btn ui-btn-sp" id="xinxi_add">增加行</a>
										</th>
									</tr>
									<tr>
										<th style="width: 10%">序号</th>
										<th style="width: 30%">名称</th>
										<th style="width: 25%">型式试验证书编号</th>
										<th style="width: 25%">制造单位</th>
										<th style="width: 10%">操作</th>
									</tr>
									<c:forEach items="${fjfjList}" var="f" varStatus="i">
									<tr>
										<td>
											${i.index+1}
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[${i.index}].mingcheng" value="${f.mingcheng}" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[${i.index}].hegezhenghao" value="${f.hegezhenghao}" />
										</td>
										<td>
											<input class="ui-input long98" name="fjfj_list[${i.index}].zhizaochangjia" value="${f.zhizaochangjia}" />
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
			tr += '<td>'+(parseInt(xxnum)+1)+'</td>';
			tr += '<td><input class="ui-input long98" name="fjfj_list['+xxnum+'].mingcheng" /></td>';
			tr += '<td><input class="ui-input long98" name="fjfj_list['+xxnum+'].hegezhenghao" /></td>';
			tr += '<td><input class="ui-input long98" name="fjfj_list['+xxnum+'].zhizaochangjia" /></td>';
			tr += '<td><a href="javascript:void(0)" onclick="delRow(this)">删除</a></td>';
			tr += '</tr>';
			$("#cksfzz").append(tr);
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