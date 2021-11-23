<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
.progress { position:relative; width:400px; border: 1px solid #ddd; padding: 1px; border-radius: 3px; }
.bar { background-color:#B4F5B4; width:0%; height:20px; border-radius: 3px; }
.percent { position:absolute; display:inline-block; top:3px; left:48%; }
</style>
<div>
	<form class="frm_subBase" action="<%=path %>/downloadBox!uploadApp.do" method="post" name="myForm" id="myForm" onsubmit="return sss()" enctype="multipart/form-data">
	    <label><font color="red">※上传格式为RAR压缩包或者非可执行文件：</font></label>
        <input type="file" name="uploadify" id="uploadify" style="width: 420px;" required="required"><br/>
        <label>文件标题：</label>
        <input class="easyui-validatebox" type="text" name="box.title" data-options="required:true"><br>
        <span style="width:50px;"></span>
        <input type="submit" value="上传" style="width: 180px;">
    </form>
    <div class="progress" style="width: 420px;text-align: center;">
        <div class="bar"></div >
        <div class="percent">0%</div >
    </div>
    <div id="status"></div>
</div>
<script type="text/javascript">
    var api = frameElement.api, W = api.opener;
function sss(){
	if(!$("#myForm").form("validate")) return false;
}
(function() {
    
var bar = $('.bar');
var percent = $('.percent');
var status = $('#status');
   
$('form').ajaxForm({
    beforeSend: function() {
    	status.empty();
        var percentVal = '0%';
        bar.width(percentVal)
        percent.html(percentVal);
    },
    uploadProgress: function(event, position, total, percentComplete) {
        var percentVal = percentComplete + '%';
        bar.width(percentVal)
        percent.html(percentVal);
    },
    success: function() {
        var percentVal = '100%';
        bar.width(percentVal)
        percent.html(percentVal);
       	W.reloadGrid();
    },
	complete: function(xhr) {
    	if(xhr.responseText == '{"success":true}'){
			status.html("上传成功！");
    	}else{
			status.html(xhr.responseText);
    	}
	}
}); 

})(); 


</script>