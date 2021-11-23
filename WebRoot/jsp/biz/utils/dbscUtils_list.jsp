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
	    <a style="float:right;" class="ui-btn" id="baozhi_search">查询条件</a>
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
	
	var cxtj;
	var searchForm = "";
	var path = "<%=path %>";
		function editSc(id){
				$.dialog({
						title:'单位信息',
					    width: '400px',
					    height: '500px',
					    lock: true,
					    content: 'url:<%=path%>/dbaList!openDwInfo.do?id='+id
				});
		}
		
		
		/**页面元素事件注册*/
		$().ready(function(){
			
			//查询菜单
			$.post("<%=path%>/menuList!getButtonByParent.do",{mid:"${param.mid}"},
				function(data){
					data = data.list;
					var btnHtml = "";
					for(var i = 0;i<data.length;i++){
						btnHtml += '<a class="'+data[i].style_class+'" id="'+data[i].tabid+'">'+data[i].title+'</a>';
					}
					$("#Toolbar").prepend(btnHtml);
			},"JSON");
			//查询条件
			$('#baozhi_search').click(function(){
				cxtj = $.dialog({
						title:'查询条件',
					    width: '750px',
					    height: '350px',
					    min:true,
					    close:function(){
							cxtj.content.closeBefore();
						},
					    content: 'url:<%=path%>/jsp/biz/utils/scUtils_list_search.jsp'
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
	</script>
<script src="<%=path %>/js/bs/utils/dbscdw_list.js"></script>