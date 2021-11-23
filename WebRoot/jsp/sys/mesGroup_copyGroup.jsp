<%-- 流程管理模块的添加群组窗口 --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 添加群组弹出窗口 -->
        <div class="easyui-layout unit_layout" data-options="fit:true">  
            <div data-options="region:'center'">
            	<div class="easyui-tabs" data-options="fit:true">
            		<div title="群组信息">
	            		<form class="frm_subBase" id="frm_addMesGroup" method="post">
	            		    <div class="formHiddenRegion">
                	        </div>
							<table>
								<tr>
									<th>新流程表单<span class="warn">*</span>:</th>
									<td><input class="easyui-combobox" name="flowMembership.flowKey" id="formkeyid_copy" style="width: 179px;" data-options="required:true" />  </td>
								</tr>
								<tr>
									<th>被复制表单<span class="warn">*</span>:</th>
									<td><input class="easyui-combobox" name="flowMembership.objName" id="qunzujuese_copy" style="width: 179px;" data-options="required:true" />  </td>
								</tr>
							</table>
						</form>
            		</div>
            	</div>
            </div>
            <div data-options="region:'south',border:false" class="align-right">
            	<div id="registerMsg" style="color:red;text-align: left;width: 50%;float: left;padding-top: 5px;padding-left: 10px;"></div>
	            <a id="btn_copyGroup_submit" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)">提交</a>
		        <a id="btn_copyGroup_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">取消</a>  
            </div>
        </div>
        
        <div id="msg_loading"></div>
    
	<!-- 脚本 -->
	<script type="text/javascript">
		
		/**页面元素事件注册*/
		$().ready(function(){
	    	
	    	//formkeyid
	    	$.post("<%=path%>/flowList!getFlowDefinitionList.do",
	    		function (data, textStatus){
						$("#formkeyid_copy").combobox({
							valueField:'formKey',
							textField:'formName',
							data:data.rows,
						});
						$("#qunzujuese_copy").combobox({
							valueField:'formKey',
							textField:'formName',
							data:data.rows,
						});
	    	},"JSON");
    		
			//添加人员窗口取消按钮点击
			$("#btn_copyGroup_cancel").click(function(){
				$("#win_copyGroup").window("close");	//关闭窗口
			});
			
			
			//添加人员窗口提交按钮点击
			$("#btn_copyGroup_submit").click(function(){
				$("#frm_addMesGroup").form("submit",{  
				    url:"<%=path%>/flow!copyMembership.do",
				    onSubmit: function(param){
				    	if($(this).form("validate")){
				    		$MaskLayer.show();
				    		return true;
				    	}
				    	return false;
				    },success:function(data){
				    	$MaskLayer.hide();
				    	data = $.parseJSON(data);
				    	if(data.success){
				    		$("#win_copyGroup").window("close");	//关闭窗口
					    	$("#grd_mes_group").datagrid("reload");	//刷新Grid
				    	}
				    }
				});
				return false;
			});
		})
	</script>