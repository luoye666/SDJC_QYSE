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
	$("#sy_list_zt").selectmenu();
	//生成级联下拉框
	$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
		function (data, textStatus){
			$STONE.creatSelectMenu("sy_list_qx",data.dicDatas,"200px",false,"<%=path%>");
	},"JSON");
	//生成级联下拉框
	$.post("<%=path%>/dirList!getSetypeList.do",{},
		function (data, textStatus){
			$STONE.creatSelectMenuBySeType("shebeizhonglei,shebeileibie",data.dirDatas,"200px",true,"<%=path%>");
	},"JSON");
	$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
		function (data, textStatus){
			$STONE.creatSelectMenu("shidaima,quhuadaima,xiangzhendaima",data.dicDatas,"200px",true,"<%=path%>");
	},"JSON");
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
						<th>单位名称:</th>
						<td style="width: 35%">
							<input  class="ui-input long90" name="danweimingcheng" onkeyup="setInputValue(this)" id="dwmc"/>
						</td>
						<th>市:</th>
						<td style="width: 35%">
							<div id="shidaima_div">
								<select  class="long90" name="shidaima" id="shidaima"></select>
							</div>
						</td>
					</tr>
					<tr>
			  			<th>所在县:</th>
			  			<td>
			  				<div id="quhuadaima_div">
			       				<select name="quhuadaima" class="long90" id="quhuadaima" ></select>
			  				</div>
			  			</td>
			  			<th>所在乡镇（街道办事处）:</th>
			  			<td>
			  				<div id="xiangzhendaima_div">
			       				<select name="xiangzhendaima" class="long90" id="xiangzhendaima" ></select>
			  				</div>
			  			</td>
			  		</tr>
			  		<tr>
			  			<th style="width:20%;">设备种类:</th>
			  			<td style="width:30%;">
			  				<div id="shebeizhonglei_div">
			  					<select name="shebeizhonglei" class="long90" id="shebeizhonglei"></select>
			  				</div>
			  			</td>
			  			<th>设备状态:</th>
						<td style="width: 35%">
							<select class="long90" name="zhuangtai" id="sy_list_zt">
								<option value=""></option>
								<option value="1">在用</option>
								<option value="3">停用</option>
							</select>
						</td>
			  		</tr>
					
	  	</table>
	  </form>
  </div>
</body>
</html>