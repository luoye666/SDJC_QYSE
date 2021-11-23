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
	            	<input type="hidden" name="inspect.loginId" value="${inspect.loginId}"/>
	            	<input type="hidden" name="inspect.inspectReportFile" value="${inspect.inspectReportFile}"/>
	            	<input type="hidden" name="inspect.createTime" value="${inspect.createTime}"/>
	            	<input type="hidden" name="inspect.type" value="${inspect.type}"/>
                </div>
				<table style="width: 98%">
					<tr>
					    <th style="width: 10%">企业名称:</th>
						<td style="width: 40%" colspan="3">
							<input class="ui-input long98" required="required" name="inspect.enterpriseName" value="${inspect.enterpriseName }" >
						</td>
					</tr>
					<tr>
						<th>负责人:</th>
						<td><input class="ui-input long98"  name="inspect.personInCharge" value="${inspect.personInCharge}"></td>
					    <th>联系电话:</th>
						<td><input class="ui-input long98"  name="inspect.phone" value="${inspect.phone}" ></td>
					</tr>
					<tr id="result">
						<th>设备注册代码:</th>
						<td><input class="ui-input long98"  name="inspect.regcode" value="${inspect.regcode}"></td>
						<th>设备自查结果:</th>
						<td><input class="ui-input long98"  name="inspect.result" value="${inspect.result}"></td>
					</tr>
					<tr id="fj">
						<th >附件:</th>
						<td colspan="2">
							<input type="file" class="long98" name="updFile" id="fujian">
						</td>
						<td>
							<div id="sydw_fj" style="text-align: center;">没有附件</div>
						</td>
					</tr>
					<tr>
						<th id="qingdan">自查信息:</th>
						<td colspan="3">
							<textarea rows="6" style="width: 98%" name="inspect.record" required="required" >${inspect.record}</textarea>
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
var type = "${inspect.type}";

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
	
	
	if("${inspect.type}" == '2'){
		$('#result').show();
	}else{
		$('#result').hide();
	}
	if("${inspect.inspectReportFile}" != ""){
		var down = '<a href="javascript:void(0)" onclick="parent.parent.downloadFile(\'${inspect.inspectReportFile}\')">下载附件</a>';
		$("#sydw_fj").html(down);
	}

	function save(){
			var options = {
				url:"<%=path%>/syUtils!updateEnterpriseInspect.do",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					var fname = $("#fujian").val();
					if(fname != "" &&  fname != undefined){
						var ftype = fname.substring(fname.lastIndexOf("."));
						if(ftype != ".pdf"){
							$.dialog.alert('上传文件类型只支持.pdf的文件!');
							return false;
						}
					}
				    if($("#frm_sy_edit").validate().form() ){
						W.parent.showMask("正在保存......");
				    	return true;
				    }
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
	            	if(rsp.msg == "SUCCESS"){
						$.dialog.tips('<font color="blue">提交成功!</font>',3,'success.gif');
						parent.reloadGrid();
						setTimeout(function(){
							api.close();
						}, 2000 );
	            	}else if(rsp.msg == "OUTSIZE"){
						$.dialog.tips('<font color="blue">附件过大!不能超过5M!</font>',3,'success.gif');
	            	}else if(rsp.msg == "FILE_TYPE_NOT_SUPPORT"){
						$.dialog.tips('<font color="blue">上传文件类型只支持.pdf、.zip、.rar、.doc、.docx的文件!</font>',3,'error.gif');
	            	}else{
						$.dialog.tips('<font color="blue">提交不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_sy_edit").ajaxSubmit(options);
	         return false;
	}
	
	
	
</script>