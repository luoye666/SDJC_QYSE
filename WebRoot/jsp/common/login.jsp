<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/c.tld"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%   
String name="";   
String passward=""; 
Cookie[] cookies = request.getCookies();
if(cookies!=null){   
	for(int i=0;i<cookies.length;i++){   
		if("user".equals(cookies[i].getName())){
			name = cookies[i].getValue().split("-")[0];
		    passward=cookies[i].getValue().split("-")[1];
			
			request.setAttribute("name",name);   
			request.setAttribute("pass",passward);
			request.setAttribute("checked","checked");
		}
		  
	}  
}  


%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>
    <title>企业设备管理系统-登录</title>
	<script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery.cookie.js"></script>
	<script src="<%=path %>/js/plugin/lhgdialog.js?self=true&skin=blue"></script>
	<link href="<%=path %>/css/login.css" rel="stylesheet" type="text/css" />
	<script nonce="2726c7f26c" type="text/javascript" src="<%=path%>/js/crypto/crypto/crypto-js.js"></script>
	
	<style>
		input, select, label {
			vertical-align: middle;
		}
		#learn{
		  cursor:pointer;
		  float: right;
		  margin-right: 3%;
		}
		
	</style>
  </head>
  <div style="text-align: center;font-size: 16px;background-color: #FFFFB9;padding: 0px 0 0px 0;">
			<span style="color:red;">请使用【谷歌浏览器】或【360浏览器的极速模式】访问本系统</span><span id="help3" style="color:red;float:right;margin-right:10px;">帮助</span><br/><br/>
			<span style="color:red;">(使用单位企业端)</span>
	</div>
<body class="login" style="background:url('<%=path %>/images/bg.jpg;margin:0px;')">
	<div class="body">
		<div class="loginBox">
			<div class="boxMiddle">
				<form id="loginForm" class="form" action="<%=path%>/account!login.do" method="post">
					<input type="hidden" name="key" id="key"/>
					<div style="color:red;font-weight:bold;position: absolute;left: 25%">
						<s:actionerror/>
					</div>
		            <table class="loginTable">
		            	<tr>
		                    <th>
		                    	登录账号:
		                    </th>
							<td>
		                    	<div class="formText">
		                    		<input type="text" id="username" name="user.loginId" value="${name}" required /> 
		                    	</div>
		                    	<span id="help" style="color:white;float:right;font-size:16px;">操作手册</span>
		                    </td>
		                </tr>
		                <tr>
							<th>
								密&nbsp;&nbsp;&nbsp;码:
							</th>
		                    <td>
		                    	<div class="formText">
		                    		<input type="password" id="password" name="user.password" value="${pass}" required autocomplete="off"/>  
		                    	</div>
		                    </td>
		                </tr>
		                <tr>
		                	<th>
		                		验证码:
		                	</th>
		                    <td>
	       						<div >
		                    		<input class="easyui-validatebox" id="yanzhengma" name="yzm" maxlength="4" required style="width:60px;height:20px;vertical-align:middle;" autocomplete="off"/>
									<img id="chkNumber" src="<%=path %>/registerChkNumber!getChkNumber.do" alt="点我换一张" title="点我换一张" style="width:90px;height:25px;vertical-align:middle;"/>
		                    	</div>
		                    </td>
		                </tr>
		                <tr>
		                	<th>
		                		&nbsp;
		                	</th>
		                    <td>
		                        <input type="button" class="homeButton ignoreForm" value="" onclick="window.open('<%=path %>/')" hidefocus="true" />
		                        <input type="button" class="submitButton ignoreForm" value="登录" id="btn_login" hidefocus="true" />
		                        <input type="button" class="helpButton ignoreForm" value="注册" id="btn_reg" hidefocus="true" />
		                    </td>
		                </tr>
		            </table>
		        </form>
			</div>
			<div class="boxBottom"></div>
		</div>
		<div class="blank" style="height: 80px;"></div>
		<div class="footer">
			技术支持：山东明安信息技术有限公司&nbsp;客户服务电话：0531-67881719    手机：18615601819   QQ：3561207735
		</div>
	</div>
</body>
  
</html>
<script type="text/javascript">
    //弹出新窗口
	function openwin(owurl){
		var tmp=window.open("about:blank","","height=600,width=550,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no")
		tmp.moveTo(0,0)
		//tmp.resizeTo(screen.width+20,screen.height)
		tmp.focus()
		tmp.location=owurl
	}
    //检测浏览器版本
    function navigatorversion(){
    	$.browser.mozilla = /firefox/.test(navigator.userAgent.toLowerCase());
		$.browser.webkit = /webkit/.test(navigator.userAgent.toLowerCase());
		$.browser.opera = /opera/.test(navigator.userAgent.toLowerCase());
		$.browser.msie = /msie/.test(navigator.userAgent.toLowerCase());
		if($.browser.msie){
		    	var browserTip = " 版本号是：" + $.browser.version; //获取版本号
		    	var iversion=$.browser.version;
		    	if(iversion<7 || iversion>9){
		    		//alert("此浏览器的版本号为:IE"+$.browser.version+"\n"+"建议使用浏览器版本为：IE8.0、IE9.0");
		    		//return false;
		    	}
		 }
    }
	$().ready(function(){
		//获取key
		$.post("<%=path%>/user!getKey.do",
    			function (data, textStatus){
				key = data.key;
				$("#key").val(key);
    	    },"JSON");
		
		$("#username").focus();
		
		/**
			登录回车事件
		*/
		$('#loginForm').keydown(function(){
			if(event.keyCode == 13){
				navigatorversion();
				validataForm();
				if($("#loginForm").form("validate")){
					
					 var $key = $("#key").val();
			         var $password = $('input[name="user.password"]').val();
					 var key = CryptoJS.enc.Utf8.parse($key);
			         var password = CryptoJS.enc.Utf8.parse($password);
			         var encrypted = CryptoJS.AES.encrypt(password, key, {mode: CryptoJS.mode.ECB, padding: CryptoJS.pad.Pkcs7});
			         var encryptedPwd = encrypted.toString();

			         var decrypt = CryptoJS.AES.decrypt(encryptedPwd, key, {
			            mode: CryptoJS.mode.ECB,
			            padding: CryptoJS.pad.Pkcs7
			         });
			        var testDecryptStr = CryptoJS.enc.Utf8.stringify(decrypt).toString();
					
			        $('input[name="user.password"]').val(encryptedPwd);
					 
			        $("#loginForm").submit();
				}
			}
		});
		
		/**
			登录按钮事件
		*/
		$("#btn_login").click(function(){
			navigatorversion();
			validataForm();
			if($("#loginForm").form("validate")){
				 var $key = $("#key").val();
		         var $password = $('input[name="user.password"]').val();
				 var key = CryptoJS.enc.Utf8.parse($key);
		         var password = CryptoJS.enc.Utf8.parse($password);
		         var encrypted = CryptoJS.AES.encrypt(password, key, {mode: CryptoJS.mode.ECB, padding: CryptoJS.pad.Pkcs7});
		         var encryptedPwd = encrypted.toString();

		         var decrypt = CryptoJS.AES.decrypt(encryptedPwd, key, {
		            mode: CryptoJS.mode.ECB,
		            padding: CryptoJS.pad.Pkcs7
		         });
		        var testDecryptStr = CryptoJS.enc.Utf8.stringify(decrypt).toString();
				
		        $('input[name="user.password"]').val(encryptedPwd);
				 
				$("#loginForm").submit();
			}
		});
		/**
		      重置按钮事件
	   */
	   $("#btn_clear").click(function(){
		   $(':input','#baseForm').not(':button, :submit, :reset, :hidden') .val('') .removeAttr('checked')   .removeAttr('selected');  
	   });
		/**
		      重置按钮事件
	   */
	   $("#btn_reg").click(function(){
		   window.location = "<%=path%>/jsp/common/register.jsp";
	   });
		
		
		$("#help").click(function(){
			var uri = "<%=basePath%>";
			uri = uri.replace("/QYSE","");
			window.open(uri+"ziliao/省局使用单位-360浏览器极速模式设置.pdf","帮助文档",null);
	   });
		$("#help3").click(function(){
			var uri = "<%=basePath%>";
			uri = uri.replace("/QYSE","");
			window.open(uri+"ziliao/省局使用单位-360浏览器极速模式设置.pdf","帮助文档",null);
	   });
		
		 //验证码  
		 $("#chkNumber").click(function(){
		     var timenow = new Date().getTime();    
		     $(this).attr("src", "<%=path %>/registerChkNumber!getChkNumber.do?d="+timenow);  
		 });  
	});  // end
	function validataForm(){
		if ($("#username").val() == "") {
			$.dialog.alert("请输入您的用户名!");
			$("#username").focus();
			return false;
		}
		if ($("#password").val() == "") {
			$.dialog.alert("请输入您的密码!");
			$("#password").focus();
			return false;
		}
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
	
	
</script>
