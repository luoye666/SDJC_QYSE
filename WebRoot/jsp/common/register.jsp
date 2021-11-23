<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>企业设备管理系统-用户注册</title>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<script type="text/javascript" src="<%=path%>/js/crypto/crypto/crypto-js.js"></script>
<style>
	.long98{
		width: 56%
	}
	th{
		text-align: right;
		width: 20%
	}

 .mask {       
      position: absolute; 
      filter: alpha(opacity=60);
      background-color: blue;     
      z-index: 1;
      opacity:0.2;
      -moz-opacity:0.5;    
}
.black_overlay{
    display: none;
    position: absolute;
    background-color: #222;
    z-index:1;
    -moz-opacity: 0.5;
    opacity:0.2;
    filter: alpha(opacity=60);
}
.white_content {
    display: none;
    position: absolute;
    border: 4px solid yellow;
    background-color: white;
    z-index:2;
   	font-size: 14px;
    padding: 5 5 5 5px;
}
b{
	color:red;
	display: none;
}
.submit {
	width: 142px;
	height: 37px;
	line-height: 37px;
	margin-top: 10px;
	color: #ffffff;
	cursor: pointer;
	outline: none;
	blr: expression(this.hideFocus = true);
	border: none;
	background: url(../../images/register.gif) 0px 0px no-repeat;
}
</style>
</head>
<body>
	<div class="wrapper">
					<div class="title">
						<strong>用户注册</strong>USER REGISTER
					</div>
            		<div>
	            		<form class="frm_subBase" id="frm_addUser" method="post">
	            			<input type="hidden" name="user.type" value="sydw" />
	            			<input type="hidden" name="key" id="key"/>
							<table class="long98">
								<tr>
									<th>登录帐号:</th>
									<td><input class="ui-input long98" name="user.loginId" id="userLoginId" required /> <span id="checklogin" style="color:red;display:none;">（可以使用）</span></td>
								</tr>
								<tr>
									<th>用户名称:</th>
									<td><input class="ui-input long98" name="user.name" required />  </td>
								</tr>
								<tr>
									<th>密码:</th>
									<td><input class="ui-input long98" type="password" id="regPassword" name="user.password" required autocomplete="off" onblur="isPassword()"/>  </td>
								</tr>
								<tr>
									<th>确认密码:</th>
									<td><input class="ui-input long98" type="password" required name="user.confirmPassword"/>  </td>
								</tr>
								<tr>
									<th>单位名称:</th>
									<td><input class="ui-input long98" name="user.danweimingcheng" required/>  </td>
								</tr>
								<tr>
									<th>联系人:</th>
									<td><input class="ui-input long98" name="user.lianxiren" required />  </td>
								</tr>
								<tr>
									<th>联系电话:</th>
									<td><input class="ui-input long98" name="user.lianxidianhua" required/>  </td>
								</tr>
								<tr>
									<th>单位地址:</th>
									<td><input class="ui-input long98" name="user.danweidizhi" required />  </td>
								</tr>
								<tr>
									<th>附件(营业执照/身份证):</th>
									<td><input type="file" name="file" id="file" style="width: 36%;" required onchange="fileSize();"/>&nbsp;&nbsp;<font color="red">(不能超过5M，如果图片太大，建议使用截图工具处理之后再上传。)</font></td>
								</tr>
								<tr>
						  			<th>所在市</th>
						  			<td>
						  				<div id="shidaima_div" onclick="delay()">
						       				<select name="user.shidaima" class="long98" id="shidaima" required></select>
						       				<b>不能为空</b>
						  				</div>
						  			</td>
								</tr>
								<tr>
						  			<th>所在县</th>
						  			<td>
						  				<div id="xiandaima_div" onclick="delay()">
						       				<select name="user.xiandaima" class="long98" id="xiandaima" required></select>
						       				<b>不能为空</b>
						  				</div>
						  			</td>
								</tr>
								<tr>
									<th>备注:</th>
									<td><input class="ui-input long98" name="user.beizhu" />  </td>
								</tr>
								<tr>
									<th>验证码:</th>
									<td>
										<input class="ui-input" id="yanzhengma" maxlength="4" required/>
										<img id="chkNumber" src="<%=path %>/registerChkNumber!getChkNumber.do" alt="点我换一张" title="点我换一张"/>  
									</td>
								</tr>
								<tr>
									<th>
										&nbsp;
									</th>
									<td >
										<div id="tb"> <input type="button" class="submit" onclick="save()" value="注册" id="dd"/> </div>
									</td>
								</tr>
							</table>
						</form>
            		</div>
            	</div>
				
		    <div id="main-bd">
		   	 
			<div id="mask" class="black_overlay">
		    </div>
		    <div id="mask_msg" class="white_content">
		    </div>
		    </div>
</body>
</html>    
	<!-- 脚本 -->
	<script type="text/javascript">
			var $$loginIdLastValue;
			var $$loginIdValidate = false;
		/**页面元素事件注册*/
		$().ready(function(){
			//获取key
			$.post("<%=path%>/user!getKey.do",
	    			function (data, textStatus){
					key = data.key;
					$("#key").val(key);
	    	    },"JSON");
			   $("#mask").css("height",$(document).height());     
			   $("#mask").css("width",$(document).width());    
			   $("#mask").css("top",0);
			   $("#mask_msg").css("left",$(document).width()/2-100); 
			   $("#mask_msg").css("top",$(document).height()/2-53);
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shidaima,xiandaima",data.dicDatas,"200px",true,"<%=path%>");
					
			},"JSON");
			var td_sb=$("#dd"); 
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
									$.dialog.alert("提示:["+inputVal+"]账户已存在!");
									$("#checklogin").html("账号已存在").show();
									$$loginIdValidate = false;
									input.focus();
									$(".submit").remove();
								}else{
									$("#tb").append(td_sb);
									$("#checklogin").html("账号可以使用").show();
									input.css("background","#FFF");
									$$loginIdValidate = true;
									
								}
				     },"json");
				}
			});
			//验证码  
			 $("#chkNumber").click(function(){
			     var timenow = new Date().getTime();    
			     $(this).attr("src", "<%=path %>/registerChkNumber!getChkNumber.do?d="+timenow);  
			 });
			
		});
		
	function save(){
			
			
			if($('#shidaima').val() == '3702'){
				$.dialog.alert('青岛使用单位网上登记新地址:  <a style="color:red;text-decoration:none;" href="http://101.132.35.166:9070/QYSE/" target="view_window">http://101.132.35.166:9070/QYSE/</a>');
				return false;
			}
			var $password = $('input[name="user.password"]').val();  
			var $confirmPassword = $('input[name="user.confirmPassword"]').val();

            if ($password != $confirmPassword) {
                $.dialog.tips('<font color="blue">新密码与确认密码不一致!</font>',3,'error.gif');
                return false;
            }
            if (!isPassword()) {
                return false;
            }
            
            var fname = $("#file").val();
			var ftype = fname.substring(fname.lastIndexOf("."));
			if(fname == ""){
				$.dialog.alert('请上传附件，只支持.rar或.zip的压缩文件!');
				return false;
			}else{
				if(ftype != ".rar" && ftype != ".zip"){
					$.dialog.alert('上传文件类型只支持.rar或.zip的压缩文件!');
					return false;
				}
			}
			if(!vaiYzm()){
				return false;
			}
			
			var $key = $("#key").val();
            var key = CryptoJS.enc.Utf8.parse($key);
            var password = CryptoJS.enc.Utf8.parse($password);
            var encrypted = CryptoJS.AES.encrypt(password, key, {mode: CryptoJS.mode.ECB, padding: CryptoJS.pad.Pkcs7});
            var encryptedPwd = encrypted.toString();
            $('input[name="user.password"]').val(encryptedPwd);
            
            var passwordc = CryptoJS.enc.Utf8.parse($password);
            var encryptedc = CryptoJS.AES.encrypt(passwordc, key, {mode: CryptoJS.mode.ECB, padding: CryptoJS.pad.Pkcs7});
            var encryptedPwdc = encryptedc.toString();
            $('input[name="user.confirmPassword"]').val(encryptedPwdc);
			showMask("正在提交注册信息......");
			var options = {
				url:"<%=path%>/user!register.do",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					
				    if($("#frm_addUser").validate().form() && verifySelect() && $$loginIdValidate ){
				    
				    	return true;
				    }
				    hideMask();
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
		            hideMask();
		            if(rsp.msg == "SUCCESS"){
		            	$('.submit').attr("disabled",true); 
						$.dialog.tips('<font color="blue">提交成功!</font>',3,'success.gif');
						setTimeout(function(){
							window.location = "<%=path%>/jsp/common/login.jsp";
						}, 3000 );
		            }else if(rsp.msg == "OUTSIZE"){
						$.dialog.tips('<font color="blue">上传附件过大，最大为5M!</font>',3,'error.gif');
		            }else if(rsp.msg == "CHONGFU"){
						$.dialog.tips('<font color="blue">登陆账号重复!</font>',3,'error.gif');
		            }else{
						$.dialog.tips('<font color="blue">提交失败!'+rsp.msg+'</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_addUser").ajaxSubmit(options);
	         return false;
	}
	function vaiYzm(){
		var result = false;
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/user!verifyYzm.do",
		   data:'yzm='+$("#yanzhengma").val(),
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result == "0"){
					$.dialog.alert('验证码错误!');
		   		}else{
		   			result = true;
		   		}
		   }
		});
		return result;
	}
	 
    //显示遮罩层    
    function showMask(text){ 
	   document.getElementById("mask_msg").style.display='block';
	   document.getElementById("mask").style.display='block' ;
	   text = text == undefined ? '正在处理......' : text;
	   $("#mask_msg").html('<img src="<%=path %>/js/plugin/skins/icons/loading.gif">'+text);
    }  
    //隐藏遮罩层  
    function hideMask(){     
        $("#mask").hide();  
        $("#mask_msg").hide(); 
    } 
	//对select 选中数据后延迟执行方法
	function delay(){
		setTimeout(function(){verifySelect()},3000);
	}
		//验证select 是否有值
	function verifySelect(){
		var s = $('#shidaima').val();
		var q = $('#xiandaima').val();
		var flag = false;
		if(s == ""){
			$("#shidaima_div  b").show();
			flag = false;
		}else{
			$("#shidaima_div  b").hide();
			flag = true;
		}
		if(q == "" || q == null){
			$("#xiandaima_div  b").show();
			flag = false;
		}else{
			$("#xiandaima_div  b").hide();
			flag = true;
		}
		return flag;
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
		        return false;
		    }
		    return true;
		}
	
	function fileSize(){
		 //获取文件大小
        var filesize = $("#file")[0].files[0].size;
        //判断是否符合要求c
        if (filesize / (1024*1024) < 5) {
            flag = true;
        } else {
            alert("附件过大，建议不要超过5m！");
            $("#file").val('');
            flag = false;
        }
		return flag;
	}
	</script>