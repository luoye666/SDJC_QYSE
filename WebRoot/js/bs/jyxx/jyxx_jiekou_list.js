var queryConditions = {
	matchCon: ''
}, SYSTEM = parent.SYSTEM, VERSION = parent.SYSTEM.siType;
var THISPAGE = {
	init: function(data){
		this.initDom();
		this.loadGrid();			
	},
	initDom: function(){
	},
	loadGrid: function(){
		var height = $(window).height() - $(".grid-wrap").offset().top - 65, _self = this;
		var colModels = [//fixed列宽度是否要固定不可变
						{name:'id', label:'注册代码', index:'id', width:100, align:"center",hidden:true},
						{name:'zhucedaima', label:'注册代码', index:'zhucedaima', width:120, align:"center"},
						{name:'xm', label:'检验类别', index:'xm', width:80, align:"center"},
						{name:'jianyanriqi', label:'检验日期', index:'jianyanriqi', width:100, align:"center",
							formatter:function(value,opt,row){
								if("" == value || undefined == value){
									return "";
								}else{
									return SYSTEM.date.format(value,'yyyy-MM-dd');
								}
						}},
						{name:'xiacijianyanriqi' , label:'下次检验日期', index:'xiacijianyanriqi', width:90, align:"center",
							formatter:function(value,opt,row){
								if("" == value || undefined == value){
									return "";
								}else{
									return SYSTEM.date.format(value,'yyyy-MM-dd');
								}
								
						}},
						{name:'bianhao', label:'检验报告编号', index:'bianhao', width:90,align:"center"},
						{name:'jianyanjielun', label:'检验结论', index:'jianyanjielun', width:100,align:"center"},
						{name:'jianyanjigou', label:'检验机构', index:'jianyanjigou', width:100,align:"center"},
						{name:'shangchuanshijian', label:'上传时间', index:'shangchuanshijian', width:100,align:"center",
							formatter:function(value,opt,row){
								if("" == value || undefined == value){
									return "";
								}else{
									return SYSTEM.date.format(value,'yyyy-MM-dd hh:mm')
								}
						}},
						{name:'gengxinshijian', label:'更新时间', index:'gengxinshijian', width:100,align:"center",
							formatter:function(value,opt,row){
								if("" == value || undefined == value){
									return "";
								}else{
									return SYSTEM.date.format(value,'yyyy-MM-dd hh:mm');
								}
						}},
						{name:'beizhu', label:'更新失败原因', index:'beizhu', width:100,align:"center"}
						]; 
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+'/jyxxList!getJieKouList.do?gxstate='+gxstate,
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
			},
			gridComplete:function(){
				if("wgx" == info){
					$("#grid").jqGrid('setGridParam',{}).jqGrid('hideCol',["gengxinshijian","beizhu"]);
					$("#grid").setGridWidth($(window).width()-30);
				}else if("ygx" == info){
					$("#grid").jqGrid('setGridParam',{}).jqGrid('hideCol',["beizhu"]);
					$("#grid").setGridWidth($(window).width()-30);
				}
			}
		}).navGrid('#page',{edit:false,add:false,del:false,search:false});
	
		
	}
};
 
THISPAGE.init();


