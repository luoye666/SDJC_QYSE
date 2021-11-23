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
  <div class="mod-search cf">
    <a class="ui-btn ui-btn-sp" id="mnubtn_addDicData">添加</a><a class="ui-btn ui-btn-sp" id="mnubtn_delDicData">删除</a>
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
	<script type="text/javascript">
var cxtj;
var searchForm = "";
var path = "<%=path %>";

		var colModels = [//fixed列宽度是否要固定不可变
						{name:'id', label:'', index:'id',hidden:true, align:"center"},
						{name:'typeId', label:'字典类型', index:'typeId',align:"center",hidden:true},
						{name:'name' , label:'名称', index:'name', width:100, align:"center"},	
						{name:'code', label:'编号', index:'code', width:100, align:"center"},
						{name:'value', label:'值', index:'value', width:100, align:"center"},
						{name:'notes', label:'描述', index:'notes', width:100, align:"center"},
						{name:'operating', label:'操作',width:80, fixed:true, align:"center",
			        		formatter: function(val, opt, row){//val：要被格式化的值  options：对数据进行格式化时的参数设置，格式为： { rowId: rid, colModel: cm} rowObject：行数据
								var value = '<div class="operating" data-id="' + row.id + '"><span class="ui-icon ui-icon-pencil" onclick="editDicData('+row.id+')" title="修改"></span></div>';
								return value;
						}}
						]; 
		function editDicData(id){
				$.dialog({
						title:'详细信息',
					    width: '450px',
					    height: '250px',
					    lock: true,
					    content: 'url:<%=path%>/dic!openZdDataInfo.do?id='+id
				});
		}
		
		/**页面所需资源初始化****************************************************/
		$().ready(function(){
			var height = $(window).height() - $(".grid-wrap").offset().top - 65, _self = this;
			$("#grid").jqGrid({
				url:"<%=path%>/dicList!getDataList.do",
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
				}
			});
			
			$.post("<%=path%>/dicList!getTypeAll.do",
    			function (data, textStatus){
					
    		},"JSON");
		});
		
		/**页面元素事件注册*/
		$().ready(function(){
			$("#mnubtn_addDicData").click(function(){
			//添加字典按钮点击
				$.dialog({
						title:'添加字典数据',
					    width: '450px',
					    height: '250px',
					    lock: true,
					    content: 'url:<%=path%>/jsp/sys/dicDataManager_addDicData.jsp'
				});
			});
			
			//删除字典按钮点击
			$("#mnubtn_delDicData").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择要删除的项目！");
					return false;
				}
				$.dialog.confirm("确定要删除选择的字典数据吗?", function(){  
	                $.post("<%=path%>/dic!deleteDataByIds.do?ids="+ids,{},
	        			function (data, textStatus){
	                		reloadGrid();
	        		});
	            }); 
			});
		//查询条件
		$("#baozhi_search").click(function(){
				cxtj = $.dialog({
						title:'查询条件',
					    width: '550px',
					    height: '250px',
						min:true,
					    close:function(){
							cxtj.content.closeBefore();
						},
					    content: 'url:<%=path%>/jsp/sys/dicDataManager_search.jsp'
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