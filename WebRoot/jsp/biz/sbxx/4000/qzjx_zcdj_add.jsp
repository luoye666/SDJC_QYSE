<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.sys.pojo.TOrgan"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ taglib prefix="c" uri="/c.tld" %>
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
  width:91%;
}
.long85{
  width:85%;
}
.tabjcxx {
	border-collapse:collapse; 
	text-align:center; 
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
	text-align: center;
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
.redStyle{
	color: red;
}
</style>
</head>
<body>
	<div class="wrapper">
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_add_save">保存</a><a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_add_tiqu">提取信息</a>
	  </div>
	   		<div>
		    	<form id="frm_zcdj_add${uuid}" method="post">
		   			<div style="width: 80%;text-align: center;font-size: 30px"><br/>
		   				特种设备使用登记表
		   			</div>
		   			<br/>
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.filepath"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="起重机械"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="4000"/>
	                	 <input type="hidden" name="register.tjstate" value="0"/>
						 <input type="hidden" name="register.shiyongdanwei" value="${register.shiyongdanwei}" id="reg_add_sydw"/>
	                </div>
					<div>
						<table>
							<tr>
								<th>登记类别：</th>
								<td>
									<select class="long98" name="register.dengjileibie" id="djlb">
										<option value=""></option>
										<option value="新设备首次启用">新设备首次启用</option>
										<option value="停用后启用">停用后启用</option>
										<option value="改造">改造</option>
										<option value="使用单位更名">使用单位更名</option>
										<option value="使用地址变更">使用地址变更</option>
										<option value="过户">过户</option>
										<option value="移装">移装</option>
									</select>
								</td>
								<td style="width:450px;"></td>
								<th style="color: red;">注册代码：</th>
								<td style="width:180px;">
									<input class="ui-input long98" name="register.zhucedaima" value="${register.zhucedaima}" id="reg_add"/>
								</td>
							</tr>
						</table>
						<table class="tabjcxx">
							<tr>
								<th rowspan="4">设备基本情况</th>
								<th>设备种类</th>
								<td>起重机械</td>
								<th colspan="2">设备类别</th>
								<td>
									<div id="yzc_shebeileibie_div">
										<select name="register.shebeileibiedaima" class="long98" id="yzc_shebeileibie"></select>
									</div>
					    		</td>
							</tr>
							<tr>
								<th>设备品种</th>
								<td>
									<div id="yzc_shebeipinzhong_div">
					    				<select class="long98" name="register.shebeipinzhongdaima" id="yzc_shebeipinzhong"></select>
									</div>
					    		</td>
								<th colspan="2">设备名称</th>
								<td>
									<input class="ui-input long98" name="register.shebeimingcheng" value="${register.shebeimingcheng}" />
								</td>
							</tr>
							<tr>
								<th>设备代码</th>
								<td>
									<input class="ui-input long98" name="register.shebeidaima" value="${register.shebeidaima}" />
								</td>
								<th colspan="2">设备型号</th>
								<td>
									<input class="ui-input long98" name="register.shebeixinghao" value="${register.shebeixinghao}" />
								</td>
							</tr>
							<tr>
								<th>设备级别</th>
								<td>
									<input class="ui-input long98" name="register.shebeijibie" />
								</td>
								<th colspan="2">固定资产值</th>
								<td>
									<input class="ui-input" name="register.gudingzichan" />万元
								</td>
							</tr>
							<tr>
								<th rowspan="2">设备结构型式</th>
								<th>主体结构型式</th>
								<td>
									<input class="ui-input long98" name="register.jiegouxingshi" />
								</td>
								<th colspan="2">防爆型式</th>
								<td>
									<input class="ui-input" name="register.fangbaoxingshi" />
								</td>
							</tr>
							<tr>
								<th>吊具型式</th>
								<td>
									<input class="ui-input long98" name="register.diaojuxingshi" />
								</td>
								<th colspan="2">操作方式</th>
								<td>
									<select class="long98" name="register.caozuofangshi" id="czfs">
										<option value=""></option>
										<option value="司机室操纵">司机室操纵</option>
										<option value="地面操纵(悬挂按钮)">地面操纵(悬挂按钮)</option>
										<option value="遥控">遥控</option>
									</select>
								</td>
							</tr>
							<tr>
								<th rowspan="4">设备主要性能参数</th>
								<th>额定起重量(起重力矩)</th>
								<td>
									<input class="ui-input" name="register.edingqizhongliang" />
									<input type="radio" name="register.edingqizhongliang_dw" value="t" checked />t
									<input type="radio" name="register.edingqizhongliang_dw" value="kN·m" />kN·m
								</td>
								<th colspan="2">跨度</th>
								<td>
									<input class="ui-input" name="register.kuadu" />m
								</td>
							</tr>
							<tr>
								<th>起升高度</th>
								<td>
									<input class="ui-input" name="register.tishenggaodu" />m
								</td>
								<th colspan="2">起升速度</th>
								<td>
									<input class="ui-input" name="register.yunxingsudu" />m/s
								</td>
							</tr>
							<tr>
								<th>工作级别</th>
								<td>
									<input class="ui-input" name="register.gongzuojibie" />
								</td>
								<th colspan="2">整机总功率</th>
								<td>
									<input class="ui-input" name="register.zhengjizonggonglv" />kw
								</td>
							</tr>
							<tr>
								<th>是否吊运熔融金属</th>
								<td>
									<select class="long98" name="register.caozuofangshi" id="rrjs">
										<option value="否">否</option>
										<option value="是">是</option>
									</select>
								</td>
								<th colspan="2"></th>
								<td>
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
								<th>单位地址</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.shiyongdanweidizhi" value="${register.shiyongdanweidizhi}" />
								</td>
							</tr>
							<tr>
								<th>市</th>
								<td>
									<div id="shi_div">
										<select class="long98" sltValue="${register.shiyongdanweidizhi_shi_daima}" name="register.shiyongdanweidizhi_shi_daima" id="shi"></select>
									</div>
								</td>
								<th colspan="2">区县</th>
								<td >
									<div id="quxian_div">
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
									<input class="ui-input long98" name="register.shiyongdanweidaima" value="${register.shiyongdanweidaima}" />
								</td>
								<th colspan="2">邮政编码</th>
								<td>
									<input class="ui-input long98" name="register.sydw_youzhengbianma" value="${register.sydw_youzhengbianma}" />
								</td>
							</tr>
							<tr>
								<th>经济类型</th>
								<td>
									<select class="long98" name="register.danweixingzhi" id="jjlx">
										<option value=""></option>
										<option value="国有">国有</option>
										<option value="集体">集体</option>
										<option value="私有">私有</option>
										<option value="外商">外商</option>
										<option value="港澳台">港澳台</option>
										<option value="合资">合资</option>
									</select>
								</td>
								<th colspan="2">所属行业</th>
								<td>
									<select class="long98" name="register.suoshuhangye" id="sshy">
										<option value=""></option>
										<option value="农业">农业</option>
										<option value="采矿业">采矿业</option>
										<option value="制造业">制造业</option>
										<option value="电力">电力</option>
										<option value="燃气">燃气</option>
										<option value="建筑业">建筑业</option>
										<option value="交通运输业">交通运输业</option>
										<option value="其他行业">其他行业</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>法定代表人</th>
								<td>
									<input class="ui-input long98" name="register.sydw_fadingdaibiaoren" />
								</td>
								<th colspan="2">安全管理部门</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlibumen" />
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
								<th>产权单位名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.chanquandanwei" />
								</td>
							</tr>
							<tr>
								<th>产权单位地址</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.chanquandanweidizhi" />
								</td>
							</tr>
							<tr>
								<th>产权单位负责人</th>
								<td>
									<input class="ui-input long98" name="register.cqdw_fuzeren" />
								</td>
								<th colspan="2">产权单位联系电话</th>
								<td>
									<input class="ui-input long98" name="register.cqdw_dianhua" />
								</td>
							</tr>
							<tr>
								<th>设备用途</th>
								<td>
									<input class="ui-input long98" name="register.shebeiyongtu" />
								</td>
								<th colspan="2">单位内编号</th>
								<td>
									<input class="ui-input long98" name="register.neibubianhao" />
								</td>
							</tr>
							<tr>
								<th style="width: 17%">单位内使用地点</th>
								<td style="width: 23%">
									<input class="ui-input long98" name="register.shiyongdidian" value="${register.shiyongdidian}" />
								</td>
								<th rowspan="3" style="width: 10%">设备地理信息</th>
								<th style="width: 15%">经度</th>
								<td style="width: 25%">
									<input class="ui-input long98" name="register.jingdu" />
								</td>
							</tr>
							<tr>
								<th>投入使用日期(日期)</th>
								<td>
									<input class="ui-input long98" name="register.touyongriqi" onclick="WdatePicker()" />
								</td>
								<th>纬度</th>
								<td>
									<input class="ui-input long98" name="register.weidu" />
								</td>
							</tr>
							<tr>
								<th>投入使用日期(文本)</th>
								<td>
									<input class="ui-input long98" name="register.touyongriqi_str" />
								</td>
								<th>海拔高度</th>
								<td>
									<input class="ui-input long98" name="register.haibagaodu" />
								</td>
							</tr>
							<tr>
								<th>设备布置数量</th>
								<td>
									<input class="ui-input long98" name="register.buzhishuliang" />
								</td>
								<th colspan="2"></th>
								<td>
								</td>
							</tr>
							<tr>
								<th rowspan="8">设备制造与监检情况</th>
								<th>制造单位名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.zhizaodanwei" value="${register.zhizaodanwei}" />
								</td>
							</tr>
							<tr>
								<th>机构代码或信用代码</th>
								<td>
									<input class="ui-input long98" name="register.zhizaodanweidaima" />
								</td>
								<th colspan="2">制造许可证编号</th>
								<td>
									<input class="ui-input long98" name="register.zzdw_zigezhengshuhao" value="${register.zzdw_zigezhengshuhao}" />
								</td>
							</tr>
							<tr>
								<th class="redStyle">产品编号</th>
								<td>
									<input class="ui-input long98 redStyle" name="register.chuchangbianhao" value="${register.chuchangbianhao}" id="cpbh" />
								</td>
								<th colspan="2">制造日期(日期)</th>
								<td>
									<input class="ui-input long98" name="register.zhizaoriqi" onclick="WdatePicker()" />
								</td>
							</tr>
							<tr>
								<th>质量证明书编号</th>
								<td>
									<input class="ui-input long98" name="register.chanpinhegezhengbianhao" />
								</td>
								<th colspan="2">制造日期(文本)</th>
								<td>
									<input class="ui-input long98" name="register.zhizaoriqi_str" />
								</td>
							</tr>
							<tr>
								<th>制造监检机构</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.zhizaojianjianjigou" />
								</td>
							</tr>
							<tr>
								<th>核准证编号</th>
								<td>
									<input class="ui-input long98" name="register.jianjianjigouhezhunzheng" />
								</td>
								<th colspan="2">监检证书编号</th>
								<td>
									<input class="ui-input long98" name="register.zhizaojianjianzhengshu" />
								</td>
							</tr>
							<tr>
								<th>型式试验机构</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.xingshishiyanjiegou" />
								</td>
							</tr>
							<tr>
								<th>核准证编号</th>
								<td>
									<input class="ui-input long98" name="register.shiyanjiegouhezhunzheng" />
								</td>
								<th colspan="2">型式试验证书编号</th>
								<td>
									<input class="ui-input long98" name="register.xingshishiyanzhengshu" />
								</td>
							</tr>
							<tr>
								<th rowspan="4">设备施工情况</th>
								<th>施工单位</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.anzhuangdanwei" value="${register.anzhuangdanwei}" />
								</td>
							</tr>
							<tr>
								<th>机构代码或信用代码</th>
								<td>
									<input class="ui-input long98" name="register.anzhuangdanweidaima" />
								</td>
								<th colspan="2"></th>
								<td>
								</td>
							</tr>
							<tr>
								<th>施工类别</th>
								<td>
									<s:select style="width: 179px" id="sglb" name="register.shigongleibie" list="#{'':'','安装':'安装','改造':'改造','修理':'修理','移装':'移装'}" value="register.shigongleibie"></s:select>
								</td>
								<th colspan="2">施工许可证编号</th>
								<td>
									<input class="ui-input long98" name="register.azdw_zigezhengshubianhao" value="${register.azdw_zigezhengshubianhao}" />
								</td>
							</tr>
							<tr>
								<th>施工告知日期</th>
								<td>
									<input class="ui-input long98" name="register.shigongriqi" value="<fmt:formatDate value='${register.shigongriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()" />
								</td>
								<th colspan="2">施工竣工日期</th>
								<td>
									<input class="ui-input long98" name="register.jungongriqi" onclick="WdatePicker()" />
								</td>
							</tr>
							<tr>
								<th rowspan="2">设备维护保养情况</th>
								<th>维护保养单位</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.weibaodanwei" />
								</td>
							</tr>
							<tr>
								<th>机构代码或信用代码</th>
								<td>
									<input class="ui-input long98" name="register.weibaodanweidaima" />
								</td>
								<th colspan="2">维护保养形式</th>
								<td>
									<select class="long98" name="register.weibaoxingshi" id="wbxs">
										<option value=""></option>
										<option value="自行">自行</option>
										<option value="委托">委托</option>
									</select>
								</td>
							</tr>
							<tr>
								<th rowspan="2">设备运行情况</th>
								<th>工作环境</th>
								<td>
									<select class="long98" name="register.gongzuohuanjing" id="gzhj">
										<option value=""></option>
										<option value="室内">室内</option>
										<option value="室外">室外</option>
										<option value="临时工棚">临时工棚</option>
										<option value="防爆">防爆</option>
									</select>
								</td>
								<th colspan="2">运行方式</th>
								<td>
									<select class="long98" name="register.yunxingfangshi" id="yxfs">
										<option value=""></option>
										<option value="长期使用">长期使用</option>
										<option value="间歇使用">间歇使用</option>
										<option value="备用">备用</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>运行操作形式</th>
								<td>
									<select class="long98" name="register.yunxingcaozuoxingshi" id="yxczxs">
										<option value=""></option>
										<option value="专人">专人</option>
										<option value="共用">共用</option>
									</select>
								</td>
								<th colspan="2"></th>
								<td>
								</td>
							</tr>
							<tr>
								<th rowspan="4">设备保险情况</th>
								<th>保险机构</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.baoxianjigou" />
								</td>
							</tr>
							<tr>
								<th>机构代码或信用代码</th>
								<td>
									<input class="ui-input long98" name="register.baoxianjigoudaima" />
								</td>
								<th colspan="2">保险险种</th>
								<td>
									<input class="ui-input long98" name="register.baoxianpinzhong" />
								</td>
							</tr>
							<tr>
								<th>保险价值</th>
								<td>
									<input class="ui-input" name="register.baoxianjiazhi" />万元
								</td>
								<th colspan="2">保险费</th>
								<td>
									<input class="ui-input" name="register.baoxianfei" />万元
								</td>
							</tr>
							<tr>
								<th>保险金额</th>
								<td>
									<input class="ui-input" name="register.baoxianjine" />万元
								</td>
								<th colspan="2"></th>
								<td></td>
							</tr>
							<tr>
								<th rowspan="4">设备变更情况</th>
								<th>变更项目</th>
								<th>变更方式</th>
								<th colspan="2">变更原因</th>
								<th>变更日期</th>
							</tr>
							<tr>
								<td>
									<select class="long98" name="register.biandongxiangmu" id="bdxm">
										<option value=""></option>
										<option value="使用单位">使用单位</option>
										<option value="使用地址">使用地址</option>
										<option value="设备参数">设备参数</option>
									</select>
								</td>
								<td>
									<select class="long98" name="register.biandongfangshi" id="bdfs">
										<option value=""></option>
										<option value="过户">过户</option>
										<option value="移装">移装</option>
										<option value="改造">改造</option>
										<option value="重大维修">重大维修</option>
									</select>
								</td>
								<td colspan="2">
									<select class="long98" name="register.biandongyuanyin" id="bdyy">
										<option value=""></option>
										<option value="转让">转让</option>
										<option value="搬迁">搬迁</option>
										<option value="提高能力">提高能力</option>
										<option value="安全状况不合格">安全状况不合格</option>
									</select>
								</td>
								<td>
									<input class="ui-input long98" name="register.biandongriqi" onclick="WdatePicker()" />
								</td>
							</tr>
								<td>
									<select class="long98" name="register.biandongxiangmu_2" id="bdxm2">
										<option value=""></option>
										<option value="使用单位">使用单位</option>
										<option value="使用地址">使用地址</option>
										<option value="设备参数">设备参数</option>
									</select>
								</td>
								<td>
									<select class="long98" name="register.biandongfangshi_2" id="bdfs2">
										<option value=""></option>
										<option value="过户">过户</option>
										<option value="移装">移装</option>
										<option value="改造">改造</option>
										<option value="重大维修">重大维修</option>
									</select>
								</td>
								<td colspan="2">
									<select class="long98" name="register.biandongyuanyin_2" id="bdyy2">
										<option value=""></option>
										<option value="转让">转让</option>
										<option value="搬迁">搬迁</option>
										<option value="提高能力">提高能力</option>
										<option value="安全状况不合格">安全状况不合格</option>
									</select>
								</td>
								<td>
									<input class="ui-input long98" name="register.biandongriqi_2" onclick="WdatePicker()" />
								</td>
							</tr>
							<tr>
								<td>
									<select class="long98" name="register.biandongxiangmu_3" id="bdxm3">
										<option value=""></option>
										<option value="使用单位">使用单位</option>
										<option value="使用地址">使用地址</option>
										<option value="设备参数">设备参数</option>
									</select>
								</td>
								<td>
									<select class="long98" name="register.biandongfangshi_3" id="bdfs3">
										<option value=""></option>
										<option value="过户">过户</option>
										<option value="移装">移装</option>
										<option value="改造">改造</option>
										<option value="重大维修">重大维修</option>
									</select>
								</td>
								<td colspan="2">
									<select class="long98" name="register.biandongyuanyin_3" id="bdyy3">
										<option value=""></option>
										<option value="转让">转让</option>
										<option value="搬迁">搬迁</option>
										<option value="提高能力">提高能力</option>
										<option value="安全状况不合格">安全状况不合格</option>
									</select>
								</td>
								<td>
									<input class="ui-input long98" name="register.biandongriqi_3" onclick="WdatePicker()" />
								</td>
							</tr>
							<tr>
								<th rowspan="4">设备检验情况</th>
								<th>检验机构名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.jianyandanwei" />
								</td>
							</tr>
							<tr>
								<th>机构组织代码</th>
								<td>
									<input class="ui-input long98" name="register.jianyandanweidaima" />
								</td>
								<th colspan="2">检验类别</th>
								<td>
									<select class="long98" name="register.jianyanleibie" id="jylb">
										<option value=""></option>
										<option value="定期检验">定期检验</option>
										<option value="安装监检">安装监检</option>
										<option value="首次检验">首次检验</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>检验日期</th>
								<td>
									<input class="ui-input long98" name="register.jianyanriqi" onclick="WdatePicker()" />
								</td>
								<th colspan="2">检验结论</th>
								<td>
									<select class="long98" name="register.jianyanjielun" id="jyjl">
										<option value=""></option>
										<option value="合格">合格</option>
										<option value="不合格">不合格</option>
										<option value="复检合格">复检合格</option>
										<option value="复检不合格">复检不合格</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>检验报告编号</th>
								<td>
									<input class="ui-input long98" name="register.baogaoshubianhao" />
								</td>
								<th colspan="2">下次检验日期</th>
								<td>
									<input class="ui-input long98" name="register.xiacijianyanriqi" onclick="WdatePicker()" />
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;">
										说明：<textarea rows="3" style="width: 98%" name="register.shuoming_2"></textarea>
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">使用单位填表人员：</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.tianbiaorenyuan" />
											</td>
											<td style="width: 10%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.tianbiaoriqi" onclick="WdatePicker()" />
											</td>
											<td style="width: 20%">使用单位(公章)</td>
										</tr>
										<tr>
											<td>使用单位安全管理人员：</td>
											<td>${register.anquanguanlirenyuan}</td>
											<td>日期：</td>
											<td>
												<input class="ui-input long98" name="register.aqglry_riqi" onclick="WdatePicker()" />
											</td>
											<td><input class="ui-input long98" name="register.shiyongdanwei_nyr" /></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;">
										说明：<textarea rows="3" style="width: 98%" name="register.shuoming"></textarea>
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">登记机关登记人员：</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.dengjirenyuan" />
											</td>
											<td style="width: 20%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.zhucedengjiriqi" onclick="WdatePicker()" />
											</td>
											<td style="width: 20%">登记机关（专用章）</td>
										</tr>
										<tr>
											<td colspan="4"></td>
											<td><input class="ui-input long98" name="register.dengjijiguan_nyr" /></td>
										</tr>
										<tr>
											<td colspan="2">使用登记证编号：</td>
											<td colspan="3">
												<input class="ui-input long98" name="register.shiyongdengjizhenghaoma" />
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
		   			</div>
		   			<div style="width: 80%;text-align: center;font-size: 30px"><br/>
		   				设备主要安全保护装置情况
		   			</div>
		   			<br/>
	    			<a class="ui-btn ui-btn-sp" id="fssb_add">增加行</a>
		    		<table class="tabjcxx" id="fssb">
		    			<tr>
		    				<th>品种(名称)</th>
		    				<th>型号</th>
		    				<th>规格</th>
		    				<th>数量</th>
		    				<th>制 造 单 位</th>
		    				<th>操作</th>
		    			</tr>
			    			<tr>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.mingcheng"/>
			    				</td>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.xinghao"/>
			    				</td>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.guige"/>
			    				</td>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.shuliang"/>
			    				</td>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.zhizaochangjia"/>
			    				</td>
			    				<td>
			    					<a href="javascript:void(0)" onclick="delRow(this)">删除</a>
			    				</td>
			    			</tr>
		    		</table>
		    	</form>
		    </div>
		</div>
</body>
</html>
	<script type="text/javascript">
	
	$("#djlb").selectmenu();
	$("#czfs").selectmenu();
	$("#jjlx").selectmenu();
	$("#sshy").selectmenu();
	$("#sglb").selectmenu();
	$("#wbxs").selectmenu();
	$("#gzhj").selectmenu();
	$("#yxfs").selectmenu();
	$("#yxczxs").selectmenu();
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
	$("#rrjs").selectmenu();
	 function delRow(obj){  
            var tr=obj.parentNode.parentNode;  
            var tbody=tr.parentNode;  
            tbody.removeChild(tr);
     } 
	$().ready(function(){
		
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"4000"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie,yzc_shebeipinzhong",data.dirDatas,"200px",true,"<%=path%>");
			},"JSON");
			
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			
		//提交表单
		$("#mnubtn_zcdj_add_save").click(function(){
			var options = {
			    url:"<%=path%>/register!save.do?gzid=${gzid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
						parent.showMask("正在保存......");
						return true;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
	            		parent.frames["${param.fid}"].reloadGrid();
						parent.addTabsItem("add_djb_${param.zldm}",rsp.sydw+"_登记表_"+rsp.id,"<%=path%>/register!openZcdjbById.do?id="+rsp.id+"&zldm=${param.zldm}&fid=${param.fid}");
	            	}else{
						$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_zcdj_add${uuid}").ajaxSubmit(options);
	         return false;
		});
		
		$("#fssb_add").click(function(){
			var tr = "<tr>";
			tr += '<td><input class="ui-input long98" name="fssbBean.mingcheng" /></td>';
			tr += '<td><input class="ui-input long98" name="fssbBean.xinghao" /></td>';
			tr += '<td><input class="ui-input long98" name="fssbBean.guige" /></td>';
			tr += '<td><input class="ui-input long98" name="fssbBean.shuliang" /></td>';
			tr += '<td><input class="ui-input long98" name="fssbBean.zhizaochangjia" /></td>';
			tr += '<td><a href="javascript:void(0)" onclick="delRow(this)">删除</a></td>';
			tr += '</tr>';
			$("#fssb").append(tr);
		});
		//根据产品编号提取信息
		$("#mnubtn_zcdj_add_tiqu").click(function(){
			var cpbh = $("#cpbh").val();
			var url = window.location.href;
			if(url.indexOf("cpbh=")>=0){//已经提取过一次的
				url = url.substring(0,url.indexOf("&cpbh="));
			}
			url += "&cpbh="+cpbh;
			window.location.href = url;
		});
		
	});
	
	</script> 