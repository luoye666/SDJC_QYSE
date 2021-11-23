<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.sys.pojo.TOrgan"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/c.tld" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ taglib prefix="fn" uri="/fn.tld" %>
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
<link href="<%=path %>/css/page_tabs/page_tabs.css" rel="stylesheet" type="text/css">
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
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_edit_save">临时保存</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_edit_tj">提交至审核</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_zcdj_edit_dy">打印</a>
	  </div>
		    	<form id="frm_zcdj_edit${uuid}" method="post" enctype="multipart/form-data">
				<div id="tabbox">
					<ul class="tabs" id="tabs">
						<li><a href="javascript:void(0)">登记表</a></li>
						<li><a href="javascript:void(0)">产品数据表</a></li>
					</ul>
					<ul class="tab_conbox" id="tab_conbox">
						<li class="tab_con">
		   			<div style="width: 80%;text-align: center;font-size: 30px">
		   				特种设备使用登记表
		   			</div>
		   			<br/>
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.id" id="reg_id_${uuid}" value="${register.id}"/>
	                	 <input type="hidden" name="register.filepath" id="zcdjb_filepath_${uuid}" value="${register.filepath}"/>
	                	 <input type="hidden" name="register.fj_filepath" id="zcdjb_filepath_hid_${uuid}" value="${register.fj_filepath}"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="${register.shebeizhonglei}"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="${register.shebeizhongleidaima}"/>
	                	 <input type="hidden" name="register.shebeileibie" value="${register.shebeileibie}"/>
	                	 <input type="hidden" name="register.shebeileibiedaima" value="${register.shebeileibiedaima}"/>
	                	 <input type="hidden" name="register.tjstate" value="${register.tjstate}"/>
	                	 <input type="hidden" name="register.organ_code" value="${register.organ_code}"/>
	                	 <input type="hidden" name="register.creat_user" value="${register.creat_user}"/>
	                	 <input type="hidden" name="register.wtg_yuanyin" value="${register.wtg_yuanyin}"/>
	                	 <input type="hidden" name="register.djz_bf" value="${register.djz_bf}"/>
	                	 <input type="hidden" name="register.djz_af" value="${register.djz_af}"/>
	                	 <input type="hidden" name="register.djz_liushuihao" value="${register.djz_liushuihao}"/>
						 <input type="hidden" name="register.shiyongdanwei" value="${register.shiyongdanwei}" id="reg_add_sydw_${uuid}"/>
	                	 <input type="hidden" name="register.shiyongdengjizhenghaoma" value="${register.shiyongdengjizhenghaoma}"/>
	                </div>
						<div id="message_${uuid}" style="text-align: center;width: 80%"></div>
						<table>
							<tr>
								<th>登记类别：</th>
								<td>
									<select class="long98" name="register.dengjileibie" id="djlb">
										<option value=""></option>
										<option value="新设备首次启用" ${register.dengjileibie=="新设备首次启用" ? "selected":""}>新设备首次启用</option>
										<option value="停用后启用" ${register.dengjileibie=="停用后启用" ? "selected":""}>停用后启用</option>
										<option value="改造" ${register.dengjileibie=="改造" ? "selected":""}>改造</option>
										<option value="使用单位更名" ${register.dengjileibie=="使用单位更名" ? "selected":""}>使用单位更名</option>
										<option value="使用地址变更" ${register.dengjileibie=="使用地址变更" ? "selected":""}>使用地址变更</option>
										<option value="过户" ${register.dengjileibie=="过户" ? "selected":""}>过户</option>
										<option value="移装" ${register.dengjileibie=="移装" ? "selected":""}>移装</option>
										<option value="达到设计使用年限" ${register.dengjileibie=="达到设计使用年限" ? "selected":""}>达到设计使用年限</option>
									</select>
								</td>
							</tr>
						</table>
						<table class="tabjcxx">
							<tr>
								<th rowspan="6" style="width: 10%">设备基本情况</th>
								<th style="width: 15%">设备品种</th>
								<td style="width: 35%">
									<div id="yzc_shebeipinzhong_div">
					    				<select class="long98" name="register.shebeipinzhongdaima" sltValue="${register.shebeipinzhongdaima}" id="yzc_shebeipinzhong"></select>
									</div>
								</td>
								<th colspan="2" style="width: 20%">产品名称</th>
								<td style="width: 20%">
									<input class="ui-input long98" name="register.shebeimingcheng" value="${register.shebeimingcheng}" />
					    		</td>
							</tr>
							<tr>
								<th>气瓶数量</th>
								<td>
									<input class="ui-input long98" name="register.shebeishuliang" value="${register.shebeishuliang}" />
								</td>
								<th colspan="2">充装介质</th>
								<td>
									<input class="ui-input long98" name="register.chongzhuangjiezhi" value="${register.chongzhuangjiezhi}"/>
								</td>
							</tr>
							<tr>
								<th>气瓶公称工作压力</th>
								<td>
									<input class="ui-input" name="register.gongzuoyali" value="${register.gongzuoyali}" />MPa
								</td>
								<th colspan="2">气瓶容积</th>
								<td>
									<input class="ui-input long98" name="register.rongji" value="${register.rongji}" />
								</td>
							</tr>
							<tr>
								<td colspan="6">
	    							<a class="ui-btn ui-btn-sp" id="xinxi_add">增加行</a>
									<table style="width: 100%;border: none;" id="xinxi">
										<tr>
											<th style="border-left: none;">制造单位名称</th>
											<th>制造日期</th>
											<th>产品编号</th>
											<th>单位内编号</th>
											<th style="border-right: none;">操作</th>
										</tr>
										<c:forEach var="x" items="${qpxxList}" varStatus="i">
										<c:if test="${x.type=='djb'}">
										<tr>
											<td style="border-bottom: none;border-left: none;">
			    								<input type="hidden" name="cyqp_xx_list[${i.index}].type" value="${x.type}"/>
			    								<input class="ui-input long98" name="cyqp_xx_list[${i.index}].zhizaodanwei" value="${x.zhizaodanwei} "/>
											</td>
											<td style="border-bottom: none;">
			    								<input class="ui-input long98" name="cyqp_xx_list[${i.index}].zhizaoriqi" value="${x.zhizaoriqi }"/>
											</td>
											<td style="border-bottom: none;">
			    								<input class="ui-input long98" name="cyqp_xx_list[${i.index}].chanpinbianhao" value="${x.chanpinbianhao}"/>
											</td>
											<td style="border-bottom: none;">
			    								<input class="ui-input long98" name="cyqp_xx_list[${i.index}].danweineibianhao" value="${x.danweineibianhao}"/>
											</td>
							    			<td style="border-bottom: none;border-right: none;">
							    				<a href="javascript:void(0)" onclick="delRow(this)">删除</a>
							    			</td>
										</tr>
										</c:if>
										</c:forEach>
									</table>
								</td>
							</tr>
							<tr>
								<th>施工单位名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.shigongdanwei" value="${register.shigongdanwei}" />
								</td>
							</tr>
							<tr>
								<th>监督检验机构名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.jianjiandanwei" value="${register.jianjiandanwei}" />
								</td>
							</tr>
							<tr>
								<th rowspan="8" style="width: 10%">设备使用情况</th>
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
								<th colspan="2">下次检验日期</th>
								<td>
									<input class="ui-input long98" name="register.xiacijianyanriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" required="required"/>
								</td>
							</tr>
							<tr>
								<th>使用单位统一社会</br>信用代码</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdanweidaima" value="${register.shiyongdanweidaima}" />
								</td>
								<th colspan="2">邮政编码</th>
								<td>
									<input class="ui-input long98" name="register.sydw_youzhengbianma" value="${register.sydw_youzhengbianma}" />
								</td>
							</tr>
							<tr>
								<th>车牌号</th>
								<td>
									<input class="ui-input long98" name="register.chepaihao" value="${register.chepaihao}" />
								</td>
								<th colspan="2">车辆VIN码</th>
								<td>
									<input class="ui-input long98" name="register.vinma" value="${register.vinma}" />
								</td>
							</tr>
							<tr>
								<th>投入使用日期(日期)</th>
								<td>
									日期：<input class="ui-input" name="register.touyongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.touyongriqi}' pattern='yyyy-MM-dd'/>" />
									文本：<input class="ui-input" name="register.touyongriqi_str" value="${register.touyongriqi_str}" />
								</td>
								<th colspan="2">单位固定电话</th>
								<td>
									<input class="ui-input long98" name="register.sydw_gudingdianhua" value="${register.sydw_gudingdianhua}" />
								</td>
							</tr>
							<tr>
								<th>安全管理人员</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlirenyuan" value="${register.anquanguanlirenyuan}"/>
								</td>
								<th colspan="2">移动电话</th>
								<td>
									<input class="ui-input long98" name="register.aqglry_lianxidianhua" value="${register.aqglry_lianxidianhua}" />
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;">
										    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在此申明：所申报的内容真实；在使用过程中，将严格执行《中华人民共和国特种设备安全法》及相关规定，并且接受特种设备安全监督管理部门的监督管理。
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
											<td style="width: 20%">(使用单位公章)</td>
										</tr>
										<tr>
											<td>使用单位安全管理人员：</td>
											<td>${register.anquanguanlirenyuan}</td>
											<td>日期：</td>
											<td>
												<input class="ui-input long98" name="register.aqglry_riqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.aqglry_riqi}' pattern='yyyy-MM-dd'/>"/>
											</td>
											<td><input class="ui-input long98" name="register.shiyongdanwei_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})" value="${register.shiyongdanwei_nyr}"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;">
										说明：<textarea rows="3" style="width: 98%" name="register.beizhu">${register.beizhu}</textarea>
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">登记机关登记人员：</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.zhucedengjirenyuan" value="${register.zhucedengjirenyuan}"/>
											</td>
											<td style="width: 20%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.zhucedengjiriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.zhucedengjiriqi}' pattern='yyyy-MM-dd'/>" required="required" />
											</td>
											<td style="width: 20%">（登记机关专用章）</td>
										</tr>
										<tr>
											<td>使用登记证编号：</td>
											<td>
												${register.shiyongdengjizhenghaoma}
											</td>
											<td>登记机关</td>
											<td>
												<input class="ui-input long98" name="register.zhucedengjijigou" value="${register.zhucedengjijigou}" />
											</td>
											<td><input class="ui-input long98" name="register.dengjijiguan_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})" value="${register.dengjijiguan_nyr}"/></td>
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
						</li>
						<li class="tab_con">
								<div style="width: 80%; text-align: center; font-size: 30px">
									车用气瓶产品数据表
								</div>
								<br/>
								<table class="tabjcxx">
									<tr>
										<th colspan="2">产品名称</th>
										<td colspan="2">
											${register.shebeimingcheng}
										</td>
										<th>设备品种</th>
										<td colspan="2">
											${register.shebeipinzhong}
										</td>
									</tr>
									<tr>
										<th colspan="2">产品标准</th>
										<td colspan="2">
											<input class="ui-input long98" name="register.zhizaobiaozhun" value="${register.zhizaobiaozhun}" />
										</td>
										<th>设备代码</th>
										<td colspan="2">
											<input class="ui-input long98" name="register.shebeidaima" value="${register.shebeidaima}" />
										</td>
									</tr>
									<tr>
										<th colspan="2">车牌号</th>
										<td colspan="2">
											${register.chepaihao}
										</td>
										<th>车辆VIN码</th>
										<td colspan="2">
											${register.vinma}
										</td>
									</tr>
									<tr>
										<th colspan="2">额定质量</th>
										<td colspan="2">
											<input class="ui-input long85" name="register.edingzhiliang" value="${register.edingzhiliang}" />kg
										</td>
										<th>介质</th>
										<td colspan="2">
											${register.chongzhuangjiezhi}
										</td>
									</tr>
									<tr>
										<th colspan="2">使用环境温度</th>
										<td colspan="2">
											<input class="ui-input long85" name="register.huanjingwendu" value="${register.huanjingwendu}" />℃
										</td>
										<th>设计使用年限</th>
										<td colspan="2">
											<input class="ui-input long85" name="register.shejishiyongnianxian" value="${register.shejishiyongnianxian}" />年
										</td>
									</tr>
									<tr>
										<th colspan="7">气瓶及管路</th>
									</tr>
									<tr>
										<th rowspan="5" style="width: 5%">性能参数</th>
										<th style="width: 10%">型  号</th>
										<td style="width: 15%">
											<input class="ui-input long98" name="register.cs_xinghao" value="${register.cs_xinghao}" />
										</td>
										<th style="width: 15%">数  量</th>
										<td style="width: 20%">
											<input class="ui-input long98" name="register.cs_shuliang" value="${register.cs_shuliang}" />
										</td>
										<th style="width: 10%">单瓶容积</th>
										<td style="width: 25%">
											<input class="ui-input long85" name="register.cs_danpingrongji" value="${register.cs_danpingrongji}" />m3
										</td>
									</tr>
									<tr>
										<th>总容积</th>
										<td>
											<input class="ui-input" name="register.cs_zongrongji" value="${register.cs_zongrongji}" />m3
										</td>
										<th>规  格</th>
										<td colspan="3">
											外径：<input class="ui-input" name="register.cs_guige_waijing" value="${register.cs_guige_waijing}" />
											壁厚：<input class="ui-input" name="register.cs_guige_bihou" value="${register.cs_guige_bihou}" />
											长度：<input class="ui-input" name="register.cs_guige_changdu" value="${register.cs_guige_changdu}" />(mm)
										</td>
									</tr>
									<tr>
										<th>公称工作压力</th>
										<td colspan="2">
											<input class="ui-input long85" name="register.cs_gongzuoyali" value="${register.cs_gongzuoyali}" />MPa
										</td>
										<th rowspan="3">材料</th>
										<th>瓶体</th>
										<td>
											<input class="ui-input long98" name="register.cs_cl_pingti" value="${register.cs_cl_pingti}" />
										</td>
									</tr>
									<tr>
										<th rowspan="2">设计使用年限</th>
										<td rowspan="2" colspan="2">
											<input class="ui-input long85" name="register.cs_shejishiyongnianxian" value="${register.cs_shejishiyongnianxian}" />年
										</td>
										<th>端塞</th>
										<td>
											<input class="ui-input long98" name="register.cs_cl_duansai" value="${register.cs_cl_duansai}"/>
										</td>
									</tr>
									<tr>
										<th>管路</th>
										<td>
											<input class="ui-input long98" name="register.cs_cl_guanlu" value="${register.cs_cl_guanlu}"/>
										</td>
									</tr>
									<tr>
										<th rowspan="5">检验试验</th>
										<th rowspan="2">无损检测方法</th>
										<th>气瓶</th>
										<td>
											<input class="ui-input long98" name="register.sy_wsjcff_qiping" value="${register.sy_wsjcff_qiping}"/>
										</td>
										<th rowspan="2">无损检测比例</th>
										<th>气瓶</th>
										<td>
											<input class="ui-input long85" name="register.sy_wsjcbl_qiping" value="${register.sy_wsjcbl_qiping}"/>％
										</td>
									</tr>
									<tr>
										<th>管路</th>
										<td>
											<input class="ui-input long98" name="register.sy_wsjcff_guanlu" value="${register.sy_wsjcff_guanlu}"/>
										</td>
										<th>管路</th>
										<td>
											<input class="ui-input long85" name="register.sy_wsjcbl_guanlu" value="${register.sy_wsjcbl_guanlu}"/>％
										</td>
									</tr>
									<tr>
										<th rowspan="2">耐压试验压力</th>
										<th>气瓶</th>
										<td>
											<input class="ui-input" name="register.sy_nysy_qiping" value="${register.sy_nysy_qiping}"/>MPa
										</td>
										<th rowspan="2">气密性试验压力</th>
										<th>气瓶</th>
										<td>
											<input class="ui-input" name="register.sy_qmsy_qiping" value="${register.sy_qmsy_qiping}"/>MPa
										</td>
									</tr>
									<tr>
										<th>管路</th>
										<td>
											<input class="ui-input" name="register.sy_nysy_guanlu" value="${register.sy_nysy_guanlu}"/>MPa
										</td>
										<th>管路</th>
										<td>
											<input class="ui-input" name="register.sy_qmsy_guanlu" value="${register.sy_qmsy_guanlu}"/>MPa
										</td>
									</tr>
									<tr>
										<th colspan="2">气体置换后压力</th>
										<td>
											<input class="ui-input" name="register.zhihuanyali" value="${register.zhihuanyali}"/>MPa
										</td>
										<th colspan="2">瓶体内含氧量</th>
										<td>
											<input class="ui-input long85" name="register.hanyangliang" value="${register.hanyangliang}"/>％
										</td>
									</tr>
									<tr>
										<th colspan="2">热处理方式</th>
										<td colspan="2">
											<input class="ui-input long98" name="register.rechulifangshi" value="${register.rechulifangshi}"/>
										</td>
										<th>热处理温度</th>
										<td colspan="2">
											<input class="ui-input long85" name="register.rechuliwendu" value="${register.rechuliwendu}"/>℃
										</td>
									</tr>
									<tr>
										<th colspan="2">气瓶安装位置</th>
										<td colspan="5">
											<input class="ui-input long98" name="register.shiyongdidian" value="${register.shiyongdidian}"/>
										</td>
									</tr>
									<tr>
										<td colspan="7">
			    							<a class="ui-btn ui-btn-sp" id="cpsjb_qplb_add">增加行</a>
											<br/>
											<table style="width: 100%;border: none;" id="cpsjb_qplb_tab">
												<tr>
													<th style="border-left: none;">序号</th>
													<th>气瓶批号</th>
													<th>编号</th>
													<th>净重(kg)</th>
													<th style="border-right: none;">操作</th>
												</tr>
												<c:forEach items="${qpxxList}" var="q" varStatus="i">
												<c:if test="${q.type == 'cpsjb'}">
												<tr>
													<td style="border-bottom: none;border-left: none;">
														<input type="hidden" name="cyqp_xx_list[${i.index}].type" value="cpsjb"/>
					    								<input class="ui-input long98" name="cyqp_xx_list[${i.index}].xuhao" value="${q.xuhao}"/>
													</td>
													<td style="border-bottom: none;">
					    								<input class="ui-input long98" name="cyqp_xx_list[${i.index}].pihao" value="${q.pihao}"/>
													</td>
													<td style="border-bottom: none;">
					    								<input class="ui-input long98" name="cyqp_xx_list[${i.index}].chanpinbianhao" value="${q.chanpinbianhao}"/>
													</td>
													<td style="border-bottom: none;">
					    								<input class="ui-input long98" name="cyqp_xx_list[${i.index}].jingzhong" value="${q.jingzhong}"/>
													</td>
									    			<td style="border-bottom: none;border-right: none;">
									    				<a href="javascript:void(0)" onclick="delRow(this)">删除</a>
									    			</td>
												</tr>
												</c:if>
												</c:forEach>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan="7">
			    							<a class="ui-btn ui-btn-sp" id="aqfj_add">增加行</a>
											<b>安全附件</b>
											<br/>
											<table style="width: 100%;border: none;" id="aqfj_tab">
												<tr>
													<th style="border-left: none;">名称</th>
													<th>型号</th>
													<th>规格</th>
													<th>数量</th>
													<th>制造单位</th>
													<th style="border-right: none;">操作</th>
												</tr>
												<c:forEach items="${fjfjList}" var="f" varStatus="i">
												<tr>
													<td style="border-bottom: none;border-left: none;">
					    								<input class="ui-input long98" name="fjfj_list[${i.index}].mingcheng" value="${f.mingcheng}"/>
													</td>
													<td style="border-bottom: none;">
					    								<input class="ui-input long98" name="fjfj_list[${i.index}].xinghao" value="${f.xinghao}"/>
													</td>
													<td style="border-bottom: none;">
					    								<input class="ui-input long98" name="fjfj_list[${i.index}].guige" value="${f.guige}"/>
													</td>
													<td style="border-bottom: none;">
					    								<input class="ui-input long98" name="fjfj_list[${i.index}].shuliang" value="${f.shuliang}"/>
													</td>
													<td style="border-bottom: none;">
					    								<input class="ui-input long98" name="fjfj_list[${i.index}].zhizaochangjia" value="${f.zhizaochangjia}"/>
													</td>
									    			<td style="border-bottom: none;border-right: none;">
									    				<a href="javascript:void(0)" onclick="delRow(this)">删除</a>
									    			</td>
												</tr>
												</c:forEach>
											</table>
										</td>
									</tr>
									<tr>
										<th rowspan="2">制造监检情况</th>
										<th colspan="2">监督检验机构</th>
										<td colspan="4">
					    					<input class="ui-input long98" name="register.zhizaojianjianjigou" value="${register.zhizaojianjianjigou}"/>
										</td>
									</tr>
									<tr>
										<th colspan="2">监督检验机构统一社会信用代码</th>
										<td>
					    					<input class="ui-input long98" name="register.zhizaojianjianjigou_daima" value="${register.zhizaojianjianjigou_daima}"/>
										</td>
										<th colspan="2">机构核准证编号</th>
										<td>
					    					<input class="ui-input long98" name="register.jianjianjigouhezhunzheng" value="${register.jianjianjigouhezhunzheng}"/>
										</td>
									</tr>
								</table>
						</li>
					</ul>

				</div>
		    	</form>
		</div>
</body>
</html>
<script src="<%=path %>/js/page_tabs/page_tabs.js"></script>
	<script type="text/javascript">
	
	$("#djlb").selectmenu();
	var qpxxnum = "${fn:length(qpxxList)}";
	var aqfjnum = "${fn:length(fjfjList)}";
	
	$().ready(function(){
		
		if("${register.tjstate}" == "1" || "${register.tjstate}" == "2"){
			$("#mnubtn_zcdj_edit_tj").hide();
			$("#mnubtn_zcdj_edit_save").hide();
		}
		
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${register.shebeileibiedaima}"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeipinzhong",data.dirDatas,"200px",false,"<%=path%>");
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
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
		
		
		//下载登记表
		$("#mnubtn_baseInfo_edit_djb_xz${uuid}").click(function(){
			var path = $("#zcdjb_filepath_${uuid}").attr("value");
			if(path == ""){
				$.dialog.alert('未找到源文件，该登记表可能是新建的');
				return false;
			}else{
				parent.downloadFile(path);
			}
		});
			//打印
			$("#mnubtn_jcsj_zcdj_edit_dy${uuid}").click(function(){
				var id = $("#reg_id_${uuid}").attr("value");
			//	openwindow("<%=path%>/jsp/biz/sbxx/zcdj/PrintPage.html?urls="+id+"&bglx=yl",400,200);
				window.open ('<%=path%>/register!djbDyByJsp.do?id='+id,'登记表打印窗口','height=500,width=650,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no'); 
			});
			
			appendSelTo();
			
		//添加行
		$("#xinxi_add").click(function(){
			var tr = "<tr>";
			tr += '<td style="border-bottom: none;border-left: none;"><input class="ui-input long98" name="cyqp_xx_list['+qpxxnum+'].zhizaodanwei" />' +
			'<input type="hidden" name="cyqp_xx_list['+qpxxnum+'].type" value="djb"/></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="cyqp_xx_list['+qpxxnum+'].zhizaoriqi" /></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="cyqp_xx_list['+qpxxnum+'].chanpinbianhao" /></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="cyqp_xx_list['+qpxxnum+'].danweineibianhao" /></td>';
			tr += '<td style="border-bottom: none;border-right: none;"><a href="javascript:void(0)" onclick="delRow(this)">删除</a></td>';
			tr += '</tr>';
			$("#xinxi").append(tr);
			qpxxnum++;
		});
		//安全附件添加行
		$("#aqfj_add").click(function(){
			var tr = "<tr>";
			tr += '<td style="border-bottom: none;border-left: none;"><input class="ui-input long98" name="fjfj_list['+aqfjnum+'].mingcheng" /></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="fjfj_list['+aqfjnum+'].xinghao" /></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="fjfj_list['+aqfjnum+'].guige" /></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="fjfj_list['+aqfjnum+'].shuliang" /></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="fjfj_list['+aqfjnum+'].zhizaochangjia" /></td>';
			tr += '<td style="border-bottom: none;border-right: none;"><a href="javascript:void(0)" onclick="delRow(this)">删除</a></td>';
			tr += '</tr>';
			$("#aqfj_tab").append(tr);
			aqfjnum++;
		});
		//产品数据表气瓶列表添加行
		$("#cpsjb_qplb_add").click(function(){
			var tr = "<tr>";
			tr += '<td style="border-bottom: none;border-left: none;"><input class="ui-input long98" name="cyqp_xx_list['+qpxxnum+'].xuhao" />' +
			'<input type="hidden" name="cyqp_xx_list['+qpxxnum+'].type" value="cpsjb"/></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="cyqp_xx_list['+qpxxnum+'].pihao" /></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="cyqp_xx_list['+qpxxnum+'].chanpinbianhao" /></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="cyqp_xx_list['+qpxxnum+'].jingzhong" /></td>';
			tr += '<td style="border-bottom: none;border-right: none;"><a href="javascript:void(0)" onclick="delRow(this)">删除</a></td>';
			tr += '</tr>';
			$("#cpsjb_qplb_tab").append(tr);
			qpxxnum++;
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
				if(!verifySelect()){ return false;}
				var options = {
				    url:"<%=path%>/register!update.do?tjstate="+tjstate,
					dataType:'json',
		            beforeSubmit:function(formData, jqForm, options){
				    //		if( !verifyCode() ){ return false;};
						if(!verifySelect()){ return false;}
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
						    	var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\''+rsp.fjpath.replace(/\\/g,"/")+'\')">下载附件</a>';
						    	$("#zcdjb_fj_${uuid}").html(down);
						    }
						    $("#zcdjb_fj_input_${uuid}").html($("#zcdjb_fj_input_${uuid}").html());
						    if(tjstate == "2"){
								$("#mnubtn_zcdj_edit_tj").hide();
								$("#mnubtn_zcdj_edit_save").hide();
							}
		            	}else if(rsp.msg == "OUTSIZE"){
							$.dialog.tips('<font color="blue">保存成功！附件上传失败！</font>',3,'success.gif');
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
		var sydjz = $('#sydjz').val();
		var flag = false;
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/se!findSeSydjz.do",
		   data:'sydjz='+sydjz,
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
		var sbpz = $("#yzc_shebeipinzhong").val();
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
		if(sbpz == "" || sbpz == null){
			$("#yzc_shebeipinzhong_div  p").show();
			flag = false;
		}else{
			$("#yzc_shebeipinzhong_div  p").hide();
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
  	function delRow(obj){  
            var tr=obj.parentNode.parentNode;  
            var tbody=tr.parentNode;  
            tbody.removeChild(tr);
    }
	</script> 