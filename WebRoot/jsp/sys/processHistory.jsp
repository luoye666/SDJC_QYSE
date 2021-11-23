<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<div id="mnu_processHistory_BodyTop" class="mnu_baseBodyTop">
		<div class="panel-header">  
	        <a href="javascript:void(0)" id="mnubtn_processHistory_del" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">删除</a>
	    </div>
	</div>
	<!-- Grid工具栏 -->
	<div id="tlb_processHistory_Grid" class="tlb_baseGrid">
		<div>
			<form name="frm_processHistory_search_conditions" id="frm_processHistory_search_conditions">
				<table>
				</table>
			</form>
		</div>
	</div>
	<!-- Grid表格 -->
	<table id="grd_processHistory" class="grd_base"></table>
    
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript全局变量声明*/
		
		/**JavaScript函数声明*/
		
		/**页面所需资源初始化*/
		$().ready(function(){
			//角色信息Grid初始化
			$("#grd_processHistory").datagrid({
				url:"<%=path%>/approvalList!getProcessHistoryList.do",
				singleSelect:false,
				nowrap:false,
				pagination:true,
				fitColumns:true,
				height:520,
				rownumbers:true,
				striped:true,
				rownumbers:true,
				toolbar:"#tlb_processHistory_Grid",
			    columns:[[
					{field:'ck',checkbox:true,width:120,align:'center'},
			        {field:'dbid',title:'dbid',width:120,align:'center',hidden:true},  
			        {field:'processInstanceId',title:'流程实例编号',width:250,align:'center'},  
			        {field:'processDefinitionId',title:'流程定义编号',width:250,align:'center'},
			        {field:'key',title:'业务键',width:320,align:'center'},
			        {field:'startTime',title:'开始时间',width:320,align:'center'},
			        {field:'endTime',title:'结束时间',width:320,align:'center'},
			    ]]
			});
		});
		
		/**页面元素事件注册*/
		$().ready(function(){
			/*****************************************************************************************************/
			//添加角色按钮点击
			$("#mnubtn_processHistory_del").click(function(){
				
			});
		});
		
	</script>