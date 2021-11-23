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
	width: 95px;
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
	                	 <input type="hidden" name="piping.id" value="${piping.id}" id="pid"/>
	                	 <input type="hidden" name="piping.zcstatus" value="${piping.zcstatus}" id="status"/>
	                	 <input type="hidden" name="piping.shebeizhongleidaima" value="${piping.shebeizhongleidaima}"/>
	                	 <input type="hidden" name="piping.shiyongdanweiId" value="${piping.shiyongdanweiId}"/>
	                	 <input type="hidden" name="piping.shigongdanweiId" value="${piping.shigongdanweiId}"/>
	                	 <input type="hidden" name="piping.state" value="${piping.state}"/>
	                	 <input type="hidden" name="piping.flag" value="${piping.flag}"/>
	                	 <input type="hidden" name="piping.eqhide" value="${piping.eqhide}"/>
	                	 <input type="hidden" name="piping.fj_filepath" value="${piping.fj_filepath}"/>
	                	 <input type="hidden" name="piping.banjieriqi" value="${piping.banjieriqi}"/>
		            	<input type="hidden" name="piping.pid" value="${piping.pid}" id="pid"/>
						<input type="hidden" value="${piping.tmpData}" name="piping.tmpData" />
	                	 <input type="hidden" name="piping.jingdu" value="${piping.jingdu}"/>
	                	 <input type="hidden" name="piping.weidu" value="${piping.weidu}"/>
		            	<input type="hidden" name="piping.dj_jingbanriqi" value="${piping.dj_jingbanriqi}"/>
		            	<input type="hidden" name="piping.djb_id" value="${piping.djb_id}"/>
                	</div>
					<fieldset>
					<legend>基本信息</legend>
					<div>
					    <label>设备名称:</label>
						<input class="ui-input" style="width: 179px;" name="piping.shebeimingcheng" value="${piping.shebeimingcheng }" oldValue="${pipingOld.shebeimingcheng}" id="mingcheng"></select>
					    <label>设备种类:</label>
					    <input class="ui-input" readonly="true" name="piping.shebeizhonglei" style="width: 179px;" id="yzc_shebeizhonglei" value="压力管道" oldValue="压力管道"/><br/>
					    <label>设备类别:</label>
					    	<div id="yzc_shebeileibie_div" class="divSlt">
	        					<select name="piping.shebeileibiedaima" sltValue="${piping.shebeileibiedaima}" oldValue="${pipingOld.shebeileibiedaima}" style="width: 195px;" id="yzc_shebeileibie"></select>
					    	</div>
					    <label>设备品种:</label>
					    	<div id="yzc_shebeipinzhong_div" class="divSlt">
	        					<select name="piping.shenbeipinzhongdaima" sltValue="${piping.shenbeipinzhongdaima}" oldValue="${pipingOld.shenbeipinzhongdaima}" style="width: 195px;" id="yzc_shebeipinzhong"></select>
					    	</div>
					    	<br/>
					    <label>设备代码:</label>
						<input class="ui-input" style="width: 179px;" name="piping.shebeidaima" value="${piping.shebeidaima}" oldValue="${pipingOld.shebeidaima}"/>
					    <label>管道编号:</label>
						<input class="ui-input" style="width: 179px;" name="piping.chuchangbianhao" value="${piping.chuchangbianhao}" oldValue="${pipingOld.chuchangbianhao}"/><br/>
					    <label>制造日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="piping.zhizaoriqi_date" value="<fmt:formatDate value='${piping.zhizaoriqi_date}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.zhizaoriqi_date}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label>制造日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="piping.zhizaoriqi" value="${piping.zhizaoriqi}" oldValue="${pipingOld.zhizaoriqi}"/><br/>
						<label>投用日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="piping.touyongriqi_date" value="<fmt:formatDate value='${piping.touyongriqi_date}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.touyongriqi_date}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>投用日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="piping.touyongriqi" value="${piping.touyongriqi}" oldValue="${pipingOld.touyongriqi}" /><br/>
					    <label>安装竣工日期:</label>
						<input class="ui-input" style="width: 179px;" name="piping.anzhuangriqi" value="<fmt:formatDate value='${piping.anzhuangriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.anzhuangriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label>管道规格:</label>
						<input class="ui-input" style="width: 179px;" name="piping.shebeixinghao" value="${piping.shebeixinghao}" oldValue="${pipingOld.shebeixinghao}"/><br/>
					    <label>设备注册代码:</label>
						<input class="ui-input" style="width: 179px;background-color:#E0E0E0" readonly="true" name="piping.zhucedaima" value="${piping.zhucedaima}" oldValue="${pipingOld.zhucedaima}" id="zcdm"/>
					    <label>设备注册日期:</label>
						<input class="ui-input" style="width: 179px;" name="piping.zhuceriqi" value="<fmt:formatDate value='${piping.zhuceriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.zhuceriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>审核日期:</label>
						<input class="ui-input" style="width: 179px;" name="piping.shenheriqi" value="<fmt:formatDate value='${piping.shenheriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.shenheriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>登记意见:</label>
						<input class="ui-input" style="width: 179px;" name="piping.dengjiyijian" value="${piping.dengjiyijian}" oldValue="${pipingOld.dengjiyijian}"/>
						<br/>
						<label>注册登记人员:</label>
						<input class="ui-input" style="width: 179px;" name="piping.zhucedengjirenyuan" value="${piping.zhucedengjirenyuan}" oldValue="${pipingOld.zhucedengjirenyuan}"/>
						<label>注册登记机构:</label>
						<input class="ui-input" style="width: 179px;" name="piping.zhucedengjijigou" value="${piping.zhucedengjijigou}" oldValue="${pipingOld.zhucedengjijigou}"/>
						<br/>
						<label>使用登记证编号:</label>
						<input class="ui-input" style="width: 179px;" name="piping.dengjizhengbianhao" value="${piping.dengjizhengbianhao}" oldValue="${pipingOld.dengjizhengbianhao}"/>
					    <label>发证日期:</label>
						<input class="ui-input" style="width: 179px;" name="piping.fazhengriqi" value="<fmt:formatDate value='${piping.fazhengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.fazhengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
					    <label>管道级别:</label>
						<input class="ui-input" style="width: 179px;" name="piping.guandaojibie" value="${piping.guandaojibie}" oldValue="${pipingOld.guandaojibie}"/>
						<label>内部编号:</label>
						<input class="ui-input" style="width: 179px;" name="piping.neibubianhao" value="${piping.neibubianhao}" oldValue="${pipingOld.neibubianhao}"/><br/>
					    <label>设备地点:</label>
						<input class="ui-input" style="width: 179px;" name="piping.shebeididian" value="${piping.shebeididian}" oldValue="${pipingOld.shebeididian}"/>
						<label>所属车间:</label>
						<input class="ui-input" style="width: 179px;" name="piping.suoshuchejian" value="${piping.suoshuchejian}" oldValue="${pipingOld.suoshuchejian}"/><br/>
						
						<label>市:</label>
							<div id="shi_div" class="divSlt" onclick="delay()">
	        					<select name="piping.shidaima" sltValue="${piping.shidaima}" oldValue="${pipingOld.shidaima}" style="width: 195px;" id="shi"></select>
							</div>
						<label>区划名称:</label>
							<div id="quxian_div" class="divSlt" onclick="delay()">
	        					<select name="piping.quhuadaima" sltValue="${piping.quhuadaima}" oldValue="${pipingOld.quhuadaima}" style="width: 195px;" id="quxian"></select>
							</div>
							<br/>
						<label>乡镇:</label>
							<div id="xiangzhen_div" class="divSlt">
	        					<select name="piping.xiangzhendaima" sltValue="${piping.xiangzhendaima}" oldValue="${pipingOld.xiangzhendaima}" style="width: 195px;" id="xiangzhen"></select>
							</div>
					    <label>是否市直:</label>
						<s:select name="piping.szstatus" list="#{'0':'否','1':'是'}" value="piping.szstatus" sltValue="${piping.szstatus}" oldValue="${pipingOld.szstatus}" style="width: 195px;" id="shizhi"></s:select>
						<br/>
						<label>是否重要管道:</label>
						<s:select name="piping.zhongyaoguandao" list="#{'0':'否','1':'是'}" value="piping.zhongyaoguandao" sltValue="${piping.zhongyaoguandao}" oldValue="${pipingOld.zhongyaoguandao}" style="width: 195px;" id="zygd"></s:select>
						<label>工程(装置)名称:</label>
						<input class="ui-input" style="width: 179px;" name="piping.gongchengmingcheng" value="${piping.gongchengmingcheng}" oldValue="${pipingOld.gongchengmingcheng}"/><br/>
						<label>主管部门:</label>
						<input class="ui-input" style="width: 179px;" name="piping.zhuguanbumen" value="${piping.zhuguanbumen}" oldValue="${pipingOld.zhuguanbumen}"/>
						<label>行业:</label>
						<input class="ui-input" style="width: 179px;" name="piping.hangye" value="${piping.hangye}" oldValue="${pipingOld.hangye}"/>
						<br/>
						<label>经办人:</label>
						<input class="ui-input" style="width: 179px;" name="piping.jingbanren" value="${piping.jingbanren}" oldValue="${pipingOld.jingbanren}"/>
						<label>固定资产值(万元):</label>
						<input class="ui-input" style="width: 179px;" name="piping.gudingzichanzhi" value="${piping.gudingzichanzhi}" oldValue="${pipingOld.gudingzichanzhi}"/>
						<br/>
						<label>使用单位联系电话:</label>
						<input class="ui-input"   style="width: 179px;" name="piping.shiyongdanwei_lianxidianhua" value="${piping.shiyongdanwei_lianxidianhua}" oldValue="${pipingOld.shiyongdanwei_lianxidianhua}"/>
						<label>使用单位联系人:</label>
						<input class="ui-input"   style="width: 179px;" name="piping.shiyongdanwei_lianxiren" value="${piping.shiyongdanwei_lianxiren}" oldValue="${pipingOld.shiyongdanwei_lianxiren}"/><br/>
						<label>安全管理部门:</label>
						<input class="ui-input" style="width: 179px;" name="piping.anquanguanlibumen" value="${piping.anquanguanlibumen}" oldValue="${pipingOld.anquanguanlibumen}"/>
					 	<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="piping.anquanguanli_lianxidianhua" value="${piping.anquanguanli_lianxidianhua}" oldValue="${pipingOld.anquanguanli_lianxidianhua}"/>
					    <br/>
					    <label>安全管理人员:</label>
						<input class="ui-input" style="width: 179px;" name="piping.anquanguanlirenyuan" value="${piping.anquanguanlirenyuan}" oldValue="${pipingOld.anquanguanlirenyuan}"/>
						<label>是否重大危险源:</label>
					    <select id="cc_zdwxy" name="piping.shifou_zhongdaweixianyuan" sltValue="${piping.shifou_zhongdaweixianyuan}" oldValue="${pipingOld.shifou_zhongdaweixianyuan}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${piping.shifou_zhongdaweixianyuan == "否" ? "selected":""}>否</option>
					    	<option value="是" ${piping.shifou_zhongdaweixianyuan == "是" ? "selected":""}>是</option>
					    </select> <br/>
					    <label>是否重点监控特种设备:</label>
					    <select id="cc_zdjk" name="piping.shifou_zhongdianjiankong" sltValue="${piping.shifou_zhongdianjiankong}" oldValue="${pipingOld.shifou_zhongdianjiankong}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${piping.shifou_zhongdianjiankong == "否" ? "selected":""}>否</option>
					    	<option value="是" ${piping.shifou_zhongdianjiankong == "是" ? "selected":""}>是</option>
					    </select>
					    <label>是否制定事故应急措施和救援预案:</label>
					    <select id="cc_jyya" name="piping.shifou_yingjifangan" sltValue="${piping.shifou_yingjifangan}" oldValue="${pipingOld.shifou_yingjifangan}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${piping.shifou_yingjifangan == "否" ? "selected":""}>否</option>
					    	<option value="是" ${piping.shifou_yingjifangan == "是" ? "selected":""}>是</option>
					    </select> <br/>
					    <label>是否在人口密集区:</label>
					    <select id="cc_rkmjq" name="piping.shifou_renkoumijiqu" sltValue="${piping.shifou_renkoumijiqu}" oldValue="${pipingOld.shifou_renkoumijiqu}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${piping.shifou_renkoumijiqu == "否" ? "selected":""}>否</option>
					    	<option value="是" ${piping.shifou_renkoumijiqu == "是" ? "selected":""}>是</option>
					    </select>
					     <label>是否冷库设备:</label>
					    <select id="cc_lksb" name="piping.biaozhuleixing" sltValue="${piping.biaozhuleixing}" oldValue="${pipingOld.biaozhuleixing}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${piping.biaozhuleixing == "否" ? "selected":""}>否</option>
					    	<option value="是" ${piping.biaozhuleixing == "是" ? "selected":""}>是</option>
					    </select><br/>
						<label>备注:</label>
						<input class="ui-input" style="width: 450px;" name="piping.beizhu" value="${piping.beizhu}" oldValue="${pipingOld.beizhu}"/>
					
					</div>
					</fieldset>
					<fieldset>
					<legend>检验信息</legend>
					<div id="jyxx_div">
					    <label class="width100">在线报检日期:</label>
						<input class="ui-input" style="width: 179px;" name="piping.zx_baojianriqi" value="<fmt:formatDate value='${piping.zx_baojianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.zx_baojianriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">在线检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="piping.zx_jianyanriqi" value="<fmt:formatDate value='${piping.zx_jianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.zx_jianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
					    <label class="width100">下次在线检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="piping.zx_xiacijianyanriqi" value="<fmt:formatDate value='${piping.zx_xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.zx_xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">在线检验结论:</label>
						<input class="ui-input" style="width: 179px;" name="piping.zx_jianyanjielun" value="${piping.zx_jianyanjielun}" oldValue="${pipingOld.zx_jianyanjielun}"/>
						<br/>
					    <label class="width100">在线检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="piping.zx_jianyanjigou" value="${piping.zx_jianyanjigou}" oldValue="${pipingOld.zx_jianyanjigou}"/>
						<label class="width100">在线报告编号:</label>
						<input class="ui-input" style="width: 179px;" name="piping.nd_baogaobianhao" value="${piping.nd_baogaobianhao}" oldValue="${pipingOld.nd_baogaobianhao}"/>
						<br/>
					    <label class="width100">全面报检日期:</label>
						<input class="ui-input" style="width: 179px;" name="piping.shebeibaojianriqi" value="<fmt:formatDate value='${piping.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">全面检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="piping.jianyanjieshuriqi" value="<fmt:formatDate value='${piping.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
					    <label class="width100">下次全面检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="piping.xiacijianyanriqi" value="<fmt:formatDate value='${piping.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">全面检验结论:</label>
						<input class="ui-input" style="width: 179px;" name="piping.jianyanjielun" value="${piping.jianyanjielun}" oldValue="${pipingOld.jianyanjielun}"/>
						<br/>
					    <label class="width100">全面检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="piping.jianyanjigou" value="${piping.jianyanjigou}" oldValue="${pipingOld.jianyanjigou}"/>
					 	<label class="width100">全面报告编号:</label>
						<input class="ui-input" style="width: 179px;" name="piping.qm_baogaobianhao" value="${piping.qm_baogaobianhao}" oldValue="${pipingOld.qm_baogaobianhao}"/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>单位信息</legend>
					<div>
						<label></label>
						<span style="color:red;">【为保证使用单位的一致性，使用单位信息只能在设备列表上修改】</span><br/>
						<label>使用单位:</label>
						<input class="ui-input"   style="width: 420px;" name="piping.shiyongdanwei" value="${piping.shiyongdanwei}" oldValue="${pipingOld.shiyongdanwei}" id="bjdshiyongdanwei" required="required" onfocus="this.blur()"/><br/>
						<label>单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="piping.shiyongdanwei_dizhi" value="${piping.shiyongdanwei_dizhi}" oldValue="${pipingOld.shiyongdanwei_dizhi}"/><br/>
						<label>组织机构代码:</label>
						<input class="ui-input" style="width: 179px;" name="piping.shiyongdanwei_code" value="${piping.shiyongdanwei_code}" oldValue="${pipingOld.shiyongdanwei_code}" />
						<label>法定代表人:</label>
						<input class="ui-input" style="width: 179px;" name="piping.fadingdaibiaoren" value="${piping.fadingdaibiaoren}" oldValue="${pipingOld.fadingdaibiaoren}" /><br/>
						<label>邮政编码:</label>
						<input class="ui-input"   style="width: 179px;" name="piping.shiyongdanwei_youbian" value="${piping.shiyongdanwei_youbian}" oldValue="${pipingOld.shiyongdanwei_youbian}"/>
						<label>操作人员:</label>
						<input class="ui-input"   style="width: 179px;" name="piping.shiyongdanwei_caozuorenyuan" value="${piping.shiyongdanwei_caozuorenyuan}" oldValue="${pipingOld.shiyongdanwei_caozuorenyuan}"/><br/>
						<label>主管负责人:</label>
						<input class="ui-input"   style="width: 179px;" name="piping.zhuguanfuzeren" value="${piping.zhuguanfuzeren}" oldValue="${pipingOld.zhuguanfuzeren}"/>
						<label>主管负责人电话:</label>
						<input class="ui-input"   style="width: 179px;" name="piping.zhuguanfuzerendianhua" value="${piping.zhuguanfuzerendianhua}" oldValue="${pipingOld.zhuguanfuzerendianhua}"/><br/>
						<label>所属行业:</label>
						<div id="sydw_sshy_div" class="divSlt">
							<select style="width: 195px;" sltValue="${piping.shiyongdanwei_suoshuhangye}" name="piping.shiyongdanwei_suoshuhangye" oldValue="${pipingOld.shiyongdanwei_suoshuhangye}" id="sydw_sshy"></select>
						</div>
						<hr/>
						
						<label>施工单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="piping.shigongdanwei" value="${piping.shigongdanwei}" oldValue="${pipingOld.shigongdanwei}"/><br/>
						<label>组织机构代码:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongdanwei_daima" value="${piping.shigongdanwei_daima}" oldValue="${pipingOld.shigongdanwei_daima}"/>
						<label>法人代表:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongdanwei_faren" value="${piping.shigongdanwei_faren}" oldValue="${pipingOld.shigongdanwei_faren}"/><br/>
						<label>施工日期:</label>						
						<input class="ui-input"   style="width: 179px;" name="piping.shigongdanwei_shigongriqi" value="<fmt:formatDate value='${piping.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>验收单位:</label>	
						<input class="ui-input"   style="width: 179px;" name="piping.yanshoudanwei" value="${piping.yanshoudanwei}" oldValue="${pipingOld.yanshoudanwei}"/><br/>
						<label>验收日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="piping.yanshouriqi" value="<fmt:formatDate value='${piping.yanshouriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${pipingOld.yanshouriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>检验机构:</label>	
						<input class="ui-input"   style="width: 179px;" name="piping.yanshoujigou" value="${piping.yanshoujigou}" oldValue="${pipingOld.yanshoujigou}"/><br/>
						<label>验收报告编号:</label>	
						<input class="ui-input"   style="width: 179px;" name="piping.yanshoubaogaobianhao" value="${piping.yanshoubaogaobianhao}" oldValue="${pipingOld.yanshoubaogaobianhao}"/><br/><hr/>
						
						<label>维保单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="piping.weihubaoyangdanwei" value="${piping.weihubaoyangdanwei}" oldValue="${pipingOld.weihubaoyangdanwei}"/><br/>
						<label>资格证书号:</label>						
						<input class="ui-input"   style="width: 179px" name="piping.whbydw_zizhizhengshu" value="${piping.whbydw_zizhizhengshu}" oldValue="${pipingOld.whbydw_zizhizhengshu}"/>
						<label>联系人:</label>						
						<input class="ui-input"   style="width: 179px" name="piping.weihubaoyangdanwei_lianxiren" value="${piping.weihubaoyangdanwei_lianxiren}" oldValue="${pipingOld.weihubaoyangdanwei_lianxiren}"/><br/>
						<label>联系电话:</label>						
						<input class="ui-input"   style="width: 179px" name="piping.weihubaoyangdanwei_dianhua" value="${piping.weihubaoyangdanwei_dianhua}" oldValue="${pipingOld.weihubaoyangdanwei_dianhua}"/>
						<label>单位代码:</label>						
						<input class="ui-input"   style="width: 179px" name="piping.weihubaoyangdanwei_code" value="${piping.weihubaoyangdanwei_code}" oldValue="${pipingOld.weihubaoyangdanwei_code}"/><br/>
						<label>维保周期( 周):</label>						
						<input class="ui-input"   style="width: 179px" name="piping.weibaozhouqi" value="${piping.weibaozhouqi}" oldValue="${pipingOld.weibaozhouqi}"/>
						<label>大修周期(月):</label>						
						<input class="ui-input"   style="width: 179px" name="piping.daxiuzhouqi" value="${piping.daxiuzhouqi}" oldValue="${pipingOld.daxiuzhouqi}"/><br/>
						<hr/>
						
						<label>制造单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="piping.zhizaodanwei" value="${piping.zhizaodanwei}" oldValue="${pipingOld.zhizaodanwei}"/><br/>
						<label>制造许可证编号:</label>
						<input class="ui-input" style="width: 179px;" name="piping.zhizaodanweixukezhengbianhao" value="${piping.zhizaodanweixukezhengbianhao}" oldValue="${pipingOld.zhizaodanweixukezhengbianhao}"/>
						<label>资格证书名称:</label>						
						<input class="ui-input"   style="width: 179px" name="piping.zhizaodanwei_zigezhengshu" value="${piping.zhizaodanwei_zigezhengshu}" oldValue="${pipingOld.zhizaodanwei_zigezhengshu}"/><br/>
						<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="piping.zhizaodanwei_lianxidianhua" value="${piping.zhizaodanwei_lianxidianhua}" oldValue="${pipingOld.zhizaodanwei_lianxidianhua}"/>
						<label>使用场合:</label>						
						<input class="ui-input"   style="width: 179px" name="piping.zhizaodanwei_shiyongchanghe" value="${piping.zhizaodanwei_shiyongchanghe}" oldValue="${pipingOld.zhizaodanwei_shiyongchanghe}"/><br/>
						<hr/>
						<label>产权单位:</label>
						<input class="ui-input"   style="width: 420px;" name="piping.chanquandanwei" value="${piping.chanquandanwei}" oldValue="${pipingOld.chanquandanwei}"/><br/>
						<label>产权单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="piping.chanquandanwei_dizhi" value="${piping.chanquandanwei_dizhi}" oldValue="${pipingOld.chanquandanwei_dizhi}"/><br/>
						<label>产权单位代码:</label>
						<input class="ui-input"   style="width: 179px;" name="piping.chanquandanwei_daima" value="${piping.chanquandanwei_daima}" oldValue="${pipingOld.chanquandanwei_daima}"/>
						<label>邮政编码:</label>						
						<input class="ui-input"   style="width: 179px" name="piping.chanquandanwei_youbian" value="${piping.chanquandanwei_youbian}" oldValue="${pipingOld.chanquandanwei_youbian}"/><br/>
						<label>法人代表:</label>
						<input class="ui-input"   style="width: 179px;" name="piping.chanquandanwei_farendaibiao" value="${piping.chanquandanwei_farendaibiao}" oldValue="${pipingOld.chanquandanwei_farendaibiao}"/>
						<label>联系电话:</label>						
						<input class="ui-input"   style="width: 179px" name="piping.chanquandanwei_dianhua" value="${piping.chanquandanwei_dianhua}" oldValue="${pipingOld.chanquandanwei_dianhua}"/><br/>
						
						<br/>
						<hr/>
					 	<label>设计单位:</label>
						<input class="ui-input" style="width: 179px;" name="piping.shejidanwei" value="${piping.shejidanwei}" oldValue="${pipingOld.shejidanwei}"/>
					 	<label>设计单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="piping.shejidanweidaima" value="${piping.shejidanweidaima}" oldValue="${pipingOld.shejidanweidaima}"/>
					    <br/>
					 	<hr/>
					 	<label>安装单位:</label>
						<input class="ui-input" style="width: 420px;" name="piping.anzhuangdanwei" value="${piping.anzhuangdanwei}" oldValue="${pipingOld.anzhuangdanwei}"/><br/>
					 	<label>安装单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="piping.anzhuangdanwei_daima" value="${piping.anzhuangdanwei_daima}" oldValue="${pipingOld.anzhuangdanwei_daima}"/>
					    <label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="piping.anzhuangdanwei_lianxidianhua" value="${piping.anzhuangdanwei_lianxidianhua}" oldValue="${pipingOld.anzhuangdanwei_lianxidianhua}"/><br/>
						<label>项目负责人:</label>
						<input class="ui-input" style="width: 179px;" name="piping.anzhuangdanwei_lianxiren" value="${piping.anzhuangdanwei_lianxiren}" oldValue="${pipingOld.anzhuangdanwei_lianxiren}"/>
					    <label>资格证书编号:</label>
						<input class="ui-input" style="width: 179px;" name="piping.anzhuangdanwei_zigezhengshu" value="${piping.anzhuangdanwei_zigezhengshu}" oldValue="${pipingOld.anzhuangdanwei_zigezhengshu}"/><br/>
					 	<hr/>
					</div>
					</fieldset>
					<fieldset>
					<legend>设备参数</legend>
						<label>公称直径(mm):</label>	
						<input class='ui-input' style="width: 176px;" name="piping.gongchengzhijing" value="${piping.gongchengzhijing}" oldValue="${pipingOld.gongchengzhijing}"/>
						<label>公称壁厚(mm):</label>	
						<input class='ui-input' style="width: 176px;" name="piping.gongchengbihou" value="${piping.gongchengbihou}" oldValue="${pipingOld.gongchengbihou}"/><br/>
						<label>管道长度(m):</label>	
						<input class='ui-input' style="width: 176px;" name="piping.guandaochangdu" value="${piping.guandaochangdu}" oldValue="${pipingOld.guandaochangdu}"/>
						<label>输送介质:</label>
						<input class='ui-input' style="width: 176px;" name="piping.shusongjiezhi" value="${piping.shusongjiezhi}" oldValue="${pipingOld.shusongjiezhi}"/><br/>
						<label>设计压力(Mpa):</label>	
						<input class='ui-input' style="width: 176px;" name="piping.shejiyali" value="${piping.shejiyali}" oldValue="${pipingOld.shejiyali}"/>
						<label>最高工作压力(Mpa):</label>	
						<input class='ui-input' style="width: 176px;" name="piping.gongzuoyali" value="${piping.gongzuoyali}" oldValue="${pipingOld.gongzuoyali}"/></br>
						<label>设计温度(℃):</label>	
						<input class='ui-input' style="width: 176px;" name="piping.shejiwendu" value="${piping.shejiwendu}" oldValue="${pipingOld.shejiwendu}"/>
						<label>最高工作温度(℃):</label>	
						<input class='ui-input'  style="width: 176px;" name="piping.gongzuowendu" value="${piping.gongzuowendu}" oldValue="${pipingOld.gongzuowendu}"/><br/>
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
		setTimeout(function(){
			$("#zygd-button").css("margin-bottom","-10px");
		},100);
		
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
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${piping.shebeizhongleidaima}"},
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
			$("#zygd").selectmenu();
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
				url:"<%=path%>/se!updateByYLGD.do?tjstate="+tjstate+"&address=${address}&dbid=${dbid}",
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