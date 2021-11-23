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
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="btn_addSysMenu_submit">保存</a>
	  </div>
            <div>
                <form class="frm_subBase" id="frm_addSysMenu" method="post">
                	<input name="menu.parentId" type="hidden" value="${param.pid}" />
					<table style="width: 60%">
	        			<tr>
	        				<th>名称：</th>
	        				<td><input class="ui-input long98" name="menu.title" required id="menuname"/></td>
	        			</tr>
	        			<tr>
	        				<th>URL：</th>
	        				<td><input class="ui-input long98" name="menu.url" required /></td>
	        			</tr>
	        			<tr>
	        				<th>样式class：</th>
	        				<td><input class="ui-input long98" name="menu.style_class" /></td>
	        			</tr>
	        			<tr>
	        				<th>tabid：</th>
	        				<td><input class="ui-input long98" name="menu.tabid" /></td>
	        			</tr>
	        			<tr>
	        				<th>类型：</th>
	        				<td>
								<select id="selectmenu" style="width: 200px" name="menu.btnCode">
									<option value="0">菜单</option>
									<option value="1">按钮</option>
								</select>
	        				</td>
	        			</tr>
	        			<tr>
	        				<th>排序编号：</th>
	        				<td>
	        					<input id="spinner" readonly="true" min=1 max=100 name="menu.sortNum"  value="1">
							</td>
	        			</tr>
	        			<tr>
	        				<th>描述：</th>
	        				<td>
								<textarea name="menu.notes" rows="10" style="width: 98%"></textarea>
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
		/**页面元素事件注册*/
		$().ready(function(){
			$( "#selectmenu" ).selectmenu();
    		$( "#spinner" ).spinner();
			$("#btn_addSysMenu_submit").click(function(){
				var options = {
				    url:"<%=path%>/menu!add.do",  
					dataType:'json',
		            beforeSubmit:function(formData, jqForm, options){
					    if($("#frm_addSysMenu").validate().form()){
				    		self.parent.parent.showMask("正在保存......");
					    	return true;
					    }
					    return false;
		           	},
		            success:function(rsp, statusText, xhr, $form){
		            	self.parent.parent.hideMask();
		            	if(rsp.success){
							var newNode = {id:rsp.id,name:$("#menuname").val(),target:"showMenuManager"};
		            		self.parent.frames["menuTree"].addMenuName(newNode);
							window.location="<%=path%>/menu!getMenuInfo.do?id="+rsp.id;
		            	}else{
							$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
		            	}
		            }
		         };
		         $("#frm_addSysMenu").ajaxSubmit(options);
		         return false;
			});
			
		})
		
	</script>