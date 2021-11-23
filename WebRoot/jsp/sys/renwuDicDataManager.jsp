<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<div id="mnu_renwu_list_dicData_BodyTop" class="mnu_baseBodyTop">
		<div class="panel-header">  
	        <a href="javascript:void(0)" title="添加字典数据" id="mnubtn_renwu_list_addDicData" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
	        <a href="javascript:void(0)" title="删除字典数据" id="mnubtn_renwu_list_delDicData" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">删除</a>
	        <a href="javascript:void(0)" title="刷新字典数据" id="mnubtn_renwu_list_reloadDicData" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">刷新</a>  
	    </div>
	</div>
	<!-- Grid工具栏 -->
	<div id="tlb_renwu_list_dicData_Grid" class="tlb_baseGrid">
		<div>
			<!-- 条件筛选-->
			<form name="frm_renwu_list_dicData__search_conditions" id="frm_renwu_list_dicData__search_conditions">
				<table>
					<tr>
						<th>字典类型：</th>
						<td>
							<select class="easyui-combobox width120" id="sc_renwu_list_dicData_Manager_dicType" name="typeId"></select>
						</td>
						<th>名称：</th>
						<td><input type="text" name="name" /></td>
						<th>编号：</th>
						<td><input type="text" name="code" /></td>
						<td>
							<a href="javascript:void(0)" title="查询" id="btn_renwu_list_dicData__search_submit" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
							<a href="javascript:void(0)" title="清空" id="btn_renwu_list_dicData__search_clear" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-arrow-undo'">清空</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- Grid表格 -->
	<table id="grd_renwu_list_dicData_s" class="grd_base"></table>
	
	<!-- 添加字典弹出窗口 -->
	<div id="win_renwu_list_addDicData" class="easyui-window unit_window" title="添加字典数据" style="width:420px;height:390px;" data-options="modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
    
    <!-- 编辑字典弹出窗口 -->
    <div id="win_renwu_list_editDicData" class="easyui-window unit_window" title="编辑字典数据" style="width:420px;height:390px;" data-options="modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
    
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript全局变量声明*/
		
		/**JavaScript函数声明***************************************************/
		function editDicData(id){
			$("#win_renwu_list_editDicData").window({
				href:"<%=path%>/jsp/sys/renwuDicDataManager_editDicData.jsp?id="+id
			}).window("open");
		}
		
		/**页面所需资源初始化****************************************************/
		$().ready(function(){
			//字典信息Grid初始化
			$("#grd_renwu_list_dicData_s").treegrid({
				url:"<%=path%>/dicList!getZuyuanDataList.do",
				idField:'id',  
				treeField:'name',
				singleSelect:false,
				fitColumns:true,
				rownumbers:true,
				height:'auto',
				rownumbers:true,
				toolbar:"#tlb_renwu_list_dicData_Grid",
			    columns:[[
					{field:'ck',checkbox:true,width:100,align:'center'},      
			        {field:'id',title:'编号',width:60,align:'center',hidden:true},
			        {field:'name',title:'名称',width:60,align:'center'},
			        {field:'code',title:'编号',width:60,align:'center'},
			        {field:'value',title:'值',width:150,align:'center'},
			        {field:'access',title:'操作',width:80,align:'center',
			        	formatter: function(value,row,index){
			        		value = '<a href="javascript:void(0)" onclick="editDicData('+row.id+')"><img title="编辑" src="<%=path%>/images/page_edit.png" /></a>';
							return value;
						}},
			    ]]
			});
			
			$.post("<%=path%>/dicList!getTypeAll.do",
    			function (data, textStatus){
					$("#sc_renwu_list_dicData_Manager_dicType").combobox({
						valueField:'id',
						textField:'name',
						data:data.dicTypes
					});
    		},"JSON");
		})
		
		/**页面元素事件注册*/
		$().ready(function(){
			//添加字典按钮点击
			$("#mnubtn_renwu_list_addDicData").click(function(){
				$("#win_renwu_list_addDicData").window({
					href:"<%=path%>/jsp/sys/renwuDicDataManager_addDicData.jsp"
				}).window("open");
			});
			
			//删除字典按钮点击
			$("#mnubtn_renwu_list_delDicData").click(function(){
				var ids = $STONE.getGridCheckedIds("#grd_renwu_list_dicData_s");
				var checkedNum = $STONE.getGridChecked("#grd_renwu_list_dicData_s").length;
				
				if(checkedNum==0){
					$.messager.alert("警告","请选择要删除的项目!","info");
					return false;
				}
				$.messager.confirm("警告","确定要删除选择的&nbsp;<b>"+checkedNum+"</b>&nbsp;项字典数据信息吗?", function(result){  
	                if (result){  
	                	$.post("<%=path%>/dic!deleteDataByIds.do",{ids:ids},
	        				function (data, textStatus){
	                			$("#grd_renwu_list_dicData_s").treegrid("reload");	//刷新Grid
	        			});
	                }
	            }); 
			});
			//刷新按钮点击
			$("#mnubtn_renwu_list_reloadDicData").click(function(){
				$("#grd_renwu_list_dicData_s").treegrid("reload");	//刷新Grid
			});
			
			/**条件筛选事件***********************************************************************************************************************/
			//条件筛选查询按钮点击
			$("#btn_renwu_list_dicData__search_submit").click(function(){
				var params = $STONE.formSerializedToJSON("#frm_renwu_list_dicData__search_conditions");
				$STONE.sc_setGridQueryParams("#grd_renwu_list_dicData_s",params);
			});
			//条件筛选清空按钮点击
			$("#btn_renwu_list_dicData__search_clear").click(function(){
				//清空字典类型控件
				$("#sc_renwu_list_dicData_Manager_dicType").combobox("clear");
				$STONE.formClear("#frm_renwu_list_dicData__search_conditions");
			});
		})
		
	</script>