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
	.long98{
		width: 98%;
	}
	.long90{
		width: 90%;
	}
	.tab th{
		text-align: right;
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
	W.searchForm = $("#frm_rygl_zyry_xkz_search_conditions").html();
}

function search(){
	//closeBefore();
	var params = $STONE.formSerializedToJSON("#frm_rygl_zyry_xkz_search_conditions");
	W.search(params);
	return false;
};
window.onload = function(){
	if("" != W.searchForm){
		$("#frm_rygl_zyry_xkz_search_conditions").html(W.searchForm);
	}
	$.post("<%=path%>/zyry!getDic.do",{code:""},
		function (data, textStatus){
			if("" != data){
		        var zyzl = $("#zyzl");  
				var dataArr = data.zyzl.split(",");
				for(var i = 0;i<dataArr.length;i++){
		            zyzl.append("<option value = '"+dataArr[i]+"'>"+dataArr[i]+"</option>"); 
				}
				$("#zyzl").selectmenu();
			}
		},"JSON");
	$("#xingbie").selectmenu();
	$.post("<%=path%>/dicList!getDataListByCode.do",{code:"ZYZL"},
		function (data, textStatus){
			createSelect("zhonglei",data.dicDatas,"200px",false,"<%=path%>","zhonglei");
	},"JSON");
	$.post("<%=path%>/zyry!getSydwListByUser.do",{},
		function (data, textStatus){
			createSelect("szdw",data.sydwlist,"200px",false,"<%=path%>","szdw");
	},"JSON");
	$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
		function (data, textStatus){
			$STONE.creatSelectMenu("shidaima,quxiandaima,xiangzhendaima",data.dicDatas,"200px",true,"<%=path%>");
	},"JSON");
}
function setInputValue(obj){
	$("#"+obj.id).attr("value",obj.value);
}

function createSelect(selectId,options,height,ld,path,type){
		var selectIdArr = selectId.split(",");
		for(var i in selectIdArr){
			$("#"+selectIdArr[i]).selectmenu();
		}
		var select = $("#"+selectIdArr[0]);
		var sltValue = select.attr("sltValue");
		//因selectMenu插件本身存在问题，必须得把控件重新添加，才能做级联
		select.empty();
		select.css("display","inline");
		$("#"+selectIdArr[0]+"-button").remove();
		var selectHtml = $("#"+selectIdArr[0]+"_div").html();
		$("#"+selectIdArr[0]+"_div").html(selectHtml);
		select = $("#"+selectIdArr[0]);
		select.append("<option value = ''></option>"); 
		for(var i in options){
			if(type == "zhonglei"){
				select.append("<option value = '"+options[i].name+"'>"+options[i].name+"</option>"); 
			}else if(type == "szdw"){
				select.append("<option value = '"+options[i].id+"'>"+options[i].dwmc+"</option>"); 
			}
		}
		select.selectmenu().selectmenu("menuWidget").css("height",height);
	}
	</script>
</head>

<body>
  <div id="search_div" class="mod-search cf">
	<form name="frm_rygl_zyry_xkz_search_conditions" id="frm_rygl_zyry_xkz_search_conditions">
	  	<table class="tab">
					<tr>
						<th style="width: 15%">姓名:</th>
						<td style="width: 35%">
							<input class="ui-input long98" name="xingming" onkeyup="setInputValue(this)"  id="xingming" />
						</td>
						<th style="width: 15%">性别:</th>
						<td style="width: 35%">
							<select name="xingbie" style="width: 179px;" id="xingbie">
								<option value=""></option>
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
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
			  				<div id="quxiandaima_div">
			       				<select name="quxiandaima" class="long90" id="quxiandaima" ></select>
			  				</div>
			  			</td>
					</tr>
					<tr>
			  			<th>所在乡镇</th>
			  			<td>
			  				<div id="xiangzhendaima_div">
			       				<select name="xiangzhendaima" class="long90" id="xiangzhendaima" ></select>
			  				</div>
			  			</td>
						<th>证书编号:</th>
						<td><input class="ui-input long98" name="zhengshubianhao" onkeyup="setInputValue(this)" id="xkzbh"></td>
					</tr>
					<tr>
						<th>身份证号:</th>
						<td>
							<input class="ui-input long98" name="shenfenzhenghao" onkeyup="setInputValue(this)" id="sfzh">
						</td>
						<th>发证机关:</th>
						<td>
							<input class="ui-input long98" name="fazhengjiguan" onkeyup="setInputValue(this)" id="fzjg"/>
						</td>
					</tr>
					<tr>
						<th >新作业种类:</th>
						<td >
							<div id="zhonglei_div">
								<select name="zuoyezhonglei" style="width: 179px;" id="zhonglei"></select>
							</div>
						</td>
						<th>发证日期 :</th>
						<td>
							<input class="ui-input" name="fazhengriqi_ks" style="width: 80px" onclick="WdatePicker()" onchange="setInputValue(this)" id="fzrq_ks">-
							<input class="ui-input" name="fazhengriqi_js" style="width: 80px" onclick="WdatePicker()" onchange="setInputValue(this)" id="fzrq_js">
						</td>
					</tr>
					<tr>
						<th>所在单位:</th>
						<td>
			  				<div id="szdw_div">
			       				<select name="sydwid" class="long90" id="szdw" ></select>
			  				</div>
						</td>
						<th>证书有效期 :</th>
						<td>
							<input class="ui-input" name="youxiaoqi_ks" style="width: 80px" onclick="WdatePicker()" onchange="setInputValue(this)" id="qzsj_ks">-
							<input class="ui-input" name="youxiaoqi_js" style="width: 80px" onclick="WdatePicker()" onchange="setInputValue(this)" id="qzsj_js">
						</td>
					</tr>
	  	</table>
	  </form>
  </div>
</body>
</html>