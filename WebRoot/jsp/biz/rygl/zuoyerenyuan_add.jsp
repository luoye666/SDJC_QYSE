<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	.long98{
		width: 98%
	}
	th{
		text-align: right;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div>
			<center><h3>人员信息</h3></center>
			<!-- 条件筛选-->
			<form name="frm_jcry_xkz_add" id="frm_jcry_xkz_add" method="POST">
				<input type="hidden" name="ry.sydw_id" value="${param.sydwid}" />
				<table style="width: 98%">
					<tr>
					    <th style="width: 8%">姓名:</th>
						<td style="width: 22%">
							<input class="ui-input long98" required="required" name="ry.xingming" />
						</td>
						<th style="width: 8%">性别:</th>
						<td style="width: 22%">
							<div id="sex_div">
								<select name="ry.sex" style="width: 179px;" id="sex">
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
						</td>
						<th style="width: 8%">身份证号:</th>
						<td style="width: 22%">
							<input class="ui-input long98" required="required" name="ry.shenfenzhenghao" maxlength="18" onblur="valiID(this.value)" id="sfzh" />
						</td>
					</tr>
					<tr>
					    <th >市:</th>
						<td >
							<div id="shi_div">
								<select name="ry.shidaima" style="width: 179px;" id="shi" ></select>
							</div>
						</td>
						<th >区县:</th>
						<td >
							<div id="quxian_div">
								<select name="ry.quxiandaima" style="width: 179px;" id="quxian" ></select>
							</div>
						</td>
						<th >乡镇:</th>
						<td >
							<div id="xiangzhen_div">
								<select name="ry.xiangzhendaima" style="width: 179px;" id="xiangzhen" ></select>
							</div>
						</td>
					</tr>
					<tr>
					    <th>证书编号:</th>
						<td >
							<input class="ui-input long98" required="required" name="ry.zhengshubianhao" />
						</td>
						<th >发证机关:</th>
						<td >
							<input class="ui-input long98" required="required" name="ry.fazhengjiguan" />
						</td>
						<th >发证日期:</th>
						<td >
							<input class="ui-input long98" required="required" name="ry.fazhengriqi" onclick="WdatePicker()" >
						</td>
						
					</tr>
					<tr>
						<th>证件有效期至:</th>
						<td>
							<input class="ui-input long98"  required="required" name="ry.zhengshuyouxiaoqi_end" onclick="WdatePicker()">
						</td>
						<th>所在单位:</th>
						<td>
							<input class="ui-input long98" name="ry.suozaidanwei" disabled="disabled" id="szdw">
						</td>
						<th>电话:</th>
						<td>
							<input class="ui-input long98" name="ry.lianxidianhua">
						</td>
					</tr>
					<tr>
						<th >新作业种类:</th>
						<td >
							<div id="zhonglei_div">
								<select name="ry.zuoyezhonglei" style="width: 179px;" id="zhonglei"></select>
							</div>
						</td>
						<th>新作业项目:</th>
						<td colspan="3">
							<div id="zgzl"></div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</body>
	</html>
	<!-- 脚本 -->
	<script type="text/javascript">
	
var api = frameElement.api, W = api.opener;

api.button(
	{
	    id:'valueCx',
		name:'保存',
		callback:save
	},{
	    id:'valueQx',
		name:'关闭'
	}
);

var sexJSON = [{"code":"男","name":"男"},
			   {"code":"女","name":"女"}];
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"ZYZL"},
				function (data, textStatus){
					createSelect("zhonglei",data.dicDatas,"200px",false,"<%=path%>");
					$('#zhonglei').selectmenu({
						change:function(){
							var s =$('#zhonglei').val();
							$.post("<%=path%>/zyryList!getDataListByParent.do",{name:s},
								function (data, textStatus){
									$("#zgzl").empty();
									if("" != data){
								        var zgzl = $("#zgzl");
										dataArr = data.dicDatas;
										for(var i = 0;i<dataArr.length;i++){
											if((i+1)%2 ==0){
												zgzl.append("<input value = '"+dataArr[i].name+"' name='ry.zuoyexiangmu' type='checkbox'>"+dataArr[i].name+"<br/>");
											}else{
												zgzl.append("<input value = '"+dataArr[i].name+"' name='ry.zuoyexiangmu' type='checkbox'>"+dataArr[i].name);
											}
										}
									}
							},"JSON");
			    		}
					})
			},"JSON");
			$.post("<%=path%>/zyry!getSydwName.do?sydwid=${param.sydwid}",{},
				function (data, textStatus){
					$("#szdw").val(data.name);
			},"JSON");
			//生成级联下拉框
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			$STONE.creatSelectMenu("sex",sexJSON,"200px",false,"<%=path%>");
			
	function save(){
			var options = {
				url:"<%=path%>/zyry!saveXkz.do",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					var sfzh = $("#sfzh").val();
				    if($("#frm_jcry_xkz_add").validate().form() && valiID(sfzh)){
						W.parent.showMask("正在保存......");
				    	return true;
				    }
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
						W.reloadGrid();
						setTimeout(function(){
							api.close();
						}, 1000 );
	            	}else{
						$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_jcry_xkz_add").ajaxSubmit(options);
	         return false;
	}
	
	function valiID(value){
		var isIDcard=/^(\d{15}|\d{17}[x0-9])$/i;
		if (isIDcard.test(value)){    
			return true;
		}else{
			$.dialog.tips('<font color="red">请重新输入正确的身份证号码！</font>',3,'error.gif');
			$("#sfzh").focus();
			var obj = event.srcElement;
			var txt =obj.createTextRange();
			txt.moveStart('character',obj.value.length);
			txt.collapse(true);
			txt.select();    
			return false;
		}
	}
	
	function createSelect(selectId,options,height,ld,path){
		var selectIdArr = selectId.split(",");
		for(var i in selectIdArr){
			$("#"+selectIdArr[i]).selectmenu();
		}
		var select = $("#"+selectIdArr[0]);
		var sltValue = select.attr("sltValue");
		//因selectMenu插件本身存在问题，必须得把控件重新添加，才能做级联
		select.empty();
		select.css("display","inline");
		$("#"+selectIdArr[0]+"-button").remove();
		var selectHtml = $("#"+selectIdArr[0]+"_div").html();
		$("#"+selectIdArr[0]+"_div").html(selectHtml);
		select = $("#"+selectIdArr[0]);
		select.append("<option value = ''></option>"); 
		for(var i in options){
			if(sltValue == options[i].name){
				select.append("<option value = '"+options[i].name+"' selected = 'selected'>"+options[i].name+"</option>"); 
			}else{
				select.append("<option value = '"+options[i].name+"'>"+options[i].name+"</option>"); 
			}
		}
		select.selectmenu().selectmenu("menuWidget").css("height",height);
	}
	</script>