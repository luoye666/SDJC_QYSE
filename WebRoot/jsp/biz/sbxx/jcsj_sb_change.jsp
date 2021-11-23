<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="/c.tld" %>
<c:set value="${param.note}_${param.id}" var="uuid"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 //Date nowDate = new SimpleDateFormat("yyyy-MM-dd").for
%>
<style type="text/css">

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
fieldset {
	padding:10px;
	margin-top:5px;
	border:1px solid #1E7ACE;
	background:#fff;
	width:650px;
}

fieldset legend {
	color:#1E7ACE;
	font-weight:bold;
	padding:3px 20px 3px 20px;
	border:1px solid #1E7ACE;
	background:#fff;
}
fieldset div {
	clear:left;
	margin-bottom:2px;
}
label {
	text-align:right;
	display:-moz-inline-box;
 	display:inline-block;
	width: 100px;
}
</style>
  	<div class="easyui-layout" data-options="fit:true">  
	    <div data-options="region:'north',border:false">
	    	<!-- 页面顶部菜单 -->
			<div class="unit_topMenu">
				<a href="javascript:void(0)" title="保存" id="mnubtn_jcsj_biangeng${uuid}" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存</a>
			</div>
	    </div>
	    <div class="easyui-tabs" id="tabs_jcsj_biangeng${uuid}" data-options="region:'center',split:false,border:false">
	    	<div title="基础数据变更">
		    	<form id="frm_jcsj_biangeng_edit${uuid}" method="post">
			    	<div class="formHiddenRegion">
	                </div>
					<fieldset>
						<legend>原基础数据</legend>
						<div>
						    <label>使用单位:</label>
						    <input  class="easyui-validatebox" style="width: 365px;" readonly="readonly" name="elevatorParam.shiyongdanwei"/><br/>
						 </div>
					</fieldset>
					<fieldset>
						<legend>变更后数据</legend>
						<div>
						    <label>使用单位:</label>
						    <input  class="easyui-validatebox" style="width: 365px;" name="baseInfoChange.shiyongdanwei"/><br/>
						 </div>
					</fieldset>
		    	</form>
		    </div>
		</div>
	</div>
	<script type="text/javascript">
	$().ready(function(){
		//加载数据
		$.post("<%=path%>/se!getById.do",{id:"${param.id}",zldm:"${param.zldm}"},
        	function (data, textStatus){
        		data = data.se;
				$("#frm_jcsj_biangeng_edit${uuid}").form("load",{
				  	 "elevatorParam.shiyongdanwei":data.shiyongdanwei,
				});
 		},"json");
	
	
		//保存
		$("#mnubtn_jcsj_biangeng${uuid}").click(function(){
			$("#frm_jcsj_biangeng_edit${uuid}").form('submit', {  
			    url:"<%=path%>/se!change.do?id=${param.id}",
			    onSubmit: function(param){
			    	if(!$(this).form("validate")) return false;
					$MaskLayer.show("正在保存报告信息。。");
					//param.jyxm = JSON.stringify(getDatagridAllRows("#grd_reports_edit_yyht_jyxm${uuid}"));
					return true;
			    },
			    success:function(data){
			   		$MaskLayer.hide();
			        data = $.parseJSON(data);
			    	if(data.success){
			    		if("${param.listname}" == "kggz"){
			    			var params = $STONE.formSerializedToJSON("#frm_jcgl_kggz_list_search_conditions");
							$STONE.sc_setGridQueryParams("#grd_jcgl_kggz_list",params);
			    		}else if("${param.listname}" == "yzc"){
				    		var params = $STONE.formSerializedToJSON("#frm_jcsj_sb_yzc_search_conditions");
							$STONE.sc_setGridQueryParams("#grd_jcsj_sb_ycz",params);
			    		}else{
			    			var params = $STONE.formSerializedToJSON("#frm_jcsj_sb_wzc_search_conditions");
							$STONE.sc_setGridQueryParams("#grd_jcsj_sb_ycz",params);
			    		}
		    			return true;
			    	}else{
			    		$Error.show(data);
						//$("#grd_reports_edit_yyht_jyxm${uuid}").datagrid('reload');
			    		return false;
			    	}
			    }
			});
		});
	});
	</script> 