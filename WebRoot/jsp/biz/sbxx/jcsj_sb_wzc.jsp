<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<!-- 页面顶部菜单 -->
	<div id="mnu_jcsj_sb_wzc_BodyTop" class="mnu_baseBodyTop">
		<div class="panel-header">
			<a href="javascript:void(0)" title="导入数据" id="mnubtn_jcsj_sb_wzc_hqsj" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-database-go'">导入数据</a>
	        <span id="mnu_button_show_wzc"></span>
	    </div>
	</div>
	
	<!-- 上传div -->
	<div id="scwindow" class="easyui-window" title="导入设备信息" collapsible="false" minimizable="false" maximizable="false" data-options="modal:true,closed:true" style="width:500px;height:250px;padding:10px;"></div>
	<!-- Grid工具栏 -->
	<div id="tlb_jcsj_sb_wzc_Grid" class="tlb_baseGrid">
		<div>
			<!-- 条件筛选-->
			<form name="frm_jcsj_sb_wzc_search_conditions" id="frm_jcsj_sb_wzc_search_conditions">
				<table>
					<tr>
						<th>设备种类:</th>
						<td>
							<select  class="easyui-combobox" style="width: 181px;" name="shebeizhonglei" id="s_shebeizhonglei"></select>
						</td>
						<th>出厂编号:</th>
						<td><input class="easyui-validatebox" style="width: 179px;" name="chuchangbianhao"></td>
						<th>设备名称:</th>
						<td><input class="easyui-validatebox" name="shebeimingcheng" style="width: 179px;"></td>
					</tr>
					<tr>
						<th>使用单位:</th>
						<td colspan=3><input class="easyui-validatebox" name="shiyongdanwei" style="width: 430px;"></td>
					    <th>区划名称:</th>
						<td>
							<select  class="easyui-combobox" style="width: 181px;" name="quhuadaima" id="s_quhuamingcheng"></select>
						</td>
					</tr>	
					<tr>
						<th>下次检验日期：</th>
						<td colspan="3"><input class="easyui-datebox" name="xiacijianyanriqi" style="width:178px;">
						 ~ <input class="easyui-datebox" name="xiacijianyanriqiend" style="width:178px;"></td>
						<th>下次检验日期是否为空:</th>
						<td><select class="easyui-combobox" name="isflag" style="width:178px;">
							<option value=""></option>
							<option value="0">否</option>
							<option value="1">是</option>
						</select></td>
					</tr>
					<tr>
						<td>
							<a id="btn_jcsj_sb_wzc_search_submit" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
							<a id="btn_jcsj_sb_wzc_search_cancel" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-arrow-undo'">清空</a>
						</td>	
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- Grid表格 -->
	<table id="grd_jcsj_sb_ycz" class="grd_base"></table>
	<!-- 编辑设备内容页面 -->
    <div id="win_jcsj_sb_edit" class="easyui-window unit_window" title="编辑设备内容" style="width:580px;height:580px;" data-options="cache:false,modal:true,closed:true,iconCls:'<%=IConstant.WINDOW_ICON%>'"></div>
	<!-- 颜色显示 -->
	<table width="100%">
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="4px"></td>
					</tr>
					<tr>
						<td width="12px" bgcolor="black" nowrap style="border-bottom:2px solid white"></td>
						<td width="50px" nowrap>&nbsp;<font color="#008000">合格</font></td>
						
						<td width="12px" bgcolor="#F75000" nowrap style="border-bottom:2px solid white"></td>
						<td width="50px" nowrap>&nbsp;<font color="#F75000">到期</font></td>
						<td width="100%"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<!-- 脚本 -->
	<script type="text/javascript">
		/**JavaScript全局变量声明*/
		/**JavaScript函数声明*/
		//编辑设备信息方法
		function editSe(id,zldm,ccbh){
		 	if(zldm=="1000"){
		    	$Index.loadTabsAdd("<%=path%>/jsp/biz/jcsj/1000/jscs_sb_yzc_1000.jsp?id="+id+"&lx=1&note=${param.note}",ccbh);
		    	return false
		    }
		     if(zldm=="2000"){
		    	$Index.loadTabsAdd("<%=path%>/jsp/biz/jcsj/2000/jscs_sb_yzc_2000.jsp?id="+id+"&lx=1&note=${param.note}",ccbh);
		    	return false
		    }
		    if(zldm=="3000"){
		    	$Index.loadTabsAdd("<%=path%>/jsp/biz/jcsj/3000/jscs_sb_yzc_3000.jsp?id="+id+"&lx=1&note=${param.note}",ccbh);
		    	return false
		    }
		    if(zldm=="4000"){
		    	$Index.loadTabsAdd("<%=path%>/jsp/biz/jcsj/4000/jscs_sb_yzc_4000.jsp?id="+id+"&lx=1&note=${param.note}",ccbh);
		    	return false
		    }
		    if(zldm=="5000"){
		    	$Index.loadTabsAdd("<%=path%>/jsp/biz/jcsj/5000/jscs_sb_yzc_5000.jsp?id="+id+"&lx=1&note=${param.note}",ccbh);
		    	return false
		    }
		    return false;
		}
		
		/**页面所需资源初始化*/
		$().ready(function(){
			
			//人员信息Grid初始化
			$("#grd_jcsj_sb_ycz").datagrid({
				url:"<%=path%>/seList!getListForWeiZhuCe.do",
				singleSelect:false,
				nowrap:false,
				pagination:true,
				pagePosition:top,
				fitColumns:true,
				rownumbers:true,
				height:400,
				striped:true,
				rownumbers:true,
			    columns:[[
					{field:'ck',checkbox:true,width:100,align:'center'},      
			        {field:'id',title:'编号',width:100,align:'center',hidden:true},
			        {field:'shiyongdanwei',title:'使用单位',width:120,align:'center'},
			        {field:'shebeimingcheng',title:'设备名称',width:60,align:'center'},
			        {field:'shebeixinghao',title:'型号',width:50,align:'center'},  
			        {field:'chuchangbianhao',title:'出厂编号',width:80,align:'center'},
			        {field:'shebeileibie',title:'设备类别',width:80,align:'center'},
			        {field:'quhuamingcheng',title:'区划名称',width:50,align:'center'},
			        {field:'xiacijianyanriqi',title:'下次检验日期',width:80,align:'center',
			        	formatter:function(value){
			        		return $Utils.date.format(value);
			        	}	
			        },
			        {field:'zcstatus',title:'使用状态',width:30,align:'center',
			        	formatter:function(value){
			        		if(value == "0"){
			        			return "未注册";
			        		}else{
			        			return "未知";
			        		}
			        	}},
			        {field:'access',title:'查看',width:40,align:'center',
			        	formatter: function(value,row,index){
			        		value = '<a href="javascript:void(0)" onclick="editSe('+row.id+','+row.shebeizhongleidaima+','+"'"+row.chuchangbianhao+"'"+')"><img title="编辑设备内容" src="<%=path%>/images/flow_edit.png" /></a>';
							return value;
					}},
			    ]],
			    rowStyler: function(index,row){
			    	// varchar2(10) 设备状态 0待办 1在用 2停用 3拆除
			    	var d = new Date();
			    	var m = (d.getMonth()+1);
			    	if(m.length != 2){
			    		m = "0"+m;
			    	}
			    	var v = d.getFullYear()+"-"+m+"-"+d.getDate();
			    	if(Date.parse(v) - Date.parse($Utils.date.format(row.xiacijianyanriqi)) >= 0){
			    		return "color:#F75000";
			    	}
				}
			});
			
			//设备种类
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SE_TYPE"},
	    			function (data, textStatus){
						$("#s_shebeizhonglei").combobox({
							valueField:'code',
							textField:'name',
							data:data.dicDatas
						});
	    	},"JSON");
			//所属区县
			$.post("<%=path%>/dicList!getDataListByCodeAndValue.do",{code:"SD_XZQH",value:"3710"},
	    			function (data, textStatus){
						$("#s_quhuamingcheng").combobox({
							valueField:'code',
							textField:'name',
							data:data.dicDatas
						});
	    	},"JSON");
		});
		
		/**页面元素事件注册*/
		$().ready(function(){
			//通过父id获取当前树下的所有按钮
			$.post("<%=path%>/menuList!getListMenus.do",{id:"${param.note}"},
    			function (data, textStatus){
					$.each(data.menusList,function(index,value){
						if(value.qtip == "list"){//该按钮为当前页面使用就是 !=0 如果是子页面列表则 == 0
		  					$("#mnu_button_show_wzc").html($("#mnu_button_show_wzc").html()+
		  					'<a href="javascript:void(0)" title="'+value.title+'" id="'+value.btnCode+'" class="easyui-linkbutton">'+value.title+'</a>');
		  					$('#'+value.btnCode).linkbutton({
							    iconCls: value.iconCls,
							    plain:true
							});
						}
	  				});
	    	},"JSON");
			
			/*************************************************************************************************************************/
			//添加人员按钮点击
			$("#mnubtn_jcsj_sb_wzc_hqsj").click(function(){
				$("#scwindow").window({
					  href:"<%=path%>/jsp/biz/jcsj/SimpleFileUpload_WZC.jsp"
	            });
				$("#scwindow").window('open');
			});
			//删除按钮
			$("#mnu_button_show_wzc").delegate('#mnubtn_jcsj_sb_wzc_sc','click',function(){
			//$("#mnubtn_jcsj_sb_wzc_sc").live('click',function(){
				var ids = $STONE.getGridCheckedIds("#grd_jcsj_sb_ycz");
				var checkedNum = $STONE.getGridChecked("#grd_jcsj_sb_ycz").length;
				if(checkedNum==0){
					$.messager.alert("警告","请选择要删除的设备信息!","info");
					return false;
				}
				$.messager.confirm("警告","确实要删除选中的"+checkedNum+"条数据吗?", function(result){  
	                if (result){
	                	//删除操作
	                	$.post("<%=path%>/se!deleteByIds.do",{ids:ids},
		        				function (data, textStatus){
		                			$("#grd_jcsj_sb_ycz").datagrid("reload");
		        	    });
	                }  
	            });  
			});
			
			//停用按钮
			$("#mnubtn_jcsj_sb_yty_sc").click(function(){
				var ids = $STONE.getGridCheckedIds("#grd_jcsj_sb_ycz");
				var checkedNum = $STONE.getGridChecked("#grd_jcsj_sb_ycz").length;
				if(checkedNum==0){
					$.messager.alert("警告","请选择要停用的设备信息!","info");
					return false;
				}
				$.messager.confirm("警告","确实要停用选中的"+checkedNum+"条数据吗?", function(result){  
	                if (result){
	                	//停用操作
	                	$.post("<%=path%>/se!updateZcstateIsStop.do",{ids:ids},
		        				function (data, textStatus){
		                			$("#grd_jcsj_sb_ycz").datagrid("reload");
		        	    });
	                }  
	            });  
			});
			
			/*************************************************************************************************************************/
			//条件筛选查询按钮点击
			$("#btn_jcsj_sb_wzc_search_submit").click(function(){
				var params = $STONE.formSerializedToJSON("#frm_jcsj_sb_wzc_search_conditions");
				$STONE.sc_setGridQueryParams("#grd_jcsj_sb_ycz",params);
			});
			
			//条件筛选清空按钮点击
			$("#btn_jcsj_sb_wzc_search_cancel").click(function(){
				$("#s_quhuamingcheng").combobox('clear');
				$("#s_shebeizhonglei").combobox('clear');
				$STONE.formClear("#frm_jcsj_sb_wzc_search_conditions");
			});
			
		})
		
	</script>