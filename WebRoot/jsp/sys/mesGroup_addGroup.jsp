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
	            		    	<input type="hidden" data-options="required:true" name="flowMembership.objKey" id="objkey" style="width: 179px;"/>
                	        </div>
							<table>
								<tr>
									<th>流程表单<span class="warn">*</span>:</th>
									<td><input class="easyui-combobox" name="flowMembership.flowKey" id="formkeyid" style="width: 179px;" data-options="required:true" />  </td>
								</tr>
								<tr>
									<th>环节名称<span class="warn">*</span>:</th>
									<td><input class="easyui-combobox" name="flowMembership.objName" id="qunzujuese" style="width: 179px;" data-options="required:true" />  </td>
								</tr>
								<tr>
									<th>环节处理人<span class="warn">*</span>:</th>
									<td><input class="easyui-combotree" name="flowMembership.objString" style="width: 179px;" id="huanjiechuliren" data-options="required:true" />  </td>
								</tr>
								<tr>
									<th>是否首环节<span class="warn">*</span>:</th>
									<td>
										<select class="easyui-combobox" name="flowMembership.objStart" style="width: 179px;" data-options="required:true" >
											<option value="否">否</option>
											<option value="是">是</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>上一环节<span class="warn">*</span>:</th>
									<td>
										<input  class="easyui-combobox" name="flowMembership.objBack" id="shangyihuanjie" style="width: 179px;"/>
									</td>
								</tr>
								<tr>
									<th>是否结束环节<span class="warn">*</span>:</th>
									<td>
										<select class="easyui-combobox" name="flowMembership.objEnd" style="width: 179px;" id="jianyanfangshi" data-options="required:true" >
											<option value="否">否</option>
											<option value="是">是</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>下一环节<span class="warn">*</span>:</th>
									<td>
										<input class="easyui-combobox" name="flowMembership.objNext" id="xiayihuanjie" style="width: 179px;" data-options="required:true" />
									</td>
								</tr>
								<tr>
									<th>退回环节<span class="warn">*</span>:</th>
									<td>
										<input  class="easyui-combobox"  id="tuihuihuanjie" name="flowMembership.objCancel" style="width: 179px;"/>
									</td>
								</tr>
								<tr>
									<th>驳回环节<span class="warn">*</span>:</th>
									<td>
										<input  class="easyui-combobox" id="bohuihuanjie" name="flowMembership.objBohui" style="width: 179px;"/>
									</td>
								</tr>
								<tr>
									<th>可以回收的环节:</th>
									<td>
										<input  class="easyui-combobox" id="huishouhuanjie" name="flowMembership.objHuishou" style="width: 179px;"/>
									</td>
								</tr>
							</table>
						</form>
            		</div>
            	</div>
            </div>
            <div data-options="region:'south',border:false" class="align-right">
            	<div id="registerMsg" style="color:red;text-align: left;width: 50%;float: left;padding-top: 5px;padding-left: 10px;"></div>
	            <a id="btn_addGroup_submit" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)">提交</a>
		        <a id="btn_addGroup_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">取消</a>  
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
						$("#formkeyid").combobox({
							valueField:'formKey',
							textField:'formName',
							data:data.rows,
						});
	    	},"JSON");
	    	
			
			//huanjiechuliren
			$.post("<%=path%>/userList!getListTree.do",
	    		function (data, textStatus){
					$("#huanjiechuliren").combotree({
						multiple:'true',
						valueField:'id',
						textField:'text',
						data:data.menus,
					});
	    	},"JSON");
			
			
			
			
			//环节名称
			$.post("<%=path%>/mesGroupList!getJueSeList.do",{gname:"群组角色"},
	    		function (data, textStatus){
					$("#qunzujuese").combobox({
						valueField:'name',
						textField:'name',
						data:data.juese,
						onSelect:function(data){
							$("#objkey").val(data.value);
						}
					});
					
					//上一环节
					$("#shangyihuanjie").combobox({
						valueField:'value',
						textField:'name',
						data:data.juese,
					});
					
					//下一环节
					$("#xiayihuanjie").combobox({
						valueField:'value',
						textField:'name',
						multiple:'true',
						data:data.juese,
					});
					
					//退回环节
					$("#tuihuihuanjie").combobox({
						valueField:'value',
						textField:'name',
						multiple:'true',
						data:data.juese,
					});
					
					//驳回环节
					$("#bohuihuanjie").combobox({
						valueField:'value',
						textField:'name',
						multiple:'true',
						data:data.juese,
					});
					
					//可以回收环节
					$("#huishouhuanjie").combobox({
						valueField:'value',
						textField:'name',
						multiple:'true',
						data:data.juese,
					});
					
    		},"JSON");
    		
			//添加人员窗口取消按钮点击
			$("#btn_addGroup_cancel").click(function(){
				$("#win_addGroup").window("close");	//关闭窗口
			});
			
			
			//添加人员窗口提交按钮点击
			$("#btn_addGroup_submit").click(function(){
				$("#frm_addMesGroup").form("submit",{  
				    url:"<%=path%>/flow!addMembership.do",
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
				    		$("#win_addGroup").window("close");	//关闭窗口
					    	$("#grd_mes_group").datagrid("reload");	//刷新Grid
				    	}else{
				    	}
				    }
				});
				return false;
			});
			
		})
		
	</script>