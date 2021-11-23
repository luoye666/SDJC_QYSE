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
	                	 <input type="hidden" name="elevatorPraram.id" value="${elevatorPraram.id}" id="eid"/>
	                	 <input type="hidden" name="elevatorPraram.zcstatus" value="${elevatorPraram.zcstatus}" d="status"/>
	                	 <input type="hidden" name="elevatorPraram.shebeizhongleidaima" value="${elevatorPraram.shebeizhongleidaima}"/>
	                	 <input type="hidden" name="elevatorPraram.shiyongdanweiId" value="${elevatorPraram.shiyongdanweiId}"/>
	                	 <input type="hidden" name="elevatorPraram.shigongdanweiId" value="${elevatorPraram.shigongdanweiId}"/>
	                	 <input type="hidden" name="elevatorPraram.state" value="${elevatorPraram.state}"/>
	                	 <input type="hidden" name="elevatorPraram.flag" value="${elevatorPraram.flag}"/>
	                	 <input type="hidden" name="elevatorPraram.eqhide" value="${elevatorPraram.eqhide}"/>
	                	 <input type="hidden" name="elevatorPraram.fj_filepath" value="${elevatorPraram.fj_filepath}"/>
	                	 <input type="hidden" name="elevatorPraram.biaozhuleixing" value="${elevatorPraram.biaozhuleixing}"/>
	                	 <input type="hidden" name="elevatorPraram.banjieriqi" value="${elevatorPraram.banjieriqi}"/>
		            	<input type="hidden" name="elevatorPraram.pid" value="${elevatorPraram.pid}" id="pid"/>
						<input type="hidden" value="${elevatorPraram.tmpData}" name="elevatorPraram.tmpData" />
	                	 <input type="hidden" name="elevatorPraram.jingdu" value="${elevatorPraram.jingdu}"/>
	                	 <input type="hidden" name="elevatorPraram.weidu" value="${elevatorPraram.weidu}"/>
		            	<input type="hidden" name="elevatorPraram.dj_jingbanriqi" value="${elevatorPraram.dj_jingbanriqi}"/>
		            	<input type="hidden" name="elevatorPraram.djb_id" value="${elevatorPraram.djb_id}"/>
		            	<input type="hidden" name="elevatorPraram.yjyy" value="${elevatorPraram.yjyy}"/>
                	</div>
					<fieldset>
					<legend>基本信息</legend>
					<div>
					    <label>设备名称:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shebeimingcheng" id="mingcheng${uuid}" value="${elevatorPraram.shebeimingcheng}" oldValue="${elevatorPraramOld.shebeimingcheng}"></select>
					    <label>设备种类:</label>
					    <input class="ui-input" readonly="true" name="elevatorPraram.shebeizhonglei" style="width: 179px;" id="yzc_shebeizhonglei${uuid}" value="电梯" oldValue="电梯"/><br/>
					    <label>设备类别:</label>
					    	<div id="yzc_shebeileibie_div" class="divSlt">
	        					<select name="elevatorPraram.shebeileibiedaima" sltValue="${elevatorPraram.shebeileibiedaima}" oldValue="${elevatorPraramOld.shebeileibiedaima}" style="width: 195px;" id="yzc_shebeileibie"></select>
					    	</div>
					    <label>设备品种:</label>
					    	<div id="yzc_shebeipinzhong_div" class="divSlt">
	        					<select name="elevatorPraram.shenbeipinzhongdaima" sltValue="${elevatorPraram.shenbeipinzhongdaima}" oldValue="${elevatorPraramOld.shenbeipinzhongdaima}" style="width: 195px;" id="yzc_shebeipinzhong"></select>
					    	</div>
					    	<br/>
					    <label>设备代码:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shebeidaima" value="${elevatorPraram.shebeidaima}" oldValue="${elevatorPraramOld.shebeidaima}"/>
					    <label>设备型号:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shebeixinghao" value="${elevatorPraram.shebeixinghao}" oldValue="${elevatorPraramOld.shebeixinghao}"/><br/>
						<label>制造日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.zhizaoriqi_date" value="<fmt:formatDate value='${elevatorPraram.zhizaoriqi_date}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.zhizaoriqi_date}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>制造日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.zhizaoriqi" id="zhizaoriqi${uuid}" value="${elevatorPraram.zhizaoriqi}" oldValue="${elevatorPraramOld.zhizaoriqi}"/><br/>
						<label>投用日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.touyongriqi_date" value="<fmt:formatDate value='${elevatorPraram.touyongriqi_date}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.touyongriqi_date}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>投用日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.touyongriqi" value="${elevatorPraram.touyongriqi}" oldValue="${elevatorPraramOld.touyongriqi}"/><br/>
					    <label>安装日期:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.anzhuangriqi" value="<fmt:formatDate value='${elevatorPraram.anzhuangriqi}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.anzhuangriqi}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label>出厂编号:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.chuchangbianhao" value="${elevatorPraram.chuchangbianhao}" oldValue="${elevatorPraramOld.chuchangbianhao}"/><br/>
						<label>设备注册代码:</label>
						<input class="ui-input" style="width: 179px;background-color:#E0E0E0" readonly="true" name="elevatorPraram.zhucedaima" value="${elevatorPraram.zhucedaima}" oldValue="${elevatorPraramOld.zhucedaima}" id="zcdm"/>
					    <label>设备注册日期:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.zhuceriqi" value="<fmt:formatDate value='${elevatorPraram.zhuceriqi}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.zhuceriqi}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>使用登记证编号:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.dengjizhengbianhao" value="${elevatorPraram.dengjizhengbianhao}" oldValue="${elevatorPraramOld.dengjizhengbianhao}" readonly="true"/>
					    <label>发证日期:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.fazhengriqi" value="<fmt:formatDate value='${elevatorPraram.fazhengriqi}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.fazhengriqi}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>告知编号:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.gaozhibianhao" value="${elevatorPraram.gaozhibianhao}" oldValue="${elevatorPraramOld.gaozhibianhao}"/>
					    <label>告知日期:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.gaozhiriqi" value="<fmt:formatDate value='${elevatorPraram.gaozhiriqi}' pattern = 'yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.gaozhiriqi}' pattern = 'yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>内部编号:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.neibubianhao" value="${elevatorPraram.neibubianhao}" oldValue="${elevatorPraramOld.neibubianhao}"/>
					    <label>设备地点:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shebeididian" value="${elevatorPraram.shebeididian}" oldValue="${elevatorPraramOld.shebeididian}"/><br/>
						<label>市:</label>
							<div id="shi_div" class="divSlt" onclick="delay()">
	        					<select name="elevatorPraram.shidaima" sltValue="${elevatorPraram.shidaima}" oldValue="${elevatorPraramOld.shidaima}" style="width: 195px;" id="shi"></select>
							</div>
						<label>区划名称:</label>
							<div id="quxian_div" class="divSlt" onclick="delay()">
	        					<select name="elevatorPraram.quhuadaima" sltValue="${elevatorPraram.quhuadaima}" oldValue="${elevatorPraramOld.quhuadaima}" style="width: 195px;" id="quxian"></select>
							</div>
						<br/>
						<label>乡镇:</label>
							<div id="xiangzhen_div" class="divSlt">
	        					<select name="elevatorPraram.xiangzhendaima" sltValue="${elevatorPraram.xiangzhendaima}" oldValue="${elevatorPraramOld.xiangzhendaima}" style="width: 195px;" id="xiangzhen"></select>
							</div>
					    <label>是否市直:</label>
						<s:select name="elevatorPraram.szstatus" list="#{'0':'否','1':'是'}" value="elevatorPraram.szstatus" sltValue="${elevatorPraram.szstatus}" oldValue="${elevatorPraramOld.szstatus}" style="width: 179px;" id="shizhi"></s:select><br>
						<label>设备使用年限:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shebeishiyongnianxian" value="${elevatorPraram.shebeishiyongnianxian}" oldValue="${elevatorPraramOld.shebeishiyongnianxian}"/>
						<label>固定资产值:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.gudingzichanzhi" value="${elevatorPraram.gudingzichanzhi}" oldValue="${elevatorPraramOld.gudingzichanzhi}"/><br/>
						<label>使用单位联系电话:</label>
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.shiyongdanwei_lianxidianhua" value="${elevatorPraram.shiyongdanwei_lianxidianhua}" oldValue="${elevatorPraramOld.shiyongdanwei_lianxidianhua}"/>
						<label>使用单位联系人:</label>
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.shiyongdanwei_lianxiren" value="${elevatorPraram.shiyongdanwei_lianxiren}" oldValue="${elevatorPraramOld.shiyongdanwei_lianxiren}"/><br/>
						<label>注册登记机构:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.zhucedengjijigou" value="${elevatorPraram.zhucedengjijigou}" oldValue="${elevatorPraramOld.zhucedengjijigou}"/>
						<label>注册登记日期:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.zhuceriqi" value="<fmt:formatDate value='${elevatorPraram.zhuceriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.zhuceriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>注册登记人员:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.zhucedengjirenyuan" value="${elevatorPraram.zhucedengjirenyuan}" oldValue="${elevatorPraramOld.zhucedengjirenyuan}"/>
						<label>更新日期:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.biangengriqi" value="<fmt:formatDate value='${elevatorPraram.biangengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.biangengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>填表人员:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.tianbiaorenyuan" value="${elevatorPraram.tianbiaorenyuan}" oldValue="${elevatorPraramOld.tianbiaorenyuan}"/>
						<label>填表日期:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.tianbiaoriqi" value="<fmt:formatDate value='${elevatorPraram.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>安全管理部门:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.anquanguanlibumen" value="${elevatorPraram.anquanguanlibumen}" oldValue="${elevatorPraramOld.anquanguanlibumen}"/>
					 	<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.anquanguanli_lianxidianhua" value="${elevatorPraram.anquanguanli_lianxidianhua}" oldValue="${elevatorPraramOld.anquanguanli_lianxidianhua}"/>
					    <br/>
					    <label>安全管理人员:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.anquanguanlirenyuan" value="${elevatorPraram.anquanguanlirenyuan}" oldValue="${elevatorPraramOld.anquanguanlirenyuan}"/>
						<label>是否在人口密集区:</label>
						<select name="elevatorPraram.shifou_renkoumijiqu" oldValue="${elevatorPraramOld.shifou_renkoumijiqu}" id="sf_rkmj" style="width: 179px;">
							<option></option>
							<option value="否" ${elevatorPraram.shifou_renkoumijiqu == "否"} ? "selected":"">否</option>
							<option value="是" ${elevatorPraram.shifou_renkoumijiqu == "否"} ? "selected":"">是</option>
						</select><br/>
						<label>是否重大危险源:</label>	
						<select name="elevatorPraram.shifou_zhongdaweixianyuan" oldValue="${elevatorPraramOld.shifou_zhongdaweixianyuan}" id="sf_zdwxy" style="width: 195px;">
							<option></option>
							<option value="否" ${elevatorPraram.shifou_zhongdaweixianyuan == "否"} ? "selected":"">否</option>
							<option value="是" ${elevatorPraram.shifou_zhongdaweixianyuan == "否"} ? "selected":"">是</option>
						</select>
						<label>是否重点监控特种设备:</label>	
						<select name="elevatorPraram.shifou_zhongdianjiankong" oldValue="${elevatorPraramOld.shifou_zhongdianjiankong}" id="sf_zdjk" style="width: 179px;">
							<option></option>
							<option value="否" ${elevatorPraram.shifou_zhongdianjiankong == "否"} ? "selected":"">否</option>
							<option value="是" ${elevatorPraram.shifou_zhongdianjiankong == "否"} ? "selected":"">是</option>
						</select><br/>
						<label>是否制定事故应急措施和救援预案:</label>
						<select name="elevatorPraram.shifou_yingjifangan" oldValue="${elevatorPraramOld.shifou_yingjifangan}" id="sf_yjfa" style="width: 195px;">
							<option></option>
							<option value="否" ${elevatorPraram.shifou_yingjifangan == "否"} ? "selected":"">否</option>
							<option value="是" ${elevatorPraram.shifou_yingjifangan == "否"} ? "selected":"">是</option>
						</select>
						<label>备注:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.beizhu" value="${elevatorPraram.beizhu}" oldValue="${elevatorPraramOld.beizhu}"/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>检验信息</legend>
					<div>
						<div id="jyxx_div">
						<label class="width100">检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.jianyanjigou" value="${elevatorPraram.jianyanjigou}" oldValue="${elevatorPraramOld.jianyanjigou}"/>
						<label class="width100">检验机构代码:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.jianyanjigou_code" value="${elevatorPraram.jianyanjigou_code}" oldValue="${elevatorPraramOld.jianyanjigou_code}"/><br/>
					    <label class="width100">报检日期:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shebeibaojianriqi" value="<fmt:formatDate value='${elevatorPraram.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.jianyanjieshuriqi" value="<fmt:formatDate value='${elevatorPraram.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()" required="required"/>
						<br/>
					    <label class="width100">下次检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.xiacijianyanriqi" value="<fmt:formatDate value='${elevatorPraram.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()" required="required"/>
					    <label class="width100">检验结论:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.jianyanjielun" value="${elevatorPraram.jianyanjielun}" oldValue="${elevatorPraramOld.jianyanjielun}"/>
						<br/>
					    <label class="width100">检验类别:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.jianyanleixing" value="${elevatorPraram.jianyanleixing}" oldValue="${elevatorPraramOld.jianyanleixing}"/>
					    <label class="width100">主要问题:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.zhuyaowenti" value="${elevatorPraram.zhuyaowenti}" oldValue="${elevatorPraramOld.zhuyaowenti}"/>
						<br/>
						</div>
						<label class="width100">事故类别:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shiguleibie" value="${elevatorPraram.shiguleibie}" oldValue="${elevatorPraramOld.shiguleibie}"/>
					    <label class="width100">事故发生日期:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shigufashengriqi" value="<fmt:formatDate value='${elevatorPraram.shigufashengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.shigufashengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
						<label class="width100">事故处理结果:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shiguchulijieguo" value="${elevatorPraram.shiguchulijieguo}" oldValue="${elevatorPraramOld.shiguchulijieguo}"/>
					    <label class="width100">设备变动方式:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shebeibiandongfangshi" value="${elevatorPraram.shebeibiandongfangshi}" oldValue="${elevatorPraramOld.shebeibiandongfangshi}"/>
						<br/>
						<label class="width100">设备变动项目:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shebeibiandongxiangmu" value="${elevatorPraram.shebeibiandongxiangmu}" oldValue="${elevatorPraramOld.shebeibiandongxiangmu}"/>
					    <label class="width100">设备变动日期:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shebeibiandongriqi" value="<fmt:formatDate value='${elevatorPraram.shebeibiandongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.shebeibiandongriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
						<label class="width100">设备承担单位:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.chengdandanwei" value="${elevatorPraram.chengdandanwei}" oldValue="${elevatorPraramOld.chengdandanwei}"/>
					    <label class="width100">承担单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.chengdandanwei_code" value="${elevatorPraram.chengdandanwei_code}" oldValue="${elevatorPraramOld.chengdandanwei_code}"/>
						<br/>
					 	<label class="width100">报告编号:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.baogaobianhao" value="${elevatorPraram.baogaobianhao}" oldValue="${elevatorPraramOld.baogaobianhao}"/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>单位信息</legend>
					<div>
						<label></label>
						<span style="color:red;">【为保证使用单位的一致性，使用单位信息只能在设备列表上修改】</span><br/>
						<label>使用单位:</label>
						<input class="ui-input"   style="width: 420px;" name="elevatorPraram.shiyongdanwei" value="${elevatorPraram.shiyongdanwei}" oldValue="${elevatorPraramOld.shiyongdanwei}" required="required" onfocus="this.blur()"/><br/>
						<label>单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="elevatorPraram.shiyongdanwei_dizhi" value="${elevatorPraram.shiyongdanwei_dizhi}" oldValue="${elevatorPraramOld.shiyongdanwei_dizhi}"/><br/>
						<label>组织机构代码:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shiyongdanwei_code" value="${elevatorPraram.shiyongdanwei_code}" oldValue="${elevatorPraramOld.shiyongdanwei_code}" />
						<label>法定代表人:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.fadingdaibiaoren" value="${elevatorPraram.fadingdaibiaoren}" oldValue="${elevatorPraramOld.fadingdaibiaoren}" /><br/>
						<label>邮政编码:</label>
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.shiyongdanwei_youbian" value="${elevatorPraram.shiyongdanwei_youbian}" oldValue="${elevatorPraramOld.shiyongdanwei_youbian}"/>
						<label>操作人员:</label>
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.shiyongdanwei_caozuorenyuan" value="${elevatorPraram.shiyongdanwei_caozuorenyuan}" oldValue="${elevatorPraramOld.shiyongdanwei_caozuorenyuan}"/><br/>
						<label>主管负责人:</label>
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.zhuguanfuzeren" value="${elevatorPraram.zhuguanfuzeren}" oldValue="${elevatorPraramOld.zhuguanfuzeren}"/>
						<label>主管负责人电话:</label>
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.zhuguanfuzerendianhua" value="${elevatorPraram.zhuguanfuzerendianhua}" oldValue="${elevatorPraramOld.zhuguanfuzerendianhua}"/><br/>
						<label>经办人:</label>
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.jingbanren" value="${elevatorPraram.jingbanren}" oldValue="${elevatorPraramOld.jingbanren}"/>
						<label>经办人电话:</label>
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.jingbanrendianhua" value="${elevatorPraram.jingbanrendianhua}" oldValue="${elevatorPraramOld.jingbanrendianhua}"/><br/>
						<label>所属行业:</label>
						<div id="sydw_sshy_div" class="divSlt">
							<select style="width: 195px;" sltValue="${elevatorPraram.shiyongdanwei_suoshuhangye}" name="elevatorPraram.shiyongdanwei_suoshuhangye" oldValue="${elevatorPraramOld.shiyongdanwei_suoshuhangye}" id="sydw_sshy"></select>
						</div>
						<hr/>
						
						<label>施工单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="elevatorPraram.shigongdanwei" value="${elevatorPraram.shigongdanwei}" oldValue="${elevatorPraramOld.shigongdanwei}"/><br/>
						<label>组织机构代码:</label>	
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.shigongdanwei_daima" value="${elevatorPraram.shigongdanwei_daima}" oldValue="${elevatorPraramOld.shigongdanwei_daima}"/>
						<label>法人代表:</label>	
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.shigongdanwei_faren" value="${elevatorPraram.shigongdanwei_faren}" oldValue="${elevatorPraramOld.shigongdanwei_faren}"/><br/>
						<label>施工日期:</label>						
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.shigongdanwei_shigongriqi" value="<fmt:formatDate value='${elevatorPraram.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>验收单位:</label>	
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.yanshoudanwei" value="${elevatorPraram.yanshoudanwei}" oldValue="${elevatorPraramOld.yanshoudanwei}"/><br/>
						<label>验收日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.yanshouriqi" value="<fmt:formatDate value='${elevatorPraram.yanshouriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${elevatorPraramOld.yanshouriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>检验机构:</label>	
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.yanshoujigou" value="${elevatorPraram.yanshoujigou}" oldValue="${elevatorPraramOld.yanshoujigou}"/><br/>
						<label>验收报告编号:</label>	
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.yanshoubaogaobianhao" value="${elevatorPraram.yanshoubaogaobianhao}" oldValue="${elevatorPraramOld.yanshoubaogaobianhao}"/><br/><hr/>
						
						<label>维保单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="elevatorPraram.weihubaoyangdanwei" value="${elevatorPraram.weihubaoyangdanwei}" oldValue="${elevatorPraramOld.weihubaoyangdanwei}"/><br/>
						<label>资格证书号:</label>						
						<input class="ui-input"   style="width: 179px" name="elevatorPraram.whbydw_zizhizhengshu" value="${elevatorPraram.whbydw_zizhizhengshu}" oldValue="${elevatorPraramOld.whbydw_zizhizhengshu}"/>
						<label>联系人:</label>						
						<input class="ui-input"   style="width: 179px" name="elevatorPraram.weihubaoyangdanwei_lianxiren" value="${elevatorPraram.weihubaoyangdanwei_lianxiren}" oldValue="${elevatorPraramOld.weihubaoyangdanwei_lianxiren}"/><br/>
						<label>联系电话:</label>						
						<input class="ui-input"   style="width: 179px" name="elevatorPraram.weihubaoyangdanwei_dianhua" value="${elevatorPraram.weihubaoyangdanwei_dianhua}" oldValue="${elevatorPraramOld.weihubaoyangdanwei_dianhua}"/>
						<label>单位代码:</label>						
						<input class="ui-input"   style="width: 179px" name="elevatorPraram.weihubaoyangdanwei_code" value="${elevatorPraram.weihubaoyangdanwei_code}" oldValue="${elevatorPraramOld.weihubaoyangdanwei_code}"/><br/>
						<label>维保周期( 周):</label>						
						<input class="ui-input"   style="width: 179px" name="elevatorPraram.weibaozhouqi" value="${elevatorPraram.weibaozhouqi}" oldValue="${elevatorPraramOld.weibaozhouqi}"/>
						<label>大修周期(月):</label>						
						<input class="ui-input"   style="width: 179px" name="elevatorPraram.daxiuzhouqi" value="${elevatorPraram.daxiuzhouqi}" oldValue="${elevatorPraramOld.daxiuzhouqi}"/><br/>
						<label>所在车间分厂:</label>						
						<input class="ui-input"   style="width: 420px;" name="elevatorPraram.suoshuchejian" value="${elevatorPraram.suoshuchejian}" oldValue="${elevatorPraramOld.suoshuchejian}"/><br/>
						<hr/>
						
						<label>制造单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="elevatorPraram.zhizaodanwei" value="${elevatorPraram.zhizaodanwei}" oldValue="${elevatorPraramOld.zhizaodanwei}"/><br/>
						<label>制造许可证编号:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.zhizaodanweixukezhengbianhao" value="${elevatorPraram.zhizaodanweixukezhengbianhao}" oldValue="${elevatorPraramOld.zhizaodanweixukezhengbianhao}"/>
						<label>资格证书名称:</label>						
						<input class="ui-input"   style="width: 179px" name="elevatorPraram.zhizaodanwei_zigezhengshu" value="${elevatorPraram.zhizaodanwei_zigezhengshu}" oldValue="${elevatorPraramOld.zhizaodanwei_zigezhengshu}"/><br/>
						<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.zhizaodanwei_lianxidianhua" value="${elevatorPraram.zhizaodanwei_lianxidianhua}" oldValue="${elevatorPraramOld.zhizaodanwei_lianxidianhua}"/>
						<label>使用场合:</label>						
						<input class="ui-input"   style="width: 179px" name="elevatorPraram.zhizaodanwei_shiyongchanghe" value="${elevatorPraram.zhizaodanwei_shiyongchanghe}" oldValue="${elevatorPraramOld.zhizaodanwei_shiyongchanghe}"/>
						<br/>
						<label>制造单位统一社会信用代码:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.zhizaodanwei_code" value="${elevatorPraram.zhizaodanwei_code}" oldValue="${elevatorPraramOld.zhizaodanwei_code}"/>
						<label>产品品牌:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.chanpinpinpai" value="${elevatorPraram.chanpinpinpai}" oldValue="${elevatorPraramOld.chanpinpinpai}"/>
						<br/>
						<hr/>
						<label>产权单位:</label>
						<input class="ui-input"   style="width: 420px;" name="elevatorPraram.chanquandanwei" value="${elevatorPraram.chanquandanwei}" oldValue="${elevatorPraramOld.chanquandanwei}"/><br/>
						<label>产权单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="elevatorPraram.chanquandanwei_dizhi" value="${elevatorPraram.chanquandanwei_dizhi}" oldValue="${elevatorPraramOld.chanquandanwei_dizhi}"/><br/>
						<label>产权单位代码:</label>
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.chanquandanwei_daima" value="${elevatorPraram.chanquandanwei_daima}" oldValue="${elevatorPraramOld.chanquandanwei_daima}"/>
						<label>邮政编码:</label>						
						<input class="ui-input"   style="width: 179px" name="elevatorPraram.chanquandanwei_youbian" value="${elevatorPraram.chanquandanwei_youbian}" oldValue="${elevatorPraramOld.chanquandanwei_youbian}"/><br/>
						<label>法人代表:</label>
						<input class="ui-input"   style="width: 179px;" name="elevatorPraram.chanquandanwei_farendaibiao" value="${elevatorPraram.chanquandanwei_farendaibiao}" oldValue="${elevatorPraramOld.chanquandanwei_farendaibiao}"/>
						<label>联系电话:</label>						
						<input class="ui-input"   style="width: 179px" name="elevatorPraram.chanquandanwei_dianhua" value="${elevatorPraram.chanquandanwei_dianhua}" oldValue="${elevatorPraramOld.chanquandanwei_dianhua}"/><br/>
						
						<br/>
						<hr/>
					 	<label>设计单位:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shejidanwei" value="${elevatorPraram.shejidanwei}" oldValue="${elevatorPraramOld.shejidanwei}"/>
					 	<label>设计单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.shejidanweidaima" value="${elevatorPraram.shejidanweidaima}" oldValue="${elevatorPraramOld.shejidanweidaima}"/>
					    <br/>
					 	<hr/>
					 	<label>安装单位:</label>
						<input class="ui-input" style="width: 420px;" name="elevatorPraram.anzhuangdanwei" value="${elevatorPraram.anzhuangdanwei}" oldValue="${elevatorPraramOld.anzhuangdanwei}"/><br/>
					 	<label>安装单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.anzhuangdanwei_daima" value="${elevatorPraram.anzhuangdanwei_daima}" oldValue="${elevatorPraramOld.anzhuangdanwei_daima}"/>
					    <label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.anzhuangdanwei_lianxidianhua" value="${elevatorPraram.anzhuangdanwei_lianxidianhua}" oldValue="${elevatorPraramOld.anzhuangdanwei_lianxidianhua}"/><br/>
						<label>项目负责人:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.anzhuangdanwei_lianxiren" value="${elevatorPraram.anzhuangdanwei_lianxiren}" oldValue="${elevatorPraramOld.anzhuangdanwei_lianxiren}"/>
					    <label>资格证书编号:</label>
						<input class="ui-input" style="width: 179px;" name="elevatorPraram.anzhuangdanwei_zigezhengshu" value="${elevatorPraram.anzhuangdanwei_zigezhengshu}" oldValue="${elevatorPraramOld.anzhuangdanwei_zigezhengshu}"/><br/>
					 	<hr/>
					</div>
					</fieldset>
					<fieldset>
					<legend>设备参数</legend>
						<label>层:</label>	
						<input class='ui-input' style="width: 179px;" name="elevatorPraram.ceng" value="${elevatorPraram.ceng}" oldValue="${elevatorPraramOld.ceng}"/>
						<label>站:</label>	
						<input class='ui-input' style="width: 179px;" name="elevatorPraram.zhan" value="${elevatorPraram.zhan}" oldValue="${elevatorPraramOld.zhan}"/><br/>
						<label>门:</label>	
						<input class='ui-input' style="width: 179px;" name="elevatorPraram.men" value="${elevatorPraram.men}" oldValue="${elevatorPraramOld.men}"/>
						<label>名义速度(m/s):</label>	
						<input class='ui-input' style="width: 179px;" name="elevatorPraram.mingyisudu" value="${elevatorPraram.mingyisudu}" oldValue="${elevatorPraramOld.mingyisudu}"/></br>
						<label>名义宽度(mm):</label>	
						<input class='ui-input' style="width: 179px;" name="elevatorPraram.mingyikuandu" value="${elevatorPraram.mingyikuandu}" oldValue="${elevatorPraramOld.mingyikuandu}"/>
						<label>倾斜角(度):</label>
						<input class='ui-input' style="width: 179px;" name="elevatorPraram.qingxiejiao" value="${elevatorPraram.qingxiejiao}" oldValue="${elevatorPraramOld.qingxiejiao}"/><br/>
						<label>输送能力(P/h):</label>	
						<input class='ui-input' style="width: 179px;" name="elevatorPraram.shusongnengli" value="${elevatorPraram.shusongnengli}" oldValue="${elevatorPraramOld.shusongnengli}"/>
						<label>提升高度(m):</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.tishenggaodu" value="${elevatorPraram.tishenggaodu}" oldValue="${elevatorPraramOld.tishenggaodu}"/><br/>
						<label>区段长度(m):</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.quduanchangdu" value="${elevatorPraram.quduanchangdu}" oldValue="${elevatorPraramOld.quduanchangdu}"/>
						<label>额定载重量(kg):</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.edingzaizhongliang" value="${elevatorPraram.edingzaizhongliang}" oldValue="${elevatorPraramOld.edingzaizhongliang}"/><br/>
						<label>额定速度(m/s):</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.edingsudu" value="${elevatorPraram.edingsudu}" oldValue="${elevatorPraramOld.edingsudu}"/>
						<label>额定速度(最大):</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.edingsudu_shangxing" value="${elevatorPraram.edingsudu_shangxing}" oldValue="${elevatorPraramOld.edingsudu_shangxing}"/><br/>
						<label>额定速度(最小):</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.edingsudu_xiaxing" value="${elevatorPraram.edingsudu_xiaxing}" oldValue="${elevatorPraramOld.edingsudu_xiaxing}"/>
						<label>控制方式:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.kongzhifangshi" value="${elevatorPraram.kongzhifangshi}" oldValue="${elevatorPraramOld.kongzhifangshi}"/><br/>
						<label>油罐数量:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.youguanshuliang" value="${elevatorPraram.youguanshuliang}" oldValue="${elevatorPraramOld.youguanshuliang}"/>
						<label>顶升形式:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.dingshengxingshi" value="${elevatorPraram.dingshengxingshi}" oldValue="${elevatorPraramOld.dingshengxingshi}"/><br/>
						<label>运行速度(m/s):</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.yunxingsudu" value="${elevatorPraram.yunxingsudu}" oldValue="${elevatorPraramOld.yunxingsudu}"/>
						<label>走行距离(m):</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.zouxingjuli" value="${elevatorPraram.zouxingjuli}" oldValue="${elevatorPraramOld.zouxingjuli}"/><br/>
						<label>电梯层站:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.dianticengzhan" value="${elevatorPraram.dianticengzhan}" oldValue="${elevatorPraramOld.dianticengzhan}"/>
						<label>轿厢尺寸(mm):</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.jiaoxiangchicui" value="${elevatorPraram.jiaoxiangchicui}" oldValue="${elevatorPraramOld.jiaoxiangchicui}"/><br/>
						<label>防爆型式:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.fangbaoxingshi" value="${elevatorPraram.fangbaoxingshi}" oldValue="${elevatorPraramOld.fangbaoxingshi}"/>
						<label>防爆等级:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.fangbaodengji" value="${elevatorPraram.fangbaodengji}" oldValue="${elevatorPraramOld.fangbaodengji}"/><br/>
						<label>额定功率 (kW):</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.edinggonglv" value="${elevatorPraram.edinggonglv}" oldValue="${elevatorPraramOld.edinggonglv}"/>
						<label>额定转速(r/min):</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.edingzhuansu" value="${elevatorPraram.edingzhuansu}" oldValue="${elevatorPraramOld.edingzhuansu}"/><br/>
						<label>减速比:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.jiansubi" value="${elevatorPraram.jiansubi}" oldValue="${elevatorPraramOld.jiansubi}"/>
						<label>满载工作压力(MPa):</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.gongzuoyali" value="${elevatorPraram.gongzuoyali}" oldValue="${elevatorPraramOld.gongzuoyali}"/><br/>
						<label>悬挂介质种类:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.jiezhizhonglei" value="${elevatorPraram.jiezhizhonglei}" oldValue="${elevatorPraramOld.jiezhizhonglei}"/>
						<label>悬挂介质数量:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.jiezhishuliang" value="${elevatorPraram.jiezhishuliang}" oldValue="${elevatorPraramOld.jiezhishuliang}"/><br/>
						<label>悬挂介质型号:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.jiezhixinghao" value="${elevatorPraram.jiezhixinghao}" oldValue="${elevatorPraramOld.jiezhixinghao}"/>
						<label>悬挂介质规格:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.jiezhiguige" value="${elevatorPraram.jiezhiguige}" oldValue="${elevatorPraramOld.jiezhiguige}"/><br/>
						<label>工作环境:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.gongzuohuanjing" value="${elevatorPraram.gongzuohuanjing}" oldValue="${elevatorPraramOld.gongzuohuanjing}"/>
						<label>工作类型:</label>	
						<input class='ui-input'  style="width: 179px;" name="elevatorPraram.gongzuoleixing" value="${elevatorPraram.gongzuoleixing}" oldValue="${elevatorPraramOld.gongzuoleixing}"/><br/>
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
	var id = $('#eid').val();
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
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${elevatorPraram.shebeizhongleidaima}"},
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
			$("#sf_rkmj").selectmenu();
			$("#sf_yjfa").selectmenu();
			$("#sf_zdwxy").selectmenu();
			$("#sf_zdjk").selectmenu();
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
				url:"<%=path%>/se!updateByDT.do?tjstate="+tjstate+"&address=${address}&dbid=${dbid}",
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
		var id = $('#eid').val();
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