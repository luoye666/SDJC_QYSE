<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<div id="mnu_dirBodyTop" class="mnu_baseBodyTop">
		<div class="panel-header">  
	        <a href="javascript:void(0)" title="添加目录项" id="mnubtn_addDir" 		class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
	        <a href="javascript:void(0)" title="删除目录项" id="mnubtn_delDir" 		class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">删除</a>
	        <a href="javascript:void(0)" title="刷新目录" id="mnubtn_reloadDir" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">刷新</a>  
	    </div>
	</div>
	<!-- Grid工具栏 -->
	<div id="tlb_dirGrid" class="tlb_baseGrid"></div>
	<!-- Grid表格 -->
	<table id="treGrd_dirs" class="treGrd_base"></table>
	
	<!-- 添加目录项窗口 -->
	<div id="win_addDir" class="easyui-window unit_window" title="添加目录项" style="width:460px;height:420px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
    
    <!-- 编辑目录项弹出窗口 -->
    <div id="win_editDir" class="easyui-window unit_window" title="编辑目录项" style="width:460px;height:420px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
   
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript全局变量声明*/
		
		/**JavaScript函数声明*/
		function editDir(id){
			$("#win_editDir").window({
				href:"<%=path%>/jsp/sys/seDirManager_editDir.jsp?id="+id
			}).window("open");
		}
		
		/**页面所需资源初始化*/
		$().ready(function(){
			//机构信息Grid初始化
			$("#treGrd_dirs").treegrid({
				url:"<%=path%>/dirList!getGridList.do",  
			    idField:'id',  
			    treeField:'mingcheng',
			    cache:false,
			    singleSelect:false,
				fitColumns:true,
				height:520,
			    rownumbers: true,
			    columns:[[
					{field:'ck',checkbox:true,width:120,align:'center'}, 
			        {field:'mingcheng',title:'项目名称',width:150},  
			        {field:'daima',title:'项目代码',width:150,align:'center'},  
			        {field:'xuhao',title:'序号',width:150,align:'center'},  
			        {field:'access',title:'操作',width:80,align:'center',
			        	formatter: function(value,row,index){
			        		return '<a href="#" onclick="editDir('+row.id+')" ><img title="编辑" src="<%=path%>/images/page_edit.png" /></a>';
			        }}
			    ]]
			});
			
		})
		
		/**页面元素事件注册*/
		$().ready(function(){
			/*************************************************************************************************************************/
			//添加机构按钮点击
			$("#mnubtn_addDir").click(function(){
				$("#win_addDir").window({
					href:"<%=path%>/jsp/sys/seDirManager_addDir.jsp"
				}).window("open");
			});
			
			//删除机构按钮点击
			$("#mnubtn_delDir").click(function(){
				var checkedNum = $STONE.getTreeGridChecked("#treGrd_dirs").length;
				var ids = $STONE.getTreeGridCheckedIds("#treGrd_dirs");			

				if(checkedNum==0){
					$.messager.alert("警告","请选择要删除的项目!","info");
					return false;
				}
				$.messager.confirm("警告","该操作会删除此项下的子项信息，确定执行该操作吗?", function(result){  
	                if(result){
	                	$.post("<%=path%>/dir!deleteByIds.do",{ids:ids},
	        				function (data, textStatus){
	                			$("#treGrd_dirs").treegrid("reload");
	        			});
	                }
	            });  
			});
			
			//刷新按钮点击
			$("#mnubtn_reloadDir").click(function(){
				$("#treGrd_dirs").treegrid("reload");
			});
		})
		
	</script>