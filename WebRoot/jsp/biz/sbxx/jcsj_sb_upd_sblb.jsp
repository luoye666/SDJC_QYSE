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
	.tab th{
		width: 15%;
		text-align: right;
	}
	.tab td{
		width: 35%;
	}
	p{
		color:red;
		display: none;
	}
</style>
</head>
<body>
	<div class="wrapper">
	</div>
	<!-- Grid工具栏 -->
	<div id="" class="tlb_baseGrid">
		<div>
			<!-- 条件筛选--> 
			<form name="frm_se_pl_upd_sblb" id="frm_se_pl_upd_sblb" method="POST">
				<table style="width: 98%">
					<tr>
						<th>设备类别：</th>  
						<td>
							<div id="sblb_div">
								<select name="shebeileibiedaima" style="width: 179px;" id="sblb" ></select>
							</div>
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
	    id:'valueTj',
		name:'确认',
		callback:tijiao
	},{
	    id:'valueQx',
		name:'取消'
	}
);
$().ready(function(){
	//生成级联下拉框
	$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"${param.sbzldm}"},
		function (data, textStatus){
			$STONE.creatSelectMenuBySeType("sblb",data.dirDatas,"200px",false,"<%=path%>");
	},"JSON");
	
	appendSelTo();
	
});
	 function tijiao(){
			var options = {
				url:"<%=path%>/se!updPLXGSBLB.do?ids=${param.ids}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					W.parent.showMask("正在提交......");
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">修改成功!</font>',3,'success.gif');
						W.reloadGrid();
						setTimeout(function(){
							api.hide();
						}, 1000 );
	            	}else{
						$.dialog.tips('<font color="blue">修改不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_se_pl_upd_sblb").ajaxSubmit(options);
	         return false;
	 }
	</script>