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
</style>
</head>
<body>
	<div class="wrapper">
		<div>
			<form name="frm_utils_yuetan_add" id="frm_utils_yuetan_add" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="eqhide.yhtype" value="6" >
				<table style="width: 98%">
					<tr>
						<th>约谈人员</th>
						<td>
							<input class="ui-input" required="required" name="eqhide.renyuan" >
						</td>
					    <th style="width: 20%">约谈时间:</th>
						<td>
							<input class="ui-input" required="required" name="eqhide.yhdate" onclick="WdatePicker()" >
						</td>
					</tr>
					<tr>
					    <th>内容:</th>
						<td colspan="3">
							<textarea rows="5" name="eqhide.yinhuanyuanyin" class="long98"></textarea>
						</td>
					</tr>
					<tr>
						<th>附件:</th>
						<td colspan="3">
							<input type="file" class="long98" name="file" >
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
	function save(){
		var options = {
			url:"<%=path%>/azUtils!ytOrJczlsAdd.do?dwid=${param.dwid}&dwtype=${param.dwtype}",
			dataType:'json',
            beforeSubmit:function(formData, jqForm, options){
				if($("#frm_utils_yuetan_add").validate().form()){
					W.parent.showMask("正在保存......");
					return true;
				}
				return false;
           	},
            success:function(rsp, statusText, xhr, $form){
            	W.parent.hideMask();
				if(rsp.msg == "OUTSIZE"){
					$.dialog.alert("附件过大！");
			    }else if(rsp.msg == "SUCCESS"){
					$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
					W.reloadGrid();
					setTimeout(function(){
						api.close();
					}, 2000 );
				}else{
					$.dialog.alert("保存失败！");
			    }
            }
         };
         $("#frm_utils_yuetan_add").ajaxSubmit(options);
         return false;
	}
	</script>