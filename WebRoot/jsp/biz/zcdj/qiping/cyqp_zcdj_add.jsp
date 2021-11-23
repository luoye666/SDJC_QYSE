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
p{
	color:red;
	display: none;
}


</style>
</head>
<body>
	<div class="wrapper">
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_add_save">保存</a>
	  </div>
	   		<div>
		    	<form id="frm_zcdj_add${uuid}" method="post">
		   			<div style="width: 80%;text-align: center;font-size: 30px">
		   				车用气瓶使用登记表
		   			</div>
		   			<br/>
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.filepath"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="气瓶"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="Q000"/>
	                	 <input type="hidden" name="register.shebeileibie" value="${param.zl}"/>
	                	 <input type="hidden" name="register.shebeileibiedaima" value="${param.zldm}"/>
	                	 <input type="hidden" name="register.tjstate" value="0"/>
						 <input type="hidden" name="register.shiyongdanwei" id="reg_add_sydw" value="${register.shiyongdanwei}"/>
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
										<option value="达到设计使用年限">达到设计使用年限</option>
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
					    				<select class="long98" name="register.shebeipinzhongdaima" id="yzc_shebeipinzhong"></select>
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
									<input class="ui-input long98" name="register.shebeishuliang" />
								</td>
								<th colspan="2">充装介质</th>
								<td>
									<input class="ui-input long98" name="register.chongzhuangjiezhi"/>
								</td>
							</tr>
							<tr>
								<th>气瓶公称工作压力</th>
								<td>
									<input class="ui-input" name="register.gongzuoyali" />MPa
								</td>
								<th colspan="2">气瓶容积</th>
								<td>
									<input class="ui-input long98" name="register.rongji" />
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
										<tr>
											<td style="border-bottom: none;border-left: none;">
			    								<input class="ui-input long98" name="cyqp_xx_list[0].zhizaodanwei"/>
											</td>
											<td style="border-bottom: none;">
			    								<input class="ui-input long98" name="cyqp_xx_list[0].zhizaoriqi"/>
											</td>
											<td style="border-bottom: none;">
			    								<input class="ui-input long98" name="cyqp_xx_list[0].chanpinbianhao"/>
											</td>
											<td style="border-bottom: none;">
			    								<input class="ui-input long98" name="cyqp_xx_list[0].danweineibianhao"/>
											</td>
							    			<td style="border-bottom: none;border-right: none;">
							    				<a href="javascript:void(0)" onclick="delRow(this)">删除</a>
							    			</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<th>施工单位名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.shigongdanwei" />
								</td>
							</tr>
							<tr>
								<th>监督检验机构名称</th>
								<td colspan="4">
									<input class="ui-input long98" name="register.jianjiandanwei" />
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
								<th colspan="2">下次检验日期</th>
								<td>
									<input class="ui-input long98" name="register.xiacijianyanriqi" onclick="WdatePicker()" />
								</td>
							</tr>
							<tr>
								<th>使用单位统一社会</br>信用代码</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdanweidaima" />
								</td>
								<th colspan="2">邮政编码</th>
								<td>
									<input class="ui-input long98" name="register.sydw_youzhengbianma" value="${register.sydw_youzhengbianma}" />
								</td>
							</tr>
							<tr>
								<th>车牌号</th>
								<td>
									<input class="ui-input long98" name="register.chepaihao" />
								</td>
								<th colspan="2">车辆VIN码</th>
								<td>
									<input class="ui-input long98" name="register.vinma" value="${register.vinma}" />
								</td>
							</tr>
							<tr>
								<th>投入使用日期(日期)</th>
								<td>
									日期：<input class="ui-input" name="register.touyongriqi" onclick="WdatePicker()" />
									文本：<input class="ui-input" name="register.touyongriqi_str" />
								</td>
								<th colspan="2">单位固定电话</th>
								<td>
									<input class="ui-input long98" name="register.sydw_gudingdianhua" />
								</td>
							</tr>
							<tr>
								<th>安全管理人员</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlirenyuan"/>
								</td>
								<th colspan="2">移动电话</th>
								<td>
									<input class="ui-input long98" name="register.aqglry_lianxidianhua" />
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
												<input class="ui-input long98" name="register.tianbiaorenyuan" />
											</td>
											<td style="width: 10%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.tianbiaoriqi" onclick="WdatePicker()" />
											</td>
											<td style="width: 20%">(使用单位公章)</td>
										</tr>
										<tr>
											<td>使用单位安全管理人员：</td>
											<td></td>
											<td>日期：</td>
											<td>
												<input class="ui-input long98" name="register.aqglry_riqi" onclick="WdatePicker()" />
											</td>
											<td><input class="ui-input long98" name="register.shiyongdanwei_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div style="text-align: left;">
										说明：<textarea rows="3" style="width: 98%" name="register.beizhu"></textarea>
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">登记机关登记人员：</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.zhucedengjirenyuan" />
											</td>
											<td style="width: 20%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.zhucedengjiriqi" onclick="WdatePicker()" required="required" />
											</td>
											<td style="width: 20%">（登记机关专用章）</td>
										</tr>
										<tr>
											<td>使用登记证编号：</td>
											<td>
											</td>
											<td>登记机关</td>
											<td>
												<input class="ui-input long98" name="register.zhucedengjijigou" />
											</td>
											<td><input class="ui-input long98" name="register.dengjijiguan_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})"/></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
		   			</div>
		    	</form>
		    </div>
		</div>
</body>
</html>
	<script type="text/javascript">
	
	$("#djlb").selectmenu();
	var xxnum = 1;	
	
	$().ready(function(){
		
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${param.zldm}"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeipinzhong",data.dirDatas,"200px",false,"<%=path%>");
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			
		//提交表单
		$("#mnubtn_zcdj_add_save${uuid}").click(function(){
			var options = {
			    url:"<%=path%>/register!save.do?gzid=${gzid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if(!verifySelect()){ return false;}
					if($("#frm_zcdj_add${uuid}").validate().form()){
						parent.showMask("正在保存......");
						return true;
					}
			    	return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
	            		parent.frames["${param.fid}"].reloadGrid();
						parent.addTabsItem("add_djb_${param.zldm}",rsp.sydw+"_登记表_"+rsp.id,"<%=path%>/register!openZcdjbById.do?id="+rsp.id+"&zldm=Q000&fid=${param.fid}");
	            	}else{
						$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_zcdj_add${uuid}").ajaxSubmit(options);
	         return false;
		});
		//添加行
		$("#xinxi_add").click(function(){
			var tr = "<tr>";
			tr += '<td style="border-bottom: none;border-left: none;"><input class="ui-input long98" name="cyqp_xx_list['+xxnum+'].zhizaodanwei" /></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="cyqp_xx_list['+xxnum+'].zhizaoriqi" /></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="cyqp_xx_list['+xxnum+'].chanpinbianhao" /></td>';
			tr += '<td style="border-bottom: none;"><input class="ui-input long98" name="cyqp_xx_list['+xxnum+'].danweineibianhao" /></td>';
			tr += '<td style="border-bottom: none;border-right: none;"><a href="javascript:void(0)" onclick="delRow(this)">删除</a></td>';
			tr += '</tr>';
			$("#xinxi").append(tr);
			xxnum++;
		});
		appendSelTo();
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
  	function delRow(obj){  
            var tr=obj.parentNode.parentNode;  
            var tbody=tr.parentNode;  
            tbody.removeChild(tr);
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
	</script> 