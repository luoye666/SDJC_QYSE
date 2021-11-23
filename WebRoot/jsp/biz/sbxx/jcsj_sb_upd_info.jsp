<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	.long98{
		width: 98%
	}
	.tab th{
		width: 15%;
		text-align: left;
	}
	.tab td{
		width: 35%;
	}
	p{
		color:red;
	}
</style>
</head>
<body>
	<div class="wrapper">
	</div>
	<!-- Grid工具栏 -->
	<div id="" class="tlb_baseGrid">
		<div>
			<!-- 条件筛选--> 
			<form name="frm_se_upd_info" id="frm_se_upd_info" method="POST">
				<table style="width: 98%">
					<tr>
						<th>单位地址:</th>
						<td>
							<input class="ui-input long98" name="shiyongdanwei_dizhi"/>
						</td>
						<th>联系人:</th>
						<td>
							<input class="ui-input long98" name="shiyongdanwei_lianxiren"/>
						</td>
					</tr>
					<tr>
						<th>联系电话:</th>
						<td>
							<input class="ui-input long98" name="shiyongdanwei_lianxidianhua"/>
						</td>
						<th>安全管理部门:</th>
						<td>
							<input class="ui-input long98" name="anquanguanlibumen"/>
						</td>
					</tr>
					<tr>
						<th>安全管理人员:</th>
						<td>
							<input class="ui-input long98" name="anquanguanlirenyuan"/>
						</td>
						<th>内部编号:</th>
						<td>
							<input class="ui-input long98" name="neibubianhao"/>
						</td>
					</tr>
					<tr>
						<th>乡镇:</th>
						<td>
							<div id="xiangzhen_div" >
								<select name="xiangzhendaima" style="width: 179px;" id="xiangzhen"></select>
							</div>
						</td>
						<td colspan="2">
							若下拉框中无内容，则可能是选择的设备不属于同一区县
						</td>
					</tr>
				</table>
			</form>
			<br/><br/><br/><br/>
			<p>
				注：本提示框内的特种设备相关信息修改，不需要经过当地安全监察机构确认即可生效！未填写则不修改
			</p>
		</div>
	</div>
</body>
</html>
	<!-- 脚本 -->
	<script type="text/javascript">
	
var api = frameElement.api, W = api.opener;

api.button(
	{
	    id:'valueTj',
		name:'确认修改',
		callback:tijiao
	},{
	    id:'valueQx',
		name:'取消'
	}
);
$().ready(function(){
	//生成乡镇下拉框
	$.post("<%=path%>/dicList!getXzList.do",{seids:"${param.ids}"},
		function (data, textStatus){
			$STONE.creatSelectMenu("xiangzhen",data.dicDatas,"110px",false,"<%=path%>");
	},"JSON");
	
});
	 function tijiao(){
			var options = {
				url:"<%=path%>/se!updSeInfo.do?ids=${param.ids}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					W.parent.showMask("正在修改......");
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
	            	if(rsp.success){
	            		if(rsp.msg == "cg"){
							$.dialog.tips('<font color="blue">修改成功!</font>',3,'success.gif');
							W.reloadGrid();
							setTimeout(function(){
								api.hide();
							}, 1000 );
	            		}else{
							$.dialog.tips('<font color="blue">'+rsp.msg+'</font>',3,'success.gif');
	            		}
	            	}else{
						$.dialog.tips('<font color="blue">修改失败!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_se_upd_info").ajaxSubmit(options);
	         return false;
	 }
	</script>