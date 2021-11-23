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
<style>
.ui-jqgrid tr.jqgrow td {
  white-space: normal !important;
  height:auto;
  padding-top:6px;
  padding-bottom:6px;
 }
 
	ul,li{ list-style:none:}

	a{ text-decoration: none;}

	.DivHidden{ width: 80px; border: 1px solid #CCC; border-bottom: none; z-index: 9999; display:none;position: fixed;top: 33px;}

	.DivHidden ul li{ background: #C2E0F1; text-align:center; height: 26px; line-height: 26px; border-bottom: 1px solid #CCC; position:relative;}

	.DivHidden ul li a{ color:#333;}

	.DivHidden ul li a:hover{ color:#f00;}
</style>
<body>
	<div class="wrapper">
	  <div class="mod-search cf" id="Toolbar">
	  	<a class="ui-btn ui-btn-sp" id="mnubtn_sjsh_ztqh">状态切换</a>
		<div class="DivHidden box" style="" id="mnubtn_sjsh_ztqh_div">
			<ul>
				<li><a onclick="ztqh('')">全部</a></li>
				<li><a onclick="ztqh('0')">待审核</a></li>
				<li><a onclick="ztqh('1')">已通过</a></li>
				<li><a onclick="ztqh('2')">已拒绝</a></li>
			</ul>
		</div>
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
		
		//编辑
		function editDb(id,dataid,type,shstate){
			if("设备" == type){
				var url = '<%=path%>/sjsh!openDbInfo.do?id='+id+'&dataid='+dataid+'&adr=sjsh&shstate='+shstate+'&type='+encodeURI(encodeURI(type));
				parent.addTabsItem("sjsh_sbxx_list_edit_"+id,type+"_"+id,url);
			}else{
				$.dialog({
						title:'查看',
					    width: '650px',
					    height: '350px',
					    lock: true,
					    content: 'url:<%=path%>/sjsh!openDbInfo.do?id='+id+'&dataid='+dataid+'&type='+encodeURI(encodeURI(type))
				});
			}
		}
		
		/**页面元素事件注册*/
		$().ready(function(){
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
						    content: 'url:<%=path%>/jsp/biz/sjsh/shujushenhe_list_search.jsp'
					});
				}else{
					cxtj.show();
				}
			});
			
			//悬浮
			$("#Toolbar").delegate("#mnubtn_sjsh_ztqh","mouseover",function(){
				$('#mnubtn_sjsh_ztqh_div').show();
			});
			//悬浮
			$("#Toolbar").delegate("#mnubtn_sjsh_ztqh","mouseout",function(){
				$('#mnubtn_sjsh_ztqh_div').hide();
			});
			
			$("#mnubtn_sjsh_ztqh_div").on("mouseenter", function() {
                $('#mnubtn_sjsh_ztqh_div').show();
            })
			$("#mnubtn_sjsh_ztqh_div").on("mouseleave", function() {
                $('#mnubtn_sjsh_ztqh_div').hide();
            });
			
		})
		
//查询
function search(params){
	$STONE.sc_setGridQueryParams("#grid",params);
}
	function checkYY(vl){
		$.dialog({
			title:'拒绝原因',
			width: '450px',
			height: '300px',
			lock:true,
			content: vl
		});
	}
	
	//状态切换
	function ztqh(state){
		var zt = '{"shstate":"'+state+'"}';
		$STONE.sc_setGridQueryParams("#grid",$.parseJSON(zt));
	}
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	</script>
<script src="<%=path %>/js/bs/sjsh/sjsh_list.js"></script>