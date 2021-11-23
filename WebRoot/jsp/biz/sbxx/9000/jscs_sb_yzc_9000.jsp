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
	                	 <input type="hidden" name="cable.id" value="${cable.id}" id="cid"/>
	                	 <input type="hidden" name="cable.zcstatus" value="${cable.zcstatus}" id="status"/>
	                	 <input type="hidden" name="cable.shebeizhongleidaima" value="${cable.shebeizhongleidaima}"/>
	                	 <input type="hidden" name="cable.shiyongdanweiId" value="${cable.shiyongdanweiId}"/>
	                	 <input type="hidden" name="cable.shigongdanweiId" value="${cable.shigongdanweiId}"/>
	                	 <input type="hidden" name="cable.state" value="${cable.state}"/>
	                	 <input type="hidden" name="cable.flag" value="${cable.flag}"/>
	                	 <input type="hidden" name="cable.eqhide" value="${cable.eqhide}"/>
	                	 <input type="hidden" name="cable.fj_filepath" value="${cable.fj_filepath}"/>
	                	 <input type="hidden" name="cable.biaozhuleixing" value="${cable.biaozhuleixing}"/>
	                	 <input type="hidden" name="cable.banjieriqi" value="${cable.banjieriqi}"/>
		            	<input type="hidden" name="cable.pid" value="${cable.pid}" id="pid"/>
						<input type="hidden" value="${cable.tmpData}" name="cable.tmpData" />
	                	 <input type="hidden" name="cable.jingdu" value="${cable.jingdu}"/>
	                	 <input type="hidden" name="cable.weidu" value="${cable.weidu}"/>
		            	<input type="hidden" name="cable.dj_jingbanriqi" value="${cable.dj_jingbanriqi}"/>
		            	<input type="hidden" name="cable.djb_id" value="${cable.djb_id}"/>
		            	<input type="hidden" name="cable.yjyy" value="${cable.yjyy}"/>
                	</div>
					<fieldset>
					<legend>基本信息</legend>
					<div>
					    <label>设备名称:</label>
						<input class="ui-input" style="width: 179px;" name="cable.shebeimingcheng" value="${cable.shebeimingcheng }" oldValue="${cableOld.shebeimingcheng}" id="mingcheng"></select>
					    <label>设备种类:</label>
					    <input class="ui-input" readonly="true" name="cable.shebeizhonglei" style="width: 179px;" id="yzc_shebeizhonglei" value="客运索道" oldValue="客运索道"/><br/>
					    <label>设备类别:</label>
					    	<div id="yzc_shebeileibie_div" class="divSlt">
	        					<select name="cable.shebeileibiedaima" sltValue="${cable.shebeileibiedaima}" oldValue="${cableOld.shebeileibiedaima}" style="width: 195px;" id="yzc_shebeileibie"></select>
					    	</div>
					    <label>设备品种:</label>
					    	<div id="yzc_shebeipinzhong_div" class="divSlt">
	        					<select name="cable.shenbeipinzhongdaima" sltValue="${cable.shenbeipinzhongdaima}" oldValue="${cableOld.shenbeipinzhongdaima}" style="width: 195px;" id="yzc_shebeipinzhong"></select>
					    	</div>
					    	<br/>
					    <label>设备代码:</label>
						<input class="ui-input" style="width: 179px;" name="cable.shebeidaima" value="${cable.shebeidaima}" oldValue="${cableOld.shebeidaima}"/>
					    <label>型号规格:</label>
						<input class="ui-input" style="width: 179px;" name="cable.shebeixinghao" value="${cable.shebeixinghao}" oldValue="${cableOld.shebeixinghao}"/><br/>
						<label>制造日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="cable.zhizaoriqi_date" value="<fmt:formatDate value='${cable.zhizaoriqi_date}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${cableOld.zhizaoriqi_date}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>制造日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="cable.zhizaoriqi" value="${cable.zhizaoriqi}" oldValue="${cableOld.zhizaoriqi}"/><br/>
						<label>投用日期(日期):</label>
						<input class="ui-input" style="width: 179px;" name="cable.touyongriqi_date" value="<fmt:formatDate value='${cable.touyongriqi_date}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${cableOld.touyongriqi_date}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<label>投用日期(文本):</label>
						<input class="ui-input" style="width: 179px;" name="cable.touyongriqi" value="${cable.touyongriqi}" oldValue="${cableOld.touyongriqi}"/><br/>
					    <label>安装竣工日期:</label>
						<input class="ui-input" style="width: 179px;" name="cable.anzhuangriqi" value="<fmt:formatDate value='${cable.anzhuangriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${cableOld.anzhuangriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label>出厂编号:</label>
						<input class="ui-input" style="width: 179px;" name="cable.chuchangbianhao" value="${cable.chuchangbianhao}" oldValue="${cableOld.chuchangbianhao}"/><br/>
						<label>设备注册代码:</label>
						<input class="ui-input" style="width: 179px;background-color:#E0E0E0" readonly="true" name="cable.zhucedaima" value="${cable.zhucedaima}" oldValue="${cable.zhucedaima}" id="zcdm"/>
					    <label>设备注册日期:</label>
						<input class="ui-input" style="width: 179px;" name="cable.zhuceriqi" value="<fmt:formatDate value='${cable.zhuceriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${cableOld.zhuceriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>使用登记证编号:</label>
						<input class="ui-input" style="width: 179px;" name="cable.dengjizhengbianhao" value="${cable.dengjizhengbianhao}" oldValue="${cableOld.dengjizhengbianhao}" readonly="true"/>
					    <label>发证日期:</label>
						<input class="ui-input" style="width: 179px;" name="cable.fazhengriqi" value="<fmt:formatDate value='${cable.fazhengriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${cableOld.fazhengriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/><br/>
						<label>内部编号:</label>
						<input class="ui-input" style="width: 179px;" name="cable.neibubianhao" value="${cable.neibubianhao}" oldValue="${cableOld.neibubianhao}"/>
					    <label>设备地点:</label>
						<input class="ui-input" style="width: 179px;" name="cable.shebeididian" value="${cable.shebeididian}" oldValue="${cableOld.shebeididian}"/><br/>
						<label>市:</label>
							<div id="shi_div" class="divSlt">
	        					<select name="cable.shidaima" sltValue="${cable.shidaima}" oldValue="${cableOld.shidaima}" style="width: 195px;" id="shi"></select>
							</div>
						<label>区划名称:</label>
							<div id="quxian_div" class="divSlt">
	        					<select name="cable.quhuadaima" sltValue="${cable.quhuadaima}" oldValue="${cableOld.quhuadaima}" style="width: 195px;" id="quxian"></select>
							</div>
							<br/>
						<label>乡镇:</label>
							<div id="xiangzhen_div" class="divSlt">
	        					<select name="cable.xiangzhendaima" sltValue="${cable.xiangzhendaima}" oldValue="${cableOld.xiangzhendaima}" style="width: 195px;" id="xiangzhen"></select>
							</div>
					    <label>是否市直:</label>
						<s:select name="cable.szstatus" list="#{'0':'否','1':'是'}" value="cable.szstatus" sltValue="${cable.szstatus}" oldValue="${cableOld.szstatus}" style="width: 195px;" id="shizhi"></s:select>
						<br/>
						<label>使用单位联系电话:</label>
						<input class="ui-input"   style="width: 179px;" name="cable.shiyongdanwei_lianxidianhua" value="${cable.shiyongdanwei_lianxidianhua}" oldValue="${cableOld.shiyongdanwei_lianxidianhua}"/>
						<label>使用单位联系人:</label>
						<input class="ui-input"   style="width: 179px;" name="cable.shiyongdanwei_lianxiren" value="${cable.shiyongdanwei_lianxiren}" oldValue="${cableOld.shiyongdanwei_lianxiren}"/><br/>
					 	<label>安全管理部门:</label>
						<input class="ui-input" style="width: 179px;" name="cable.anquanguanlibumen" value="${cable.anquanguanlibumen}" oldValue="${cableOld.anquanguanlibumen}"/>
					 	<label>联系电话:</label>
						<input class="ui-input" style="width: 179px;" name="cable.anquanguanli_lianxidianhua" value="${cable.anquanguanli_lianxidianhua}" oldValue="${cableOld.anquanguanli_lianxidianhua}"/>
					    <br/>
					    <label>安全管理人员:</label>
						<input class="ui-input" style="width: 179px;" name="cable.anquanguanlirenyuan" value="${cable.anquanguanlirenyuan}" oldValue="${cableOld.anquanguanlirenyuan}"/>
					 	<label>是否重大危险源:</label>
					    <select id="cc_zdwxy" name="cable.shifou_zhongdaweixianyuan" sltValue="${cable.shifou_zhongdaweixianyuan}" oldValue="${cableOld.shifou_zhongdaweixianyuan}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${cable.shifou_zhongdaweixianyuan == "否" ? "selected":""}>否</option>
					    	<option value="是" ${cable.shifou_zhongdaweixianyuan == "是" ? "selected":""}>是</option>
					    </select> <br/>
					    <label>是否重点监控特种设备:</label>
					    <select id="cc_zdjk" name="cable.shifou_zhongdianjiankong" sltValue="${cable.shifou_zhongdianjiankong}" oldValue="${cableOld.shifou_zhongdianjiankong}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${cable.shifou_zhongdianjiankong == "否" ? "selected":""}>否</option>
					    	<option value="是" ${cable.shifou_zhongdianjiankong == "是" ? "selected":""}>是</option>
					    </select>
					    <label>是否制定事故应急措施和救援预案:</label>
					    <select id="cc_jyya" name="cable.shifou_yingjifangan" sltValue="${cable.shifou_yingjifangan}" oldValue="${cableOld.shifou_yingjifangan}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${cable.shifou_yingjifangan == "否" ? "selected":""}>否</option>
					    	<option value="是" ${cable.shifou_yingjifangan == "是" ? "selected":""}>是</option>
					    </select> <br/>
					    <label>是否在人口密集区:</label>
					    <select id="cc_rkmjq" name="cable.shifou_renkoumijiqu" sltValue="${cable.shifou_renkoumijiqu}" oldValue="${cableOld.shifou_renkoumijiqu}" style="width: 195px;">
					    	<option value=""></option>
					    	<option value="否" ${cable.shifou_renkoumijiqu == "否" ? "selected":""}>否</option>
					    	<option value="是" ${cable.shifou_renkoumijiqu == "是" ? "selected":""}>是</option>
					    </select>
						
					 </div>
					</fieldset>
					<fieldset>
					<legend>检验信息</legend>
					<div id="jyxx_div">
					    <label class="width100">在线报检日期:</label>
						<input class="ui-input" style="width: 179px;" name="cable.zx_baojianriqi" value="<fmt:formatDate value='${cable.zx_baojianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${cableOld.zx_baojianriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">在线检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="cable.zx_jianyanriqi" value="<fmt:formatDate value='${cable.zx_jianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${cableOld.zx_jianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
					    <label class="width100">下次在线检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="cable.zx_xiacijianyanriqi" value="<fmt:formatDate value='${cable.zx_xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${cableOld.zx_xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">在线检验结论:</label>
						<input class="ui-input" style="width: 179px;" name="cable.zx_jianyanjielun" value="${cable.zx_jianyanjielun}" oldValue="${cableOld.zx_jianyanjielun}"/>
						<br/>
					    <label class="width100">在线检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="cable.zx_jianyanjigou" value="${cable.zx_jianyanjigou}" oldValue="${cableOld.zx_jianyanjigou}"/>
						<label class="width100">在线报告编号:</label>
						<input class="ui-input" style="width: 179px;" name="cable.nd_baogaobianhao" value="${cable.nd_baogaobianhao}" oldValue="${cableOld.nd_baogaobianhao}"/>
						<br/>
					    <label class="width100">全面报检日期:</label>
						<input class="ui-input" style="width: 179px;" name="cable.shebeibaojianriqi" value="<fmt:formatDate value='${cable.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${cableOld.shebeibaojianriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">全面检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="cable.jianyanjieshuriqi" value="<fmt:formatDate value='${cable.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${cableOld.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
						<br/>
					    <label class="width100">下次全面检验日期:</label>
						<input class="ui-input" style="width: 179px;" name="cable.xiacijianyanriqi" value="<fmt:formatDate value='${cable.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${cableOld.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
					    <label class="width100">全面检验结论:</label>
						<input class="ui-input" style="width: 179px;" name="cable.jianyanjielun" value="${cable.jianyanjielun}" oldValue="${cableOld.jianyanjielun}"/>
						<br/>
					    <label class="width100">全面检验机构:</label>
						<input class="ui-input" style="width: 179px;" name="cable.jianyanjigou" value="${cable.jianyanjigou}" oldValue="${cableOld.jianyanjigou}"/>
					 	<label class="width100">全面报告编号:</label>
						<input class="ui-input" style="width: 179px;" name="cable.qm_baogaobianhao" value="${cable.qm_baogaobianhao}" oldValue="${cableOld.qm_baogaobianhao}"/>
					 </div>
					</fieldset>
					<fieldset>
					<legend>单位信息</legend>
					<div>
						<label></label>
						<span style="color:red;">【为保证使用单位的一致性，使用单位信息只能在设备列表上修改】</span><br/>
						<label>使用单位:</label>
						<input class="ui-input"   style="width: 420px;" name="cable.shiyongdanwei" value="${cable.shiyongdanwei}" oldValue="${cableOld.shiyongdanwei}" id="bjdshiyongdanwei" onfocus="this.blur()"/><br/>
						<label>单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="cable.shiyongdanwei_dizhi" value="${cable.shiyongdanwei_dizhi}" oldValue="${cableOld.shiyongdanwei_dizhi}"/><br/>
						<label>组织机构代码:</label>
						<input class="ui-input" style="width: 179px;" name="cable.shiyongdanwei_code" value="${cable.shiyongdanwei_code}" oldValue="${cableOld.shiyongdanwei_code}" />
						<label>法定代表人:</label>
						<input class="ui-input" style="width: 179px;" name="cable.fadingdaibiaoren" value="${cable.fadingdaibiaoren}" oldValue="${cableOld.fadingdaibiaoren}" /><br/>
						<hr/>
						<label>施工单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="cable.shigongdanwei" value="${cable.shigongdanwei}" oldValue="${cableOld.shigongdanwei}"/><br/>
						<label>单位地址:</label>						
						<input class="ui-input"   style="width: 420px;" name="cable.shigongdanwei_dizhi" value="${cable.shigongdanwei_dizhi}" oldValue="${cableOld.shigongdanwei_dizhi}"/><br/>
						<label>组织机构代码:</label>	
						<input class="ui-input"   style="width: 179px;" name="cable.shigongdanwei_daima" value="${cable.shigongdanwei_daima}" oldValue="${cableOld.shigongdanwei_daima}"/>
						<label>法人代表:</label>	
						<input class="ui-input"   style="width: 179px;" name="cable.shigongdanwei_faren" value="${cable.shigongdanwei_faren}" oldValue="${cableOld.shigongdanwei_faren}"/><br/>
						<label>联系电话:</label>	
						<input class="ui-input"   style="width: 179px;" name="cable.shigongdanwei_lianxidianhua" value="${cable.shigongdanwei_lianxidianhua}" oldValue="${cableOld.shigongdanwei_lianxidianhua}"/>
						<label>联   系   人:</label>	
						<input class="ui-input"   style="width: 179px;" name="cable.shigongdanwei_lianxiren" value="${cable.shigongdanwei_lianxiren}" oldValue="${cableOld.shigongdanwei_lianxiren}"/><br/>
						<label>许可证编号:</label>	
						<input class="ui-input"   style="width: 179px;" name="cable.shigongdanwei_xukezhengbianhao" value="${cable.shigongdanwei_xukezhengbianhao}" oldValue="${cableOld.shigongdanwei_xukezhengbianhao}"/>
						<label>简称:</label>	
						<input class="ui-input"   style="width: 179px;" name="cable.shigongdanwei_jiancheng" value="${cable.shigongdanwei_jiancheng}" oldValue="${cableOld.shigongdanwei_jiancheng}"/><br/><hr/>
						
						<label>制造单位:</label>						
						<input class="ui-input"   style="width: 420px;" name="cable.zhizaodanwei" value="${cable.zhizaodanwei}" oldValue="${cableOld.zhizaodanwei}"/><br/>
						<label>制造许可证编号:</label>
						<input class="ui-input" style="width: 179px;" name="cable.zhizaodanweixukezhengbianhao" value="${cable.zhizaodanweixukezhengbianhao}" oldValue="${cableOld.zhizaodanweixukezhengbianhao}"/>
						<label>制造单位统一社会信用代码:</label>
						<input class="ui-input" style="width: 179px;" name="cable.zhizaodanwei_code" value="${cable.zhizaodanwei_code}" oldValue="${cableOld.zhizaodanwei_code}"/>
						<br/>
						<label>产品品牌:</label>
						<input class="ui-input" style="width: 179px;" name="cable.chanpinpinpai" value="${cable.chanpinpinpai}" oldValue="${cableOld.chanpinpinpai}"/>
						<br/>
						<hr/>
						<label>产权单位:</label>
						<input class="ui-input"   style="width: 420px;" name="cable.chanquandanwei" value="${cable.chanquandanwei}" oldValue="${cableOld.chanquandanwei}"/><br/>
						<label>产权单位地址:</label>
						<input class="ui-input"   style="width: 420px;" name="cable.chanquandanwei_dizhi" value="${cable.chanquandanwei_dizhi}" oldValue="${cableOld.chanquandanwei_dizhi}"/><br/>
						<label>产权单位代码:</label>
						<input class="ui-input"   style="width: 179px;" name="cable.chanquandanwei_daima" value="${cable.chanquandanwei_daima}" oldValue="${cableOld.chanquandanwei_daima}"/>
						<label>法人代表:</label>
						<input class="ui-input"   style="width: 179px;" name="cable.chanquandanwei_farendaibiao" value="${cable.chanquandanwei_farendaibiao}" oldValue="${cableOld.chanquandanwei_farendaibiao}"/><br/>
						<br/>
						<hr/>
					 	<label>设计单位:</label>
						<input class="ui-input" style="width: 179px;" name="cable.shejidanwei" value="${cable.shejidanwei}" oldValue="${cableOld.shejidanwei}"/>
					 	<label>设计单位代码:</label>
						<input class="ui-input" style="width: 179px;" name="cable.shejidanweidaima" value="${cable.shejidanweidaima}" oldValue="${cableOld.shejidanweidaima}"/>
					    <br/>
						
					</div>
					</fieldset>
					<fieldset>
					<legend>设备参数</legend>
						<label>运行速度(m/s):</label>	
						<input class='ui-input' style="width: 176px;" name="cable.yunxingsudu" value="${cable.yunxingsudu}" oldValue="${cableOld.yunxingsudu}"/>
						<label>索道长度(m):</label>	
						<input class='ui-input' style="width: 176px;" name="cable.changdu" value="${cable.changdu}" oldValue="${cableOld.changdu}"/><br/>
						<label>运载能力(p/h):</label>	
						<input class='ui-input' style="width: 176px;" name="cable.yunzainengli" value="${cable.yunzainengli}" oldValue="${cableOld.yunzainengli}"/>
						<label>运载车辆形式:</label>	
						<s:select style="width: 176px" id="clxs" name="cable.yunzaicheliangxingshi" list="#{'吊厢式':'吊厢式','吊蓝式':'吊蓝式','吊椅式':'吊椅式','拖牵式':'拖牵式'}" value="cable.yunzaicheliangxingshi" sltValue="${cable.yunzaicheliangxingshi}" oldValue="${cableOld.yunzaicheliangxingshi}"></s:select>
						<br/>
						<label>平  距(m):</label>	
						<input class='ui-input' style="width: 176px;" name="cable.pingju" value="${cable.pingju}" oldValue="${cableOld.pingju}"/>
						<label>斜  长(m):</label>	
						<input class='ui-input' style="width: 176px;" name="cable.xiechang" value="${cable.xiechang}" oldValue="${cableOld.xiechang}"/><br/>
						<label>高  差(m):</label>	
						<input class='ui-input' style="width: 176px;" name="cable.gaocha" value="${cable.gaocha}" oldValue="${cableOld.gaocha}"/>
						<label>运  量(人/小时):</label>	
						<input class='ui-input' style="width: 176px;" name="cable.yunliang" value="${cable.yunliang}" oldValue="${cableOld.yunliang}"/><br/>
						<label>索  距(m):</label>	
						<input class='ui-input' style="width: 176px;" name="cable.suoju" value="${cable.suoju}" oldValue="${cableOld.suoju}"/>
						<label>支架数目(个):</label>	
						<input class='ui-input' style="width: 176px;" name="cable.zhijiashumu" value="${cable.zhijiashumu}" oldValue="${cableOld.zhijiashumu}"/><br/>
						<label>主电机型号和功率(kW):</label>	
						<input class='ui-input' style="width: 176px;" name="cable.dianjiexinghaogonglv" value="${cable.dianjiexinghaogonglv}" oldValue="${cableOld.dianjiexinghaogonglv}"/>
						<label>张紧油压:</label>	
						<input class='ui-input' style="width: 176px;" name="cable.zhangjinyouya" value="${cable.zhangjinyouya}" oldValue="${cableOld.zhangjinyouya}"/><br/>
						<label>运载索:</label>	
						<input class='ui-input' style="width: 176px;" name="cable.yunzaisuo" value="${cable.yunzaisuo}" oldValue="${cableOld.yunzaisuo}"/>
						<label>承载索:</label>	
						<input class='ui-input' style="width: 176px;" name="cable.chengzaisuo" value="${cable.chengzaisuo}" oldValue="${cableOld.chengzaisuo}"/><br/>
						<label>运载工具数量和类型:</label>	
						<input class='ui-input' style="width: 176px;" name="cable.yunzaigongju" value="${cable.yunzaigongju}" oldValue="${cableOld.yunzaigongju}"/>
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
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${cable.shebeizhongleidaima}"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie,yzc_shebeipinzhong",data.dirDatas,"200px",true,"<%=path%>");
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
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
		});
		function save(tjstate){
			if($('#shi').val() == ""){
				$.dialog.alert('市不能为空！');
				return false;
			}
			var options = {
				url:"<%=path%>/se!updateByKYSD.do?tjstate="+tjstate+"&address=${address}&dbid=${dbid}",
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