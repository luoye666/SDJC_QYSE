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
		width: 20%;
	}
</style>
</head>
<body>
	<div class="wrapper">
	            	<div>
		                <form class="frm_subBase" id="frm_editDicData" method="post">
		                	<!-- 表单隐藏域 -->
		                	<div class="formHiddenRegion">
			                	<input type="hidden" name="dbData.id" value="${dbData.id}"/>
			                	<input type="hidden" name="dbData.parentId" value="${dbData.parentId}"/>
		                	</div>
							<table class="long98">
								<tr>
									<th>字典类型：</th>
									<td>
										<input class="ui-input long98" id="typename" readonly="true"></input>
									</td>
								</tr>
								<tr>
									<th>英文：</th>
									<td><input class="ui-input long98" type="text" name="dbData.col_en" required value="${dbData.col_en}"/></td>
								</tr>
								<tr>
									<th>中文：</th>
									<td><input class="ui-input long98" type="text" name="dbData.col_ch" required value="${dbData.col_ch}"/></td>
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
		/**页面元素事件注册*/
		$().ready(function(){
			$.post("<%=path%>/dic!getDbTypeName.do",{id:"${dbData.parentId}"},
				function (data, textStatus){
					$("#typename").val(data);
				});
		})
		
	function save(){
			var options = {
				url:"<%=path%>/dic!updDbData.do", 
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_editDicData").validate().form()){
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
						}, 2000 );
	            	}else{
						$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_editDicData").ajaxSubmit(options);
	         return false;
	}
	</script>