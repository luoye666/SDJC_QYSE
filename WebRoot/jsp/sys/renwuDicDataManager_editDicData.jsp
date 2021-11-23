<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%  
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
    <!-- 编辑字典弹出窗口 -->
        <div class="easyui-layout unit_layout" data-options="fit:true"> 
            <div data-options="region:'center'">
            	<div class="easyui-tabs" data-options="fit:true">
	            	<div title="字典数据信息">
		                <form class="frm_subBase" id="frm_renwu_editDicData" method="post">
		                	<!-- 表单隐藏域 -->
		                	<div class="formHiddenRegion">
			                	<input type="hidden" name="dicData.id" />
			                	<input type="hidden" name="dicData.typeId" />
		                	</div>
							<table>
								<tr>
									<th>字典类型<span class="warn">*</span>：</th>
									<td>
										<select class="easyui-combobox width120" name="dicData.typeId" id="cbo_renwu_editDicData_dicTypes" ></select>
									</td>
								</tr>
								<tr>
									<th>分组名称<span class="warn">*</span>：</th>
									<td><input class="easyui-validatebox" type="text" name="dicData.name" data-options="required:true" /></td>
								</tr>
								<tr>
									<th>分组编号<span class="warn">*</span>：</th>
									<td><input class="easyui-validatebox" type="text" name="dicData.code" data-options="required:true" /></td>
								</tr>
								<tr>
									<th>分组父类：</th>
									<td>
										<input class="easyui-combotree width240" name="dicData.parentId" data-options="url:'<%=path%>/dicList!getRenwuFenzuChengyuan.do',loadFilter:function(data,parent){
	        								return data.dicDatas;
	        							}"/>
									</td>
								</tr>
								<tr>
									<th>排序：</th>
									<td>
										<input class="easyui-numberspinner"  data-options="min:1,max:100,editable:false" name="dicData.sortNum">
									</td>
								</tr>
								<tr>
									<th>值：</th>
									<td>
										<textarea rows="2" cols="32" name="dicData.value"></textarea>
									</td>
								</tr>
								<tr>
									<th>描述：</th>
									<td>
										<textarea rows="3" cols="32" name="dicData.notes"></textarea>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
            </div>
            <div data-options="region:'south',border:false" class="align-right">  
                <a id="btn_renwu_editDicData_submit" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)">提交</a>  
                <a id="btn_renwu_editDicData_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">取消</a>  
            </div>
        </div>  
    
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript全局变量声明*/
		
		/**JavaScript函数声明***************************************************/
		
		/**页面所需资源初始化****************************************************/
		$().ready(function(){
			$.post("<%=path%>/dicList!getTypeAll.do",
	    		function (data, textStatus){
					$("#cbo_renwu_editDicData_dicTypes").combobox({
						valueField:'id',
						textField:'name',
						data:data.dicTypes,
						disabled:true
					});
					
					$.post("<%=path%>/dic!getByDataId.do",{'dicData.id':"${param.id}"},
		        			function (data, textStatus){
								data = data.dicData;
								
								$("#frm_renwu_editDicData").form("load",{
									"dicData.id":data.id,
									"dicData.name":data.name,
									"dicData.typeId":data.typeId,
									"dicData.sortNum":data.sortNum,
									"dicData.value":data.value,
									"dicData.parentId":data.parentId == "0" ?"":data.parentId,
									"dicData.code":data.code,
									"dicData.notes":data.notes
								});
		        	},"json");
	    	},"JSON");
		})
		
		/**页面元素事件注册*/
		$().ready(function(){
			//编辑字段窗口提交按钮
			$("#btn_renwu_editDicData_submit").click(function(){
				$("#frm_renwu_editDicData").form("submit",{  
				    url:"<%=path%>/dic!updateData.do",  
				    onSubmit: function(param){
				    	if(!$(this).form("validate")) return false;
				    	$MaskLayer.show();
				    	return true;
				    },
				    success:function(data){
				    	$MaskLayer.hide();
				    	data = $.parseJSON(data);
				    	if(data.success){
				    		$("#win_renwu_list_editDicData").window("close");
				    		$("#grd_renwu_list_dicData_s").treegrid("reload");
				    	}else{
				    		$.messager.alert("警告",data.errorMessage,"error");
				    	}
				    }
				});
			});
			//编辑字段窗口取消按钮
			$("#btn_renwu_editDicData_cancel").click(function(){
				$("#win_renwu_list_editDicData").window("close");	//关闭窗口
			});
		})
		
	</script>