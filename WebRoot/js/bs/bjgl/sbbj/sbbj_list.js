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
						{name:'id', label:'', index:'id',hidden:true, align:"center",sortable:false},
						{name:'zcstatus', label:'状态', index:'zcstatus', width:120, align:"center",hidden:true,sortable:false},
						{name:'shidaima' , label:'所在市', index:'shidaima', width:60, align:"center",hidden:true,sortable:false},	
						{name:'quhuadaima', label:'区划代码', index:'quhuadaima', width:120, align:"center",hidden:true,sortable:false},
						{name:'shiyongdanweiId', label:'ID', index:'shiyongdanweiId', width:120, align:"center",hidden:true,sortable:false},
						{name:'shebeizhongleidaima', label:'设备种类代码', index:'shebeizhongleidaima', width:120, align:"center",hidden:true,sortable:false},
						{name:'shiyongdanwei', label:'使用单位', index:'shiyongdanwei', width:120, align:"center",sortable:false},
						{name:'shebeimingcheng', label:'设备名称', index:'shebeimingcheng', width:80, align:"center",sortable:false},
						{name:'shebeixinghao', label:'型号', index:'shebeixinghao', width:100,align:"center",sortable:false},
						{name:'dengjizhengbianhao', label:'登记证编号', index:'dengjizhengbianhao', width:100,align:"center",sortable:false},
						{name:'zhucedaima', label:'注册代码', index:'zhucedaima', width:160, align:"center",sortable:false},
						{name:'shebeileibie' , label:'设备类别', index:'shebeileibie', width:100, align:"center",sortable:false},	
						{name:'shi' , label:'所在市', index:'shi', width:60, align:"center",sortable:false},	
						{name:'quhuamingcheng' , label:'区划名称', index:'quhuamingcheng', width:80, align:"center",sortable:false},	
						{name:'xiangzhen' , label:'乡镇', index:'quhuamingcheng', width:80, align:"center",sortable:false},	
						{name:'xiacijianyanriqi' , label:'下次检验日期', index:'xiacijianyanriqi', width:100, align:"center",sortable:true,formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}}
						]; 
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+'/seList!getListForZhuCe.do?zt=all&zcstatus=1&ty=1',
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
			sortable:true,
			sortorder: "desc", 
			sortname: 'xiacijianyanriqi',
			pager: "#page",  
			rowNum: 10,  
			rowList:[10,20,30,50],     
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
					
			    	// varchar2(10) 设备状态 0待办 1在用 2停用 3拆除
			    	var d = new Date();
			    	var m = (d.getMonth()+1);
			    	if(m.length != 2){
			    		m = "0"+m;
			    	}
			    	var v = d.getFullYear()+"-"+m+"-"+d.getDate();
			    	var m = (d.getMonth()+2);
			    	if(m.length != 2){
			    		m = "0"+m;
			    	}
			    	var baojing = d.getFullYear()+"-"+m+"-"+d.getDate();
			    	//2014-06-30   2015-06-30
			    	if(Date.parse(new Date(datePlas(baojing))) <= Date.parse(new Date(datePlas(rowData.xiacijianyanriqi)))){
						$("#"+rowData.id).css("color","#008000");
			    		//2014-08-7   2014-09-7
			    	}else if(Date.parse(new Date(datePlas(baojing))) >= Date.parse(new Date(datePlas(rowData.xiacijianyanriqi))) && Date.parse(new Date(datePlas(v))) <= Date.parse(new Date(datePlas(rowData.xiacijianyanriqi)))){
			    		$("#"+rowData.id).css("color","#FF9900");
			    	}else{
			    		$("#"+rowData.id).css("color","#FF0000");
			    	}
					
					if(rowData.zcstatus=='3'){
						$("#"+rowData.id).css("color","#6600cc");
					}else if(rowData.zcstatus=='5'){
						$("#"+rowData.id).css("color","black");
					}
					
				}
				return true;
			}
		}).navGrid('#page',{edit:false,add:false,del:false,search:false});
		
	}
};
 
THISPAGE.init();


