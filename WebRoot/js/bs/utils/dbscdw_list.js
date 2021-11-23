var cols ;
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
		$.post(path+"/dbaList!findCols.do",{},
			function (data, textStatus){
       			cols = data.cols;
       			if(data.success){
       	var height = $(window).height() - $(".grid-wrap").offset().top - 65, _self = this;
		$("#grid").jqGrid({
			url:path+'/dbaList!getList.do',
			postData: queryConditions,//此数组内容直接赋值到url上，参数类型：{name1:value1…}   
			datatype: "json",
			mtype:"post",
			autowidth: true,
			height: height,
			altRows: true, 
			rownumbers: true,
			gridview: true,//构造一行数据后添加到grid中，如果设为true则是将整个表格的数据都构造完成后再添加到grid中，但treeGrid, subGrid, or afterInsertRow 不能用
			colModel:cols,
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
			},
			gridComplete:function(){
				var row = $STONE.getGridRows("grid");
				for(var i=0;i<row.length;i++){
					var html_con = '<div class="operating" data-id="' + row[i].ANNALID + '"><span class="ui-icon ui-icon-pencil" onclick="editSc('+row[i].ANNALID+')" title="修改"></span></div>';
					//$('#grid').jqGrid('setCell',row[i].ANNALID,'operating',html_con);
					$("#grid").setCell(i+1,'operating',html_con);
				}
				
				
			}
			
		}).navGrid('#page',{edit:false,add:false,del:false,search:false});
	
		function operFmatter (row) {//val：要被格式化的值  options：对数据进行格式化时的参数设置，格式为： { rowId: rid, colModel: cm} rowObject：行数据
			var html_con = '<div class="operating" data-id="' + row.id + '"><span class="ui-icon ui-icon-pencil" onclick="editSc('+row.id+')" title="修改"></span></div>';
			return html_con;
		};
       	}
      
		},'json');
		
	}
};
 
THISPAGE.init();


