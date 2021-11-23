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
						{name:'sydwmc', label:'使用单位', index:'sydwmc', width:120, align:"center"},
						{name:'ouidname' , label:'区划名称', index:'ouidname', width:100, align:"center"},	
						{name:'jinduzhuangtai' , label:'进度状态', index:'jinduzhuangtai', width:100, align:"center",
							formatter:function(value){
								if("0" == value){
			        				return "未报检";
				        		}else if("1" == value){
				        			return "已报检";
				        		}else if("2" == value){
				        			return "检验中";
				        		}else if("3" == value){
				        			return "已检验";
				        		}else{
				        			return "";
				        		}
						}},	
						{name:'xiacijianyanriqi' , label:'下次检验日期', index:'xiacijianyanriqi', width:100, align:"center",
				        	formatter: function(value){
								if(null != value){
									return SYSTEM.date.format(value,'yyyy-MM-dd');
								}else{
									return "";
								}
						}},
						{name:'yhtype' , label:'隐患类别', index:'yhtype', width:100, align:"center",
				        	formatter: function(value){
								if("1" == value){
			        				return "超期未注册";
				        		}else if("2" == value){
			        				return "检验需整改";
				        		}else if("3" == value){
			        				return "检验不合格";
				        		}else if("4" == value){
				        			return "超期未检验";
				        		}else if("5" == value){
				        			return "其他类隐患";
				        		}else if("6" == value){
				        			return "约谈";
				        		}else if("7" == value){
				        			return "监察指令书";
				        		}else if("8" == value){
				        			return "处罚";
				        		}else if("9" == value){
				        			return "违规";
				        		}else if("10" == value){
				        			return "吊销";
				        		}else{
				        			return value;
				        		}
						}},
						{name:'yhdate' , label:'隐患日期', index:'yhdate', width:100, align:"center",
							formatter:function(value){
								return SYSTEM.date.format(value,'yyyy-MM-dd');
						}},	
						{name:'xcdate' , label:'消除日期', index:'xcdate', width:100, align:"center",
							formatter:function(value){
								if(null != value){
									return SYSTEM.date.format(value,'yyyy-MM-dd');
								}else{
									return "";
								}
						}}
						]; 
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+"/histeqhideList!getListForHistEqhideSe.do?seid="+seid+"&hty="+hty,
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
			}
		}).navGrid('#page',{edit:false,add:false,del:false,search:false});
	
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
		
		$(window).resize(function(){
			Public.resizeGrid();
		});
	}
};
 
THISPAGE.init();


