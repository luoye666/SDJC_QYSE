<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ taglib prefix="c" uri="/c.tld" %>
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
width:700px;
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
#sbcs label{
	width: 120px;
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
	                	 <input type="hidden" name="craneParam.eqhide" value="${craneParam.eqhide}"/>
	                	 <input type="hidden" name="craneParam.fj_filepath" value="${craneParam.fj_filepath}"/>
	                	 <input type="hidden" name="craneParam.biaozhuleixing" value="${craneParam.biaozhuleixing}"/>
	                	 <input type="hidden" name="craneParam.banjieriqi" value="${craneParam.banjieriqi}"/>
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
					    <input class="ui-input" readonly="true" name="craneParam.shebeizhonglei" style="width: 179px;" id="yzc_shebeizhonglei" value="起重机械" oldValue="起重机械"/><br/>
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
						<label>使用登记证编号:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.dengjizhengbianhao" value="${craneParam.dengjizhengbianhao}" oldValue="${craneParamOld.dengjizhengbianhao}" readonly="true"/>
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
						<label>更新日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.biangengriqi" value="<fmt:formatDate value='${craneParam.biangengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.biangengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>填表人员:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.tianbiaorenyuan" value="${craneParam.tianbiaorenyuan}" oldValue="${craneParamOld.tianbiaorenyuan}"/>
						<label>填表日期:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.tianbiaoriqi" value="<fmt:formatDate value='${craneParam.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>安全管理部门:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.anquanguanlibumen" value="${craneParam.anquanguanlibumen}" oldValue="${craneParamOld.anquanguanlibumen}"/>
					 	<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.anquanguanli_lianxidianhua" value="${craneParam.anquanguanli_lianxidianhua}" oldValue="${craneParamOld.anquanguanli_lianxidianhua}"/>
					    <br/>
					    <label>安全管理人员:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.anquanguanlirenyuan" value="${craneParam.anquanguanlirenyuan}" oldValue="${craneParamOld.anquanguanlirenyuan}"/>
						<label>施工类别:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.shigongleibie" value="${craneParam.shigongleibie}" oldValue="${craneParamOld.shigongleibie}"/><br/>
						<label>施工告知日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.shigongdanwei_shigongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${craneParam.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/>"/>
						<label>施工竣工日期:</label>	
						<input class="ui-input"   style="width: 179px;" name="craneParam.shigongdanwei_jungongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${craneParam.shigongdanwei_jungongriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${craneParamOld.shigongdanwei_jungongriqi}' pattern='yyyy-MM-dd'/>"/><br/>
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
					    </select><br/>
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
					    </select><br/>
					     <label>是否吊运熔融金属:</label>
					    <select id="cc_dyrrjs" name="craneParam.shifou_dyrrjs" sltValue="${craneParam.shifou_dyrrjs}" oldValue="${craneParamOld.shifou_dyrrjs}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${craneParam.shifou_dyrrjs == "否" ? "selected":""}>否</option>
					    	<option value="是" ${craneParam.shifou_dyrrjs == "是" ? "selected":""}>是</option>
					    </select>
						<label>备注:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.beizhu" value="${craneParam.beizhu}" oldValue="${craneParamOld.beizhu}"/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>检验信息</legend>
					<div id="jyxx_div">
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
					    <label class="width100">检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.jianyanjigou" value="${craneParam.jianyanjigou}" oldValue="${craneParamOld.jianyanjigou}"/>
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
						<input class="ui-input"   style="width: 420px;" name="craneParam.shiyongdanwei" id="bjdshiyongdanwei" value="${craneParam.shiyongdanwei}" oldValue="${craneParamOld.shiyongdanwei}" required="required" onfocus="this.blur()"/><br/>
						<label>单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="craneParam.shiyongdanwei_dizhi" value="${craneParam.shiyongdanwei_dizhi}" oldValue="${craneParamOld.shiyongdanwei_dizhi}"/><br/>
						<label>组织机构代码:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shiyongdanwei_code" value="${craneParam.shiyongdanwei_code}" oldValue="${craneParamOld.shiyongdanwei_code}" />
						<label>法定代表人:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.fadingdaibiaoren" value="${craneParam.fadingdaibiaoren}" oldValue="${craneParamOld.fadingdaibiaoren}" /><br/>
						<label>单位性质:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shiyongdanwei_xingzhi" value="${craneParam.shiyongdanwei_xingzhi}" oldValue="${craneParamOld.shiyongdanwei_xingzhi}" />
						<label>所属行业:</label>
						<div id="sydw_sshy_div" class="divSlt">
							<select style="width: 195px;" sltValue="${craneParam.shiyongdanwei_suoshuhangye}" name="craneParam.shiyongdanwei_suoshuhangye" oldValue="${craneParamOld.shiyongdanwei_suoshuhangye}" id="sydw_sshy"></select>
						</div><br/>
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
						<input class="ui-input"   style="width: 179px;" name="craneParam.shigongdanwei_jiancheng" value="${craneParam.shigongdanwei_jiancheng}" oldValue="${craneParamOld.shigongdanwei_jiancheng}"/><br/><hr/>
						
						<label>维保单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="craneParam.weihubaoyangdanwei" value="${craneParam.weihubaoyangdanwei}" oldValue="${craneParamOld.weihubaoyangdanwei}"/><br/>
						<label>联系电话:</label>						
						<input class="ui-input"   style="width: 420px;" name="craneParam.weihubaoyangdanwei_dianhua" value="${craneParam.weihubaoyangdanwei_dianhua}" oldValue="${craneParamOld.weihubaoyangdanwei_dianhua}"/><br/><hr/>
						
						<label>制造单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="craneParam.zhizaodanwei" value="${craneParam.zhizaodanwei}" oldValue="${craneParamOld.zhizaodanwei}"/><br/>
						<label>制造许可证编号:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.zhizaodanweixukezhengbianhao" value="${craneParam.zhizaodanweixukezhengbianhao}" oldValue="${craneParamOld.zhizaodanweixukezhengbianhao}"/>
						<label>制造单位统一社会信用代码:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.zhizaodanwei_code" value="${craneParam.zhizaodanwei_code}" oldValue="${craneParamOld.zhizaodanwei_code}"/>
						<br/>
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
						<label>法人代表:</label>
						<input class="ui-input"   style="width: 179px;" name="craneParam.chanquandanwei_farendaibiao" value="${craneParam.chanquandanwei_farendaibiao}" oldValue="${craneParamOld.chanquandanwei_farendaibiao}"/><br/>
						<br/>
						<hr/>
					 	<label>设计单位:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shejidanwei" value="${craneParam.shejidanwei}" oldValue="${craneParamOld.shejidanwei}"/>
					 	<label>设计单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.shejidanweidaima" value="${craneParam.shejidanweidaima}" oldValue="${craneParamOld.shejidanweidaima}"/>
					    <br/>
						<hr/>
					 	<label>保险机构:</label>
						<input class="ui-input" style="width: 420px;" name="craneParam.baoxianjigou" value="${craneParam.baoxianjigou}" oldValue="${craneParamOld.baoxianjigou}"/><br/>
					 	<label>保险险种:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.baoxianxianzhong" value="${craneParam.baoxianxianzhong}" oldValue="${craneParamOld.baoxianxianzhong}"/>
					    <label>保险价值:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.baoxianjiazhi" value="${craneParam.baoxianjiazhi}" oldValue="${craneParamOld.baoxianjiazhi}"/>
					 	 <br/>
					 	 <label>保险费:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.baoxianfei" value="${craneParam.baoxianfei}" oldValue="${craneParamOld.baoxianfei}"/>
					    <label>保险金额:</label>
						<input class="ui-input" style="width: 179px;" name="craneParam.baoxianji" value="${craneParam.baoxianji}" oldValue="${craneParamOld.baoxianji}"/>
					 	 <br/>
					</div>
					</fieldset>
					
					<fieldset id="sbcs">
					<legend>设备参数</legend>
						<label>额定起重量(t):</label>	
						<input class='ui-input' style="width: 179px;" name="craneParam.edingqizhongliang" value="${craneParam.edingqizhongliang}" oldValue="${craneParamOld.edingqizhongliang}"/>
						<label>最大幅度起重量(t):</label>	
						<input class='ui-input' style="width: 179px;" name="craneParam.zuidafuduqizhongliang" value="${craneParam.zuidafuduqizhongliang}" oldValue="${craneParamOld.zuidafuduqizhongliang}"/><br/>
						<label>最大起重力矩(kN·m):</label>	
						<input class='ui-input' style="width: 179px;" name="craneParam.zuidaqizhongliju" value="${craneParam.zuidaqizhongliju}" oldValue="${craneParamOld.zuidaqizhongliju}"/>
						<label>跨度(m):</label>	
						<input class='ui-input' style="width: 179px;" name="craneParam.kuadu" value="${craneParam.kuadu}" oldValue="${craneParamOld.kuadu}"/></br>
						<label>起升高度(m):</label>	
						<input class='ui-input' style="width: 179px;" name="craneParam.qishenggaodu" value="${craneParam.qishenggaodu}" oldValue="${craneParamOld.qishenggaodu}"/>
						<label>起升速度(m/s):</label>
						<input class='ui-input' style="width: 179px;" name="craneParam.qishengsudu" value="${craneParam.qishengsudu}" oldValue="${craneParamOld.qishengsudu}"/><br/>
						<label>大车运行速度(m/s):</label>	
						<input class='ui-input' style="width: 179px;" name="craneParam.dacheyunxingsudu" value="${craneParam.dacheyunxingsudu}" oldValue="${craneParamOld.dacheyunxingsudu}"/>
						<label>小车运行速度(m/s):</label>	
						<input class='ui-input'  style="width: 179px;" name="craneParam.xiaocheyunxingsudu" value="${craneParam.xiaocheyunxingsudu}" oldValue="${craneParamOld.xiaocheyunxingsudu}"/><br/>
						<label>工作幅度_前伸(m):</label>	
						<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuofudu_qianshen" value="${craneParam.gongzuofudu_qianshen}" oldValue="${craneParamOld.gongzuofudu_qianshen}"/>
						<label>工作幅度_轨距(m):</label>	
						<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuofudu_guju" value="${craneParam.gongzuofudu_guju}" oldValue="${craneParamOld.gongzuofudu_guju}"/><br/>
						<label>工作幅度_后伸(m):</label>	
						<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuofudu_houshen" value="${craneParam.gongzuofudu_houshen}" oldValue="${craneParamOld.gongzuofudu_houshen}"/>
						<label>回转速度(m/s):</label>	
						<input class='ui-input'  style="width: 179px;" name="craneParam.huizhuansudu" value="${craneParam.huizhuansudu}" oldValue="${craneParamOld.huizhuansudu}"/><br/>
						<label>移动速度(m/s):</label>	
						<input class='ui-input'  style="width: 179px;" name="craneParam.yidongsudu" value="${craneParam.yidongsudu}" oldValue="${craneParamOld.yidongsudu}"/>
						<label>司机室:</label>	
						<s:select name="craneParam.sijishi" list="#{'0':'否','1':'是'}" value="craneParam.sijishi" sltValue="${craneParam.sijishi}" oldValue="${craneParamOld.sijishi}" style="width: 179px;" id="sijishi"></s:select>
						
						<label>整机制造标准:</label>	
						<input class='ui-input'  style="width: 179px;" name="craneParam.zhizaobiaozhun" value="${craneParam.zhizaobiaozhun}" oldValue="${craneParamOld.zhizaobiaozhun}"/>
						<label>型式试验机构:</label>	
						<input class='ui-input'  style="width: 179px;" name="craneParam.shiyanjigou" value="${craneParam.shiyanjigou}" oldValue="${craneParamOld.shiyanjigou}"/><br/>
						<label>型式试验日期:</label>	
						<input class="ui-input" style="width: 179px;" name="craneParam.shiyanriqi" value="${craneParam.shiyanriqi}" oldValue="${craneParamOld.shiyanriqi}" onclick="WdatePicker()" />
						<label>型式试验证书编号:</label>	
						<input class='ui-input'  style="width: 179px;" name="craneParam.shiyanzhengshubianhao" value="${craneParam.shiyanzhengshubianhao}" oldValue="${craneParamOld.shiyanzhengshubianhao}"/><br/>
						<c:if test="${craneParam.shebeileibiedaima == '4200'}">
							<label>下降深度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.xiajiangshendu" value="${craneParam.xiajiangshendu}" oldValue="${craneParamOld.xiajiangshendu}"/>
							<label>主钩左右极限位置（m）:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhugouzuoyouweizhi" value="${craneParam.zhugouzuoyouweizhi}" oldValue="${craneParamOld.zhugouzuoyouweizhi}"/><br/>
							<label>整机功率(kW):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengjigonglv" value="${craneParam.zhengjigonglv}" oldValue="${craneParamOld.zhengjigonglv}"/>
							<label>最大计算轮压(kN):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zuidalunya" value="${craneParam.zuidalunya}" oldValue="${craneParamOld.zuidalunya}"/><br/>
							<label>供电电源  (V HZ):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongdiandianyuan" value="${craneParam.gongdiandianyuan}" oldValue="${craneParamOld.gongdiandianyuan}"/>
							<label>有效悬臂长(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.xuanbichangdu" value="${craneParam.xuanbichangdu}" oldValue="${craneParamOld.xuanbichangdu}"/><br/>
							<label>整机设计重量:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengchezhongliang" value="${craneParam.zhengchezhongliang}" oldValue="${craneParamOld.zhengchezhongliang}"/>
							<label>整机工作级别:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuojibie" value="${craneParam.gongzuojibie}" oldValue="${craneParamOld.gongzuojibie}"/><br/>
							<label>工作环境温度:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuowendu" value="${craneParam.gongzuowendu}" oldValue="${craneParamOld.gongzuowendu}"/>
							<label>使用场所:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.shiyongchangsuo" value="${craneParam.shiyongchangsuo}" oldValue="${craneParamOld.shiyongchangsuo}"/><br/>
							<label>主梁型式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhuliangxingshi" value="${craneParam.zhuliangxingshi}" oldValue="${craneParamOld.zhuliangxingshi}"/>
							<label>支腿型式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhituixingshi" value="${craneParam.zhituixingshi}" oldValue="${craneParamOld.zhituixingshi}"/><br/>
							<label>主要受力结构件材料:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.shoulijiegoucailiao" value="${craneParam.shoulijiegoucailiao}" oldValue="${craneParamOld.shoulijiegoucailiao}"/><br/>
						</c:if>
						
						<c:if test="${craneParam.shebeileibiedaima == '4300'}">
							<label>额定起重力矩(t•m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.edingqizhongliju" value="${craneParam.edingqizhongliju}" oldValue="${craneParamOld.edingqizhongliju}"/>
							<label>整机工作级别:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuojibie" value="${craneParam.gongzuojibie}" oldValue="${craneParamOld.gongzuojibie}"/><br/>
							
							<label>最大计算轮压(kN):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zuidalunya" value="${craneParam.zuidalunya}" oldValue="${craneParamOld.zuidalunya}"/><br/>
							<label>最小工作幅度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuofudu" value="${craneParam.gongzuofudu}" oldValue="${craneParamOld.gongzuofudu}"/>
							<label>最大工作幅度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zuidagongzuofudu" value="${craneParam.zuidagongzuofudu}" oldValue="${craneParamOld.zuidagongzuofudu}"/><br/>
							
							
							<label>供电电源  (V HZ):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongdiandianyuan" value="${craneParam.gongdiandianyuan}" oldValue="${craneParamOld.gongdiandianyuan}"/>
							<label>最小工作幅度起重量(t):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zuixiaofuduqizhongliang" value="${craneParam.zuixiaofuduqizhongliang}" oldValue="${craneParamOld.zuixiaofuduqizhongliang}"/><br/>
							<label>独立高度:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.duligaodu" value="${craneParam.duligaodu}" oldValue="${craneParamOld.duligaodu}"/>
							<label>最大附着高度:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zuidafuzhuogaodu" value="${craneParam.zuidafuzhuogaodu}" oldValue="${craneParamOld.zuidafuzhuogaodu}"/><br/>
							<label>整机设计重量:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengchezhongliang" value="${craneParam.zhengchezhongliang}" oldValue="${craneParamOld.zhengchezhongliang}"/>
							<label>运行轨距:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.yunxingguiji" value="${craneParam.yunxingguiji}" oldValue="${craneParamOld.yunxingguiji}"/><br/>
							<label>整机功率:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengjigonglv" value="${craneParam.zhengjigonglv}" oldValue="${craneParamOld.zhengjigonglv}"/>
							<label>工作环境温度:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuowendu" value="${craneParam.gongzuowendu}" oldValue="${craneParamOld.gongzuowendu}"/><br/>
							<label>主体结构型式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhuliangxingshi" value="${craneParam.zhuliangxingshi}" oldValue="${craneParamOld.zhuliangxingshi}"/>
							<label>变幅方式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.bianfufangshi" value="${craneParam.bianfufangshi}" oldValue="${craneParamOld.bianfufangshi}"/><br/>
							<label>塔身标准节型式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.biaozhunxingshi" value="${craneParam.biaozhunxingshi}" oldValue="${craneParamOld.biaozhunxingshi}"/>
							<label>基座型式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.jizuoxingshi" value="${craneParam.jizuoxingshi}" oldValue="${craneParamOld.jizuoxingshi}"/><br/>
							<label>主要受力结构件材料:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.shoulijiegoucailiao" value="${craneParam.shoulijiegoucailiao}" oldValue="${craneParamOld.shoulijiegoucailiao}"/><br/>
						</c:if>
						
						<c:if test="${craneParam.shebeileibiedaima == '4400'}">
							<label>额定起重力矩(t•m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.edingqizhongliju" value="${craneParam.edingqizhongliju}" oldValue="${craneParamOld.edingqizhongliju}"/>
							<label>整机工作级别:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuojibie" value="${craneParam.gongzuojibie}" oldValue="${craneParamOld.gongzuojibie}"/><br/>
							<label>最小工作幅度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuofudu" value="${craneParam.gongzuofudu}" oldValue="${craneParamOld.gongzuofudu}"/>
							<label>最大工作幅度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zuidagongzuofudu" value="${craneParam.zuidagongzuofudu}" oldValue="${craneParamOld.zuidagongzuofudu}"/><br/>
							<label>全程变幅时间(s):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.bianfushijian" value="${craneParam.bianfushijian}" oldValue="${craneParamOld.bianfushijian}"/>
							<label>最小工作幅度起重量(t):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zuixiaofuduqizhongliang" value="${craneParam.zuixiaofuduqizhongliang}" oldValue="${craneParamOld.zuixiaofuduqizhongliang}"/><br/>
							<label>行走机械轨距(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.jixieguiju" value="${craneParam.jixieguiju}" oldValue="${craneParamOld.jixieguiju}"/>
							<label>行驶速度(m/min):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.xingshisudu" value="${craneParam.xingshisudu}" oldValue="${craneParamOld.xingshisudu}"/><br/>
							<label>整机设计重量:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengchezhongliang" value="${craneParam.zhengchezhongliang}" oldValue="${craneParamOld.zhengchezhongliang}"/>
							<label>支腿调节长度(mm):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhituichangdu" value="${craneParam.zhituichangdu}" oldValue="${craneParamOld.zhituichangdu}"/><br/>
							<label>整机功率(kW):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengjigonglv" value="${craneParam.zhengjigonglv}" oldValue="${craneParamOld.zhengjigonglv}"/>
							<label>工作环境温度(℃):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuowendu" value="${craneParam.gongzuowendu}" oldValue="${craneParamOld.gongzuowendu}"/><br/>
							<label>最大计算轮压(kN):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zuidalunya" value="${craneParam.zuidalunya}" oldValue="${craneParamOld.zuidalunya}"/>
							<label>发动机型号/ VIN代号/编号:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.fadongjibianhao" value="${craneParam.fadongjibianhao}" oldValue="${craneParamOld.fadongjibianhao}"/><br/>
							<label>臂架型式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.bijiaxingshi" value="${craneParam.bijiaxingshi}" oldValue="${craneParamOld.bijiaxingshi}"/>
							<label>主要受力结构件材料:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.shoulijiegoucailiao" value="${craneParam.shoulijiegoucailiao}" oldValue="${craneParamOld.shoulijiegoucailiao}"/><br/>
						</c:if>
						
						<c:if test="${craneParam.shebeileibiedaima == '4700'}">
							<label>额定起重力矩(t•m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.edingqizhongliju" value="${craneParam.edingqizhongliju}" oldValue="${craneParamOld.edingqizhongliju}"/>
							<label>整机工作级别:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuojibie" value="${craneParam.gongzuojibie}" oldValue="${craneParamOld.gongzuojibie}"/><br/>
							<label>最小工作幅度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuofudu" value="${craneParam.gongzuofudu}" oldValue="${craneParamOld.gongzuofudu}"/>
							<label>最大工作幅度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zuidagongzuofudu" value="${craneParam.zuidagongzuofudu}" oldValue="${craneParamOld.zuidagongzuofudu}"/><br/>
							<label>全程变幅时间(s):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.bianfushijian" value="${craneParam.bianfushijian}" oldValue="${craneParamOld.bianfushijian}"/>
							<label>最小工作幅度起重量(t):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zuixiaofuduqizhongliang" value="${craneParam.zuixiaofuduqizhongliang}" oldValue="${craneParamOld.zuixiaofuduqizhongliang}"/><br/>
							<label>行走机械轨距(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.jixieguiju" value="${craneParam.jixieguiju}" oldValue="${craneParamOld.jixieguiju}"/>
							<label>整机最大高度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zuidagaodu" value="${craneParam.zuidagaodu}" oldValue="${craneParamOld.zuidagaodu}"/><br/>
							<label>整机设计重量:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengchezhongliang" value="${craneParam.zhengchezhongliang}" oldValue="${craneParamOld.zhengchezhongliang}"/>
							<label>支腿调节长度(mm):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhituichangdu" value="${craneParam.zhituichangdu}" oldValue="${craneParamOld.zhituichangdu}"/><br/>
							<label>整机功率(kW):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengjigonglv" value="${craneParam.zhengjigonglv}" oldValue="${craneParamOld.zhengjigonglv}"/>
							<label>工作环境温度(℃):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuowendu" value="${craneParam.gongzuowendu}" oldValue="${craneParamOld.gongzuowendu}"/><br/>
							<label>最大计算轮压(kN):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zuidalunya" value="${craneParam.zuidalunya}" oldValue="${craneParamOld.zuidalunya}"/>
							<label>起升高度(轨上):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.qishenggaodu_shang" value="${craneParam.qishenggaodu_shang}" oldValue="${craneParamOld.qishenggaodu_shang}"/><br/>
							<label>起升高度(轨下):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.qishenggaodu_xia" value="${craneParam.qishenggaodu_xia}" oldValue="${craneParamOld.qishenggaodu_xia}"/>
							<label>供电电源  (V HZ):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongdiandianyuan" value="${craneParam.gongdiandianyuan}" oldValue="${craneParamOld.gongdiandianyuan}"/><br/>
							<label>用  途:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.yongtu" value="${craneParam.yongtu}" oldValue="${craneParamOld.yongtu}"/>
							<label>臂架结构型式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.bijiaxingshi" value="${craneParam.bijiaxingshi}" oldValue="${craneParamOld.bijiaxingshi}"/><br/>
							<label>门架结构型式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.menjiajiegouxingshi" value="${craneParam.menjiajiegouxingshi}" oldValue="${craneParamOld.menjiajiegouxingshi}"/>
							<label>回转支承型式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.huizhuanzhichengxingshi" value="${craneParam.huizhuanzhichengxingshi}" oldValue="${craneParamOld.zuixiaofuduqizhongliang}"/><br/>
							<label>主要受力结构件材料:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.shoulijiegoucailiao" value="${craneParam.shoulijiegoucailiao}" oldValue="${craneParamOld.shoulijiegoucailiao}"/><br/>
						</c:if>
						
						<c:if test="${craneParam.shebeileibiedaima == '4800'}">
							<label>吊笼数量:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.diaolongshuliang" value="${craneParam.diaolongshuliang}" oldValue="${craneParamOld.zuixiaofuduqizhongliang}"/>
							<label>整机工作级别:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuojibie" value="${craneParam.gongzuojibie}" oldValue="${craneParamOld.gongzuojibie}"/><br/>
							<label>额定速度:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.yunxingsudu" value="${craneParam.yunxingsudu}" oldValue="${craneParamOld.yunxingsudu}"/>
							<label>自由端高度:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.ziyouduangaodu" value="${craneParam.ziyouduangaodu}" oldValue="${craneParamOld.ziyouduangaodu}"/><br/>
							<label>吊笼工作行程(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.diaolonggongzuoxingcheng" value="${craneParam.diaolonggongzuoxingcheng}" oldValue="${craneParamOld.diaolonggongzuoxingcheng}"/>
							<label>整机设计重量:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengchezhongliang" value="${craneParam.zhengchezhongliang}" oldValue="${craneParamOld.zhengchezhongliang}"/><br/>
							<label>吊笼尺寸(长×宽×高)(mm):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.diaolongchicun" value="${craneParam.diaolongchicun}" oldValue="${craneParamOld.diaolongchicun}"/>
							<label>整机功率(kW):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengjigonglv" value="${craneParam.zhengjigonglv}" oldValue="${craneParamOld.zhengjigonglv}"/><br/>
							<label>工作环境温度(℃):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuowendu" value="${craneParam.gongzuowendu}" oldValue="${craneParamOld.gongzuowendu}"/>
							<label>标准节尺寸(长×宽×高)(mm):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.biaozhunjiechicun" value="${craneParam.biaozhunjiechicun}" oldValue="${craneParamOld.biaozhunjiechicun}"/><br/>
							<label>供电电源  (V HZ):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongdiandianyuan" value="${craneParam.gongdiandianyuan}" oldValue="${craneParamOld.gongdiandianyuan}"/>
							<label>用  途:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.yongtu" value="${craneParam.yongtu}" oldValue="${craneParamOld.yongtu}"/><br/>
							<label>操纵方式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.caozongfangshi" value="${craneParam.caozongfangshi}" oldValue="${craneParamOld.caozongfangshi}"/>
							<label>驱动机构型式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.qudongxingshi" value="${craneParam.qudongxingshi}" oldValue="${craneParamOld.qudongxingshi}"/><br/>
							<label>导 轨 架:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.daoguijia" value="${craneParam.daoguijia}" oldValue="${craneParamOld.daoguijia}"/>
							<label>标准节加节方式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.biaozhunjiefangshi" value="${craneParam.biaozhunjiefangshi}" oldValue="${craneParamOld.biaozhunjiefangshi}"/><br/>
							<label>主要受力结构件材料:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.shoulijiegoucailiao" value="${craneParam.shoulijiegoucailiao}" oldValue="${craneParamOld.shoulijiegoucailiao}"/><br/>
						</c:if>
						
						<c:if test="${craneParam.shebeileibiedaima == '4900'}">
							<label>整机工作级别:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuojibie" value="${craneParam.gongzuojibie}" oldValue="${craneParamOld.gongzuojibie}"/>
							<label>幅  度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuofudu" value="${craneParam.gongzuofudu}" oldValue="${craneParamOld.gongzuofudu}"/><br/>
							<label>吊具最高高度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.diaojuzuigaogaodu" value="${craneParam.diaojuzuigaogaodu}" oldValue="${craneParamOld.diaojuzuigaogaodu}"/>
							<label>承载索垂度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.chengzaisuochuidu" value="${craneParam.chengzaisuochuidu}" oldValue="${craneParamOld.chengzaisuochuidu}"/><br/>
							<label>整机设计重量(t):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengchezhongliang" value="${craneParam.zhengchezhongliang}" oldValue="${craneParamOld.zhengchezhongliang}"/>
							<label>吊具最低高度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.diaojuzuidigaodu" value="${craneParam.diaojuzuidigaodu}" oldValue="${craneParamOld.diaojuzuidigaodu}"/><br/>
							<label>整机功率(kW):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengjigonglv" value="${craneParam.zhengjigonglv}" oldValue="${craneParamOld.zhengjigonglv}"/>
							<label>工作环境温度(℃):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuowendu" value="${craneParam.gongzuowendu}" oldValue="${craneParamOld.gongzuowendu}"/><br/>
							<label>供电电源  (V HZ):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongdiandianyuan" value="${craneParam.gongdiandianyuan}" oldValue="${craneParamOld.gongdiandianyuan}"/>
							<label>承载索型号:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.chengzaisuoxinghao" value="${craneParam.chengzaisuoxinghao}" oldValue="${craneParamOld.chengzaisuoxinghao}"/><br/>
							<label>牵引索型号:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.qianyinsuoxinghao" value="${craneParam.qianyinsuoxinghao}" oldValue="${craneParamOld.qianyinsuoxinghao}"/>
							<label>安装高程(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.anzhuanggaocheng" value="${craneParam.anzhuanggaocheng}" oldValue="${craneParamOld.anzhuanggaocheng}"/><br/>
							<label>垂跨比(%):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.chuikuabi" value="${craneParam.chuikuabi}" oldValue="${craneParamOld.chuikuabi}"/>
							<label>回转范围:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.huizhuanfanwei" value="${craneParam.huizhuanfanwei}" oldValue="${craneParamOld.huizhuanfanwei}"/><br/>
							<label>其它:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.qita" value="${craneParam.qita}" oldValue="${craneParamOld.qita}"/>
							<label>主体结构型式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhutijiegouxingshi" value="${craneParam.zhutijiegouxingshi}" oldValue="${craneParamOld.zhutijiegouxingshi}"/><br/>
							<label>主要受力结构件材料:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.shoulijiegoucailiao" value="${craneParam.shoulijiegoucailiao}" oldValue="${craneParamOld.shoulijiegoucailiao}"/><br/>
						</c:if>
						
						<c:if test="${craneParam.shebeileibiedaima == '4A00'}">
							<label>主钩最大额定起重量(t):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhugouzuidaliang" value="${craneParam.zhugouzuidaliang}" oldValue="${craneParamOld.zhugouzuidaliang}"/>
							<label>副钩最大额定起重量(t):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.fugouzuidaliang" value="${craneParam.fugouzuidaliang}" oldValue="${craneParamOld.fugouzuidaliang}"/><br/>
							<label>主钩最大工作幅度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhugouzuidafudu" value="${craneParam.zhugouzuidafudu}" oldValue="${craneParamOld.zhugouzuidafudu}"/>
							<label>副钩最大工作幅度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.fugouzuidafudu" value="${craneParam.fugouzuidafudu}" oldValue="${craneParamOld.fugouzuidafudu}"/><br/>
							<label>主钩最大工作幅度时的额定起重量(t):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhugouzuidafuduliang" value="${craneParam.zhugouzuidafuduliang}" oldValue="${craneParamOld.zhugouzuidafuduliang}"/>
							<label>副钩最大工作幅度时的额定起重量(t):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.fugouzuidafuduliang" value="${craneParam.fugouzuidafuduliang}" oldValue="${craneParamOld.fugouzuidafuduliang}"/><br/>
							<label>主钩最大起升高度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhugouzuidagaodu" value="${craneParam.zhugouzuidagaodu}" oldValue="${craneParamOld.zhugouzuidagaodu}"/>
							<label>副钩最大起升高度(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.fugouzuidagaodu" value="${craneParam.fugouzuidagaodu}" oldValue="${craneParamOld.fugouzuidagaodu}"/><br/>
							<label>主钩起升速度(m/min):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhugouqishengsudu" value="${craneParam.zhugouqishengsudu}" oldValue="${craneParamOld.zhugouqishengsudu}"/>
							<label>副钩起升速度(m/min):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.fugouqishengsudu" value="${craneParam.fugouqishengsudu}" oldValue="${craneParamOld.fugouqishengsudu}"/><br/>
							<label>回转角度(°):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.huizhuanjiaodu" value="${craneParam.huizhuanjiaodu}" oldValue="${craneParamOld.huizhuanjiaodu}"/>
							<label>行走范围(m):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.xingzoufanwei" value="${craneParam.xingzoufanwei}" oldValue="${craneParamOld.xingzoufanwei}"/><br/>
							<label>行走速度(m/min):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.xingzousudu" value="${craneParam.xingzousudu}" oldValue="${craneParamOld.xingzousudu}"/>
							<label>主调速方式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhutiaosufengshi" value="${craneParam.zhutiaosufengshi}" oldValue="${craneParamOld.zhutiaosufengshi}"/><br/>
							<label>整机功率(kW):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengjigonglv" value="${craneParam.zhengjigonglv}" oldValue="${craneParamOld.zhengjigonglv}"/>
							<label>工作环境温度(℃):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuowendu" value="${craneParam.gongzuowendu}" oldValue="${craneParamOld.gongzuowendu}"/><br/>
							<label>供电电源  (V HZ):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongdiandianyuan" value="${craneParam.gongdiandianyuan}" oldValue="${craneParamOld.gongdiandianyuan}"/>
							<label>整机设计重量(t):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengchezhongliang" value="${craneParam.zhengchezhongliang}" oldValue="${craneParamOld.zhengchezhongliang}"/><br/>
							<label>整机工作级别:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuojibie" value="${craneParam.gongzuojibie}" oldValue="${craneParamOld.gongzuojibie}"/>
							<label>其它:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.qita" value="${craneParam.qita}" oldValue="${craneParamOld.qita}"/><br/>
							<label>主体结构型式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhutijiegouxingshi" value="${craneParam.zhutijiegouxingshi}" oldValue="${craneParamOld.zhutijiegouxingshi}"/>
							<label>主要受力结构件材料:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.shoulijiegoucailiao" value="${craneParam.shoulijiegoucailiao}" oldValue="${craneParamOld.shoulijiegoucailiao}"/><br/>
						</c:if>
						
						<c:if test="${craneParam.shebeileibiedaima == '4D00'}">
							<label>层  数:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.cengshu" value="${craneParam.cengshu}" oldValue="${craneParamOld.cengshu}"/>
							<label>存容量:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.cuncherongliang" value="${craneParam.cuncherongliang}" oldValue="${craneParamOld.cuncherongliang}"/><br/>
							<label>适停车辆质量(kg):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.shitingcheliangzhongliang" value="${craneParam.shitingcheliangzhongliang}" oldValue="${craneParamOld.shitingcheliangzhongliang}"/>
							<label>起升驱动方式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.qudong" value="${craneParam.qudong}" oldValue="${craneParamOld.qudong}"/><br/>
							<label>适停车辆尺寸(长×宽×高):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.shitingcheliangchicun" value="${craneParam.shitingcheliangchicun}" oldValue="${craneParamOld.shitingcheliangchicun}"/>
							<label>额定升降速度(m/min):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.edingshengjiangsudu" value="${craneParam.edingshengjiangsudu}" oldValue="${craneParamOld.edingshengjiangsudu}"/><br/>
							<label>额定横移速度(m/min):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.edinghengyisudu" value="${craneParam.edinghengyisudu}" oldValue="${craneParamOld.edinghengyisudu}"/>
							<label>单车最大进(出)车时间(s):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.danchezuidajinchushijian" value="${craneParam.danchezuidajinchushijian}" oldValue="${craneParamOld.danchezuidajinchushijian}"/><br/>
							<label>层高(mm):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.cenggao" value="${craneParam.cenggao}" oldValue="${craneParamOld.cenggao}"/>
							<label>整机功率(kW):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengjigonglv" value="${craneParam.zhengjigonglv}" oldValue="${craneParamOld.zhengjigonglv}"/><br/>
							<label>工作环境温度(℃):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongzuowendu" value="${craneParam.gongzuowendu}" oldValue="${craneParamOld.gongzuowendu}"/>
							<label>供电电源  (V HZ):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.gongdiandianyuan" value="${craneParam.gongdiandianyuan}" oldValue="${craneParamOld.gongdiandianyuan}"/><br/>
							<label>整机设计重量(t):</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.zhengchezhongliang" value="${craneParam.zhengchezhongliang}" oldValue="${craneParamOld.zhengchezhongliang}"/>
							<label>操作方式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.caozongfangshi" value="${craneParam.caozongfangshi}" oldValue="${craneParamOld.caozongfangshi}"/><br/>
							<label>其它:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.qita" value="${craneParam.qita}" oldValue="${craneParamOld.qita}"/>
							<label>起升方式:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.qishengfangshi" value="${craneParam.qishengfangshi}" oldValue="${craneParamOld.qishengfangshi}"/><br/>
							<label>主要受力结构件材料:</label>	
							<input class='ui-input'  style="width: 179px;" name="craneParam.shoulijiegoucailiao" value="${craneParam.shoulijiegoucailiao}" oldValue="${craneParamOld.shoulijiegoucailiao}"/><br/>
						</c:if>
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
			$("#sijishi").selectmenu();
			$("#cc_zdwxy").selectmenu();
			$("#cc_zdjk").selectmenu();
			$("#cc_jyya").selectmenu();
			$("#cc_rkmjq").selectmenu();
			$("#cc_dyrrjs").selectmenu();
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