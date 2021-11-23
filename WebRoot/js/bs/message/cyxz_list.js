var queryConditions = {
	matchCon: ''
}, SYSTEM = parent.SYSTEM, VERSION = parent.SYSTEM.siType;
var THISPAGE = {
	init: function(data){
		this.initDom();
		this.loadGrid();			
		this.addEvent();
	},
	initDom: function(){
	},
	loadGrid: function(){
		var height = $(window).height() - $(".grid-wrap").offset().top - 65, _self = this;
		var colModels = [//fixed列宽度是否要固定不可变
						{name:'id', label:'', index:'id',hidden:true, align:"center"},
						{name:'path', label:'路径', index:'title', width:120, align:"center",hidden:true},
						{name:'title', label:'标题', index:'title', width:120, align:"center"},
						{name:'createDate', label:'发布时间', index:'createDate', width:80, align:"center",
							formatter:function(value){
								return SYSTEM.date.format(value,'yyyy-MM-dd hh:mm:ss');
						}},
						{name:'createName', label:'发布人', index:'createName', width:100,align:"center"},
						{name:'operating', label:'查看',width:80, fixed:true, formatter:operFmatter, align:"center"}
						]; 
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+'/downloadBoxList!getList.do',
			postData: queryConditions,//此数组内容直接赋值到url上，参数类型：{name1:value1…}   
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
	
		function operFmatter (val, opt, row) {//val：要被格式化的值  options：对数据进行格式化时的参数设置，格式为： { rowId: rid, colModel: cm} rowObject：行数据
			var caozuo = '<div class="operating" data-id="' + row.id + '">';
			caozuo += '<span class="ui-icon ui-icon-circle-arrow-s" onclick="parent.downloadFile(\'\/DownFile\/'+row.path+'\')" title="下载"></span></div>';
			return caozuo;
		};
		
	},
	reloadData: function(data){
		this.markRow = [];//markRow 这个有什么用？  
		$("#grid").jqGrid('setGridParam',{url:'/basedata/jcsj_gaozhi_list.json', datatype: "json", postData: data}).trigger("reloadGrid");
	},
	addEvent: function(){
		var _self = this;
		//编辑
		$('.grid-wrap').on('click', '.ui-icon-pencil', function(e){
			e.preventDefault();
			//var rowId = $(this).parent().data('id');
			//window.open('http://localhost:8080/WebUI/jcsj_gaozhi_list_edit.html', '_blank');
			
			
			
		});
		
		$('#search').click(function(){
			queryConditions.matchCon = _self.$_matchCon.val() === '请输入告知单号或出厂编号' ? '' : _self.$_matchCon.val();
			queryConditions.beginDate = _self.$_beginDate.val();
			queryConditions.endDate = _self.$_endDate.val();
			THISPAGE.reloadData(queryConditions);
		});
		
		$('#refresh').click(function(){
			THISPAGE.reloadData(queryConditions);
		});
		
		$('#add').click(function(e){
			
		});
		
		$(window).resize(function(){
			Public.resizeGrid();
		});
	}
};
 
THISPAGE.init();


