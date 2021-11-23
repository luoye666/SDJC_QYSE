<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String freePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	th{
		text-align:left;
		height: 30px;
	}
	td span input{
		vertical-align:middle;
		valign:middle;
		height: 25px;
	}
	td span{
		vertical-align:middle;
		valign:middle;
		width:180px; 
		font-size:15px;
		line-height: 25px;
	}
	
	.xz{
		
		visibility: hidden; 
		/*display:none;*/
	}
	.xs{
		visibility: visible; 
	}
	.sp {
	    position: relative;
	    background: #E3E3E3;
	    border: 1px solid #99D3F5;
	    border-radius: 4px;
	    padding: 4px 12px;
	    overflow: hidden;
	    color: #9E9E9E;
	    text-decoration: none;
	    text-indent: 0;
	    line-height: 20px;
	}
	.sp:hover {
	    background: #CDC9C9;
	    border-color: #78C3F3;
	    color: #9E9E9E;
	    text-decoration: none;
	}
	.kz{
		float: left;
	}
	.wj{
		width:60px; 
		height: 25px;
		float: right;
		margin-right: 4px;
		
		cursor: pointer;background-color: #4CAF50;color: white;padding: 4px 12px;display: inline-block;font-size: 15px;"
	}
	input {
		width:200px; 
	}
</style>
	<script type="text/javascript">
var api = frameElement.api, W = api.opener;

api.button(
	{
	    id:'valueQx',
		name:'关闭'
	}
);


//上传文件方法封装
function uploadFile(ele){
	
	var files = $('#'+ele)[0].files;
	if(files.length == 0){
		$.dialog.alert("请选项要上传的附件！");
		return false;
	}else if($("."+ele).hasClass("xs")){
		$.dialog.confirm("文件已存在是否继续上传，上传后新文件将覆盖旧文件?", function(){
			execUploadFile(ele);
	    });
	}else{
		execUploadFile(ele);
	}
	return false;
}
//执行上传文件方法
function execUploadFile(ele){
	var formData = new FormData();
	var files = $('#'+ele)[0].files;
   	var name = files[0].name;              
    var file = files[0];
    formData.append("file", file);
    formData.append("fileFileName", name);
    
    $.ajax({
        url: "<%=path%>/register!addFeiLeiFujian.do?id="+${param.id}+"&leibie="+ele+" ",
        type: 'POST',
        data: formData,
        processData: false,    // ⑧告诉jQuery不要去处理发送的数据
        contentType: false,    // ⑨告诉jQuery不要去设置Content-Type请求头
        success: function (data) {
			var obj = JSON.parse(data);
			//var obj = data;
        	if(obj.msg == 'SUCCESS'){
        		$.dialog.alert("上传成功");
        		ajsxLoad();
        	}else if(obj.msg == 'OUTSIZE'){
        		$.dialog.alert("上传失败！上传文件不得超过10M");
        	}
        	
        },
        error : function (responseStr) {
        	$.dialog.alert("上传失败");
        }
    });
}


window.onload = function(){
	if("${param.tjstate }" == "1" || "${param.tjstate }" == "2" ){
		$(".sc").addClass("xz");
		$("input").addClass("xz");
		$(".xz").addClass("kz");
	}
    ajsxLoad();
}
function ajsxLoad(){
	$.ajax({
        url: "<%=path%>/register!findFeiLeiFujian.do?id="+${param.id},
        type: 'POST',
        success: function (data) {
        	var obj = JSON.parse(data);
        	//var obj = data;
			$.each( obj, function(index, content){ 
		  		$.each(content,function(key,val){
	                if(val.file_name == 'sydjb'){
	                	$(".sydjb").addClass("xs");
	                	$(".sydjb").attr("onclick","sss('"+val.file_path+"');");
	                	$(".sydjbyl").addClass("xs");
	                	$(".sydjbyl").attr("onclick","show('"+val.file_path+"');");
	                }else if(val.file_name == 'dmz'){
	                	$(".dmz").addClass("xs");
	                	$(".dmz").attr("onclick","sss('"+val.file_path+"');");
	                	$(".dmzyl").addClass("xs");
	                	$(".dmzyl").attr("onclick","show('"+val.file_path+"');");
	                }else if(val.file_name == 'sfz'){
	                	$(".sfz").addClass("xs");
	                	$(".sfz").attr("onclick","sss('"+val.file_path+"');");
	                	
	                	$(".sfzyl").addClass("xs");
	                	$(".sfzyl").attr("onclick","show('"+val.file_path+"');");
	                }else if(val.file_name == 'hgz'){
	                	$(".hgz").addClass("xs");
	                	$(".hgz").attr("onclick","sss('"+val.file_path+"');");
	                	
	                	$(".hgzyl").addClass("xs");
	                	$(".hgzyl").attr("onclick","show('"+val.file_path+"');");
	                }else if(val.file_name == 'jdjyzm'){
	                	$(".jdjyzm").addClass("xs");
	                	$(".jdjyzm").attr("onclick","sss('"+val.file_path+"');");
	                	
	                	$(".jdjyzmyl").addClass("xs");
	                	$(".jdjyzmyl").attr("onclick","show('"+val.file_path+"');");
	                }else if(val.file_name == 'qtwj'){
	                	$(".qtwj").addClass("xs");
	                	$(".qtwj").attr("onclick","sss('"+val.file_path+"');");
	                	
	                	$(".qtwjyl").addClass("xs");
	                	$(".qtwjyl").attr("onclick","show('"+val.file_path+"');");
	                }
	            })
  			});
        },
        error : function (responseStr) {
        	$.dialog.alert("失败");
        }
    });
}
function sss(path){
	var url = '<%=path%>/upload!downloadFile.do';
	var html = '<form action="'+url+'" method="post" id="file_down_form">'+
               '<input id="file_path" name="path" type="hidden" value=""/>'+
              '</form>';
//	document.getElementById("downloadFile").src="?path="+encodeURI(encodeURI(path));
	document.getElementById('downloadFile').innerHTML = "";
	document.getElementById('downloadFile').contentWindow.document.write(html);
	document.getElementById('downloadFile').contentWindow.document.getElementById('file_path').value=path;
	document.getElementById('downloadFile').contentWindow.document.getElementById('file_down_form').submit();
}


function si(fid){
	var f = document.getElementById(fid).files; 
	if(f[0].size > 10*1024*1024){
		$("#"+fid).val("");
		alert("上传附件大小不能超过10M！");
	} 
}

function show(path){
	//取后缀
	var suffix = path.substr(path.lastIndexOf("."));
	suffix = path.substr(path.lastIndexOf("/"));
	//suffix 就是后缀；
	const url = "<%=freePath%>" + "/djpdf"+ suffix;
    window.open(url);
}

</script>
</head>

<body>
  <div id="search_div" class="mod-search cf">
  	<form id="form" enctype="multipart/form-data" method="post" action="#">
	  	<table>
	  		<tr>
	  			<th>使用登记表：</th>
	  		</tr>
	  		<tr>
	  			<td> <span><input type="file" name="file" class="sp" id="sydjb" onchange="si(this.id)" accept=".jpg,.JPG,.png,.jept,.pdf"></span> <span class="sp wj xz sydjbyl">文件预览</span> <span class="sp wj xz sydjb">文件下载</span> <span onclick="uploadFile('sydjb')" class="sp wj sc">文件上传</span> </td>
	  		</tr>
	  		<tr>
	  			<th>使用单位统一社会信用代码证（公民个人所有的特种设备无需上传本证件）：</th>
	  		</tr>
	  		<tr>
	  			<td> <span><input type="file" name="file" class="sp" id="dmz" onchange="si(this.id)" accept=".jpg,.JPG,.png,.jept,.pdf"></span> <span class="sp wj xz dmzyl">文件预览</span> <span class="sp wj xz dmz">文件下载</span> <span onclick="uploadFile('dmz')" class="sp wj sc">文件上传</span> </td>
	  		</tr>
	  		<tr>
	  			<th>个人身份证明（适用于公民个人所有的特种设备）：</th>
	  		</tr>
	  		<tr>
	  			<td> <span><input type="file" name="file" class="sp" id="sfz" onchange="si(this.id)" accept=".jpg,.JPG,.png,.jept,.pdf"></span> <span class="sp wj xz sfzyl">文件预览</span> <span class="sp wj xz sfz">文件下载</span> <span onclick="uploadFile('sfz')" class="sp wj sc">文件上传</span> </td>
	  		</tr>
	  		<tr>
	  			<th>特种设备合格证（含产品数据表、车用气瓶安装合格证明）：</th>
	  		</tr>
	  		<tr>
	  			<td> <span><input type="file" name="file" class="sp" id="hgz" onchange="si(this.id)" accept=".jpg,.JPG,.png,.jept,.pdf"></span> <span class="sp wj xz hgzyl">文件预览</span> <span class="sp wj xz hgz">文件下载</span> <span onclick="uploadFile('hgz')" class="sp wj sc">文件上传</span> </td>
	  		</tr>
	  		<tr>
	  			<th>特种设备监督检验证明（安全技术规范要求进行使用前首次检验的特种设备，应当提交使用前的首次检验报告）：</th>
	  		</tr>
	  		<tr>
	  			<td> <span><input type="file" name="file" class="sp" id="jdjyzm" onchange="si(this.id)" accept=".jpg,.JPG,.png,.jept,.pdf"></span> <span class="sp wj xz jdjyzmyl">文件预览</span> <span class="sp wj xz jdjyzm">文件下载</span> <span onclick="uploadFile('jdjyzm')" class="sp wj sc">文件上传</span> </td>
	  		</tr>
	  		
	  		<tr>
	  			<th>其它文件：</th>
	  		</tr>
	  		<tr>
	  			<td> <span><input type="file" name="file" class="sp" id="qtwj" onchange="si(this.id)" accept=".jpg,.JPG,.png,.jept,.pdf"></span> <span class="sp wj xz qtwjyl">文件预览</span> <span class="sp wj xz qtwj">文件下载</span> <span onclick="uploadFile('qtwj')" class="sp wj sc">文件上传</span> </td>
	  		</tr>
	  	</table>
  	</form>
  </div>
  <iframe id="downloadFile" height="0" width="0" src="" style="display: none;"></iframe>
</body>
</html>