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
		var djzbhSeach = "" == djzbh ? "" : "&dengjizhengbianhao="+encodeURI(encodeURI(djzbh));
		var colModels = [//fixed列宽度是否要固定不可变
						{name:'id', label:'', index:'id',hidden:true, align:"center"},
						{name:'zcstatus', label:'状态', index:'zcstatus', width:120, align:"center",hidden:true},
						{name:'shiyongdanweiId', label:'ID', index:'shiyongdanweiId', width:120, align:"center",hidden:true},
						{name:'shebeizhongleidaima', label:'设备种类代码', index:'shebeizhongleidaima', width:120, align:"center",hidden:true},
						{name:'shiyongdanwei', label:'使用单位', index:'shiyongdanwei', width:120, align:"center"},
						{name:'shebeimingcheng', label:'设备名称', index:'shebeimingcheng', width:80, align:"center"},
						{name:'shebeixinghao', label:'型号', index:'shebeixinghao', width:100,align:"center"},
						{name:'dengjizhengbianhao', label:'登记证编号', index:'dengjizhengbianhao', width:100,align:"center"},
						{name:'zhucedaima', label:'注册代码', index:'zhucedaima', width:160, align:"center"},
						{name:'shebeileibie' , label:'设备类别', index:'shebeileibie', width:100, align:"center"},	
						{name:'shi' , label:'所在市', index:'shi', width:60, align:"center"},	
						{name:'quhuamingcheng' , label:'区划名称', index:'quhuamingcheng', width:80, align:"center"},	
						{name:'xiangzhen' , label:'乡镇', index:'quhuamingcheng', width:80, align:"center"},	
						{name:'xiacijianyanriqi' , label:'下次检验日期', index:'xiacijianyanriqi', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}},
						{name:'biaozhuleixing' , label:'标注类型', index:'biaozhuleixing', width:80, align:"center",hidden:true,
			        		formatter:function(value){
				        		if(value != ""){
				        			return value;
				        		}else{
				        			return "--";
				        		}
			        	}},
						{name:'operating', label:'查看',width:40, fixed:true, formatter:operFmatter, align:"center"}
						]; 
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+'/seList!getListForZhuCe.do?zt='+zt+'&zcstatus='+zst+'&sydwid='+sydwid+'&ty='+ty+'&qp='+qp+'&gd='+gd+djzbhSeach,
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
	//		sortname: 'gaozhiriqi',    
			sortorder: "desc", 
			pager: "#page",  
			rowNum: 10,  
			rowList:[10,20,30,50,100,150,200],     
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
		function operFmatter (val, opt, row) {//val：要被格式化的值  options：对数据进行格式化时的参数设置，格式为： { rowId: rid, colModel: cm} rowObject：行数据
			var html_con = '<div class="operating" data-id="' + row.id + '">' +
			'<span class="ui-icon ui-icon-pencil" onclick="editSe(\''+row.id+'\',\''+row.shebeizhonglei+'\',\''+row.dengjizhengbianhao+'\',\''+row.shebeizhongleidaima+'\')" title="修改"></span>' +
			'<br><span class="ui-icon ui-icon-script" onclick="sbhx(\''+row.id+'\')" title="设备画像"></span>'+
			'</div>';
			return html_con;
		};
		
	}
};
 
THISPAGE.init();


