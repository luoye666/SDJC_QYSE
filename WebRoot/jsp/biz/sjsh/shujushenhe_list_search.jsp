<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
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
	input{
		text-align: center;
		vertical-align: middle;
	}
</style>
	<script type="text/javascript">
	var bl = true;
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
	W.searchForm = $("#frm_kggz_search_conditions").html();
}

function search(){
//	closeBefore();
	if(bl){
		var params = $STONE.formSerializedToJSON("#frm_kggz_search_conditions");
		W.search(params);
	}
	return false;
};
window.onload = function(){
	if("" != W.searchForm){
		$("#frm_kggz_search_conditions").html(W.searchForm);
	}
	
			//生成级联下拉框
			$.post("<%=path%>/dirList!getSetypeList.do",{},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("db_list_search_sbzl",data.dirDatas,"200px",false,"<%=path%>");
			},"JSON");
			//生成级联下拉框
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("db_list_search_shi,db_list_search_xian",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
	$("#sjlb").selectmenu();
	$("#tjzt").selectmenu();
}
function setInputValue(obj){
	$("#"+obj.id).attr("value",obj.value);
}
//验证输入的用户名是否存在
function checkName(vl){
	if(vl != ""){
		$.post("<%=path%>/db!checkUserName.do",{name:vl},
			function (data, textStatus){
				if(data.msg != ""){
					$.dialog.tips('<font color="blue">'+data.msg+'</font>',3,'error.gif');
					bl = false;
				}else{
					bl = true;
				}
		},"JSON");
	}else{
		bl = true;
	}
}

	</script>
</head>

<body>
  <div id="search_div" class="mod-search cf">
	<form name="frm_kggz_search_conditions" id="frm_kggz_search_conditions">
	  	<table style="width: 98%">
	  		<tr>
	  			<th style="width: 15%;">数据类别:</th>
	  			<td style="width: 35%;">
	  				<select name="shujuleibie" id="sjlb" style="width: 120px">
	  					<option></option>
	  					<option value="使用单位">使用单位</option>
	  					<option value="设备">设备</option>
	  				</select>
	  			</td>
	  			<th style="width: 15%;">数据内容:</th>
	  			<td style="width: 35%;">
	        		<input name="shujuneirong" class="ui-input long90" id="sjnr" onkeyup="setInputValue(this)">
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>单位名称:</th>
	  			<td>
	        		<input name="danweimingcheng" class="ui-input long90" id="dwmc" onkeyup="setInputValue(this)">
	  			</td>
	  			<th>单位地址:</th>
	  			<td>
	        		<input name="danweidizhi" class="ui-input long90" id="dwdz" onkeyup="setInputValue(this)">
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>注册代码:</th>
	  			<td>
	        		<input name="zhucedaima" class="ui-input long90" id="zcdm" onkeyup="setInputValue(this)">
	  			</td>
	  			<th>设备种类:</th>
	  			<td>
	  				<div id="db_list_search_sbzl_div">
	        			<select name="shebeizhonglei" class="long90" id="db_list_search_sbzl"></select>
	  				</div>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>提交时间:</th>
	  			<td colspan="3">
	        		<input name="xiugaishijian" style="width: 120px;" class="ui-input" id="xgsj" value="" onchange="setInputValue(this)" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" /> 
	        		~ 
	        		<input name="xiugaishijianend" style="width: 120px;" class="ui-input" id="xgsjend" value="" onchange="setInputValue(this)" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" />
	  			</td>
	  		</tr>
	  		
	  	</table>
	  </form>
  </div>
</body>
</html>