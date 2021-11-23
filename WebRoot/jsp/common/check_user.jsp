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
	.inputWidth{
		width: 178px;
	}
</style>
</head>

<body>

<div class="wrapper">
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_check_user_qd">确定</a>
	  </div>
	  <div class="grid-wrap">
	    <table id="grid">
	    </table>
	    <div id="page"></div>
	  </div>
</div>
</body>
</html>	
	<script type="text/javascript">
var api = frameElement.api, W = api.opener;
		var colModels = [//fixed列宽度是否要固定不可变
						{name:'id', label:'', index:'id',hidden:true, align:"center"},
						{name:'loginId', label:'登录帐号', index:'loginId',align:"center",hidden:true},
						{name:'name' , label:'用户名称', index:'name', width:100, align:"center"},
			        	{name:'authorizeState',label:'状态',index:'authorizeState',width:100,align:'center',formatter:function(val, opt, row){
							if(W.onlineUsers.hasOwnProperty(row.loginId+'_'+row.id)){
								return "在线";
							}else{
								return "不在线";
							}
			        	}}
						]; 
		$().ready(function(){
			var height = $(window).height() - $(".grid-wrap").offset().top - 65, _self = this;
			$("#grid").jqGrid({
			    url:"<%=path%>/userList!getJcUserByOgCode.do",
				datatype: "json",
				mtype:"post",
				autowidth: true,
				height: '100%',
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
				}
			}).navGrid('#page',{edit:false,add:false,del:false,search:false});;
		})
		
		/**页面元素事件注册*/
		$().ready(function(){
			$("#mnubtn_check_user_qd").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids.length != 1){
					$.dialog.alert("请选择一个人员！");
					return false;
				}
				var row = $("#grid").jqGrid("getRowData",ids[0]);
				if(row.authorizeState == "不在线"){
					$.dialog.alert("请选择状态为在线的人员！");
					return false;
				}
				W.ckUserLoginId = row.loginId;
				W.ckUserName = row.name;
				W.ckUserDataId = row.id;
				W.openChatDialog();
				api.close();
			});
		})
		
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	</script>