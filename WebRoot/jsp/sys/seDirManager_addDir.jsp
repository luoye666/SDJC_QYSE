<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 添加项目弹出窗口 -->
        <div class="easyui-layout unit_layout" data-options="fit:true">  
            <div data-options="region:'center'"> 
                <form class="frm_subBase" id="frm_addDir" method="post">
					<table>
						<tr>
							<th>项目名称:<span class="warn">*</span>：</th>
							<td><input class="easyui-validatebox" type="text" name="dir.mingcheng" data-options="required:true" /></td>
						</tr>
						<tr>
							<th>项目代码:<span class="warn">*</span>：</th>
							<td><input class="easyui-validatebox" type="text" name="dir.daima" data-options="required:true" /></td>
						</tr>
						<tr>
							<th>项目序号:</th>
							<td><input class="easyui-validatebox" type="text" name="dir.xuhao"  data-options="required:true"/></td>
						</tr>
						<tr>
							<th>所属父级：</th>
							<td>
								<select class="easyui-combotree width180" name="dir.parentId" data-options="url:'<%=path%>/dirList!getTreeList.do',loadFilter:function(data,parent){
									return data.dirs;
								}"></select> 
							</td>
						</tr>
					</table>
				</form>
            </div>
            <div data-options="region:'south',border:false" class="align-right">  
                <a id="btn_addDir_submit" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)">提交</a>  
                <a id="btn_addDir_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">取消</a>  
            </div>
        </div>  
   
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript全局变量声明*/
		
		/**JavaScript函数声明*/
		
		/**页面所需资源初始化*/
		$().ready(function(){
			
		})
		
		/**页面元素事件注册*/
		$().ready(function(){
			/*************************************************************************************************************************/
			//添加机构窗口提交按钮点击
			$("#btn_addDir_submit").click(function(){
				$("#frm_addDir").form("submit",{  
				    url:"<%=path%>/dir!add.do",  
				    onSubmit: function(param){
				    	return $(this).form("validate");
				    },
				    success:function(data){
				    	$("#win_addDir").window("close");	//关闭窗口
				    	$("#treGrd_dirs").treegrid("reload");	//刷新Grid
				    }
				});
				return false;
			});
			
			//添加机构窗口取消按钮点击
			$("#btn_addDir_cancel").click(function(){
				$("#win_addDir").window("close");	//关闭窗口
			});
		})
		
	</script>