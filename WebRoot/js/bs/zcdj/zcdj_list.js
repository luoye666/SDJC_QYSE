var queryConditions = {
	matchCon: ''
}, SYSTEM = parent.SYSTEM, VERSION = parent.SYSTEM.siType;
var THISPAGE = {
	init: function(data){
	//	this.initDom();
		this.loadGrid();			
	//	this.addEvent();
	},
	initDom: function(){
	//	this.$_matchCon = $('#chuchangbianhao');
	//	this.$_beginDate = $('#beginDate').val(SYSTEM.beginDate);	
	//	this.$_endDate = $('#endDate').val(SYSTEM.endDate);
	//	this.$_matchCon.placeholder();//当文本框为null的时候   自动填充 ;
	},
	loadGrid: function(){
		var height = $(window).height() - $(".grid-wrap").offset().top - 65, _self = this;
		var colModels = [//fixed列宽度是否要固定不可变
						{name:'id', label:'', index:'id',hidden:true, align:"center"},
						{name:'wtg_yuanyin', label:'未通过原因', index:'wtg_yuanyin',hidden:true, align:"center"},
						{name:'shiyongdanwei', label:'使用单位', index:'shiyongdanwei', width:130, align:"center"},
						{name:'shebeizhongleidaima', label:'设备种类代码', index:'shebeizhongleidaima', width:80, hidden:true},
						{name:'shebeizhonglei', label:'设备种类', index:'shebeizhonglei', width:80, align:"center"},
						{name:'shebeileibie', label:'设备类别', index:'shebeileibie', width:100,align:"center"},
						{name:'shiyongdengjizhenghaoma' , label:'使用登记证编号', index:'shiyongdengjizhenghaoma', width:120, align:"center"},
						{name:'chuchangbianhao' , label:'出厂编号', index:'chuchangbianhao', width:90, align:"center"},	
						{name:'zhizaodanwei' , label:'制造单位', index:'zhizaodanwei', width:110, align:"center"},
						{name:'zhucedengjiriqi' , label:'登记日期', index:'zhucedengjiriqi', width:70, align:"center",
							formatter:function(value){
							if(undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}},
						{name:'jianyanriqi' , label:'检验日期', index:'jianyanriqi', width:70, align:"center",
							formatter:function(value){
							if(undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}},
						{name:'xiacijianyanriqi' , label:'下次检验日期', index:'xiacijianyanriqi', width:70, align:"center",
							formatter:function(value){
							if(undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}},
						{name:'tjstate' , label:'状态', index:'tjstate', width:70, align:"center",formatter:function(value, opt, row){
							if("0" == value){
								return "已保存";
							}else if("1" == value){
								return "审核通过";
							}else if("2" == value){
								return "待审核";
							}else if("3" == value){
								return '审核未通过<br/><a href="javascript:void(0)" onClick="checkYY(\''+row.id+'\')">(查看原因)</a>';
							}else if("4" == value){
								return "预审通过";
							}
						}},
						{name:'operating', label:'查看',width:50, fixed:true, formatter:operFmatter, align:"center"}
						]; 
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+'/registerList!getList.do',
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
			},
			loadError : function(xhr,st,err) {
				
			},
			ondblClickRow : function(rowid, iRow, iCol, e){//双击行时触发。rowid：当前行id；iRow：当前行索引位置；iCol：当前单元格位置索引；e:event对象
				$('#' + rowid).find('.ui-icon-pencil').trigger('click'); //trigger() 方法触发被选元素的指定事件类型。 
				//$("#grid").jqGrid('editGridRow','new',{height:280,reloadAfterSubmit:true,closeOnEscape:true,addedrow:first}); 
			}
		}).navGrid('#page',{edit:false,add:false,del:false,search:false});
	
		function operFmatter (val, opt, row) {//val：要被格式化的值  options：对数据进行格式化时的参数设置，格式为： { rowId: rid, colModel: cm} rowObject：行数据
			var html_con = '<div class="operating" data-id="' + row.id + '"><span class="ui-icon ui-icon-pencil" onclick="editDjb(\''+row.id+'\',\''+row.shiyongdanwei+'\',\''+row.shebeizhongleidaima+'\')" title="修改"></span></div>';
			if(row.filepath != ""){
				html_con = '<div class="operating" data-id="' + row.id + '"><span class="ui-icon ui-icon-pencil" onclick="editDjb(\''+row.id+'\',\''+row.shiyongdanwei+'\',\''+row.shebeizhongleidaima+'\')" title="修改"></span><span class="ui-icon ui-icon-circle-arrow-s" onclick="parent.downloadFile(\''+row.filepath+'\')" title="下载登记表源文件"></span></div>';
			}
			return html_con;
		};
		
	},
	reloadData: function(data){
		this.markRow = [];//markRow 这个有什么用？  
	//	$("#grid").jqGrid('setGridParam',{url:'/basedata/jcsj_gaozhi_list.json', datatype: "json", postData: data}).trigger("reloadGrid");
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


