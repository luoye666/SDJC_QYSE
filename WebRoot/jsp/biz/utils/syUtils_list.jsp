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
	var columns = "";
	var path = "<%=path %>";
	var strParams = "";
		//编辑设备信息方法
		function editSb(id,dwmc,type){
		//	var url = "<%=path%>/jsp/biz/sbxx/sbxx_list.jsp?qtip=sydw&zcstatus=1&ty=1&sydwid="+id;
			var url = "<%=path%>/jsp/biz/sbxx/sbxx_list.jsp?mid=1587&zcstatus=1&ty=1&sydwid="+id;
			if("gd" == type){
				url += "&gd=gd";
			}
			parent.addTabsItem("sbxx_list_edit_"+id,dwmc,url);
		}
		function editAz(id){
				$.dialog({
						title:'单位信息',
					    width: '750px',
					    height: '350px',
					    lock: true,
					    content: 'url:<%=path%>/syUtils!openDwInfo.do?id='+id
				});
		}
		//企业端上传的作业人员
		function editQyZyry(id,dwmc){
			var url = "<%=path%>/jsp/biz/rygl/zuoyerenyuan_list.jsp?sydwid="+id;
			parent.addTabsItem("rygl_list_"+id,dwmc+"_作业人员",url);
		}
		
		/**页面元素事件注册*/
		$().ready(function(){
			//查询条件
			$('#baozhi_search').click(function(){
				if(cxtj == undefined){
					cxtj = $.dialog({
							title:'查询条件',
						    width: '750px',
						    height: '350px',
						    min:true,
						    close:function(){
								this.hide();
								return false;
							},
						    content: 'url:<%=path%>/jsp/biz/utils/syUtils_list_search.jsp'
					});
				}else{
					cxtj.show();
				}
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
<script src="<%=path %>/js/bs/utils/sydw_list.js"></script>