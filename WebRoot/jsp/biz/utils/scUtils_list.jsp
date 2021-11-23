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
					    width: '750px',
					    height: '350px',
					    lock: true,
					    content: 'url:<%=path%>/scUtils!openDwInfo.do?id='+id
				});
		}
		function editZzzs(id,dwmc){
			$.post("<%=path%>/scUtils!getZzzsMenuId.do",{mid:"${param.mid}"},
				function(data){
					var url = "<%=path%>/jsp/biz/utils/scUtils_li_list.jsp?fid="+id+"&mid="+data.zid;
					parent.addTabsItem("utils_li_list_"+id,dwmc+"资质证书列表",url);
			},"JSON");
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
			$("#Toolbar").delegate("#mnubtn_sc_utils_add","click",function(){
				$.dialog({
						title:'新增单位',
					    width: '750px',
					    height: '350px',
					    lock: true,
					    content: 'url:<%=path%>/jsp/biz/utils/scUtils_add.jsp'
				});
			});
			//约谈
			$("#Toolbar").delegate("#mnubtn_sc_utils_yuetan","click",function(){
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
					    content: 'url:<%=path%>/jsp/biz/utils/utils_yuetan_add.jsp?dwid='+ids+'&dwtype=sc'
				});
			});
			//监察指令书
			$("#Toolbar").delegate("#mnubtn_sc_utils_jczls","click",function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择单位！");
					return false;
				}
				$.dialog({
						title:'监察指令书',
					    width: '550px',
					    height: '250px',
					    lock: true,
					    content: 'url:<%=path%>/jsp/biz/utils/utils_jczls_add.jsp?dwid='+ids+'&dwtype=sc'
				});
			});
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
			//删除
			$("#Toolbar").delegate("#mnubtn_sc_utils_del","click",function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择要删除的单位！");
					return false;
				}
				$.dialog.confirm("确实要删除选中的单位吗?", function(){  
						parent.showMask("正在删除......");
	                	$.post("<%=path%>/scUtils!delete.do?ids="+ids,{},
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
<script src="<%=path %>/js/bs/utils/scdw_list.js"></script>