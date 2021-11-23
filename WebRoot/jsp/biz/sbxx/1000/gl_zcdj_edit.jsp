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
.long98{
  width:92%;
}
.long85{
  width:85%;
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
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_edit_save">保存</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_edit_tj">提交至审核</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_zcdj_edit_dy">打印</a>
	  </div>
	   		<div>
		    	<form id="frm_zcdj_edit${uuid}" method="post" enctype="multipart/form-data">
		   			<div style="width: 80%;text-align: center;font-size: 30px">
		   				特种设备使用登记表
		   			</div>
		   			<br/>
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.id" id="reg_id_${uuid}" value="${register.id}"/>
	                	 <input type="hidden" name="register.filepath" id="zcdjb_filepath_${uuid}" value="${register.filepath}"/>
	                	 <input type="hidden" name="register.fj_filepath" id="zcdjb_filepath_hid_${uuid}" value="${register.fj_filepath}"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="锅炉"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="1000"/>
	                	 <input type="hidden" name="register.tjstate" value="${register.tjstate}"/>
	                	 <input type="hidden" name="register.organ_code" value="${register.organ_code}"/>
	                	 <input type="hidden" name="register.creat_user" value="${register.creat_user}"/>
	                	 <input type="hidden" name="register.wtg_yuanyin" value="${register.wtg_yuanyin}"/>
						 <input type="hidden" name="register.shiyongdanwei" value="${register.shiyongdanwei}" id="reg_add_sydw_${uuid}"/>
	                </div>
					<div>
						<div id="message_${uuid}" style="text-align: center;width: 80%"></div>
						<table>
							<tr>
								<th>登记类别：</th>
								<td>
									<s:select name="register.dengjileibie" style="width:179px" id="djlb" list="#{'':'','新设备首次启用':'新设备首次启用','停用后启用':'停用后启用','改造':'改造','使用单位更名':'使用单位更名','使用地址变更':'使用地址变更','过户':'过户','移装':'移装'}" value="register.dengjileibie"></s:select>
								</td>
								<td style="width:450px;"></td>
								<th style="color: red;">注册代码：</th>
								<td style="width:180px;">
									<input class="ui-input long98" name="register.zhucedaima"  value="${register.zhucedaima}" id="zcdm"/>
								</td>
							</tr>
						</table>
						<table class="tabjcxx">
							<tr>
								<th rowspan="4">设备基本情况</th>
								<th>设备种类</th>
								<td>锅炉</td>
								<th colspan="2">设备类别</th>
								<td>
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
									<input class="ui-input long98" name="register.shebeidaima"  value="${register.shebeidaima}" />
								</td>
								<th colspan="2">设备型号</th>
								<td>
									<input class="ui-input long98" name="register.shebeixinghao" value="${register.shebeixinghao}" />
								</td>
							</tr>
							<tr>
								<th>设计使用年限</th>
								<td>
									<input class="ui-input" name="register.shejishiyongnianxian" value="${register.shejishiyongnianxian}"/>年
								</td>
								<th colspan="2">固定资产值</th>
								<td>
									<input class="ui-input" name="register.gudingzichan" value="${register.gudingzichan}" />万元
								</td>
							</tr>
							<tr>
								<th rowspan="16" style="width: 10%">设备使用情况</th>
								<th>使用单位名称</th>
								<td colspan="4">
									${register.shiyongdanwei}
								</td>
							</tr>
							<tr>
								<th>使用单位地址</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.shiyongdanweidizhi" value="${register.shiyongdanweidizhi}" />
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
								<th colspan="2"></th>
								<td >
								</td>
							</tr>
							<tr>
								<th>机构代码或信用代码</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdanweidaima" value="${register.shiyongdanweidaima}"/>
								</td>
								<th colspan="2">邮政编码</th>
								<td>
									<input class="ui-input long98" name="register.sydw_youzhengbianma" value="${register.sydw_youzhengbianma}" />
								</td>
							</tr>
							<tr>
								<th>单位性质</th>
								<td>
									<s:select style="width: 179px" id="dwxz" name="register.danweixingzhi" list="#{'':'','国有':'国有','集体':'集体','私有':'私有','外商':'外商','港澳台':'港澳台','合资':'合资'}" value="register.danweixingzhi"></s:select>
								</td>
								<th colspan="2">所属行业</th>
								<td>
									<div id="sshy_div">
										<select class="long98" sltValue="${register.suoshuhangye}" name="register.suoshuhangye" id="sshy"></select>
									</div>
								</td>
							</tr>
							<tr>
								<th>法定代表人</th>
								<td>
									<input class="ui-input long98" name="register.sydw_fadingdaibiaoren" value="${register.sydw_fadingdaibiaoren}" />
								</td>
								<th colspan="2">安全管理机构</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlibumen" value="${register.anquanguanlibumen}" />
								</td>
							</tr>
							<tr>
								<th>安全管理人员</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlirenyuan" value="${register.anquanguanlirenyuan}" />
								</td>
								<th colspan="2">联系电话</th>
								<td>
									<input class="ui-input long98" name="register.aqglry_lianxidianhua" value="${register.aqglry_lianxidianhua}" />
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
								<th style="width: 17%">使用场所类别</th>
								<td style="width: 23%">
									<input class="ui-input long98" name="register.shiyongchanghe" value="${register.shiyongchanghe}" />
								</td>
								<th rowspan="3" style="width: 10%">设备地理信息</th>
								<th style="width: 15%">经度</th>
								<td style="width: 25%">
									<input class="ui-input long98" name="register.jingdu" value="${register.jingdu}" />
								</td>
							</tr>
							<tr>
								<th>运行状态</th>
								<td>
									<input class="ui-input long98" name="register.yxzt_yongtu" value="${register.yxzt_yongtu}" />
								</td>
								<th>纬度</th>
								<td>
									<input class="ui-input long98" name="register.weidu" value="${register.weidu}" />
								</td>
							</tr>
							<tr>
								<th>投入使用日期(日期)</th>
								<td>
									<input class="ui-input long98" name="register.touyongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.touyongriqi}' pattern='yyyy-MM-dd'/>" />
								</td>
								<th>海拔高度</th>
								<td>
									<input class="ui-input long98" name="register.haibagaodu" value="${register.haibagaodu}"/>
								</td>
							</tr>
							<tr>
								<th>投入使用日期(文本)</th>
								<td>
									<input class="ui-input long98" name="register.touyongriqi_str" value="${register.touyongriqi_str}" />
								</td>
								<th colspan="2">产权单位名称</th>
								<td>
									<input class="ui-input long98" name="register.chanquandanwei" value="${register.chanquandanwei}"/>
								</td>
							</tr>
							<tr>
								<th>机构代码或信用代码</th>
								<td>
									<input class="ui-input long98" name="register.chanquandanweidaima" value="${register.chanquandanweidaima}" />
								</td>
								<th colspan="2">联系电话</th>
								<td>
									<input class="ui-input long98" name="register.cqdw_dianhua" value="${register.cqdw_dianhua}"/>
								</td>
							</tr>
							<tr>
								<th>单位性质</th>
								<td>
									<s:select style="width: 179px" id="cqdw_xz" name="register.cqdw_xingzhi" list="#{'':'','国有':'国有','集体':'集体','私有':'私有','外商':'外商','港澳台':'港澳台','合资':'合资'}" value="register.cqdw_xingzhi"></s:select>
								</td>
								<th colspan="2">所属行业</th>
								<td>
									<div id="cqdw_sshy_div">
										<select class="long98" sltValue="${register.cqdw_suoshuhangye}" name="register.cqdw_suoshuhangye" id="cqdw_sshy"></select>
									</div>
								</td>
							</tr>
							<tr>
								<th>职工人数</th>
								<td>
									<input class="ui-input long98" name="register.zhigongrenshu" value="${register.zhigongrenshu}" />
								</td>
								<th colspan="2">年产值</th>
								<td>
									<input class="ui-input long98" name="register.nianchanzhi" value="${register.nianchanzhi}"/>
								</td>
							</tr>
							<tr>
								<th rowspan="9">设备制造与监检情况</th>
								<th>制造单位名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.zhizaodanwei" value="${register.zhizaodanwei}" />
								</td>
							</tr>
							<tr>
								<th>制造许可证编号</th>
								<td>
									<input class="ui-input long98" name="register.zzdw_zigezhengshuhao" value="${register.zzdw_zigezhengshuhao}" />
								</td>
								<th colspan="2">产品编号</th>
								<td>
									<input class="ui-input long98" name="register.chuchangbianhao" value="${register.chuchangbianhao}" />
								</td>
							</tr>
							<tr>
								<th>制造日期(日期)</th>
								<td>
									<input class="ui-input long98" name="register.zhizaoriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.zhizaoriqi}' pattern='yyyy-MM-dd'/>" />
								</td>
								<th colspan="2">制造日期(文本)</th>
								<td>
									<input class="ui-input long98" name="register.zhizaoriqi_str" value="${register.zhizaoriqi_str}" />
								</td>
							</tr>
							<tr>
								<th>产品合格证编号</th>
								<td>
									<input class="ui-input long98" name="register.chanpinhegezhengbianhao" value="${register.chanpinhegezhengbianhao}" />
								</td>
								<th colspan="2">设计文件鉴定机构</th>
								<td>
									<input class="ui-input long98" name="register.xingshishiyanjiegou" value="${register.xingshishiyanjiegou}"/>
								</td>
							</tr>
							<tr>
								<th>鉴定报告书编号</th>
								<td>
									<input class="ui-input long98" name="register.xingshishiyanzhengshu" value="${register.xingshishiyanzhengshu}"/>
								</td>
								<th colspan="2">产品图号</th>
								<td>
									<input class="ui-input long98" name="register.chanpintuhao" value="${register.chanpintuhao}" />
								</td>
							</tr>
							<tr>
								<th>制造监检机构</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.zhizaojianjianjigou" value="${register.zhizaojianjianjigou}" />
								</td>
							</tr>
							<tr>
								<th>监检机构核准证编号</th>
								<td>
									<input class="ui-input long98" name="register.jianjianjigouhezhunzheng" value="${register.jianjianjigouhezhunzheng}" />
								</td>
								<th colspan="2">制造监检证书编号</th>
								<td>
									<input class="ui-input long98" name="register.zhizaojianjianzhengshu" value="${register.zhizaojianjianzhengshu}" />
								</td>
							</tr>
							<tr>
								<th>制造监检日期</th>
								<td>
									<input class="ui-input long98" name="register.zhizaojianjianriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.zhizaojianjianriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
								<th colspan="2">安装日期</th>
								<td>
									<input class="ui-input long98" name="register.anzhuangriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.anzhuangriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
							</tr>
							<tr>
								<th>安装监检日期</th>
								<td>
									<input class="ui-input long98" name="register.anzhuangjianjianriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.anzhuangjianjianriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
								<th colspan="2">安装监检机构</th>
								<td>
									<input class="ui-input long98" name="register.anzhuangjianjianjigou" value="${register.anzhuangjianjianjigou}" />
								</td>
							</tr>
							<tr>
								<th rowspan="3">设备施工情况</th>
								<th>施工单位名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.anzhuangdanwei" value="${register.anzhuangdanwei}" />
								</td>
							</tr>
							<tr>
								<th>施工许可证编号</th>
								<td>
									<input class="ui-input long98" name="register.azdw_zigezhengshubianhao" value="${register.azdw_zigezhengshubianhao}" />
								</td>
								<th colspan="2">施工类别</th>
								<td>
									<s:select style="width: 179px" id="sglb" name="register.shigongleibie" list="#{'':'','安装':'安装','改造':'改造','修理':'修理'}" value="register.shigongleibie"></s:select>
								</td>
							</tr>
							<tr>
								<th>施工告知日期</th>
								<td>
									<input class="ui-input long98" name="register.shigongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.shigongriqi}' pattern='yyyy-MM-dd'/>" />
								</td>
								<th colspan="2">施工竣工日期</th>
								<td>
									<input class="ui-input long98" name="register.jungongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.jungongriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
							</tr>
							<tr>
								<th rowspan="11">设备工作参数</th>
								<th>工作压力</th>
								<td>
									<input class="ui-input" name="register.gongzuoyali" value="${register.gongzuoyali}" />Mpa
								</td>
								<th colspan="2">工作温度</th>
								<td>
									<input class="ui-input" name="register.gongzuowendu" value="${register.gongzuowendu}" />℃
								</td>
							</tr>
							<tr>
								<th>介质</th>
								<td>
									<input class="ui-input long98" name="register.jiezhi" value="${register.jiezhi}" />
								</td>
								<th colspan="2">运行热效率</th>
								<td>
									<input class="ui-input long98" name="register.yunxingrexiaolv" value="${register.yunxingrexiaolv}" />
								</td>
							</tr>
							<tr>
								<th>燃料种类</th>
								<td>
									<s:select style="width: 179px" id="rlzl" name="register.ranshaozhonglei" list="#{'':'','燃煤':'燃煤','煤粉':'煤粉','燃油':'燃油','燃气':'燃气','生物质':'生物质','电加热':'电加热','其他':'其他'}" value="register.ranshaozhonglei"></s:select>
								</td>
								<th colspan="2">压力等级</th>
								<td>
									<s:select style="width: 179px" id="yldj" name="register.yalidengji" list="#{'':'','超临界锅炉≥22.1MPa':'超临界锅炉≥22.1MPa','亚临界锅炉16.7MPa≤p＜22.1MPa':'亚临界锅炉16.7MPa≤p＜22.1MPa','超高压锅炉13.7MPa≤p＜16.7MPa':'超高压锅炉13.7MPa≤p＜16.7MPa','高压锅炉9.8MPa≤p＜13.7MPa':'高压锅炉9.8MPa≤p＜13.7MPa','次高压锅炉5.3MPa≤p＜9.8MPa':'次高压锅炉5.3MPa≤p＜9.8MPa','中压锅炉3.8MPa≤p＜5.3MPa':'中压锅炉3.8MPa≤p＜5.3MPa','低压锅炉＜3.8MPa':'低压锅炉＜3.8MPa','高压':'高压','次高压':'次高压','中压':'中压'}" value="register.yalidengji"></s:select>
								</td>
							</tr>
							<tr>
								<th>额定蒸发量(蒸吨/时)</th>
								<td>
									<input class="ui-input long98" name="register.edingzhengfaliang" value="${register.edingzhengfaliang}" />
								</td>
								<th colspan="2">是否在城市建成区内</th>
								<td>
									<s:select style="width: 179px" id="csjcq" name="register.chengqu" list="#{'':'','是':'是','否':'否'}" value="register.chengqu"></s:select>
								</td>
							</tr>
							<tr>
								<th>是否配备有效的除尘装置和脱硫脱硝装置</th>
								<td>
									<s:select style="width: 179px" id="cczz_tltx" name="register.chuchenzhuangzhi" list="#{'':'','是':'是','否':'否'}" value="register.chuchenzhuangzhi"></s:select>
								</td>
								<th colspan="2">污染物排放量-PM2.5(吨/年)</th>
								<td>
									<input class="ui-input long98" name="register.wuranwu_pm25" value="${register.wuranwu_pm25}" />
								</td>
							</tr>
							<tr>
								<th>污染物排放量-PM10(吨/年)</th>
								<td>
									<input class="ui-input long98" name="register.wuranwu_pm10" value="${register.wuranwu_pm10}" />
								</td>
								<th colspan="2">污染物排放量-二氧化硫(SO2)(吨/年)</th>
								<td>
									<input class="ui-input long98" name="register.wuranwu_pmso2" value="${register.wuranwu_pmso2}" />
								</td>
							</tr>
							<tr>
								<th>污染物排放量-二氧化氮(NO2)(吨/年)</th>
								<td>
									<input class="ui-input long98" name="register.wuranwu_pmno2" value="${register.wuranwu_pmno2}" />
								</td>
								<th colspan="2">是否符合山东省排放标准</th>
								<td>
									<s:select style="width: 179px" id="pfbz" name="register.fuhebiaozhun" list="#{'':'','是':'是','否':'否'}" value="register.fuhebiaozhun"></s:select>
								</td>
							</tr>
							<tr>
								<th>年耗燃烧介质量</th>
								<td>
									<input class="ui-input long98" name="register.ranshaojiezhiliang" value="${register.ranshaojiezhiliang}" />
								</td>
								<th colspan="2">折合标准煤</th>
								<td>
									<input class="ui-input long98" name="register.biaozhunmei" value="${register.biaozhunmei}" />
								</td>
							</tr>
							<tr>
								<th>年耗电量</th>
								<td>
									<input class="ui-input long98" name="register.nianhaodianliang" value="${register.nianhaodianliang}" />
								</td>
								<th colspan="2">是否按规定完成能效测试(定型)</th>
								<td>
									<s:select style="width: 179px" id="nxcs_dx" name="register.nengxiaoceshi_dx" list="#{'':'','是':'是','否':'否'}" value="register.nengxiaoceshi_dx"></s:select>
								</td>
							</tr>
							<tr>
								<th>是否按规定完成能效测试(定期)</th>
								<td>
									<s:select style="width: 179px" id="nxcs_dq" name="register.nengxiaoceshi_dq" list="#{'':'','是':'是','否':'否'}" value="register.nengxiaoceshi_dq"></s:select>
								</td>
								<th colspan="2">热效率(设计值)</th>
								<td>
									<input class="ui-input long98" name="register.rexiaolv_sheji" value="${register.rexiaolv_sheji}" />
								</td>
							</tr>
							<tr>
								<th>热效率(实际值)</th>
								<td>
									<input class="ui-input long98" name="register.rexiaolv_shiji" value="${register.rexiaolv_shiji}" />
								</td>
								<th colspan="2"></th>
								<td>
								</td>
							</tr>
							<tr>
								<th rowspan="3">设备保险情况</th>
								<th>保险机构</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.baoxianjigou" value="${register.baoxianjigou}"/>
								</td>
							</tr>
							<tr>
								<th>保险险种</th>
								<td>
									<input class="ui-input long98" name="register.baoxianpinzhong" value="${register.baoxianpinzhong}" />
								</td>
								<th colspan="2">保险价值</th>
								<td>
									<input class="ui-input" name="register.baoxianjiazhi" value="${register.baoxianjiazhi}"/>万元
								</td>
							</tr>
							<tr>
								<th>保险费</th>
								<td>
									<input class="ui-input" name="register.baoxianfei" value="${register.baoxianfei}"/>万元
								</td>
								<th colspan="2">保险金额</th>
								<td>
									<input class="ui-input" name="register.baoxianjine" value="${register.baoxianjine}"/>万元
								</td>
							</tr>
							<tr>
								<th rowspan="4">设备变更情况</th>
								<th>变更项目</th>
								<th>变更类别</th>
								<th colspan="2">变更原因</th>
								<th>变更日期</th>
							</tr>
							<tr>
								<td>
									<s:select style="width: 149px" id="bdxm" name="register.biandongxiangmu" list="#{'':'','使用单位':'使用单位','使用地址':'使用地址','设备参数':'设备参数'}" value="register.biandongxiangmu"></s:select>
								</td>
								<td>
									<s:select style="width: 149px" id="bdfs" name="register.biandongfangshi" list="#{'':'','使用单位更名':'使用单位更名','变更使用单位':'变更使用单位','移装':'移装','改造':'改造','重大维修':'重大维修'}" value="register.biandongfangshi"></s:select>
								</td>
								<td colspan="2">
									<s:select style="width: 149px" id="bdyy" name="register.biandongyuanyin" list="#{'':'','转让':'转让','搬迁':'搬迁','提高能力':'提高能力','安全状况不合格':'安全状况不合格'}" value="register.biandongyuanyin"></s:select>
								</td>
								<td>
									<input class="ui-input long98" name="register.biandongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.biandongriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
							</tr>
								<td>
									<s:select style="width: 149px" id="bdxm2" name="register.biandongxiangmu_2" list="#{'':'','使用单位':'使用单位','使用地址':'使用地址','设备参数':'设备参数'}" value="register.biandongxiangmu_2"></s:select>
								</td>
								<td>
									<s:select style="width: 149px" id="bdfs2" name="register.biandongfangshi_2" list="#{'':'','使用单位更名':'使用单位更名','变更使用单位':'变更使用单位','移装':'移装','改造':'改造','重大维修':'重大维修'}" value="register.biandongfangshi_2"></s:select>
								</td>
								<td colspan="2">
									<s:select style="width: 149px" id="bdyy2" name="register.biandongyuanyin_2" list="#{'':'','转让':'转让','搬迁':'搬迁','提高能力':'提高能力','安全状况不合格':'安全状况不合格'}" value="register.biandongyuanyin_2"></s:select>
								</td>
								<td>
									<input class="ui-input long98" name="register.biandongriqi_2" onclick="WdatePicker()" value="<fmt:formatDate value='${register.biandongriqi_2}' pattern='yyyy-MM-dd'/>"/>
								</td>
							</tr>
							<tr>
								<td>
									<s:select style="width: 149px" id="bdxm3" name="register.biandongxiangmu_3" list="#{'':'','使用单位':'使用单位','使用地址':'使用地址','设备参数':'设备参数'}" value="register.biandongxiangmu_3"></s:select>
								</td>
								<td>
									<s:select style="width: 149px" id="bdfs3" name="register.biandongfangshi_3" list="#{'':'','使用单位更名':'使用单位更名','变更使用单位':'变更使用单位','移装':'移装','改造':'改造','重大维修':'重大维修'}" value="register.biandongfangshi_3"></s:select>
								</td>
								<td colspan="2">
									<s:select style="width: 149px" id="bdyy3" name="register.biandongyuanyin_3" list="#{'':'','转让':'转让','搬迁':'搬迁','提高能力':'提高能力','安全状况不合格':'安全状况不合格'}" value="register.biandongyuanyin_3"></s:select>
								</td>
								<td>
									<input class="ui-input long98" name="register.biandongriqi_3" onclick="WdatePicker()" value="<fmt:formatDate value='${register.biandongriqi_3}' pattern='yyyy-MM-dd'/>"/>
								</td>
							</tr>
							<tr>
								<th rowspan="4">设备检验情况</th>
								<th>检验机构</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.jianyandanwei" value="${register.jianyandanwei}"/>
								</td>
							</tr>
							<tr>
								<th>机构代码或信用代码</th>
								<td>
									<input class="ui-input long98" name="register.jianyandanweidaima" value="${register.jianyandanweidaima}"/>
								</td>
								<th colspan="2">检验类别</th>
								<td>
									<s:select style="width: 149px" id="jylb" name="register.jianyanleibie" list="#{'':'','内部检验':'内部检验','外部检验':'外部检验','安装监检':'安装监检'}" value="register.jianyanleibie"></s:select>
								</td>
							</tr>
							<tr>
								<th>检验日期</th>
								<td>
									<input class="ui-input long98" name="register.jianyanriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.jianyanriqi}' pattern='yyyy-MM-dd'/>" required="required"/>
								</td>
								<th colspan="2">检验结论</th>
								<td>
									<s:select style="width: 149px" id="jyjl" name="register.jianyanjielun" list="#{'':'','符合要求':'符合要求','基本符合要求':'基本符合要求','不符合要求':'不符合要求'}" value="register.jianyanjielun"></s:select>
								</td>
							</tr>
							<tr>
								<th>检验报告编号</th>
								<td>
									<input class="ui-input long98" name="register.baogaoshubianhao" value="${register.baogaoshubianhao}"/>
								</td>
								<th colspan="2">下次检验日期</th>
								<td>
									<input class="ui-input long98" name="register.xiacijianyanriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" required="required"/>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;">
										    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在此申明：所申报的内容真实；在使用过程中，将严格执行《中华人民共和国特种设备安全法》、《特种设备安全监察条例》及其相关规定，并接受特种设备安全监督管理部门的监督管理。
									</div>
									<div style="text-align: left;">
										 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;附：合格证(含产品数据表)
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
											<td style="width: 20%">(使用单位公章或者专用章)</td>
										</tr>
										<tr>
											<td>使用单位安全管理人员：</td>
											<td>${register.anquanguanlirenyuan}</td>
											<td>日期：</td>
											<td>
												<input class="ui-input long98" name="register.aqglry_riqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.aqglry_riqi}' pattern='yyyy-MM-dd'/>"/>
											</td>
											<td><input class="ui-input long98" name="register.shiyongdanwei_nyr" value="${register.shiyongdanwei_nyr}"/></td>
										</tr>
										<tr>
											<td>首次定期检验日期：</td>
											<td colspan="4" style="text-align: left;">
												<input class="ui-input" name="register.dingqijianyanriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.dingqijianyanriqi}' pattern='yyyy-MM-dd'/>"/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;">
										说明：<textarea rows="3" style="width: 98%" name="register.shuoming">${register.shuoming}</textarea>
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
											<td style="width: 20%">登记机关（专用章）</td>
										</tr>
										<tr>
											<td colspan="4"></td>
											<td>
												<input class="ui-input long98" name="register.dengjijiguan_nyr" value="${register.dengjijiguan_nyr}"/>
											</td>
										</tr>
										<tr>
											<td>监管类别：</td>
											<td>
												<input class="ui-input long98" name="register.jianguanleibie" value="${register.jianguanleibie}" />
											</td>
											<td>使用登记证编号：</td>
											<td>
												<input class="ui-input long98" name="register.shiyongdengjizhenghaoma" value="${register.shiyongdengjizhenghaoma}" />
											</td>
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
										<input type="file" style="width: 70%" name="uploadify"/>
									</div>
									(不能大于10M)
								</td>
							</tr>
						</table>
					</div>
		    	</form>
		    </div>
		</div>
	<iframe id="dwzhDownloadFile" height="0" width="0" src="" style="display: none;"></iframe>
</body>
</html>
	<script type="text/javascript">
	
	$("#djlb").selectmenu();
	$("#dwxz").selectmenu();
	$("#cqdw_xz").selectmenu();
	$("#sglb").selectmenu();
	$("#bdxm").selectmenu();
	$("#bdfs").selectmenu();
	$("#bdyy").selectmenu();
	$("#bdxm2").selectmenu();
	$("#bdfs2").selectmenu();
	$("#bdyy2").selectmenu();
	$("#bdxm3").selectmenu();
	$("#bdfs3").selectmenu();
	$("#bdyy3").selectmenu();
	$("#jylb").selectmenu();
	$("#jyjl").selectmenu();
	$("#rlzl").selectmenu();
	$("#yldj").selectmenu();
	$("#csjcq").selectmenu();
	$("#cczz_tltx").selectmenu();
	$("#pfbz").selectmenu();
	$("#nxcs_dx").selectmenu();
	$("#nxcs_dq").selectmenu();
	
	$().ready(function(){
		if("${register.tjstate}" == "1" || "${register.tjstate}" == "2"){
			$("#mnubtn_zcdj_edit_tj").hide();
			$("#mnubtn_zcdj_edit_save").hide();
		}
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"1000"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie,yzc_shebeipinzhong",data.dirDatas,"200px",true,"<%=path%>");
			},"JSON");
		
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"GLSSHY"},
				function (data, textStatus){
					$STONE.creatSelectMenu("sshy",data.dicDatas,"200px",false,"<%=path%>");
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"GLSSHY"},
				function (data, textStatus){
					$STONE.creatSelectMenu("cqdw_sshy",data.dicDatas,"200px",false,"<%=path%>");
			},"JSON");
		if("${register.fj_filepath}" != ""){
			var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\'${register.fj_filepath}\')">下载附件</a>';
			$("#zcdjb_fj_${uuid}").html(down);
		}
		//提交至审核
		$("#mnubtn_zcdj_edit_tj").click(function(){
			$.dialog.confirm("确定要提交至审核吗?提交后将不能修改!", function(){
				save("2");
			});
		});
		//保存表单
		$("#mnubtn_zcdj_edit_save").click(function(){
			save("0");
			return false;
		});
			//打印
			$("#mnubtn_jcsj_zcdj_edit_dy").click(function(){
				var id = $("#reg_id_${uuid}").attr("value");
				window.open ('<%=path%>/register!djbDyByJsp.do?id='+id,'登记表打印窗口','height=500,width=650,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no'); 
			});
		
			appendSelTo();
	});
	
			function save(tjstate){
				var options = {
				    url:"<%=path%>/register!update.do?tjstate="+tjstate,
					dataType:'json',
		            beforeSubmit:function(formData, jqForm, options){
				    	if(tjstate == '2'){
				    		if(!verifySelect()){ return false;}
				    	}
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
						    	var fpath = rsp.fjpath.replace(/\\/g,"/");
						    	var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\''+fpath+'\')">下载附件</a>';
						    	$("#zcdjb_fj_${uuid}").html(down);
						    }
						    $("#zcdjb_fj_input_${uuid}").html($("#zcdjb_fj_input_${uuid}").html());
						    if(tjstate == "2"){
								$("#mnubtn_zcdj_edit_tj").hide();
								$("#mnubtn_zcdj_edit_save").hide();
							}
		            	}else if(rsg.msg == "OUTSIZE"){
							$.dialog.tips('<font color="blue">保存成功！附件过大上传失败！</font>',3,'success.gif');
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
		var code = $('#zcdm').val();
		var flag = false;
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/se!findSeCode.do",
		   data:'code='+code,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.count>0){
		   			$.dialog.alert('注册代码重复！');
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
		var flag = false;
		
		if(s == ""){
			$("#shi_div  p").show();
			flag = false;
		}else{
			$("#shi_div  p").hide();
			flag = true;
		}
		if(q == "" || q == null){
			$("#quxian_div  p").show();
			flag = false;
		}else{
			$("#quxian_div  p").hide();
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
	</script> 