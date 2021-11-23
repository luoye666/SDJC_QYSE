var queryConditions = {
	matchCon: ''
},SYSTEM = parent.parent.SYSTEM, VERSION = parent.parent.SYSTEM.siType;
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
		var colModels = "";
		if(seCode == 2){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'region', label:'所属地市', index:'region', width:60, align:"center"},
						{name:'prodaddrxx', label:'详细地址', index:'prodaddrxx', width:100, align:"center"},
						]; 
		}else if(seCode == 3){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'itemname', label:'设备类别', index:'itemname', width:100, align:"center"},
						{name:'certno', label:'证书号', index:'certno', width:120, align:"center"},
						{name:'sdate', label:'开始日期', index:'sdate', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}},
						{name:'edate', label:'结束日期', index:'edate', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}}, 
						{name:'issuecertorg', label:'发证机构', index:'fazhengjigou', width:80, align:"center"},
						{name:'certchangedate', label:'变更日期', index:'certchangedate', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}}, 
						{name:'certtype', label:'发证类型', index:'fazhengleixing', width:100, align:"center",formatter:function(value){
							//0市发 1省发 2国发
							if("0" == value){
								return "市发";
							}else if("1" == value){
								return "省发"
							}else if("2" == value){
								return "国发"
							}else{
								return value;
							}
							
						}},
						]; 
		}else if(seCode == 4){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'itemname', label:'设备种类', index:'itemname', width:100, align:"center"},
						{name:'setypename', label:'申请类别', index:'setypename', width:120, align:"center"},
						{name:'serankname', label:'级别', index:'serankname', width:80, align:"center"},
						{name:'kindname', label:'品种', index:'kindname', width:100, align:"center"},
						{name:'parameter', label:'参数', index:'parameter', width:100, align:"center"},
						{name:'delegateitem', label:'产品', index:'delegateitem', width:100, align:"center"},
						]; 
		}else if(seCode == 5){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'itemname', label:'认证项目', index:'itemname', width:100, align:"center"},
						{name:'proveorgan', label:'认证机构', index:'proveorgan', width:120, align:"center"},
						{name:'provesdate', label:'认证日期', index:'provesdate', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}},
						{name:'proveedate', label:'认证有效期', index:'proveedate', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}}, 
						]; 
		}else if(seCode == 6 || seCode == 7){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'year', label:'年份', index:'year', width:80, align:"center"},
						{name:'equtype', label:'设备类别', index:'equtype', width:120, align:"center"},
						{name:'equcount', label:'设计数量', index:'equcount', width:120, align:"center"},
						
						]; 
		}else if(seCode == 8){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'project', label:'工程项目', index:'project', width:100, align:"center"},
						{name:'productype', label:'类别', index:'productype', width:120, align:"center"},
						{name:'rankname', label:'级别', index:'rankname', width:80, align:"center"},
						{name:'name', label:'名称', index:'name', width:100, align:"center"},
						{name:'pressure', label:'压力', index:'pressure', width:50, align:"center"},
						{name:'temperature', label:'温度', index:'temperature', width:50, align:"center"},
						{name:'medium', label:'介质', index:'medium', width:100, align:"center"},
						{name:'model', label:'规格', index:'model', width:120, align:"center"},
						{name:'stuff', label:'主要材质', index:'stuff', width:80, align:"center"},
						{name:'designperson', label:'设计人', index:'designperson', width:100, align:"center"},
						{name:'auditingperson', label:'校核人', index:'auditingperson', width:100, align:"center"},
						{name:'auditing', label:'审核人', index:'auditing', width:100, align:"center"},
						
						{name:'lookthrough', label:'审定人', index:'lookthrough', width:100, align:"center"},
						{name:'grade', label:'设计质量评定等级', index:'grade', width:100, align:"center"},
						{name:'makedate', label:'制造（安装）日期', index:'makedate', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}}, 
						{name:'usecircs', label:'制造使用情况', index:'auditing', width:100, align:"center"},
						]; 
		}else if(seCode == 9){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'name', label:'姓名', index:'name', width:100, align:"center"},
						{name:'cardtype', label:'证件类型', index:'cardtype', width:50, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else if(value == "1"){
								return "身份证";
							}else{
								return "其它";
							}
						}}, 
						{name:'card', label:'身份证编号', index:'card', width:120, align:"center"},
						{name:'xueliname', label:'学历', index:'xueliname', width:80, align:"center"},
						{name:'dutyname', label:'职称', index:'dutyname', width:80, align:"center"},
						{name:'startworkdate', label:'从事设计工作日期', index:'startworkdate', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}}, 
						{name:'prodname', label:'设计主要产品名称', index:'prodname', width:80, align:"center"},
						{name:'devisepost', label:'设计岗位', index:'devisepost', width:80, align:"center"},
						]; 
		}else if(seCode == 10){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'name', label:'设备名称', index:'name', width:100, align:"center"},
						{name:'ability', label:'设备能力（主要性能）', index:'ability', width:100, align:"center"},
						{name:'count', label:'设备数', index:'count', width:120, align:"center"},
						{name:'model', label:'型号', index:'model', width:80, align:"center"},
						{name:'spec', label:'规格', index:'spec', width:80, align:"center"},
						]; 
		}else if(seCode == 11){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'year', label:'年份', index:'year', width:100, align:"center"},
						{name:'setype', label:'代表产品品种（型式）', index:'setype', width:100, align:"center"},
						{name:'secount', label:'数量', index:'secount', width:120, align:"center"},
						{name:'production', label:'产值', index:'production', width:80, align:"center"},
						]; 
		}else if(seCode == 12){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'department', label:'部门', index:'department', width:100, align:"center"},
						{name:'departmenperson', label:'负责人', index:'departmenperson', width:100, align:"center"},
						{name:'departmentpersoncount', label:'人数', index:'departmentpersoncount', width:120, align:"center"},
						]; 
		}else if(seCode == 13){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'busyworkProject', label:'作业项目', index:'busyworkProject', width:100, align:"center"},
						{name:'name', label:'姓名', index:'name', width:100, align:"center"},
						{name:'cardtype', label:'证件类型', index:'cardtype', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else if(value == "1"){
								return "身份证";
							}else{
								return "其它";
							}
						}}, 
						{name:'card', label:'身份证编号', index:'card', width:120, align:"center"},
						{name:'speciality', label:'所学专业', index:'speciality', width:120, align:"center"},
						{name:'xueliname', label:'学历', index:'xueliname', width:80, align:"center"},
						{name:'dutyname', label:'职称描述', index:'dutyname', width:80, align:"center"},
						{name:'type', label:'类别（方法）', index:'type', width:80, align:"center"},
						{name:'grade', label:'级别（项目）', index:'grade', width:80, align:"center"},
						]; 
		}else if(seCode == 15 || seCode == 14){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'name', label:'仪器设备名称', index:'name', width:100, align:"center"},
						{name:'ability', label:'仪器设备能力（主要性能）', index:'ability', width:100, align:"center"},
						{name:'count', label:'仪器设备数', index:'count', width:80, align:"center"},
						]; 
		}else if( seCode == 16){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'name', label:'仪器设备名称', index:'name', width:100, align:"center"},
						{name:'ability', label:'减压范围', index:'ability', width:100, align:"center"},
						]; 
		}else if(seCode == 17){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'unitstype', label:'类型', index:'unitstype', width:100, align:"center"},
						{name:'fbproject', label:'分包、外协项目', index:'fbproject', width:100, align:"center"},
						{name:'fbunitsname', label:'分包、外协单位名称', index:'fbunitsname', width:120, align:"center"},
						{name:'fborganno', label:'组织机构代码', index:'fborganno', width:120, align:"center"},
						]; 
		}else if(seCode == 18){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'itemname', label:'气瓶充装种类', index:'itemname', width:100, align:"center"},
						{name:'serankname', label:'充装气体名称', index:'serankname', width:100, align:"center"},
						{name:'gasability', label:'气体充装能力m3', index:'gasability', width:120, align:"center"},
						{name:'gasmakeability', label:'气体生产能力m3/h', index:'gasmakeability', width:120, align:"center"},
						{name:'qpnumber', label:'自有气瓶数量只', index:'qpnumber', width:50, align:"center"},
						{name:'itemIndex', label:'标识', index:'itemIndex', width:120, align:"center"},
						]; 
		}else if(seCode == 19){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'name', label:'姓名', index:'name', width:100, align:"center"},
						{name:'sex', label:'性别', index:'sex', width:50, align:"center"},
						{name:'cardtype', label:'证件类型', index:'cardtype', width:80, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else if(value == "1"){
								return "身份证";
							}else{
								return "其它";
							}
						}}, 
						{name:'card', label:'身份证编号', index:'card', width:120, align:"center"},
						{name:'dutyname', label:'职称中文描述', index:'dutyname', width:80, align:"center"},
						{name:'workpostname', label:'作业岗位', index:'workpostname', width:80, align:"center"},
						{name:'workcertno', label:'作业证编号', index:'workcertno', width:80, align:"center"},
						]; 
		}else if(seCode == 20){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'facilityname', label:'特种设备名称', index:'facilityname', width:100, align:"center"},
						{name:'serankname', label:'规格和型号', index:'facilitymodel', width:100, align:"center"},
						{name:'facilitycount', label:'数量', index:'facilitycount', width:50, align:"center"},
						{name:'makeorgan', label:'制造单位', index:'makeorgan', width:120, align:"center"},
						{name:'enrollcode', label:'自有气瓶数量只', index:'enrollcode', width:50, align:"center"},
						]; 
		}else if(seCode == 21){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'inspname', label:'特种设备名称', index:'inspname', width:100, align:"center"},
						{name:'inspmodel', label:'规格和型号', index:'inspmodel', width:100, align:"center"},
						{name:'inspcount', label:'数量', index:'inspcount', width:50, align:"center"},
						{name:'makeorgan', label:'制造单位', index:'makeorgan', width:120, align:"center"},
						{name:'completecircs', label:'完好情况', index:'completecircs', width:120, align:"center"},
						]; 
		}else if(seCode == 22){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'year', label:'年份', index:'year', width:80, align:"center"},
						{name:'gasname', label:'充装气体名称', index:'gasname', width:100, align:"center"},
						{name:'gross', label:'总量（m3或kg）', index:'gross', width:50, align:"center"},
						{name:'bottle', label:'瓶数', index:'bottle', width:50, align:"center"},
						]; 
		}else if(seCode == 23){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'itemname', label:'移动式容器品种', index:'itemname', width:100, align:"center"},
						{name:'setypename', label:'介质类别', index:'setypename', width:100, align:"center"},
						{name:'mediumname', label:'介质名称', index:'mediumname', width:120, align:"center"},
						{name:'parameter', label:'瓶数', index:'parameter', width:50, align:"center"},
						]; 
		}else if(seCode == 24){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'year', label:'年份', index:'year', width:100, align:"center"},
						{name:'mediumtype', label:'充装气体名称', index:'mediumtype', width:100, align:"center"},
						{name:'secount', label:'数量', index:'secount', width:120, align:"center"},
						{name:'production', label:'产值', index:'production', width:50, align:"center"},
						]; 
		}else if(seCode == 25){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'name', label:'姓名', index:'name', width:100, align:"center"},
						{name:'cardtype', label:'证件类型', index:'cardtype', width:50, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else if(value == "1"){
								return "身份证";
							}else{
								return "其它";
							}
						}}, 
						{name:'card', label:'身份证编号', index:'card', width:120, align:"center"},
						{name:'speciality', label:'所学专业', index:'speciality', width:120, align:"center"},
						{name:'dutyname', label:'职称', index:'dutyname', width:80, align:"center"},
						{name:'xueliname', label:'学历', index:'xueliname', width:80, align:"center"},
						{name:'busyworkProject', label:'作业项目、类别', index:'busyworkProject', width:80, align:"center"},
						]; 
		}else if(seCode == 26 || seCode == 27){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'name', label:'设备名称', index:'name', width:80, align:"center"},
						{name:'ability', label:'设备能力（主要性能）', index:'ability', width:100, align:"center"},
						{name:'count', label:'设备数', index:'count', width:50, align:"center"},
						]; 
		}else if(seCode == 28 ){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'name', label:'设备名称', index:'name', width:80, align:"center"},
						{name:'ability', label:'设备能力（主要性能）', index:'ability', width:100, align:"center"},
						]; 
		}else if(seCode == 29){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'itemname', label:'设备种类', index:'itemname', width:100, align:"center"},
						{name:'setypename', label:'申请类别', index:'setypename', width:120, align:"center"},
						{name:'serankname', label:'级别', index:'serankname', width:50, align:"center"},
						{name:'kindname', label:'品种', index:'kindname', width:100, align:"center"},
						{name:'parameter', label:'参数', index:'parameter', width:50, align:"center"},
						{name:'delegateitem', label:'产品', index:'delegateitem', width:100, align:"center"},
						{name:'isinstall', label:'安裝', index:'isinstall', width:30, align:"center"},
						{name:'isremould', label:'改造', index:'isremould', width:30, align:"center"},
						{name:'isservice', label:'維修', index:'isservice', width:30, align:"center"},
						]; 
		}else if(seCode == 30){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'year', label:'年份', index:'year', width:80, align:"center"},
						{name:'mediumtype', label:'设备类别', index:'mediumtype', width:100, align:"center"},
						{name:'grade', label:'级别', index:'grade', width:100, align:"center"},
						{name:'secount', label:'数量', index:'secount', width:80, align:"center"},
						{name:'production', label:'产值', index:'production', width:120, align:"center"},
						]; 
		}else if(seCode == 31){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'project', label:'工程项目', index:'project', width:100, align:"center"},
						{name:'completedate', label:'竣工日期', index:'completedate', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}},
						{name:'grade', label:'级别', index:'grade', width:80, align:"center"},
						{name:'kind', label:'品种', index:'kind', width:50, align:"center"},
						{name:'model', label:'型号（参数）', index:'model', width:50, align:"center"},
						{name:'name', label:'名称', index:'name', width:100, align:"center"},
						{name:'count', label:'数量（台）', index:'count', width:50, align:"center"},
						{name:'useUnits', label:'使用单位', index:'useUnits', width:100, align:"center"},
						{name:'jjUnits', label:'监检单位', index:'jjUnits', width:100, align:"center"},
						]; 
		}else if(seCode == 32){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'project', label:'工程项目', index:'project', width:100, align:"center"},
						{name:'completedate', label:'竣工日期', index:'completedate', width:100, align:"center",formatter:function(value){
							if("" == value || undefined == value){
								return "";
							}else{
								return SYSTEM.date.format(value,'yyyy-MM-dd');
							}
						}},
						{name:'type', label:'类别', index:'type', width:80, align:"center"},
						{name:'grade', label:'级别', index:'grade', width:80, align:"center"},
						{name:'parametersdrang', label:'参数（压力）', index:'parametersdrang', width:50, align:"center"},
						{name:'parameterstem', label:'参数（温度）', index:'parameterstem', width:50, align:"center"},
						{name:'parametersmedium', label:'参数（介质）', index:'parametersmedium', width:50, align:"center"},
						{name:'diameter', label:'直径', index:'diameter', width:50, align:"center"},
						{name:'stuff', label:'主要材质', index:'stuff', width:80, align:"center"},
						{name:'count', label:'数量（公里）', index:'count', width:50, align:"center"},
						{name:'useUnits', label:'使用单位', index:'useUnits', width:100, align:"center"},
						{name:'jjUnits', label:'监检单位', index:'jjUnits', width:100, align:"center"},
						]; 
		}else if(seCode == 33){
			colModels = [//fixed列宽度是否要固定不可变
						{name:'unitsName', label:'单位名称', index:'unitsName', width:100, align:"center"},
						{name:'principal', label:'负责人', index:'principal', width:80, align:"center"},
						{name:'address', label:'单位地址', index:'address', width:100, align:"center"},
						{name:'character', label:'法人性质', index:'character', width:50, align:"center"},
						]; 
		}
		
		_self.markRow = [];
		$("#grid").jqGrid({
			url:path+"/dbs!findDb.do?seCode="+seCode+"&leibie="+encodeURIComponent(leibie)+"&oid="+oid,
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
			rowList:[10,20,30],     
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
				ajaxLoadFileType();
			}
		}).navGrid('#page',{edit:false,add:false,del:false,search:false});
	
		function operFmatter (val, opt, row) {//val：要被格式化的值  options：对数据进行格式化时的参数设置，格式为： { rowId: rid, colModel: cm} rowObject：行数据
			var html_con = '<div class="operating" data-id="' + row.id + '"><span class="ui-icon ui-icon-pencil" onclick="editJszl('+row.id+')" title="修改"></span></div>';
			return html_con;
		};
		
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


