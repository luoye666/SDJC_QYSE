<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<div id="mnu_roleBodyTop" class="mnu_baseBodyTop">
		<div class="panel-header">  
	        <a href="javascript:void(0)" id="mnubtn_mes_group_selectuser_save" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">确定</a>
	        <a href="javascript:void(0)" id="mnubtn_mes_group_selectuser_close" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">关闭</a>  
	    </div>
	</div>
	<!-- Grid工具栏 -->
	<div id="tlb_mes_group_selectuser_Grid" class="tlb_baseGrid">
		<div>
			<form name="frm_mes_group_selectuser_search_conditions" id="frm_mes_group_selectuser_search_conditions">
				<table>
					<tr>
						<th>科室名称:</th>
						<td>
						    <td colspan="2">
								<select id="sc_keshiId"   name="keshiId"  class="easyui-combobox" style="width:150px"/>
							</td>
						</td>
						<th>角色:</th>
						<td>
						    <td colspan="2">
								<select id="sc_juese" required="required" name="jueseName"  class="easyui-combobox" style="width:150px"/>
							</td>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- Grid表格 -->
	<table id="grd_mes_group_selectuser" class="grd_base"></table>
    
	<!-- 脚本 -->
	<script type="text/javascript">
	    /**JavaScript全局变量声明*/
	     var s_keshiId="";
	     var sc_juese="";
		//群组用户Grid初始化
		$().ready(function(){
			$("#grd_mes_group_selectuser").datagrid({
				url:"<%=path%>/mesGroupUserList!getOrganUserList.do",
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
			        {field:'id',title:'userid',width:250,align:'center',hidden:true},  
			        {field:'name',title:'用户名',width:250,align:'center'},
			        {field:'loginId',title:'登陆账号',width:250,align:'center'}
			    ]]
			});
			
			$.post("<%=path%>/mesGroupList!getSelectOrganList.do",
	    		function (data, textStatus){
						$("#sc_keshiId").combobox({
							valueField:'id',
							textField:'name',
							data:data.organs,
							onChange:function(newValue,oldValue){
								s_keshiId= $('#sc_keshiId').combobox('getValue');
								var queryParams = $('#grd_mes_group_selectuser').datagrid('options').queryParams; 
						        queryParams.organid = s_keshiId;  
						        //重新加载datagrid的数据  
						        $("#grd_mes_group_selectuser").datagrid('reload');  
				             }
						});
	    	},"JSON");
	    		
			$.post("<%=path%>/mesGroupList!getJueSeList.do",{gname:"群组角色"},
	    		function (data, textStatus){
					$("#sc_juese").combobox({
						valueField:'name',
						textField:'name',
						data:data.juese
						//data:[{name: '申请人'},{name: '审核人'},{name: '审批人'}]
					});
    		},"JSON");
		});
		
		/**页面元素事件注册*/
		$().ready(function(){
			//确定
			$("#mnubtn_mes_group_selectuser_save").click(function(){
				var ids = $STONE.getGridCheckedIds("#grd_mes_group_selectuser");
				var checkedNum = $STONE.getGridChecked("#grd_mes_group_selectuser").length;
				if(checkedNum==0){
					$.messager.alert("警告","请选择人员!","info");
					return false;
				}
				if(!$("#frm_mes_group_selectuser_search_conditions").form("validate")){
					return false;
				}
				var groupid = "${param.group}";
				var juese = $("#sc_juese").combobox('getValue');
				$.post("<%=path%>/mesGroup!addGroupUser.do",{ids:ids,groupid:groupid,juese:juese},
		        	function (data, textStatus){
						$("#win_selectUser").window('close');
		                $("#grd_mes_group_user").datagrid("reload");
		        });
				
			});
			//关闭
			$("#mnubtn_mes_group_selectuser_close").click(function(){
				$("#win_selectUser").window('close');
			});
		});
		
	</script>