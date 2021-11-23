<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	.long98{
		width: 98%
	}
	#tab{
		text-align: center;
		border-collapse:collapse; 
		margin:0 0 0 10px;
	}
	#tab td{
		width: 15%;
		text-align:left;
		border:1px black solid;
		font-size:12px;
		margin:0px; 
		padding:0 0 0 20px;
		height: 30px;
	}
	
</style>
</head>
<body>
	<div class="wrapper">
	</div>
	<!-- Grid工具栏 -->
	<div id="" class="tlb_baseGrid">
		<div><br/>
			<!-- 条件筛选--> 
			<form name="frm_se_upd_cqdw" id="frm_se_upd_cqdw" method="POST">
				<table style="width: 95%" id="tab">
				</table>
			</form>
		</div>
	</div>
</body>
</html>
	<!-- 脚本 -->
	<script type="text/javascript">
	
var api = frameElement.api, W = api.opener;
api.button(
	{
	    id:'valueDc',
		name:'导出',
		callback:daochu
	},{
	    id:'valueQx',
		name:'全选',
		callback:quanxuan
	},{
	    id:'valueQxQx',
		name:'取消全选',
		callback:quxiaoquanxuan
	},{
	    id:'valueGb',
		name:'关闭'
	}
);
	$().ready(function(){
		W.parent.showMask("正在加载......");
		$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SBDCL"},
		      function (data, textStatus){
				data = data.dicDatas;
				var colnum = 6;
				var chk = "<tr>";
				for(var i = 0;i<data.length;i++){
					chk += '<td><input type="checkbox" value="'+data[i].id+'" name="columns" />'+data[i].name+"</td>";
					if((i+1)%colnum == 0){
						$("#tab").append(chk+"</tr>");
						chk = "<tr>";
					}
				}
				if(data.length%colnum){
					for(var i = 0;i<colnum-(data.length%colnum);i++){
						chk += "<td></td>";
					}
					$("#tab").append(chk+"</tr>");
				}
				W.parent.hideMask();
		},"JSON");
	});
	 function daochu(){
		var value = "";
		var inputCk = $("[name='columns']:checked");
		if(inputCk.length == 0){
			$.dialog.alert('请选择要导出的数据!');
			return false;
		}
		$(inputCk).each(function(){
			value += $(this).val()+",";
		});
		W.columns = value.substring(0,value.length-1);
		W.expSe();
		return false;
	 }
	 function quanxuan(){
		 $("[name='columns']").prop("checked",true);
		 return false;
	 }
	 function quxiaoquanxuan(){
		 $("[name='columns']").prop("checked",false);
		 return false;
	 }
	</script>