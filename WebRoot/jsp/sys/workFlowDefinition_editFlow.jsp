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
	        <!--<a href="javascript:void(0)" id="mnubtn_workFlowDefinition_addFlow_upload" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-database-go'">上传流程</a>-->
	        <!--<a href="javascript:void(0)" id="mnubtn_workFlowDefinition_addFlow_publish" 	class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-database-add'">发布</a>-->
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
									<td><input class="easyui-validatebox" type="text"  name="flowDefinition.flowNotes" data-options="required:true" /></td>
								</tr>
								<!--<tr>
									<th>待发布流程附件:</th>
									<td><input  class="easyui-validatebox" name="jbpm.xmlName" id="jbpmXmlName" readonly=true/></td>
								<tr>
								<tr>
									<th>已发布流程附件:</th>
									<td><input class="easyui-validatebox" name="jbpm.xmlNameEnd" id="jbpmXmlNameEnd" readonly=true/></td>
								<tr>
								--><tr>
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
     <!-- 上传流程--弹出窗口 --> 
	<div id="win_uploadfile" class="easyui-window" title="上传流程" style="width:460px;height:100px;" closed="true" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'">
		<div class="easyui-layout unit_layout" data-options="fit:true"> 
        <div data-options="region:'center'">
		<form id="frm_workFlowDefinition_editFlow_file" style="padding:10px 20px 10px 40px;" enctype="multipart/form-data" method="post"> 
			<table>
				<tr>
					<th>流程名称<span class="warn">*</span>:</th>
					<td><input type="file" name="xmlFile" id="xmlFile"  class="easyui-validatebox" validType="fileType['ZIP']" required="true" /></td>
				</tr>
			</table> 
    	</form>
    	</div> 
    	<div data-options="region:'south',border:false" class="align-right">  
				<a id="btn_workFlowDefinition_editFlow_file_submit" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)">上传</a>  
                <a id="btn_workFlowDefinition_editFlow_file_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">关闭</a>  
		</div>
		</div>   
	</div>
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript全局变量声明*/
		
		/**JavaScript函数声明*/
		function deploy(){
			$("#frm_workFlowDefinition_editFlow").form("submit",{  
			    url:"<%=path%>/jbpm!deploay.do",
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
			    	}
			    }
		});
		};
		
		/**页面所需资源初始化*/
		$().ready(function(){
			$.post("<%=path%>/flow!getBydefinitionId.do",{id:"${param.id}"},
		        	function (data, textStatus){
		        		data = data.definition;
						$("#frm_workFlowDefinition_editFlow").form("load",{
							"jbpm.id":data.id,
							"flowDefinition.formName":data.formName,
							"flowDefinition.formKey":data.formKey,
							"flowDefinition.flowNotes":data.flowNotes,
							"flowDefinition.flowRemark":data.flowRemark,
						});
		    },"json");
		});
		
		/**页面元素事件注册*/
		$().ready(function(){
			$("#mnubtn_workFlowDefinition_addFlow_save").click(function(){
				$("#frm_workFlowDefinition_addFlow").form("submit",{  
				    url:"<%=path%>/flow!edotDefinition.do",
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