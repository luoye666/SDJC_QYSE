<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	.inputWidth{
		width: 178px;
	}
	table th{
		text-align: right;
	}
	.long90{
		width: 90%;
	}
</style>
	<script type="text/javascript">
var api = frameElement.api, W = api.opener;

api.button(
	{
	    id:'valueCx',
		name:'确定',
		callback:search
	},{
	    id:'valueQx',
		name:'取消'
	}
);

function search(){
	var num = $().val();
	var options = {
			url:"<%=path%>/register!doRegisterCopy.do?id=${param.ids}",
			dataType:'json',
            beforeSubmit:function(formData, jqForm, options){
				W.parent.showMask("正在复制......");
				return true;
           	},
            success:function(rsp, statusText, xhr, $form){
            	W.parent.hideMask();
            	if(rsp.success){
					$.dialog.tips('<font color="blue">复制成功!</font>',3,'success.gif');
					W.reloadGrid();
					setTimeout(function(){
						api.close();
					}, 2000 );
            	}else{
					$.dialog.tips('<font color="blue">复制不成功!</font>',3,'error.gif');
            	}
            }
         };
         $("#frm_zcdj_fz").ajaxSubmit(options);
         return false;
};

	</script>
</head>

<body>
  <div id="fz_div" class="mod-search cf">
	<form name="frm_zcdj_fz" id="frm_zcdj_fz">
		数量：<input name="shuliang" class="ui-input"  value="1">
	  </form>
  </div>
</body>
</html>