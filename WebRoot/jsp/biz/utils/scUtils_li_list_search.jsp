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
	table td{
		width: 35%;
	}
	.long98{
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
	$("#sc_li_list_xkzlb").selectmenu();
			$.post("<%=path%>/se!getDateByTypeCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					if("" != data){
				        var pz = $("#sy_list_qx");  
				        pz.empty();  
				        pz.append("<option value = ''></option>"); 
						var dataArr = data.split(",");
						for(var i = 0;i<dataArr.length;i++){
				            var tmp = dataArr[i].split(":");
				            pz.append("<option value = '"+tmp[1]+"'>"+tmp[0]+"</option>"); 
						}
						$("#sy_list_qx").selectmenu();
					}
				});
			$.post("<%=path%>/se!getDateByTypeCode.do",{code:"SE_TYPE"},
				function (data, textStatus){
					if("" != data){
				        var pz = $("#sc_li_list_lb");  
				        pz.empty();  
				        pz.append("<option value = ''></option>"); 
						var dataArr = data.split(",");
						for(var i = 0;i<dataArr.length;i++){
				            var tmp = dataArr[i].split(":");
				            pz.append("<option value = '"+tmp[1]+"'>"+tmp[0]+"</option>"); 
						}
						$("#sc_li_list_lb").selectmenu();
					}
				});
			$.post("<%=path%>/se!getDateByTypeCode.do",{code:"XKLB"},
				function (data, textStatus){
					if("" != data){
				        var pz = $("#sc_li_list_xkzlb");  
				        pz.empty();  
				        pz.append("<option value = ''></option>"); 
						var dataArr = data.split(",");
						for(var i = 0;i<dataArr.length;i++){
				            var tmp = dataArr[i].split(":");
				            pz.append("<option value = '"+tmp[0]+"'>"+tmp[0]+"</option>"); 
						}
						$("#sc_li_list_xkzlb").selectmenu();
					}
				});
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
						<td>
							<input  class="ui-input long98" name="danweimingcheng" onkeyup="setInputValue(this)" id="dwmc"/>
						</td>
						<th>区县:</th>
						<td>
							<select  class="long98" name="quxiandaima" id="sy_list_qx"></select>
						</td>
					</tr>
					<tr>
						<th>设备类别:</th>
						<td>
							<select name="shebeileibie" class="long98" id="sc_li_list_lb"></select>
						</td>
						<th>许可证类别:</th>
						<td>
							<select name="xukezhengleibie" class="long98" id="sc_li_list_xkzlb"></select>
						</td>
					</tr>
					<tr>
						<th>许可证编号:</th>
						<td>
							<input class="ui-input long98" name="xukezhengbianhao" onkeyup="setInputValue(this)" id="xkzbh"/>
						</td>
						<th>证书有效期:</th>
						<td>
							<input class="ui-input" name="youxiaoqi_ks" onclick="WdatePicker()" onchange="setInputValue(this)" id="yxq_ks"/>-
							<input class="ui-input" name="youxiaoqi_js" onclick="WdatePicker()" onchange="setInputValue(this)" id="yxq_js"/>
						</td>
					</tr>
	  	</table>
	  </form>
  </div>
</body>
</html>