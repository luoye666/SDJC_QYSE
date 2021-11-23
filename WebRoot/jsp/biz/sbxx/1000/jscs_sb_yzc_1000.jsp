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
width:80%;
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
.param label{
	width: 200px;
}
</style> 
</head>
<body>
	<div class="wrapper">
	  <div class="mod-search cf" id="menu_tools">
		<a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_sb_yzc_edit_update">变更申请提交</a>  <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_sb_yzc_fsgd">附属管道</a>
	  </div>
	    	<div>
		    	<form id="frm_jcsj_sb_yzc_edit" method="post">
		    		<div class="formHiddenRegion">
	                	 <input type="hidden" name="boilerParam.id" value="${boilerParam.id}" id="bid"/>
	                	 <input type="hidden" name="boilerParam.zcstatus" value="${boilerParam.zcstatus}" id="status"/>
	                	 <input type="hidden" name="boilerParam.shebeizhongleidaima" value="${boilerParam.shebeizhongleidaima}"/>
	                	 <input type="hidden" name="boilerParam.shiyongdanweiId" value="${boilerParam.shiyongdanweiId}"/>
	                	 <input type="hidden" name="boilerParam.shigongdanweiId" value="${boilerParam.shigongdanweiId}"/>
	                	 <input type="hidden" name="boilerParam.state" value="${boilerParam.state}"/>
	                	 <input type="hidden" name="boilerParam.flag" value="${boilerParam.flag}"/>
	                	 <input type="hidden" name="boilerParam.eqhide" value="${boilerParam.eqhide}"/>
	                	 <input type="hidden" name="boilerParam.fj_filepath" value="${boilerParam.fj_filepath}"/>
	                	 <input type="hidden" name="boilerParam.biaozhuleixing" value="${boilerParam.biaozhuleixing}"/>
	                	 <input type="hidden" name="boilerParam.banjieriqi" value="${boilerParam.banjieriqi}"/>
		            	<input type="hidden" name="boilerParam.pid" value="${boilerParam.pid}" id="pid"/>
						<input type="hidden" value="${boilerParam.tmpData}" name="boilerParam.tmpData" />
		            	<input type="hidden" name="boilerParam.jingdu" value="${boilerParam.jingdu}"/>
		            	<input type="hidden" name="boilerParam.weidu" value="${boilerParam.weidu}"/>
		            	<input type="hidden" name="boilerParam.dj_jingbanriqi" value="${boilerParam.dj_jingbanriqi}"/>
		            	<input type="hidden" name="boilerParam.djb_id" value="${boilerParam.djb_id}"/>
		            	<input type="hidden" name="boilerParam.yjyy" value="${boilerParam.yjyy}"/>
                	</div>
					<fieldset>
					<legend>基本信息</legend>
					<div>
					    <label>设备名称:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.shebeimingcheng" value="${boilerParam.shebeimingcheng }" oldValue="${boilerParamOld.shebeimingcheng}" id="mingcheng"></select>
					    <label>设备种类:</label>
					    <input class="ui-input" readonly="true" name="boilerParam.shebeizhonglei" style="width: 179px;" id="yzc_shebeizhonglei" value="锅炉" oldValue="锅炉"/><br/>
					    <label>设备类别:</label>
					    	<div id="yzc_shebeileibie_div" class="divSlt">
	        					<select name="boilerParam.shebeileibiedaima" sltValue="${boilerParam.shebeileibiedaima}" oldValue="${boilerParamOld.shebeileibiedaima}" style="width: 195px;" id="yzc_shebeileibie"></select>
					    	</div>
					    <label>设备品种:</label>
					    	<div id="yzc_shebeipinzhong_div" class="divSlt">
	        					<select name="boilerParam.shenbeipinzhongdaima" sltValue="${boilerParam.shenbeipinzhongdaima}" oldValue="${boilerParamOld.shenbeipinzhongdaima}" style="width: 195px;" id="yzc_shebeipinzhong"></select>
					    	</div>
					    	<br/>
					    <label>设备代码:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.shebeidaima" value="${boilerParam.shebeidaima}" oldValue="${boilerParamOld.shebeidaima}"/>
					    <label>设备型号:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.shebeixinghao" value="${boilerParam.shebeixinghao}" oldValue="${boilerParamOld.shebeixinghao}"/><br/>
						<label>制造日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.zhizaoriqi_date" value="<fmt:formatDate value='${boilerParam.zhizaoriqi_date}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParam.zhizaoriqi_date}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label>制造日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.zhizaoriqi" value="${boilerParam.zhizaoriqi}" oldValue="${boilerParamOld.zhizaoriqi}"/><br/>
						<label>投用日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.touyongriqi_date" value="<fmt:formatDate value='${boilerParam.touyongriqi_date}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParam.touyongriqi_date}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label>投用日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.touyongriqi" value="${boilerParam.touyongriqi}" oldValue="${boilerParamOld.touyongriqi}"/><br/>
					    <label>安装日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.anzhuangriqi" value="<fmt:formatDate value='${boilerParam.anzhuangriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.anzhuangriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label>出厂编号:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.chuchangbianhao" value="${boilerParam.chuchangbianhao}" oldValue="${boilerParamOld.chuchangbianhao}"/><br/>
						<label>设备注册代码:</label>
						<input class="ui-input" style="width: 179px;background-color:#E0E0E0" name="boilerParam.zhucedaima" value="${boilerParam.zhucedaima}" oldValue="${boilerParamOld.zhucedaima}" readonly="true" id="zcdm"/>
					    <label>设备注册日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.zhuceriqi" value="<fmt:formatDate value='${boilerParam.zhuceriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.zhuceriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>使用登记证编号:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.dengjizhengbianhao" value="${boilerParam.dengjizhengbianhao}" oldValue="${boilerParamOld.dengjizhengbianhao}" readonly="true"/>
					    <label>发证日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.fazhengriqi" value="<fmt:formatDate value='${boilerParam.fazhengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.fazhengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>告知编号:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.gaozhibianhao" value="${boilerParam.gaozhibianhao}" oldValue="${boilerParamOld.gaozhibianhao}"/>
					    <label>告知日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.gaozhiriqi" value="<fmt:formatDate value='${boilerParam.gaozhiriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.gaozhiriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>内部编号:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.neibubianhao" value="${boilerParam.neibubianhao}" oldValue="${boilerParamOld.neibubianhao}"/>
					    <label>设备地点:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.shebeididian" value="${boilerParam.shebeididian}" oldValue="${boilerParamOld.shebeididian}"/><br/>
						<label>市:</label>
							<div id="shi_div" class="divSlt" onclick="delay()">
	        					<select name="boilerParam.shidaima" sltValue="${boilerParam.shidaima}" oldValue="${boilerParamOld.shidaima}" style="width: 195px;" id="shi"></select>
							</div>
						<label>区划名称:</label>
							<div id="quxian_div" class="divSlt" onclick="delay()">
	        					<select name="boilerParam.quhuadaima" sltValue="${boilerParam.quhuadaima}" oldValue="${boilerParamOld.quhuadaima}" style="width: 195px;" id="quxian"></select>
							</div>
						<br/>
						<label>乡镇:</label>
							<div id="xiangzhen_div" class="divSlt">
	        					<select name="boilerParam.xiangzhendaima" sltValue="${boilerParam.xiangzhendaima}" oldValue="${boilerParamOld.xiangzhendaima}" style="width: 195px;" id="xiangzhen"></select>
							</div>
					    <label>是否市直:</label>
						<select id="shizhi" name="boilerParam.szstatus" sltValue="${boilerParam.szstatus}" oldValue="${boilerParamOld.szstatus}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="1" ${boilerParam.szstatus == "1" ? "selected":""}>是</option>
					    	<option value="0" ${boilerParam.szstatus == "0" ? "selected":""}>否</option>
					    </select>
					    <br>
					 	<label>设备使用年限:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.shebeishiyongnianxian" value="${boilerParam.shebeishiyongnianxian}" oldValue="${boilerParamOld.shebeishiyongnianxian}"/>
						<label>固定资产值:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.gudingzichanzhi" value="${boilerParam.gudingzichanzhi}" oldValue="${boilerParamOld.gudingzichanzhi}"/><br/>
						<label>使用单位联系人:</label>
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shiyongdanwei_lianxiren" value="${boilerParam.shiyongdanwei_lianxiren}" oldValue="${boilerParamOld.shiyongdanwei_lianxiren}"/>
						<label>使用单位联系电话:</label>
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shiyongdanwei_lianxidianhua" value="${boilerParam.shiyongdanwei_lianxidianhua}" oldValue="${boilerParamOld.shiyongdanwei_lianxidianhua}"/><br/>
						<label>注册登记机构:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.zhucedengjijigou" value="${boilerParam.zhucedengjijigou}" oldValue="${boilerParamOld.zhucedengjijigou}"/>
						<label>注册登记日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.zhuceriqi" value="<fmt:formatDate value='${boilerParam.zhuceriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.zhuceriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>注册登记人员:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.zhucedengjirenyuan" value="${boilerParam.zhucedengjirenyuan}" oldValue="${boilerParamOld.zhucedengjirenyuan}"/>
						<label>更新日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.biangengriqi" value="<fmt:formatDate value='${boilerParam.biangengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.biangengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>填表人员:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.tianbiaorenyuan" value="${boilerParam.tianbiaorenyuan}" oldValue="${boilerParamOld.tianbiaorenyuan}"/>
						<label>填表日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.tianbiaoriqi" value="<fmt:formatDate value='${boilerParam.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>安全管理部门:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.anquanguanlibumen" value="${boilerParam.anquanguanlibumen}" oldValue="${boilerParamOld.anquanguanlibumen}"/>
					 	<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.anquanguanli_lianxidianhua" value="${boilerParam.anquanguanli_lianxidianhua}" oldValue="${boilerParamOld.anquanguanli_lianxidianhua}"/>
					    <br/>
					    <label>安全管理人员:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.anquanguanlirenyuan" value="${boilerParam.anquanguanlirenyuan}" oldValue="${boilerParamOld.anquanguanlirenyuan}"/>
						<label>施工类别:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongleibie" value="${boilerParam.shigongleibie}" oldValue="${boilerParamOld.shigongleibie}"/><br/>
						<label>施工告知日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongdanwei_shigongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${boilerParam.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>"/>
						<label>施工竣工日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongdanwei_jungongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${boilerParam.shigongdanwei_jungongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.shigongdanwei_jungongriqi}' pattern='yyyy-MM-dd'/>"/><br/>
						<label>是否在人口密集区:</label>
					    <select id="sf_rkmj" name="boilerParam.shifou_renkoumijiqu" sltValue="${boilerParam.shifou_renkoumijiqu}" oldValue="${boilerParamOld.shifou_renkoumijiqu}" style="width: 179px;">
					    	<option value=""></option>
					    	<option value="否" ${boilerParam.shifou_renkoumijiqu == "否" ? "selected":""}>否</option>
					    	<option value="是" ${boilerParam.shifou_renkoumijiqu == "是" ? "selected":""}>是</option>
					    </select>	
						<label>是否重大危险源:</label>	
					    <select id="sf_zdwxy" name="boilerParam.shifou_zhongdaweixianyuan" sltValue="${boilerParam.shifou_zhongdaweixianyuan}" oldValue="${boilerParamOld.shifou_zhongdaweixianyuan}" style="width: 179px;">
					    	<option value=""></option>
					    	<option value="否" ${boilerParam.shifou_zhongdaweixianyuan == "否" ? "selected":""}>否</option>
					    	<option value="是" ${boilerParam.shifou_zhongdaweixianyuan == "是" ? "selected":""}>是</option>
					    </select>
						<br/>
						<label>是否重点监控特种设备:</label>	
					    <select id="sf_zdjk" name="boilerParam.shifou_zhongdianjiankong" sltValue="${boilerParam.shifou_zhongdianjiankong}" oldValue="${boilerParamOld.shifou_zhongdianjiankong}" style="width: 179px;">
					    	<option value=""></option>
					    	<option value="否" ${boilerParam.shifou_zhongdianjiankong == "否" ? "selected":""}>否</option>
					    	<option value="是" ${boilerParam.shifou_zhongdianjiankong == "是" ? "selected":""}>是</option>
					    </select>	
						<label>是否制定事故应急措施和救援预案:</label>	
					    <select id="sf_yjfa" name="boilerParam.shifou_yingjifangan" sltValue="${boilerParam.shifou_yingjifangan}" oldValue="${boilerParamOld.shifou_yingjifangan}" style="width: 179px;">
					    	<option value=""></option>
					    	<option value="否" ${boilerParam.shifou_yingjifangan == "否" ? "selected":""}>否</option>
					    	<option value="是" ${boilerParam.shifou_yingjifangan == "是" ? "selected":""}>是</option>
					    </select>
						<br/>
						<label>备注:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.beizhu" value="${boilerParam.beizhu}" oldValue="${boilerParamOld.beizhu}"/><br/>
					</div>
					</fieldset>
					<fieldset>
					<legend>检验信息</legend>
					<div id="jyxx_div">
					    <label class="width100">外部报检日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.wb_baojianriqi" value="<fmt:formatDate value='${boilerParam.wb_baojianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.wb_baojianriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">外部检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.wb_jianyanriqi" value="<fmt:formatDate value='${boilerParam.wb_jianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.wb_jianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
					    <label class="width100">下次外部检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.wb_xiacijianyanriqi" value="<fmt:formatDate value='${boilerParam.wb_xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.wb_xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">外部检验结论:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.wb_jianyanjielun" value="${boilerParam.wb_jianyanjielun}" oldValue="${boilerParamOld.wb_jianyanjielun}"/>
						<br/>
					    <label class="width100">外部检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.wb_jianyanjigou" value="${boilerParam.wb_jianyanjigou}" oldValue="${boilerParamOld.wb_jianyanjigou}"/>
						<label class="width100">外检报告编号:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.wj_baogaobianhao" value="${boilerParam.wj_baogaobianhao}" oldValue="${boilerParamOld.wj_baogaobianhao}"/>
						<br/>
					    <label class="width100">内部报检日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.shebeibaojianriqi" value="<fmt:formatDate value='${boilerParam.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">内部检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.jianyanjieshuriqi" value="<fmt:formatDate value='${boilerParam.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
					    <label class="width100">下次内部检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.xiacijianyanriqi" value="<fmt:formatDate value='${boilerParam.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()" />
					    <label class="width100">内部检验结论:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.jianyanjielun" value="${boilerParam.jianyanjielun}" oldValue="${boilerParamOld.jianyanjielun}"/>
						<br/>
					    <label class="width100">内部检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.jianyanjigou" value="${boilerParam.jianyanjigou}" oldValue="${boilerParamOld.jianyanjigou}"/>
					 	<label class="width100">内检报告编号:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.nj_baogaobianhao" value="${boilerParam.nj_baogaobianhao}" oldValue="${boilerParamOld.nj_baogaobianhao}"/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>单位信息</legend>
					<div>
						<label></label>
						<span style="color:red;">【为保证使用单位的一致性，使用单位信息只能在设备列表上修改】</span><br/>
						<label>使用单位:</label>
						<input class="ui-input"   style="width: 420px;" name="boilerParam.shiyongdanwei" value="${boilerParam.shiyongdanwei}" oldValue="${boilerParamOld.shiyongdanwei}" id="bjdshiyongdanwei" onfocus="this.blur()"/><br/>
						<label>单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="boilerParam.shiyongdanwei_dizhi" value="${boilerParam.shiyongdanwei_dizhi}" oldValue="${boilerParamOld.shiyongdanwei_dizhi}"/><br/>
						<label>组织机构代码:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.shiyongdanwei_code" value="${boilerParam.shiyongdanwei_code}" oldValue="${boilerParamOld.shiyongdanwei_code}" />
						<label>法定代表人:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.fadingdaibiaoren" value="${boilerParam.fadingdaibiaoren}" oldValue="${boilerParamOld.fadingdaibiaoren}" /><br/>
						<label>职工人数:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.zhigongrenshu" value="${boilerParam.zhigongrenshu}" oldValue="${boilerParamOld.zhigongrenshu}" />
						<label>年产值:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.nianchanzhi" value="${boilerParam.nianchanzhi}" oldValue="${boilerParamOld.nianchanzhi}" /><br/>
						
						<label>单位性质:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.shiyongdanwei_xingzhi" value="${boilerParam.shiyongdanwei_xingzhi}" oldValue="${boilerParamOld.shiyongdanwei_xingzhi}" />
						<label>所属行业:</label>
						<div id="sydw_sshy_div" class="divSlt">
							<select style="width: 195px;" sltValue="${boilerParam.shiyongdanwei_suoshuhangye}" name="boilerParam.shiyongdanwei_suoshuhangye" oldValue="${boilerParamOld.shiyongdanwei_suoshuhangye}" id="sydw_sshy"></select>
						</div>
						<hr/>
						
						<label>施工单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="boilerParam.shigongdanwei" value="${boilerParam.shigongdanwei}" oldValue="${boilerParamOld.shigongdanwei}"/><br/>
						<label>单位地址:</label>						
						<input class="ui-input"   style="width: 420px;" name="boilerParam.shigongdanwei_dizhi" value="${boilerParam.shigongdanwei_dizhi}" oldValue="${boilerParamOld.shigongdanwei_dizhi}"/><br/>
						<label>组织机构代码:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongdanwei_daima" value="${boilerParam.shigongdanwei_daima}" oldValue="${boilerParamOld.shigongdanwei_daima}"/>
						<label>法人代表:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongdanwei_faren" value="${boilerParam.shigongdanwei_faren}" oldValue="${boilerParamOld.shigongdanwei_faren}"/><br/>
						<label>联系电话:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongdanwei_lianxidianhua" value="${boilerParam.shigongdanwei_lianxidianhua}" oldValue="${boilerParamOld.shigongdanwei_lianxidianhua}"/>
						<label>联   系   人:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongdanwei_lianxiren" value="${boilerParam.shigongdanwei_lianxiren}" oldValue="${boilerParamOld.shigongdanwei_lianxiren}"/><br/>
						<label>许可证编号:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongdanwei_xukezhengbianhao" value="${boilerParam.shigongdanwei_xukezhengbianhao}" oldValue="${boilerParamOld.shigongdanwei_xukezhengbianhao}"/>
						<label>简称:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongdanwei_jiancheng" value="${boilerParam.shigongdanwei_jiancheng}" oldValue="${boilerParamOld.shigongdanwei_jiancheng}"/>
						<br/>
						<label>安装日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.anzhuangriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${boilerParam.anzhuangriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.anzhuangriqi}' pattern='yyyy-MM-dd'/>"/>
						<label>安装监检日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.anzhuangjianjianriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${boilerParam.anzhuangjianjianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.anzhuangjianjianriqi}' pattern='yyyy-MM-dd'/>"/>
						<br/>						
						<label>安装监检机构:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.anzhuangjianjianjigou" value="${boilerParam.anzhuangjianjianjigou}" oldValue="${boilerParamOld.anzhuangjianjianjigou}"/>
						
						<hr/>
						
						<label>制造单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="boilerParam.zhizaodanwei" value="${boilerParam.zhizaodanwei}" oldValue="${boilerParamOld.zhizaodanwei}"/>
						<br/>
						<label>制造许可证编号:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.zhizaodanweixukezhengbianhao" value="${boilerParam.zhizaodanweixukezhengbianhao}" oldValue="${boilerParamOld.zhizaodanweixukezhengbianhao}"/>
						<label>制造监检日期:</label>	
						<input class="ui-input" style="width: 179px;" name="boilerParam.zhizaojianjianriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${boilerParam.zhizaojianjianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${boilerParamOld.zhizaojianjianriqi}' pattern='yyyy-MM-dd'/>"/>
						<br/>
						<label>产品合格证编号:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.chanpinhegezhengbianhao" value="${boilerParam.chanpinhegezhengbianhao}" oldValue="${boilerParamOld.chanpinhegezhengbianhao}"/>
						<label>设计文件鉴定机构:</label>	
						<input class="ui-input" style="width: 179px;" name="boilerParam.wenjianjiandingjigou" value="${boilerParam.wenjianjiandingjigou}" oldValue="${boilerParamOld.wenjianjiandingjigou}"/>
						<br/>
						<label>鉴定报告书编号:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.jiandingbaogaobianhao" value="${boilerParam.jiandingbaogaobianhao}" oldValue="${boilerParamOld.jiandingbaogaobianhao}"/>
						<label>产品图号:</label>	
						<input class="ui-input" style="width: 179px;" name="boilerParam.chanpintuhao" value="${boilerParam.chanpintuhao}" oldValue="${boilerParamOld.chanpintuhao}"/>
						<br/>
						<label>制造监检机构:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.zhizaojianjianjigou" value="${boilerParam.zhizaojianjianjigou}" oldValue="${boilerParamOld.zhizaojianjianjigou}"/>
						<label>制造监检证书编号:</label>	
						<input class="ui-input" style="width: 179px;" name="boilerParam.jianjianzhengshubianhao" value="${boilerParam.jianjianzhengshubianhao}" oldValue="${boilerParamOld.jianjianzhengshubianhao}"/>
						<br/>
						<label>监检机构核准证编号:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.jianjianhezhunzheng" value="${boilerParam.jianjianhezhunzheng}" oldValue="${boilerParamOld.jianjianhezhunzheng}"/>
						<label>制造单位统一社会信用代码:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.zhizaodanwei_code" value="${boilerParam.zhizaodanwei_code}" oldValue="${boilerParamOld.zhizaodanwei_code}"/>
						<br/>
						<label>产品品牌:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.chanpinpinpai" value="${boilerParam.chanpinpinpai}" oldValue="${boilerParamOld.chanpinpinpai}"/>
						<br/>
						<hr/>
						<label>产权单位:</label>
						<input class="ui-input"   style="width: 420px;" name="boilerParam.chanquandanwei" value="${boilerParam.chanquandanwei}" oldValue="${boilerParamOld.chanquandanwei}"/><br/>
						<label>产权单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="boilerParam.chanquandanwei_dizhi" value="${boilerParam.chanquandanwei_dizhi}" oldValue="${boilerParamOld.chanquandanwei_dizhi}"/><br/>
						<label>产权单位代码:</label>
						<input class="ui-input"   style="width: 179px;" name="boilerParam.chanquandanwei_daima" value="${boilerParam.chanquandanwei_daima}" oldValue="${boilerParamOld.chanquandanwei_daima}"/>
						<label>法人代表:</label>
						<input class="ui-input"   style="width: 179px;" name="boilerParam.chanquandanwei_farendaibiao" value="${boilerParam.chanquandanwei_farendaibiao}" oldValue="${boilerParamOld.chanquandanwei_farendaibiao}"/><br/>
						<label>所属行业:</label>
						<div id="cqdw_sshy_div" class="divSlt">
							<select style="width: 195px;" sltValue="${boilerParam.chanquandanwei_suoshuhangye}" name="boilerParam.chanquandanwei_suoshuhangye" oldValue="${boilerParamOld.chanquandanwei_suoshuhangye}" id="cqdw_sshy"></select>
						</div>
						<br/>
						<hr/>
					 	<label>设计单位:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.shejidanwei" value="${boilerParam.shejidanwei}" oldValue="${boilerParamOld.shejidanwei}"/>
					 	<label>设计单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.shejidanweidaima" value="${boilerParam.shejidanweidaima}" oldValue="${boilerParamOld.shejidanweidaima}"/>
					    <br/>
						<hr/>
					 	<label>保险机构:</label>
						<input class="ui-input" style="width: 420px;" name="boilerParam.baoxianjigou" value="${boilerParam.baoxianjigou}" oldValue="${boilerParamOld.baoxianjigou}"/><br/>
					 	<label>保险险种:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.baoxianxianzhong" value="${boilerParam.baoxianxianzhong}" oldValue="${boilerParamOld.baoxianxianzhong}"/>
					    <label>保险价值:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.baoxianjiazhi" value="${boilerParam.baoxianjiazhi}" oldValue="${boilerParamOld.baoxianjiazhi}"/>
					 	 <br/>
					 	 <label>保险费:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.baoxianfei" value="${boilerParam.baoxianfei}" oldValue="${boilerParamOld.baoxianfei}"/>
					    <label>保险金额:</label>
						<input class="ui-input" style="width: 179px;" name="boilerParam.baoxianji" value="${boilerParam.baoxianji}" oldValue="${boilerParamOld.baoxianji}"/>
					 	 <br/>
					</div>
					</fieldset>
					<fieldset>
					<div class="param">
					<legend>设备参数</legend>
						<label>额定出力(T/H)(MW):</label>	
						<input class='ui-input' style="width: 176px;" name="boilerParam.edingchuli" value="${boilerParam.edingchuli}" oldValue="${boilerParamOld.edingchuli}"/>
						<label>额定压力(Mpa):</label>	
						<input class='ui-input' style="width: 176px;" name="boilerParam.edingyali" value="${boilerParam.edingyali}" oldValue="${boilerParamOld.edingyali}" id="yali"/><br/>
						<label>介质:</label>	
						<input class='ui-input' style="width: 176px;" name="boilerParam.jiezhi" value="${boilerParam.jiezhi}" oldValue="${boilerParamOld.jiezhi}"/>
						<label>运行热效率:</label>	
						<input class='ui-input' style="width: 176px;" name="boilerParam.yunxingrexiaolv" value="${boilerParam.yunxingrexiaolv}" oldValue="${boilerParamOld.yunxingrexiaolv}"/><br/>
						<label>额定温度(℃):</label>	
						<input class='ui-input' style="width: 176px;" name="boilerParam.edingwendu" value="${boilerParam.edingwendu}" oldValue="${boilerParamOld.edingwendu}"/>
						<label>使用温度(℃):</label>	
						<input class='ui-input' style="width: 176px;" name="boilerParam.shiyongwendu" value="${boilerParam.shiyongwendu}" oldValue="${boilerParamOld.shiyongwendu}"/></br>
						<label>额定功率:</label>	
						<input class='ui-input' style="width: 176px;" name="boilerParam.edinggonglv" value="${boilerParam.edinggonglv}" oldValue="${boilerParamOld.edinggonglv}"/>
						<label>功率单位:</label>
						<input class='ui-input' style="width: 176px;" name="boilerParam.gonglvdanwei" value="${boilerParam.gonglvdanwei}" oldValue="${boilerParamOld.gonglvdanwei}"/><br/>
						<label>出口温度(℃):</label>	
						<input class='ui-input' style="width: 176px;" name="boilerParam.chukouwendu" value="${boilerParam.chukouwendu}" oldValue="${boilerParamOld.chukouwendu}"/>
						<label>设计压力(Mpa):</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.shejiyali" value="${boilerParam.shejiyali}" oldValue="${boilerParamOld.shejiyali}"/><br/>
						<label>工作压力(Mpa):</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.gongzuoyali" value="${boilerParam.gongzuoyali}" oldValue="${boilerParamOld.gongzuoyali}"/>
						<label>工作温度(℃):</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.gongzuowendu" value="${boilerParam.gongzuowendu}" oldValue="${boilerParamOld.gongzuowendu}"/><br/>
						<label>燃料种类:</label>	
						<select id="rlzl" name="boilerParam.ranliaozhonglei" sltValue="${boilerParam.ranliaozhonglei}" oldValue="${boilerParamOld.ranliaozhonglei}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="油" ${boilerParam.ranliaozhonglei == "油" ? "selected":""}>油</option>
							<option value="气" ${boilerParam.ranliaozhonglei == "气" ? "selected":""}>气</option>
							<option value="煤" ${boilerParam.ranliaozhonglei == "煤" ? "selected":""}>煤</option>
							<option value="煤、气" ${boilerParam.ranliaozhonglei == "煤、气" ? "selected":""}>煤、气</option>
							<option value="水煤浆" ${boilerParam.ranliaozhonglei == "水煤浆" ? "selected":""}>水煤浆</option>
							<option value="生物质" ${boilerParam.ranliaozhonglei == "生物质" ? "selected":""}>生物质</option>
							<option value="木材" ${boilerParam.ranliaozhonglei == "木材" ? "selected":""}>木材</option>
							<option value="电" ${boilerParam.ranliaozhonglei == "电" ? "selected":""}>电</option>
							<option value="余热" ${boilerParam.ranliaozhonglei == "余热" ? "selected":""}>余热</option>
							<option value="煤粉" ${boilerParam.ranliaozhonglei == "煤粉" ? "selected":""}>煤粉</option>
					    	<option value="其他" ${boilerParam.ranliaozhonglei == "其他" ? "selected":""}>其他</option>
					    </select>
						<label>用途:</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.yongtu" value="${boilerParam.yongtu}" oldValue="${boilerParamOld.yongtu}"/>
						<br/>
						<label>压力等级:</label>	
						<select id="yldj" name="boilerParam.yalidengji" sltValue="${boilerParam.yalidengji}" oldValue="${boilerParamOld.yalidengji}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="超临界锅炉≥22.1MPa" ${boilerParam.yalidengji == "超临界锅炉≥22.1MPa" ? "selected":""}>超临界锅炉≥22.1MPa</option>
					    	<option value="亚临界锅炉16.7MPa≤p＜22.1MPa" ${boilerParam.yalidengji == "亚临界锅炉16.7MPa≤p＜22.1MPa" ? "selected":""}>亚临界锅炉16.7MPa≤p＜22.1MPa</option>
					    	<option value="超高压锅炉13.7MPa≤p＜16.7MPa" ${boilerParam.yalidengji == "超高压锅炉13.7MPa≤p＜16.7MPa" ? "selected":""}>超高压锅炉13.7MPa≤p＜16.7MPa</option>
					    	<option value="高压锅炉9.8MPa≤p＜13.7MPa" ${boilerParam.yalidengji == "高压锅炉9.8MPa≤p＜13.7MPa" ? "selected":""}>高压锅炉9.8MPa≤p＜13.7MPa</option>
					    	<option value="次高压锅炉5.3MPa≤p＜9.8MPa" ${boilerParam.yalidengji == "次高压锅炉5.3MPa≤p＜9.8MPa" ? "selected":""}>次高压锅炉5.3MPa≤p＜9.8MPa</option>
					    	<option value="中压锅炉3.8MPa≤p＜5.3MPa" ${boilerParam.yalidengji == "中压锅炉3.8MPa≤p＜5.3MPa" ? "selected":""}>中压锅炉3.8MPa≤p＜5.3MPa</option>
					    	<option value="低压锅炉＜3.8MPa" ${boilerParam.yalidengji == "低压锅炉＜3.8MPa" ? "selected":""}>低压锅炉＜3.8MPa</option>
					    	<option value="高压" ${boilerParam.yalidengji == "高压" ? "selected":""}>高压</option>
					    	<option value="次高压" ${boilerParam.yalidengji == "次高压" ? "selected":""}>次高压</option>
					    	<option value="中压" ${boilerParam.yalidengji == "中压" ? "selected":""}>中压</option>
					    </select>
						<label>额定蒸发量(蒸吨/时):</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.edingzhengfaliang" value="${boilerParam.edingzhengfaliang}" oldValue="${boilerParamOld.edingzhengfaliang}"/>
						<br/>
						<label>是否在城市建成区内:</label>	
						<select id="csjcq" name="boilerParam.chengqu" sltValue="${boilerParam.chengqu}" oldValue="${boilerParamOld.chengqu}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="是" ${boilerParam.chengqu == "是" ? "selected":""}>是</option>
					    	<option value="否" ${boilerParam.chengqu == "否" ? "selected":""}>否</option>
					    </select>
						<label>是否配备有效的除尘装置和脱硫脱硝装置:</label>	
						<select id="cczz_tltx" name="boilerParam.chuchenzhuangzhi" sltValue="${boilerParam.chuchenzhuangzhi}" oldValue="${boilerParamOld.chuchenzhuangzhi}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="是" ${boilerParam.chuchenzhuangzhi == "是" ? "selected":""}>是</option>
					    	<option value="否" ${boilerParam.chuchenzhuangzhi == "否" ? "selected":""}>否</option>
					    </select>
						<br/>
						<label>污染物排放量-PM2.5(吨/年):</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.wuranwu_pm25" value="${boilerParam.wuranwu_pm25}" oldValue="${boilerParamOld.wuranwu_pm25}"/>
						<label>污染物排放量-PM10(吨/年):</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.wuranwu_pm10" value="${boilerParam.wuranwu_pm10}" oldValue="${boilerParamOld.wuranwu_pm10}"/>
						<br/>
						<label>污染物排放量-二氧化硫(SO2)(吨/年):</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.wuranwu_pmso2" value="${boilerParam.wuranwu_pmso2}" oldValue="${boilerParamOld.wuranwu_pmso2}"/>
						<label>污染物排放量-二氧化氮(NO2)(吨/年):</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.wuranwu_pmno2" value="${boilerParam.wuranwu_pmno2}" oldValue="${boilerParamOld.wuranwu_pmno2}"/>
						<br/>
						<label>是否符合山东省排放标准:</label>	
						<select id="pfbz" name="boilerParam.fuhebiaozhun" sltValue="${boilerParam.fuhebiaozhun}" oldValue="${boilerParamOld.fuhebiaozhun}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="是" ${boilerParam.fuhebiaozhun == "是" ? "selected":""}>是</option>
					    	<option value="否" ${boilerParam.fuhebiaozhun == "否" ? "selected":""}>否</option>
					    </select>
						<label>年耗燃烧介质量:</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.ranshaojiezhiliang" value="${boilerParam.ranshaojiezhiliang}" oldValue="${boilerParamOld.ranshaojiezhiliang}"/>
						<br/>
						<label>折合标准煤:</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.biaozhunmei" value="${boilerParam.biaozhunmei}" oldValue="${boilerParamOld.biaozhunmei}"/>
						<label>年耗电量:</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.nianhaodianliang" value="${boilerParam.nianhaodianliang}" oldValue="${boilerParamOld.nianhaodianliang}"/>
						<br/>
						<label>是否按规定完成能效测试(定型):</label>	
						<select id="nxcs_dx" name="boilerParam.nengxiaoceshi_dx" sltValue="${boilerParam.nengxiaoceshi_dx}" oldValue="${boilerParamOld.nengxiaoceshi_dx}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="是" ${boilerParam.nengxiaoceshi_dx == "是" ? "selected":""}>是</option>
					    	<option value="否" ${boilerParam.nengxiaoceshi_dx == "否" ? "selected":""}>否</option>
					    </select>
						<label>是否按规定完成能效测试(定期):</label>	
						<select id="nxcs_dq" name="boilerParam.nengxiaoceshi_dq" sltValue="${boilerParam.nengxiaoceshi_dx}" oldValue="${boilerParamOld.nengxiaoceshi_dq}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="是" ${boilerParam.nengxiaoceshi_dq == "是" ? "selected":""}>是</option>
					    	<option value="否" ${boilerParam.nengxiaoceshi_dq == "否" ? "selected":""}>否</option>
					    </select>
						<br/>
						<label>热效率(设计值):</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.rexiaolv_sheji" value="${boilerParam.rexiaolv_sheji}" oldValue="${boilerParamOld.rexiaolv_sheji}"/>
						<label>热效率(实际值):</label>	
						<input class='ui-input'  style="width: 176px;" name="boilerParam.rexiaolv_shiji" value="${boilerParam.rexiaolv_shiji}" oldValue="${boilerParamOld.rexiaolv_shiji}"/>
						<br/>
						</div>
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
	/**页面所需资源初始化*/
	var columns = "";
	var setSel;
	var path = "<%=path %>";
	var id = $('#bid').val();
	var type = $('#status').val();
	if("${param.adr}" == "sjsh"){
		$("#mnubtn_jcsj_sb_yzc_edit_update").hide();
	}
	$("#rlzl").selectmenu();
	$("#yldj").selectmenu();
	$("#csjcq").selectmenu();
	$("#cczz_tltx").selectmenu();
	$("#pfbz").selectmenu();
	$("#nxcs_dx").selectmenu();
	$("#nxcs_dq").selectmenu();
	$("#sf_rkmj").selectmenu();
	$("#sf_yjfa").selectmenu();
	$("#sf_zdwxy").selectmenu();
	$("#sf_zdjk").selectmenu();
	
	$('#yali').val(${boilerParam.edingyali});
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
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${boilerParam.shebeizhongleidaima}"},
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
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"GLSSHY"},
				function (data, textStatus){
					$STONE.creatSelectMenu("cqdw_sshy",data.dicDatas,"200px",false,"<%=path%>");
			},"JSON");
			$("#shizhi").selectmenu();
			//判断哪些值正在修改
			setTimeout(function(){
				$STONE.verifyUpdSltValue("select");
			},2000);
			$STONE.verifyUpdValue("input");
			appendSelTo();
			
			//附属管道
			$("#mnubtn_jcsj_sb_yzc_fsgd").click(function(){
				var url = "<%=path%>/se!findGlYlgd.do?id="+id+"&se=swe";
				parent.addTabsItem("mnubtn_jcsj_sb_yzc_fsgd","锅炉附属管道",url);
			});
			
		});
		function save(tjstate){
			if($('#shi').val() == ""){
				$.dialog.alert('市不能为空！');
				return false;
			}
			var options = {
				url:"<%=path%>/se!updateByGL.do?tjstate="+tjstate+"&address=${address}&dbid=${dbid}",
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
			var id = $('#bid').val();
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