<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
</head>
<body>
	<div class="wrapper">
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_addDownload_add">添加</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_delDownload_add">删除</a>
	  </div>

	  <div class="grid-wrap">
	    <table id="grid">
	    </table>
    	<div id="page"></div>
	  </div>
	</div>
</body>
</html>	
	<!-- 脚本 -->
	<script type="text/javascript">
	
	var path = "<%=path %>";
		//编辑人员方法
		function editDownload_add(id){
				$.dialog({
						title:'文件信息',
					    width: '550px',
					    height: '200px',
					    lock: true,
					    content: 'url:<%=path%>/jsp/Download_add/Download_add_edit.jsp?id='+id
				});
		}
		
		/**页面所需资源初始化*/
		$().ready(function(){
			//添加
			$("#mnubtn_addDownload_add").click(function(){
				$.dialog({
						title:'添加文件',
					    width: '550px',
					    height: '200px',
					    lock: true,
					    content: 'url:<%=path%>/jsp/message/download_add.jsp'
				});
			});
			
			//删除按钮点击
			$("#mnubtn_delDownload_add").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择要删除的项目！");
					return false;
				}
				$.dialog.confirm("确定要删除选择的数据吗?", function(){  
	                $.post("<%=path%>/downloadBox!deleteByIds.do?ids="+ids,{},
	        			function (data, textStatus){
	                		reloadGrid();
	        		});
	            });  
			});
			
		})
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	</script>
<script src="<%=path %>/js/bs/message/cyxz_list.js"></script>