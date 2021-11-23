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
		width: 98%
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
		  <ul>
		    <li><a href="#tabs-1">角色信息</a></li>
		    <li><a href="#tabs-2">关联菜单</a></li>
		  </ul>
  		<div id="tabs-1">
	            		<form class="frm_subBase" id="frm_addRole" method="post">
							<table class="long98">
								<tr>
									<th>角色名(中):</th>
									<td><input class="ui-input long98" name="role.name" required />  </td>
								</tr>
								<tr>
									<th>角色名(英):</th>
									<td><input class="ui-input long98" name="role.nameEN" required/>  </td>
								</tr>
								<tr>
									<th>设备信息:</th>
									<td>
										<input type="radio" value="yes" checked="checked" name="role.sbxx" />可修改
										<input type="radio" value="no" name="role.sbxx" />不可修改
									</td>
								</tr>
								<tr>
									<th>设备信息可修改字段:</th>
									<td>
										<textarea rows="3" name="role.editSeField" style="width: 98%"></textarea>
									</td>
								</tr>
								<tr>
									<th>角色描述:</th>
									<td>
										<textarea rows="10" name="role.notes" style="width: 98%"></textarea>
									</td>
								</tr>
							</table>
						</form> 
  		</div>
		  <div id="tabs-2">
				<ul id="tree" class="ztree" style="overflow:auto;"></ul>
		  </div>
		</div>
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
	var zTree;
	var setting = {
			view: {
			},
			async: {
				enable: true,
				url:"<%=path%>/menuList!getGridList.do",
				autoParam:["id"]
			},
			check:{
				enable: true
			},
			callback: {
				onAsyncSuccess: onAsyncSuccess
			}
	};
		$().ready(function(){
			$( "#tabs" ).tabs();
			$.fn.zTree.init($("#tree"), setting);
			zTree = $.fn.zTree.getZTreeObj("tree");
		})
		
		function onAsyncSuccess(event, treeId, treeNode, msg) {
			zTree.expandAll(true);
		}
	function save(){
		var menuIds = "";
		var nodes = zTree.getCheckedNodes(true);
		for(var i = 0;i<nodes.length;i++){
			menuIds += ","+nodes[i].id;
		}
		if(menuIds != ""){
			menuIds = menuIds.substring(1);
		}
			var options = {
				url:"<%=path%>/role!add.do?menuIds="+menuIds,
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