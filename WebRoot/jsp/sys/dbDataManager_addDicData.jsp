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
									<th>表名：</th>
									<td>
										<select id="cbo_addDbData_dicTypes" name="dbData.parentId" ></select>
									</td>
								</tr>
								<tr>
									<th>英文：</th>
									<td><input class="ui-input long98" type="text" name="dbData.col_en" required /></td>
								</tr>
								<tr>
									<th>中文：</th>
									<td><input class="ui-input long98" type="text" name="dbData.col_ch" required /></td>
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
		/**页面所需资源初始化****************************************************/
		$().ready(function(){
			$.post("<%=path%>/dicList!getDbTypeAll.do",{},
				function (data, textStatus){
					if("" != data){
				        var pz = $("#cbo_addDbData_dicTypes");
				        pz.empty();  
						var dataArr = data.split(",");
						for(var i = 0;i<dataArr.length;i++){
				            var tmp = dataArr[i].split(":");
				            pz.append("<option value = '"+tmp[1]+"'>"+tmp[0]+"</option>"); 
						}
					}
				});
		});		
		
	function save(){
			var options = {
				url:"<%=path%>/dic!addDbData.do",  
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