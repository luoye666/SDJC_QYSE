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
	<form action="<%=path%>/zyry!xkzImp.do?sydwid=${param.sydwid}" id="myForm" method="post" enctype="multipart/form-data">
	    <label><font color="red">※导入附件格式应为.xls类型,请点击浏览选择：</font></label>
        <input type="file" name="file" id="uploadify" style="width: 420px;" required="required">
        <span style="width:50px;"></span>
        <input type="submit" id="imp_drsj" value="导入数据" style="width: 180px;">
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
			$.dialog.alert("请选择导入模板！");
			return false;
		}else{
			var ftype = fpath.substring(fpath.lastIndexOf("."));
			if(ftype != ".xls"){
				$.dialog.alert("请选择格式为.xls的模板！");
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
    success: function() {
        var percentVal = '100%';
        bar.width(percentVal)
        percent.html(percentVal);
        W.reloadGrid();
    },
	complete: function(xhr) {
		status.html(xhr.responseText);
	}
}); 

})(); 
</script>