<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<div id="mnu_roleBodyTop" class="mnu_baseBodyTop">
		<div class="panel-header">  
	        <a href="javascript:void(0)" id="mnubtn_mes_group_user_edit" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
	        <a href="javascript:void(0)" id="mnubtn_mes_group_user_save" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存</a>
	        <a href="javascript:void(0)" id="mnubtn_mes_group_user_reload" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">刷新</a>  
	    </div>
	</div>
	<!-- Grid工具栏 -->
	<div id="tlb_mes_group_user_Grid" class="tlb_baseGrid">
		<div>
			<form name="frm_mes_group_user_search_conditions" id="frm_mes_group_user_search_conditions">
				<table>
					<tr>
						<th>流程群组名称:</th>
						<td>
						    <td colspan="2">
								<select id="sc_groupId"   name="groupId"  class="easyui-combobox width200"/>
							</td>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- Grid表格 -->
	<table id="grd_mes_group_user" class="grd_base"></table>
	
	<!-- 选择用户弹出窗口 -->
	<div id="win_selectUser" class="easyui-window unit_window" title="选择群组成员" style="width:500px;height:450px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
    
	<!-- 脚本 -->
	<script type="text/javascript">
	    /**JavaScript全局变量声明*/
	     var s_groupId="";
	    /**JavaScript函数声明*/
		//删除群组与用户关系
		function delGroupUser(row,dbid){
			if (confirm("确定要删除该记录吗？")) {
				if(dbid != 0) {
					
					s_groupId=$('#sc_groupId').combobox('getValue');
					
					$.post("<%=path%>/mesGroupUserList!deleteGroupUser.do?uid=" + dbid + "&gid=" + s_groupId,
				    		function (data, textStatus){
								$("#grd_mes_group_user").datagrid('reload');  
				    		},"JSON");
				} else {
		   			

				}

			}
		};
		
		//群组用户Grid初始化
		$().ready(function(){
			$("#grd_mes_group_user").datagrid({
				url:"<%=path%>/mesGroupUserList!getList.do",
				singleSelect:false,
				nowrap:false,
				pagination:true,
				fitColumns:true,
				height:520,
				rownumbers:true,
				striped:true,
				rownumbers:true,
			//	toolbar:"#tlb_mes_group_user_Grid",
			    columns:[[
					{field:'ck',checkbox:true,width:120,align:'center'},
			        {field:'dbid',title:'编号',width:120,align:'center',hidden:true},  
			        {field:'id',title:'用户登录帐号',width:250,align:'center'},  
			        {field:'userName',title:'用户名',width:250,align:'center'},
			        {field:'userType',title:'角色',width:250,align:'center'},
			        {field:'access',title:'操作',width:120,align:'center',
			        	formatter: function(value,row,index){
			        		value = '<a href="javascript:void(0)" onclick="delGroupUser(this,'+row.dbid+')"><img title="删除" src="<%=path%>/images/delete.png" /></a>';
							return value;
						}},
			    ]]
			});
			
			$.post("<%=path%>/mesGroupList!getSelectList.do",
	    		function (data, textStatus){
						$("#sc_groupId").combobox({
							valueField:'id',
							textField:'text',
							data:data.groups,
							onChange:function(newValue,oldValue){
								s_groupId= $('#sc_groupId').combobox('getValue');
								var queryParams = $('#grd_mes_group_user').datagrid('options').queryParams; 
						        queryParams.groupid = s_groupId;  
						        //重新加载datagrid的数据  
						        $("#grd_mes_group_user").datagrid('reload');  
				             }
						});
	    		},"JSON");
		});
		
		/**页面元素事件注册*/
		$().ready(function(){
			/*****************************************************************************************************/
			//添加角色按钮点击
			$("#mnubtn_mes_group_user_edit").click(function(){
				var groupid = $('#sc_groupId').combobox('getValue');
				var groupName = $('#sc_groupId').combobox('getText');
				if(groupid== "") {
            		alert("请先选择流程群组！");
            		return;
				}
				$("#win_selectUser").window({
					href:"<%=path%>/jsp/sys/mesGroupUser_selectUser.jsp?group="+groupid+"&gname="+encodeURI(encodeURI(groupName))
				}).window("open");
			});
			
			//删除角色按钮点击
			$("#mnubtn_mes_group_user_save").click(function(){
				
			});
			
			//删除角色按钮点击
			$("#mnubtn_mes_group_user_reload").click(function(){
				$("#grd_mes_group_user").datagrid("reload");	//刷新Grid
			});
			
			//条件筛选查询按钮点击
			$("#btn_mes_group_search_submit").click(function(){
				var params = $STONE.formSerializedToJSON("#frm_mes_group_search_conditions");
				$STONE.sc_setGridQueryParams("#grd_mes_group_user",params);
			});
			
			//条件筛选清空按钮点击
			$("#btn_mes_group_search_cancel").click(function(){
				$STONE.formClear("#frm_mes_group_search_conditions");
			});
		});
		
	</script>