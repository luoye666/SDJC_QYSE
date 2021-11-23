<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
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
	.long50{
		width: 50%
	}
	.overflow {  height: 120px;  }
	p{
		color:red;
		display: none;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div>
			<center><h3><div id="title">企业自查信息</div></h3></center>
			<!-- 条件筛选-->
			<form name="frm_sy_edit" id="frm_sy_edit" method="POST">
				<div class="formHiddenRegion">
	            	<input type="hidden" name="inspect.id" id="sydwid" value="${inspect.id}"/>
	            	<input type="hidden" name="inspect.type" value="${param.type }"/>
                </div>
				<table style="width: 98%">
					<tr>
					    <th style="width: 10%">企业名称:</th>
						<td style="width: 40%" colspan="3">
							<input class="ui-input long98" required="required" name="inspect.enterpriseName" value="<%=user.getDanweimingcheng()%>" >
						</td>
					</tr>
					<tr>
						<th>录入人:</th>
						<td><input class="ui-input long98"  name="inspect.personInCharge" value="${inspect.personInCharge}" required="required"></td>
					    <th>联系电话:</th>
						<td><input class="ui-input long98"  name="inspect.phone" value="${inspect.phone}" required="required"></td>
					</tr>
					<tr id="result">
						<th>设备注册代码/登记编号:</th>
						<td><input class="ui-input long98"  name="inspect.regcode" value="${inspect.regcode}" required="required"></td>
						<th>设备自查结果:</th>
						<td><input class="ui-input long98"  name="inspect.result" value="${inspect.result}" required="required"></td>
					</tr>
					<tr id="fj">
						<th>附件:</th>
						<td colspan="2">
							<input type="file" class="long50" name="updFile" id="fujian" onchange="filefujianChange(this)" required="required">
							<span style="color:red;">（文件大小不得超过10M）</span>
						</td>
						<td>
							<div id="sydw_fj" style="text-align: center;">没有附件</div>
						</td>
					</tr>
					<tr>
						<th id="qingdan">自查信息:</th>
						<td colspan="3">
							<textarea rows="6" style="width: 98%" name="inspect.record" required="required" value="${inspect.record}"></textarea>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<iframe id="dwzhDownloadFile" height="0" width="0" src="" style="display: none;"></iframe>
	</body>
	</html>
	<!-- 脚本 -->
	<script type="text/javascript">
var api = frameElement.api, W = api.opener;
var type = "${param.type}";

	api.button(
		{
		    id:'valueTj',
			name:'保存',
			callback:save,
		},{
		    id:'valueQx',
			name:'关闭'
		}
	);
	
	$('#fj').hide();
	if(type == '1'){
		$('#title').text('企业自查信息');
		$('#qingdan').text('自查信息:');
		$('#fj').remove();
	}else if(type == '2'){
		$('#title').text('设备自查信息');
		$('#qingdan').text('自查信息:');
		$('#fj').remove();
	}else if(type == '3'){
		$('#title').text('责任清单信息');
		$('#qingdan').text('清单信息:');
		$('#fj').show();
	}else if(type == '4'){
		$('#title').text('风险管理信息');
		$('#qingdan').text('管理信息:');
		$('#fj').remove();
	}else if(type == '5'){
		$('#title').text('隐患管理信息');
		$('#qingdan').text('管理信息:');
		$('#fj').remove();
	}else if(type == '6'){
		$('#title').text('应急演练信息');
		$('#qingdan').text('应急演练信息:');
		$('#fj').remove();
	}

	if(type == '2'){
		$('#result').show();
	}else{
		$('#result').hide();
	}
	if("${inspect.fujian}" != ""){
		var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\'${inspect.fujian}\')">下载附件</a>';
		$("#sydw_fj").html(down);
	}

	function save(){
			var options = {
				url:"<%=path%>/syUtils!saveEnterpriseInspect.do",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					
				    if($("#frm_sy_edit").validate().form() ){
						W.parent.showMask("正在保存......");
				    	return true;
				    }
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
	            	if(rsp.msg == "SUCCESS"){
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
						parent.reloadGrid();
						setTimeout(function(){
							api.close();
						}, 2000 );
	            	}else if(rsp.msg == "OUTSIZE"){
						$.dialog.tips('<font color="blue">附件过大!不能超过5M!</font>',3,'success.gif');
	            	}else{
						$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_sy_edit").ajaxSubmit(options);
	         return false;
	}
	
	
	function filefujianChange(target) {
	    
	    var fname = $("#fujian").val();
		var ftype = fname.substring(fname.lastIndexOf("."));
		if(fname == ""){
			$.dialog.alert('请上传附件，支持.pdf/.zip/.rar格式的文件!');
			return false;
		}else{
			if(ftype != ".pdf" && ftype != ".rar" && ftype != ".zip" && ftype != ".doc" && ftype != ".docx" ){
				$.dialog.alert('上传文件类型只支持.pdf、.zip、.rar、.doc、.docx的文件!');
				$("#fujian").val("");
				return false;
			}
			
		}
	}
	
	
</script>