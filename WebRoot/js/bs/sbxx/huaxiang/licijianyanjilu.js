var queryConditions = {
	matchCon: ''
}, SYSTEM = parent.parent.SYSTEM, VERSION = parent.parent.SYSTEM.siType;
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
						{name:'shiyongdanwei', label:'使用单位', index:'shiyongdanwei',width:120,align:"center"},
						{name:'jianyanxiangmu', label:'检验类别', index:'jianyanxiangmu', width:80, align:"center",
							formatter:function(value,opt,row){
								if("" == value || undefined == value){
									return "定期检验";
								}else{
									return value;
								}
						}},
						{name:'jianyanriqi', label:'检验日期', index:'jianyanriqi', width:70, align:"center"},
						{name:'xiacijianyanriqi' , label:'下次检验日期', index:'xiacijianyanriqi', width:90, align:"center"},
						{name:'bianhao', label:'检验报告编号', index:'bianhao', width:90,align:"center"},
						{name:'jianyanjielun', label:'检验结论', index:'jianyanjielun', width:100,align:"center"},
						{name:'jianyanjigou', label:'检验机构', index:'jianyanjigou', width:80,align:"center"}
						]; 
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+'/seList!getLiCiJianYanJiLi.do?zcdm='+zcdm,
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
			  repeatitems : false,
			  id: "id"
			},
			loadError : function(xhr,st,err) {
				
			}
		}).navGrid('#page',{edit:false,add:false,del:false,search:false});
	
		function operFmatter (val, opt, row) {//val：要被格式化的值  options：对数据进行格式化时的参数设置，格式为： { rowId: rid, colModel: cm} rowObject：行数据
			var html_con = '<div class="operating" data-id="' + row.id + '"><span class="ui-icon ui-icon-pencil" onclick="editDb('+row.id+','+row.dataId+',\''+row.type+'\')" title="修改"></span></div>';
			return html_con;
		};
		
	},
	addEvent: function(){
		var _self = this;
		//编辑
		$('.grid-wrap').on('click', '.ui-icon-pencil', function(e){
			e.preventDefault();
			//var rowId = $(this).parent().data('id');
			//window.open('http://localhost:8080/WebUI/jcsj_gaozhi_list_edit.html', '_blank');
			
			
			
		});
		
		$(window).resize(function(){
			Public.resizeGrid();
		});
	}
};
 
THISPAGE.init();


