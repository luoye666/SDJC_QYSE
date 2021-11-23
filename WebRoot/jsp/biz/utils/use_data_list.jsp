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
	var columns = "";
	var path = "<%=path %>";
	var strParams = "";
	var type = "${param.type}";
		//编辑企业自查信息
		function editInspect(id){
			$.dialog({
				title:'企业自查信息',
			    width: '750px',
			    height: '350px',
			    min:true,
			    content: 'url:<%=path%>/syUtils!findEnterpriseInspect.do?id='+id
		 });
		}
		
		/**页面元素事件注册*/
		$().ready(function(){
			//查询条件
			$('#baozhi_search').click(function(){
				$.dialog({
						title:'查询条件',
					    width: '550px',
					    height: '200px',
					    min:true,
					    content: 'url:<%=path%>/jsp/biz/utils/enterprise_inspect_list_search.jsp'
				 });
			});
			
			//新建企业自查信息
			$('#mnubtn_enterprise_inspect_add').click(function(){
				$.dialog({
						title:'企业自查信息',
					    width: '750px',
					    height: '350px',
					    min:true,
					    content: 'url:<%=path%>/jsp/biz/utils/enterprise_inspect_add.jsp'
				 });
			});
			
	    	
		})
	
	//查询
	function search(params){
		strParams = JSON.stringify(params);
		$STONE.sc_setGridQueryParams("#grid",params);
	}
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	
	function openFile(path,type){
		$.post("<%=path%>/syUtils!saveUseDataNum.do?type="+type,
    			function (data, textStatus){
				parent.downloadFile(path);
    	   },"JSON");
	}
	
	function openWin(path,type){
		$.post("<%=path%>/syUtils!saveUseDataNum.do?type="+type,
    			function (data, textStatus){
			window.open(path);
    	   },"JSON");
		
	}
	function openVed(path,type){
		//http://218.57.139.17:9070/QYSE/jsp/biz/utils/vedioH5.html
		$.post("<%=path%>/syUtils!saveUseDataNum.do?type="+type,
    			function (data, textStatus){
			window.open("http://218.57.139.17:9070/QYSE/jsp/biz/utils/vedioH5.html?path="+path);
    	   },"JSON");
		
	}
	
	</script>
<script src="<%=path %>/js/bs/utils/use_data_list.js"></script>