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
	var params = $STONE.formSerializedToJSON("#frm_kggz_search_conditions");
	W.search(params);
	return false;
};
window.onload = function(){
	if("" != W.searchForm){
		$("#frm_kggz_search_conditions").html(W.searchForm);
	}
	
			//生成级联下拉框
			$.post("<%=path%>/dirList!getSetypeList.do",{},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("kggz_list_search_sbzl,kggz_list_search_sblb",data.dirDatas,"200px",true,"<%=path%>");
			},"JSON");
			//生成级联下拉框
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("kggz_list_search_shi,kggz_list_search_qu",data.dicDatas,"200px",true,"<%=path%>");
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
	<form name="frm_kggz_search_conditions" id="frm_kggz_search_conditions">
	  	<table style="width: 98%">
	  		<tr>
	  			<th style="width: 15%;">设备种类:</th>
	  			<td style="width: 35%;">
	  				<div id="kggz_list_search_sbzl_div">
	        		<select name="shebeizhonglei" class="long90" id="kggz_list_search_sbzl"></select>
	  				</div>
	  			</td>
	  			<th style="width: 15%;">设备类别:</th>
	  			<td style="width: 35%;">
	        		<div id="kggz_list_search_sblb_div">
	        		<select name="shebeileibie" class="long90" id="kggz_list_search_sblb"></select>
	  				</div>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>制造单位:</th>
	  			<td>
	  				<input name="zhizaodanwei" class="ui-input long90" id="zzdw" onkeyup="setInputValue(this)">
	  			</td>
	  			<th>出厂编号:</th>
	  			<td>
	        		<input name="chuchangbianhao" class="ui-input long90" id="zzbh" onkeyup="setInputValue(this)">
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>市:</th>
	  			<td>
	  				<div id="kggz_list_search_shi_div">
	       				<select name="shidaima" class="long90" id="kggz_list_search_shi"></select>
	  				</div>
	  			</td>
	  			<th>区县:</th>
	  			<td>
	        		<div id="kggz_list_search_qu_div">
	        		<select name="qudaima" class="long90" id="kggz_list_search_qu"></select>
	  				</div>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>使用单位:</th>
	  			<td>
	       			<input type="text" name="shiyongdanwei" class="ui-input long90" id="sgdw" onkeyup="setInputValue(this)">
	  			</td>
	  			<th>产权单位:</th>
	  			<td>
	        		<input type="text" name="chanquandanwei" class="ui-input long90" id="cqdw" onkeyup="setInputValue(this)">
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>登记日期:</th>
	  			<td>
			        <input name="dengjiriqi_ks" class="ui-input " style="width: 80px;" onClick="WdatePicker()" id="djrq_ks" onchange="setInputValue(this)">~
			        <input name="dengjiriqi_js" class="ui-input" style="width: 80px;" onClick="WdatePicker()" id="djrq_js" onchange="setInputValue(this)"> 
	  			</td>
	  			<th>设备代码:</th>
	  			<td>
	       			<input type="text" name="shebeidaima" class="ui-input long90" id="sbdm" onkeyup="setInputValue(this)">
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>登记人:</th>
	  			<td>
	       			<input type="text" name="dengjiren" class="ui-input long90" id="djr" onkeyup="setInputValue(this)">
	  			</td>
	  			<th>登记机构:</th>
	  			<td>
	        		<input type="text" name="dengjijigou" class="ui-input long90" id="djjg" onkeyup="setInputValue(this)">
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>使用登记证编号:</th>
	  			<td>
	       			<input type="text" name="dengjizhengbianhao" class="ui-input long90" id="sydjzbh" onkeyup="setInputValue(this)">
	  			</td>
	  			<th></th>
	  			<td>
	  			</td>
	  		</tr>
	  	</table>
	  </form>
  </div>
</body>
</html>