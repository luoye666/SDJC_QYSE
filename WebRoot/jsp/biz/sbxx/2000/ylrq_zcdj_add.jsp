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
  width:90%;
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
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.filepath"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="压力容器"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="2000"/>
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
								<th rowspan="5">设备基本情况</th>
								<th>设备种类</th>
								<td>压力容器</td>
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
								<th colspan="2">产品名称</th>
								<td>
									<input class="ui-input long98" name="register.shebeimingcheng" value="${register.shebeimingcheng}" />
								</td>
							</tr>
							<tr>
								<th>设备代码</th>
								<td>
									<input class="ui-input long98" name="register.shebeidaima" value="${register.shebeidaima}"/>
								</td>
								<th colspan="2">设备型号</th>
								<td>
									<input class="ui-input long98" name="register.shebeixinghao" value="${register.shebeixinghao}" />
								</td>
							</tr>
							<tr>
								<th>压力容器品种</th>
								<td>
									<select class="long98" name="register.ylrq_pinzhong" id="ylrq_pz">
										<option value=""></option>
										<option value="储存容器">储存容器</option>
										<option value="分离容器">分离容器</option>
										<option value="反应容器">反应容器</option>
										<option value="换热容器">换热容器</option>
									</select>
								</td>
								<th colspan="2">主体结构型式</th>
								<td>
									<input class="ui-input long98" name="register.jiegouxingshi" />
								</td>
							</tr>
							<tr>
								<th>设计使用年限</th>
								<td>
									<input class="ui-input" name="register.shejishiyongnianxian" />年
								</td>
								<th colspan="2">固定资产值</th>
								<td>
									<input class="ui-input" name="register.gudingzichan" />万元
								</td>
							</tr>
							<tr>
								<th rowspan="15" style="width: 10%">设备使用情况</th>
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
								<th>单位性质</th>
								<td>
									<select class="long98" name="register.danweixingzhi" id="dwxz">
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
									<input class="ui-input long98" name="register.sydw_fadingdaibiaoren" value="${register.sydw_fadingdaibiaoren}" />
								</td>
								<th colspan="2">安全管理机构</th>
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
								<th>单位内编号</th>
								<td>
									<input class="ui-input long98" name="register.neibubianhao" />
								</td>
								<th colspan="2">设备使用地点</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdidian" value="${register.shiyongdidian}" />
								</td>
							</tr>
							<tr>
								<th style="width: 17%">使用场所类别</th>
								<td style="width: 23%">
									<input class="ui-input long98" name="register.shiyongchanghe" />
								</td>
								<th rowspan="3" style="width: 10%">设备地理信息</th>
								<th style="width: 15%">经度</th>
								<td style="width: 25%">
									<input class="ui-input long98" name="register.jingdu" />
								</td>
							</tr>
							<tr>
								<th>运行状态</th>
								<td>
									<input class="ui-input long98" name="register.yxzt_yongtu" />
								</td>
								<th>纬度</th>
								<td>
									<input class="ui-input long98" name="register.weidu" />
								</td>
							</tr>
							<tr>
								<th>投入使用日期(日期)</th>
								<td>
									<input class="ui-input long98" name="register.touyongriqi" onclick="WdatePicker()" />
								</td>
								<th>海拔高度</th>
								<td>
									<input class="ui-input long98" name="register.haibagaodu" />
								</td>
							</tr>
							<tr>
								<th>投入使用日期(文本)</th>
								<td>
									<input class="ui-input long98" name="register.touyongriqi_str" />
								</td>
								<th colspan="2">产权单位名称</th>
								<td>
									<input class="ui-input long98" name="register.chanquandanwei" />
								</td>
							</tr>
							<tr>
								<th>机构代码或信用代码</th>
								<td>
									<input class="ui-input long98" name="register.chanquandanweidaima" />
								</td>
								<th colspan="2">联系电话</th>
								<td>
									<input class="ui-input long98" name="register.cqdw_dianhua" />
								</td>
							</tr>
							<tr>
								<th>单位性质</th>
								<td>
									<select class="long98" name="register.cqdw_xingzhi" id="cqdw_xz">
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
									<select class="long98" name="register.cqdw_suoshuhangye" id="cqdw_sshy">
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
								<th colspan="2" class="redStyle">产品编号</th>
								<td>
									<input class="ui-input long98 redStyle" name="register.chuchangbianhao" value="${register.chuchangbianhao}" id="cpbh" />
								</td>
							</tr>
							<tr>
								<th>制造日期(日期)</th>
								<td>
									<input class="ui-input long98" name="register.zhizaoriqi" onclick="WdatePicker()" />
								</td>
								<th colspan="2">制造日期(文本)</th>
								<td>
									<input class="ui-input long98" name="register.zhizaoriqi_str" />
								</td>
							</tr>
							<tr>
								<th>产品合格证编号</th>
								<td>
									<input class="ui-input long98" name="register.chanpinhegezhengbianhao" />
								</td>
								<th colspan="2">设计单位名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.shejidanwei" />
								</td>
							</tr>
							<tr>
								<th>设计许可证编号</th>
								<td>
									<input class="ui-input long98" name="register.shejixukezhengbianhao" />
								</td>
								<th colspan="2">产品图号</th>
								<td>
									<input class="ui-input long98" name="register.chanpintuhao" />
								</td>
							</tr>
							<tr>
								<th>型式试验机构</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.xingshishiyanjiegou" />
								</td>
							</tr>
							<tr>
								<th>试验机构核准证编号</th>
								<td>
									<input class="ui-input long98" name="register.shiyanjiegouhezhunzheng" />
								</td>
								<th colspan="2">型式试验证书编号</th>
								<td>
									<input class="ui-input long98" name="register.xingshishiyanzhengshu" />
								</td>
							</tr>
							<tr>
								<th>制造监检机构</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.zhizaojianjianjigou" />
								</td>
							</tr>
							<tr>
								<th>监检机构核准证编号</th>
								<td>
									<input class="ui-input long98" name="register.jianjianjigouhezhunzheng" />
								</td>
								<th colspan="2">制造监检证书编号</th>
								<td>
									<input class="ui-input long98" name="register.zhizaojianjianzhengshu" />
								</td>
							</tr>
							<tr>
								<th rowspan="3">设备施工情况</th>
								<th>施工单位名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.shigongdanwei" value="${register.shigongdanwei}" />
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
									<input class="ui-input long98" name="register.shigongriqi" value="<fmt:formatDate value='${register.shigongriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()" />
								</td>
								<th colspan="2">施工竣工日期</th>
								<td>
									<input class="ui-input long98" name="register.jungongriqi" onclick="WdatePicker()" />
								</td>
							</tr>
							<tr>
								<th rowspan="2">设备工作参数</th>
								<th>工作压力</th>
								<td>
									<input class="ui-input" name="register.gongzuoyali" />Mpa
								</td>
								<th colspan="2">工作温度</th>
								<td>
									<input class="ui-input" name="register.gongzuowendu" />℃
								</td>
							</tr>
							<tr>
								<th>介质</th>
								<td>
									<input class="ui-input long98" name="register.jiezhi" />
								</td>
								<th colspan="2">充装量/额定人数</th>
								<td>
									<input class="ui-input long98" name="register.chongzhuangliang" />
								</td>
							</tr>
							<tr>
								<th rowspan="3">设备保险情况</th>
								<th>保险机构</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.baoxianjigou" />
								</td>
							</tr>
							<tr>
								<th>保险险种</th>
								<td>
									<input class="ui-input long98" name="register.baoxianpinzhong" />
								</td>
								<th colspan="2">保险价值</th>
								<td>
									<input class="ui-input" name="register.baoxianjiazhi" />万元
								</td>
							</tr>
							<tr>
								<th>保险费</th>
								<td>
									<input class="ui-input" name="register.baoxianfei" />万元
								</td>
								<th colspan="2">保险金额</th>
								<td>
									<input class="ui-input" name="register.baoxianjine" />万元
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
										<option value="使用单位更名">使用单位更名</option>
										<option value="变更使用单位">变更使用单位</option>
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
										<option value="使用单位更名">使用单位更名</option>
										<option value="变更使用单位">变更使用单位</option>
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
										<option value="使用单位更名">使用单位更名</option>
										<option value="变更使用单位">变更使用单位</option>
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
								<th>检验机构</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.jianyandanwei" />
								</td>
							</tr>
							<tr>
								<th>机构代码或信用代码</th>
								<td>
									<input class="ui-input long98" name="register.jianyandanweidaima" />
								</td>
								<th colspan="2">检验类别</th>
								<td>
									<select class="long98" name="register.jianyanleibie" id="jylb">
										<option value=""></option>
										<option value="全面检验">全面检验</option>
										<option value="年度检验">年度检验</option>
										<option value="安装监检">安装监检</option>
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
										<option value="符合要求">符合要求</option>
										<option value="基本符合要求 ">基本符合要求</option>
										<option value="不符合要求">不符合要求</option>
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
										    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在此申明：所申报的内容真实；在使用过程中，将严格执行《特种设备安全监察条例》及其相关规定，并接受特种设备安全监督管理部门的监督管理。
									</div>
									<div style="text-align: left;">
										 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;附：产品数据表
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
										<tr>
											<td>首次定期检验日期：</td>
											<td colspan="4" style="text-align: left;">
												<input class="ui-input" name="register.dingqijianyanriqi" onclick="WdatePicker()" />
											</td>
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
												<input class="ui-input long98" name="register.zhucedengjirenyuan" />
											</td>
											<td style="width: 20%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.zhucedengjiriqi" onclick="WdatePicker()" />
											</td>
											<td style="width: 20%">登记机关（专用章）</td>
										</tr>
										<tr>
											<td colspan="4"></td>
											<td>
												<input class="ui-input long98" name="register.dengjijiguan_nyr" />
											</td>
										</tr>
										<tr>
											<td>
												安全状况等级：
												<input class="ui-input" name="register.anquanzhuangkuangdengji" />
											</td>
											<td>监管类别：</td>
											<td>
												<input class="ui-input long98" name="register.jianguanleibie" />
											</td>
											<td>使用登记证编号：</td>
											<td>
												<input class="ui-input long98" name="register.shiyongdengjizhenghaoma" />
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
		   			</div>
		   			<div style="width: 80%;text-align: center;font-size: 30px"><br/>
		   				主要安全附件及附属设备、水处理设备	
		   			</div>
		   			<br/>
	    			<a class="ui-btn ui-btn-sp" id="fssb_add">增加行</a>
		    		<table class="tabjcxx" id="fssb">
		    			<tr>
		    				<th>名称</th>
		    				<th>型号</th>
		    				<th>规格</th>
		    				<th>数量</th>
		    				<th>制造厂家</th>
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
	$("#dwxz").selectmenu();
	$("#sshy").selectmenu();
	$("#cqdw_xz").selectmenu();
	$("#cqdw_sshy").selectmenu();
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
	$("#ylrq_pz").selectmenu();
	
	 function delRow(obj){  
            var tr=obj.parentNode.parentNode;  
            var tbody=tr.parentNode;  
            tbody.removeChild(tr);
     } 
	
	$().ready(function(){
		
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"2000"},
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
			   // 	if(checkZcdmDw()){
						parent.showMask("正在保存......");
						return true;
			   // 	}
			   // 	return false;
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
		
		//添加行
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
		
	});
  	//验证注册代码和使用单位
  	function checkZcdmDw(){
  		var result = false;
  		var zcdm = $("#reg_add").val();
  		var sydw = $("#reg_add_sydw").val();
  		if(zcdm.length < 17 || zcdm.length > 20){
			$.dialog.alert('注册代码位数不正确!');
			return false;
  		}
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/register!verifyByDwmcOrZcdm.do",
		   data:'dwmc='+encodeURI(encodeURI(sydw))+'&zcdm='+zcdm,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result == "0"){
					$.dialog.alert('注册代码重复!');
		   		}else{
		   			result = true;
		   		}
		   }
		});
  		return result;
  	}
	</script> 