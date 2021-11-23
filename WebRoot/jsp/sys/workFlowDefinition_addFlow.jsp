<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<div id="mnu_workFlowDefinition_addFlow_BodyTop" class="mnu_baseBodyTop">
		<div class="panel-header">  
	        <a href="javascript:void(0)" id="mnubtn_workFlowDefinition_addFlow_save" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存</a>
	    </div>
	</div>
	<!--Form -->
	 <div class="easyui-layout unit_layout" data-options="fit:true">  
            <div data-options="region:'center'">
            	<div class="easyui-tabs" data-options="fit:true">
            		<div title="流程信息">
	            		<form class="frm_subBase" id="frm_workFlowDefinition_addFlow" method="post">
	            		    <div class="formHiddenRegion">
                	        </div>
							<table>
								<tr>
									<th>流程名称<span class="warn">*</span>:</th>
									<td><input class="easyui-validatebox" type="text" name="flowDefinition.formName"  data-options="required:true" /></td>
								</tr>
								<tr>
									<th>流程表单<span class="warn">*</span>:</th>
									<td><input class="easyui-validatebox" type="text" name="flowDefinition.formKey" data-options="required:true" /></td>
								</tr>
								<tr>
									<th>流程描述:</th>
									<td><input class="easyui-validatebox" type="text"  name="flowDefinition.flowNotes"/></td>
								</tr>
								<tr>
									<th>备 注:</th>
									<td nowrap >
										<textarea datatype="Require"  name="flowDefinition.flowRemark" require="false" datatype="LimitB" min="0" max="200"  rows="4" cols="40" msg="备注最大输入100个汉字或者200个字符。"></textarea>
									</td>
								<tr>
							</table>
						</form>
            		</div>
            	</div>
            </div>
     </div>
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript全局变量声明*/
		
		/**JavaScript函数声明*/
		
		/**页面元素事件注册*/
		$().ready(function(){
			$("#mnubtn_workFlowDefinition_addFlow_save").click(function(){
				$("#frm_workFlowDefinition_addFlow").form("submit",{  
				    url:"<%=path%>/flow!addDefinition.do",
				    onSubmit: function(param){
				    	if($(this).form("validate")){
				    		$MaskLayer.show();
				    		return true;
				    	}
				    	return false;
				    },
				    success:function(data){
				    	$MaskLayer.hide();
				    	data = $.parseJSON(data);
				    	if(data.success){
				    		$("#win_workFlowDefinition_addFlow").window("close");	//关闭窗口
					    	$("#grd_workFlowDefinition").datagrid("reload");	    //刷新Grid
				    	}else{
				    		
				    	}
				    }
				});
				return false;
			});
		});
		
	</script>