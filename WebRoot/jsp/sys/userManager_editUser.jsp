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
<style>
	.long98{
		width: 98%
	}
	th{
		text-align: right;
		width: 13%;
	}
</style>
</head>
<body>
	<div class="wrapper">
            <div>
                <form class="frm_subBase" id="frm_editUser" method="post">
                	<!-- 表单隐藏域 -->
                	<div class="formHiddenRegion">
	                	<input type="hidden" name="user.id" value="${user.id}"/>
	                	<input type="hidden" name="user.loginId" value="${user.loginId}"/>
	                	<input type="hidden" name="user.type" value="sydw"/>
                	</div>
					<table id="first" class="long98">
						<tr>
							<th>登录帐号:</th>
							<td><input class="ui-input long98" type="text" disabled="disabled"  name="user.loginId" required value="${user.loginId}"/>  </td>
							<th>用户名称:</th>
							<td><input class="ui-input long98" readonly="true" type="text" id="mingcheng" name="user.name" required value="${user.name}"/>  </td>
						</tr>
						<tr>
							<th>单位名称:</th>
							<td><input class="ui-input long98" readonly="true" type="text" name="user.danweimingcheng" value="${user.danweimingcheng}"/></td>
							<th>单位地址:</th>
							<td><input class="ui-input long98" type="text" name="user.danweidizhi" value="${user.danweidizhi}"/>  </td>
						</tr>
						<tr>
							<th>联系人:</th>
							<td><input class="ui-input long98" type="text" name="user.lianxiren" value="${user.lianxiren}"/>  </td>
							<th>联系电话:</th>
							<td><input class="ui-input long98" type="text" name="user.lianxidianhua" value="${user.lianxidianhua}"/>  </td>
						</tr>
						
						<tr>
							<th>附件:</th>
							<td><input type="file" name="file" id="file"/></td>
							<td colspan="2">
								若上传附件，会把当初注册时提交的附件覆盖！
							</td>
						</tr>
						
					</table>
                    <table id="second" class="long98" style="display: none">
                        <tr>
                            <th>原密码:</th>
                            <td><input class="ui-input long98" type="password" id="oldPassword" name="user.oldPassword" autocomplete="off" required />  </td>
                        </tr>
                        <tr>
                            <th>新密码:</th>
                            <td><input class="ui-input long98" type="password" id="regPassword" name="user.password" autocomplete="off" required onblur="isPassword()"/>  </td>
                        </tr>
                        <tr>
                            <th>确认密码:</th>
                            <td><input class="ui-input long98" type="password" required equalTo="#regPassword" name="user.confirmPassword" />  </td>
                        </tr>
                    </table>
				</form>
            </div>
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
	    id:'valueMx',
		name:'修改密码',
		callback:showPwd
	},{
	    id:'valueQx',
		name:'关闭'
	}
);

        var updatePassword = false

		/**页面元素事件注册*/
		$().ready(function(){
		});
		
	function save(){

        console.log('updatePassword', updatePassword)

		if (updatePassword) {
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
		}

			var options = {
				url:"<%=path%>/user!edit.do",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					var fname = $("#file").val();
					if(fname != ""){
						var ftype = fname.substring(fname.lastIndexOf("."));
						if(ftype != ".rar" && ftype != ".zip"){
							$.dialog.alert('附件类型只支持.rar或.zip的压缩文件!');
							return false;
						}
					}
				    if($("#frm_editUser").validate().form()){
				    	W.showMask("正在保存......");
				    	return true;
				    }
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
		            W.hideMask();
		            if(rsp.msg == "SUCCESS"){
						$.dialog.tips('<font color="blue">修改成功!</font>',3,'success.gif');
						setTimeout(function(){
							api.close();
						}, 2000 );
		            }else if(rsp.msg == "OUTSIZE"){
						$.dialog.tips('<font color="blue">上传附件过大，最大为5M!</font>',3,'error.gif');
		            }else{
						$.dialog.tips('<font color="blue">修改失败!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_editUser").ajaxSubmit(options);
	         return false;
	}

	function showPwd() {
	    updatePassword = true;
	    $('#first').hide();
	    $('#second').show();
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
	        alert("密码由字母+数字+特殊字符（!@#），8-30位组成！");
	        return false;
	    }
	    return true;
	}
	</script>