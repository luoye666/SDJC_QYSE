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
						{name:'jdjctype', label:'检查记录类型', index:'jdjctype', width:120, align:"center",
							formatter:function(value){
								if("" == value){
									return "";
								}else if("01" == value){
				        			return "锅炉使用情况检查";
				        		}else if("02" == value){
				        			return "电梯使用情况检查";
				        		}else if("03" == value){
				        			return "大型游乐设施使用情况检查";
				        		}else if("04" == value){
				        			return "生产单位现场安全检查";
				        		}else if("05" == value){
				        			return "使用单位安全管理情况";
				        		}else if("06" == value){
				        			return "压力容器使用情况检查";
				        		}else if("07" == value){
				        			return "压力管道使用情况检查";
				        		}else if("08" == value){
				        			return "起重机械使用情况检查";
				        		}else if("09" == value){
				        			return "客运索道使用情况检查";
				        		}else if("10" == value){
				        			return "场（厂）内专用机动车辆使用情况检查";
				        		}else if("11" == value){
				        			return "气瓶（移动式压力容器）充装情况检查";
				        		}
							}
						},
						{name:'jdjcstartdate', label:'检查开始日期', index:'jdjcstartdate', width:100, align:"center",formatter:function(value){
							return SYSTEM.date.format(value,'yyyy-MM-dd hh:mm');
						}},
						{name:'jdjcenddate', label:'检查结束日期', index:'jdjcenddate', width:100, align:"center",formatter:function(value){
							return SYSTEM.date.format(value,'yyyy-MM-dd hh:mm');
						}},
						{name:'jdjcname', label:'被检查单位名称', index:'jdjcname', width:100,align:"center"},
						{name:'jdjcperson', label:'被检查单位联系人', index:'jdjcperson', width:100,align:"center"},
						{name:'jdjcaddress', label:'被检查单位地址', index:'jdjcaddress', width:100, align:"center"},
						{name:'jdjctel', label:'被检查单位联系人电话', index:'jdjctel', width:100, align:"center"},
			        	{name:'jdjcregistercode', label:'使用登记代码', hidden:true, index:'jdjcregistercode', width:100,align:"center"},
			        	{name:'jdjcstate', label:'提交状态', index:'jdjcstate', width:50,align:"center",
			        		formatter:function(value){
								if("0" == value){
				        			return "未提交";
				        		}else if("1" == value){
				        			return "已提交";
				        		}
							}
			        	},
			        	{name:'jdjcbianhao', label:'产品编号', index:'jdjcbianhao',hidden:true, width:100,align:"center"},
			        	{name:'jdjcproblem', label:'安全监督检查中发现的主要问题', index:'jdjcproblem',hidden:true, width:100,align:"center"},
			        	{name:'jdjcdellway', label:'处理措施', index:'jdjcdellway',hidden:true, width:100,align:"center"},
			        	{name:'jdjcchouchatype', label:'抽查设备类型', index:'jdjcchouchatype',hidden:true, width:100,align:"center"},
			        	{name:'jdjcbjdanwdate', label:'被检查单位对检查记录的意见日期', hidden:true,index:'jdjcbjdanwdate', width:100,align:"center",formatter:function(value){
							return SYSTEM.date.format(value,'yyyy-MM-dd');
						}},
			        	{name:'autograph', label:'被检查单位对检查记录的意见签名', index:'autograph',hidden:true, width:100,align:"center"},
			        	{name:'worker', label:'检查人员', index:'worker', hidden:true, width:100,align:"center"},
			        	{name:'recorder', label:'记录员', index:'recorder', hidden:true,width:100,align:"center"},
			        	{name:'recorddate', label:'记录日期', index:'recorddate',hidden:true, width:100,align:"center",formatter:function(value){
							return SYSTEM.date.format(value,'yyyy-MM-dd');
						}},
			        	{name:'jdjcdanweiyijian', label:'被检查单位对检查记录的意见', hidden:true,index:'jdjcdanweiyijian', width:100,align:"center"},
			        	{name:'fadingdaibiaoren', label:'法定代表人',hidden:true, index:'fadingdaibiaoren', width:100,align:"center"},
			        	{name:'jdjdcchulicuoshiyijian', label:'处理措施意见',hidden:true, index:'jdjdcchulicuoshiyijian', width:100,align:"center"},
						{name:'operating', label:'查看',width:40, fixed:true, formatter:operFmatter, align:"center"}
						]; 
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+'/jdjcjlListAction!getList.do',
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
			var html_con = '<div class="operating" data-id="' + row.id + '"><span class="ui-icon ui-icon-pencil" onclick="editAz('+row.id+')" title="修改"></span></div>';
			return html_con;
		};
		
	}
};
 
THISPAGE.init();


