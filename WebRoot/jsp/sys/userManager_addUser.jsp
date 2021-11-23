<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
  <link rel="stylesheet" href="../../css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="../../js/plugin/ztree/jquery.ztree.core-3.5.js"></script>
<style>
	.long98{
		width: 95%
	}
	th{
		text-align: right;
		width: 15%
	}
</style>
</head>
<body>
	<div class="wrapper">
            		<div>
	            		<form class="frm_subBase" id="frm_addUser" method="post">
	                		<input type="hidden" name="user.isAdmin" value="0"/>
							<table class="long98">
								<tr>
									<th>登录帐号:</th>
									<td><input class="ui-input long98" name="user.loginId" id="userLoginId" required/>  </td>
									<th>用户名称:</th>
									<td><input class="ui-input long98" name="user.name" required />  </td>
								</tr>
								<tr>
									<th>密码:</th>
									<td><input class="ui-input long98" type="password" id="regPassword" name="user.password" required/>  </td>
									<th>确认密码:</th>
									<td><input class="ui-input long98" type="password" required equalTo="#regPassword"/>  </td>
								</tr>
								<tr>
									<th>固定电话:</th>
									<td><input class="ui-input long98" type="text" name="user.tel" />  </td>
									<th>手机:</th>
									<td><input class="ui-input long98" type="text" name="user.mobile" />  </td>
								</tr>
								<tr>
									<th>电子邮箱:</th>
									<td>
										<input class="ui-input long98" type="text" name="user.email"/>  
									</td>
									<th>账户状态:</th>
									<td>
										<select name="user.state">
											<option value="1">正常</option>
											<option value="0">冻结</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>首页内容:</th>
									<td>
										<input name="user.indexHref" id="indexHref" type="hidden"/>
										<input id="shouye" onclick="showMenu()" readonly="true" required class="ui-input long98" name="null"/>
									</td>
									<th>所属机构:</th>
									<td>
										<input name="user.organId" id="organid" type="hidden"/>
										<input id="jigou" onclick="showOrgan()" readonly="true" required class="ui-input long98" name="null"/>
									</td>
								</tr>
								<tr>
									<th>设备检验信息:</th>
									<td>
										<input type="radio" name="user.sejyinfo" value="0" checked="checked" />可修改
										<input type="radio" name="user.sejyinfo" value="1" />不可修改
									</td>
									<th>所属使用单位:</th>
									<td>
										<input id="ssdw_id" class="ui-input long98" type="text" name="user.suoshudanwei" onclick="checkSydw()" readonly="true"/>  
									</td>
								</tr>
							</table>
						</form>
            		</div>
            	</div>
            	<div id="menuContent" class="menuContent" style="display:none; position: absolute;height: 50px;">
					<ul id="menuTree" class="ztree" style="margin-top:0; width:160px;height: 50px"></ul>
				</div>
            	<div id="organContent" class="menuContent" style="display:none; position: absolute;height: 50px;">
					<ul id="organTree" class="ztree" style="margin-top:0; width:160px;height: 50px"></ul>
				</div>
				
</body>
</html>    
	<!-- 脚本 -->
	<script type="text/javascript">
			var $$loginIdLastValue;
			var $$loginIdValidate;
		
		/**页面元素事件注册*/
		$().ready(function(){
			//验证登录ID是否重复
			$("#userLoginId").focusout(function(){
				var input = $(this);
				var inputVal = input.val();
				
				if($$loginIdLastValue == inputVal) return ;
				$$loginIdLastValue = inputVal;
				
				if(inputVal.length != 0){
					$.post("<%=path%>/user!validateLoginId.do",{loginId:inputVal},
				        	function (data, textStatus){
				    			if(data.validate==false){
									input.css("background","#FFA8A8");
									$.dialog.alert("错误:["+inputVal+"]账户已存在!");
									$$loginIdValidate = false;
									input.focus();
								}else{
									input.css("background","#FFF");
									$$loginIdValidate = true;
								}
				     },"json");
				}
			});
			
		});
		
	function save(){
			var options = {
				url:"<%=path%>/user!add.do",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_addUser").validate().form() && $$loginIdValidate){
				    	W.self.parent.parent.showMask("正在保存......");
				    	return true;
				    }
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
		            W.self.parent.parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
						W.reloadGrid();
						setTimeout(function(){
							api.close();
						}, 1000 );
	            	}else{
						$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_addUser").ajaxSubmit(options);
	         return false;
	}
	
	</script>