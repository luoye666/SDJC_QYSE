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
	var path = "<%=path %>";
		/**JavaScript全局变量声明*/
		/**JavaScript函数声明*/
		//编辑设备信息方法
		function editGzs(id,azdw){
			var url = "<%=path%>/jsp/biz/jcgl/kggz_list.jsp?azdwid="+id;
			parent.addTabsItem("sbxx_list_edit_"+id,azdw,url);
		}
		function editAz(id){
				$.dialog({
						title:'单位信息',
					    width: '750px',
					    height: '400px',
					    lock: true,
					    content: 'url:<%=path%>/azUtils!openDwInfo.do?id='+id
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
			//新增
			$("#Toolbar").delegate("#mnubtn_az_utils_add","click",function(){
				$.dialog({
						title:'新增单位',
					    width: '750px',
					    height: '400px',
					    lock: true,
					    content: 'url:<%=path%>/jsp/biz/utils/azUtils_add.jsp'
				});
			});
			//约谈
			$("#Toolbar").delegate("#mnubtn_az_utils_yuetan","click",function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择要约谈的单位！");
					return false;
				}
				$.dialog({
						title:'约谈',
					    width: '750px',
					    height: '250px',
					    lock: true,
					    content: 'url:<%=path%>/jsp/biz/utils/utils_yuetan_add.jsp?dwid='+ids+'&dwtype=az'
				});
			});
			//监察指令书
			$("#Toolbar").delegate("#mnubtn_az_utils_jczls","click",function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择单位！");
					return false;
				}
				$.dialog({
						title:'监察指令书',
					    width: '550px',
					    height: '250px',
					    min:true,
					    lock: true,
					    content: 'url:<%=path%>/jsp/biz/utils/utils_jczls_add.jsp?dwid='+ids+'&dwtype=az'
				});
			});
			//查询条件
			$('#baozhi_search').click(function(){
				cxtj = $.dialog({
						title:'查询条件',
					    width: '750px',
					    height: '350px',
					    close:function(){
							cxtj.content.closeBefore();
						},
					    content: 'url:<%=path%>/jsp/biz/utils/azUtils_list_search.jsp'
				});
			});
			//删除
			$("#Toolbar").delegate("#mnubtn_az_utils_del","click",function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择要删除的单位！");
					return false;
				}
				$.dialog.confirm("确实要删除选中的单位吗?", function(){  
						parent.showMask("正在删除......");
	                	$.post("<%=path%>/azUtils!delete.do?ids="+ids,{},
		        				function (data, textStatus){
									parent.hideMask();
	                				if(data.result == "exit"){
										$.dialog.alert("此单位不能删除，与此单位相关检验业务正在办理中！");
	                				}else{
		                				reloadGrid();
	                				}
		        	    },"JSON");
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
<script src="<%=path %>/js/bs/utils/azdw_list.js"></script>