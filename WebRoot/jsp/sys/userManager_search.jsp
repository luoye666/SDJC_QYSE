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
	$("span").remove();
	$("#jsmc").html("");
	W.searchForm = $("#frm_jcsj_search_conditions").html();
}

function search(){
	var params = $STONE.formSerializedToJSON("#frm_jcsj_search_conditions");
	W.search(params);
	return false;
};
window.onload = function(){
	if("" != W.searchForm){
		$("#frm_jcsj_search_conditions").html(W.searchForm);
	}
	$("#jsmc").selectmenu().selectmenu("menuWidget").css("height","200px");
	$.post("<%=path%>/user!getRoleList.do",{},
		function (data, textStatus){
			var roles = data.roles;
			$("#jsmc").append("<option value=''></option>");
			for(var i in roles){
				$("#jsmc").append("<option value='"+roles[i].id+"'>"+roles[i].name+"</option>");
			}
	},"json");
}
function setInputValue(obj){
	$("#"+obj.id).attr("value",obj.value);
}
	</script>
</head>

<body>
  <div id="search_div" class="mod-search cf">
	<form name="frm_jcsj_search_conditions" id="frm_jcsj_search_conditions">
	  	<table>
			<tr>
				<th>用户帐号:</th>
				<td><input class="ui-input inputWidth" name="loginId" onkeyup="setInputValue(this)" id="loginid" ></td>
				<th>用户名称:</th>
				<td><input class="ui-input inputWidth" name="name" onkeyup="setInputValue(this)" id="name" ></td>
			</tr>
			<tr>
				<th>角色名称:</th>
				<td>
					<select id="jsmc" name="roleId" class="inputWidth">
					</select>
				</td>
				<th></th>
				<td></td>
			</tr>
	  	</table>
	  </form>
  </div>
</body>
</html>