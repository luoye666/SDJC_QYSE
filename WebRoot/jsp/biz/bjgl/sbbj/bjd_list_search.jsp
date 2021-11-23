<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ taglib prefix="c" uri="/c.tld" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	.inputWidth{
		width: 178px;
	}
	table th{
		text-align: right;
		width: 20%;
	}
	.long90{
		width: 90%;
	}
	.long98{
  		width:92%;
	}
	.long85{
  		width:85%;
	}
	.tabjcxx {
		border-collapse:collapse;
		border-bottom-color:white;
		margin:0 0 0 0;
		width: 80%;
	}
	.tabjcxx th{
		border:1px black solid;
		text-align:center; 
		font-size:14px;
	}
	.tabjcxx td{
		border:1px black solid;
		font-size:12px;
		text-align:center; 
		margin:0px; 
		padding:0 0 0 0px;
	}
	input{
		text-align: center;
		vertical-align: middle;
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
	W.searchForm = $("#frm_jcsj_search_conditions").html();
}

function search(){
	var params = $STONE.formSerializedToJSON("#frm_jcsj_search_conditions");
	W.search(params);
//	return false;
};
window.onload = function(){
	if("" != W.searchForm){
		$("#frm_jcsj_search_conditions").html(W.searchForm);
	}
	//生成级联下拉框
	$.post("<%=path%>/dirList!getSetypeList.do",{},
		function (data, textStatus){
			$STONE.creatSelectMenuBySeType("shebeizhonglei",data.dirDatas,"200px",false,"<%=path%>");
	},"JSON");
	$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
		function (data, textStatus){
			$STONE.creatSelectMenu("shidaima,quhuadaima",data.dicDatas,"200px",true,"<%=path%>");
	},"JSON");
	$("#tjstate").selectmenu();
}
function setInputValue(obj){
	$("#"+obj.id).attr("value",obj.value);
}


</script>
</head>

<body>
  <div id="search_div" class="mod-search cf">
	<form name="frm_jcsj_search_conditions" id="frm_jcsj_search_conditions">
	  	<table style="width: 98%;">
	  		<tr>
	  			<th>使用单位</th>
	  			<td>
	  				<input name="sydw" class="ui-input long90" id="sydw" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  			<th>注册代码</th>
	  			<td>
	  				<input name="zcdm" class="ui-input long90" id="zcdm" value = "" onkeyup="setInputValue(this)"/> 
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>所在市</th>
	  			<td>
	  				<div id="shidaima_div">
	       				<select name="shidaima" class="long90" id="shidaima" ></select>
	  				</div>
	  			</td>
	  			<th>所在县</th>
	  			<td>
	  				<div id="quhuadaima_div">
	       				<select name="quhuadaima" class="long90" id="quhuadaima" ></select>
	  				</div>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>设备种类</th>
	  			<td>
	  				<div id="shebeizhonglei_div">
	  					<select name="shebeizhonglei" class="long90" id="shebeizhonglei"></select>
	  				</div>
	  			</td>
	  			<th>提交日期（时间段）</th>
	  			<td>
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="tjsj" id="tjsj"  value="" onchange="setInputValue(this)"/>
					~
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="tjsjend" id="tjsjend"  value="" onchange="setInputValue(this)"/>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>报检单状态</th> <!-- 对应事故类别 -->
	  			<td>
	       			<select name="tjstate" class="long90" id="tjstate" onkeyup="setInputValue(this)">
	       				<option></option>
	       				<option value="1">提交</option>
	       				<option value="2">预审通过</option>
	       				<option value="3">审核通过</option>
	       				<option value="4">检验中</option>
	       				<option value="5">检验完毕</option>
	       			</select>
	  			</td>
	  		</tr>
	  	</table>
	  </form>
  </div>
</body>
</html>
