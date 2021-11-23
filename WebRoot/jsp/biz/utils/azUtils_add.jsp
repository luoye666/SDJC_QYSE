<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
			<center><h3>安装单位信息</h3></center>
			<br/>
			<!-- 条件筛选-->
			<form name="frm_az_add" id="frm_az_add" method="POST">
				<input type="hidden" value="0" name="entity.tmpData" />
				<table style="width: 98%">
					<tr>
						<th colspan="4">
							<div id="azdwinfo_add" style="text-align: left;"></div>
						</th>
					</tr>
					<tr>
					    <th>单位名称:</th>
						<td>
							<input class="ui-input long98 required"  name="entity.unitsname" id="az_utils_add_dwmc">
						</td>
						<th>单位地址:</th>
						<td><input class="ui-input long98 required"  name="entity.unitsadd"></td>
					</tr>
					<tr>
						<th>机构代码:</th>
						<td><input class="ui-input long98 required" name="entity.unitsid" ></td>
						<th>单位负责人:</th>
						<td><input class="ui-input long98 required" name="entity.corporation" ></td>
					</tr>
					<tr>
					    <th>联系电话:</th>
						<td><input class="ui-input long98 required" name="entity.corporationtel" ></td>
						<th>市：</th>
						<td>
							<div id="shi_div">
								<select name="entity.shidaima" style="width: 179px;" id="shi"></select>
							</div>
						</td>
					</tr>
					<tr>
						<th>区县：</th>
						<td>
							<div id="quxian_div">
								<select name="entity.quxiandaima" style="width: 179px;" id="quxian"></select>
							</div>
						</td>
						<th>乡镇：</th>
						<td>
							<div id="xiangzhen_div">
								<select name="entity.xiangzhendaima" style="width: 179px;" id="xiangzhen"></select>
							</div>
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
		
	//生成级联下拉框
	$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
		function (data, textStatus){
			$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
	},"JSON");
	
	//验证单位是否重复
	function verify(){
		var result = false;
		var dwid = "";
		var dwmc = $("#az_utils_add_dwmc").val();
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/azUtils!verifyByDwmc.do",
		   data:'dwmc='+encodeURI(encodeURI(dwmc))+'&dwid='+dwid,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result>0){
		   			$("#azdwinfo_add").html("<font color='red'>单位名称重复!</font>");
		   		}else{
		   			$("#azdwinfo_add").html("");
		   			result = true;
		   		}
		   }
		});
		return result;
	}
	function save(){
			var options = {
				url:"<%=path%>/azUtils!save.do",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_az_add").validate().form() && verify()){
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
	         $("#frm_az_add").ajaxSubmit(options);
	         return false;
	}
	</script>