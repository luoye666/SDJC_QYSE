<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
 <HEAD>
	<jsp:include page="/jsp/common/include.jsp"></jsp:include>
  <link rel="stylesheet" href="../../css/zTreeStyle/zTreeStyle.css" type="text/css">
  <style>
	body {
	background-color: white;
	margin:0; padding:0;
	text-align: center;
	}
	div, p, table, th, td {
		list-style:none;
		margin:0; padding:0;
		color:#333; font-size:12px;
		font-family:dotum, Verdana, Arial, Helvetica, AppleGothic, sans-serif;
	}
div#rMenu {position:absolute; visibility:hidden; top:0; background-color: #555;text-align: left;padding: 2px;}
div#rMenu ul li{
	margin: 1px 0;
	padding: 0 5px;
	cursor: pointer;
	list-style: none outside none;
	background-color: #DFDFDF;
}
  </style>
<script type="text/javascript" src="../../js/plugin/ztree/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../../js/plugin/ztree/jquery.ztree.core-3.5.js"></script>
  <SCRIPT type="text/javascript" >
  	var zTree;
	var setting = {
			view: {
				selectedMulti: false
			},
			async: {
				enable: true,
				url:"<%=path%>/organList!getGridList.do",
				autoParam:["id"]
			},
			callback: {
				beforeClick: beforeClick,
				beforeAsync: beforeAsync,
				onAsyncError: onAsyncError,
				onAsyncSuccess: onAsyncSuccess,
			}
	};
		function beforeClick(treeId, treeNode) {
			self.parent.frames["showUserManager"].location="<%=path%>/jsp/sys/userManager.jsp?organId="+treeNode.id;
		}
		function beforeAsync(treeId, treeNode) {
			return true;
		}
		function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
		//	alert("error");
		}
		function onAsyncSuccess(event, treeId, treeNode, msg) {
		}

	$(document).ready(function(){
		$.fn.zTree.init($("#tree"), setting);
		zTree = $.fn.zTree.getZTreeObj("tree");
	});

  </SCRIPT>
 </HEAD>

<BODY>
	<ul id="tree" class="ztree" style="overflow:auto;"></ul>
</BODY>
</HTML>
