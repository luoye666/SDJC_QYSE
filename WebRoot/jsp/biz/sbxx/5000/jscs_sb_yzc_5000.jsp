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
	                	 <input type="hidden" name="craneParam.id" value="${craneParam.id}" id="cid"/>
	                	 <input type="hidden" name="craneParam.zcstatus" value="${craneParam.zcstatus}" id="status"/>
	                	 <input type="hidden" name="craneParam.shebeizhongleidaima" value="${craneParam.shebeizhongleidaima}"/>
	                	 <input type="hidden" name="craneParam.shiyongdanweiId" value="${craneParam.shiyongdanweiId}"/>
	                	 <input type="hidden" name="craneParam.shigongdanweiId" value="${craneParam.shigongdanweiId}"/>
	                	 <input type="hidden" name="craneParam.state" value="${craneParam.state}"/>
	                	 <input type="hidden" name="craneParam.flag" value="${craneParam.flag}"/>
	                	 <input type="hidden" name="craneParam.eqhide" value="${craneParam.eqhide}"/>
	                	 <input type="hidden" name="craneParam.banjieriqi" value="${craneParam.banjieriqi}"/>
	                	 <input type="hidden" name="craneParam.biaozhuleixing" value="${craneParam.biaozhuleixing}"/>
	                	 <input type="hidden" name="craneParam.fj_filepath" value="${craneParam.fj_filepath}"/>
		            	<input type="hidden" name="craneParam.pid" value="${craneParam.pid}" id="pid"/>
						<input type="hidden" value="${craneParam.tmpData}" name="craneParam.tmpData" />
	                	 <input type="hidden" name="craneParam.jingdu" value="${craneParam.jingdu}"/>
	                	 <input type="hidden" name="craneParam.weidu" value="${craneParam.weidu}"/>
		            	<input type="hidden" name="craneParam.dj_jingbanriqi" value="${craneParam.dj_jingbanriqi}"/>
		            	<input type="hidden" name="craneParam.djb_id" value="${craneParam.djb_id}"/>
		            	<input type="hidden" name="craneParam.yjyy" value="${craneParam.yjyy}"/>
                	</div>
					<fieldset>
					<legend>基本信息</legend>
					<div>
					    <label>设备名称:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shebeimingcheng" id="mingcheng" value="${craneParam.shebeimingcheng}" oldValue="${craneParamOld.shebeimingcheng}"></select>
					    <label>设备种类:</label>
					    <input class="ui-input" readonly="true" name="craneParam.shebeizhonglei" style="width: 179px;" id="yzc_shebeizhonglei" value="场（厂）内专用机动车辆" oldValue="场（厂）内专用机动车辆"/><br/>
					    <label>设备类别:</label>
					    	<div id="yzc_shebeileibie_div" class="divSlt">
	        					<select name="craneParam.shebeileibiedaima" sltValue="${craneParam.shebeileibiedaima}" oldValue="${craneParamOld.shebeileibiedaima}" style="width: 195px;" id="yzc_shebeileibie"></select>
					    	</div>
					    <label>设备品种:</label>
					    	<div id="yzc_shebeipinzhong_div" class="divSlt">
	        					<select name="craneParam.shenbeipinzhongdaima" sltValue="${craneParam.shenbeipinzhongdaima}" oldValue="${craneParamOld.shenbeipinzhongdaima}" style="width: 195px;" id="yzc_shebeipinzhong"></select>
					    	</div>
					    	<br/>
					    <label>设备代码:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shebeidaima" value="${craneParam.shebeidaima}" oldValue="${craneParamOld.shebeidaima}"/>
					    <label>设备型号:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shebeixinghao" value="${craneParam.shebeixinghao}" oldValue="${craneParamOld.shebeixinghao}"/><br/>
						<label>制造日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.zhizaoriqi_date" value="<fmt:formatDate value='${craneParam.zhizaoriqi_date}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.zhizaoriqi_date}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>制造日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.zhizaoriqi" value="${craneParam.zhizaoriqi}" oldValue="${craneParamOld.zhizaoriqi}"/><br/>
						<label>投用日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.touyongriqi_date" value="<fmt:formatDate value='${craneParam.touyongriqi_date}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.touyongriqi_date}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>投用日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.touyongriqi" value="${craneParam.touyongriqi}" oldValue="${craneParamOld.touyongriqi}"/><br/>
					    <label>安装日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.anzhuangriqi" value="<fmt:formatDate value='${craneParam.anzhuangriqi}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.anzhuangriqi}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label>出厂编号:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.chuchangbianhao" value="${craneParam.chuchangbianhao}" oldValue="${craneParamOld.chuchangbianhao}"/><br/>
						<label>设备注册代码:</label>
						<input class="ui-input" style="width: 179px;background-color:#E0E0E0" readonly="true" name="craneParam.zhucedaima" value="${craneParam.zhucedaima}" oldValue="${craneParamOld.zhucedaima}" id="zcdm"/>
					    <label>设备注册日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.zhuceriqi" value="<fmt:formatDate value='${craneParam.zhuceriqi}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.zhuceriqi}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>车辆牌号:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.paizhaohaoma" value="${craneParam.paizhaohaoma}" oldValue="${craneParamOld.paizhaohaoma}"/>
					    <label>发证日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.fazhengriqi" value="<fmt:formatDate value='${craneParam.fazhengriqi}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.fazhengriqi}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>告知编号:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.gaozhibianhao" value="${craneParam.gaozhibianhao}" oldValue="${craneParamOld.gaozhibianhao}"/>
					    <label>告知日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.gaozhiriqi" value="<fmt:formatDate value='${craneParam.gaozhiriqi}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.gaozhiriqi}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>内部编号:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.neibubianhao" value="${craneParam.neibubianhao}" oldValue="${craneParamOld.neibubianhao}"/>
					    <label>设备地点:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shebeididian" value="${craneParam.shebeididian}" oldValue="${craneParamOld.shebeididian}"/><br/>
						<label>市:</label>
							<div id="shi_div" class="divSlt" onclick="delay()">
	        					<select name="craneParam.shidaima" sltValue="${craneParam.shidaima}" oldValue="${craneParamOld.shidaima}" style="width: 195px;" id="shi"></select>
							</div>
						<label>区划名称:</label>
							<div id="quxian_div" class="divSlt" onclick="delay()">
	        					<select name="craneParam.quhuadaima" sltValue="${craneParam.quhuadaima}" oldValue="${craneParamOld.quhuadaima}" style="width: 195px;" id="quxian"></select>
							</div>
						<br/>
						<label>乡镇:</label>
							<div id="xiangzhen_div" class="divSlt">
	        					<select name="craneParam.xiangzhendaima" sltValue="${craneParam.xiangzhendaima}" oldValue="${craneParamOld.xiangzhendaima}" style="width: 195px;" id="xiangzhen"></select>
							</div>
					    <label>是否市直:</label>
						<s:select name="craneParam.szstatus" list="#{'0':'否','1':'是'}" value="craneParam.szstatus" sltValue="${craneParam.szstatus}" oldValue="${craneParamOld.szstatus}" style="width: 179px;" id="shizhi"></s:select><br>
						
						<label>设备使用年限:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shebeishiyongnianxian" value="${craneParam.shebeishiyongnianxian}" oldValue="${craneParamOld.shebeishiyongnianxian}"/>
						<label>固定资产值:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.gudingzichanzhi" value="${craneParam.gudingzichanzhi}" oldValue="${craneParamOld.gudingzichanzhi}"/><br/>
						<label>使用单位联系电话:</label>
						<input class="ui-input"   style="width: 179px;" name="craneParam.shiyongdanwei_lianxidianhua" value="${craneParam.shiyongdanwei_lianxidianhua}" oldValue="${craneParamOld.shiyongdanwei_lianxidianhua}"/>
						<label>使用单位联系人:</label>
						<input class="ui-input"   style="width: 179px;" name="craneParam.shiyongdanwei_lianxiren" value="${craneParam.shiyongdanwei_lianxiren}" oldValue="${craneParamOld.shiyongdanwei_lianxiren}"/><br/>
						<label>注册登记机构:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.zhucedengjijigou" value="${craneParam.zhucedengjijigou}" oldValue="${craneParamOld.zhucedengjijigou}"/>
						<label>注册登记日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.zhuceriqi" value="<fmt:formatDate value='${craneParam.zhuceriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.zhuceriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>注册登记人员:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.zhucedengjirenyuan" value="${craneParam.zhucedengjirenyuan}" oldValue="${craneParamOld.zhucedengjirenyuan}"/>
						<label>使用登记证编号:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.dengjizhengbianhao" value="${craneParam.dengjizhengbianhao}" oldValue="${craneParamOld.dengjizhengbianhao}" readonly="true"/>
						<br/>
						<label>更新日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.biangengriqi" value="<fmt:formatDate value='${craneParam.biangengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.biangengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>填表人员:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.tianbiaorenyuan" value="${craneParam.tianbiaorenyuan}" oldValue="${craneParamOld.tianbiaorenyuan}"/>
						<br/>
						<label>填表日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.tianbiaoriqi" value="<fmt:formatDate value='${craneParam.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					 	<label>安全管理部门:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.anquanguanlibumen" value="${craneParam.anquanguanlibumen}" oldValue="${craneParamOld.anquanguanlibumen}"/>
					 	<br/>
					 	<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.anquanguanli_lianxidianhua" value="${craneParam.anquanguanli_lianxidianhua}" oldValue="${craneParamOld.anquanguanli_lianxidianhua}"/>
					    <label>安全管理人员:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.anquanguanlirenyuan" value="${craneParam.anquanguanlirenyuan}" oldValue="${craneParamOld.anquanguanlirenyuan}"/>
						<br/>
						<label>是否重大危险源:</label>
					    <select id="cc_zdwxy" name="craneParam.shifou_zhongdaweixianyuan" sltValue="${craneParam.shifou_zhongdaweixianyuan}" oldValue="${craneParamOld.shifou_zhongdaweixianyuan}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${craneParam.shifou_zhongdaweixianyuan == "否" ? "selected":""}>否</option>
					    	<option value="是" ${craneParam.shifou_zhongdaweixianyuan == "是" ? "selected":""}>是</option>
					    </select>
					    <label>是否重点监控特种设备:</label>
					    <select id="cc_zdjk" name="craneParam.shifou_zhongdianjiankong" sltValue="${craneParam.shifou_zhongdianjiankong}" oldValue="${craneParamOld.shifou_zhongdianjiankong}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${craneParam.shifou_zhongdianjiankong == "否" ? "selected":""}>否</option>
					    	<option value="是" ${craneParam.shifou_zhongdianjiankong == "是" ? "selected":""}>是</option>
					    </select>
					    <br/>
					    <label>是否制定事故应急措施和救援预案:</label>
					    <select id="cc_jyya" name="craneParam.shifou_yingjifangan" sltValue="${craneParam.shifou_yingjifangan}" oldValue="${craneParamOld.shifou_yingjifangan}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${craneParam.shifou_yingjifangan == "否" ? "selected":""}>否</option>
					    	<option value="是" ${craneParam.shifou_yingjifangan == "是" ? "selected":""}>是</option>
					    </select>
					    <label>是否在人口密集区:</label>
					    <select id="cc_rkmjq" name="craneParam.shifou_renkoumijiqu" sltValue="${craneParam.shifou_renkoumijiqu}" oldValue="${craneParamOld.shifou_renkoumijiqu}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${craneParam.shifou_renkoumijiqu == "否" ? "selected":""}>否</option>
					    	<option value="是" ${craneParam.shifou_renkoumijiqu == "是" ? "selected":""}>是</option>
					    </select>
					    <br/>
						<label>备注:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.beizhu" value="${craneParam.beizhu}" oldValue="${craneParamOld.beizhu}"/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>检验信息</legend>
					<div>
						<div id="jyxx_div">
						<label class="width100">检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.jianyanjigou" value="${craneParam.jianyanjigou}" oldValue="${craneParamOld.jianyanjigou}"/>
						<label class="width100">检验机构代码:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.jianyanjigou_code" value="${craneParam.jianyanjigou_code}" oldValue="${craneParamOld.jianyanjigou_code}"/><br/>
					    <label class="width100">报检日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shebeibaojianriqi" value="<fmt:formatDate value='${craneParam.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.jianyanjieshuriqi" value="<fmt:formatDate value='${craneParam.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()" required="required"/>
						<br/>
					    <label class="width100">下次检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.xiacijianyanriqi" value="<fmt:formatDate value='${craneParam.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()" required="required"/>
					    <label class="width100">检验结论:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.jianyanjielun" value="${craneParam.jianyanjielun}" oldValue="${craneParamOld.jianyanjielun}"/>
						<br/>
					    <label class="width100">检验类别:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.jianyanleixing" value="${craneParam.jianyanleixing}" oldValue="${craneParamOld.jianyanleixing}"/>
					    <label class="width100">主要问题:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.zhuyaowenti" value="${craneParam.zhuyaowenti}" oldValue="${craneParamOld.zhuyaowenti}"/>
						<br/>
						</div>
					    <label>事故类别:</label>
					    <select id="cc_sglb" name="craneParam.shiguleibie" sltValue="${craneParam.shiguleibie}" oldValue="${craneParamOld.shiguleibie}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="无" ${craneParam.shiguleibie == "无" ? "selected":""}>无</option>
					    	<option value="一般" ${craneParam.shiguleibie == "一般" ? "selected":""}>一般</option>
					    	<option value="特大" ${craneParam.shiguleibie == "特大" ? "selected":""}>特大</option>
					    	<option value="重大" ${craneParam.shiguleibie == "重大" ? "selected":""}>重大</option>
					    	<option value="严重" ${craneParam.shiguleibie == "严重" ? "selected":""}>严重</option>
					    </select>
					    <label class="width100">事故发生日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shigufashengriqi" value="<fmt:formatDate value='${craneParam.shigufashengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.shigufashengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
						<label class="width100">事故处理结果:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shiguchulijieguo" value="${craneParam.shiguchulijieguo}" oldValue="${craneParamOld.shiguchulijieguo}"/>
					    <label class="width100">设备变动方式:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shebeibiandongfangshi" value="${craneParam.shebeibiandongfangshi}" oldValue="${craneParamOld.shebeibiandongfangshi}"/>
						<br/>
						<label class="width100">设备变动项目:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shebeibiandongxiangmu" value="${craneParam.shebeibiandongxiangmu}" oldValue="${craneParamOld.shebeibiandongxiangmu}"/>
					    <label class="width100">设备变动日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shebeibiandongriqi" value="<fmt:formatDate value='${craneParam.shebeibiandongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.shebeibiandongriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
						<label class="width100">设备承担单位:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.chengdandanwei" value="${craneParam.chengdandanwei}" oldValue="${craneParamOld.chengdandanwei}"/>
					    <label class="width100">承担单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.chengdandanwei_code" value="${craneParam.chengdandanwei_code}" oldValue="${craneParamOld.chengdandanwei_code}"/>
						<br/>
					 	<label class="width100">报告编号:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.baogaobianhao" value="${craneParam.baogaobianhao}" oldValue="${craneParamOld.baogaobianhao}"/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>单位信息</legend>
					<div>
						<label></label>
						<span style="color:red;">【为保证使用单位的一致性，使用单位信息只能在设备列表上修改】</span><br/>
						<label>使用单位:</label>
						<input class="ui-input"   style="width: 420px;" name="craneParam.shiyongdanwei" value="${craneParam.shiyongdanwei}" oldValue="${craneParamOld.shiyongdanwei}" id="bjdshiyongdanwei" required="required" onfocus="this.blur()"/><br/>
						<label>单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="craneParam.shiyongdanwei_dizhi" value="${craneParam.shiyongdanwei_dizhi}" oldValue="${craneParamOld.shiyongdanwei_dizhi}"/><br/>
						
						<label>组织机构代码:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shiyongdanwei_code" value="${craneParam.shiyongdanwei_code}" oldValue="${craneParamOld.shiyongdanwei_code}" />
						<label>法定代表人:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.fadingdaibiaoren" value="${craneParam.fadingdaibiaoren}" oldValue="${craneParamOld.fadingdaibiaoren}" /><br/>
						<label>邮政编码:</label>
						<input class="ui-input"   style="width: 179px;" name="craneParam.shiyongdanwei_youbian" value="${craneParam.shiyongdanwei_youbian}" oldValue="${craneParamOld.shiyongdanwei_youbian}"/>
						<label>操作人员:</label>
						<input class="ui-input"   style="width: 179px;" name="craneParam.shiyongdanwei_caozuorenyuan" value="${craneParam.shiyongdanwei_caozuorenyuan}" oldValue="${craneParamOld.shiyongdanwei_caozuorenyuan}"/><br/>
						<label>主管负责人:</label>
						<input class="ui-input"   style="width: 179px;" name="craneParam.zhuguanfuzeren" value="${craneParam.zhuguanfuzeren}" oldValue="${craneParamOld.zhuguanfuzeren}"/>
						<label>主管负责人电话:</label>
						<input class="ui-input"   style="width: 179px;" name="craneParam.zhuguanfuzerendianhua" value="${craneParam.zhuguanfuzerendianhua}" oldValue="${craneParamOld.zhuguanfuzerendianhua}"/><br/>
						<label>经办人:</label>
						<input class="ui-input"   style="width: 179px;" name="craneParam.jingbanren" value="${craneParam.jingbanren}" oldValue="${craneParamOld.jingbanren}"/>
						<label>经办人电话:</label>
						<input class="ui-input"   style="width: 179px;" name="craneParam.jingbanrendianhua" value="${craneParam.jingbanrendianhua}" oldValue="${craneParamOld.jingbanrendianhua}"/><br/>
						<label>所属行业:</label>
						<div id="sydw_sshy_div" class="divSlt">
							<select style="width: 195px;" sltValue="${craneParam.shiyongdanwei_suoshuhangye}" name="craneParam.shiyongdanwei_suoshuhangye" oldValue="${craneParamOld.shiyongdanwei_suoshuhangye}" id="sydw_sshy"></select>
						</div>
						<hr/>
						<label>施工单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="craneParam.shigongdanwei" value="${craneParam.shigongdanwei}" oldValue="${craneParamOld.shigongdanwei}"/><br/>
						<label>单位地址:</label>						
						<input class="ui-input"   style="width: 420px;" name="craneParam.shigongdanwei_dizhi" value="${craneParam.shigongdanwei_dizhi}" oldValue="${craneParamOld.shigongdanwei_dizhi}"/><br/>
						<label>组织机构代码:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.shigongdanwei_daima" value="${craneParam.shigongdanwei_daima}" oldValue="${craneParamOld.shigongdanwei_daima}"/>
						<label>法人代表:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.shigongdanwei_faren" value="${craneParam.shigongdanwei_faren}" oldValue="${craneParamOld.shigongdanwei_faren}"/><br/>
						<label>联系电话:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.shigongdanwei_lianxidianhua" value="${craneParam.shigongdanwei_lianxidianhua}" oldValue="${craneParamOld.shigongdanwei_lianxidianhua}"/>
						<label>联   系   人:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.shigongdanwei_lianxiren" value="${craneParam.shigongdanwei_lianxiren}" oldValue="${craneParamOld.shigongdanwei_lianxiren}"/><br/>
						<label>许可证编号:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.shigongdanwei_xukezhengbianhao" value="${craneParam.shigongdanwei_xukezhengbianhao}" oldValue="${craneParamOld.shigongdanwei_xukezhengbianhao}"/>
						<label>简称:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.shigongdanwei_jiancheng" value="${craneParam.shigongdanwei_jiancheng}" oldValue="${craneParamOld.shigongdanwei_jiancheng}"/><br/>
						<label>施工日期:</label>						
						<input class="ui-input"   style="width: 179px;" name="craneParam.shigongdanwei_shigongriqi" value="<fmt:formatDate value='${craneParam.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>验收单位:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.yanshoudanwei" value="${craneParam.yanshoudanwei}" oldValue="${craneParamOld.yanshoudanwei}"/>
						<label>验收日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.yanshouriqi" value="<fmt:formatDate value='${craneParam.yanshouriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.yanshouriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>检验机构:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.yanshoujigou" value="${craneParam.yanshoujigou}" oldValue="${craneParamOld.yanshoujigou}"/>
						<label>验收报告编号:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.yanshoubaogaobianhao" value="${craneParam.yanshoubaogaobianhao}" oldValue="${craneParamOld.yanshoubaogaobianhao}"/><br/><hr/>
						
						<label>维保单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="craneParam.weihubaoyangdanwei" value="${craneParam.weihubaoyangdanwei}" oldValue="${craneParamOld.weihubaoyangdanwei}"/><br/>
						<label>资格证书号:</label>						
						<input class="ui-input"   style="width: 179px" name="craneParam.whbydw_zizhizhengshu" value="${craneParam.whbydw_zizhizhengshu}" oldValue="${craneParamOld.whbydw_zizhizhengshu}"/>
						<label>联系人:</label>						
						<input class="ui-input"   style="width: 179px" name="craneParam.weihubaoyangdanwei_lianxiren" value="${craneParam.weihubaoyangdanwei_lianxiren}" oldValue="${craneParamOld.weihubaoyangdanwei_lianxiren}"/><br/>
						<label>联系电话:</label>						
						<input class="ui-input"   style="width: 179px" name="craneParam.weihubaoyangdanwei_dianhua" value="${craneParam.weihubaoyangdanwei_dianhua}" oldValue="${craneParamOld.weihubaoyangdanwei_dianhua}"/>
						<label>单位代码:</label>						
						<input class="ui-input"   style="width: 179px" name="craneParam.weihubaoyangdanwei_code" value="${craneParam.weihubaoyangdanwei_code}" oldValue="${craneParamOld.weihubaoyangdanwei_code}"/><br/>
						<label>维保周期( 周):</label>						
						<input class="ui-input"   style="width: 179px" name="craneParam.weibaozhouqi" value="${craneParam.weibaozhouqi}" oldValue="${craneParamOld.weibaozhouqi}"/>
						<label>大修周期(月):</label>						
						<input class="ui-input"   style="width: 179px" name="craneParam.daxiuzhouqi" value="${craneParam.daxiuzhouqi}" oldValue="${craneParamOld.daxiuzhouqi}"/><br/>
						<label>所在车间分厂:</label>						
						<input class="ui-input"   style="width: 420px;" name="craneParam.suoshuchejian" value="${craneParam.suoshuchejian}" oldValue="${craneParamOld.suoshuchejian}"/><br/>
						<hr/>
						<label>制造单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="craneParam.zhizaodanwei" value="${craneParam.zhizaodanwei}" oldValue="${craneParamOld.zhizaodanwei}"/><br/>
						<label>制造许可证编号:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.zhizaodanweixukezhengbianhao" value="${craneParam.zhizaodanweixukezhengbianhao}" oldValue="${craneParamOld.zhizaodanweixukezhengbianhao}"/>
						<label>资格证书名称:</label>						
						<input class="ui-input"   style="width: 179px" name="craneParam.zhizaodanwei_zigezhengshu" value="${craneParam.zhizaodanwei_zigezhengshu}" oldValue="${craneParamOld.zhizaodanwei_zigezhengshu}"/><br/>
						<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.zhizaodanwei_lianxidianhua" value="${craneParam.zhizaodanwei_lianxidianhua}" oldValue="${craneParamOld.zhizaodanwei_lianxidianhua}"/>
						<label>使用场合:</label>						
						<input class="ui-input"   style="width: 179px" name="craneParam.zhizaodanwei_shiyongchanghe" value="${craneParam.zhizaodanwei_shiyongchanghe}" oldValue="${craneParamOld.zhizaodanwei_shiyongchanghe}"/><br/>
						<label>制造单位统一社会信用代码:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.zhizaodanwei_code" value="${craneParam.zhizaodanwei_code}" oldValue="${craneParamOld.zhizaodanwei_code}"/>
						<label>产品品牌:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.chanpinpinpai" value="${craneParam.chanpinpinpai}" oldValue="${craneParamOld.chanpinpinpai}"/>
						<br/>
						<hr/>
						<label>产权单位:</label>
						<input class="ui-input"   style="width: 420px;" name="craneParam.chanquandanwei" value="${craneParam.chanquandanwei}" oldValue="${craneParamOld.chanquandanwei}"/><br/>
						<label>产权单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="craneParam.chanquandanwei_dizhi" value="${craneParam.chanquandanwei_dizhi}" oldValue="${craneParamOld.chanquandanwei_dizhi}"/><br/>
						<label>产权单位代码:</label>
						<input class="ui-input"   style="width: 179px;" name="craneParam.chanquandanwei_daima" value="${craneParam.chanquandanwei_daima}" oldValue="${craneParamOld.chanquandanwei_daima}"/>
						<label>邮政编码:</label>						
						<input class="ui-input"   style="width: 179px" name="craneParam.chanquandanwei_youbian" value="${craneParam.chanquandanwei_youbian}" oldValue="${craneParamOld.chanquandanwei_youbian}"/><br/>
						<label>法人代表:</label>
						<input class="ui-input"   style="width: 179px;" name="craneParam.chanquandanwei_farendaibiao" value="${craneParam.chanquandanwei_farendaibiao}" oldValue="${craneParamOld.chanquandanwei_farendaibiao}"/>
						<label>联系电话:</label>						
						<input class="ui-input"   style="width: 179px" name="craneParam.chanquandanwei_dianhua" value="${craneParam.chanquandanwei_dianhua}" oldValue="${craneParamOld.chanquandanwei_dianhua}"/><br/>
						<br/>
					 	<hr/>
					 	<label>设计单位:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shejidanwei" value="${craneParam.shejidanwei}" oldValue="${craneParamOld.shejidanwei}"/>
					 	<label>设计单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shejidanweidaima" value="${craneParam.shejidanweidaima}" oldValue="${craneParamOld.shejidanweidaima}"/>
					    <br/>
					 	<hr/>
					 	<label>安装单位:</label>
						<input class="ui-input" style="width: 420px;" name="craneParam.anzhuangdanwei" value="${craneParam.anzhuangdanwei}" oldValue="${craneParamOld.anzhuangdanwei}"/><br/>
					 	<label>安装单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.anzhuangdanwei_daima" value="${craneParam.anzhuangdanwei_daima}" oldValue="${craneParamOld.anzhuangdanwei_daima}"/>
					    <label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.anzhuangdanwei_lianxidianhua" value="${craneParam.anzhuangdanwei_lianxidianhua}" oldValue="${craneParamOld.anzhuangdanwei_lianxidianhua}"/><br/>
						<label>项目负责人:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.anzhuangdanwei_lianxiren" value="${craneParam.anzhuangdanwei_lianxiren}" oldValue="${craneParamOld.anzhuangdanwei_lianxiren}"/>
					    <label>资格证书编号:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.anzhuangdanwei_zigezhengshu" value="${craneParam.anzhuangdanwei_zigezhengshu}" oldValue="${craneParamOld.anzhuangdanwei_zigezhengshu}"/><br/>
					 	<hr/>
					</div>
					</fieldset>
					
					<fieldset>
					<legend>设备参数</legend>
						<label>车辆运行速度(km/h):</label>	
						<input class='ui-input' style="width: 179px;" name="craneParam.yunxingsudu" value="${craneParam.yunxingsudu}" oldValue="${craneParamOld.yunxingsudu}"/>
						<label>车辆额定载荷(kg):</label>	
						<input class='ui-input' style="width: 179px;" name="craneParam.changneicheliang_edingzaihe" value="${craneParam.changneicheliang_edingzaihe}" oldValue="${craneParamOld.changneicheliang_edingzaihe}"/><br/>
						<label >动力方式:</label>	
						<s:select id="cc_dlfs" name="craneParam.donglifangshi" list="#{'':'','电动':'电动','内燃':'内燃'}" value="craneParam.donglifangshi" sltValue="${craneParam.donglifangshi}" oldValue="${craneParamOld.donglifangshi}" style="width: 179px;"></s:select>
						<label>车辆名称:</label>
					    <input  class="ui-input" style="width: 179px;" name="craneParam.cheliangmingcheng" value="${craneParam.cheliangmingcheng}" oldValue="${craneParamOld.cheliangmingcheng}"/><br>
					    <label>厂牌型号:</label>
					    <input  class="ui-input" style="width: 179px;" name="craneParam.changpaixinghao" value="${craneParam.changpaixinghao}" oldValue="${craneParamOld.changpaixinghao}"/>
					    <label>驱动:</label>
						<s:select id="cc_qd" name="craneParam.qudong" list="#{'':'','4*2':'4*2','4*4':'4*4'}" value="craneParam.qudong" sltValue="${craneParam.qudong}" oldValue="${craneParamOld.qudong}" style="width: 195px;"></s:select><br/>
					    <label>燃料种类:</label>
					    <select id="cc_rlzl" name="craneParam.ranliaozhonglei" sltValue="${craneParam.ranliaozhonglei}" oldValue="${craneParamOld.ranliaozhonglei}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="柴油" ${craneParam.ranliaozhonglei == "柴油" ? "selected":""}>柴油</option>
					    	<option value="汽油" ${craneParam.ranliaozhonglei == "汽油" ? "selected":""}>汽油</option>
					    	<option value="天然气" ${craneParam.ranliaozhonglei == "天然气" ? "selected":""}>天然气</option>
					    	<option value="液化石油气" ${craneParam.ranliaozhonglei == "液化石油气" ? "selected":""}>液化石油气</option>
					    	<option value="蓄电池" ${craneParam.ranliaozhonglei == "蓄电池" ? "selected":""}>蓄电池</option>
					    	<option value="混动:柴油、汽油" ${craneParam.ranliaozhonglei == "混动：柴油、汽油" ? "selected":""}>混动：柴油、汽油</option>
					    	<option value="混动:柴油、天然气" ${craneParam.ranliaozhonglei == "混动:柴油、天然气" ? "selected":""}>混动:柴油、天然气</option>
					    	<option value="混动:柴油、液化石油气" ${craneParam.ranliaozhonglei == "混动:柴油、液化石油气" ? "selected":""}>混动:柴油、液化石油气</option>
					    	<option value="混动:柴油、蓄电池" ${craneParam.ranliaozhonglei == "混动:柴油、蓄电池" ? "selected":""}>混动:柴油、蓄电池</option>
					    	<option value="混动:汽油、天然气" ${craneParam.ranliaozhonglei == "混动:汽油、天然气" ? "selected":""}>混动:汽油、天然气</option>
					    	<option value="混动:汽油、液化石油气" ${craneParam.ranliaozhonglei == "混动:汽油、液化石油气" ? "selected":""}>混动:汽油、液化石油气</option>
					    	<option value="混动:汽油、蓄电池" ${craneParam.ranliaozhonglei == "混动:汽油、蓄电池" ? "selected":""}>混动:汽油、蓄电池</option>
					    	<option value="混动:天然气、液化石油气" ${craneParam.ranliaozhonglei == "混动:天然气、液化石油气" ? "selected":""}>混动:天然气、液化石油气</option>
					    	<option value="混动:天然气、蓄电池" ${craneParam.ranliaozhonglei == "混动:天然气、蓄电池" ? "selected":""}>混动:天然气、蓄电池</option>
					    	<option value="混动:液化石油气、蓄电池" ${craneParam.ranliaozhonglei == "混动:液化石油气、蓄电池" ? "selected":""}>混动:液化石油气、蓄电池</option>
					    </select>
					    <label>额定载重(kg):</label>
					    <input  class="ui-input" style="width: 179px;" name="craneParam.edingqizhongliang" value="${craneParam.edingqizhongliang}" oldValue="${craneParamOld.edingqizhongliang}"/><br/>
					    <label>空车重量(kg):</label>
					    <input  class="ui-input" style="width: 179px;" name="craneParam.kongchezhongliang" value="${craneParam.kongchezhongliang}" oldValue="${craneParamOld.kongchezhongliang}"/>
					    <label>颜色:</label>
					    <input  class="ui-input" style="width: 179px;" name="craneParam.yanse" value="${craneParam.yanse}" oldValue="${craneParamOld.yanse}"/><br/>
					    <label>是否拖挂车:</label>
						<s:select id="cc_tgc" name="craneParam.tuoguache" list="#{'':'','无':'无','有':'有'}" value="craneParam.tuoguache" sltValue="${craneParam.tuoguache}" oldValue="${craneParamOld.tuoguache}" style="width: 179px;"></s:select>
					    <label>底盘编号:</label>
					    <input  class="ui-input" style="width: 179px;" name="craneParam.dipanbianhao" value="${craneParam.dipanbianhao}" oldValue="${craneParamOld.dipanbianhao}"/><br/>
					    <label>发动机编号:</label>
					    <input  class="ui-input" style="width: 179px;" name="craneParam.fadongjibianhao" value="${craneParam.fadongjibianhao}" oldValue="${craneParamOld.fadongjibianhao}"/>
					    <label>最高时速(km):</label>
						<!-- <s:select id="cc_zgss" name="craneParam.zuigaoshisu" list="#{'':'','10':'10','5':'5'}" value="craneParam.zuigaoshisu" sltValue="${craneParam.zuigaoshisu}" oldValue="${craneParamOld.zuigaoshisu}" style="width: 195px;"></s:select> -->
						<input  class="ui-input" style="width: 179px;" name="craneParam.zuigaoshisu" value="${craneParam.zuigaoshisu}" oldValue="${craneParamOld.zuigaoshisu}"/><br/>
					    <label>使用区域:</label>
					    <input  class="ui-input" style="width: 179px;" name="craneParam.shiyongquyu" value="${craneParam.shiyongquyu}" oldValue="${craneParamOld.shiyongquyu}"/><br/>
					    <br/>
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
	/****/
	var columns = "";
	var setSel;
	var path = "<%=path %>";
	var id = $('#cid').val();
	var type = $('#status').val();
	
	if("${param.adr}" == "sjsh"){
		$("#mnubtn_jcsj_sb_yzc_edit_update").hide();
	}
	$("#cc_dlfs").selectmenu();
	$("#cc_qd").selectmenu();
	$("#cc_tgc").selectmenu();
	$("#cc_zgss").selectmenu();
	$("#cc_zdwxy").selectmenu();
	$("#cc_zdjk").selectmenu();
	$("#cc_jyya").selectmenu();
	$("#cc_rkmjq").selectmenu();
	$("#cc_sglb").selectmenu();
	$("#cc_rlzl").selectmenu();
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
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${craneParam.shebeizhongleidaima}"},
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
				url:"<%=path%>/se!updateByQZJX.do?tjstate="+tjstate+"&address=${address}&dbid=${dbid}",
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
		var id = $('#cid').val();
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