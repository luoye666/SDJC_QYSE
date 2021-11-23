var queryConditions = {
	matchCon: ''
}, SYSTEM = parent.SYSTEM, VERSION = parent.SYSTEM.siType;
var THISPAGE = {
	init: function(data){
		this.loadGrid();			
	},
	loadGrid: function(){
		var height = $(window).height() - $(".grid-wrap").offset().top - 65, _self = this;
		var colModels = [//fixed列宽度是否要固定不可变
						{name:'shebeimingcheng', label:'设备名称', index:'shebeimingcheng', width:180, align:"center"},
						{name:'zhucedaima', label:'注册代码', index:'zhucedaima', width:260, align:"center"},
						{name:'dengjizhengbianhao', label:'使用登记编号', index:'dengjizhengbianhao', width:260, align:"center"},
						{name:'xiacijianyanriqi', label:'下次检验日期', index:'xiacijianyanriqi', width:260, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}}
						]; 
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+'/bjdList!findBjdSe.do?seId='+seId,
			postData: queryConditions,//此数组内容直接赋值到url上，参数类型：{name1:value1…}   
			datatype: "json",
			mtype:"post",
			autowidth: false,
			height: height-50,
			width: 800,
			altRows: true, 
			rownumbers: true,
			gridview: true,//构造一行数据后添加到grid中，如果设为true则是将整个表格的数据都构造完成后再添加到grid中，但treeGrid, subGrid, or afterInsertRow 不能用
			colModel:colModels,
			cmTemplate: {sortable: false, title: false},
			loadui: 'block',
			multiselect: true,
			page: 1, 
			sortorder: "desc", 
			pager: "#page",  
			rowNum: 100,
			rowList:[10,20,30,50,100],     
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
		}).navGrid('#page',{edit:false,add:false,del:false,search:false});
		
	}
};
 
THISPAGE.init();


