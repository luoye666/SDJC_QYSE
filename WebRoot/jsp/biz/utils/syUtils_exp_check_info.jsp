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
		<div>
		<br/>
			<!-- 条件筛选--> 
			<form name="frm_sydw_dc_info" id="frm_sydw_dc_info" method="POST">
				<table style="width: 95%" id="tab">
					<tr>
						<td>
							<input type="checkbox" value="使用单位|dwmc" name="columns" />使用单位
						</td>
						<td>
							<input type="checkbox" value="使用单位代码|jgdm" name="columns" />使用单位代码
						</td>
						<td>
							<input type="checkbox" value="使用单位地址|dwdz" name="columns" />使用单位地址
						</td>
						<td>
							<input type="checkbox" value="安全管理人员|lxr" name="columns" />安全管理人员
						</td>
						<td>
							<input type="checkbox" value="联系电话|lxdh" name="columns" />联系电话
						</td>
						<td>
							<input type="checkbox" value="区县|quxian" name="columns" />区县
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" value="乡镇|xiangzhen" name="columns" />乡镇
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
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
		W.columns = value;
		W.expSydw();
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