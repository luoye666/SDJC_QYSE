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
			                	<input type="hidden" name="dicData.id" value="${dicData.id}"/>
			                	<input type="hidden" name="dicData.typeId" value="${dicData.typeId}"/>
			                	<input type="hidden" name="dicData.parentId" value="${dicData.parentId}"/>
		                	</div>
							<table class="long98">
								<tr>
									<th>字典类型：</th>
									<td>
										<input class="ui-input long98" id="typename" readonly="true"></input>
									</td>
								</tr>
								<tr>
									<th>名称：</th>
									<td><input class="ui-input long98" type="text" name="dicData.name" required value="${dicData.name}"/></td>
								</tr>
								<tr>
									<th>编号：</th>
									<td><input class="ui-input long98" type="text" name="dicData.code" required value="${dicData.code}"/></td>
								</tr>
								<tr>
									<th>值：</th>
									<td>
										<textarea rows="2" cols="32" name="dicData.value">${dicData.value}</textarea>
									</td>
								</tr>
								<tr>
									<th>描述：</th>
									<td>
										<textarea rows="3" cols="32" name="dicData.notes">${dicData.notes}</textarea>
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
		/**页面元素事件注册*/
		$().ready(function(){
			$.post("<%=path%>/dic!getTypeName.do",{id:"${dicData.typeId}"},
				function (data, textStatus){
					$("#typename").val(data);
				});
		})
		
	function save(){
			var options = {
				url:"<%=path%>/dic!updateData.do", 
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