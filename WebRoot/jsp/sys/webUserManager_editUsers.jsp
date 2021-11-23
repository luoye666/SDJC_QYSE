<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
  <link rel="stylesheet" href="<%=path %>/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=path %>/js/plugin/ztree/jquery.ztree.core-3.5.js"></script>
<style type="text/css">
	.inputWidth{
		width: 178px;
	}
</style>
</head>

<body>

<div class="wrapper">
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_giveUsersRole">授权</a><a class="ui-btn ui-btn-sp" id="mnubtn_backUsersRole">取消授权</a>
	    <a style="float:right;" class="ui-btn" id="baozhi_search">查询</a>
	  </div>
			    		<form name="frm_authorizeUsers_search_conditions" id="frm_authorizeUsers_search_conditions">
					    	<table>
					    		<tr>
					    			<th>登录账号：</th>
					    			<td><input class="ui-input inputWidth" name="loginId" /></td>
					    			<th>用户名称：</th>
					    			<td><input class="ui-input inputWidth" name="name" /></td>
					    		</tr>
					    	</table>
				    	</form>
	  <div class="grid-wrap">
	    <table id="grid">
	    </table>
	    <div id="page"></div>
	  </div>
</div>
            	<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
					<ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;background-color: white;"></ul>
				</div>
</body>
</html>	
	<script type="text/javascript">
		
		var colModels = [//fixed列宽度是否要固定不可变
						{name:'id', label:'', index:'id',hidden:true, align:"center"},
						{name:'loginId', label:'登录帐号', index:'loginId',align:"center"},
						{name:'name' , label:'用户名称', index:'name', width:100, align:"center"},	
						{name:'notes', label:'角色描述', index:'notes', width:100, align:"center"},
						{name:'organId', label:'科室ID', index:'organId', width:100, align:"center",hidden:true},
			        	{name:'authorizeState',label:'授权状态',index:'authorizeState',width:100,align:'center'}
						]; 
		$().ready(function(){
			var height = $(window).height() - $(".grid-wrap").offset().top - 65, _self = this;
			$("#grid").jqGrid({
			    url:"<%=path%>/userList!getAll.do",
				datatype: "json",
				mtype:"post",
				autowidth: true,
				height: height,
				altRows: true, 
				rownumbers: true,
				gridview: true,//构造一行数据后添加到grid中，如果设为true则是将整个表格的数据都构造完成后再添加到grid中，但treeGrid, subGrid, or afterInsertRow 不能用
				colModel:colModels,
				cmTemplate: {sortable: false, title: false},
				loadui: 'block',
				multiselect: true,
				page: 1, 
		//		sortname: 'gaozhiriqi',    
				sortorder: "desc", 
				pager: "#page",  
				rowNum: 10,  
				rowList:[10,20,30,40,50],     
		//		scroll: 1, //创建一个动态滚动的表格，当为true时，翻页栏被禁用，使用垂直滚动条加载数据，且在首次访问服务器端时将加载所有数据到客户端。当此参数为数字时，表格只控制可见的几行，所有数据都在这几行中加载
				viewrecords: true,//定义是否显示总记录条数 
				shrinkToFit: true,//。当shrinkToFit 为false时，此属性会被忽略
				forceFit: false,//forceFit ,当为ture时，调整列宽度不会改变表格的宽度
				jsonReader: {
				  root: "rows", 
				  records: "records",  
				  repeatitems : false,
				  id: "id"
				},
				gridComplete:function(){
					var ids = $("#grid").jqGrid("getDataIDs");
					for(var i = 0;i<ids.length;i++){
						var row = $("#grid").jqGrid("getRowData",ids[i]);
						$.ajax({
						   type: "POST",
						   url: "<%=path%>/jyxxList!findWU.do",
						   data:'wuId=${param.id}&userId='+row.id,
						   dataType:"json",
						   async: false,
						   success: function(data, textStatus){	
			    				var authorizeState;
			    				if(data.hasRole){
			    					authorizeState = "<span style='color:green'>已授权</span>";
			    				}else{
			    					authorizeState = "<span style='color:red'>未授权</span>";
			    				}
								$("#grid").jqGrid("setCell",ids[i],"authorizeState", authorizeState);
						   }
						});
					}
				}
			});
		})
		
		/**页面元素事件注册*/
		$().ready(function(){
			//授权
			$("#mnubtn_giveUsersRole").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择人员！");
					return false;
				}
				$.post("<%=path%>/jyxx!authorizeToUsers.do?userIds="+ids,{roleId:"${param.id}",accessType:'give'},
	            	function (data, textStatus){
						reloadGrid();
	            },"json");
			});
			
			//取消授权
			$("#mnubtn_backUsersRole").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择人员！");
					return false;
				}
				$.post("<%=path%>/jyxx!authorizeToUsers.do?userIds="+ids,{roleId:"${param.id}",accessType:'back'},
	            	function (data, textStatus){
						reloadGrid();
	            },"json");
			});
			
			//查询
			$("#baozhi_search").click(function(){
				var params = $STONE.formSerializedToJSON("#frm_authorizeUsers_search_conditions");
				$STONE.sc_setGridQueryParams("#grid",params);
			});
		})
		
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
		function showMenu() {
			var cityObj = $("#jigou");
			var cityOffset = $("#jigou").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}
		
	
	</script>