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
.sxdiv{
	display: inline;
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
	                	 <input type="hidden" name="register.shebeizhonglei" value="客运索道"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="9000"/>
	                	 <input type="hidden" name="register.tjstate" value="${register.tjstate}"/>
	                	 <input type="hidden" name="register.organ_code" value="${register.organ_code}"/>
	                	 <input type="hidden" name="register.creat_user" value="${register.creat_user}"/>
	                	 <input type="hidden" name="register.wtg_yuanyin" value="${register.wtg_yuanyin}"/>
						 <input type="hidden" name="register.shiyongdanwei" value="${register.shiyongdanwei}"/>
	                </div>
					<div>
						<table class="tabjcxx">
							<tr>
								<th>注册登记机构</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhucedengjijigou" value="${register.zhucedengjijigou}"/>
								</td>
								<th>注册登记日期</th>
								<td>
									<input class="ui-input long98" name="register.zhucedengjiriqi" required="required" onclick="WdatePicker()" value="<fmt:formatDate value='${register.zhucedengjiriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
							</tr>
							<tr>
								<th>设备注册代码</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhucedaima" value="${register.zhucedaima}" id="zcdm"/>
								</td>
								<th>更新日期</th>
								<td>
									<input class="ui-input long98" name="register.gengxinriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.gengxinriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
							</tr>
							<tr>
								<th>单位内部编号</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.neibubianhao" value="${register.neibubianhao}" />
								</td>
								<th>注册登记人员</th>
								<td>
									<input class="ui-input long98" name="register.zhucedengjirenyuan" value="${register.zhucedengjirenyuan}" />
								</td>
							</tr>
							<tr>
								<th>产权单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.chanquandanwei" value="${register.chanquandanwei}"/>
								</td>
								<th>产权单位代码</th>
								<td>
									<input class="ui-input long98" name="register.chanquandanweidaima" value="${register.chanquandanweidaima}"/>
								</td>
							</tr>
							<tr>
								<th>产权单位地址</th>
								<td colspan="3">
									鲁
									<div id="cqdw_shi_div" class="sxdiv">
										<select style="width:120px" sltValue="${register.chanquandanweidizhi_shi_daima}" name="register.chanquandanweidizhi_shi_daima" id="cqdw_shi"></select>
									</div>
									<div id="cqdw_quxian_div" class="sxdiv">
										<select style="width:120px" sltValue="${register.chanquandanweidizhi_qu_daima}" name="register.chanquandanweidizhi_qu_daima" id="cqdw_quxian"></select>
									</div>
								</td>
								<th>邮政编码</th>
								<td>
									<input class="ui-input long98" name="register.cqdw_youzhengbianma" value="${register.cqdw_youzhengbianma}"/>
								</td>
							</tr>
							<tr>
								<th style="width: 15%">单位法人代表</th>
								<td style="width: 20%">
									<input class="ui-input long98" name="register.danweifarendaibiao" value="${register.danweifarendaibiao}" />
								</td>
								<th style="width: 13%">管理负责人</th>
								<td style="width: 20%">
									<input class="ui-input long98" name="register.cqdw_guanlifuzeren" value="${register.cqdw_guanlifuzeren}" />
								</td>
								<th style="width: 12%">联系电话</th>
								<td style="width: 20%">
									<input class="ui-input long98" name="register.farenlianxidianhua" value="${register.farenlianxidianhua}" />
								</td>
							</tr>
							<tr>
								<th>使用单位</th>
								<td colspan="3">
									${register.shiyongdanwei}
								</td>
								<th>使用单位代码</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdanweidaima" value="${register.shiyongdanweidaima}"/>
								</td>
							</tr>
							<tr>
								<th>使用单位地址</th>
								<td colspan="3">
									鲁
									<div id="shi_div" class="sxdiv" onclick="delay()">
										<select style="width:120px" sltValue="${register.shiyongdanweidizhi_shi_daima}" name="register.shiyongdanweidizhi_shi_daima" id="shi"></select>
									</div>
									<div id="quxian_div" class="sxdiv" onclick="delay()">
										<select style="width:120px" sltValue="${register.shiyongdanweidizhi_qu_daima}" name="register.shiyongdanweidizhi_qu_daima" id="quxian"></select>
									</div>
									<div id="xiangzhen_div" class="sxdiv">
										<select style="width:120px" sltValue="${register.suozaixiangzhen_daima}" name="register.suozaixiangzhen_daima" id="xiangzhen"></select>
									</div>
								</td>
								<th>邮政编码</th>
								<td>
									<input class="ui-input long98" name="register.sydw_youzhengbianma" value="${register.sydw_youzhengbianma}"/>
								</td>
							</tr>
							<tr>
								<th>安全管理部门</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlibumen" value="${register.anquanguanlibumen}"/>
								</td>
								<th>安全管理人员</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlirenyuan" value="${register.anquanguanlirenyuan}"/>
								</td>
								<th>联系电话</th>
								<td>
									<input class="ui-input long98" name="register.aqglry_lianxidianhua" value="${register.aqglry_lianxidianhua}"/>
								</td>
							</tr>
							<tr>
								<th>设备使用地点</th>
								<td colspan="3">
									鲁
									<div id="sydd_shi_div" class="sxdiv">
										<select style="width:120px" sltValue="${register.shiyongdidian_shi_daima}" name="register.shiyongdidian_shi_daima" id="sydd_shi"></select>
									</div>
									<div id="sydd_quxian_div" class="sxdiv">
										<select style="width:120px" sltValue="${register.shiyongdidian_qu_daima}" name="register.shiyongdidian_qu_daima" id="sydd_quxian"></select>
									</div>
								</td>
								<th>操作人员</th>
								<td>
									<input class="ui-input long98" name="register.caozuorenyuan" value="${register.caozuorenyuan}"/>
								</td>
							</tr>
							<tr>
								<th>设备类别</th>
								<td>
									<div id="yzc_shebeileibie_div">
										<select name="register.shebeileibiedaima" sltValue="${register.shebeileibiedaima}" class="long98" id="yzc_shebeileibie"></select>
									</div>
					    		</td>
								<th>设备名称</th>
								<td>
									<input class="ui-input long98" name="register.shebeimingcheng" value="${register.shebeimingcheng}"/>
								</td>
								<th>设备型号</th>
								<td>
									<input class="ui-input long98" name="register.shebeixinghao" value="${register.shebeixinghao}"/>
								</td>
							</tr>
							<tr>
								<th>设计单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.shejidanwei" value="${register.shejidanwei}"/>
								</td>
								<th>设计单位代码</th>
								<td>
									<input class="ui-input long98" name="register.shejidanweidaima" value="${register.shejidanweidaima}"/>
								</td>
							</tr>
							<tr>
								<th>制造单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhizaodanwei" value="${register.zhizaodanwei}"/>
								</td>
								<th>制造单位代码</th>
								<td>
									<input class="ui-input long98" name="register.zhizaodanweidaima" value="${register.zhizaodanweidaima}"/>
								</td>
							</tr>
							<tr>
								<th>资格证书名称</th>
								<td>
									<input class="ui-input long98" name="register.zzdw_zigezhengshumingcheng" value="${register.zzdw_zigezhengshumingcheng}"/>
								</td>
								<th>资格证书号</th>
								<td>
									<input class="ui-input long98" name="register.zzdw_zigezhengshuhao" value="${register.zzdw_zigezhengshuhao}"/>
								</td>
								<th>联系电话</th>
								<td>
									<input class="ui-input long98" name="register.zzdw_lianxidianhua" value="${register.zzdw_lianxidianhua}"/>
								</td>
							</tr>
							<tr>
								<th>制造日期(日期)</th>
								<td>
									<input class="ui-input long98" name="register.zhizaoriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.zhizaoriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
								<th>制造日期(文本)</th>
								<td>
									<input class="ui-input long98" name="register.zhizaoriqi_str" value="${register.zhizaoriqi_str}"/>
								</td>
								<th>出厂编号</th>
								<td>
									<input class="ui-input long98" name="register.chuchangbianhao" value="${register.chuchangbianhao}"/>
								</td>
							</tr>
							<tr>
								<th>适用场合</th>
								<td>
									<input class="ui-input long98" name="register.shiyongchanghe" value="${register.shiyongchanghe}"/>
								</td>
								<th>安装单位</th>
								<td>
									<input class="ui-input long98" name="register.anzhuangdanwei" value="${register.anzhuangdanwei}"/>
								</td>
								<th>安装单位代码</th>
								<td>
									<input class="ui-input long98" name="register.anzhuangdanweidaima" value="${register.anzhuangdanweidaima}"/>
								</td>
							</tr>
							<tr>
								<th>资格证书编号</th>
								<td>
									<input class="ui-input long98" name="register.azdw_zigezhengshubianhao" value="${register.azdw_zigezhengshubianhao}"/>
								</td>
								<th>项目负责人</th>
								<td>
									<input class="ui-input long98" name="register.xiangmufuzeren" value="${register.xiangmufuzeren}"/>
								</td>
								<th>联系电话</th>
								<td>
									<input class="ui-input long98" name="register.xmfzr_lianxidianhua" value="${register.xmfzr_lianxidianhua}"/>
								</td>
							</tr>
							<tr>
								<th>土建施工单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.shigongdanwei" value="${register.shigongdanwei}"/>
								</td>
								<th>开始施工日期</th>
								<td>
									<input class="ui-input long98" name="register.shigongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.shigongriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
							</tr>
							<tr>
								<th>土建验收单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.yanshoudanwei" value="${register.yanshoudanwei}"/>
								</td>
								<th>竣工验收日期</th>
								<td>
									<input class="ui-input long98" name="register.jungongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.jungongriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
							</tr>
							<tr>
								<th>验收检验机构</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.yanshoujianyanjigou" value="${register.yanshoujianyanjigou}"/>
								</td>
								<th>验收报告编号</th>
								<td>
									<input class="ui-input long98" name="register.yanshoubaogaobianhao" value="${register.yanshoubaogaobianhao}"/>
								</td>
							</tr>
							<tr>
								<th>投用日期(日期)</th>
								<td>
									<input class="ui-input long98" name="register.touyongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.touyongriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
								<th>投用日期(文本)</th>
								<td>
									<input class="ui-input long98" name="register.touyongriqi_str" value="${register.touyongriqi_str}"/>
								</td>
								<th>维修周期(周)</th>
								<td>
									<input class="ui-input long98" name="register.weibaozhouqi" value="${register.weibaozhouqi}"/>
								</td>
							</tr>
							<tr>
								<th>大修周期(月)</th>
								<td>
									<input class="ui-input long98" name="register.daxiuzhouqi" value="${register.daxiuzhouqi}"/>
								</td>
								<th>维修保养单位</th>
								<td>
									<input class="ui-input long98" name="register.weibaodanwei" value="${register.weibaodanwei}"/>
								</td>
								<th>维保单位代码</th>
								<td>
									<input class="ui-input long98" name="register.weibaodanweidaima" value="${register.weibaodanweidaima}"/>
								</td>
							</tr>
							<tr>
								<th>资格证书号</th>
								<td>
									<input class="ui-input long98" name="register.wbdw_zigezhengshuhao" value="${register.wbdw_zigezhengshuhao}"/>
								</td>
								<th>维保责任人</th>
								<td>
									<input class="ui-input long98" name="register.weibaofuzeren" value="${register.weibaofuzeren}"/>
								</td>
								<th>电话</th>
								<td>
									<input class="ui-input long98" name="register.weibaofuzerendianhua" value="${register.weibaofuzerendianhua}"/>
								</td>
							</tr>
							<tr>
								<th colspan="6">设备主要参数</th>
							</tr>
							<tr>
								<th>运行速度(m/s)</th>
								<td>
									<input class="ui-input long98" name="register.yunxingsudu" value="${register.yunxingsudu}" />
								</td>
								<th>索道长度(m)</th>
								<td>
									<input class="ui-input long98" name="register.changdu" value="${register.changdu}" />
								</td>
								<th>运载能力(p/h)</th>
								<td>
									<input class="ui-input long98" name="register.yunzainengli" value="${register.yunzainengli}" />
								</td>
							</tr>
							<tr>
								<th>运载车辆形式</th>
								<td>
									<s:select style="width: 179px" id="clxs" name="register.yunzaicheliangxingshi" list="#{'':'','吊厢式':'吊厢式','吊蓝式':'吊蓝式','吊椅式':'吊椅式','拖牵式':'拖牵式'}" value="register.yunzaicheliangxingshi"></s:select>
								</td>
								<th></th><td></td><th></th><td></td>
							</tr>
							<tr>
								<th>检验单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.jianyandanwei" value="${register.jianyandanwei}"/>
								</td>
								<th>检验单位代码</th>
								<td>
									<input class="ui-input long98" name="register.jianyandanweidaima" value="${register.jianyandanweidaima}"/>
								</td>
							</tr>
							<tr>
								<th>检验日期</th>
								<td>
									<input class="ui-input long98" name="register.jianyanriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.jianyanriqi}' pattern='yyyy-MM-dd'/>" required="required"/>
								</td>
								<th>检验类别</th>
								<td>
									<s:select style="width: 179px" id="jylb" name="register.jianyanleibie" list="#{'':'','全面检验':'全面检验','在线检验':'在线检验','安装监检':'安装监检'}" value="register.jianyanleibie"></s:select>
								</td>
								<th>主要问题</th>
								<td>
									<input class="ui-input long98" name="register.zhuyaowenti" value="${register.zhuyaowenti}"/>
								</td>
							</tr>
							<tr>
								<th>检验结论</th>
								<td>
									<s:select style="width: 179px" id="jyjl" name="register.jianyanjielun" list="#{'':'','允许运行':'允许运行','整改后运行':'整改后运行','限制条件运行':'限制条件运行','停止运行':'停止运行','监督运行':'监督运行','合格':'合格','不合格':'不合格','无':'无'}" value="register.jianyanjielun"></s:select>
								</td>
								<th>报告书编号</th>
								<td>
									<input class="ui-input long98" name="register.baogaoshubianhao" value="${register.baogaoshubianhao}"/>
								</td>
								<th>下次检验日期</th>
								<td>
									<input class="ui-input long98" name="register.xiacijianyanriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" required="required"/>
								</td>
							</tr>
							<tr>
								<th>事故类别</th>
								<td>
									<s:select style="width: 179px" id="sglb" name="register.shiguleibie" list="#{'':'','特大':'特大','重大':'重大','严重':'严重','一般':'一般','无':'无'}" value="register.shiguleibie"></s:select>
								</td>
								<th>事故发生日期</th>
								<td>
									<input class="ui-input long98" name="register.shigufashengriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.shigufashengriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
								<th>事故处理结果</th>
								<td>
									<s:select style="width: 179px" id="sgcljg" name="register.shiguchulijieguo" list="#{'':'','无此项':'无此项','未结案':'未结案','已结案':'已结案'}" value="register.shiguchulijieguo"></s:select>
								</td>
							</tr>
							<tr>
								<th>设备变动方式</th>
								<td>
									<input class="ui-input long98" name="register.biandongfangshi" value="${register.biandongfangshi}"/>
								</td>
								<th>变动主要项目</th>
								<td>
									<input class="ui-input long98" name="register.biandongxiangmu" value="${register.biandongxiangmu}"/>
								</td>
								<th>设备变动日期</th>
								<td>
									<input class="ui-input long98" name="register.biandongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.biandongriqi}' pattern='yyyy-MM-dd'/>"/>
								</td>
							</tr>
							<tr>
								<th>变动承担单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.chengdandanwei" value="${register.chengdandanwei}"/>
								</td>
								<th>承担单位代码</th>
								<td>
									<input class="ui-input long98" name="register.chengdandanweidaima" value="${register.chengdandanweidaima}"/>
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
					 <div style="width: 80%;text-align: center;font-size: 30px"><br/>
		   				主要安全附件及附属设备、水处理设备	
		   			</div>
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
		    			<c:forEach var="f" items="${fssbList}">
			    			<tr>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.mingcheng" value="${f.mingcheng}"/>
			    				</td>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.xinghao" value="${f.xinghao}"/>
			    				</td>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.guige" value="${f.guige}"/>
			    				</td>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.shuliang" value="${f.shuliang}"/>
			    				</td>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.zhizaochangjia" value="${f.zhizaochangjia}"/>
			    				</td>
			    				<td>
			    					<a href="javascript:void(0)" onclick="delRow(this)">删除</a>
			    				</td>
			    			</tr>
		    			</c:forEach>
		    		</table>
		    	</form>
		    </div>
		</div>
	<iframe id="dwzhDownloadFile" height="0" width="0" src="" style="display: none;"></iframe>
</body>
</html>
	<script type="text/javascript">
	
	$("#jylb").selectmenu();
	$("#jyjl").selectmenu();
	$("#sglb").selectmenu();
	$("#sgcljg").selectmenu();
	$("#rkmjq").selectmenu();
	$("#zdwxy").selectmenu();
	$("#yjcs").selectmenu();
	$("#zdjk").selectmenu();
	$("#clxs").selectmenu();
	
	//编辑行的下标
	 function delRow(obj){  
            var tr=obj.parentNode.parentNode;  
            var tbody=tr.parentNode;  
            tbody.removeChild(tr);
     } 
	/**
	* 
	*/
	$().ready(function(){
		
		if("${register.tjstate}" == "1" || "${register.tjstate}" == "2"){
			$("#mnubtn_zcdj_edit_tj").hide();
			$("#mnubtn_zcdj_edit_save").hide();
		}
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("cqdw_shi,cqdw_quxian",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("sydd_shi,sydd_quxian",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"9000"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie",data.dirDatas,"200px",false,"<%=path%>");
			},"JSON");
			
		if("${register.fj_filepath}" != ""){
			var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\'${register.fj_filepath}\')">下载附件</a>';
			$("#zcdjb_fj_${uuid}").html(down);
		}
		//提交
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
		
		
		//下载登记表
		$("#mnubtn_baseInfo_edit_djb_xz").click(function(){
			var path = $("#zcdjb_filepath_${uuid}").attr("value");
			if(path == ""){
				$.dialog.alert('未找到源文件，该登记表可能是新建的');
				return false;
			}else{
				parent.downloadFile(path);
			}
		});
			//打印
			$("#mnubtn_jcsj_zcdj_edit_dy").click(function(){
				var id = $("#reg_id_${uuid}").attr("value");
				window.open ('<%=path%>/register!djbDyByJsp.do?id='+id,'登记表打印窗口','height=500,width=650,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no'); 
			});
		//增加
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
	
			//使window.open弹出的窗口居中
			function openwindow(url,iWidth,iHeight) {
				var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
				var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
				var i=window.open("","批量打印",'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
				setTimeout(function(){
					i.location=url;
				}, 600);
			}
			function save(tjstate){
				var options = {
				    url:"<%=path%>/register!update.do?tjstate="+tjstate,
					dataType:'json',
		            beforeSubmit:function(formData, jqForm, options){
				    	if(tjstate == '2'){
				    		if(!verifySelect()){ 
				    			$.dialog.alert('有必填项未填！');
				    			return false;
				    		}
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
		            	}else{
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