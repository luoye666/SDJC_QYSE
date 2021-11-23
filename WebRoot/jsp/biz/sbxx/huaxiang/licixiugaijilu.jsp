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
var seid = "${param.id}";
var path = "<%=path %>";
		
		/**页面元素事件注册*/
		$().ready(function(){
			
		})
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}

		//编辑
		function editDb(id,dataid,type){
			
			if("设备" == type){
				var url = '<%=path%>/db!openDbInfo.do?id='+id+'&dataid='+dataid+'&type='+encodeURI(encodeURI(type));
				parent.parent.addTabsItem("db_sbxx_list_edit_"+id,type+"_"+id,url);
			}else{
				$.dialog({
						title:'编辑',
					    width: '650px',
					    height: '350px',
					    lock: true,
					    content: 'url:<%=path%>/db!openDbInfo.do?id='+id+'&dataid='+dataid+'&type='+encodeURI(encodeURI(type))
				});
			}
		}
	</script>
<script src="<%=path %>/js/bs/sbxx/huaxiang/licixiugaijilu.js"></script>