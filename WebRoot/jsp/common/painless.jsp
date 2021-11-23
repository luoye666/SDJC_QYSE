<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/c.tld"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%   



%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>
    <title>企业设备管理系统-单点登陆</title>
	<script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery.cookie.js"></script>
	<script src="<%=path %>/js/plugin/lhgdialog.js?self=true&skin=blue"></script>
	<link href="<%=path %>/css/login.css" rel="stylesheet" type="text/css" />
	
	<style>
		input, select, label {
			vertical-align: middle;
		}
		.login div.formText input:focus {
			background-color: #f3f6f8;
		}
	</style>
  </head>
  <div style="text-align: center;font-size: 16px;background-color: #FFFFB9;padding: 5px 0 5px 0;">
			<span style="color:red;">请使用IE8+浏览器的非兼容性视图或非IE浏览器的极速模式访问本系统</span><br/><br/>
			<span style="color:red;">(使用单位企业端)</span>
	</div>
<body class="login" style="background:url('<%=path %>/images/bg.jpg;margin:0px;')">
	<div class="body">
		<div class="loginBox">
			<div class="boxTop"></div>
			<div class="boxMiddle">
				<form id="loginForm" class="form" action="<%=path%>/account!login.do" method="post">
					<div style="color:red;font-weight:bold;position: absolute;left: 25%">
						<s:actionerror/>
					</div>
					<div class="formHiddenRegion">
						<input type="hidden" name="user.token" value="${param.token}" />
                	</div>
		            <table class="loginTable">
		            	<tr>
		                    <th>
		                    	登录账号:
		                    </th>
							<td>
		                    	<div class="formText">
		                    		<input type="text" id="username" name="user.loginId"  />
		                    	</div>
		                    </td>
		                </tr>
		                <tr>
							<th>
								密&nbsp;&nbsp;&nbsp;码:
							</th>
		                    <td>
		                    	<div class="formText">
		                    		<input type="password" id="password" name="user.password"  />
		                    	</div>
		                    </td>
		                </tr>
		                <tr>
		                	<th>
		                		&nbsp;
		                	</th>
		                    <td>
		                    </td>
		                </tr>
		                <tr>
		                	<th>
		                		&nbsp;
		                	</th>
		                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        <input type="button" style="width: 130px;text-align: center;height:30px;background-color: white;"  value="绑定" id="btn_login" hidefocus="true" />
		                    </td>
		                </tr>
		            </table>
		        </form>
			</div>
			<div class="boxBottom"></div>
		</div>
		<div class="blank" style="height: 90px;"></div>
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
		$("#username").focus();
		
		alert('${param.token}');
		
		/**
			登录回车事件
		*/
		$('#loginForm').keydown(function(){
			if(event.keyCode == 13){
				navigatorversion();
				validataForm();
			}
		});
		
		/**
			登录按钮事件
		*/
		$("#btn_login").click(function(){
			navigatorversion();
			validataForm();
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
		
	});
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
		$("#loginForm").submit();
	}
</script>
