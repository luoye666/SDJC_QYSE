<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
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
h3 {
font-size:14px;
font-weight:bold;
}

pre,p {
color:#1E7ACE;
margin:4px;
}
input, select,textarea {
padding:1px;
margin:2px;
font-size:11px;
} 

#formwrapper {
width:550px;
padding:20px;
text-align:left;
border:1px #1E7ACE solid;
} 

fieldset {
padding:10px;
margin-top:5px;
border:1px solid #1E7ACE;
background:#fff;
width:650px;
}

fieldset legend {
color:#1E7ACE;
font-weight:bold;
padding:3px 20px 3px 20px;
border:1px solid #1E7ACE;
background:#fff;
}
fieldset div {
clear:left;
margin-bottom:2px;
}
.enter{ text-align:center;}
.clear {
clear:both;
}

label {
	text-align:right;
	display:-moz-inline-box;
 	display:inline-block;
	width: 90px;
}
.divSlt{
	display: inline;
} 
.width100{
	width: 120px;
}
b{
	color:red;
	display: none;
}
</style> 
</head>
<body>
	<div class="wrapper">
	  <div class="mod-search cf" id="menu_tools">
		<a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_sb_yzc_edit_update">变更申请提交</a>  
	  </div>
	    	<div>
		    	<form id="frm_jcsj_sb_yzc_edit" method="post">
		    		<div class="formHiddenRegion">
	                	 <input type="hidden" name="pressureVesselsParam.id" value="${pressureVesselsParam.id}" id="pid"/>
	                	 <input type="hidden" name="pressureVesselsParam.zcstatus" value="${pressureVesselsParam.zcstatus}" id="status"/>
	                	 <input type="hidden" name="pressureVesselsParam.shebeizhongleidaima" value="${pressureVesselsParam.shebeizhongleidaima}"/>
	                	 <input type="hidden" name="pressureVesselsParam.shiyongdanweiId" value="${pressureVesselsParam.shiyongdanweiId}"/>
	                	 <input type="hidden" name="pressureVesselsParam.shigongdanweiId" value="${pressureVesselsParam.shigongdanweiId}"/>
	                	 <input type="hidden" name="pressureVesselsParam.state" value="${pressureVesselsParam.state}"/>
	                	 <input type="hidden" name="pressureVesselsParam.flag" value="${pressureVesselsParam.flag}"/>
	                	 <input type="hidden" name="pressureVesselsParam.eqhide" value="${pressureVesselsParam.eqhide}"/>
	                	 <input type="hidden" name="pressureVesselsParam.fj_filepath" value="${pressureVesselsParam.fj_filepath}"/>
	                	 <input type="hidden" name="pressureVesselsParam.banjieriqi" value="${pressureVesselsParam.banjieriqi}"/>
		            	<input type="hidden" name="pressureVesselsParam.pid" value="${pressureVesselsParam.pid}" id="pid"/>
						<input type="hidden" value="${pressureVesselsParam.tmpData}" name="pressureVesselsParam.tmpData" />
	                	 <input type="hidden" name="pressureVesselsParam.jingdu" value="${pressureVesselsParam.jingdu}"/>
	                	 <input type="hidden" name="pressureVesselsParam.weidu" value="${pressureVesselsParam.weidu}"/>
		            	<input type="hidden" name="pressureVesselsParam.dj_jingbanriqi" value="${pressureVesselsParam.dj_jingbanriqi}"/>
		            	<input type="hidden" name="pressureVesselsParam.djb_id" value="${pressureVesselsParam.djb_id}"/>
		            	<input type="hidden" name="pressureVesselsParam.yjyy" value="${pressureVesselsParam.yjyy}"/>
                	</div>
					<fieldset>
					<legend>基本信息</legend>
					<div>
					    <label>设备名称:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.shebeimingcheng" id="mingcheng" value="${pressureVesselsParam.shebeimingcheng}" oldValue="${pressureVesselsParamOld.shebeimingcheng}"></select>
					    <label>设备种类:</label>
					    <input class="ui-input" readonly="true" name="pressureVesselsParam.shebeizhonglei" style="width: 179px;" id="yzc_shebeizhonglei" value="压力容器" oldValue="压力容器"/><br/>
					    <label>设备类别:</label>
					    	<div id="yzc_shebeileibie_div" class="divSlt">
	        					<select name="pressureVesselsParam.shebeileibiedaima" sltValue="${pressureVesselsParam.shebeileibiedaima}" oldValue="${pressureVesselsParamOld.shebeileibiedaima}" style="width: 195px;" id="yzc_shebeileibie"></select>
					    	</div>
					    <label>设备品种:</label>
					    	<div id="yzc_shebeipinzhong_div" class="divSlt">
	        					<select name="pressureVesselsParam.shenbeipinzhongdaima" sltValue="${pressureVesselsParam.shenbeipinzhongdaima}" oldValue="${pressureVesselsParamOld.shenbeipinzhongdaima}" style="width: 195px;" id="yzc_shebeipinzhong"></select>
					    	</div>
					    	<br/>
					    <label>设备代码:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.shebeidaima" value="${pressureVesselsParam.shebeidaima}" oldValue="${pressureVesselsParamOld.shebeidaima}"/>
					    <label>设备型号:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.shebeixinghao" value="${pressureVesselsParam.shebeixinghao}" oldValue="${pressureVesselsParamOld.shebeixinghao}"/><br/>
						<label>制造日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.zhizaoriqi_date" value="<fmt:formatDate value='${pressureVesselsParam.zhizaoriqi_date}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.zhizaoriqi_date}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label>制造日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.zhizaoriqi" value="${pressureVesselsParam.zhizaoriqi}" oldValue="${pressureVesselsParamOld.zhizaoriqi}"/><br/>
						<label>投用日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.touyongriqi_date" value="<fmt:formatDate value='${pressureVesselsParam.touyongriqi_date}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.touyongriqi_date}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label>投用日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.touyongriqi" value="${pressureVesselsParam.touyongriqi}" oldValue="${pressureVesselsParamOld.touyongriqi}"/><br/>
					    <label>安装日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.anzhuangriqi" value="<fmt:formatDate value='${pressureVesselsParam.anzhuangriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.anzhuangriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label>出厂编号:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.chuchangbianhao" value="${pressureVesselsParam.chuchangbianhao}" oldValue="${pressureVesselsParamOld.chuchangbianhao}"/><br/>
						<label>设备注册代码:</label>
						<input class="ui-input" style="width: 179px;background-color:#E0E0E0" name="pressureVesselsParam.zhucedaima" readonly="true" value="${pressureVesselsParam.zhucedaima}" oldValue="${pressureVesselsParamOld.zhucedaima}" id="zcdm"/>
					    <label>设备注册日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.zhuceriqi" value="<fmt:formatDate value='${pressureVesselsParam.zhuceriqi}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.zhuceriqi}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>使用登记证编号:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.dengjizhengbianhao" value="${pressureVesselsParam.dengjizhengbianhao}" oldValue="${pressureVesselsParamOld.dengjizhengbianhao}" readonly="true"/>
					    <label>发证日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.fazhengriqi" value="<fmt:formatDate value='${pressureVesselsParam.fazhengriqi}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.fazhengriqi}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>告知编号:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.gaozhibianhao" value="${pressureVesselsParam.gaozhibianhao}" oldValue="${pressureVesselsParamOld.gaozhibianhao}"/>
					    <label>告知日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.gaozhiriqi" value="<fmt:formatDate value='${pressureVesselsParam.gaozhiriqi}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.gaozhiriqi}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>内部编号:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.neibubianhao" value="${pressureVesselsParam.neibubianhao}" oldValue="${pressureVesselsParamOld.neibubianhao}"/>
					    <label>设备地点:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.shebeididian" value="${pressureVesselsParam.shebeididian}" oldValue="${pressureVesselsParamOld.shebeididian}"/><br/>
						<label>市:</label>
							<div id="shi_div" class="divSlt" onclick="delay()">
	        					<select name="pressureVesselsParam.shidaima" sltValue="${pressureVesselsParam.shidaima}" oldValue="${pressureVesselsParamOld.shidaima}" style="width: 195px;" id="shi"></select>
							</div>
						<label>区划名称:</label>
							<div id="quxian_div" class="divSlt" onclick="delay()">
	        					<select name="pressureVesselsParam.quhuadaima" sltValue="${pressureVesselsParam.quhuadaima}" oldValue="${pressureVesselsParamOld.quhuadaima}" style="width: 195px;" id="quxian"></select>
							</div>
						<br/>
						<label>乡镇:</label>
							<div id="xiangzhen_div" class="divSlt">
	        					<select name="pressureVesselsParam.xiangzhendaima" sltValue="${pressureVesselsParam.xiangzhendaima}" oldValue="${pressureVesselsParamOld.xiangzhendaima}" style="width: 195px;" id="xiangzhen"></select>
							</div>
					    <label>是否市直:</label>
						<s:select name="pressureVesselsParam.szstatus" list="#{'0':'否','1':'是'}" value="pressureVesselsParam.szstatus" sltValue="${pressureVesselsParam.szstatus}" oldValue="${pressureVesselsParamOld.szstatus}" style="width: 179px;" id="shizhi"></s:select><br/>
						<label>设备使用年限:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.shebeishiyongnianxian" value="${pressureVesselsParam.shebeishiyongnianxian}" oldValue="${pressureVesselsParamOld.shebeishiyongnianxian}"/>
						<label>固定资产值:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.gudingzichanzhi" value="${pressureVesselsParam.gudingzichanzhi}" oldValue="${pressureVesselsParamOld.gudingzichanzhi}"/><br/>
						<label>使用单位联系电话:</label>
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.shiyongdanwei_lianxidianhua" value="${pressureVesselsParam.shiyongdanwei_lianxidianhua}" oldValue="${pressureVesselsParamOld.shiyongdanwei_lianxidianhua}"/>
						<label>使用单位联系人:</label>
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.shiyongdanwei_lianxiren" value="${pressureVesselsParam.shiyongdanwei_lianxiren}" oldValue="${pressureVesselsParamOld.shiyongdanwei_lianxiren}"/><br/>
						<label>注册登记机构:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.zhucedengjijigou" value="${pressureVesselsParam.zhucedengjijigou}" oldValue="${pressureVesselsParamOld.zhucedengjijigou}"/>
						<label>注册登记日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.zhuceriqi" value="<fmt:formatDate value='${pressureVesselsParam.zhuceriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.zhuceriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>注册登记人员:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.zhucedengjirenyuan" value="${pressureVesselsParam.zhucedengjirenyuan}" oldValue="${pressureVesselsParamOld.zhucedengjirenyuan}"/>
						<label>更新日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.biangengriqi" value="<fmt:formatDate value='${pressureVesselsParam.biangengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.biangengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>填表人员:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.tianbiaorenyuan" value="${pressureVesselsParam.tianbiaorenyuan}" oldValue="${pressureVesselsParamOld.tianbiaorenyuan}"/>
						<label>填表日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.tianbiaoriqi" value="<fmt:formatDate value='${pressureVesselsParam.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
					 	<label>安全管理部门:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.anquanguanlibumen" value="${pressureVesselsParam.anquanguanlibumen}" oldValue="${pressureVesselsParamOld.anquanguanlibumen}"/>
					 	<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.anquanguanli_lianxidianhua" value="${pressureVesselsParam.anquanguanli_lianxidianhua}" oldValue="${pressureVesselsParamOld.anquanguanli_lianxidianhua}"/>
					    <br/>
					    <label>安全管理人员:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.anquanguanlirenyuan" value="${pressureVesselsParam.anquanguanlirenyuan}" oldValue="${pressureVesselsParamOld.anquanguanlirenyuan}"/>
						<label>施工类别:</label>	
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.shigongleibie" value="${pressureVesselsParam.shigongleibie}" oldValue="${pressureVesselsParamOld.shigongleibie}"/><br/>
						<label>施工告知日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.shigongdanwei_shigongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${pressureVesselsParam.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>"/>
						<label>施工竣工日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.shigongdanwei_jungongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${pressureVesselsParam.shigongdanwei_jungongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.shigongdanwei_jungongriqi}' pattern='yyyy-MM-dd'/>"/><br/>
						<label>是否重大危险源:</label>
					    <select id="cc_zdwxy" name="pressureVesselsParam.shifou_zhongdaweixianyuan" sltValue="${pressureVesselsParam.shifou_zhongdaweixianyuan}" oldValue="${pressureVesselsParamOld.shifou_zhongdaweixianyuan}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${pressureVesselsParam.shifou_zhongdaweixianyuan == "否" ? "selected":""}>否</option>
					    	<option value="是" ${pressureVesselsParam.shifou_zhongdaweixianyuan == "是" ? "selected":""}>是</option>
					    </select> 
					    <label>是否重点监控特种设备:</label>
					    <select id="cc_zdjk" name="pressureVesselsParam.shifou_zhongdianjiankong" sltValue="${pressureVesselsParam.shifou_zhongdianjiankong}" oldValue="${pressureVesselsParamOld.shifou_zhongdianjiankong}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${pressureVesselsParam.shifou_zhongdianjiankong == "否" ? "selected":""}>否</option>
					    	<option value="是" ${pressureVesselsParam.shifou_zhongdianjiankong == "是" ? "selected":""}>是</option>
					    </select><br/>
					    <label>是否制定事故应急措施和救援预案:</label>
					    <select id="cc_jyya" name="pressureVesselsParam.shifou_yingjifangan" sltValue="${pressureVesselsParam.shifou_yingjifangan}" oldValue="${pressureVesselsParamOld.shifou_yingjifangan}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${pressureVesselsParam.shifou_yingjifangan == "否" ? "selected":""}>否</option>
					    	<option value="是" ${pressureVesselsParam.shifou_yingjifangan == "是" ? "selected":""}>是</option>
					    </select> 
					    <label>是否在人口密集区:</label>
					    <select id="cc_rkmjq" name="pressureVesselsParam.shifou_renkoumijiqu" sltValue="${pressureVesselsParam.shifou_renkoumijiqu}" oldValue="${pressureVesselsParamOld.shifou_renkoumijiqu}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${pressureVesselsParam.shifou_renkoumijiqu == "否" ? "selected":""}>否</option>
					    	<option value="是" ${pressureVesselsParam.shifou_renkoumijiqu == "是" ? "selected":""}>是</option>
					    </select><br/>
					     <label>是否冷库设备:</label>
					    <select id="cc_lksb" name="pressureVesselsParam.biaozhuleixing" sltValue="${pressureVesselsParam.biaozhuleixing}" oldValue="${pressureVesselsParamOld.biaozhuleixing}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${pressureVesselsParam.biaozhuleixing == "否" ? "selected":""}>否</option>
					    	<option value="是" ${pressureVesselsParam.biaozhuleixing == "是" ? "selected":""}>是</option>
					    </select>
						<label>备注:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.beizhu" value="${pressureVesselsParam.beizhu}" oldValue="${pressureVesselsParamOld.beizhu}"/><br/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>检验信息</legend>
					<div id="jyxx_div">
					    <label class="width100">年度报检日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.nd_baojianriqi" value="<fmt:formatDate value='${pressureVesselsParam.nd_baojianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.nd_baojianriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">年度检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.nd_jianyanriqi" value="<fmt:formatDate value='${pressureVesselsParam.nd_jianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.nd_jianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
					    <label class="width100">下次年度检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.nd_xiacijianyanriqi" value="<fmt:formatDate value='${pressureVesselsParam.nd_xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.nd_xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">年度检验结论:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.nd_jianyanjielun" value="${pressureVesselsParam.nd_jianyanjielun}" oldValue="${pressureVesselsParamOld.nd_jianyanjielun}"/>
						<br/>
					    <label class="width100">年度检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.nd_jianyanjigou" value="${pressureVesselsParam.nd_jianyanjigou}" oldValue="${pressureVesselsParamOld.nd_jianyanjigou}"/>
						<label class="width100">年度报告编号:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.nd_baogaobianhao" value="${pressureVesselsParam.nd_baogaobianhao}" oldValue="${pressureVesselsParamOld.nd_baogaobianhao}"/>
						<br/>
					    <label class="width100">全面报检日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.shebeibaojianriqi" value="<fmt:formatDate value='${pressureVesselsParam.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">全面检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.jianyanjieshuriqi" value="<fmt:formatDate value='${pressureVesselsParam.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
					    <label class="width100">下次全面检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.xiacijianyanriqi" value="<fmt:formatDate value='${pressureVesselsParam.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">全面检验结论:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.jianyanjielun" value="${pressureVesselsParam.jianyanjielun}" oldValue="${pressureVesselsParamOld.jianyanjielun}"/>
						<br/>
					    <label class="width100">全面检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.jianyanjigou" value="${pressureVesselsParam.jianyanjigou}" oldValue="${pressureVesselsParamOld.jianyanjigou}"/>
					 	<label class="width100">全面报告编号:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.qm_baogaobianhao" value="${pressureVesselsParam.qm_baogaobianhao}" oldValue="${pressureVesselsParamOld.qm_baogaobianhao}"/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>单位信息</legend>
					<div>
						<label></label>
						<span style="color:red;">【为保证使用单位的一致性，使用单位信息只能在设备列表上修改】</span><br/>
						<label>使用单位:</label>
						<input class="ui-input"   style="width: 420px;" name="pressureVesselsParam.shiyongdanwei" value="${pressureVesselsParam.shiyongdanwei}" oldValue="${pressureVesselsParamOld.shiyongdanwei}" id="bjdshiyongdanwei" required="required" onfocus="this.blur()"/><br/>
						<label>单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="pressureVesselsParam.shiyongdanwei_dizhi" value="${pressureVesselsParam.shiyongdanwei_dizhi}" oldValue="${pressureVesselsParamOld.shiyongdanwei_dizhi}"/><br/>
						<label>组织机构代码:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.shiyongdanwei_code" value="${pressureVesselsParam.shiyongdanwei_code}" oldValue="${pressureVesselsParamOld.shiyongdanwei_code}" />
						<label>法定代表人:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.fadingdaibiaoren" value="${pressureVesselsParam.fadingdaibiaoren}" oldValue="${pressureVesselsParamOld.fadingdaibiaoren}" /><br/>
						<label>单位性质:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.shiyongdanwei_xingzhi" value="${pressureVesselsParam.shiyongdanwei_xingzhi}" oldValue="${pressureVesselsParamOld.shiyongdanwei_xingzhi}" />
						<label>所属行业:</label>
						<div id="sydw_sshy_div" class="divSlt">
							<select style="width: 195px;" sltValue="${pressureVesselsParam.shiyongdanwei_suoshuhangye}" name="pressureVesselsParam.shiyongdanwei_suoshuhangye" oldValue="${pressureVesselsParamOld.shiyongdanwei_suoshuhangye}" id="sydw_sshy"></select><br/>
						</div>
						<hr/>
						
						<label>施工单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="pressureVesselsParam.shigongdanwei" value="${pressureVesselsParam.shigongdanwei}" oldValue="${pressureVesselsParamOld.shigongdanwei}"/><br/>
						<label>单位地址:</label>						
						<input class="ui-input"   style="width: 420px;" name="pressureVesselsParam.shigongdanwei_dizhi" value="${pressureVesselsParam.shigongdanwei_dizhi}" oldValue="${pressureVesselsParamOld.shigongdanwei_dizhi}"/><br/>
						<label>组织机构代码:</label>	
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.shigongdanwei_daima" value="${pressureVesselsParam.shigongdanwei_daima}" oldValue="${pressureVesselsParamOld.shigongdanwei_daima}"/>
						<label>法人代表:</label>	
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.shigongdanwei_faren" value="${pressureVesselsParam.shigongdanwei_faren}" oldValue="${pressureVesselsParamOld.shigongdanwei_faren}"/><br/>
						<label>联系电话:</label>	
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.shigongdanwei_lianxidianhua" value="${pressureVesselsParam.shigongdanwei_lianxidianhua}" oldValue="${pressureVesselsParamOld.shigongdanwei_lianxidianhua}"/>
						<label>联   系   人:</label>	
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.shigongdanwei_lianxiren" value="${pressureVesselsParam.shigongdanwei_lianxiren}" oldValue="${pressureVesselsParamOld.shigongdanwei_lianxiren}"/><br/>
						<label>许可证编号:</label>	
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.shigongdanwei_xukezhengbianhao" value="${pressureVesselsParam.shigongdanwei_xukezhengbianhao}" oldValue="${pressureVesselsParamOld.shigongdanwei_xukezhengbianhao}"/>
						<label>简称:</label>	
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.shigongdanwei_jiancheng" value="${pressureVesselsParam.shigongdanwei_jiancheng}" oldValue="${pressureVesselsParamOld.shigongdanwei_jiancheng}"/><br/>
						<br/>						
						<hr/>
						<label>制造单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="pressureVesselsParam.zhizaodanwei" value="${pressureVesselsParam.zhizaodanwei}" oldValue="${pressureVesselsParamOld.zhizaodanwei}"/><br/>
						<label>制造许可证编号:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.zhizaodanweixukezhengbianhao" value="${pressureVesselsParam.zhizaodanweixukezhengbianhao}" oldValue="${pressureVesselsParamOld.zhizaodanweixukezhengbianhao}"/>
						<label>制造监检日期:</label>	
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.zhizaojianjianriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${pressureVesselsParam.zhizaojianjianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pressureVesselsParamOld.zhizaojianjianriqi}' pattern='yyyy-MM-dd'/>"/>
						<br/>
						<label>产品合格证编号:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.chanpinhegezhengbianhao" value="${pressureVesselsParam.chanpinhegezhengbianhao}" oldValue="${pressureVesselsParamOld.chanpinhegezhengbianhao}"/>
						<label>设计文件鉴定机构:</label>	
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.wenjianjiandingjigou" value="${pressureVesselsParam.wenjianjiandingjigou}" oldValue="${pressureVesselsParamOld.wenjianjiandingjigou}"/>
						<br/>
						<label>鉴定报告书编号:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.jiandingbaogaobianhao" value="${pressureVesselsParam.jiandingbaogaobianhao}" oldValue="${pressureVesselsParamOld.jiandingbaogaobianhao}"/>
						<label>产品图号:</label>	
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.chanpintuhao" value="${pressureVesselsParam.chanpintuhao}" oldValue="${pressureVesselsParamOld.chanpintuhao}"/>
						<br/>
						<label>制造监检机构:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.zhizaojianjianjigou" value="${pressureVesselsParam.zhizaojianjianjigou}" oldValue="${pressureVesselsParamOld.zhizaojianjianjigou}"/>
						<label>制造监检证书编号:</label>	
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.jianjianzhengshubianhao" value="${pressureVesselsParam.jianjianzhengshubianhao}" oldValue="${pressureVesselsParamOld.jianjianzhengshubianhao}"/>
						<br/>
						<label>监检机构核准证编号:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.jianjianhezhunzheng" value="${pressureVesselsParam.jianjianhezhunzheng}" oldValue="${pressureVesselsParamOld.jianjianhezhunzheng}"/>
						<label>制造单位统一社会信用代码:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.zhizaodanwei_code" value="${pressureVesselsParam.zhizaodanwei_code}" oldValue="${pressureVesselsParamOld.zhizaodanwei_code}"/>
						<br/>
						<label>产品品牌:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.chanpinpinpai" value="${pressureVesselsParam.chanpinpinpai}" oldValue="${pressureVesselsParamOld.chanpinpinpai}"/>
						<br/>
						<hr/>
						<label>产权单位:</label>
						<input class="ui-input"   style="width: 420px;" name="pressureVesselsParam.chanquandanwei" value="${pressureVesselsParam.chanquandanwei}" oldValue="${pressureVesselsParamOld.chanquandanwei}"/><br/>
						<label>产权单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="pressureVesselsParam.chanquandanwei_dizhi" value="${pressureVesselsParam.chanquandanwei_dizhi}" oldValue="${pressureVesselsParamOld.chanquandanwei_dizhi}"/><br/>
						<label>产权单位代码:</label>
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.chanquandanwei_daima" value="${pressureVesselsParam.chanquandanwei_daima}" oldValue="${pressureVesselsParamOld.chanquandanwei_daima}"/>
						<label>法人代表:</label>
						<input class="ui-input"   style="width: 179px;" name="pressureVesselsParam.chanquandanwei_farendaibiao" value="${pressureVesselsParam.chanquandanwei_farendaibiao}" oldValue="${pressureVesselsParamOld.chanquandanwei_farendaibiao}"/><br/>
						<br/>
						<hr/>
					 	<label>设计单位:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.shejidanwei" value="${pressureVesselsParam.shejidanwei}" oldValue="${pressureVesselsParamOld.shejidanwei}"/>
					 	<label>设计单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="pressureVesselsParam.shejidanweidaima" value="${pressureVesselsParam.shejidanweidaima}" oldValue="${pressureVesselsParamOld.shejidanweidaima}"/>
					    <br/>
					 	
					</div>
					</fieldset>
					<fieldset>
					<legend>设备参数</legend>
						<label>材质筒体:</label>	
						<input class='ui-input' style="width: 179px;" name="pressureVesselsParam.caizhitongti" value="${pressureVesselsParam.caizhitongti}" oldValue="${pressureVesselsParamOld.caizhitongti}"/>
						<label>材质封头:</label>	
						<input class='ui-input' style="width: 179px;" name="pressureVesselsParam.caizhifengtou" value="${pressureVesselsParam.caizhifengtou}" oldValue="${pressureVesselsParamOld.caizhifengtou}"/><br/>
						<label>材质夹套:</label>	
						<input class='ui-input' style="width: 179px;" name="pressureVesselsParam.caizhijiatao" value="${pressureVesselsParam.caizhijiatao}" oldValue="${pressureVesselsParamOld.caizhijiatao}"/>
						<label>材质内衬:</label>	
						<input class='ui-input' style="width: 179px;" name="pressureVesselsParam.caizhineichen" value="${pressureVesselsParam.caizhineichen}" oldValue="${pressureVesselsParamOld.caizhineichen}"/></br>
						<label>压力壳程(Mpa):</label>	
						<input class='ui-input' style="width: 179px;" name="pressureVesselsParam.yalikecheng" value="${pressureVesselsParam.yalikecheng}" oldValue="${pressureVesselsParamOld.yalikecheng}"/>
						<label>压力管程(Mpa):</label>
						<input class='ui-input' style="width: 179px;" name="pressureVesselsParam.yaliguancheng" value="${pressureVesselsParam.yaliguancheng}" oldValue="${pressureVesselsParamOld.yaliguancheng}"/><br/>
						<label>介质壳程:</label>	
						<input class='ui-input' style="width: 179px;" name="pressureVesselsParam.jiezhikecheng" value="${pressureVesselsParam.jiezhikecheng}" oldValue="${pressureVesselsParamOld.jiezhikecheng}"/>
						<label>介质管程:</label>	
						<input class='ui-input'  style="width: 179px;" name="pressureVesselsParam.jiezhiguancheng" value="${pressureVesselsParam.jiezhiguancheng}" oldValue="${pressureVesselsParamOld.jiezhiguancheng}"/><br/>
						<label>温度壳程(℃):</label>	
						<input class='ui-input'  style="width: 179px;" name="pressureVesselsParam.wendukecheng" value="${pressureVesselsParam.wendukecheng}" oldValue="${pressureVesselsParamOld.wendukecheng}"/>
						<label>温度管程(℃):</label>	
						<input class='ui-input'  style="width: 179px;" name="pressureVesselsParam.wenduguancheng" value="${pressureVesselsParam.wenduguancheng}" oldValue="${pressureVesselsParamOld.wenduguancheng}"/><br/>
						<label>容器内径(mm):</label>	
						<input class='ui-input'  style="width: 179px;" name="pressureVesselsParam.rongqineijing" value="${pressureVesselsParam.rongqineijing}" oldValue="${pressureVesselsParamOld.rongqineijing}"/>
						<label>容器高(mm):</label>	
						<input class='ui-input'  style="width: 179px;" name="pressureVesselsParam.rongqigao" value="${pressureVesselsParam.rongqigao}" oldValue="${pressureVesselsParamOld.rongqigao}"/><br/>
						<label>容器长(mm):</label>	
						<input class='ui-input'  style="width: 179px;" name="pressureVesselsParam.rongqichang" value="${pressureVesselsParam.rongqichang}" oldValue="${pressureVesselsParamOld.rongqichang}"/>
						<label>容积面积(m³/m²):</label>
						<input class='ui-input'  style="width: 179px;" name="pressureVesselsParam.rongqimianji" value="${pressureVesselsParam.rongqimianji}" oldValue="${pressureVesselsParamOld.rongqimianji}"/>
						<label>结构型式:</label>	
						<input class='ui-input'  style="width: 179px;" name="pressureVesselsParam.jiegouxingshi" value="${pressureVesselsParam.jiegouxingshi}" oldValue="${pressureVesselsParamOld.jiegouxingshi}"/>
						<label>介质:</label>	
						<input class='ui-input'  style="width: 179px;" name="pressureVesselsParam.gongzuojiezhi" value="${pressureVesselsParam.gongzuojiezhi}" oldValue="${pressureVesselsParamOld.gongzuojiezhi}"/><br/>
						<label>工作压力(Mpa):</label>
						<input class='ui-input'  style="width: 179px;" name="pressureVesselsParam.gongzuoyali" value="${pressureVesselsParam.gongzuoyali}" oldValue="${pressureVesselsParamOld.gongzuoyali}"/>
						<label>工作温度(℃):</label>	
						<input class='ui-input'  style="width: 179px;" name="pressureVesselsParam.gongzuowendu" value="${pressureVesselsParam.gongzuowendu}" oldValue="${pressureVesselsParamOld.gongzuowendu}"/><br/>
						
					</fieldset>
					<fieldset>
						 <div class="grid-wrap">
						    <table id="grid">
						    </table>
						    <div id="page"></div>
						  </div>
					</fieldset>
		    	</form>
		    </div>
	</div>
	<iframe id="downloadFile" height="0" width="0" src="" style="display: none;"></iframe>
	</body>
</html>
	<script type="text/javascript">
	
	var columns = "";
	var setSel;
	var path = "<%=path %>";
	var id = $('#pid').val();
	var type = $('#status').val();
	if("${param.adr}" == "sjsh"){
		$("#mnubtn_jcsj_sb_yzc_edit_update").hide();
	}
	$().ready(function(){
			$("#jyxx_div input").each(function(){
				$(this).attr("readonly","true");
				$(this).attr("onclick","");
				$(this).css("background-color","#E0E0E0");
			});
			if("${adr}" == "dsh"){
				$("#menu_tools").hide();
			}
		  	$("#mnubtn_jcsj_sb_yzc_edit_update").click(function(){
				$.dialog.confirm("确定要变更吗?（您本次提交的特种设备变更申请，需经当地安全监察机构确认后方能生效！）", function(){  
					save("0");
				});
			});
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${pressureVesselsParam.shebeizhongleidaima}"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie,yzc_shebeipinzhong",data.dirDatas,"200px",true,"<%=path%>");
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"GLSSHY"},
				function (data, textStatus){
					$STONE.creatSelectMenu("sydw_sshy",data.dicDatas,"200px",false,"<%=path%>");
			},"JSON");
			$("#shizhi").selectmenu();
			$("#cc_zdwxy").selectmenu();
			$("#cc_zdjk").selectmenu();
			$("#cc_jyya").selectmenu();
			$("#cc_rkmjq").selectmenu();
			$("#cc_lksb").selectmenu();
			//判断哪些值正在修改
			setTimeout(function(){
				$STONE.verifyUpdSltValue("select");
			},2000);
			$STONE.verifyUpdValue("input");
			
			appendSelTo();
	});
	function save(tjstate){
			if($('#shi').val() == ""){
				$.dialog.alert('市不能为空！');
				return false;
			}
			var options = {
				url:"<%=path%>/se!updateByYLRQ.do?tjstate="+tjstate+"&address=${address}&dbid=${dbid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					if( !verifySelect() ){ return false;};
					if($("#frm_jcsj_sb_yzc_edit").validate().form()){
						parent.showMask("正在提交......");
						return true;
					}
					return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	parent.hideMask();
	            	if(rsp.success){
	            		if(rsp.msg == 'notallow'){
	            			$.dialog.tips('<font color="blue">此设备是否有待审核记录，不允许重复提交？</font>',3,'success.gif');
	            		}else{
	            			$.dialog.tips('<font color="blue">变更申请提交成功！</font>',3,'success.gif');
							parent.document.getElementById("${ptabsid}").contentWindow.reloadGrid();
	            		}
	            	}else{
						$.dialog.tips('<font color="blue">提交失败!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_jcsj_sb_yzc_edit").ajaxSubmit(options);
	         return false;
	}
	
	//验证注册代码
	function verifyCode(){
		var code = $('#zcdm').val();
		var id = $('#pid').val();
		var flag = false;
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/se!findSeCode.do",
		   data:'code='+code+'&id='+id,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if("db" == "${address}"){
				   if(data.count>1){
			   			$.dialog.alert('注册代码重复！');
			   		}else{
			   			flag = true;
			   		}
			   }else{
				   if(data.count>0){
			   			$.dialog.alert('注册代码重复！');
			   		}else{
			   			flag = true;
			   		}
			   }
		   }
		});
		return flag;
	}
	
	//验证select 是否有值
		function verifySelect(){
			var s = $('#shi').val();
			var q = $('#quxian').val();
			var flag = false;
			
			if(s == ""){
				$("#shi_div  b").show();
				flag = false;
				return flag;
			}else{
				$("#shi_div  b").hide();
				flag = true;
			}
			if(q == "" || q == null){
				$("#quxian_div  b").show();
				flag = false;
				return flag;
			}else{
				$("#quxian_div  b").hide();
				flag = true;
			}
			return flag;
		}
	
	//对select 进行追加元素 p
	function appendSelTo(){
		var divS = $('fieldset > div > div');
		for(var i=0;i<divS.length-1;i++){
			$("<b>不能为空</b>").appendTo(divS[i]);
		}
	}
	
	//对select 选中数据后延迟执行方法
	function delay(){
		
		setTimeout(function(){verifySelect()},3000);
	}
	
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	function downloadFile(id){
		document.getElementById("downloadFile").src="<%=path%>/se!downloadBySeFile.do?id="+id;
	}
	</script> 
	<script src="<%=path %>/js/bs/sbxx/sbxx_file.js"></script>