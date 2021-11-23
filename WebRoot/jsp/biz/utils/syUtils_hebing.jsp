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
	th{
		width: 20%;
	}
	td{
		width: 30%;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div>
			<center><h3>合并后信息</h3></center>
			<br/>
			<!-- 条件筛选--> 
			<form name="frm_sy_hebing" id="frm_sy_hebing" method="POST" enctype="multipart/form-data">
				<div class="formHiddenRegion">
	            	<input type="hidden" name="msgconfirm.id"/>
	            	<input type="hidden" name="msgconfirm.confirmflag" value="1"/>
	            	<input type="hidden" name="msgconfirm.idold" value="${param.ids}"/>
	            	<input type="hidden" name="msgconfirm.state" value="0"/>
	            	<input type="hidden" name="msgconfirm.isconfirm" value="0"/>
	            	<input type="hidden" name="msgconfirm.hisflag" value="0"/>
                </div>
				<table style="width: 98%">
					<tr>
					    <th>单位名称:</th>
						<td>
							<input class="ui-input long98" required="required" name="msgconfirm.dwmcnew" >
						</td>
						<th>单位地址:</th>
						<td>
							<input class="ui-input long98" required="required" name="msgconfirm.dwdznew">
						</td>
					</tr>
					<tr>
						<th>机构代码:</th>
						<td><input class="ui-input long98" name="msgconfirm.jgdmnew" ></td>
						<th>所在市</th>
						<td>
							<div id="sy_edit_hebing_shi_div">
								<select class="long98" required="required" name="msgconfirm.shidaimanew" id="sy_edit_hebing_shi">
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>所在区县</th>
						<td>
							<div id="sy_edit_hebing_quxian_div">
								<select class="long98" name="msgconfirm.ouidnew" id="sy_edit_hebing_quxian">
								</select>
							</div>
						</td>
						<th>所在乡镇</th>
						<td>
							<div id="sy_edit_hebing_xiangzhen_div">
								<select class="long98" name="msgconfirm.xiangzhendaimanew" id="sy_edit_hebing_xiangzhen">
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>联系人:</th>
						<td><input class="ui-input long98" required="required" name="msgconfirm.lxrnew" ></td>
					    <th>联系电话:</th>
						<td><input class="ui-input long98" required="required" name="msgconfirm.lxdhnew" ></td>
					</tr>
					<tr>
						<th>相关文件:</th>
						<td colspan="3">
							<input type="file" class="long98" name="updFile" >
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
		name:'提交合并至市局',
		callback:save
	},{
	    id:'valueQx',
		name:'关闭'
	}
);
		$().ready(function(){
			//生成级联下拉框
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("sy_edit_hebing_shi,sy_edit_hebing_quxian,sy_edit_hebing_xiangzhen",data.dicDatas,"180px",true,"<%=path%>");
			},"JSON");
		});
	
	function save(){
			var options = {
				url:"<%=path%>/syUtils!mergeUtils.do?sydwids=${param.ids}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_sy_hebing").validate().form()){
						W.parent.showMask("正在保存......");
				    	return true;
				    }
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
				    if(rsp.msg == "OUTSIZE"){
				    	$.dialog.alert('对不起,附件过大！');
				    }else if(rsp.msg == "SUCCESS"){
						W.reloadGrid();
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
						setTimeout(function(){
							api.close();
						}, 2000 );
				    }else{
				    	$.dialog.alert('保存不成功！');
				    }
	            }
	         };
	         $("#frm_sy_hebing").ajaxSubmit(options);
	         return false;
	}
	</script>