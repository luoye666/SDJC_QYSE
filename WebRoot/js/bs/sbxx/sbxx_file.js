var queryConditions = {
	matchCon: ''
}, SYSTEM = parent.SYSTEM, VERSION = parent.SYSTEM.siType;
var THISPAGE = {
	init: function(data){
//		this.initDom();
		this.loadGrid();			
//		this.addEvent();
	},
	initDom: function(){
		/*
		this.$_matchCon = $('#chuchangbianhao');
		this.$_beginDate = $('#beginDate').val(SYSTEM.beginDate);	
		this.$_endDate = $('#endDate').val(SYSTEM.endDate);
		this.$_matchCon.placeholder();*///当文本框为null的时候   自动填充 ;
	},
	loadGrid: function(){
		var height = $(window).height() - $(".grid-wrap").offset().top - 65, _self = this;
		var colModels = [//fixed列宽度是否要固定不可变
						{name:'id', label:'', index:'id',hidden:true, align:"center"},
						{name:'filePath', label:'文件路下载', index:'filePath', width:120, align:"center",
							formatter:function(val, opt, row){
								val = val.replace(/\\/g,"/");
								return '<a onclick="parent.downloadFile(\''+val+'\')">下载附件</a>';
						}},
						{name:'updateName' , label:'更改人', index:'updateName', width:80, align:"center"},	
						{name:'updateTime' , label:'更改日期', index:'updateTime', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd hh:mm:ss');
							}
						}},
						{name:'beizhu' , label:'备注', index:'beizhu', width:100, align:"center"},	
						]; 
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+'/seList!seListFile.do?id='+id,
			datatype: "json",
			mtype:"post",
			autowidth: true,
			height: 200,
			altRows: true, 
			rownumbers: true,
			gridview: true,//构造一行数据后添加到grid中，如果设为true则是将整个表格的数据都构造完成后再添加到grid中，但treeGrid, subGrid, or afterInsertRow 不能用
			colModel:colModels,
			cmTemplate: {sortable: false, title: false},
			loadui: 'block',
			multiselect: false,
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
			  total: "total",
			  id: "id"
				  
			},
			loadError : function(xhr,st,err) {
				
			},
			ondblClickRow : function(rowid, iRow, iCol, e){//双击行时触发。rowid：当前行id；iRow：当前行索引位置；iCol：当前单元格位置索引；e:event对象
				$('#' + rowid).find('.ui-icon-pencil').trigger('click'); //trigger() 方法触发被选元素的指定事件类型。 
				//$("#grid").jqGrid('editGridRow','new',{height:280,reloadAfterSubmit:true,closeOnEscape:true,addedrow:first}); 
			}
		}).navGrid('#page',{edit:false,add:false,del:false,search:false});
	}
};
 
THISPAGE.init();
document.oncontextmenu = function() { return false;}

