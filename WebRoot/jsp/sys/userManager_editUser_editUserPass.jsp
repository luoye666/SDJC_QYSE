<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
  <link rel="stylesheet" href="<%=path %>/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=path %>/js/plugin/ztree/jquery.ztree.core-3.5.js"></script>
<style>
	.long98{
		width: 97%
	}
	th{
		text-align: right;
		width: 20%;
	}
	.ztree *{
		background-color: white;
	}
</style>
</head>
<body>
	<div class="wrapper">
            <div>
                <form class="frm_subBase" id="frm_editUser" method="post">
                	<!-- 表单隐藏域 -->
                	<div class="formHiddenRegion">
	                	<input type="hidden" name="user.id" value="${param.id}"/>
                	</div>
					<table class="long98">
                        <tr>
                            <th>原密码:</th>
                            <td><input class="ui-input long98" type="password" id="oldPassword" name="user.oldPassword" required />  </td>
                        </tr>
                        <tr>
                            <th>新密码:</th>
                            <td><input class="ui-input long98" type="password" id="regPassword" name="user.password" required onblur="isPassword()"/>  </td>
                        </tr>
                        <tr>
                            <th>确认密码:</th>
                            <td><input class="ui-input long98" type="password" required equalTo="#regPassword" name="user.confirmPassword" />  </td>
                        </tr>
					</table>
				</form>
            </div>
        </div>  
        <div>
           	<span style="color:red;font-size:16px;">&nbsp;&nbsp;&nbsp;&nbsp;1. 密码由字母+数字+特殊字符（!@#），8-30位组成！");
           	&nbsp;&nbsp;&nbsp;&nbsp;2. 请使用【谷歌浏览器】或【360浏览器的极速模式】访问本系统。</span>
        </div>
</body>
</html>
	<script type="text/javascript">
	
var api = frameElement.api, W = api.opener;

api.button(
	{
	    id:'valueCx',
		name:'保存',
		callback:save
	},{
	    id:'valueQx',
		name:'关闭'
	}
);
		/**页面元素事件注册*/
		$().ready(function(){
			
		});
		
	function save(){

	        var $password = $('input[name="user.password"]').val();
            var $oldPassword = $('input[name="user.oldPassword"]').val();
            var $confirmPassword = $('input[name="user.confirmPassword"]').val();

            if ($password === $oldPassword) {
                $.dialog.tips('<font color="blue">新密码不能与原密码一致!</font>',3,'error.gif');
                return false;
            }
            if ($password !== $confirmPassword) {
                $.dialog.tips('<font color="blue">新密码与确认密码不一致!</font>',3,'error.gif');
                return false;
            }
            if (!isPassword()) {
                return false;
            }

			var options = {
				url:"<%=path%>/user!editPassword.do",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_editUser").validate().form()){
				    	W.self.parent.parent.showMask("正在保存......");
				    	return true;
				    }
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
		            W.self.parent.parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
						api.config.close = () => { return true }
						setTimeout(function(){
							api.close();
						}, 1000 );
	            	}else{
						$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_editUser").ajaxSubmit(options);
	         return false;
	}
	

		
		//验证密码是否符合
		function isPassword(){
			//字母+数字，字母+特殊字符，数字+特殊字符
			var pass = $('#regPassword').val();
			if(pass.indexOf('%') >= 0 || pass.indexOf('*') >= 0 || pass.indexOf('^') >= 0){
				alert("密码由字母+数字+特殊字符 （!@#），8-30位组成！");
		        return false;
			}
			var reg = new RegExp('(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,30}');
		    var result=reg.test(pass);
		    if(result==false){
		        alert("密码由字母+数字+特殊字符 （!@#），8-30位组成！");
		         if(window.navigator.userAgent.indexOf('AppleWebKit')!=-1){ 
                }else{
                	$('#regPassword').focus();
                }
		        
		        return false;
		    }
		    return true;
		}
	</script>