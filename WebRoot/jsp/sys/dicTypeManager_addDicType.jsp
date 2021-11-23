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
	            		<form class="frm_subBase" id="frm_addDicType" method="post">
							<table class="long98">
								<tr>
									<th>类型名称：</th>
									<td><input class="ui-input long98" type="text" name="dicType.name" required />  </td>
								</tr>
								<tr>
									<th>类型编码：</th>
									<td><input class="ui-input long98" type="text" name="dicType.code" required />  </td>
								</tr>
								<tr>
									<th>类型描述：</th>
									<td>
										<textarea rows="3" style="width: 98%" name="dicType.notes"></textarea>
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
				url:"<%=path%>/dic!addType.do",  
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_addDicType").validate().form()){
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
	         $("#frm_addDicType").ajaxSubmit(options);
	         return false;
	}
	</script>