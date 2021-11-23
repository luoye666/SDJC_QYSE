<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/c.tld" %>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
		.long98{
		width: 55%
	}
	th{
		text-align: right;
		width: 25%
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
	background: url(<%=path%>/images/register.gif) 0px 0px no-repeat;
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
	                	<input type="hidden" name="user.shstate" value="${user.shstate}" id="shstate"/>
	                	<input type="hidden" name="user.state" value="${user.state}"/>
	                	<input type="hidden" name="user.filepath" value="${user.filepath}"/>
	                	<input type="hidden" name="user.jujueyuanyin" value="${user.jujueyuanyin}" id="jujueyuanyin"/>
	            		<input type="hidden" name="user.type" value="sydw" />
                	</div>
					<table class="long98">
						<tr>
							<th>
								审核状态：
							</th>
							<td>
								<c:if test="${user.shstate == '0'}">
									<font color="red">审核中(审核通过后才可进行业务办理)</font>
								</c:if>
								<c:if test="${user.shstate == '1'}">
									<font color="red">
									拒绝申请<br/>
									原因：${user.jujueyuanyin}
									</font>
								</c:if>
							</td>
						</tr>
						<tr>
							<th>
								登录帐号：
							</th>
							<td>
								<input class="ui-input long98" name="user.loginId" value = "${user.loginId }" id="userLoginId" required />
								<span id="tel"></span>
							</td>
						</tr>
						<tr>
							<th>
								用户名称：
							</th>
							<td>
								<input class="ui-input long98" name="user.name" value="${user.name}" required />
							</td>
						</tr>
						<tr>
							<th>
								密码：
							</th>
							<td>
								<input class="ui-input long98" type="password" id="regPassword" name="user.password" autocomplete="off" value="${user.password}" required onblur="isPassword()"/>
							</td>
						</tr>
						<tr>
							<th>
								确认密码：
							</th>
							<td>
								<input class="ui-input long98" type="password" value="${user.password}" required equalTo="#regPassword" />
							</td>
						</tr>
						<tr>
							<th>
								单位名称：
							</th>
							<td>
								<input class="ui-input long98" name="user.danweimingcheng" value="${user.danweimingcheng}" required />
							</td>
						</tr>
						<tr>
							<th>
								联系人：
							</th>
							<td>
								<input class="ui-input long98" name="user.lianxiren" value="${user.lianxiren}" required />
							</td>
						</tr>
						<tr>
							<th>
								联系电话：
							</th>
							<td>
								<input class="ui-input long98" name="user.lianxidianhua" value="${user.lianxidianhua}" required />
							</td>
						</tr>
						<tr>
							<th>
								单位地址：
							</th>
							<td>
								<input class="ui-input long98" name="user.danweidizhi" value="${user.danweidizhi}" required />
							</td>
						</tr>
						<tr>
							<th>
								附件(营业执照/身份证)：
							</th>
							<td>
								<input type="file" name="file" id="file" />
								若上传附件，会把当初注册时提交的附件覆盖！
							</td>
						</tr>
						<tr>
							<th>
								所在市：
							</th>
							<td>
								<div id="shidaima_div" onclick="delay()">
									<select name="user.shidaima" sltValue="${user.shidaima}" class="long98" id="shidaima" required></select>
									<b>不能为空</b>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								所在县：
							</th>
							<td>
								<div id="xiandaima_div" onclick="delay()">
									<select name="user.xiandaima" sltValue="${user.xiandaima}" class="long98" id="xiandaima" required></select>
									<b>不能为空</b>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								备注：
							</th>
							<td>
								<input class="ui-input long98" name="user.beizhu" value="${user.beizhu}" />
							</td>
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
							<td>
								<input type="button" class="submit" onclick="save()" value="保存" />
								<input type="button" class="submit" onclick="reg_tijiao()" value="重新提交申请" />
								<input type="button" class="submit" onclick="logout()" value="退出" />
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
	<script type="text/javascript">
	
	var $$loginIdLastValue;
	var $$loginIdValidate = true;
		/**页面元素事件注册*/
	$().ready(function(){
		$("#mask").css("height",$(document).height());     
		$("#mask").css("width",$(document).width());    
		$("#mask").css("top",0);
		$("#mask_msg").css("left",$(document).width()/2-100); 
		$("#mask_msg").css("top",$(document).height()/2-53);
		
		$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shidaima,xiandaima",data.dicDatas,"200px",true,"<%=path%>");
		},"JSON");
		
		$.post("<%=path%>/organ!getByTel.do",{code:${user.xiandaima}},
			function (data, textStatus){
				if(data.tel != ""){
					$('#tel').html(' 质监局电话：'+data.tel+'');
				}
		},"JSON");
		
			//验证码  
			 $("#chkNumber").click(function(){
			     var timenow = new Date().getTime();    
			     $(this).attr("src", "<%=path %>/registerChkNumber!getChkNumber.do?d="+timenow);  
			 });  
		
			//验证登录ID是否重复
			$("#userLoginId").focusout(function(){
				var input = $(this);
				var inputVal = input.val();
				
				if($$loginIdLastValue == inputVal) return ;
				$$loginIdLastValue = inputVal;
				
				if(inputVal.length != 0){
					$.post("<%=path%>/user!validateLoginId.do?type=sh&userid=${user.id}",{loginId:inputVal},
				        	function (data, textStatus){
				    			if(data.validate==false){
									input.css("background","#FFA8A8");
									$.dialog.alert("提示:["+inputVal+"]账户已存在!");
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
				url:"<%=path%>/user!editBySH.do",
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
				    if($("#frm_editUser").validate().form() && isPassword() && verifySelect() && $$loginIdValidate && vaiYzm()){
				    	showMask("正在保存......");
				    	return true;
				    }
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
		            hideMask();
		            if(rsp.msg == "SUCCESS"){
						$.dialog.tips('<font color="blue">修改成功!</font>',3,'success.gif');
						setTimeout(function(){
							location.href = location.href;
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
    function logout(){
		parent.location.href = "<%=path%>/account!logout.do"; 
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
	function reg_tijiao(){
		$.dialog.confirm('确定要重新提交注册信息吗？', function(){
			$("#shstate").attr("value","0");
			$("#jujueyuanyin").attr("value","");
			save();
		});
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
	</script>