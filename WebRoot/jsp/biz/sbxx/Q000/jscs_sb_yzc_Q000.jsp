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
	width: 105px;
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
	                	 <input type="hidden" name="qiping.id" value="${qiping.id}" id="pid"/>
	                	 <input type="hidden" name="qiping.zcstatus" value="${qiping.zcstatus}" id="status"/>
	                	 <input type="hidden" name="qiping.shebeizhongleidaima" value="${qiping.shebeizhongleidaima}"/>
	                	 <input type="hidden" name="qiping.shiyongdanweiId" value="${qiping.shiyongdanweiId}"/>
	                	 <input type="hidden" name="qiping.shigongdanweiId" value="${qiping.shigongdanweiId}"/>
	                	 <input type="hidden" name="qiping.state" value="${qiping.state}"/>
	                	 <input type="hidden" name="qiping.flag" value="${qiping.flag}"/>
	                	 <input type="hidden" name="qiping.eqhide" value="${qiping.eqhide}"/>
	                	 <input type="hidden" name="qiping.fj_filepath" value="${qiping.fj_filepath}"/>
	                	 <input type="hidden" name="qiping.banjieriqi" value="${qiping.banjieriqi}"/>
		            	<input type="hidden" name="qiping.pid" value="${qiping.pid}" id="pid"/>
						<input type="hidden" value="${qiping.tmpData}" name="qiping.tmpData" />
	                	 <input type="hidden" name="qiping.jingdu" value="${qiping.jingdu}"/>
	                	 <input type="hidden" name="qiping.weidu" value="${qiping.weidu}"/>
		            	<input type="hidden" name="qiping.dj_jingbanriqi" value="${qiping.dj_jingbanriqi}"/>
                	</div>
					<fieldset>
					<legend>基本信息</legend>
					<div>
					    <label>设备名称:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.shebeimingcheng" value="${qiping.shebeimingcheng }" oldValue="${qipingOld.shebeimingcheng}" id="mingcheng"></select>
					    <label>设备种类:</label>
					    <input class="ui-input" readonly="true" name="qiping.shebeizhonglei" style="width: 179px;" id="yzc_shebeizhonglei" value="气瓶" oldValue="气瓶"/><br/>
					    <label>设备类别:</label>
					    	<div id="yzc_shebeileibie_div" class="divSlt">
	        					<select name="qiping.shebeileibiedaima" sltValue="${qiping.shebeileibiedaima}" oldValue="${qipingOld.shebeileibiedaima}" style="width: 195px;" id="yzc_shebeileibie"></select>
					    	</div>
					    <label>设备品种:</label>
					    	<div id="yzc_shebeipinzhong_div" class="divSlt">
	        					<select name="qiping.shenbeipinzhongdaima" sltValue="${qiping.shenbeipinzhongdaima}" oldValue="${qipingOld.shenbeipinzhongdaima}" style="width: 195px;" id="yzc_shebeipinzhong"></select>
					    	</div>
					    	<br/>
					    <label>设备代码:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.shebeidaima" value="${qiping.shebeidaima}" oldValue="${qipingOld.shebeidaima}"/>
					    <label>制造日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="qiping.zhizaoriqi_date" value="<fmt:formatDate value='${qiping.zhizaoriqi_date}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${qipingOld.zhizaoriqi_date}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
					    <label>制造日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="qiping.zhizaoriqi" value="${qiping.zhizaoriqi}" oldValue="${qipingOld.zhizaoriqi}"/>
						<label>投用日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="qiping.touyongriqi_date" value="<fmt:formatDate value='${qiping.touyongriqi_date}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${qipingOld.touyongriqi_date}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
						<label>投用日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="qiping.touyongriqi" value="${qiping.touyongriqi}" oldValue="${qipingOld.touyongriqi}" />
					    <label>安装竣工日期:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.anzhuangriqi" value="<fmt:formatDate value='${qiping.anzhuangriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${qipingOld.anzhuangriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
					    <label>设备注册代码:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.zhucedaima" value="${qiping.zhucedaima}" oldValue="${qipingOld.zhucedaima}" id="zcdm"/>
					    <label>设备注册日期:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.zhuceriqi" value="<fmt:formatDate value='${qiping.zhuceriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${qipingOld.zhuceriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>审核日期:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.shenheriqi" value="<fmt:formatDate value='${qiping.shenheriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${qipingOld.shenheriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>登记意见:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.dengjiyijian" value="${qiping.dengjiyijian}" oldValue="${qipingOld.dengjiyijian}"/>
						<br/>
						<label>注册登记人员:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.zhucedengjirenyuan" value="${qiping.zhucedengjirenyuan}" oldValue="${qipingOld.zhucedengjirenyuan}"/>
						<label>注册登记机构:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.zhucedengjijigou" value="${qiping.zhucedengjijigou}" oldValue="${qipingOld.zhucedengjijigou}"/>
						<br/>
						<label>使用登记证编号:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.dengjizhengbianhao" value="${qiping.dengjizhengbianhao}" oldValue="${qipingOld.dengjizhengbianhao}"/>
					    <label>发证日期:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.fazhengriqi" value="<fmt:formatDate value='${qiping.fazhengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${qipingOld.fazhengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>内部编号:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.neibubianhao" value="${qiping.neibubianhao}" oldValue="${qipingOld.neibubianhao}"/>
					    <label>设备地点:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.shebeididian" value="${qiping.shebeididian}" oldValue="${qipingOld.shebeididian}"/>
						<br/>
						<label>所属车间:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.suoshuchejian" value="${qiping.suoshuchejian}" oldValue="${qipingOld.suoshuchejian}"/>
						
						<label>市:</label>
							<div id="shi_div" class="divSlt" onclick="delay()">
	        					<select name="qiping.shidaima" sltValue="${qiping.shidaima}" oldValue="${qipingOld.shidaima}" style="width: 195px;" id="shi"></select>
							</div>
						<br/>
						<label>区划名称:</label>
							<div id="quxian_div" class="divSlt" onclick="delay()">
	        					<select name="qiping.quhuadaima" sltValue="${qiping.quhuadaima}" oldValue="${qipingOld.quhuadaima}" style="width: 195px;" id="quxian"></select>
							</div>
						<label>乡镇:</label>
							<div id="xiangzhen_div" class="divSlt">
	        					<select name="qiping.xiangzhendaima" sltValue="${qiping.xiangzhendaima}" oldValue="${qipingOld.xiangzhendaima}" style="width: 195px;" id="xiangzhen"></select>
							</div>
							<br/>
					    <label>是否市直:</label>
					    <select id="shizhi" name="qiping.szstatus" sltValue="${qiping.szstatus}" oldValue="${qipingOld.szstatus}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${qiping.szstatus == "否" ? "selected":""}>否</option>
					    	<option value="是" ${qiping.szstatus == "是" ? "selected":""}>是</option>
					    </select>
						<label>主管部门:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.zhuguanbumen" value="${qiping.zhuguanbumen}" oldValue="${qipingOld.zhuguanbumen}"/>
						<br/>
						<label>行业:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.hangye" value="${qiping.hangye}" oldValue="${qipingOld.hangye}"/>
						<label>经办人:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.jingbanren" value="${qiping.jingbanren}" oldValue="${qipingOld.jingbanren}"/>
						<br/>
						<label>固定资产值(万元):</label>
						<input class="ui-input" style="width: 179px;" name="qiping.gudingzichanzhi" value="${qiping.gudingzichanzhi}" oldValue="${qipingOld.gudingzichanzhi}"/>
						<label>使用单位联系电话:</label>
						<input class="ui-input"   style="width: 179px;" name="qiping.shiyongdanwei_lianxidianhua" value="${qiping.shiyongdanwei_lianxidianhua}" oldValue="${qipingOld.shiyongdanwei_lianxidianhua}"/>
						<br/>
						<label>使用单位联系人:</label>
						<input class="ui-input"   style="width: 179px;" name="qiping.shiyongdanwei_lianxiren" value="${qiping.shiyongdanwei_lianxiren}" oldValue="${qipingOld.shiyongdanwei_lianxiren}"/>
						<label>安全管理部门:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.anquanguanlibumen" value="${qiping.anquanguanlibumen}" oldValue="${qipingOld.anquanguanlibumen}"/>
					 	<br/>
					 	<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.anquanguanli_lianxidianhua" value="${qiping.anquanguanli_lianxidianhua}" oldValue="${qipingOld.anquanguanli_lianxidianhua}"/>
					    <label>安全管理人员:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.anquanguanlirenyuan" value="${qiping.anquanguanlirenyuan}" oldValue="${qipingOld.anquanguanlirenyuan}"/>
						<br/>
						<label>备注:</label>
						<input class="ui-input" style="width: 450px;" name="qiping.beizhu" value="${qiping.beizhu}" oldValue="${qipingOld.beizhu}"/>
					
					</div>
					</fieldset>
					<fieldset>
					<legend>检验信息</legend>
					<div id="jyxx_div">
					    <label class="width100">报检日期:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.shebeibaojianriqi" value="<fmt:formatDate value='${qiping.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${qipingOld.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.jianyanjieshuriqi" value="<fmt:formatDate value='${qiping.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${qipingOld.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
					    <label class="width100">下次检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.xiacijianyanriqi" value="<fmt:formatDate value='${qiping.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${qipingOld.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">检验结论:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.jianyanjielun" value="${qiping.jianyanjielun}" oldValue="${qipingOld.jianyanjielun}"/>
						<br/>
					    <label class="width100">检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.jianyanjigou" value="${qiping.jianyanjigou}" oldValue="${qipingOld.jianyanjigou}"/>
					 	<label class="width100">报告编号:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.baogaobianhao" value="${qiping.baogaobianhao}" oldValue="${qipingOld.baogaobianhao}"/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>单位信息</legend>
					<div>
						<label></label>
						<span style="color:red;">【为保证使用单位的一致性，使用单位信息只能在设备列表上修改】</span><br/>
						<label>使用单位:</label>
						<input class="ui-input"   style="width: 420px;" name="qiping.shiyongdanwei" value="${qiping.shiyongdanwei}" oldValue="${qipingOld.shiyongdanwei}" id="bjdshiyongdanwei" required="required" onfocus="this.blur()"/><br/>
						<label>单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="qiping.shiyongdanwei_dizhi" value="${qiping.shiyongdanwei_dizhi}" oldValue="${qipingOld.shiyongdanwei_dizhi}"/><br/>
						<label>组织机构代码:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.shiyongdanwei_code" value="${qiping.shiyongdanwei_code}" oldValue="${qipingOld.shiyongdanwei_code}" />
						<label>法定代表人:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.fadingdaibiaoren" value="${qiping.fadingdaibiaoren}" oldValue="${qipingOld.fadingdaibiaoren}" /><br/>
						<label>邮政编码:</label>
						<input class="ui-input"   style="width: 179px;" name="qiping.shiyongdanwei_youbian" value="${qiping.shiyongdanwei_youbian}" oldValue="${qipingOld.shiyongdanwei_youbian}"/>
						<label>操作人员:</label>
						<input class="ui-input"   style="width: 179px;" name="qiping.shiyongdanwei_caozuorenyuan" value="${qiping.shiyongdanwei_caozuorenyuan}" oldValue="${qipingOld.shiyongdanwei_caozuorenyuan}"/><br/>
						<label>主管负责人:</label>
						<input class="ui-input"   style="width: 179px;" name="qiping.zhuguanfuzeren" value="${qiping.zhuguanfuzeren}" oldValue="${qipingOld.zhuguanfuzeren}"/>
						<label>主管负责人电话:</label>
						<input class="ui-input"   style="width: 179px;" name="qiping.zhuguanfuzerendianhua" value="${qiping.zhuguanfuzerendianhua}" oldValue="${qipingOld.zhuguanfuzerendianhua}"/><br/>
						<label>所属行业:</label>
						<div id="sydw_sshy_div" class="divSlt">
							<select style="width: 195px;" sltValue="${qiping.shiyongdanwei_suoshuhangye}" name="qiping.shiyongdanwei_suoshuhangye" oldValue="${qipingOld.shiyongdanwei_suoshuhangye}" id="sydw_sshy"></select>
						</div>
						<hr/>
						
						<label>施工单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="qiping.shigongdanwei" value="${qiping.shigongdanwei}" oldValue="${qipingOld.shigongdanwei}"/><br/>
						<label>组织机构代码:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongdanwei_daima" value="${qiping.shigongdanwei_daima}" oldValue="${qipingOld.shigongdanwei_daima}"/>
						<label>法人代表:</label>	
						<input class="ui-input"   style="width: 179px;" name="boilerParam.shigongdanwei_faren" value="${qiping.shigongdanwei_faren}" oldValue="${qipingOld.shigongdanwei_faren}"/><br/>
						<label>施工日期:</label>						
						<input class="ui-input"   style="width: 179px;" name="qiping.shigongdanwei_shigongriqi" value="<fmt:formatDate value='${qiping.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${qipingOld.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>验收单位:</label>	
						<input class="ui-input"   style="width: 179px;" name="qiping.yanshoudanwei" value="${qiping.yanshoudanwei}" oldValue="${qipingOld.yanshoudanwei}"/><br/>
						<label>验收日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="qiping.yanshouriqi" value="<fmt:formatDate value='${qiping.yanshouriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${qipingOld.yanshouriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>检验机构:</label>	
						<input class="ui-input"   style="width: 179px;" name="qiping.yanshoujigou" value="${qiping.yanshoujigou}" oldValue="${qipingOld.yanshoujigou}"/><br/>
						<label>验收报告编号:</label>	
						<input class="ui-input"   style="width: 179px;" name="qiping.yanshoubaogaobianhao" value="${qiping.yanshoubaogaobianhao}" oldValue="${qipingOld.yanshoubaogaobianhao}"/><br/><hr/>
						
						<label>维保单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="qiping.weihubaoyangdanwei" value="${qiping.weihubaoyangdanwei}" oldValue="${qipingOld.weihubaoyangdanwei}"/><br/>
						<label>资格证书号:</label>						
						<input class="ui-input"   style="width: 179px" name="qiping.whbydw_zizhizhengshu" value="${qiping.whbydw_zizhizhengshu}" oldValue="${qipingOld.whbydw_zizhizhengshu}"/>
						<label>联系人:</label>						
						<input class="ui-input"   style="width: 179px" name="qiping.weihubaoyangdanwei_lianxiren" value="${qiping.weihubaoyangdanwei_lianxiren}" oldValue="${qipingOld.weihubaoyangdanwei_lianxiren}"/><br/>
						<label>联系电话:</label>						
						<input class="ui-input"   style="width: 179px" name="qiping.weihubaoyangdanwei_dianhua" value="${qiping.weihubaoyangdanwei_dianhua}" oldValue="${qipingOld.weihubaoyangdanwei_dianhua}"/>
						<label>单位代码:</label>						
						<input class="ui-input"   style="width: 179px" name="qiping.weihubaoyangdanwei_code" value="${qiping.weihubaoyangdanwei_code}" oldValue="${qipingOld.weihubaoyangdanwei_code}"/><br/>
						<label>维保周期( 周):</label>						
						<input class="ui-input"   style="width: 179px" name="qiping.weibaozhouqi" value="${qiping.weibaozhouqi}" oldValue="${qipingOld.weibaozhouqi}"/>
						<label>大修周期(月):</label>						
						<input class="ui-input"   style="width: 179px" name="qiping.daxiuzhouqi" value="${qiping.daxiuzhouqi}" oldValue="${qipingOld.daxiuzhouqi}"/><br/>
						<hr/>
						
						<label>制造单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="qiping.zhizaodanwei" value="${qiping.zhizaodanwei}" oldValue="${qipingOld.zhizaodanwei}"/><br/>
						<label>制造许可证编号:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.zhizaodanweixukezhengbianhao" value="${qiping.zhizaodanweixukezhengbianhao}" oldValue="${qipingOld.zhizaodanweixukezhengbianhao}"/>
						<label>资格证书名称:</label>						
						<input class="ui-input"   style="width: 179px" name="qiping.zhizaodanwei_zigezhengshu" value="${qiping.zhizaodanwei_zigezhengshu}" oldValue="${qipingOld.zhizaodanwei_zigezhengshu}"/><br/>
						<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.zhizaodanwei_lianxidianhua" value="${qiping.zhizaodanwei_lianxidianhua}" oldValue="${qipingOld.zhizaodanwei_lianxidianhua}"/>
						<label>使用场合:</label>						
						<input class="ui-input"   style="width: 179px" name="qiping.zhizaodanwei_shiyongchanghe" value="${qiping.zhizaodanwei_shiyongchanghe}" oldValue="${qipingOld.zhizaodanwei_shiyongchanghe}"/><br/>
						<hr/>
						<label>产权单位:</label>
						<input class="ui-input"   style="width: 420px;" name="qiping.chanquandanwei" value="${qiping.chanquandanwei}" oldValue="${qipingOld.chanquandanwei}"/><br/>
						<label>产权单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="qiping.chanquandanwei_dizhi" value="${qiping.chanquandanwei_dizhi}" oldValue="${qipingOld.chanquandanwei_dizhi}"/><br/>
						<label>产权单位代码:</label>
						<input class="ui-input"   style="width: 179px;" name="qiping.chanquandanwei_daima" value="${qiping.chanquandanwei_daima}" oldValue="${qipingOld.chanquandanwei_daima}"/>
						<label>邮政编码:</label>						
						<input class="ui-input"   style="width: 179px" name="qiping.chanquandanwei_youbian" value="${qiping.chanquandanwei_youbian}" oldValue="${qipingOld.chanquandanwei_youbian}"/><br/>
						<label>法人代表:</label>
						<input class="ui-input"   style="width: 179px;" name="qiping.chanquandanwei_farendaibiao" value="${qiping.chanquandanwei_farendaibiao}" oldValue="${qipingOld.chanquandanwei_farendaibiao}"/>
						<label>联系电话:</label>						
						<input class="ui-input"   style="width: 179px" name="qiping.chanquandanwei_dianhua" value="${qiping.chanquandanwei_dianhua}" oldValue="${qipingOld.chanquandanwei_dianhua}"/><br/>
						
						<br/>
						<hr/>
					 	<label>设计单位:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.shejidanwei" value="${qiping.shejidanwei}" oldValue="${qipingOld.shejidanwei}"/>
					 	<label>设计单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.shejidanweidaima" value="${qiping.shejidanweidaima}" oldValue="${qipingOld.shejidanweidaima}"/>
					    <br/>
					 	<hr/>
					 	<label>安装单位:</label>
						<input class="ui-input" style="width: 420px;" name="qiping.anzhuangdanwei" value="${qiping.anzhuangdanwei}" oldValue="${qipingOld.anzhuangdanwei}"/><br/>
					 	<label>安装单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.anzhuangdanwei_daima" value="${qiping.anzhuangdanwei_daima}" oldValue="${qipingOld.anzhuangdanwei_daima}"/>
					    <label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.anzhuangdanwei_lianxidianhua" value="${qiping.anzhuangdanwei_lianxidianhua}" oldValue="${qipingOld.anzhuangdanwei_lianxidianhua}"/><br/>
						<label>项目负责人:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.anzhuangdanwei_lianxiren" value="${qiping.anzhuangdanwei_lianxiren}" oldValue="${qipingOld.anzhuangdanwei_lianxiren}"/>
					    <label>资格证书编号:</label>
						<input class="ui-input" style="width: 179px;" name="qiping.anzhuangdanwei_zigezhengshu" value="${qiping.anzhuangdanwei_zigezhengshu}" oldValue="${qipingOld.anzhuangdanwei_zigezhengshu}"/><br/>
					 	<hr/>
					</div>
					</fieldset>
					<fieldset>
					<legend>设备参数</legend>
						<label>充装介质:</label>	
						<input class='ui-input' style="width: 176px;" name="qiping.chongzhuangjiezhi" value="${qiping.chongzhuangjiezhi}" oldValue="${qipingOld.chongzhuangjiezhi}"/>
						<label>公称工作压力(MPa):</label>	
						<input class='ui-input' style="width: 176px;" name="qiping.gongzuoyali" value="${qiping.gongzuoyali}" oldValue="${qipingOld.gongzuoyali}"/><br/>
						<label>容积(L):</label>	
						<input class='ui-input' style="width: 176px;" name="qiping.rongji" value="${qiping.rongji}" oldValue="${qipingOld.rongji}"/>
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
			//检验信息只读
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
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${qiping.shebeizhongleidaima}"},
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
				url:"<%=path%>/se!updateByQP.do?tjstate="+tjstate+"&address=${address}&dbid=${dbid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				//	$("#frm_app_edit_${note}").validate().form();
				//	return false;
					if(tjstate == '1'){
					//	if( !verifyCode() ){ return false;};
					}
					if($("#frm_jcsj_sb_yzc_edit").validate().form()){
						parent.showMask("正在保存......");
						return true;
					}
					return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	parent.hideMask();
	            	if(rsp.success){
	            		$.dialog.tips('<font color="blue">变更申请提交成功！</font>',3,'success.gif');
						parent.document.getElementById("${ptabsid}").contentWindow.reloadGrid();
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
		}else{
			$("#shi_div  b").hide();
			flag = true;
		}
		if(q == "" || q == null){
			$("#quxian_div  b").show();
			flag = false;
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
	</script> 
	<script src="<%=path %>/js/bs/sbxx/sbxx_file.js"></script>