<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<div id="mnu_workFlowDefinition_addFlow_BodyTop" class="mnu_baseBodyTop">
		<div class="panel-header">  
	    </div>
	</div>
	<!--Form -->
	 <div class="easyui-layout unit_layout" data-options="fit:true">  
            <div data-options="region:'center'">
            	<div class="easyui-tabs" data-options="fit:true">
            		<div title="流程信息">
	            		<form class="frm_subBase" id="frm_workFlowDefinition_editFlow" method="post">
	            		    <div class="formHiddenRegion">
	                	       <input type="hidden" name="jbpm.id" id="jbpmId"/>
	                	       <input type="text" name="jbpm.xmlName" id="jbpmXmlName"/>
	                	       <input type="hidden" name="jbpm.xmlNameEnd" id="jbpmXmlNameEnd"/>
                	        </div>
							<table>
								<tr>
									<th>流程名称<span class="warn">*</span>:</th>
									<td><input class="easyui-validatebox" type="text" name="jbpm.jbpmName"  data-options="required:true" /></td>
								</tr>
								<tr>
									<th>流程表单<span class="warn">*</span>:</th>
									<td><input class="easyui-validatebox" type="text" name="jbpm.formname" data-options="required:true" /></td>
								</tr>
								<tr>
									<th>流程描述:</th>
									<td><input class="easyui-validatebox" type="text"  name="jbpm.jbpmNotes" data-options="required:true" /></td>
								</tr>
								<tr>
									<th>待发布流程附件:</th>
									<td nowrap id="waiting">
										<c:out value="${jbpm.xmlName}"/>
									</td>
								<tr>
								<tr>
									<th>已发布流程附件:</th>
									<td nowrap id="end">
										<c:out value="${jbpm.xmlNameEnd}"/>
									</td>
								<tr>
								<tr>
									<th>备 注:</th>
									<td nowrap >
										<textarea datatype="Require"  name="jbpm.jbpmRemark" require="false" datatype="LimitB" min="0" max="200"  rows="4" cols="60" msg="备注最大输入100个汉字或者200个字符。"></textarea>
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
		/**页面所需资源初始化*/
		$().ready(function(){
			$.post("<%=path%>/jbpm!getById.do",{id:"${param.id}"},
		        	function (data, textStatus){
		        		data = data.jbpm;
						$("#frm_workFlowDefinition_editFlow").form("load",{
							"jbpm.id":data.id,
							"jbpm.jbpmName":data.jbpmName,
							"jbpm.xmlName":data.xmlName,
							"jbpm.formname":data.formname,
							"jbpm.jbpmNotes":data.jbpmNotes,
							"jbpm.jbpmRemark":data.jbpmRemark,
						});
		    },"json");
		});
		/**页面元素事件注册*/
		$().ready(function(){
			$("#mnubtn_workFlowDefinition_addFlow_save").click(function(){
				$("#frm_workFlowDefinition_addFlow").form("submit",{  
				    url:"<%=path%>/jbpm!update.do",
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
			
			$("#mnubtn_workFlowDefinition_addFlow_upload").click(function(){
			
				if ($("#jbpmId").attr("value") == 0) {
					$.messager.alert("提示",'请先保存基本信息',"info");
            		return;
            	} else if ($("#jbpmXmlNameEnd").attr("value")!= "") {
            		$.messager.alert("提示",'流程已经发布，不能上传附件',"info");
            		return;
            	}
				$('#win_uploadfile').window('open');
				
			});
			
			//上传附件  
			$("#btn_workFlowDefinition_editFlow_file_submit").click(function(){
				var vxmlfile=$("#xmlFile").val(); 
				var jbpmid=$("#jbpmId").attr("value");
				$("#frm_workFlowDefinition_editFlow_file").form('submit', {  
			      url:"<%=path%>/jbpm!upload.do?xmlFile="+vxmlfile+"&id="+jbpmid,   
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
				    		$("#win_uploadfile").window("close");	//关闭窗口
				    	}
				    }
		      });
		   });
		   //关闭
		   $("#btn_workFlowDefinition_editFlow_file_cancel").click(function(){
				
				$("#win_uploadfile").window("close");	//关闭窗口
		     
		   });
			
	       $("#mnubtn_workFlowDefinition_addFlow_publish").click(function(){
				
				if ($("#jbpmXmlName").attr("value")=="") {
					$.messager.alert("提示",'没有待发布流程',"info");
            		return;
            	} else if ($("#jbpmXmlNameEnd").attr("value")!= "") {
            		$.messager.alert("提示",'流程已经发布',"info");
            		return;
            	}
				deploy();
			});
			
		});
		
	</script>