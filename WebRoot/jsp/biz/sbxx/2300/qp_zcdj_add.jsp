<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.sys.pojo.TOrgan"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="/c.tld" %>
<c:set value="${param.note}_${param.uid}" var="uuid"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
TOrgan organ = (TOrgan)session.getAttribute(IConstant.SESSION_TORGAN_CODE);
Date d = new Date();
long datetime = d.getTime();
%>
<style type="text/css">
html{
	overflow: hidden;
}
body {
font-family: Arial, Helvetica, sans-serif;
font-size:12px;
color:#666666;
background:#fff;
} 

* {
margin:0;
padding:0;
} 

a {
color:#1E7ACE;
text-decoration:none;
}
.long98{
  width:95%;
}
.long85{
  width:85%;
}
.tabjcxx {
	border-collapse:collapse; 
	text-align:center; 
	margin:0 0 0 0;
	width: 80%;
}
.tabjcxx th{
	border:1px black solid;
	text-align:center; 
	font-size:14px;
}
.tabjcxx td{
	border:1px black solid;
	font-size:12px;
	text-align:center; 
	margin:0px; 
	padding:0 0 0 0px;
}
input{
	text-align: center;
	vertical-align: middle;
}


</style>
  	<div class="easyui-layout" data-options="fit:true">  
	    <div data-options="region:'north',border:false">
	    	<!-- 页面顶部菜单 -->
			<div class="unit_topMenu">
			   <a href="javascript:void(0)" title="保存" id="mnubtn_zcdj_add_save${uuid}" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存</a>
			</div>
	    </div>
	    <div class="easyui-tabs" id = "tabs_report_ylrq${uuid}"  data-options="region:'center',split:false,border:false">
	   		<div  title="气瓶使用登记表">
		    	<form id="frm_zcdj_add${uuid}" method="post">
		   			<div style="width: 100%;text-align: center;font-size: 30px"><br/>
		   				气瓶使用登记表
		   			</div>
		   			<br/>
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.filepath"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="气瓶"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="2300"/>
	                </div>
		   			<br/>
		   			<div>
				    	<div style="width: 100%">
		   					使用单位：<input class="easyui-validatebox" style="width: 500px" required="required" name="register.shiyongdanwei" />
							<table id="grd_reports_add_ylrq_jyxm${uuid}" class="grd_base"></table>
							<div>
								审请人声明和签署：以上所列气瓶均有唯一的使用登记代码，本人对本表所填内容的真实性负责。
								申请单位法定代表人签名：
								<input class="easyui-validatebox" name="register.danweifarendaibiao" />
								日期：<input class="easyui-validatebox" name="register.fr_riqi" onclick="WdatePicker()"/>
							</div>
							<div>
								登记机关经办人：<input class="easyui-validatebox" name="register.jingbanren" />
								日期：<input class="easyui-validatebox" name="register.jbr_riqi" onclick="WdatePicker()" />
								安全监察机构负责人：<input class="easyui-validatebox" name="register.jcjg_fuzeren" />
								日期：<input class="easyui-validatebox" name="register.jcjg_riqi" onclick="WdatePicker()" />
								 登记机关：<input class="easyui-validatebox" name="register.zhucedengjijigou" />
							</div>
				    	</div>
		   			</div>
		    	</form>
		    </div>
		</div>
	</div>

	<script type="text/javascript">
	//编辑行的下标
	var rowNum = 0;
	
	function datagridEndEdit(datagrid){
		var rows = $(datagrid).datagrid("getRows");
		var result = true;
		for(var rowIndex = 0 ; rowIndex < rows.length ; rowIndex++){
			if(!$(datagrid).datagrid("validateRow",rowIndex)){
				result = false;
				break;
			}
			$(datagrid).datagrid("endEdit",rowIndex);
		}
		return result;
	}
	/**
	* 
	*/
	function getDatagridAllRows(datagrid){
		if(!datagridEndEdit(datagrid)){
			return null;
		}
		var rows = $(datagrid).datagrid("getRows");
		return rows;
	}
	/**
	* 
	*/
	$().ready(function(){
		
		//检验项目
		loadFujian();
		//提交表单
		$("#mnubtn_zcdj_add_save${uuid}").click(function(){
			$("#frm_zcdj_add${uuid}").form('submit', {  
			    url:"<%=path%>/register!save.do",
			    onSubmit: function(param){
			    	if(!$(this).form("validate")) return false;
					$MaskLayer.show("正在保存......");
					param.jyxm = JSON.stringify(getDatagridAllRows("#grd_reports_add_ylrq_jyxm${uuid}"));
					return true;
			    },
			    success:function(data){
			        data = $.parseJSON(data);
			        $MaskLayer.hide();
			    	$Index.close();
			    	if(data.success){
					    $("#${param.gridid}").datagrid("reload");
			    	}else{
			    		$Error.show(data);
				    	$.messager.alert('友情提示','对不起，保存不成功！');
			    	}
			    }
			});
		});
		
	});
	
	function loadFujian(){
  		$("#grd_reports_add_ylrq_jyxm${uuid}").datagrid({
			singleSelect:false,
			nowrap:false,
			pagination:false,
			fitColumns:true,
			striped:true,
			rownumbers:true,
		    columns:[[
				{field:'ck',checkbox:true,width:100,align:'center'},     
		        {field:'id',title:'编号',width:100,align:'center',hidden:true}, 
		        {field:'shebeipinzhong',title:'设备品种',width:90,align:'center',editor:{
		        	type:'text'
		        }},
		        {field:'chongzhuangjiezhi',title:'充装介质',width:90,align:'center',editor:{
		        	type:'text'
		        }}, 
		        {field:'zhizaodanwei',title:'制造单位',width:90,align:'center',editor:{
		        	type:'text'
		        }},
		        {field:'zhizaonianyue',title:'制造年月',width:90,align:'center',editor:{
		        	type:'text'
		        }}, 
		        {field:'gongchengyali',title:'公称压力（Mpa）',width:90,align:'center',editor:{
		        	type:'text'
		        }}, 
		        {field:'rongji',title:'容积（L）',width:90,align:'center',editor:{
		        	type:'text'
		        }}, 
		        {field:'shejibihou',title:'设计壁厚（mm）',width:90,align:'center',editor:{
		        	type:'text'
		        }}, 
		        {field:'zhyc_jianyanriqi',title:'最近一次 检验日期',width:90,align:'center',editor:{
		        	type:'text'
		        }}, 
		        {field:'xiacijianyanriqi',title:'下次检验日期',width:90,align:'center',editor:{
		        	type:'text'
		        }}, 
		        {field:'dengjidaima',title:'气瓶使用登记代码',width:90,align:'center',editor:{
		        	type:'text'
		        }}, 
		        {field:'biangengqingkuang',title:' 变更情况',width:90,align:'center',editor:{
		        	type:'text'
		        }}, 
		        {field:'tingyongqingkuang',title:' 停用 情况',width:90,align:'center',editor:{
		        	type:'text'
		        }}, 
		        {field:'chuchangbianhao',title:'出厂编号',width:90,align:'center',editor:{
		        	type:'text'
		        }}, 
		        {field:'changneibianhao',title:'厂内编号',width:90,align:'center',editor:{
		        	type:'text'
		        }}
		    ]],
		    toolbar:[ {
		    	 text : "增加",
		    	 iconCls : "icon-add",
		    	     handler : function() {
								$('#grd_reports_add_ylrq_jyxm${uuid}').datagrid('appendRow',{cedianbianhao1:''});
								var editIndex = $('#grd_reports_add_ylrq_jyxm${uuid}').datagrid('getRows').length-1;
								$('#grd_reports_add_ylrq_jyxm${uuid}').datagrid('beginEdit', editIndex);
		    	     }
		    },{
		    	 text : "删除",
		    	 iconCls : "icon-cancel",
		    	     handler : function() {
		    			 var rows = $('#grd_reports_add_ylrq_jyxm${uuid}').datagrid('getSelections');
		    			 for(var i = 0;i<rows.length;i++){
		    				var index = $('#grd_reports_add_ylrq_jyxm${uuid}').datagrid('getRowIndex',rows[i]);
		    	         	$("#grd_reports_add_ylrq_jyxm${uuid}").datagrid('deleteRow', index);
		    			 }
		    	     }
		    }],
		    onLoadSuccess:function(index,row){
				var rows = $("#grd_reports_add_ylrq_jyxm${uuid}").datagrid("getRows");
		    	for(var i = 0;i<rows.length;i++){
		      		$('#grd_reports_add_ylrq_jyxm${uuid}').datagrid('beginEdit',i);
		    	}
		    }
		});
  	};
	</script> 