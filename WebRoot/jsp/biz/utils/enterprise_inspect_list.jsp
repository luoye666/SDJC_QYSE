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
	  	<a class="ui-btn ui-btn-sp" id="mnubtn_enterprise_inspect_add">新建企业自查信息</a>
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
	var columns = "";
	var path = "<%=path %>";
	var strParams = "";
	var type = "${param.type}";
	var title = "企业自查信息";
	
	if(type== "2"){
		$('#mnubtn_enterprise_inspect_add').text("新建设备自查信息");
		title = "设备自查信息";
	}else if(type== "3"){
		$('#mnubtn_enterprise_inspect_add').text("新建责任清单信息");
		title = "责任清单信息";
	}else if(type== "4"){
		$('#mnubtn_enterprise_inspect_add').text("新建风险管理信息");
		title = "风险管理信息";
	}else if(type== "5"){
		$('#mnubtn_enterprise_inspect_add').text("新建隐患管理");
		title = "隐患管理信息";
	}else if(type== "6"){
		$('#mnubtn_enterprise_inspect_add').text("新建应急演练");
		title = "应急演练信息";
	}
		//编辑企业自查信息
		function editInspect(id){
			$.dialog({
				title:title,
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
						title:title,
					    width: '750px',
					    height: '350px',
					    min:true,
					    content: 'url:<%=path%>/jsp/biz/utils/enterprise_inspect_add.jsp?type='+type
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
	</script>
<script src="<%=path %>/js/bs/utils/enterprise_inspect_list.js"></script>