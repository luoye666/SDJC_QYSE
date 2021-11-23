<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
		width: 15%;
	}
	.long90{
		width: 98%;
	}
</style>
	<script type="text/javascript">
var api = frameElement.api, W = api.opener;

api.button(
	{
	    id:'valueCx',
		name:'查询',
		callback:search
	},{
	    id:'valueQx',
		name:'取消'
	}
);
function closeBefore(){
	$("span").remove();  //因使用jquery ui selectmenu 控件  所以要删除selectmunu控件自动生成的span标签
	W.searchForm = $("#frm_jcsj_search_conditions").html();
}

function search(){
//	closeBefore();
	var params = $STONE.formSerializedToJSON("#frm_jcsj_search_conditions");
	W.search(params);
	return false;
};
window.onload = function(){
	if("" != W.searchForm){
		$("#frm_jcsj_search_conditions").html(W.searchForm);
	}
}
function setInputValue(obj){
	$("#"+obj.id).attr("value",obj.value);
}
	</script>
</head>

<body>
  <div id="search_div" class="mod-search cf">
	<form name="frm_jcsj_search_conditions" id="frm_jcsj_search_conditions">
	  	<table style="width: 98%">
				<tr>
					<th>企业名称:</th>
					<td style="width: 35%">
						<input  class="ui-input long90" name="enterpriseName" onkeyup="setInputValue(this)" id="dwmc"/>
					</td>
					<th>企业地址:</th>
					<td style="width: 35%">
						<input  class="ui-input long90" name="enterpriseAddress" onkeyup="setInputValue(this)" id="dwdz"/>
					</td>
				</tr>
	  	</table>
	  </form>
  </div>
</body>
</html>