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
	  <div class="mod-search cf" id="Toolbar">
	  	<a class="ui-btn ui-btn-sp" id="zcdj_sel_sydw_ok">确认</a>
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
	var api = frameElement.api,W = api.opener;
	var path = "<%=path %>";
		/**页面元素事件注册*/
		$().ready(function(){
			$("#zcdj_sel_sydw_ok").click(function(){
				var id = $STONE.getCheckGridIds("grid");
				if(id == ""){
					$.dialog.alert('请选择单位!');
					return false;
				}
				if(id.length != 1){
					$.dialog.alert('只能选择一个单位!');
					return false;
				}
				if("${param.type}" == "dr"){
					W.drZyry(id);
				}else if("${param.type}" == "add"){
					W.addZyry(id);
				}
				api.close();
			});
		})
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	</script>
<script src="<%=path %>/js/bs/zcdj/zcdj_sel_sydw_list.js"></script>