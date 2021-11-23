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
	  	<a class="ui-btn ui-btn-sp" onclick="updSydw('fg')">覆盖单位</a><a class="ui-btn ui-btn-sp" onclick="updSydw('zj')">追加单位</a>
	    <a style="float:right;" class="ui-btn" id="sydw_search">查询条件</a>
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
	var cxtj;
	var searchForm = "";
	var path = "<%=path %>";
	api.max();
		/**页面元素事件注册*/
		$().ready(function(){
			//查询条件
			$('#sydw_search').click(function(){
				cxtj = $.dialog({
						title:'查询条件',
					    width: '750px',
					    height: '350px',
					    min:true,
					    close:function(){
							cxtj.content.closeBefore();
						},
					    content: 'url:<%=path%>/jsp/sys/userManager_check_sydw_search.jsp'
				});
			});
		})
	
//查询
function search(params){
	$STONE.sc_setGridQueryParams("#grid",params);
}
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	function updSydw(type){
		var ids = $STONE.getCheckGridIds("grid");
		W.updateSydwId(ids,type);
	}
	</script>
<script src="<%=path %>/js/bs/sys/user_check_sydw_list.js"></script>