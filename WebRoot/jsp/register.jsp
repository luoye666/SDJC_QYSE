<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<title>企业设备管理系统-注册</title>
<meta name="author" content="wang" />
<meta name="copyright" content="mingAn" />
<link href="<%=path %>/css/register/register.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/register/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path %>/js/register/jquery.jqDnR.js"></script>
<script type="text/javascript" src="<%=path %>/js/register/jquery.jqModal.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $registerForm = $("#registerForm");
	var $name = $("#name");
	var $login_id = $("#login_id");
	var $password = $("#password");
	var $areaId = $("#areaId");
	var $captcha = $("#captcha");
	var $captchaImage = $("#captchaImage");
	var $submit = $(":submit");
	var $agreement = $("#agreement");

	// 刷新验证码
	$captchaImage.click( function() {
		var timestamp = (new Date()).valueOf();
		var imageSrc = $captchaImage.attr("src");
		if(imageSrc.indexOf("?") >= 0) {
			imageSrc = imageSrc.substring(0, imageSrc.indexOf("?"));
		}
		imageSrc = imageSrc + "?timestamp=" + timestamp;
		$captchaImage.attr("src", imageSrc);
	});


/**	if(actionErrors.length>0){
		$.message("error", ${list});
	}
**/
});
</script>
</head>
<body>
	<div class="container register">
		<div class="span24">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong>用户注册</strong>USER REGISTER
					</div>
					<form id="registerForm" enctype="multipart/form-data">
						<table>
							<tr>
								<th>
									<span class="requiredField">*</span>登录账号:
								</th>
								<td>
									<input type="text" id="login_id" name="login_id" required class="text" maxlength="12" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>用户名:
								</th>
								<td>
									<input type="text" id="name" name="name" class="text" maxlength="18"/>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>密码:
								</th>
								<td>
									<input type="password" id="password" name="password" class="text" maxlength="6" autocomplete="off" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>确认密码:
								</th>
								<td>
									<input type="password" name="rePassword" class="text" maxlength="6" autocomplete="off" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>单位名称:
								</th>
								<td>
									<input type="text" id="danweimingcheng" name="danweimingcheng" class="text" maxlength="100" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>联系人:
								</th>
								<td>
									<input type="text" id="lianxiren" name="lianxiren" class="text" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>联系电话:
								</th>
								<td>
									<input type="text" id="lianxidianhua" name="lianxidianhua" class="text" maxlength="11" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>单位地址:
								</th>
								<td>
									<input type="text" id="danweidizhi" name="danweidizhi" class="text" maxlength="100" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>附件(营业执照/身份证):
								</th>
								<td>
									<input type="file" id="filepath" name="updFile" class="text" maxlength="100" />
								</td>
							</tr>
							<tr>
								<th>
									备注:
								</th>
								<td>
									<input type="text" id="beizhu" name="beizhu" class="text" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>验证码:
								</th>
								<td>
									<span class="fieldSet">
										<input type="text" id="captcha" name="j_captcha" class="text captcha" maxlength="4" autocomplete="off" />
										<img id="captchaImage" class="captchaImage" src="<%=path %>/captcha.jpg" alt="点我换一张" title="点我换一张"/>
									</span>
									
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="submit" class="submit" value="注册" />
									<button type="button"  id="login" onclick="window.location='<%=path %>/user/login'">已有账号登录</button>
								</td>
							</tr>
						</table>
						
						<div class="login">
							<dl>
								<dt>注意事项！</dt>
								<dd>
									1.新注册的用户会在7*24小时内审核通过，审核通过后可以正常报检办理业务！<br>
									2.请按照要求上传营业执照副本照片（单位）或身份证复印件照片（个人）附件格式暂时限制为JPG/PNG/BMP。<a href=""></a><br>
									3.如使用当中遇到问题请联系客服，客户服务电话：0531-67881719 手机：18615601819
								</dd>
							</dl>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
