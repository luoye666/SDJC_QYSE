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
	<form action="<%=path%>/bjd!saveuploadBjFile.do?id=${param.id}" id="myForm" method="post" enctype="multipart/form-data">
	   
        <input type="file" name="uploadify" id="uploadify" accept="jpg"  style="width: 420px;" required="required">
        <span style="width:50px;"></span><br/>
        <table>
			<tr>
				<td colspan="2" style="text-align: center;"><input type="submit" id="imp_drsj" value="上传" style="width: 180px;"><font color="red">(不能超过5M)</font></td>
			</tr>
		</table>
        
    </form>
    <div class="progress" style="width: 420px;text-align: center;">
        <div class="bar"></div >
        <div class="percent">0%</div >
    </div>
    <div id="status"></div>
</div>
<script type="text/javascript">
(function() {
    var api = frameElement.api, W = api.opener;
var bar = $('.bar');
var percent = $('.percent');
var status = $('#status');

$('form').ajaxForm({
    beforeSend: function() {
		var fpath = document.getElementById("uploadify").value;
		if(fpath == ""){
			$.dialog.alert("请选择导入的资料！");
			return false;
		}else{
			var ftype = fpath.substring(fpath.lastIndexOf("."));
			if(ftype == ".exe"){
				$.dialog.alert("不能导入此类文件！");
				return false;
			}
		}
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
    success: function(responseText, statusText) {
    	var s = jQuery.parseJSON(responseText);
        var percentVal = '100%';
        bar.width(percentVal)
        percent.html(percentVal);
		
    },
	complete: function(xhr) {
    	var s = jQuery.parseJSON(xhr.responseText);
    	if(s.msg == 'oversize'){
    		status.html("文件过大，请控制在5M内");
    	}else{
    		W.fujian();
    		status.html("上传成功");
    	}
		
	}
}); 

})(); 
</script>