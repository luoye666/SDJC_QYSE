<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	.long98{
		width: 98%
	}
	.overflow {      height: 120px;    }
	table th{
		width: 15%;
	}
	table td{
		width: 35%;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div>
		<br/>
			<!-- 条件筛选--> 
			<form name="frm_sy_biangeng" id="frm_sy_biangeng" method="POST" >
				<div class="formHiddenRegion">
	            	<input type="hidden" name="entity.id" value="${entity.id}" id="sydwid"/>
					<input type="hidden" name="entity.meo" value="${entity.meo}">
					<input type="hidden" name="entity.flag" value="${entity.flag}">
					<input type="hidden" name="entity.jgdm" value="${entity.jgdm}">
					<input type="hidden" name="entity.tmpData" value="${entity.tmpData}">
                </div>
				<center><h3>原始信息</h3></center>
				<table style="width: 98%">
					<tr>
					    <th>单位名称:</th>
						<td>
							<input class="ui-input long98" readonly="true" name="dwmc" value="${entity.dwmc}">
						</td>
						<th>所在市</th>
						<td>
							<input class="ui-input long98" readonly="true" name="shi" value="${entity.shi}">
						</td>
					</tr>
					<tr>
						<th>所在区县</th>
						<td>
							<input class="ui-input long98" readonly="true" name="quxian" value="${entity.quxian}">
						</td>
						<th>所在乡镇</th>
						<td>
							<input class="ui-input long98" readonly="true" name="xiangzhen" value="${entity.xiangzhen}">
						</td>
					</tr>
					<tr>
						<th>单位地址:</th>
						<td>
							<input class="ui-input long98" readonly="true" name="dwdz" value="${entity.dwdz}">
						</td>
						<th>机构代码:</th>
						<td>
							<input class="ui-input long98" readonly="true" name="jgdm" value="${entity.jgdm}">
						</td>
					</tr>
					<tr>
						<th>联系人:</th>
						<td><input class="ui-input long98" readonly="true" name="lxr" value="${entity.lxr}"></td>
					    <th>联系电话:</th>
						<td><input class="ui-input long98" readonly="true" name="lxdh" value="${entity.lxdh}"></td>
					</tr>
					<tr>
						<th>法人:</th>
						<td><input class="ui-input long98" readonly="true" name="faren" value="${entity.faren}"></td>
					</tr>
				</table>
				<br/>
				<center><h3>变更后信息</h3></center>
				<table style="width: 98%">
					<tr>
						<th colspan="4">
							<div id="sydwinfo_edit" style="text-align: left;"></div>
						</th>
					</tr>
					<tr>
					    <th>单位名称:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.dwmc" id="sy_utils_edit_dwmc">
						</td>
						<th>所在市</th>
						<td>
							<div id="sy_edit_hebing_shi_div">
								<select class="long98" required="required" name="entity.shidaima" id="sy_edit_hebing_shi"></select>
							</div>
						</td>
					</tr>
					<tr>
						<th>所在区县</th>
						<td>
							<div id="sy_edit_hebing_quxian_div">
								<select class="long98" name="entity.quxiandaima" id="sy_edit_hebing_quxian"></select>
							</div>
						</td>
						<th>所在乡镇</th>
						<td>
							<div id="sy_edit_hebing_xiangzhen_div">
								<select class="long98" name="entity.xiangzhendaima" id="sy_edit_hebing_xiangzhen"></select>
							</div>
						</td>
					</tr>
					<tr>
						<th>单位地址:</th>
						<td colspan="3">
							<input class="ui-input long98"  name="entity.dwdz">
						</td>
					</tr>
					<tr>
						<th>联系人:</th>
						<td><input class="ui-input long98"  name="entity.lxr" ></td>
					    <th>联系电话:</th>
						<td><input class="ui-input long98" name="entity.lxdh" ></td>
					</tr>
					<tr>
						<th>法人:</th>
						<td><input class="ui-input long98"  name="entity.faren" ></td>
					</tr>
				</table>
				<div>
					<font color="red">《变更后信息》只需填写需要变更的信息</font>
				</div>
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
		name:'确定',
		callback:save
	},{
	    id:'valueQx',
		name:'关闭'
	}
);
		$().ready(function(){
			//生成级联下拉框
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("sy_edit_hebing_shi,sy_edit_hebing_quxian,sy_edit_hebing_xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
		});
	
	function save(){
			var options = {
				url:"<%=path%>/syUtils!changeUtils.do?sydwid=${entity.id}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_sy_biangeng").validate().form() && verify()){
						W.parent.showMask("正在保存......");
				    	return true;
				    }
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
				    if(rsp.success){
						W.reloadGrid();
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
						setTimeout(function(){
							api.close();
						}, 1000 );
				    }else{
				    	$.dialog.alert('保存不成功！');
				    };
	            }
	         };
	         $("#frm_sy_biangeng").ajaxSubmit(options);
	         return false;
	}
	
	//验证单位是否重复
	function verify(){
		
		var result = false;
		var dwid = $("#sydwid").val();
		var dwmc = $('#sy_utils_edit_dwmc').val();
		var shi = $('#sy_edit_hebing_shi').val();
		var quxian = $('#sy_edit_hebing_quxian').val();
		var xiangzhen = $('#sy_edit_hebing_xiangzhen').val();
		
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/syUtils!verifyByDwmc.do",
		   data:'dwmc='+encodeURI(encodeURI(dwmc))+'&dwid='+dwid+'&shi='+shi+'&quxian='+quxian+'&xiangzhen='+xiangzhen+' ',
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result>0){
		   			$("#sydwinfo_edit").html("<font color='red'>单位名称重复!</font>");
		   		}else{
		   			$("#sydwinfo_edit").html("");
		   			result = true;
		   		}
		   }
		});
		return result;
	}
	</script>