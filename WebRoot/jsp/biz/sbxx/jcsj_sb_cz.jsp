<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
<style>
	.long98{
		width: 98%
	}
</style>
	<!-- 页面顶部菜单 -->
	<div class="mnu_baseBodyTop">
		<div class="panel-header">
			<a href="javascript:void(0)" title="提交至市局" id="mnubtn_jcsj_cz_hebing_submit" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-ok'">提交至市局</a>
	        <a href="javascript:void(0)" title="关闭" id="mnubtn_jcsj_cz_hebing_close" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">关闭</a>
	    </div>
	</div>
	<!-- Grid工具栏 -->
	<div id="tlb_Grid_renwu_renwu_dj_slrwd" class="tlb_baseGrid">
		<div>
		<br/>
			<!-- 条件筛选--> 
			<form name="frm_jcsj_hebing" id="frm_jcsj_hebing" method="POST" enctype="multipart/form-data">
				<div class="formHiddenRegion">
	            	<input type="hidden" name="msgconfirm.id"/>
	            	<input type="hidden" name="msgconfirm.confirmflag" value="${param.state}"/>
	            	<input type="hidden" name="msgconfirm.idold" value="${param.ids}"/>
	            	<input type="hidden" name="msgconfirm.state" value="1"/>
	            	<input type="hidden" name="msgconfirm.isconfirm" value="0"/>
	            	<input type="hidden" name="msgconfirm.hisflag" value="0"/>
					<input type="hidden" name="msgconfirm.ouidnew" value="${param.quhuadaima}">
                </div>
                <br/>
				<table style="width: 100%">
					<tr>
						<th>相关文件:</th>
						<td colspan="3">
							<input type="file" class="long98" name="updFile" >
						</td>
					</tr>
					<tr>
					    <th>备注:</th>
						<td colspan="3">
							<input class="easyui-validatebox long98" name="msgconfirm.remark" >
						</td>
					</tr>
				</table>
			</form>
			<center><h3>设备信息列表</h3></center>
			<!-- Grid表格 -->
			<table id="grd_jcsj_cz_list" class="grd_base"></table>
		</div>
	</div>
	<!-- 脚本 -->
	<script type="text/javascript">
		$().ready(function(){
			loadGrid();
			//提交
			$("#mnubtn_jcsj_cz_hebing_submit").click(function(){
				$("#frm_jcsj_hebing").form("submit",{
				    url:"<%=path%>/se!sendEquipment.do",
				    onSubmit: function(param){
				    	if($(this).form("validate")){
				    		$MaskLayer.show("正在提交...");
				    		return true;
				    	}
				    	return false;
				    },
				    success:function(data){
				    	$MaskLayer.hide();
				    	data = $.parseJSON(data);
				    	if(data.msg == "OUTSIZE"){
				    		$.messager.alert('友情提示','对不起,附件过大！');
				    	}else if(data.msg == "SUCCESS"){
				    		$("#grd_jcsj_sb_ycz").datagrid("reload");
				    		$("#win_jcsj_sb_sbcz_edit").window('close');
				    		$.messager.alert('友情提示','提交成功！');
				    	}else{
				    		$.messager.alert('友情提示','对不起,提交失败！');
				    	}
				    }
				});
				return false;
			});
			
			$("#mnubtn_jcsj_cz_hebing_close").click(function(){
				$("#win_jcsj_sb_sbcz_edit").window('close');
			});
			
		});
	    function loadGrid(){
			$("#grd_jcsj_cz_list").datagrid({
				url:"<%=path%>/seList!getSesList.do?ids=${param.ids}",
				singleSelect:false,
				nowrap:false,
				pagination:false,
				fitColumns:true,
				rownumbers:true,
				striped:true,
				rownumbers:true,
			    columns:[[
			        {field:'id',title:'id',width:10,align:'center',hidden:true},
			        {field:'zhucedaima',title:'设备代码',width:120,align:'center'},
			        {field:'shiyongdanwei',title:'单位名称',width:50,align:'center'},
			        {field:'shebeileibie',title:'设备类别',width:50,align:'center'},
			        {field:'shebeimingcheng',title:'设备名称',width:50,align:'center'}
			    ]]
			});
	    }
	</script>