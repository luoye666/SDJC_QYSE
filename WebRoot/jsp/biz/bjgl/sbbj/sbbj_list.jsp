<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
%>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style type="text/css">
*{padding:0;margin:0;list-style: none;}

.box{width:100%; overflow:hidden;}
.box-3 dl{ display:table; position:absolute; top:5px; right:96px; 
width:60px;
height:24px; 
box-shadow: 0 0 3px rgba(0,0,0,0.3); 
border-radius:3px;
}
.table{border-right:1px solid #000000;border-bottom:1px solid #000000} 
.table td{border-left:1px solid #000000;border-top:1px solid #000000;} 
</style>
</head>
<body class='box box-3'>
	<div class="wrapper">
	  <div class="mod-search cf" id="Toolbar">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_sbbj_info">生成报检单</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_sbbj_gwc">添加购物车</a>
	
	    <a style="float:right;" class="ui-btn" id="baozhi_search">查询条件</a>
	  </div>
 	<dl >
		<a id="xf">
			<span id="xfs"><img src="<%=path %>/images/shopping67.png" width="50%" height="26px"/></span>
			<span id="total" style="height:26px; text-align: center;">0</span>
		</a>
	</dl>
  <div class="grid-wrap">
    <table id="grid">
    </table>
    <div id="page"></div>
  </div>
  
	<!-- 颜色显示 -->
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="20px" bgcolor="#008000" nowrap style="border-bottom:2px solid white"></td>
			<td width="150px"  nowrap><font color="#008000">合格设备</font></td>
			
			<td width="20px" bgcolor="#FF9900" nowrap style="border-bottom:2px solid white"></td>
			<td width="150px" nowrap><font color="#FF9900">报检预警</font></td>
			
			<td width="20px" bgcolor="#FF0000" nowrap style="border-bottom:2px solid white"></td>
			<td width="150px"  nowrap><font color="#FF0000">超期未检</font></td>
			
			<td width="20px" bgcolor="#6600cc" nowrap style="border-bottom:2px solid white"></td>
			<td width="150px"  nowrap><font color="#6600cc">停用</font></td>
			
			<td width="20px" bgcolor="black" nowrap style="border-bottom:2px solid white"></td>
			<td width="150px"  nowrap><font color="black">报废拆除注销</font></td>
			<td width="50%"></td>
		</tr>
	</table>
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
	var sydw = "";
	var shebeizhonglei = "";
	var total = "";
	var rows = "";
	var zcdm = "";
	var djbh = "";
		/**JavaScript函数声明*/
		
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
			//悬浮
			$('.box-3 dl').each(function(){
				$(this).dragging({
					move : 'both',
					randomPosition : false
				});
			});
		
			
			$('#xf').click(function(){
				//encodeURI(encodeURI(keyText.value))
				zdycxtj = $.dialog({
							title:'报检设备',
						    width: '350px',
						    height: '450px',
						    min:true,
						    cache:false,
						    autoOpen: false,
						    content: 'url:<%=path%>/jsp/biz/bjgl/sbbj/bjd_se_gwc.jsp?rows='+encodeURI(encodeURI(rows))
					});
			  
			});
			
			
			//添加购物车
			$("#mnubtn_sbbj_gwc").click(function(){
				var ids = $STONE.getCheckGridIds("grid"); //获取选中的id
				var one = $STONE.getCheckGridRow("grid",ids[0]); //获取选中的行
				
				if(total == 50){
					$.dialog.alert("设备一次报检不得多于50台设备！");
					return false;
				}
				console.log(one.shebeizhongleidaima);
				if(one.shidaima == '3701'){
					$.dialog.alert('应济南市特检院要求，请关注微信公众号“济南市特检院”通过微信进行报检。');
					return false;
				}
				if(sydw == ""){
					sydw =  one.shiyongdanwei;
				}
				if(shebeizhonglei == ""){
					shebeizhonglei = one.shebeizhongleidaima;
				}
				if(ids == ""){
					$.dialog.alert("请选择设备！");
					if(total == ""){
						sydw = "";
						shebeizhonglei = "";
					}
					return false;
				}else if(ids.length > 0){
					for(i=0;i<ids.length;i++){
						var row = $STONE.getCheckGridRow("grid",ids[i]); //获取选中的行
						if(shebeizhonglei != row.shebeizhongleidaima){
							$.dialog.alert("请选择同一种类设备！");
							if(total == ""){
								sydw = "";
								shebeizhonglei = "";
							}
							return false;
						}
						if(sydw != row.shiyongdanwei){
							$.dialog.alert("请选择同一单位下设备！");
							if(total == ""){
								sydw = "";
								shebeizhonglei = "";
							}
							return false;
						}
						if(row.zhucedaima == ""){
							if(djbh.indexOf(row.dengjizhengbianhao) >= 0){
								$.dialog.alert(row.dengjizhengbianhao+"已在报检设备中！");
								return false;
							}
						}else{
							if(zcdm.indexOf(row.zhucedaima) >= 0){
								$.dialog.alert(row.zhucedaima+"已在报检设备中！");
								return false;
							}
						}
						
						zcdm += row.zhucedaima+",";
						djbh += row.dengjizhengbianhao+",";
						rows += "{'id':'"+ids[i]+"', 'shebeimingcheng':'"+row.shebeimingcheng+"', 'zhucedaima':'"+row.zhucedaima+"', 'dengjizhengbianhao':'"+row.dengjizhengbianhao+"'},";
					}
				}
				if(total == ""){
					total = ids.length;
				}else{
					total += ids.length;
				}
				
				$("#total").text(total);
				
				zdycxtj.content.reloadGrid("["+rows+"]");
				
				
			});
			
			 
			
			//生成报检单
			$("#mnubtn_sbbj_info").click(function(){
				var ids = $STONE.getCheckGridIds("grid"); //获取选中的id
				var one = $STONE.getCheckGridRow("grid",ids[0]); //获取选中的行
				var zcdm = "";
				var djbh = "";
				if(ids.length > 50){
					$.dialog.alert("设备一次报检不得多于50台设备！");
					return false;
				}
				if(one.shidaima == '3701'){
					$.dialog.alert('应济南市特检院要求，请关注微信公众号“济南市特检院”通过微信进行报检。');
					return false;
				}
				if(one.zhucedaima.toString().length > 0){
					zcdm = one.zhucedaima+",";
				}
				if(one.dengjizhengbianhao.toString().length > 0){
					djbh = one.dengjizhengbianhao+",";
				}
				if(ids == ""){
					$.dialog.alert("请选择设备！");
					return false;
				}else if(ids.length > 1){
					for(i=1;i<ids.length;i++){
						var row = $STONE.getCheckGridRow("grid",ids[i]); //获取选中的行
						if(one.shebeizhongleidaima != row.shebeizhongleidaima){
							$.dialog.alert("请选择同一种类设备！");
							return false;
						}
						if(one.shiyongdanwei != row.shiyongdanwei){
							$.dialog.alert("请选择同一单位下设备！");
							return false;
						}
						if(row.zhucedaima.toString().length > 0){
							zcdm += row.zhucedaima+",";
						}
						if(row.dengjizhengbianhao.toString().length > 0){
							djbh += row.dengjizhengbianhao+",";
						}
						
					}
				}
				zcdm = zcdm.substring(0,zcdm.length-1);
				djbh = djbh.substring(0,djbh.length-1);
				
				var url = "<%=path%>/bjd!findSe.do?id="+ids+"&zcdm="+zcdm+"&djbh="+djbh;
				parent.addTabsItem("sbbj_info","报检单信息",url);
				
			});
			
			
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
			
			
		})//结束
		
		//清空报检设备
		function qingkongBjd(){
			rows = "";
			sydw = "";
			shebeizhonglei = "";
			total = "";
			zcdm = "";
			djbh = "";
			$("#total").text("0");
			zdycxtj.close();
		}
		
		
//查询
function search(params){
	strParams = JSON.stringify(params);
	$STONE.sc_setGridQueryParams("#grid",params);
}
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	</script>
	
	
<script src="<%=path %>/js/bs/bjgl/sbbj/sbbj_list.js"></script>
<script src="<%=path %>/js/bs/bjgl/sbbj/drag.js"></script>
<script src="<%=path %>/js/bs/bjgl/sbbj/jquery-powerFloat.js"></script>
