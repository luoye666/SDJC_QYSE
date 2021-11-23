<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<!-- Grid工具栏 -->
	<div id="tlb_MessageGrid" class="tlb_baseGrid">
		<div>
			<!-- 条件筛选-->
		</div>
	</div>
	<!-- Grid表格 -->
	<table id="grd_Messages" class="grd_base"></table>
	
	<!-- 添加人员弹出窗口 -->
	<div id="win_addMessage" class="easyui-window unit_window" title="添加消息" style="width:680px;height:380px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
    
    <!-- 编辑人员弹出窗口 -->
    <div id="win_editMessage" class="easyui-window unit_window" title="编辑消息" style="width:680px;height:380px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
	
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript全局变量声明*/
		
		/**JavaScript函数声明*/
		//编辑人员方法
		function editMessage(content){
			$.messager.show({
				width:300,
				height:300,
               	title:"消息公告",
               	msg:content,
              	timeout:0,
               	showType:'slide'
           });
		}
		
		/**页面所需资源初始化*/
		$().ready(function(){
			//人员信息Grid初始化
			$("#grd_Messages").datagrid({
				url:"<%=path%>/messageBoxList!getList.do",
				singleSelect:false,
				nowrap:false,
				pagination:true,
				fitColumns:true,
				rownumbers:true,
				height:520,
				striped:true,
				rownumbers:true,
			    columns:[[
					{field:'ck',checkbox:true,width:100,align:'center'},      
			        {field:'id',title:'编号',width:100,align:'center',hidden:true},
			        {field:'title',title:'标题',width:100,align:'center'},
			        {field:'createDate',title:'发布时间',width:100,align:'center',formatter:function(value){
			        	return $Utils.date.format(value,"yyyy-MM-dd hh:mm:ss");
			        }},  
			        {field:'guoqiDate',title:'有效时间',width:100,align:'center',formatter:function(value){
			        	return $Utils.date.format(value,"yyyy-MM-dd hh:mm:ss");
			        }},  
			        {field:'faburen',title:'发布人',width:100,align:'center'},
			        {field:'aaaDate',title:'状态',width:60,align:'center',
			        	formatter: function(value,row,index){
			        		var a = new Date($Utils.date.format(row.guoqiDate,"yyyy-MM-dd hh:mm:ss"));
			        		var c = new Date();
			        		if(a < c){
			        			return "<img src='<%=path%>/images/bullet_red.png' title='消息失效' />";
			        		}else{
								return "<img src='<%=path%>/images/bullet_green.png' title='消息正常' />";
			        		}
					}},
			        {field:'access',title:'查看',width:100,align:'center',
			        	formatter: function(value,row,index){
			        		var content = "<span>标题："+row.title+"</span><span style=float:right>"+$Utils.date.format(row.createDate,"yyyy-MM-dd hh:mm:ss")+"</span><br>"+"<span style=color:gray>内容："+row.content+"</span>"+"<br>";
			        		value = '<a href="javascript:void(0)" onclick="editMessage('+"'"+content+"'"+')"><img title="预览" src="<%=path%>/images/flow_lct.png" /></a>';
							return value;
						}},
			    ]],
			    onLoadSuccess:function(data){
			    }
			});
			
			/*************************************************************************************************************************/
			//条件筛选查询按钮点击
			$("#btn_Message_search_submit").click(function(){
				var params = $STONE.formSerializedToJSON("#frm_Message_search_conditions");
				$STONE.sc_setGridQueryParams("#grd_Messages",params);
			});
			
			//条件筛选清空按钮点击
			$("#btn_Message_search_cancel").click(function(){
				$STONE.formClear("#frm_Message_search_conditions");
			});
		})
	</script>