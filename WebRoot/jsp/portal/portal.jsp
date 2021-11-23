<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="portal.css">
	<style type="text/css">
		.title{
			font-size:16px;
			font-weight:bold;
			padding:20px 10px;
			background:#eee;
			overflow:hidden;
			border-bottom:1px solid #ccc;
		}
		.t-list{
			padding:5px;
		}
	</style>
	<script type="text/javascript" src="<%=path%>/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="jquery.portal.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#pp').portal({
				border:false,
				fit:true
			});
			
			addPanel();
		});
		
		function addPanel(){
			$.ajax({
				url:'portal.json',
				success:function(data){
					var p = eval("("+data+")");
					$.each(p,function(i,panel){
						$.each(panel,function(j,option){
							var p = $('<div/>').appendTo('body');
							option["onClose"] = getLayout;
							p.panel(option);
							$('#pp').portal('add', {
								panel:p,
								columnIndex:i
							});
						});
					});
					$('#pp').portal('resize');
				}
			});
	 }
	
	function getLayout(){
		var portalLayot =$('#pp').portal("getLayout");
	}
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
		<div id="pp" style="position:relative">
			<div style="width:50%;">
			</div>
			<div style="width:50%;">
			</div>
		</div>
	</div>
</body>
</html>