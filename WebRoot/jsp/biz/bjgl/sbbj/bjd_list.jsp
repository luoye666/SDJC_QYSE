<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
%>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
</head>
<body>
	<div class="wrapper">
	  <div class="mod-search cf" id="Toolbar">
	  	<a class="ui-btn ui-btn-sp" id="mnubtn_sbbj_hzd">回执单打印</a>
	  	<a class="ui-btn ui-btn-sp" id="mnubtn_sbbj_bg" style="display: none;">报告下载</a>
	  
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
	var djzbh = "${param.djzbh}";
	var shidaima = "<%=user.getShidaima() %>";
	
	if(shidaima == '3716'){
		$('#mnubtn_sbbj_bg').show();
	}
		/**JavaScript函数声明*/
		//编辑设备信息方法
		function searchBjd(id){
			var pTabsId = parent.getSelectTabsItemId();
			var url = "<%=path%>/bjd!findBjd.do?id="+id+"&status=bjd";
			parent.addTabsItem("sbbj_info_"+id,"报检单信息",url);
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
			//回执单
			$("#mnubtn_sbbj_hzd").click(function(){
				var ids = $STONE.getCheckGridIds("grid"); //获取选中的id
				var one = $STONE.getCheckGridRow("grid",ids[0]); //获取选中的行
				if(ids == ""){
					$.dialog.alert("请选择报检单！");
					return false;
				}else if(ids.length > 1){
					$.dialog.alert("请选择单条报检单！");
					return false;
				}
				if(shidaima == '3716'){
					window.open("http://101.37.88.238:8096/BZSE/hzd/printHzd?ids="+one.hzdid);
				}else if(shidaima == '3708'){
					window.open("http://101.37.88.238:8090/JNSE/hzd/printHzd?ids="+one.hzdid+"&bianhao="+one.shoulibianhao+"&state=shoufei&hzdcl=3");
				}else if(shidaima == '3701'){
					
					if(one.shoulibianhao.slice(0,2) == 'BJ'){
						window.open("http://221.214.76.77:8090/jinan/#/viewhzd/ids="+one.hzdid);
					}else{
						window.open("http://221.214.76.77:8899/JNJY/hzd/printHzd?ids="+one.hzdid);
					}
				}else if(shidaima == '3715'){
					window.open("http://101.37.88.238:8092/LCSE/hzd/printHzd?ids="+one.hzdid+"&bianhao="+one.shoulibianhao+"&state=shoufei");
				}
				
			});
			
			//报告下载
			$("#mnubtn_sbbj_bg").click(function(){
				var ids = $STONE.getCheckGridIds("grid"); //获取选中的id
				var one = $STONE.getCheckGridRow("grid",ids[0]); //获取选中的行
				if(ids == ""){
					$.dialog.alert("请选择报检单！");
					return false;
				}else if(ids.length > 1){
					$.dialog.alert("请选择单条报检单！");
					return false;
				}
				if(shidaima == '3716'){
					window.open("http://101.37.88.238:8096/BZSE/bjd/qydylist?id="+ids);
				}else if(shidaima == '3708'){
					
				}
				
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
					    content: 'url:<%=path%>/jsp/biz/bjgl/sbbj/bjd_list_search.jsp'
				});
			});
			
			
			
			$.dialog({
						title:'办理过程',
					    width: '900px',
					    height: '450px',
					    min:true,
					    cache:false,
					    autoOpen: false,
					    
					    content: '<img src="<%=path %>/images/liucheng2.png" style="width: 100%;height:200px;">'
				});
			
			
		})//结束
		
//查看不予受理原因
function checkYY(beizhu){
	$.dialog({
		title:'未通过原因',
		width: '450px',
		height: '300px',
		lock:true,
		content: beizhu
	});
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
	
	
<script src="<%=path %>/js/bs/bjgl/sbbj/bjd_list.js"></script>