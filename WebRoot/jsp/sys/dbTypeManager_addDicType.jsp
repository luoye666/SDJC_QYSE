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
		width: 20%
	}
</style>
</head>
<body>
	<div class="wrapper">
            		<div>
	            		<form class="frm_subBase" id="frm_addDicData" method="post">
							<table class="long98">
								<tr>
									<th>表英文：</th>
									<td><input class="ui-input long98" type="text" name="name_en" required /></td>
								</tr>
								<tr>
									<th>表中文：</th>
									<td><input class="ui-input long98" type="text" name="name_ch" required /></td>
								</tr>
								<tr>
									<th>表字段：</th>
									<td>
									<textarea class="ui-input long98"  name="table_col"  ></textarea>
									</td>
								</tr>
								<tr>
									<th></th>
									<th style="text-align: left;" colspan="2">表字段请以 英文[中文] 英文逗号（id[主键],）隔开，最后字段逗号去掉</th>
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
				url:"<%=path%>/dic!addDbType.do",  
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_addDicData").validate().form()){
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
	         $("#frm_addDicData").ajaxSubmit(options);
	         return false;
	}
	</script>