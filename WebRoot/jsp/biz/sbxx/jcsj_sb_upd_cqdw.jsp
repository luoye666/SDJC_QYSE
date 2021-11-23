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
	#tab th{
		width: 15%;
		text-align: right;
	}
	#tab td{
		width: 35%;
	}
	
</style>
</head>
<body>
	<div class="wrapper">
	</div>
	<!-- Grid工具栏 -->
	<div id="" class="tlb_baseGrid">
		<div>
		<br/>
			<!-- 条件筛选--> 
			<form name="frm_se_upd_cqdw" id="frm_se_upd_cqdw" method="POST">
				<table style="width: 95%" id="tab">
					<tr>
					    <th>产权单位:</th>
						<td>
							<input class="ui-input long98" name="chanquandanwei" required />
						</td>
					</tr>
					<tr>
					    <th>产权单位地址:</th>
						<td>
							<input class="ui-input long98" name="dizhi" required />
						</td>
					</tr>
					<tr>
					    <th>产权单位代码:</th>
						<td>
							<input class="ui-input long98" name="daima" required />
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
	    id:'valueTj',
		name:'确认',
		callback:tijiao
	},{
	    id:'valueQx',
		name:'取消'
	}
);
	 function tijiao(){
			var options = {
				url:"<%=path%>/se!updCqdwByIds.do?ids=${param.ids}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					if(!$("#frm_se_upd_cqdw").validate().form()){
						return false;
					}
					W.parent.showMask("正在提交......");
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">修改成功!</font>',3,'success.gif');
						W.reloadGrid();
						setTimeout(function(){
							api.hide();
						}, 1000 );
	            	}else{
						$.dialog.tips('<font color="blue">修改不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_se_upd_cqdw").ajaxSubmit(options);
	         return false;
	 }
	</script>