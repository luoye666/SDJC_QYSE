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
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="btn_editSysMenu_submit">保存</a>
	  </div>
            <div>
                <form class="frm_subBase" id="frm_editSysMenu" method="post">
                	<!-- 表单隐藏域 -->
                	<div class="formHiddenRegion">
                		<input type="hidden" name="menu.id" value="${menu.id}">
                		<input type="hidden" name="menu.parentId" value="${menu.parentId}">
                		<input type="hidden" name="menu.btnCode" value="${menu.btnCode}">
                	</div>
                	<table style="width: 60%">
	        			<tr>
	        				<th>名称：</th>
	        				<td><input class="ui-input long98" name="menu.title" id="menuname" required value="${menu.title}"/></td>
	        			</tr>
	        			<tr>
	        				<th>URL：</th>
	        				<td><input class="ui-input long98" name="menu.url" required value="${menu.url}"/></td>
	        			</tr>
	        			<tr>
	        				<th>样式class：</th>
	        				<td><input class="ui-input long98" name="menu.style_class" value="${menu.style_class}"/></td>
	        			</tr>
	        			<tr>
	        				<th>tabid：</th>
	        				<td><input class="ui-input long98" name="menu.tabid" value="${menu.tabid}"/></td>
	        			</tr>
	        			<tr>
	        				<th>排序编号：</th>
	        				<td>
	        					<input id="spinner" readonly="true" min=1 max=100 name="menu.sortNum" value="${menu.sortNum}">
							</td>
	        			</tr>
	        			
	        			<tr>
	        				<th>描述：</th>
	        				<td>
								<textarea name="menu.notes" rows="10" style="width: 98%">${menu.notes}</textarea>
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
		/**JavaScript函数声明*/
	
		/**页面所需资源初始化*/
		$().ready(function(){
    		$( "#spinner" ).spinner();
		})
		
		/**页面元素事件注册*/
		$().ready(function(){
			/*************************************************************************************************************************/
			//编辑菜单窗口提交按钮点击
			$("#btn_editSysMenu_submit").click(function(){
				var options = {
				    url:"<%=path%>/menu!edit.do",
					dataType:'json',
		            beforeSubmit:function(formData, jqForm, options){
					    if($("#frm_editSysMenu").validate().form()){
				    		self.parent.parent.showMask("正在保存......");
					    	return true;
					    }
						return false;
		           	},
		            success:function(rsp, statusText, xhr, $form){
		            	if(rsp.success){
				    		self.parent.frames["menuTree"].updMenuName($("#menuname").val());
		            		self.parent.parent.hideMask();
							$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
		            	}else{
							$.dialog.tips('<font color="red">保存失败!</font>',3,'error.gif');
					    }
		            }
		         };
		         $("#frm_editSysMenu").ajaxSubmit(options);
		         return false;
			});
			
		})
		
	</script>