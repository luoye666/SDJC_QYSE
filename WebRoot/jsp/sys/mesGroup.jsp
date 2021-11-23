<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<div id="mnu_roleBodyTop" class="mnu_baseBodyTop">
		<div class="panel-header">  
	        <a href="javascript:void(0)" id="mnubtn_addGroup" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">增加</a>
	        <a href="javascript:void(0)" id="mnubtn_delGroup" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">删除</a>
	        <a href="javascript:void(0)" id="mnubtn_copyGroup" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-application'">复制流程</a>
	    </div>
	</div>
	<!-- Grid工具栏 -->
	<div id="tlb_mes_group_Grid" class="tlb_baseGrid">
		<div>
			<form name="frm_mes_group_search_conditions" id="frm_mes_group_search_conditions">
				<table>
					<tr>
						<th>流程ID:</th>
						<td><input class="easyui-validatebox" name="con_groupname"></td>
						<td>
							<a id="btn_mes_group_search_submit" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
		        			<a id="btn_mes_group_search_cancel" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-arrow-undo'">清空</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- Grid表格 -->
	<table id="grd_mes_group" class="grd_base"></table>
	
	<!-- 添加流程弹出窗口 -->
	<div id="win_addGroup" class="easyui-window unit_window" title="添加群组" style="width:460px;height:550px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
    
    <!-- 编辑流程弹出窗口 -->
    <div id="win_editGroup" class="easyui-window unit_window" title="编辑群组" style="width:460px;height:550px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
    
    <div id="win_copyGroup" class="easyui-window unit_window" title="复制流程群组" style="width:260px;height:250px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
	
	<!-- 脚本 -->
	<script type="text/javascript">
	
		//编辑群组方法
		function editGroup(dbid){
			$("#win_editGroup").window({
				href:"<%=path%>/jsp/sys/mesGroup_editGroup.jsp?dbid="+dbid
			}).window("open");
		}
		
		
		
		//群组信息Grid初始化
		$().ready(function(){
			
			$("#grd_mes_group").datagrid({
				url:"<%=path%>/flowList!getFlowMembershipList.do",
				singleSelect:false,
				nowrap:false,
				pagination:true,
				fitColumns:true,
				height:520,
				rownumbers:true,
				striped:true,
				rownumbers:true,
				toolbar:"#tlb_mes_group_Grid",
			    columns:[[
					{field:'ck',checkbox:true,width:120,align:'center'},
			        {field:'id',title:'编号',width:120,align:'center',hidden:true},  
			        {field:'flowKey',title:'流程ID',width:250,align:'center'},  
			        {field:'objName',title:'环节名称',width:250,align:'center'},  
			        {field:'objKey',title:'环节ID',width:250,align:'center'},  
			        {field:'objString',title:'处理人',width:250,align:'center'},  
			        {field:'objNext',title:'下一环节ID',width:250,align:'center'},
			        {field:'access',title:'操作',width:120,align:'center',
			        	formatter: function(value,row,index){
			        		value = '<a href="javascript:void(0)" onclick="editGroup('+row.id+')"><img title="编辑" src="<%=path%>/images/page_edit.png" /></a>';
							return value;
						}},
			    ]]
			});
			
			/*****************************************************************************************************/
			//添加角色按钮点击
			$("#mnubtn_addGroup").click(function(){
				$("#win_addGroup").window({
					href:"<%=path%>/jsp/sys/mesGroup_addGroup.jsp"
				}).window("open");
			});
			
			//删除角色按钮点击
			$("#mnubtn_delGroup").click(function(){
				var ids = $STONE.getGridCheckedIds("#grd_mes_group");
				var checkedNum = $STONE.getGridChecked("#grd_mes_group").length;
				
				if(checkedNum==0){
					$.messager.alert("警告","请选择要删除的群组!","info");
					return false;
				}
				$.messager.confirm("警告","确定要删除选择的&nbsp;<b>"+checkedNum+"</b>&nbsp;项群组信息吗?", function(result){  
	                if (result){  
	                	$.post("<%=path%>/flow!deleteMembership.do",{ids:ids},
	        				function (data, textStatus){
	                			$("#grd_mes_group").datagrid("reload");
	        			});
	                }  
	            });  
			});
			
			$("#mnubtn_copyGroup").click(function(){
				$("#win_addGroup").window({
					href:"<%=path%>/jsp/sys/mesGroup_copyGroup.jsp"
				}).window("open");
			});
			
			//条件筛选查询按钮点击
			$("#btn_mes_group_search_submit").click(function(){
				var params = $STONE.formSerializedToJSON("#frm_mes_group_search_conditions");
				$STONE.sc_setGridQueryParams("#grd_mes_group",params);
			});
			
			//条件筛选清空按钮点击
			$("#btn_mes_group_search_cancel").click(function(){
				$STONE.formClear("#frm_mes_group_search_conditions");
			});
		})
		
	</script>