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
  <!-- 设备导出备用方法 -->
  <form id="myForm" method="post"  style="display: none;"  enctype="multipart/form-data">
  </form>
 	</div>
</body>
</html>
	<!-- 脚本 -->
	<script type="text/javascript">
var zdycxtj;
var cxtj;
var zldm = "";
var title = "";
var searchForm = "";
var strParams = "";
var columns = "";
	var path = "<%=path %>";
	var zt = "${param.zt}";
	var sydwid = "${param.sydwid}";
	var zst = "${param.zcstatus}";
	var ty = "${param.ty}";
	var gd = "${param.gd}";
	
	if(zt == 'ls'){
		$('#baozhi_search1').hide();
	}
	
		/**JavaScript函数声明*/
		//编辑设备信息方法
		function editSe(id,djzbh){
			var url = "<%=path%>/jsp/biz/sbxx/sbxx_list.jsp?zt=${param.zt}&zcstatus=${param.zcstatus}&ty=${param.ty}&gd=${param.gd}&djzbh="+djzbh;
			parent.addTabsItem("sbxx_list_djz_gr_list",djzbh+"_"+id,url);
		}
		
		/**页面元素事件注册*/
		$().ready(function(){
			//查询菜单
			$.post("<%=path%>/menuList!getButtonByParent.do",{mid:"${param.mid}",qtip:"${param.qtip}"},
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
					    width: '900px',
					    height: '450px',
					    min:true,
					    cache:false,
					    autoOpen: false,
					    close:function(){
							cxtj.content.closeBefore();
						},
					    content: 'url:<%=path%>/jsp/biz/sbxx/jcsj_list_search.jsp?zt='+zt
				});
			});
			
			//自定义查询条件
			$('#baozhi_search1').click(function(){
				
				zdycxtj = $.dialog({
						title:'自定义查询',
					    width: '900px',
					    height: '450px',
					    min:true,
					    cache:false,
					    autoOpen: false,
					    close:function(){
							zdycxtj.content.closeBefore();
						},
					    content: 'url:<%=path%>/jsp/biz/sbxx/jcsj_list_zdy_search.jsp'
				});
			});
			
			//管道 按使用登记证查看
			$("#Toolbar").delegate("#mnubtn_jcsj_sb_yty_djzck","click",function(){
				var url = "<%=path%>/jsp/biz/sbxx/sbxx_gd_djz_ck_list.jsp?zt=${param.zt}&zcstatus=${param.zcstatus}&ty=${param.ty}&gd=${param.gd}";
				parent.addTabsItem("sbxx_list_djz_gr","按使用登记证查看",url);
			});
		})//结束
		
//查询
function search(params){
	strParams = JSON.stringify(params);
	$STONE.sc_setGridQueryParams("#grid",params);
}
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	//导出Excle
	function expSe(){
				var url = "<%=path%>/seList!getListForZhuCe.do?zt="+zt+"&ty="+ty+"&zcstatus="+zst+"&gd=${param.gd}&sydwid="+sydwid+"&expExcel=exp&columns="+columns;
				var ids = $STONE.getCheckGridIds("grid");
				if(ids != ""){
					url += "&ids="+ids;
				}else if(strParams != ""){
					var dcParam = "";
					var params = strParams;
					params = params.substring(1,params.length-1);
					var paramArr = params.split(",");
				
					for(var i = 0;i<paramArr.length;i++){
						var val = paramArr[i].split(":")[1].replace("\"","").replace("\"","");
						if(val == "" || val == null){
							continue;
						}
						dcParam += "&"+paramArr[i].split(":")[0].replace("\"","").replace("\"","")+"="+val;
					}
					
					url += encodeURI(encodeURI(dcParam));
				}
				parent.document.getElementById("downloadFile").src = url;
	}
	
	</script>
	
<script src="<%=path %>/js/bs/sbxx/sbxx_gd_djz_ck_list.js"></script>