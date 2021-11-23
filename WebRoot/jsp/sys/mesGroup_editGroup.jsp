<%-- 用户管理模块,修改用户信息弹出窗口 --%>
<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
    <!-- 编辑群组弹出窗口 -->
        <div class="easyui-layout unit_layout" data-options="fit:true"> 
            <div data-options="region:'center'">
                <form class="frm_subBase" id="frm_editGroup" method="post">
                	<!-- 表单隐藏域 -->
                	<div class="formHiddenRegion">
	                	<input type="hidden" name="flowMembership.id" />
	                	<input type="hidden" name="flowMembership.objKey" id="objKey_edit">
                	</div>
					<table>
						<tr>
							<th>流程表单<span class="warn">*</span>:</th>
							<td><input class="easyui-combobox" name="flowMembership.flowKey" id="formkeyid_edit" style="width: 179px;" data-options="required:true" />  </td>
						</tr>
						<tr>
							<th>环节名称<span class="warn">*</span>:</th>
							<td><input class="easyui-combobox" name="flowMembership.objName" id="qunzujuese_edit" style="width: 179px;" data-options="required:true" />  </td>
						</tr>
						<tr>
							<th>环节处理人<span class="warn">*</span>:</th>
							<td><input class="easyui-combotree" name="flowMembership.objString" style="width: 179px;" id="huanjiechuliren_edit" data-options="required:true" />  </td>
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
								<input  class="easyui-combobox" name="flowMembership.objBack" id="shangyihuanjie_edit" style="width: 179px;"/>
							</td>
						</tr>
						<tr>
							<th>是否结束环节<span class="warn">*</span>:</th>
							<td>
								<select class="easyui-combobox" name="flowMembership.objEnd" style="width: 179px;" id="jianyanfangshi_edit" data-options="required:true" >
									<option value="否">否</option>
									<option value="是">是</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>下一环节<span class="warn">*</span>:</th>
							<td>
								<input class="easyui-combobox" name="flowMembership.objNext" id="xiayihuanjie_edit" style="width: 179px;" data-options="required:true" />
							</td>
						</tr>
						<tr>
							<th>退回环节<span class="warn">*</span>:</th>
							<td>
								<input  class="easyui-combobox"  id="tuihuihuanjie_edit" name="flowMembership.objCancel" style="width: 179px;"/>
							</td>
						</tr>
						<tr>
							<th>驳回环节<span class="warn">*</span>:</th>
							<td>
								<input  class="easyui-combobox" id="bohuihuanjie_edit" name="flowMembership.objBohui" style="width: 179px;"/>
							</td>
						</tr>
						<tr>
							<th>可以回收的环节:</th>
							<td>
								<input  class="easyui-combobox" id="huishouhuanjie_edit" name="flowMembership.objHuishou" style="width: 179px;"/>
							</td>
						</tr>
					</table>
				</form>
            </div>
            <div data-options="region:'south',border:false" class="align-right">  
                <a id="btn_editGroup_submit" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)">提交</a>  
                <a id="btn_editGroup_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">取消</a>  
            </div>
        </div>  

   

	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript函数声明*/
		
		/**页面所需资源初始化***************************************************************************************/
		$().ready(function(){
		
		
			//formkeyid
	    	$.post("<%=path%>/flowList!getFlowDefinitionList.do",
	    		function (data, textStatus){
						$("#formkeyid_edit").combobox({
							valueField:'formKey',
							textField:'formName',
							data:data.rows,
						});
	    	},"JSON");
	    	
			
			//huanjiechuliren
			$.post("<%=path%>/userList!getListTree.do",
	    		function (data, textStatus){
					$("#huanjiechuliren_edit").combotree({
						multiple:'true',
						valueField:'id',
						textField:'text',
						data:data.menus,
					});
	    	},"JSON");
			
			
			
			
			//环节名称
			$.post("<%=path%>/mesGroupList!getJueSeList.do",{gname:"群组角色"},
	    		function (data, textStatus){
					$("#qunzujuese_edit").combobox({
						valueField:'name',
						textField:'name',
						data:data.juese,
						onSelect:function(data){
							$("#objKey_edit").val(data.value);
						}
					});
					
					//上一环节
					$("#shangyihuanjie_edit").combobox({
						valueField:'value',
						textField:'name',
						data:data.juese,
					});
					
					//下一环节
					$("#xiayihuanjie_edit").combobox({
						valueField:'value',
						textField:'name',
						multiple:'true',
						data:data.juese,
					});
					
					//退回环节
					$("#tuihuihuanjie_edit").combobox({
						valueField:'value',
						textField:'name',
						multiple:'true',
						data:data.juese,
					});
					
					//驳回环节
					$("#bohuihuanjie_edit").combobox({
						valueField:'value',
						textField:'name',
						multiple:'true',
						data:data.juese,
					});
					
					//可以回收环节
					$("#huishouhuanjie_edit").combobox({
						valueField:'value',
						textField:'name',
						multiple:'true',
						data:data.juese,
					});
					
					
					//根据传入的ID加载需要编辑的用户信息
					$.post("<%=path%>/flow!getByMembershipId.do",{dbid:"${param.dbid}"},
		        		function (data, textStatus){
				        data = data.membership;
				        $("#huanjiechuliren_edit").combotree("setValues",(data.objString).split(", ")); //"flowMembership.objString":data.objString,
				        $("#xiayihuanjie_edit").combobox("setValues",(data.objNext).split(", "));
				        $("#tuihuihuanjie_edit").combobox("setValues",(data.objCancel).split(", "));
				        $("#bohuihuanjie_edit").combobox("setValues",(data.objBohui).split(", "));
				        $("#huishouhuanjie_edit").combobox("setValues",(data.objHuishou).split(", "));
				        $("#formkeyid_edit").combobox("setValue",data.flowkey);
						$("#frm_editGroup").form("load",{
							"flowMembership.id":data.id,
							//"flowMembership.flowKey":data.flowkey,
							"flowMembership.objName":data.objName,
							"flowMembership.objStart":data.objStart,
							"flowMembership.objBack":data.objBack,
							"flowMembership.objEnd":data.objEnd,
							"flowMembership.objKey":data.objKey,
						});
		     		},"json");
					
    		},"JSON");
		
		
			//编辑群组窗口提交按钮
			$("#btn_editGroup_submit").click(function(){
				$("#frm_editGroup").form("submit",{  
				    url:"<%=path%>/flow!editMembership.do",
				    onSubmit: function(param){
				    	return $(this).form("validate");
				    },
				    success:function(data){
				    	$("#win_editGroup").window("close");	//关闭窗口
				    	$("#grd_mes_group").datagrid("reload");	//刷新Grid
				    }
				});
				return false;
			});
			
			//编辑群组窗口取消按钮点击
			$("#btn_editGroup_cancel").click(function(){
				$("#win_editGroup").window("close");	//关闭窗口
			});
			
		})
		
	</script>