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
						{name:'xingming', label:'持证人', index:'xingming', width:80, align:"center"},
						{name:'shenfenzhenghao', label:'身份证号', index:'shenfenzhenghao', width:80, align:"center"},
						{name:'zhengshubianhao', label:'证书编号', index:'zhengshubianhao', width:80, align:"center"},
						{name:'zuoyezhonglei', label:'作业种类', index:'zuoyezhonglei', width:80, align:"center"},
						{name:'sydw_id', label:'所在单位ID', index:'sydw_id', width:100,align:"center",hidden:true},
						{name:'szdw', label:'所在单位', index:'szdw', width:100,align:"center"},
						{name:'fazhengjiguan', label:'发证机关', index:'fazhengjiguan', width:100,align:"center"},
						{name:'zhengshuyouxiaoqi_end', label:'有效期至', index:'zhengshuyouxiaoqi_end', width:60,align:"center",
							formatter:function(value){
								if(value != null){
									return SYSTEM.date.format(value,'yyyy-MM-dd');
								}else{
									return "";
								}
								
						}},
						{name:'operating', label:'查看',width:40, fixed:true, formatter:operFmatter, align:"center"}
						]; 
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+'/zyryList!getList.do?sydwid='+sydwid,
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
				//获取列表数据
				var rowDatas = $("#grid").jqGrid('getRowData');
				for(var i=0;i<rowDatas.length;i++){
					var rowData = rowDatas[i]; 
			    	// varchar2(10) 设备状态 0待办 1在用 2停用 3拆除
			    	var d = new Date();
			    	var m = (d.getMonth()+1);
			    	var v = d.getFullYear()+"-"+m+"-"+d.getDate();
			    	var m = (d.getMonth()+2);
			    	var baojing = d.getFullYear()+"-"+m+"-"+d.getDate();
			    	if(rowData.zhengshuyouxiaoqi_end < d){
			    		$("#"+rowData.id).css("color","red");
			    	}
			    	var endTime = rowData.zhengshuyouxiaoqi_end.split("-");
			    	var et = new Date(endTime[1]+"-"+endTime[2]+"-"+endTime[0]);
			    	var days = parseInt((et - d)/1000/60/60/24)+1;
			    	if(days>=0 && days <= 90){//预警
			    		$("#"+rowData.id).css("color","#996600");
			    	}else if(et.getTime() < d.getTime() || rowData.zhengshuyouxiaoqi_end == ""){//超期
			    		$("#"+rowData.id).css("color","#660033");
			    	}else{//合格
			    		$("#"+rowData.id).css("color","#008000");
			    	}
			    	$.ajax({
					   type: "POST",
					   url: path+"/zyry!getSydwName.do",
					   data:'sydwid='+rowData.sydw_id,
					   dataType:"json",
					   async: false,
					   success: function(data, textStatus){
				            $("#grid").jqGrid("setCell",rowData.id,"szdw", data.name);
					   }
					});
				}
				return true;
			}
		}).navGrid('#page',{edit:false,add:false,del:false,search:false});
	
		function operFmatter (val, opt, row) {//val：要被格式化的值  options：对数据进行格式化时的参数设置，格式为： { rowId: rid, colModel: cm} rowObject：行数据
			var html_con = '<div class="operating" data-id="' + row.id + '"><span class="ui-icon ui-icon-pencil" onclick="editRyXkz('+row.id+')" title="修改"></span></div>';
			return html_con;
		};
		
	}
};
 
THISPAGE.init();


