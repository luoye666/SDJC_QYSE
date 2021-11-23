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
		   			<div style="width: 80%;text-align: center;font-size: 30px">
		   				特种设备使用登记表
		   			</div>
		   			<br/>
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.filepath"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="客运索道"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="9000"/>
	                	 <input type="hidden" name="register.tjstate" value="0"/>
						 <input type="hidden" name="register.shiyongdanwei" value="${register.shiyongdanwei}" id="reg_add_sydw"/>
	                </div>
					<div>
						<table class="tabjcxx">
							<tr>
								<th>注册登记机构</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhucedengjijigou" />
								</td>
								<th>注册登记日期</th>
								<td>
									<input class="ui-input long98" name="register.zhucedengjiriqi" onclick="WdatePicker()"/>
								</td>
							</tr>
							<tr>
								<th>设备注册代码</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhucedaima" value="${register.zhucedaima}" id="reg_add"/>
								</td>
								<th>更新日期</th>
								<td>
									<input class="ui-input long98" name="register.gengxinriqi" onclick="WdatePicker()"/>
								</td>
							</tr>
							<tr>
								<th>单位内部编号</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.neibubianhao" />
								</td>
								<th>注册登记人员</th>
								<td>
									<input class="ui-input long98" name="register.zhucedengjirenyuan" />
								</td>
							</tr>
							<tr>
								<th>产权单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.chanquandanwei" />
								</td>
								<th>产权单位代码</th>
								<td>
									<input class="ui-input long98" name="register.chanquandanweidaima" />
								</td>
							</tr>
							<tr>
								<th>产权单位地址</th>
								<td colspan="3">
									鲁
									<div id="cqdw_shi_div" class="sxdiv">
										<select style="width:120px" name="register.chanquandanweidizhi_shi_daima" id="cqdw_shi"></select>
									</div>
									<div id="cqdw_quxian_div" class="sxdiv">
										<select style="width:120px" name="register.chanquandanweidizhi_qu_daima" id="cqdw_quxian"></select>
									</div>
								</td>
								<th>邮政编码</th>
								<td>
									<input class="ui-input long98" name="register.cqdw_youzhengbianma" />
								</td>
							</tr>
							<tr>
								<th style="width: 15%">单位法人代表</th>
								<td style="width: 20%">
									<input class="ui-input long98" name="register.danweifarendaibiao" />
								</td>
								<th style="width: 13%">管理负责人</th>
								<td style="width: 20%">
									<input class="ui-input long98" name="register.cqdw_guanlifuzeren" />
								</td>
								<th style="width: 12%">联系电话</th>
								<td style="width: 20%">
									<input class="ui-input long98" name="register.farenlianxidianhua" />
								</td>
							</tr>
							<tr>
								<th>使用单位</th>
								<td colspan="3">
									${register.shiyongdanwei}
								</td>
								<th>使用单位代码</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdanweidaima" value="${register.shiyongdanweidaima}" />
								</td>
							</tr>
							<tr>
								<th>使用单位地址</th>
								<td colspan="3">
									鲁
									<div id="sydw_shi_div" class="sxdiv">
										<select style="width:120px" sltValue="${register.shiyongdanweidizhi_shi_daima}" name="register.shiyongdanweidizhi_shi_daima" id="sydw_shi"></select>
									</div>
									<div id="sydw_quxian_div" class="sxdiv">
										<select style="width:120px" sltValue="${register.shiyongdanweidizhi_qu_daima}" name="register.shiyongdanweidizhi_qu_daima" id="sydw_quxian"></select>
									</div>
									<div id="xiangzhen_div" class="sxdiv">
										<select style="width:120px" sltValue="${register.suozaixiangzhen_daima}" name="register.suozaixiangzhen_daima" id="xiangzhen"></select>
									</div>
								</td>
								<th>邮政编码</th>
								<td>
									<input class="ui-input long98" name="register.sydw_youzhengbianma" value="${register.sydw_youzhengbianma}" />
								</td>
							</tr>
							<tr>
								<th>安全管理部门</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlibumen" />
								</td>
								<th>安全管理人员</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlirenyuan" value="${register.anquanguanlirenyuan}" />
								</td>
								<th>联系电话</th>
								<td>
									<input class="ui-input long98" name="register.aqglry_lianxidianhua" value="${register.aqglry_lianxidianhua}" />
								</td>
							</tr>
							<tr>
								<th>设备使用地点</th>
								<td colspan="3">
									鲁
									<div id="sydd_shi_div" class="sxdiv">
										<select style="width:120px" name="register.shiyongdidian_shi_daima" id="sydd_shi"></select>
									</div>
									<div id="sydd_quxian_div" class="sxdiv">
										<select style="width:120px" name="register.shiyongdidian_qu_daima" id="sydd_quxian"></select>
									</div>
								</td>
								<th>操作人员</th>
								<td>
									<input class="ui-input long98" name="register.caozuorenyuan" />
								</td>
							</tr>
							<tr>
								<th>设备类别</th>
								<td>
									<div id="yzc_shebeileibie_div">
										<select name="register.shebeileibiedaima" class="long98" id="yzc_shebeileibie"></select>
									</div>
					    		</td>
								<th>设备名称</th>
								<td>
									<input class="ui-input long98" name="register.shebeimingcheng" value="${register.shebeimingcheng}" />
								</td>
								<th>设备型号</th>
								<td>
									<input class="ui-input long98" name="register.shebeixinghao" value="${register.shebeixinghao}" />
								</td>
							</tr>
							<tr>
								<th>设计单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.shejidanwei" />
								</td>
								<th>设计单位代码</th>
								<td>
									<input class="ui-input long98" name="register.shejidanweidaima" />
								</td>
							</tr>
							<tr>
								<th>制造单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhizaodanwei" value="${register.zhizaodanwei}" />
								</td>
								<th>制造单位代码</th>
								<td>
									<input class="ui-input long98" name="register.zhizaodanweidaima" />
								</td>
							</tr>
							<tr>
								<th>资格证书名称</th>
								<td>
									<input class="ui-input long98" name="register.zzdw_zigezhengshumingcheng" />
								</td>
								<th>资格证书号</th>
								<td>
									<input class="ui-input long98" name="register.zzdw_zigezhengshuhao" value="${register.zzdw_zigezhengshuhao}" />
								</td>
								<th>联系电话</th>
								<td>
									<input class="ui-input long98" name="register.zzdw_lianxidianhua" />
								</td>
							</tr>
							<tr>
								<th>制造日期(日期)</th>
								<td>
									<input class="ui-input long98" name="register.zhizaoriqi" onclick="WdatePicker()" />
								</td>
								<th>制造日期(文本)</th>
								<td>
									<input class="ui-input long98" name="register.zhizaoriqi_str" />
								</td>
								<th class="redStyle">出厂编号</th>
								<td>
									<input class="ui-input long98 redStyle" name="register.chuchangbianhao" value="${register.chuchangbianhao}" id="cpbh" />
								</td>
							</tr>
							<tr>
								<th>适用场合</th>
								<td>
									<input class="ui-input long98" name="register.shiyongchanghe" />
								</td>
								<th>安装单位</th>
								<td>
									<input class="ui-input long98" name="register.anzhuangdanwei" value="${register.anzhuangdanwei}" />
								</td>
								<th>安装单位代码</th>
								<td>
									<input class="ui-input long98" name="register.anzhuangdanweidaima" />
								</td>
							</tr>
							<tr>
								<th>资格证书编号</th>
								<td>
									<input class="ui-input long98" name="register.azdw_zigezhengshubianhao" value="${register.azdw_zigezhengshubianhao}" />
								</td>
								<th>项目负责人</th>
								<td>
									<input class="ui-input long98" name="register.xiangmufuzeren" />
								</td>
								<th>联系电话</th>
								<td>
									<input class="ui-input long98" name="register.xmfzr_lianxidianhua" />
								</td>
							</tr>
							<tr>
								<th>土建施工单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.shigongdanwei" />
								</td>
								<th>开始施工日期</th>
								<td>
									<input class="ui-input long98" name="register.shigongriqi" value="<fmt:formatDate value='${register.shigongriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()" />
								</td>
							</tr>
							<tr>
								<th>土建验收单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.yanshoudanwei" />
								</td>
								<th>竣工验收日期</th>
								<td>
									<input class="ui-input long98" name="register.jungongriqi" onclick="WdatePicker()" />
								</td>
							</tr>
							<tr>
								<th>验收检验机构</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.yanshoujianyanjigou" />
								</td>
								<th>验收报告编号</th>
								<td>
									<input class="ui-input long98" name="register.yanshoubaogaobianhao" />
								</td>
							</tr>
							<tr>
								<th>投用日期(日期)</th>
								<td>
									<input class="ui-input long98" name="register.touyongriqi" onclick="WdatePicker()" />
								</td>
								<th>投用日期(文本)</th>
								<td>
									<input class="ui-input long98" name="register.touyongriqi_str" />
								</td>
								<th>维修周期(周)</th>
								<td>
									<input class="ui-input long98" name="register.weibaozhouqi" />
								</td>
							</tr>
							<tr>
								<th>大修周期(月)</th>
								<td>
									<input class="ui-input long98" name="register.daxiuzhouqi" />
								</td>
								<th>维修保养单位</th>
								<td>
									<input class="ui-input long98" name="register.weibaodanwei" />
								</td>
								<th>维保单位代码</th>
								<td>
									<input class="ui-input long98" name="register.weibaodanweidaima" />
								</td>
							</tr>
							<tr>
								<th>资格证书号</th>
								<td>
									<input class="ui-input long98" name="register.wbdw_zigezhengshuhao" />
								</td>
								<th>维保责任人</th>
								<td>
									<input class="ui-input long98" name="register.weibaofuzeren" />
								</td>
								<th>电话</th>
								<td>
									<input class="ui-input long98" name="register.weibaofuzerendianhua" />
								</td>
							</tr>
							<tr>
								<th colspan="6">设备主要参数</th>
							</tr>
							<tr>
								<th>运行速度(m/s)</th>
								<td>
									<input class="ui-input long98" name="register.yunxingsudu" />
								</td>
								<th>索道长度(m)</th>
								<td>
									<input class="ui-input long98" name="register.changdu" />
								</td>
								<th>运载能力(p/h)</th>
								<td>
									<input class="ui-input long98" name="register.yunzainengli" />
								</td>
							</tr>
							<tr>
								<th>运载车辆形式</th>
								<td>
									<select class="long98" name="register.yunzaicheliangxingshi" id="clxs">
										<option value=""></option>
										<option value="吊厢式">吊厢式</option>
										<option value="吊蓝式">吊蓝式</option>
										<option value="吊椅式">吊椅式</option>
										<option value="拖牵式">拖牵式</option>
									</select>
								</td>
								<th></th><td></td><th></th><td></td>
							</tr>
							<tr>
								<th>检验单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.jianyandanwei" />
								</td>
								<th>检验单位代码</th>
								<td>
									<input class="ui-input long98" name="register.jianyandanweidaima" />
								</td>
							</tr>
							<tr>
								<th>检验日期</th>
								<td>
									<input class="ui-input long98" name="register.jianyanriqi" onclick="WdatePicker()" />
								</td>
								<th>检验类别</th>
								<td>
									<select class="long98" name="register.jianyanleibie" id="jylb">
										<option value=""></option>
										<option value="全面检验">全面检验</option>
										<option value="在线检验">在线检验</option>
										<option value="安装监检">安装监检</option>
									</select>
								</td>
								<th>主要问题</th>
								<td>
									<input class="ui-input long98" name="register.zhuyaowenti" />
								</td>
							</tr>
							<tr>
								<th>检验结论</th>
								<td>
									<select class="long98" name="register.jianyanjielun" id="jyjl">
										<option value=""></option>
										<option value="允许运行">允许运行</option>
										<option value="整改后运行">整改后运行</option>
										<option value="限制条件运行">限制条件运行</option>
										<option value="停止运行">停止运行</option>
										<option value="监督运行">监督运行</option>
										<option value="合格">合格</option>
										<option value="不合格">不合格</option>
										<option value="无">无</option>
									</select>
								</td>
								<th>报告书编号</th>
								<td>
									<input class="ui-input long98" name="register.baogaoshubianhao" />
								</td>
								<th>下次检验日期</th>
								<td>
									<input class="ui-input long98" name="register.xiacijianyanriqi" onclick="WdatePicker()" />
								</td>
							</tr>
							<tr>
								<th>事故类别</th>
								<td>
									<select class="long98" name="register.shiguleibie" id="sglb">
										<option value=""></option>
										<option value="特大">特大</option>
										<option value="重大">重大</option>
										<option value="严重">严重</option>
										<option value="一般">一般</option>
										<option value="无">无</option>
									</select>
								</td>
								<th>事故发生日期</th>
								<td>
									<input class="ui-input long98" name="register.shigufashengriqi" onclick="WdatePicker()" />
								</td>
								<th>事故处理结果</th>
								<td>
									<select class="long98" name="register.shiguchulijieguo" id="sgcljg">
										<option value=""></option>
										<option value="无此项">无此项</option>
										<option value="未结案">未结案</option>
										<option value="已结案">已结案</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>设备变动方式</th>
								<td>
									<input class="ui-input long98" name="register.biandongfangshi" />
								</td>
								<th>变动主要项目</th>
								<td>
									<input class="ui-input long98" name="register.biandongxiangmu" />
								</td>
								<th>设备变动日期</th>
								<td>
									<input class="ui-input long98" name="register.biandongriqi" onclick="WdatePicker()" />
								</td>
							</tr>
							<tr>
								<th>变动承担单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.chengdandanwei" />
								</td>
								<th>承担单位代码</th>
								<td>
									<input class="ui-input long98" name="register.chengdandanweidaima" />
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
	
	$("#jylb").selectmenu();
	$("#jyjl").selectmenu();
	$("#sglb").selectmenu();
	$("#sgcljg").selectmenu();
	$("#rkmjq").selectmenu();
	$("#zdwxy").selectmenu();
	$("#yjcs").selectmenu();
	$("#zdjk").selectmenu();
	$("#clxs").selectmenu();
	
	 function delRow(obj){  
            var tr=obj.parentNode.parentNode;  
            var tbody=tr.parentNode;  
            tbody.removeChild(tr);
     } 
	
	$().ready(function(){
		
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("sydw_shi,sydw_quxian,,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
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
			
		//提交表单
		$("#mnubtn_zcdj_add_save").click(function(){
			var options = {
			    url:"<%=path%>/register!save.do?gzid=${gzid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
			   // 	if(checkZcdmDw()){
						parent.showMask("正在保存......");
						return true;
			  //  	}
			  //  	return false;
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