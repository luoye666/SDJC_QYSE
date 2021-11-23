<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<div>
       <div id="fileQueue"></div>  
       <input type="file" name="uploadify" id="uploadify"/>  
       <p>  
	    	<a class="ui-btn ui-btn-sp" href="javascript:uploasFile()">上传</a><a class="ui-btn ui-btn-sp" href="javascript:jQuery('#uploadify').uploadifyClearQueue()">取消</a>
       </p> 
</div>
<script type="text/javascript">
(function() {
    
var bar = $('.bar');
var percent = $('.percent');
var status = $('#status');
    var api = frameElement.api, W = api.opener;
    
		var fileDesc = "";
		var fileExt = "";
		var buttonText = "选择附件";
		fileDesc = "支持格式:xls,doc,docx,png,jpg,jpeg,pdf,bmp";
		fileExt = "*.xls;*.doc;*.docx;*.png;*.jpg;*.jpeg;*.pdf;*.bmp;";
		 $("#uploadify").uploadify({  
           'uploader'       : '<%=path%>/js/resources/uploadify.swf',  
           'script'         : '<%=path%>/se!saveuploadSeFile.do',
     //      'method'         :'GET',  //如果要传参数，就必须改为GET  
           'cancelImg'      : '<%=path%>/js/resources/cancel.png',  
           'queueID'        : 'fileQueue',  
           'multi'          : true, //是否允许同时上传多文件，默认false  
           'buttonText'		: buttonText,
           'displayData'    : 'speed', 
           'fileDataName'   : 'uploadify',
           'simUploadLimit' : 1, //一次同步上传的文件数目    
           'sizeLimit'      : 9097152, //设置单个文件大小限制，单位为byte      9M以内 
           'queueSizeLimit' : 10, //限制在一次队列中的次数（可选定几个文件）。默认值= 999，而一次可传几个文件有 simUploadLimit属性决定。  
           'fileDesc'       : fileDesc, //如果配置了以下的'fileExt'属性，那么这个属性是必须的    
           'fileExt'        : fileExt,//允许的格式 ; 
           'scriptData'     :{'ids':'${param.ids}','type':'${param.type}'}, // 多个参数用逗号隔开 'name':$('#name').val(),'num':$('#num').val(),'ttl':$('#ttl').val()  
           　		onComplete: function (event, queueID, fileObj, response, data) {  
				    	var data = $.parseJSON(response);
				    	
           　		},
            onAllComplete: function (event, queueID, fileObj, response, data) {
				api.close();
				W.tingyong('${param.ids}','${param.type}');
            },
           　		onError: function(event, queueID, fileObj) {    
		           　W.$.dialog.alert("文件:" + fileObj.name + "上传失败");    
		    }
          });  
})(); 
	function uploasFile(){
         //上传  
        jQuery('#uploadify').uploadifyUpload();            
    }  
</script>