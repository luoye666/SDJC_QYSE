<%-- 用户管理模块，修改用户信息的分配角色窗口 --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
    <!-- 分配角色弹出窗口 -->
        <div class="easyui-layout unit_layout" data-options="fit:true">
        	<div data-options="region:'north'" style="height:28px">
        	 	<a href="javascript:void(0)" id="btn_editUserRoles_give" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-group-add'">授权</a>
        	 	<a href="javascript:void(0)" id="btn_editUserRoles_back" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-group-delete'">取消授权</a>
        	</div> 
            <div data-options="region:'center'">
                <form class="frm_subBase" id="frm_editUserPass" method="post">
                	<input type="hidden" name="user.id" />
					<table id="grd_editUserRoles"></table>
				</form>
            </div>
            <div data-options="region:'south',border:false" class="align-right">
                <a id="btn_editUserRoles_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">关闭</a>  
            </div>
        </div>
    
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript函数声明*/
		
		/**页面所需资源初始化***************************************************************************************/
		$().ready(function(){
			$("#grd_editUserRoles").datagrid({
				url:"<%=path%>/roleList!getAll.do",
				singleSelect:false,
				pagination:false,
				fitColumns:true,
				rownumbers:true,
				striped:true,
				rownumbers:true,
			    columns:[[
					{field:'ck',checkbox:true,width:120,align:'center'},      
			        {field:'id',title:'编号',width:120,align:'center',hidden:true},  
			        {field:'name',title:'角色名(中)',width:320,align:'center'},  
			        {field:'nameEN',title:'角色名(英)',width:320,align:'center'},
			        {field:'authorizeState',title:'状态',width:260,align:'center'}
			    ]],
			    onLoadSuccess:function(data){
			    	$.each(data.rows,function(i,v){
			    		var roleId = v.id;
			    		$.post("<%=path%>/role!hasRoleForUser.do",{roleId:roleId,userId:"${param.id}"},
		            			function (data, textStatus){	
				    				var authorizeState;
				    				if(data.hasRole){
				    					authorizeState = "<span style='color:green'>已授权</span>";
				    				}else{
				    					authorizeState = "<span style='color:red'>未授权</span>";
				    				}
				    				$("#grd_editUserRoles").datagrid("updateRow",{
										index:i,row:{authorizeState : authorizeState}
									});
		            	},"json");
			    	});
			    }
			});
		});
		
		/**页面元素事件注册*/
		$().ready(function(){
			//编辑人员-角色分配窗口的授权按钮
			$("#btn_editUserRoles_give").click(function(){
				var roleIds = $STONE.getGridCheckedIds("#grd_editUserRoles");
				if(roleIds){
					$.post("<%=path%>/role!authorizeForUser.do",{userId:"${param.id}",roleIds:roleIds,accessType:'give'},
		    			function (data, textStatus){
							$("#grd_editUserRoles").datagrid("reload");
		    		});
				}
			});
			
			//编辑人员-角色分配窗口的取消授权按钮
			$("#btn_editUserRoles_back").click(function(){
				var roleIds = $STONE.getGridCheckedIds("#grd_editUserRoles");
				if(roleIds){
					$.post("<%=path%>/role!authorizeForUser.do",{userId:"${param.id}",roleIds:roleIds,accessType:'back'},
		    			function (data, textStatus){
							$("#grd_editUserRoles").datagrid("reload");
		    		});
				}
			});
			
			//修改用户角色关闭按钮
			$("#btn_editUserRoles_cancel").click(function(){
				$("#win_editUserRoles").window("close");
			});
		});
		
	</script>