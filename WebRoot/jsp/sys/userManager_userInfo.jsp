<%-- 用户管理模块,修改用户信息弹出窗口 --%>
<%@page import="com.stone.para.IConstant"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
    <!-- 编辑人员弹出窗口 -->
        <div class="easyui-layout unit_layout" data-options="fit:true"> 
        	<div data-options="region:'north'" style="height:28px">
        	 	<a href="javascript:void(0)" id="btn_userInfoPass" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-lock-edit'">修改密码</a>
        	</div> 
            <div data-options="region:'center'">
                <form class="frm_subBase" id="frm_userInfo" method="post">
                	<!-- 表单隐藏域 -->
                	<div class="formHiddenRegion">
	                	<input type="hidden" name="user.id" />
	                	<input type="hidden" name="user.password" />
	                	<input type="hidden" name="user.loginId" />
	                	<input type="hidden" name="user.name" />
                	</div>
					<table>
						<tr>
							<th>登录帐号:</th>
							<td><input class="easyui-validatebox" type="text" disabled="disabled"  name="user.loginId" data-options="required:true,validType:'length[5,12]'" />  </td>
							<th>用户名称:</th>
							<td><input class="easyui-validatebox" type="text" disabled="disabled" name="user.name" data-options="required:true" />  </td>
						</tr>
						<tr>
							<th>固定电话:</th>
							<td><input class="easyui-validatebox" type="text" name="user.tel" data-options="validType:'phone'" />  </td>
							<th>手机:</th>
							<td><input class="easyui-validatebox" type="text" name="user.mobile" data-options="validType:'mobile'" />  </td>
						</tr>
						<tr>
							<th>电子邮箱:</th>
							<td><input class="easyui-validatebox" type="text" name="user.email" data-options="validType:'email'" />  </td>
							<th>账户状态:</th>
							<td>
								<select class="easyui-combobox width120" disabled="disabled" name="user.state">
									<option value="1">正常</option>
									<option value="0">冻结</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>所属机构:</th>
							<td colspan="3">
								<input name="user.organId" class="easyui-combotree width260" disabled="disabled" data-options="url:'<%=path%>/organList!getTreeList.do',loadFilter:function(data,parent){
								return data.organs;
							}" />
							</td>
						</tr>
					</table>
				</form>
            </div>
            <div data-options="region:'south',border:false" class="align-right">  
                <a id="btn_userInfo_submit" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)">提交</a>  
                <a id="btn_userInfo_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">取消</a>  
            </div>
        </div>  

    <!-- 修改密码弹出窗口 -->
	<div id="win_userInfoPass" class="easyui-window unit_window" title="修改密码" style="width:360px;height:190px;" data-options="modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>  

	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript函数声明*/
		//使用AJAX异步获得业务类型
        function loadZmsz(){
    	  $.ajax({
    		url: "<%=path%>/user!loadZmsz.do",
    		success: function(data, textStatus){
    			$("#myselfDesk").html(data);
    			var inputs = $("#myselfDesk input");
    			var code = "<s:property value="user.myselfDesk" />";
    			var codes = code.split(",");
    			for(var i = 0;i<codes.length;i++){
    				codes[i]=$.trim(codes[i]);
    			}
    			for(var i = 0;i<inputs.length;i++){
    				  for(var j = 0;j<codes.length;j++){
    					if(inputs[i].value==codes[j]){
    						inputs[i].checked = true;
    						break;
    					}
    				} 
    			}
    		}
        });
        };
	   
		/**页面所需资源初始化***************************************************************************************/
		$().ready(function(){
			//根据传入的ID加载需要编辑的用户信息
			$.post("<%=path%>/user!getById.do",{id:"${param.id}"},
		        	function (data, textStatus){
						data = data.user;
						$("#frm_userInfo").form("load",{
							"user.id":data.id,
							"user.name":data.name,
							"user.loginId":data.loginId,
							"user.mobile":data.mobile,
							"user.tel":data.tel,
							"user.email":data.email,
							"user.state":data.state,
							"user.isAdmin":data.isAdmin,
							"user.password":data.password,
							"user.organId":data.organId == 0 ? "":data.organId,
							"user.myselfDesk":data.myselfDesk	
						});
		     },"json");
		});
		
		/**页面元素事件注册*/
	    $().ready(function(){
	    	loadZmsz();
	    });
		
		/**页面元素事件注册***************************************************************************************/
		$().ready(function(){
			//编辑人员窗口提交按钮
			$("#btn_userInfo_submit").click(function(){
				$("#frm_userInfo").form("submit",{  
				    url:"<%=path%>/user!edit.do",
				    onSubmit: function(param){
				    	return $(this).form("validate");
				    },
				    success:function(data){
				    	$("#win_sys_logout_userInfo").window("close");	//关闭窗口
				    }
				});
				return false;
			});
			
			//编辑人员窗口取消按钮
			$("#btn_userInfo_cancel").click(function(){
				$("#win_sys_logout_userInfo").window("close");	//关闭窗口
			});
			
			
			//编辑人员窗口修改密码按钮
			$("#btn_userInfoPass").click(function(){
				$("#win_userInfoPass").window({
					cache:false,
					href:"<%=path%>/jsp/sys/userManager_editUser_editUserPass.jsp?id=${param.id}"
				}).window("open");
			});
			
		})
		
	</script>