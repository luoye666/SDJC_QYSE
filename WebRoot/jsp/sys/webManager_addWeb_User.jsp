<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
  <link rel="stylesheet" href="<%=path %>/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=path %>/js/plugin/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=path %>/js/plugin/ztree/jquery.ztree.excheck-3.5.js"></script>
<style>
	.long98{
		width: 70%
	}
	th{
		text-align: right;
		width: 20%;
	}
</style>
</head>
<body>
	<div>
		<div id="tabs">
           		<form class="frm_subBase" id="frm_addRole" method="post">
					<table class="long98">
						<tr>
							<th>登录名:</th>
							<td><input class="ui-input long98" name="wuser.name" required />  </td>
						</tr>
						<tr>
							<th>市代码:</th>
							<td><input class="ui-input long98" name="wuser.shidaima" />  </td>
						</tr>
						<tr>
							<th>导入角色:</th>
							<td><input class="ui-input long98" name="wuser.role" required/>  </td>
						</tr>
						<tr>
							<th>机构名称:</th>
							<td><input class="ui-input long98" name="wuser.name_en" />  </td>
						</tr>
					</table>
				</form> 
		</div>
			 导入角色： 1 锅炉  2 压力容器  3 电梯  4 起重机  5 厂车  6 游乐设施 8 压力管道  9 索道  <br/>
			市代码： 空 代表 全省
		</div>
        
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
	$().ready(function(){
		$( "#tabs" ).tabs();
	})
	function save(){
		var options = {
			url:"<%=path%>/jyxx!saveWUser.do",
			dataType:'json',
            beforeSubmit:function(formData, jqForm, options){
			    if($("#frm_addRole").validate().form()){
			    	W.self.parent.parent.showMask("正在保存......");
			    	return true;
			    }
			    return false;
           	},
            success:function(rsp, statusText, xhr, $form){
	            W.self.parent.parent.hideMask();
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
         $("#frm_addRole").ajaxSubmit(options);
         return false;
	}
	</script>