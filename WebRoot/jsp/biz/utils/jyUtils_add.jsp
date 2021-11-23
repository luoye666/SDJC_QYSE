<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	.long98{
		width: 98%
	}
	#jy_tab th{
		width: 15%;
		text-align: right;
	}
	#jy_tab td{
		width: 35%;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div>
			<center><h3>检验单位信息</h3></center>
			<!-- 条件筛选-->
			<form name="frm_jy_add" id="frm_jy_add" method="POST">
				<div class="formHiddenRegion">
					<input type="hidden" value="0" name="entity.tmpData" />
                </div>
                <br/>
				<table style="width: 98%" id="jy_tab">
					<tr>
						<th colspan="4">
							<div id="jydwinfo_add" style="text-align: left;"></div>
						</th>
					</tr>
					<tr>
					    <th>单位名称:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.dwmc" id="jy_utils_add_dwmc">
						</td>
						<th>单位地址:</th>
						<td><input class="ui-input long98" required="required" name="entity.dwdz"></td>
					</tr>
					<tr>
					    <th>组织机构代码：</th>
						<td>
							<input class="ui-input long98" name="entity.jgdm" >
						</td>
						<th>市：</th>
						<td>
							<div id="shi_div">
								<select name="entity.shidaima" class="long98" id="shi"></select>
							</div>
						</td>
					</tr>
					<tr>
						<th>区县：</th>
						<td>
							<div id="quxian_div">
								<select name="entity.quxiandaima" class="long98" id="quxian"></select>
							</div>
						</td>
						<th>乡镇：</th>
						<td>
							<div id="xiangzhen_div">
								<select name="entity.xiangzhendaima" class="long98" id="xiangzhen"></select>
							</div>
						</td>
					</tr>
					<tr>
						<th>法人代表:</th>
						<td><input class="ui-input long98" required="required" name="entity.frdb" ></td>
					    <th>联系电话:</th>
						<td><input class="ui-input long98" required="required" name="entity.frtel" ></td>
					</tr>
					<tr>
					    <th>证书编号：</th>
						<td>
							<input class="ui-input long98" name="entity.zsbh" >
						</td>
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th>检验范围:</th>
						<td colspan="3">
							<input class="ui-input long98" name="entity.jynr" >
						</td>
					</tr>
					<tr>
						<th>发证日期:</th>
						<td>
							<input class="ui-input long98" name="entity.fzrq" onclick="WdatePicker()">
						</td>
						<th>证书有效期:</th>
						<td>
							<input class="ui-input long98" name="entity.zsyxq" onclick="WdatePicker()" >
						</td>
					</tr>
					<tr>
						<th>系统类别:</th>
						<td>
							<select class="long98" required="required" name="entity.xt" id="xtlb">
								<option value="系统内">系统内</option>
								<option value="系统外">系统外</option>
							</select>
						</td>
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th>备注:</th>
						<td colspan="3">
							<input class="ui-input long98" name="entity.meo" >
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
		callback:save
	},{
	    id:'valueQx',
		name:'关闭'
	}
);
		$().ready(function(){
			$("#xtlb").selectmenu();
			//生成级联下拉框
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
		});
	//验证单位是否重复
	function verify(){
		var result = false;
		var dwid = "";
		var dwmc = $('#jy_utils_add_dwmc').val();
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/jyUtils!verifyByDwmc.do",
		   data:'dwmc='+encodeURI(encodeURI(dwmc))+'&dwid='+dwid,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result>0){
		   			$("#jydwinfo_add").html("<font color='red'>单位名称重复!</font>");
		   		}else{
		   			$("#jydwinfo_add").html("");
		   			result = true;
		   		}
		   }
		});
		return result;
	}
	function save(){
			var options = {
				url:"<%=path%>/jyUtils!save.do",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_jy_add").validate().form() && verify()){
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
	         $("#frm_jy_add").ajaxSubmit(options);
	         return false;
	}
	</script>