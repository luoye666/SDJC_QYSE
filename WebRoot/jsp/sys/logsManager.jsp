<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<div id="mnu_LogsBodyTop" class="mnu_baseBodyTop">
		<div class="panel-header">  
	        
	    </div>
	</div>
	<!-- Grid工具栏 -->
	<div id="tlb_LogsGrid" class="tlb_baseGrid">
		<div>
			<form name="frm_Logs_search_conditions" id="frm_Logs_search_conditions">
				<table>
					<tr>
						<th>日志名称:</th>
						<td><input class="easyui-validatebox" name="name"></td>
						<th>应用名称:</th>
						<td>
							<select class="easyui-combobox" style="width: 179px;" name="nameEN">
								<option value=""></option>
								<option value="AccountAction">用户登录</option>
								<option value="设备停用">设备停用</option>
								<option value="任务退回">任务退回</option>
								<option value="任务终止">任务终止</option>
								<option value="任务作废">任务作废</option>
								<option value="报告作废">报告作废</option>
							</select>
						</td>
						<td>
							<a id="btn_Logs_search_submit" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
		        			<a id="btn_Logs_search_cancel" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-arrow-undo'">清空</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- Grid表格 -->
	<table id="grd_Logss" class="grd_base"></table>
	
	<!-- 添加角色弹出窗口 -->
	<div id="win_addLogs" class="easyui-window unit_window" title="查看信息" style="width:460px;height:550px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript全局变量声明*/
		
		/**JavaScript函数声明*/
		//编辑角色方法
		function editLogs(url){
			$("#win_addLogs").window({
				href:url
			}).window("open");
		}
		
		/**页面所需资源初始化*/
		$().ready(function(){
			//角色信息Grid初始化
			$("#grd_Logss").datagrid({
				url:"<%=path%>/logsList!getList.do",
				singleSelect:false,
				nowrap:false,
				pagination:true,
				fitColumns:true,
				height:'auto',
				rownumbers:true,
				striped:true,
				rownumbers:true,
				toolbar:"#tlb_LogsGrid",
			    columns:[[
					{field:'ck',checkbox:true,width:120,align:'center'},
			        {field:'id',title:'编号',width:120,align:'center',hidden:true},  
			        {field:'actionapp',title:'应用名称',width:150,align:'center'},  
			        {field:'name',title:'日志名称',width:250,align:'center'}, 
			        {field:'username',title:'操作人',width:80,align:'center'},
			        {field:'logtime',title:'操作时间',width:320,align:'center',formatter:function(value){
			        	return $Utils.date.format(value,'yyyy-MM-dd hh:ss:mm');
			        }},
			        {field:'access',title:'操作',width:120,align:'center',
			        	formatter: function(value,row,index){
			        		value = '<a href="javascript:void(0)" onclick="editLogs('+row.url+')"><img title="查看" src="<%=path%>/images/page_edit.png" /></a>';
							return value;
						}},
			    ]]
			});
			
			//条件筛选查询按钮点击
			$("#btn_Logs_search_submit").click(function(){
				var params = $STONE.formSerializedToJSON("#frm_Logs_search_conditions");
				$STONE.sc_setGridQueryParams("#grd_Logss",params);
			});
			
			//条件筛选清空按钮点击
			$("#btn_Logs_search_cancel").click(function(){
				$STONE.formClear("#frm_Logs_search_conditions");
			});
		})
		
	</script>