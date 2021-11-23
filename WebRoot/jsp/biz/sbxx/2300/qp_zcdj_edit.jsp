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
			   <a href="javascript:void(0)" title="保存" id="mnubtn_zcdj_edit_save${uuid}" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存</a>
				<a href="javascript:void(0)" title="下载注册登记表" id="mnubtn_baseInfo_edit_djb_xz${uuid}" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-download'">下载登记表源文件</a>
	        	<a href="javascript:void(0)" title="打印" id="mnubtn_jcsj_zcdj_edit_dy${uuid}" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-print'">打印</a>
			</div>
	    </div>
	    <div class="easyui-tabs" id = "tabs_report_ylrq${uuid}"  data-options="region:'center',split:false,border:false">
	   		<div  title="气瓶使用登记表">
		    	<form id="frm_zcdj_edit${uuid}" method="post">
		   			<div style="width: 100%;text-align: center;font-size: 30px"><br/>
		   				气瓶使用登记表
		   			</div>
		   			<br/>
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.id" id="reg_id_${uuid}"/>
	                	 <input type="hidden" name="register.filepath" id="zcdjb_filepath_${uuid}"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="气瓶"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="2300"/>
	                </div>
		   			<div>
						<div id="message_${uuid}" style="text-align: center;width: 80%"></div>
				    	<div style="width: 100%">
		   					使用单位：<input class="easyui-validatebox" style="width: 500px" required="required" name="register.shiyongdanwei" />
							<table id="grd_zcdj_edit_fujian${uuid}" class="grd_base"></table>
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
		</div>
	</div>

	<iframe id="downloadFile_${uuid}" height="0" width="0" src="" style="display: none;"></iframe>
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
		loadDjbInfo();
		//检验项目
		loadFujian();
		//提交表单
		$("#mnubtn_zcdj_edit_save${uuid}").click(function(){
			$("#frm_zcdj_edit${uuid}").form('submit', {  
			    url:"<%=path%>/register!update.do",
			    onSubmit: function(param){
			    	if(!$(this).form("validate")) return false;
					$MaskLayer.show("正在保存......");
					param.jyxm = JSON.stringify(getDatagridAllRows("#grd_zcdj_edit_fujian${uuid}"));
					return true;
			    },
			    success:function(data){
			        data = $.parseJSON(data);
			        $MaskLayer.hide();
			    	if(data.success){
			    		$("#message_${uuid}").html("<h4><font color='red'>保存成功！</font></h4>");
					    $("#${param.gridid}").datagrid("reload");
						var rows = $("#grd_zcdj_edit_fujian${uuid}").datagrid("getRows");
				    	for(var i = 0;i<rows.length;i++){
				      		$('#grd_zcdj_edit_fujian${uuid}').datagrid('beginEdit',i);
				    	}
			    	}else{
			    		$("#message_${uuid}").html("");
			    		$Error.show(data);
				    	$.messager.alert('友情提示','对不起，保存不成功！');
			    	}
			    }
			});
		});
		//下载登记表
		$("#mnubtn_baseInfo_edit_djb_xz${uuid}").click(function(){
			var path = $("#zcdjb_filepath_${uuid}").attr("value");
			if(path == ""){
				$.messager.alert('友情提示','未找到源文件，该登记表可能是新建的');
				return false;
			}else{
				document.getElementById("downloadFile_${uuid}").src="<%=path%>/upload!downloadFile.do?path="+encodeURI(encodeURI(path));
			}
		});
			//打印
			$("#mnubtn_jcsj_zcdj_edit_dy${uuid}").click(function(){
				var id = $("#reg_id_${uuid}").attr("value");
			//	window.open("/WHSE/register!djbDyByJsp.do?id="+id);
				openwindow("<%=path%>/jsp/biz/jcsj/zcdj/PrintPage.html?urls="+id+"&bglx=yl",400,200);
			});
		
	});
	function loadDjbInfo(){
		$.post("<%=path%>/register!getById.do",{id:"${param.id}"},
			function (data, textStatus){
				data = data.register;
				$("#frm_zcdj_edit${uuid}").form("load",{
					"register.id":data.id,
					"register.filepath":data.filepath,
					"register.shiyongdanwei":data.shiyongdanwei,
					"register.danweifarendaibiao":data.danweifarendaibiao,
					"register.fr_riqi":$Utils.date.format(data.fr_riqi),
					"register.jingbanren":data.jingbanren,
					"register.jbr_riqi":$Utils.date.format(data.jbr_riqi),
					"register.jcjg_fuzeren":data.jcjg_fuzeren,
					"register.jcjg_riqi":$Utils.date.format(data.jcjg_riqi),
					"register.zhucedengjijigou":data.zhucedengjijigou
				});
		},"json");
	}
	function loadFujian(){
  		$("#grd_zcdj_edit_fujian${uuid}").datagrid({
			url:"<%=path%>/registerList!getListByQP.do?id=${param.id}",
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
								$('#grd_zcdj_edit_fujian${uuid}').datagrid('appendRow',{cedianbianhao1:''});
								var editIndex = $('#grd_zcdj_edit_fujian${uuid}').datagrid('getRows').length-1;
								$('#grd_zcdj_edit_fujian${uuid}').datagrid('beginEdit', editIndex);
		    	     }
		    },{
		    	 text : "删除",
		    	 iconCls : "icon-cancel",
		    	     handler : function() {
		    			 var rows = $('#grd_zcdj_edit_fujian${uuid}').datagrid('getSelections');
		    			 for(var i = 0;i<rows.length;i++){
		    				var index = $('#grd_zcdj_edit_fujian${uuid}').datagrid('getRowIndex',rows[i]);
		    	         	$("#grd_zcdj_edit_fujian${uuid}").datagrid('deleteRow', index);
		    			 }
		    	     }
		    }],
		    onLoadSuccess:function(index,row){
				var rows = $("#grd_zcdj_edit_fujian${uuid}").datagrid("getRows");
		    	for(var i = 0;i<rows.length;i++){
		      		$('#grd_zcdj_edit_fujian${uuid}').datagrid('beginEdit',i);
		    	}
		    }
		});
  	};
			//使window.open弹出的窗口居中
			function openwindow(url,iWidth,iHeight) {
				var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
				var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
				var i=window.open("","批量打印",'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
				setTimeout(function(){
					i.location=url;
				}, 600);
			}
	</script> 