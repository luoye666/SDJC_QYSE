var queryConditions = {
	matchCon: ''
}, SYSTEM = parent.SYSTEM, VERSION = parent.SYSTEM.siType;
var THISPAGE = {
	init: function(data){
		this.loadGrid();			
	},
	loadGrid: function(){
		var height = $(window).height() - $(".grid-wrap").offset().top - 65, _self = this;  //65
		var colModels = [//fixed列宽度是否要固定不可变
						{name:'id', label:'', index:'id',hidden:true, align:"center"},
						{name:'hzdid', label:'', index:'hzdid',hidden:true, align:"center"},
						{name:'shiyongdanweiId', label:'ID', index:'shiyongdanweiId', width:120, align:"center",hidden:true},
						{name:'shoulibianhao', label:'受理编号', index:'shoulibianhao', width:120, align:"center"},
						{name:'shiyongdanwei', label:'使用单位', index:'shiyongdanwei', width:120, align:"center"},
						{name:'shebeizhonglei', label:'设备种类', index:'shebeizhonglei', width:80, align:"center"},
						{name:'quhuamingcheng' , label:'区划名称', index:'quhuamingcheng', width:80, align:"center"},	
						{name:'shouliriqi' , label:'受理日期', index:'shouliriqi', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}},
						{name:'tijiaoriqi' , label:'提交日期', index:'tijiaoriqi', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}},
						{name:'jiaofeizhuangtai' , label:'缴费状态', index:'jiaofeizhuangtai', width:100, align:"center"},
						{name:'bjState' , label:'状态', index:'bjState', width:80, align:"center",
			        		formatter:function(value,opt,row){
				        		if(value != ""){
				        			return value=="1"?"已提交":value=="2"?"等待审核":value=="3"?"预审通过":value=="4"?"审核通过":value=="5"?"检验中":value=="6"?"检验完毕":'不予受理<br/><a href="javascript:void(0)" onClick="checkYY(\''+row.beizhu+'\')">(查看原因)</a>';
				        		}else{
				        			return "--";
				        		}
			        	}},
			        	{name:'operating', label:'查看',width:40, fixed:true, formatter:operFmatter, align:"center"}
						]; 
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+'/bjdList!findListBjd.do',
			postData: queryConditions,//此数组内容直接赋值到url上，参数类型：{name1:value1…}   
			datatype: "json",
			mtype:"post",
			autowidth: true,
			height: height-50,
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
			rowNum: 10,  
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
			gridComplete:function(){
				//获取列表数据
				var rowDatas = $("#grid").jqGrid('getRowData');
				for(i=0;i<rowDatas.length;i++){
					var rowData = rowDatas[i]; 
			    	
					if(rowData.jiaofeizhuangtai=='未缴费'){
						$("#"+rowData.id).css("color","#6600cc");
					}
					
				}
				return true;
			}
		}).navGrid('#page',{edit:false,add:false,del:false,search:false});
		function operFmatter (val, opt, row) {//val：要被格式化的值  options：对数据进行格式化时的参数设置，格式为： { rowId: rid, colModel: cm} rowObject：行数据
			var html_con = '<div class="operating" data-id="' + row.id + '"><span class="ui-icon ui-icon-pencil" onclick="searchBjd(\''+row.id+'\')" title="修改"></span></div>';
			return html_con;
		};
	}
};
 
THISPAGE.init();


