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
	    <a class="ui-btn ui-btn-sp" id="mnubtn_sbbj_info">生成报检单</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_sbbj_qk">清空设备</a>
	
	  </div>
	  <div class="grid-wrap">
	    <table id="grid">
	    </table>
	    <div id="page"></div>
	  </div>
 	</div>
</body>
<!-- 脚本 -->
<script type="text/javascript">
var api = frameElement.api, W = api.opener;

var zdycxtj;
var cxtj;
var zldm = "";
var title = "";
var searchForm = "";
var strParams = "";
	var path = "<%=path %>";
	
		/**JavaScript函数声明*/
		var colModels = [//fixed列宽度是否要固定不可变
						{name:'id', label:'', index:'id',width:10,hidden:true, align:"center"},
						{name:'shebeimingcheng', label:'设备名称', index:'shebeimingcheng', width:80, align:"center"},
						{name:'zhucedaima', label:'注册代码', index:'zhucedaima', width:160, align:"center"},
						]; 
		
		/**页面元素事件注册*/
		$().ready(function(){
			$("#grid").jqGrid({
				datatype: "local",
				mtype:"post",
				autowidth: true,
				height: 360,
				altRows: true, 
				rownumbers: true,
				gridview: true,//构造一行数据后添加到grid中，如果设为true则是将整个表格的数据都构造完成后再添加到grid中，但treeGrid, subGrid, or afterInsertRow 不能用
				colModel:colModels,
				cmTemplate: {sortable: false, title: false},
				loadui: 'block',
				multiselect: true,
				jsonReader: {
				  root: "rows", 
				  records: "id",  
				  repeatitems : false,
				 
				},
				gridComplete: function() {  
	               var record = $("#grid").getGridParam("records");  
	         	   $("#grid").jqGrid('setSelection',record);
	              
	           }, 
			});
			
			var rows = "${param.rows}";
			rows = decodeURI(rows);
			rows = rows.substr(0,rows.length-1);
			rows = rows.replace(/'/g,'"');
			rows = parent.JSON.parse("["+rows+"]");
	 		for(var i=0;i<rows.length;i++){ 
		        $("#grid").jqGrid('addRowData',i+1,rows[i]);  
		    }
	 		
	 		
	 		//生成报检单
			$("#mnubtn_sbbj_info").click(function(){
				var ids = $STONE.getCheckGridIds("grid"); //获取选中的id
				var zcdm = "";
				var id = "";
				if(ids == ""){
					$.dialog.alert("请选择设备！");
					return false;
				}else if(ids.length > 0){
					for(i=0;i<ids.length;i++){
						var row = $STONE.getCheckGridRow("grid",ids[i]); //获取选中的行
						id += row.id+",";
						zcdm += row.zhucedaima+",";
					}
				}
				zcdm = zcdm.substring(0,zcdm.length-1);
				id = id.substring(0,id.length-1);
				
				var url = "<%=path%>/bjd!findSe.do?id="+id+"&zcdm="+zcdm;
				parent.parent.addTabsItem("sbbj_info","报检单信息",url);
				
				qingkong();
			});
	 		
	 		//清空
			$("#mnubtn_sbbj_qk").click(function(){
				qingkong();
			});
			
		})//结束
		
		
	//重新加载
	function reloadGrid(row){
		$("#grid").jqGrid("clearGridData");
		row = eval("(" + row + ")");
		for(var i=0;i<row.length;i++){  
	        $("#grid").jqGrid('addRowData',i+1,row[i]);  
	    }
	}
		
	function qingkong(){
		$("#grid").jqGrid("clearGridData");
		W.qingkongBjd();
	}
		
	</script>
</html>