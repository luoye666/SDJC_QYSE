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
<script type="text/javascript" src="../../js/plugin/ztree/jquery.ztree.core-3.5.js"></script>
  <SCRIPT type="text/javascript" >
  	var zTree, rMenu;
	var setting = {
			view: {
				selectedMulti: false
			},
			async: {
				enable: true,
				url:"<%=path%>/menuList!getGridList.do",
				autoParam:["id"]
			},
			callback: {
				beforeClick: beforeClick,
				beforeAsync: beforeAsync,
				onAsyncError: onAsyncError,
				onAsyncSuccess: onAsyncSuccess,
				onRightClick: OnRightClick
			}
	};
		function beforeClick(treeId, treeNode) {
			self.parent.frames["showMenuManager"].location="<%=path%>/menu!getMenuInfo.do?id="+treeNode.id;
		}
		function beforeAsync(treeId, treeNode) {
			return true;
		}
		function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
		//	alert("error");
		}
		function onAsyncSuccess(event, treeId, treeNode, msg) {
		}
		function OnRightClick(event, treeId, treeNode) {
			if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
				zTree.cancelSelectedNode();
				showRMenu("root", event.clientX, event.clientY);
			} else if (treeNode && !treeNode.noR) {
				zTree.selectNode(treeNode);
				showRMenu("node", event.clientX, event.clientY);
			}
		}
		function showRMenu(type, x, y) {
			$("#rMenu ul").show();
			if (type=="root") {
				$("#m_del").hide();
				$("#m_check").hide();
				$("#m_unCheck").hide();
			} else {
				$("#m_del").show();
				$("#m_check").show();
				$("#m_unCheck").show();
			}
			rMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});

			$("body").bind("mousedown", onBodyMouseDown);
		}
		function hideRMenu() {
			if (rMenu) rMenu.css({"visibility": "hidden"});
			$("body").unbind("mousedown", onBodyMouseDown);
		}
		function onBodyMouseDown(event){
			if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
				rMenu.css({"visibility" : "hidden"});
			}
		}
		function addTreeNode() {
			hideRMenu();
			var nodes = zTree.getSelectedNodes();
			var url = "<%=path%>/jsp/sys/menuManager_addMenu.jsp?pid=";
			var pid = "";
			if(nodes.length>0){
				pid = nodes[0].id;
			}
			self.parent.frames["showMenuManager"].location=url+pid;
		}

		function removeTreeNode() {
			hideRMenu();
			var nodes = zTree.getSelectedNodes();
			if (nodes && nodes.length>0) {
				var msg = "确定要删除吗？";
				if (confirm(msg)==true){
					$.post("<%=path%>/menu!deleteByIds.do?ids="+nodes[0].id,
			    		function (data, textStatus){
							zTree.removeNode(nodes[0]);
			    	},"JSON");
				}
			}
		}
		//修改菜单名称  异步修改
	function updMenuName(name){
		var zTree = $.fn.zTree.getZTreeObj("tree"),
		nodes = zTree.getSelectedNodes();
		if (nodes.length != 0) {
			nodes[0].name = name;
			zTree.updateNode(nodes[0]);
		}
	}
		//添加菜单名称  异步添加
	function addMenuName(node){
		zTree.addNodes(zTree.getSelectedNodes()[0],node);
		zTree.cancelSelectedNode();
	}
		
	$(document).ready(function(){
		$.fn.zTree.init($("#tree"), setting);
		zTree = $.fn.zTree.getZTreeObj("tree");
		rMenu = $("#rMenu");
	});

  </SCRIPT>
 </HEAD>

<BODY>
	<ul id="tree" class="ztree" style="overflow:auto;"></ul>
	<div id="rMenu">
		<ul>
			<li id="m_add" onclick="addTreeNode();">增加菜单</li>
			<li id="m_del" onclick="removeTreeNode();">删除菜单</li>
		</ul>
	</div>
</BODY>
</HTML>
