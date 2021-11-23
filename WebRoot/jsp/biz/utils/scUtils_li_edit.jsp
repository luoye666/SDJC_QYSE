<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	.long98{
		width: 98%
	}
	th{
		text-align: right;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div>
			<center><h3>生产单位资质信息</h3></center>
			<!-- 条件筛选-->
			<form name="frm_sc_li_edit" id="frm_sc_li_edit" method="POST">
				<div class="formHiddenRegion">
	            	<input type="hidden" name="entity.id" value="${entity.id}"/>
	            	<input type="hidden" name="entity.fid" value="${entity.fid}"/>
                </div>
                <br/>
				<table style="width: 98%">
					<tr>
					    <th style="width: 15%">单位名称:</th>
						<td style="width: 35%">
							<input class="ui-input long98" required="required" readonly="true" name="entity.dwmc" value="${entity.dwmc}">
						</td>
						<th style="width: 15%">许可证编号:</th>
						<td style="width: 35%">
							<input class="ui-input long98" required="required" name="entity.zsbh" value="${entity.zsbh}">
						</td>
					</tr>
					<tr>
					    <th>设备种类：</th>
						<td>
							<s:select name="entity.setype" list="#request.seList" listKey="code" listValue="name" value="entity.setype" style="width: 179px;" id="sbzl"></s:select>
						</td>
						<th>所在区县:</th>
						<td>
							<s:select name="entity.ouid" list="#request.qhList" listKey="value" listValue="name" value="entity.ouid" style="width: 179px;" id="qhdm"></s:select>
						</td>
					</tr>
					<tr>
						<th>批准级别:</th>
						<td>
							<s:select name="entity.pzjb" list="#request.pzjbList" listKey="name" listValue="name" style="width: 179px;" id="pzjb"></s:select>
						</td>
					    <th>许可证类别:</th>
						<td>
							<s:select name="entity.xkzlb" list="#request.xklbList" listKey="name" listValue="name" style="width: 179px;" id="xkzlb"></s:select>
						</td>
					</tr>
					<tr>
						<th>批准部门:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.pzbm" value="${entity.pzbm}">
						</td>
						<th>发证部门:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.fzbm" value="${entity.fzbm}">
						</td>
					</tr>
					<tr>
						<th>批准日期:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.pzrq" onclick="WdatePicker()" value="<fmt:formatDate value='${entity.pzrq}' pattern='yyyy-MM-dd'/>">
						</td>
						<th>有效期:</th>
						<td>
							<input class="ui-input" required="required" name="entity.zsyxq_ks" onclick="WdatePicker()" value="<fmt:formatDate value='${entity.zsyxq_ks}' pattern='yyyy-MM-dd'/>">至
							<input class="ui-input" required="required" name="entity.zsyxq_js" onclick="WdatePicker()" value="<fmt:formatDate value='${entity.zsyxq_js}' pattern='yyyy-MM-dd'/>">
						</td>
					</tr>
					<tr>
						<th>许可证发文号:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.xkzfwh" value="${entity.xkzfwh}">
						</td>
						<th>原许可证编号:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.yxkzbh" value="${entity.yxkzbh}">
						</td>
					</tr>
					<tr>
						<th>申请类别:</th>
						<td>
							<s:select name="entity.sqlb" list="#request.sqlbList" listKey="name" listValue="name" style="width: 179px;" id="sqlb"></s:select>
						</td>
						<th>受理时间:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.slrq" onclick="WdatePicker()" value="<fmt:formatDate value='${entity.slrq}' pattern='yyyy-MM-dd'/>">
						</td>
					</tr>
					<tr>
						<th>实际复查时间:</th>
						<td>
							<input class="ui-input long98" name="entity.fcrq" onclick="WdatePicker()" value="<fmt:formatDate value='${entity.fcrq}' pattern='yyyy-MM-dd'/>">
						</td>
						<th>注销时间:</th>
						<td>
							<input class="ui-input long98" name="entity.zxrq" onclick="WdatePicker()" value="<fmt:formatDate value='${entity.zxrq}' pattern='yyyy-MM-dd'/>">
						</td>
					</tr>
					<tr>
						<th>备注:</th>
						<td colspan="3">
							<input class="ui-input long98" name="entity.meo" value="${entity.meo}">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</body>
	</html>
	<!-- 脚本 -->
	<script type="text/javascript">
var api = frameElement.api, W = api.opener;

api.button(
	{
	    id:'valueCx',
		name:'保存',
		callback:save,
		disabled:${session.sbxx == "yes"} ? false : true
	},{
	    id:'valueQx',
		name:'关闭'
	}
);

	$("#qhdm").selectmenu();
	$("#sbzl").selectmenu();
	$("#xkzlb").selectmenu();
	$("#pzjb").selectmenu();
	$("#sqlb").selectmenu();
	function save(){
			var options = {
				url:"<%=path%>/scUtilsLi!save.do",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_sc_li_edit").validate().form()){
						W.parent.showMask("正在保存......");
				    	return true;
				    }
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
						W.reloadGrid();
						setTimeout(function(){
							api.close();
						}, 1000 );
	            	}else{
						$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_sc_li_edit").ajaxSubmit(options);
	         return false;
	}
	</script>