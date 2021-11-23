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

fieldset {
padding:10px;
margin-top:5px;
border:1px solid #1E7ACE;
background:#fff;
width:60%;
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
	                	 <input type="hidden" name="recreat.id" value="${recreat.id}" id="rid"/>
	                	 <input type="hidden" name="recreat.zcstatus" value="${recreat.zcstatus}" id="status"/>
	                	 <input type="hidden" name="recreat.shebeizhongleidaima" value="${recreat.shebeizhongleidaima}"/>
	                	 <input type="hidden" name="recreat.shiyongdanweiId" value="${recreat.shiyongdanweiId}"/>
	                	 <input type="hidden" name="recreat.shigongdanweiId" value="${recreat.shigongdanweiId}"/>
	                	 <input type="hidden" name="recreat.state" value="${recreat.state}"/>
	                	 <input type="hidden" name="recreat.flag" value="${recreat.flag}"/>
	                	 <input type="hidden" name="recreat.eqhide" value="${recreat.eqhide}"/>
	                	 <input type="hidden" name="recreat.fj_filepath" value="${recreat.fj_filepath}"/>
	                	 <input type="hidden" name="recreat.biaozhuleixing" value="${recreat.biaozhuleixing}"/>
	                	 <input type="hidden" name="recreat.banjieriqi" value="${recreat.banjieriqi}"/>
		            	<input type="hidden" name="recreat.pid" value="${recreat.pid}" id="pid"/>
						<input type="hidden" value="${recreat.tmpData}" name="recreat.tmpData" />
	                	 <input type="hidden" name="recreat.jingdu" value="${recreat.jingdu}"/>
	                	 <input type="hidden" name="recreat.weidu" value="${recreat.weidu}"/>
		            	<input type="hidden" name="recreat.dj_jingbanriqi" value="${recreat.dj_jingbanriqi}"/>
		            	<input type="hidden" name="recreat.djb_id" value="${recreat.djb_id}"/>
		            	<input type="hidden" name="recreat.yjyy" value="${recreat.yjyy}"/>
                	</div>
					<fieldset>
					<legend>基本信息</legend>
					<div>
					    <label>设备名称:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shebeimingcheng" value="${recreat.shebeimingcheng }" oldValue="${recreatOld.shebeimingcheng}" id="mingcheng"></select>
					    <label>设备种类:</label>
					    <input class="ui-input" readonly="true" name="recreat.shebeizhonglei" style="width: 179px;" id="yzc_shebeizhonglei" value="大型游乐设施" oldValue="大型游乐设施"/><br/>
					    <label>设备类别:</label>
					    	<div id="yzc_shebeileibie_div" class="divSlt">
	        					<select name="recreat.shebeileibiedaima" sltValue="${recreat.shebeileibiedaima}" oldValue="${recreatOld.shebeileibiedaima}" style="width: 195px;" id="yzc_shebeileibie"></select>
					    	</div>
					    <label>设备品种:</label>
					    	<div id="yzc_shebeipinzhong_div" class="divSlt">
	        					<select name="recreat.shenbeipinzhongdaima" sltValue="${recreat.shenbeipinzhongdaima}" oldValue="${recreatOld.shenbeipinzhongdaima}" style="width: 195px;" id="yzc_shebeipinzhong"></select>
					    	</div>
					    	<br/>
					    <label>设备代码:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shebeidaima" value="${recreat.shebeidaima}" oldValue="${recreatOld.shebeidaima}"/>
					    <label>型号规格:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shebeixinghao" value="${recreat.shebeixinghao}" oldValue="${recreatOld.shebeixinghao}"/><br/>
						<label>制造日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="recreat.zhizaoriqi_date" value="<fmt:formatDate value='${recreat.zhizaoriqi_date}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.zhizaoriqi_date}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>制造日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="recreat.zhizaoriqi" value="${recreat.zhizaoriqi}" oldValue="${recreatOld.zhizaoriqi}"/><br/>
						<label>投用日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="recreat.touyongriqi_date" value="<fmt:formatDate value='${recreat.touyongriqi_date}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.touyongriqi_date}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>投用日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="recreat.touyongriqi" value="${recreat.touyongriqi}" oldValue="${recreatOld.touyongriqi}"/><br/>
					    <label>安装竣工日期:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.anzhuangriqi" value="<fmt:formatDate value='${recreat.anzhuangriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.anzhuangriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label>出厂编号:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.chuchangbianhao" value="${recreat.chuchangbianhao}" oldValue="${recreatOld.chuchangbianhao}"/><br/>
						<label>设备注册代码:</label>
						<input class="ui-input" style="width: 179px;background-color:#E0E0E0" readonly="true" name="recreat.zhucedaima" value="${recreat.zhucedaima}" oldValue="${recreatOld.zhucedaima}" id="zcdm"/>
					    <label>设备注册日期:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.zhuceriqi" value="<fmt:formatDate value='${recreat.zhuceriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.zhuceriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>使用登记证编号:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.dengjizhengbianhao" value="${recreat.dengjizhengbianhao}" oldValue="${recreatOld.dengjizhengbianhao}" readonly="true"/>
					    <label>发证日期:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.fazhengriqi" value="<fmt:formatDate value='${recreat.fazhengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.fazhengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>内部编号:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.neibubianhao" value="${recreat.neibubianhao}" oldValue="${recreatOld.neibubianhao}"/>
					    <label>设备地点:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shebeididian" value="${recreat.shebeididian}" oldValue="${recreatOld.shebeididian}"/><br/>
						<label>市:</label>
							<div id="shi_div" class="divSlt" onclick="delay()">
	        					<select name="recreat.shidaima" sltValue="${recreat.shidaima}" oldValue="${recreatOld.shidaima}" style="width: 195px;" id="shi"></select>
							</div>
						<label>区划名称:</label>
							<div id="quxian_div" class="divSlt" onclick="delay()">
	        					<select name="recreat.quhuadaima" sltValue="${recreat.quhuadaima}" oldValue="${recreatOld.quhuadaima}" style="width: 195px;" id="quxian"></select>
							</div>
							<br/>
						<label>乡镇:</label>
							<div id="xiangzhen_div" class="divSlt">
	        					<select name="recreat.xiangzhendaima" sltValue="${recreat.xiangzhendaima}" oldValue="${recreatOld.xiangzhendaima}" style="width: 195px;" id="xiangzhen"></select>
							</div>
					    <label>是否市直:</label>
						<s:select name="recreat.szstatus" list="#{'0':'否','1':'是'}" value="recreat.szstatus" sltValue="${recreat.szstatus}" oldValue="${recreatOld.szstatus}" style="width: 195px;" id="shizhi"></s:select><br/>
						<label>设备使用年限:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shebeishiyongnianxian" value="${recreat.shebeishiyongnianxian}" oldValue="${recreatOld.shebeishiyongnianxian}"/>
						<label>固定资产值:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.gudingzichanzhi" value="${recreat.gudingzichanzhi}" oldValue="${recreatOld.gudingzichanzhi}"/><br/>
						<label>使用单位联系电话:</label>
						<input class="ui-input"   style="width: 179px;" name="recreat.shiyongdanwei_lianxidianhua" value="${recreat.shiyongdanwei_lianxidianhua}" oldValue="${recreatOld.shiyongdanwei_lianxidianhua}"/>
						<label>使用单位联系人:</label>
						<input class="ui-input"   style="width: 179px;" name="recreat.shiyongdanwei_lianxiren" value="${recreat.shiyongdanwei_lianxiren}" oldValue="${recreatOld.shiyongdanwei_lianxiren}"/><br/>
						<label>注册登记机构:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.zhucedengjijigou" value="${recreat.zhucedengjijigou}" oldValue="${recreatOld.zhucedengjijigou}"/>
						<label>注册登记日期:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.zhuceriqi" value="<fmt:formatDate value='${recreat.zhuceriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.zhuceriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>注册登记人员:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.zhucedengjirenyuan" value="${recreat.zhucedengjirenyuan}" oldValue="${recreatOld.zhucedengjirenyuan}"/>
						<label>更新日期:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.biangengriqi" value="<fmt:formatDate value='${recreat.biangengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.biangengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>填表人员:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.tianbiaorenyuan" value="${recreat.tianbiaorenyuan}" oldValue="${recreatOld.tianbiaorenyuan}"/>
						<label>填表日期:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.tianbiaoriqi" value="<fmt:formatDate value='${recreat.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>安全管理部门:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.anquanguanlibumen" value="${recreat.anquanguanlibumen}" oldValue="${recreatOld.anquanguanlibumen}"/>
					 	<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.anquanguanli_lianxidianhua" value="${recreat.anquanguanli_lianxidianhua}" oldValue="${recreatOld.anquanguanli_lianxidianhua}"/>
					    <br/>
					    <label>安全管理人员:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.anquanguanlirenyuan" value="${recreat.anquanguanlirenyuan}" oldValue="${recreatOld.anquanguanlirenyuan}"/>
						<label>是否重大危险源:</label>
					    <select id="cc_zdwxy" name="recreat.shifou_zhongdaweixianyuan" sltValue="${recreat.shifou_zhongdaweixianyuan}" oldValue="${recreatOld.shifou_zhongdaweixianyuan}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${recreat.shifou_zhongdaweixianyuan == "否" ? "selected":""}>否</option>
					    	<option value="是" ${recreat.shifou_zhongdaweixianyuan == "是" ? "selected":""}>是</option>
					    </select> <br/>
					    <label>是否重点监控特种设备:</label>
					    <select id="cc_zdjk" name="recreat.shifou_zhongdianjiankong" sltValue="${recreat.shifou_zhongdianjiankong}" oldValue="${recreatOld.shifou_zhongdianjiankong}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${recreat.shifou_zhongdianjiankong == "否" ? "selected":""}>否</option>
					    	<option value="是" ${recreat.shifou_zhongdianjiankong == "是" ? "selected":""}>是</option>
					    </select>
					    <label>是否制定事故应急措施和救援预案:</label>
					    <select id="cc_jyya" name="recreat.shifou_yingjifangan" sltValue="${recreat.shifou_yingjifangan}" oldValue="${recreatOld.shifou_yingjifangan}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${recreat.shifou_yingjifangan == "否" ? "selected":""}>否</option>
					    	<option value="是" ${recreat.shifou_yingjifangan == "是" ? "selected":""}>是</option>
					    </select> <br/>
					    <label>是否在人口密集区:</label>
					    <select id="cc_rkmjq" name="recreat.shifou_renkoumijiqu" sltValue="${recreat.shifou_renkoumijiqu}" oldValue="${recreatOld.shifou_renkoumijiqu}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${recreat.shifou_renkoumijiqu == "否" ? "selected":""}>否</option>
					    	<option value="是" ${recreat.shifou_renkoumijiqu == "是" ? "selected":""}>是</option>
					    </select>
						<label>备注:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.beizhu" value="${recreat.beizhu}" oldValue="${recreatOld.beizhu}"/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>检验信息</legend>
					<div>
						<div id="jyxx_div">
					    <label class="width100">检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.jianyanjigou" value="${recreat.jianyanjigou}" oldValue="${recreatOld.jianyanjigou}"/>
						<label class="width100">检验机构代码:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.jianyanjigou_code" value="${recreat.jianyanjigou_code}" oldValue="${recreatOld.jianyanjigou_code}"/><br/>
					    <label class="width100">报检日期:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shebeibaojianriqi" value="<fmt:formatDate value='${recreat.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.jianyanjieshuriqi" value="<fmt:formatDate value='${recreat.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()" required="required"/>
						<br/>
					    <label class="width100">下次检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.xiacijianyanriqi" value="<fmt:formatDate value='${recreat.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()" required="required"/>
					    <label class="width100">检验结论:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.jianyanjielun" value="${recreat.jianyanjielun}" oldValue="${recreatOld.jianyanjielun}"/>
						<br/>
					    <label class="width100">检验类别:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.jianyanleixing" value="${recreat.jianyanleixing}" oldValue="${recreatOld.jianyanleixing}"/>
					    <label class="width100">主要问题:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.zhuyaowenti" value="${recreat.zhuyaowenti}" oldValue="${recreatOld.zhuyaowenti}"/>
						<br/>
						</div>
						<label class="width100">事故类别:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shiguleibie" value="${recreat.shiguleibie}" oldValue="${recreatOld.shiguleibie}"/>
					    <label class="width100">事故发生日期:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shigufashengriqi" value="<fmt:formatDate value='${recreat.shigufashengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.shigufashengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
						<label class="width100">事故处理结果:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shiguchulijieguo" value="${recreat.shiguchulijieguo}" oldValue="${recreatOld.shiguchulijieguo}"/>
					    <label class="width100">设备变动方式:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shebeibiandongfangshi" value="${recreat.shebeibiandongfangshi}" oldValue="${recreatOld.shebeibiandongfangshi}"/>
						<br/>
						<label class="width100">设备变动项目:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shebeibiandongxiangmu" value="${recreat.shebeibiandongxiangmu}" oldValue="${recreatOld.shebeibiandongxiangmu}"/>
					    <label class="width100">设备变动日期:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shebeibiandongriqi" value="<fmt:formatDate value='${recreat.shebeibiandongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.shebeibiandongriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
						<label class="width100">设备承担单位:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.chengdandanwei" value="${recreat.chengdandanwei}" oldValue="${recreatOld.chengdandanwei}"/>
					    <label class="width100">承担单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.chengdandanwei_code" value="${recreat.chengdandanwei_code}" oldValue="${recreatOld.chengdandanwei_code}"/>
						<br/>
					 	<label class="width100">报告编号:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.baogaobianhao" value="${recreat.baogaobianhao}" oldValue="${recreatOld.baogaobianhao}"/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>单位信息</legend>
					<div>
						<label></label>
						<span style="color:red;">【为保证使用单位的一致性，使用单位信息只能在设备列表上修改】</span><br/>
						<label>使用单位:</label>
						<input class="ui-input"   style="width: 420px;" name="recreat.shiyongdanwei" value="${recreat.shiyongdanwei}" oldValue="${recreatOld.shiyongdanwei}" required="required" onfocus="this.blur()"/><br/>
						<label>单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="recreat.shiyongdanwei_dizhi" value="${recreat.shiyongdanwei_dizhi}" oldValue="${recreatOld.shiyongdanwei_dizhi}"/><br/>
						<label>组织机构代码:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shiyongdanwei_code" value="${recreat.shiyongdanwei_code}" oldValue="${recreatOld.shiyongdanwei_code}" />
						<label>法定代表人:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.fadingdaibiaoren" value="${recreat.fadingdaibiaoren}" oldValue="${recreatOld.fadingdaibiaoren}" /><br/>
						<label>邮政编码:</label>
						<input class="ui-input"   style="width: 179px;" name="recreat.shiyongdanwei_youbian" value="${recreat.shiyongdanwei_youbian}" oldValue="${recreatOld.shiyongdanwei_youbian}"/>
						<label>操作人员:</label>
						<input class="ui-input"   style="width: 179px;" name="recreat.shiyongdanwei_caozuorenyuan" value="${recreat.shiyongdanwei_caozuorenyuan}" oldValue="${recreatOld.shiyongdanwei_caozuorenyuan}"/><br/>
						<label>主管负责人:</label>
						<input class="ui-input"   style="width: 179px;" name="recreat.zhuguanfuzeren" value="${recreat.zhuguanfuzeren}" oldValue="${recreatOld.zhuguanfuzeren}"/>
						<label>主管负责人电话:</label>
						<input class="ui-input"   style="width: 179px;" name="recreat.zhuguanfuzerendianhua" value="${recreat.zhuguanfuzerendianhua}" oldValue="${recreatOld.zhuguanfuzerendianhua}"/><br/>
						<label>经办人:</label>
						<input class="ui-input"   style="width: 179px;" name="recreat.jingbanren" value="${recreat.jingbanren}" oldValue="${recreatOld.jingbanren}"/>
						<label>经办人电话:</label>
						<input class="ui-input"   style="width: 179px;" name="recreat.jingbanrendianhua" value="${recreat.jingbanrendianhua}" oldValue="${recreatOld.jingbanrendianhua}"/><br/>
						<label>所属行业:</label>
						<div id="sydw_sshy_div" class="divSlt">
							<select style="width: 195px;" sltValue="${recreat.shiyongdanwei_suoshuhangye}" name="recreat.shiyongdanwei_suoshuhangye" oldValue="${recreatOld.shiyongdanwei_suoshuhangye}" id="sydw_sshy"></select>
						</div>
						<hr/>
						
						<label>施工单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="recreat.shigongdanwei" value="${recreat.shigongdanwei}" oldValue="${recreatOld.shigongdanwei}"/><br/>
						<label>组织机构代码:</label>	
						<input class="ui-input"   style="width: 179px;" name="recreat.shigongdanwei_daima" value="${recreat.shigongdanwei_daima}" oldValue="${recreatOld.shigongdanwei_daima}"/>
						<label>法人代表:</label>	
						<input class="ui-input"   style="width: 179px;" name="recreat.shigongdanwei_faren" value="${recreat.shigongdanwei_faren}" oldValue="${recreatOld.shigongdanwei_faren}"/><br/>
						<label>施工日期:</label>						
						<input class="ui-input"   style="width: 179px;" name="recreat.shigongdanwei_shigongriqi" value="<fmt:formatDate value='${recreat.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>验收单位:</label>	
						<input class="ui-input"   style="width: 179px;" name="recreat.yanshoudanwei" value="${recreat.yanshoudanwei}" oldValue="${recreatOld.yanshoudanwei}"/><br/>
						<label>验收日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="recreat.yanshouriqi" value="<fmt:formatDate value='${recreat.yanshouriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${recreatOld.yanshouriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>检验机构:</label>	
						<input class="ui-input"   style="width: 179px;" name="recreat.yanshoujigou" value="${recreat.yanshoujigou}" oldValue="${recreatOld.yanshoujigou}"/><br/>
						<label>验收报告编号:</label>	
						<input class="ui-input"   style="width: 179px;" name="recreat.yanshoubaogaobianhao" value="${recreat.yanshoubaogaobianhao}" oldValue="${recreatOld.yanshoubaogaobianhao}"/><br/><hr/>
						
						<label>维保单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="recreat.weihubaoyangdanwei" value="${recreat.weihubaoyangdanwei}" oldValue="${recreatOld.weihubaoyangdanwei}"/><br/>
						<label>资格证书号:</label>						
						<input class="ui-input"   style="width: 179px" name="recreat.whbydw_zizhizhengshu" value="${recreat.whbydw_zizhizhengshu}" oldValue="${recreatOld.whbydw_zizhizhengshu}"/>
						<label>联系人:</label>						
						<input class="ui-input"   style="width: 179px" name="recreat.weihubaoyangdanwei_lianxiren" value="${recreat.weihubaoyangdanwei_lianxiren}" oldValue="${recreatOld.weihubaoyangdanwei_lianxiren}"/><br/>
						<label>联系电话:</label>						
						<input class="ui-input"   style="width: 179px" name="recreat.weihubaoyangdanwei_dianhua" value="${recreat.weihubaoyangdanwei_dianhua}" oldValue="${recreatOld.weihubaoyangdanwei_dianhua}"/>
						<label>单位代码:</label>						
						<input class="ui-input"   style="width: 179px" name="recreat.weihubaoyangdanwei_code" value="${recreat.weihubaoyangdanwei_code}" oldValue="${recreatOld.weihubaoyangdanwei_code}"/><br/>
						<label>维保周期( 周):</label>						
						<input class="ui-input"   style="width: 179px" name="recreat.weibaozhouqi" value="${recreat.weibaozhouqi}" oldValue="${recreatOld.weibaozhouqi}"/>
						<label>大修周期(月):</label>						
						<input class="ui-input"   style="width: 179px" name="recreat.daxiuzhouqi" value="${recreat.daxiuzhouqi}" oldValue="${recreatOld.daxiuzhouqi}"/><br/>
						<label>所在车间分厂:</label>						
						<input class="ui-input"   style="width: 420px;" name="recreat.suoshuchejian" value="${recreat.suoshuchejian}" oldValue="${recreatOld.suoshuchejian}"/><br/>
						<hr/>
						
						<label>制造单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="recreat.zhizaodanwei" value="${recreat.zhizaodanwei}" oldValue="${recreatOld.zhizaodanwei}"/><br/>
						<label>制造许可证编号:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.zhizaodanweixukezhengbianhao" value="${recreat.zhizaodanweixukezhengbianhao}" oldValue="${recreatOld.zhizaodanweixukezhengbianhao}"/>
						<label>资格证书名称:</label>						
						<input class="ui-input"   style="width: 179px" name="recreat.zhizaodanwei_zigezhengshu" value="${recreat.zhizaodanwei_zigezhengshu}" oldValue="${recreatOld.zhizaodanwei_zigezhengshu}"/><br/>
						<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.zhizaodanwei_lianxidianhua" value="${recreat.zhizaodanwei_lianxidianhua}" oldValue="${recreatOld.zhizaodanwei_lianxidianhua}"/>
						<label>使用场合:</label>						
						<input class="ui-input"   style="width: 179px" name="recreat.zhizaodanwei_shiyongchanghe" value="${recreat.zhizaodanwei_shiyongchanghe}" oldValue="${recreatOld.zhizaodanwei_shiyongchanghe}"/><br/>
						<label>制造单位统一社会信用代码:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.zhizaodanwei_code" value="${recreat.zhizaodanwei_code}" oldValue="${recreatOld.zhizaodanwei_code}"/>
						<label>产品品牌:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.chanpinpinpai" value="${recreat.chanpinpinpai}" oldValue="${recreatOld.chanpinpinpai}"/>
						<br/>
						<hr/>
						<label>产权单位:</label>
						<input class="ui-input"   style="width: 420px;" name="recreat.chanquandanwei" value="${recreat.chanquandanwei}" oldValue="${recreatOld.chanquandanwei}"/><br/>
						<label>产权单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="recreat.chanquandanwei_dizhi" value="${recreat.chanquandanwei_dizhi}" oldValue="${recreatOld.chanquandanwei_dizhi}"/><br/>
						<label>产权单位代码:</label>
						<input class="ui-input"   style="width: 179px;" name="recreat.chanquandanwei_daima" value="${recreat.chanquandanwei_daima}" oldValue="${recreatOld.chanquandanwei_daima}"/>
						<label>邮政编码:</label>						
						<input class="ui-input"   style="width: 179px" name="recreat.chanquandanwei_youbian" value="${recreat.chanquandanwei_youbian}" oldValue="${recreatOld.chanquandanwei_youbian}"/><br/>
						<label>法人代表:</label>
						<input class="ui-input"   style="width: 179px;" name="recreat.chanquandanwei_farendaibiao" value="${recreat.chanquandanwei_farendaibiao}" oldValue="${recreatOld.chanquandanwei_farendaibiao}"/>
						<label>联系电话:</label>						
						<input class="ui-input"   style="width: 179px" name="recreat.chanquandanwei_dianhua" value="${recreat.chanquandanwei_dianhua}" oldValue="${recreatOld.chanquandanwei_dianhua}"/><br/>
						
						<br/>
						<hr/>
						<label>设计单位:</label>	
						<input class="ui-input" style="width: 179px;" name="recreat.shejidanwei" value="${recreat.shejidanwei}" oldValue="${recreatOld.shejidanwei}"/>
					 	<label>设计单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.shejidanweidaima" value="${recreat.shejidanweidaima}" oldValue="${recreatOld.shejidanweidaima}"/>
					    <br/>
					 	<hr/>
					 	<label>安装单位:</label>
						<input class="ui-input" style="width: 420px;" name="recreat.anzhuangdanwei" value="${recreat.anzhuangdanwei}" oldValue="${recreatOld.anzhuangdanwei}"/><br/>
					 	<label>安装单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.anzhuangdanwei_daima" value="${recreat.anzhuangdanwei_daima}" oldValue="${recreatOld.anzhuangdanwei_daima}"/>
					    <label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.anzhuangdanwei_lianxidianhua" value="${recreat.anzhuangdanwei_lianxidianhua}" oldValue="${recreatOld.anzhuangdanwei_lianxidianhua}"/><br/>
						<label>项目负责人:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.anzhuangdanwei_lianxiren" value="${recreat.anzhuangdanwei_lianxiren}" oldValue="${recreatOld.anzhuangdanwei_lianxiren}"/>
					    <label>资格证书编号:</label>
						<input class="ui-input" style="width: 179px;" name="recreat.anzhuangdanwei_zigezhengshu" value="${recreat.anzhuangdanwei_zigezhengshu}" oldValue="${recreatOld.anzhuangdanwei_zigezhengshu}"/><br/>
					 	<hr/>
					</div>
					</fieldset>
					<fieldset>
					<legend>设备参数</legend>
						<label>游乐设施线速度(m/s):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.xiansudu" value="${recreat.xiansudu}" oldValue="${recreatOld.xiansudu}"/>
						<label>游乐设施高度(m):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.ylss_gaodu" value="${recreat.ylss_gaodu}" oldValue="${recreatOld.ylss_gaodu}"/><br/>
						<label>额定乘客人数(人):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.edingchengkerenshu" value="${recreat.edingchengkerenshu}" oldValue="${recreatOld.edingchengkerenshu}"/>
						<label>额定载荷(Kg):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.edingzaihe" value="${recreat.edingzaihe}" oldValue="${recreatOld.edingzaihe}"/><br/>
						<label>额定速度(m/s):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.sudu" value="${recreat.sudu}" oldValue="${recreatOld.sudu}"/>
						<label>倾夹角或坡度(度):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.qingjiao" value="${recreat.qingjiao}" oldValue="${recreatOld.qingjiao}"/><br/>
						<label>副速度(m/s):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.fusudu" value="${recreat.fusudu}" oldValue="${recreatOld.fusudu}"/>
						<label>驱动形式:</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.qudongxingshi" value="${recreat.qudongxingshi}" oldValue="${recreatOld.qudongxingshi}"/><br/>
						<label>驱动主功率(kw):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.qudongzhugonglv" value="${recreat.qudongzhugonglv}" oldValue="${recreatOld.qudongzhugonglv}"/>
						<label>电压(v):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.dianya" value="${recreat.dianya}" oldValue="${recreatOld.dianya}"/><br/>
						<label>副功率(kw):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.fugonglv" value="${recreat.fugonglv}" oldValue="${recreatOld.fugonglv}"/>
						<label>座舱高度(m):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.gaodu" value="${recreat.gaodu}" oldValue="${recreatOld.gaodu}"/><br/>
						<label>回转直径(m):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.huizhuanzhijing" value="${recreat.huizhuanzhijing}" oldValue="${recreatOld.huizhuanzhijing}"/>
						<label>轨矩:</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.guiju" value="${recreat.guiju}" oldValue="${recreatOld.guiju}"/><br/>
						<label>轨矩长度(m):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.guijuchangdu" value="${recreat.guijuchangdu}" oldValue="${recreatOld.guijuchangdu}"/>
						<label>水滑梯高度(m):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.shuihuatigaodu" value="${recreat.shuihuatigaodu}" oldValue="${recreatOld.shuihuatigaodu}"/><br/>
						<label>游乐池水深(m):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.youlechishuishen" value="${recreat.youlechishuishen}" oldValue="${recreatOld.youlechishuishen}"/>
						<label>设备级别:</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.shebeijibie" value="${recreat.shebeijibie}" oldValue="${recreatOld.shebeijibie}"/><br/>
						<label>设备使用方式:</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.shiyongfangshi" value="${recreat.shiyongfangshi}" oldValue="${recreatOld.shiyongfangshi}"/>
						<label>车辆数或列车数或座舱数(人):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.cheliangshu" value="${recreat.cheliangshu}" oldValue="${recreatOld.cheliangshu}"/><br/>
						<label>转速 (rpm):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.zhuansu" value="${recreat.zhuansu}" oldValue="${recreatOld.zhuansu}"/>
						<label>轨道高度(m):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.guidaogaodu" value="${recreat.guidaogaodu}" oldValue="${recreatOld.guidaogaodu}"/><br/>
						<label>高差 (m):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.gaocha" value="${recreat.gaocha}" oldValue="${recreatOld.gaocha}"/>
						<label>最大坡度 (°):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.zuidapodu" value="${recreat.zuidapodu}" oldValue="${recreatOld.zuidapodu}"/><br/>
						<label>设计最大加速度(G):</label>	
						<input class='ui-input' style="width: 176px;" name="recreat.shejijiasudu" value="${recreat.shejijiasudu}" oldValue="${recreatOld.shejijiasudu}"/>
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
	var id = $('#rid').val();
	var type = $('#status').val();
	
	if("${param.adr}" == "sjsh"){
		$("#mnubtn_jcsj_sb_yzc_edit_update").hide();
	}
		/**页面所需资源初始化*/
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
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${recreat.shebeizhongleidaima}"},
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
			$("#clxs").selectmenu();
			$("#cc_zdwxy").selectmenu();
			$("#cc_zdjk").selectmenu();
			$("#cc_jyya").selectmenu();
			$("#cc_rkmjq").selectmenu();
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
				url:"<%=path%>/se!updateByYLSS.do?tjstate="+tjstate+"&address=${address}&dbid=${dbid}",
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
		var id = $('#rid').val();
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