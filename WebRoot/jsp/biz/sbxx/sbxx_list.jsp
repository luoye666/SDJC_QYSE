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
	    <a class="ui-btn ui-btn-sp" id="mnubtn_se_edit_info">修改设备信息</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_sb_ty">停用</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_sb_zx">注销</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_sb_qy">启用</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_sb_dc">导出Excel</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_sb_yty_dcdj">导出登记Excel</a>
	  	<a style="float:right;" class="ui-btn" id="baozhi_search1">自定义查询</a>
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
	var zst = "${param.zcstatus}";
	var ty = "${param.ty}";
	var gd = "${param.gd}";
	var qp = "${param.qp}";
	var djzbh = "${param.djzbh}";
	
	if(zt == 'ls'){
		$('#baozhi_search1').hide();
	}
	if(zst == "3"){
		$("#mnubtn_jcsj_sb_ty").hide();
		$("#mnubtn_jcsj_sb_zx").hide();
	}else{
		$("#mnubtn_jcsj_sb_qy").hide();
	}
	
		/**JavaScript函数声明*/
		//编辑设备信息方法
		function editSe(id,sbmc,djzbh,sbzldm){
			var pTabsId = parent.getSelectTabsItemId();
			var url = "<%=path%>/se!openSbById.do?id="+id+"&note=${param.note}_"+id+"&gridid=grid&lx=1&zldm="+sbzldm+"&pTabsId="+pTabsId;
			parent.addTabsItem("sbxx_list_edit_"+id,sbmc+"_"+djzbh,url);
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
			$("#mnubtn_se_edit_info").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择设备！");
					return false;
				}
				$.dialog({
						title:'修改设备信息',
					    width: '650px',
					    height: '250px',
					    lock: true,
					    content: 'url:<%=path%>/jsp/biz/sbxx/jcsj_sb_upd_info.jsp?ids='+ids
				});
			});
			//查询条件
			$('#baozhi_search').click(function(){
				if(cxtj == undefined){
					cxtj = $.dialog({
							title:'查询条件',
						    width: '900px',
						    height: '450px',
						    min:true,
						    cache:false,
						    autoOpen: false,
						    close:function(){
								this.hide();
								return false;
							},
						    content: 'url:<%=path%>/jsp/biz/sbxx/jcsj_list_search.jsp?zt='+zt
					});
				}else{
					cxtj.show();
				}
			});
			
			//自定义查询条件
			$('#baozhi_search1').click(function(){
				if(zdycxtj == undefined){
					zdycxtj = $.dialog({
							title:'自定义查询',
						    width: '900px',
						    height: '450px',
						    min:true,
						    cache:false,
						    autoOpen: false,
						    close:function(){
								this.hide();
								return false;
							},
						    content: 'url:<%=path%>/jsp/biz/sbxx/jcsj_list_zdy_search.jsp'
					});
				}else{
					zdycxtj.show();
				}
			});
			
			//管道 按使用登记证查看
			$("#Toolbar").delegate("#mnubtn_jcsj_sb_yty_djzck","click",function(){
				var url = "<%=path%>/jsp/biz/sbxx/sbxx_gd_djz_ck_list.jsp?zt=${param.zt}&zcstatus=${param.zcstatus}&ty=${param.ty}&gd=${param.gd}";
				parent.addTabsItem("sbxx_list_djz_gr","按使用登记证查看",url);
			});
			
			//发送至在用
			$("#mnubtn_jcsj_sb_qy").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择设备！");
					return false;
				}
				
					$.dialog.confirm("是否确认在用?", function(){  
						parent.showMask("正在提交......");
	                	$.post("<%=path%>/se!updateZcstate.do?ids="+ids,{state:"1"},
		        			function (data, textStatus){
								if(data.msg == 'notallow'){
	                				$.dialog.alert("此设备是否有待审核记录，不允许重复提交？");
	                			}else{
	                				$("#grid").trigger("reloadGrid");
	                			}
								parent.hideMask();
		        	   },"JSON");
	          	   });  
			});
			//停用
			$("#mnubtn_jcsj_sb_ty").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择设备！");
					return false;
				}
				
				
					$.dialog.confirm('是否确认停用？', function(){
						parent.showMask("正在提交......");
	                	//停用操作
	                	$.post("<%=path%>/se!updateZcstate.do?ids="+ids,{state:"3"},
		        			function (data, textStatus){
								if(data.msg == 'notallow'){
	                				$.dialog.alert("此设备是否有待审核记录，不允许重复提交？");
	                			}else{
	                				$("#grid").trigger("reloadGrid");
	                			}
								parent.hideMask();
		        	     },"JSON");
					});
				
			});
			
			//注销
			$("#mnubtn_jcsj_sb_zx").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择设备！");
					return false;
				}
				
			
					$.dialog.confirm("是否确认注销?", function(){  
						parent.showMask("正在提交......");
	                	$.post("<%=path%>/se!updateZcstate.do?ids="+ids,{state:"5"},
		        			function (data, textStatus){
								if(data.msg == 'notallow'){
	                				$.dialog.alert("此设备是否有待审核记录，不允许重复提交？");
	                			}else{
	                				$("#grid").trigger("reloadGrid");
	                			}
								parent.hideMask();
		        	   },"JSON");
	            	}); 
				
				 
			});
			//导出excel
			$("#mnubtn_jcsj_sb_dc").click(function(){
				var rows = $STONE.getGridRows("grid");
				if(rows.length == 0){
					$.dialog.alert("没有设备，无法导出！");
					return false;
				}
				var url = "<%=path%>/seList!getListForZhuCe.do?zt="+zt+"&ty="+ty+"&zcstatus="+zst+"&gd=${param.gd}&sydwid="+sydwid+"&expExcel=exp";
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
			});
			
			//导出登记Excel
			$("#mnubtn_jcsj_sb_yty_dcdj").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择设备！");
					return false;
				}else if(ids.length != 1){
					$.dialog.alert("请选择一台设备！");
					return false;
				}
				var url = "<%=path%>/se!findDaoChuZcdj.do?id="+ids;
				parent.document.getElementById("downloadFile").src = url;
			});
		})//结束
		
		//设备画像
		function sbhx(id){
			var pTabsId = parent.getSelectTabsItemId();
			parent.addTabsItem("sb_hx"+id,"设备画像","<%=path%>/jsp/biz/sbxx/huaxiang/sb_huaxiang.jsp?id="+id+"&pTabsId="+pTabsId);
		//	window.open("<%=path%>/jsp/biz/sbxx/sb_huaxiang.jsp?id="+id);
		}
		
		
//查询
function search(params){
	strParams = JSON.stringify(params);
	$STONE.sc_setGridQueryParams("#grid",params);
}
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	function tingyong(ids,type){
		//停用操作
        $.post("<%=path%>/se!updateZcstate.do?ids="+ids,{state:type},
      		function (data, textStatus){
				$("#grid").trigger("reloadGrid");
      	});
	}
	</script>
	
<script src="<%=path %>/js/bs/sbxx/sbxx_list.js"></script>