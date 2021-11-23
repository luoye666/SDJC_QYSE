<!-- 流程定义  列表页面  -->
<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<div id="mnu_workFlowDefinition_BodyTop" class="mnu_baseBodyTop">
		<div class="panel-header">  
	        <a href="javascript:void(0)" id="mnubtn_workFlowDefinition_addFlow" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">增加</a>
	        <a href="javascript:void(0)" id="mnubtn_workFlowDefinition_delFlow" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">删除</a>
	    </div>
	</div>
	<!-- Grid工具栏 -->
	<div id="tlb_workFlowDefinition_Grid" class="tlb_baseGrid">
		<div>
			<form name="frm_flowDefinition_search_conditions" id="frm_workFlowDefinition_search_conditions">
				<table>
					<tr>
						<th>流程名称:</th>
						<td><input class="easyui-validatebox" name="workflowname"></td>
						<td>
							<a id="btn_workFlowDefinition_search_submit" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
		        			<a id="btn_workFlowDefinition_search_cancel" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-arrow-undo'">清空</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- Grid表格 -->
	<table id="grd_workFlowDefinition" class="grd_base"></table>
	
	<!-- 增加添加流程弹出窗口 -->
	<div id="win_workFlowDefinition_addFlow" class="easyui-window unit_window" title="添加流程" style="width:460px;height:300px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
    
    <!-- 编辑流程弹出窗口 -->
    <div id="win_workFlowDefinition_editFlow" class="easyui-window unit_window" title="编辑流程" style="width:560px;height:400px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
    
     <!-- 查看流程图弹出窗口 -->
    <div id="win_workFlowDefinition_lookFlow" class="easyui-window"  closed="true" modal="true" title="查看流程图" style="width:520px;height:550px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'">
    	<iframe scrolling="auto" id='openFlowPicIframe' frameborder="0"  src="" style="width:100%;height:100%;"></iframe> 
    </div>
    
    <!-- 编辑流程弹出窗口 -->
    <div id="win_workFlowDefinition_startFlow" class="easyui-window unit_window" title="启动流程" style="width:460px;height:550px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
	
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript全局变量声明*/
		
		/**JavaScript函数声明*/
		//编辑流程方法
		function editFlow(id){
			$("#win_workFlowDefinition_editFlow").window({
				href:"<%=path%>/jsp/sys/workFlowDefinition_editFlow.jsp?id="+id
			}).window("open");
		}
		
		//查看流程图的方法
		function lookFlow(id){
			var errI=0;
     		var url = "<%=path%>/jbpm!showPng.do?id=" + id;
     		$('#openFlowPicIframe')[0].src=url;
     		$('#win_workFlowDefinition_lookFlow').dialog('open'); 
		}
		
		//*****启动流程的方法，以后要去掉*******
		function startFlow(id){
			var url = "<%=path%>/approval!startFlow.do?id=" + id;
			$("#win_workFlowDefinition_startFlow").window({
				href:url
			}).window("open");
		};
		
		/**页面所需资源初始化*/
		$().ready(function(){
			//角色信息Grid初始化
			$("#grd_workFlowDefinition").datagrid({
				url:"<%=path%>/flowList!getFlowDefinitionList.do",
				singleSelect:false,
				nowrap:false,
				pagination:true,
				fitColumns:true,
				height:520,
				rownumbers:true,
				striped:true,
				rownumbers:true,
				toolbar:"#tlb_workFlowDefinition_Grid",
			    columns:[[
					{field:'ck',checkbox:true,width:120,align:'center'},
			        {field:'id',title:'编号',width:120,align:'center',hidden:true},  
			        {field:'formName',title:'流程名称',width:250,align:'center'},  
			        {field:'formKey',title:'流程ID',width:250,align:'center'},
			        {field:'flowNotes',title:'流程描述',width:320,align:'center'},
			        {field:'access',title:'操作',width:120,align:'center',
			        	formatter: function(value,row,index){
			        		value = '<a href="javascript:void(0)" onclick="editFlow('+row.id+')"><img title="编辑" src="<%=path%>/images/page_edit.png" /></a>';
			        		value += '&nbsp;&nbsp;<a href="javascript:void(0)" onclick="lookFlow('+row.id+')"><img title="查看流程图" src="<%=path%>/images/search.png" /></a>';
							return value;
						}},
			    ]]
			});
		});
		
		/**页面元素事件注册*/
		$().ready(function(){
			/*****************************************************************************************************/
			//添加角色按钮点击
			$("#mnubtn_workFlowDefinition_addFlow").click(function(){
				$("#win_workFlowDefinition_addFlow").window({
					href:"<%=path%>/jsp/sys/workFlowDefinition_addFlow.jsp"
				}).window("open");
			});
			
			//删除角色按钮点击
			$("#mnubtn_workFlowDefinition_delFlow").click(function(){
				var ids = $STONE.getGridCheckedIds("#grd_workFlowDefinition");
				var checkedNum = $STONE.getGridChecked("#grd_workFlowDefinition").length;
				
				if(checkedNum==0){
					$.messager.alert("警告","请选择要删除的流程!","info");
					return false;
				}
				$.messager.confirm("警告","确定要删除选择的&nbsp;<b>"+checkedNum+"</b>&nbsp;项流程信息吗?", function(result){  
	                if (result){  
	                	$.post("<%=path%>/flow!deleteDefinition.do",{ids:ids},
	        				function (data, textStatus){
	                			$("#grd_workFlowDefinition").datagrid("reload");
	        			});
	                }  
	            });  
			});
			//条件筛选查询按钮点击
			$("#btn_workFlowDefinition_search_submit").click(function(){
				var params = $STONE.formSerializedToJSON("#frm_workFlowDefinition_search_conditions");
				$STONE.sc_setGridQueryParams("#grd_workFlowDefinition",params);
			});
			
			//条件筛选清空按钮点击
			$("#btn_workFlowDefinition_search_cancel").click(function(){
				$STONE.formClear("#frm_workFlowDefinition_search_conditions");
			});
		});
		
	</script>