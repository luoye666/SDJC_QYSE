<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<div id="mnu_workFlowDefinition_BodyTop" class="mnu_baseBodyTop">
		<div class="panel-header">  
	        <a href="javascript:void(0)" id="mnubtn_workFlowInstance_delProcessInstance" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">删除</a>
	    </div>
	</div>
	<!-- Grid工具栏 -->
	<div id="tlb_workFlowInstance_Grid" class="tlb_baseGrid">
		<div>
			<form name="frm_workFlowInstance_search_conditions" id="frm_workFlowInstance_search_conditions">
				<table>
					<tr>
						<th>审批类型:</th>
						<td><input class="easyui-validatebox" name="workflowname"></td>
						<th>编号:</th>
						<td><input class="easyui-validatebox" name="workflowname"></td>
					</tr>
					<tr>
						<th>单位名称:</th>
						<td colspan="2" ><input class="easyui-validatebox" name="workflowname"></td>
					</tr>
					<tr>
						<td>
							<a id="btn_workFlowInstance_search_submit" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
		        			<a id="btn_workFlowInstance_search_cancel" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-arrow-undo'">清空</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- Grid表格 -->
	<table id="grd_workFlowInstance" class="grd_base"></table>
	
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript全局变量声明*/
		
		/**JavaScript函数声明*/
		
		/**页面所需资源初始化*/
		$().ready(function(){
			//角色信息Grid初始化
			$("#grd_workFlowInstance").datagrid({
				url:"<%=path%>/approvalList!getAllProcessInstanceList.do",
				singleSelect:false,
				nowrap:false,
				pagination:true,
				fitColumns:true,
				height:520,
				rownumbers:true,
				striped:true,
				rownumbers:true,
			//	toolbar:"#tlb_workFlowInstance_Grid",
			    columns:[[
					{field:'ck',checkbox:true,width:120,align:'center'},
			        {field:'id',title:'编号',width:120,align:'center',hidden:true},  
			        {field:'danweimingcheng',title:'单位名称',width:250,align:'center'},  
			        {field:'preUserName',title:'发送人',width:250,align:'center'},
			        {field:'sendTime',title:'发送时间',width:320,align:'center',
			        	formatter:function(value){
			        		return $Utils.date.format(value);
			        	}	
			        },
			        {field:'liuzhuanleixing',title:'审批类型',width:320,align:'center'},
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
	                	$.post("<%=path%>/jbpm!delete.do",{ids:ids},
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