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
	  	<a class="ui-btn ui-btn-sp" id="rygl_add">增加</a><a class="ui-btn ui-btn-sp" id="rygl_del">删除</a><a class="ui-btn ui-btn-sp" id="rygl_xzmb">下载导入模板</a><a class="ui-btn ui-btn-sp" id="rygl_dr">导入人员</a>
	    <a style="float:right;" class="ui-btn" id="baozhi_search">查询条件</a>
	  </div>
 	
  <div class="grid-wrap">
    <table id="grid">
    </table>
    <div id="page"></div>
  </div>
  <!-- 颜色显示 -->
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="20px" bgcolor="#008000" nowrap style="border-bottom:2px solid white"></td>
			<td width="150px"  nowrap><font color="#008000">合格</font></td>
			
			<td width="20px" bgcolor="#996600" nowrap style="border-bottom:2px solid white"></td>
			<td width="150px" nowrap><font color="#996600">到达预警时间</font></td>
			
			<td width="20px" bgcolor="#660033" nowrap style="border-bottom:2px solid white"></td>
			<td width="150px"  nowrap><font color="#660033">超期</font></td>
			
			<td width="50%"></td>
		</tr>
	</table>
	</div>
	<iframe id="downloadFile" height="0" width="0" src="" style="display: none;"></iframe>
	</body>
	</html>
	<!-- 脚本 -->
	<script type="text/javascript">
	var fid = "${param.fid}";
	var cxtj;
	var searchForm = "";
	var path = "<%=path %>";
	var editRy = "NO";
	var sydwid = "${param.sydwid}";
		
		//编辑许可证方法
		function editRyXkz(id){
				$.dialog({
						title:'编辑人员',
					    width: '1000px',
					    height: '280px',
					    lock: true,
					    content: 'url:<%=path%>/zyry!openRyXkzInfo.do?id='+id
				});
		}
		
		function datePlas(v){
			if(v == null){
				return false;
			}
			var ps = v.split(" ");
			var pd = ps[0].split("-");
			var pt = ps.length>1 ? ps[1].split(":"): [0,0,0];
			var daa = new Date(pd[0],pd[1]-1,pd[2],pt[0],pt[1],pt[2]);
			return daa;
		}
		
		/**页面元素事件注册*/
		$().ready(function(){
			//添加许可证员按钮点击
			$("#Toolbar").delegate("#rygl_add","click",function(){
				$.dialog({
					title:'选择使用单位',
					width: '650px',
					height: '400px',
					lock:true,
					content: 'url:<%=path%>/jsp/biz/rygl/zuoyerenyuan_check_sydw.jsp?type=add'
				});
			});
			
			//删除人员许可证按钮点击
			$("#Toolbar").delegate("#rygl_del","click",function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择要删除的人员！");
					return false;
				}
				$.dialog.confirm("确定要删除选择的人员吗?", function(){  
	               	$.post("<%=path%>/zyry!deleteByXkz.do?ids="+ids,{},
	        			function (data, textStatus){
	               			reloadGrid();
	        		});
	            }); 
			});
			
			//下载导入模板
			$("#Toolbar").delegate("#rygl_xzmb","click",function(){
				document.getElementById("downloadFile").src="<%=path%>/zyry!downloadFile.do?path="+encodeURI(encodeURI("/zuoyerenyuan_daoru/企业端人员导入.xls"));
			});
			//导入许可证按钮点击
			$("#Toolbar").delegate("#rygl_dr","click",function(){
				$.dialog({
					title:'选择使用单位',
					width: '650px',
					height: '400px',
					lock:true,
					content: 'url:<%=path%>/jsp/biz/rygl/zuoyerenyuan_check_sydw.jsp?type=dr'
				});
			});
		//查询条件
		$("#baozhi_search").click(function(){
			if(cxtj == undefined){
				cxtj = $.dialog({
						title:'查询条件',
					    width: '650px',
					    height: '400px',
						min:true,
					    close:function(){
							this.hide();
							return false;
						},
					    content: 'url:<%=path%>/jsp/biz/rygl/zuoyerenyuan_list_search.jsp'
				});
			}else{
				cxtj.show();
			}
		});
			
	})
		
//查询
function search(params){
	$STONE.sc_setGridQueryParams("#grid",params);
}
	function drZyry(sydwid){
		$.dialog({
			title:'导入人员',
			lock: true,
			width: '550px',
			height: '150px',
			content: 'url:<%=path%>/jsp/biz/rygl/SimpleFileUpload_Zyry.jsp?sydwid='+sydwid
		}); 
	}
	function addZyry(sydwid){
		$.dialog({
			title:'添加人员',
			width: '1000px',
			height: '280px',
			lock: true,
			content: 'url:<%=path%>/jsp/biz/rygl/zuoyerenyuan_add.jsp?sydwid='+sydwid
		});
	}
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	</script>
<script src="<%=path %>/js/bs/ryxx/zyry_list.js"></script>