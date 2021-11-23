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
	#cz_tab th{
		width: 15%;
		text-align: right;
	}
	#cz_tab td{
		width: 35%;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div>
			<center><h3>充装单位信息</h3></center>
			<!-- 条件筛选-->
			<form name="frm_cz_add" id="frm_cz_add" method="POST">
				<div class="formHiddenRegion">
					<input type="hidden" value="0" name="entity.tmpData" />
                </div>
                <br/>
				<table style="width: 98%" id="cz_tab">
					<tr>
						<th colspan="4">
							<div id="czdwinfo_add" style="text-align: left;"></div>
						</th>
					</tr>
					<tr>
					    <th>单位名称:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.dwmc" id="cz_utils_add_dwmc">
						</td>
						<th>单位地址:</th>
						<td><input class="ui-input long98" required="required" name="entity.dwdz"></td>
					</tr>
					<tr>
						<th>所在市:</th>
						<td>
							<div id="cz_utils_shi_add_div">
								<select class="long98" required="required" name="entity.shidaima" id="cz_utils_shi_add"></select>
							</div>
						</td>
						<th>所在区县:</th>
						<td>
							<div id="cz_utils_qx_add_div">
								<select class="long98" name="entity.quxiandaima" id="cz_utils_qx_add"></select>
							</div>
						</td>
					</tr>
					<tr>
						<th>所在乡镇:</th>
						<td>
							<div id="cz_utils_xz_add_div">
								<select class="long98" name="entity.xiangzhendaima" id="cz_utils_xz_add"></select>
							</div>
						</td>
					    <th>证书编号:</th>
						<td>
							<input class="ui-input long98" name="entity.zsbh" >
						</td>
					</tr>
					<tr>
						<th>法人代表:</th>
						<td><input class="ui-input long98" required="required" name="entity.frdb" ></td>
					    <th>联系电话:</th>
						<td><input class="ui-input long98" required="required" name="entity.frtel" ></td>
					</tr>
					<tr>
						<th>气瓶品种:</th>
						<td><input class="ui-input long98" required="required" name="entity.qtlb" id="cz_utils_pz_add"></td>
					    <th></th>
						<td></td>
					</tr>
					<tr>
						<th>气体种类:</th>
						<td colspan="3">
							<input type="checkbox" value="氧气" name="saveArray" />氧气
							<input type="checkbox" value="氮气" name="saveArray" />氮气
							<input type="checkbox" value="氩气" name="saveArray" />氩气
							<input type="checkbox" value="二氧化碳" name="saveArray" />二氧化碳
							<input type="checkbox" value="乙炔" name="saveArray" />乙炔
							<input type="checkbox" value="氯气" name="saveArray" />氯气
							<input type="checkbox" value="氨气" name="saveArray" />氨气
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
						<th>充装范围:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.czfw" >
						</td>
						<th>备注:</th>
						<td>
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
			
			//生成级联下拉框
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("cz_utils_shi_add,cz_utils_qx_add,cz_utils_xz_add",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
		});
	//验证单位是否重复
	function verify(){
		var result = false;
		var dwid = "";
		var dwmc = $('#cz_utils_add_dwmc').val();
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/czUtils!verifyByDwmc.do",
		   data:'dwmc='+encodeURI(encodeURI(dwmc))+'&dwid='+dwid,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result>0){
		   			$("#czdwinfo_add").html("<font color='red'>单位名称重复!</font>");
		   		}else{
		   			$("#czdwinfo_add").html("");
		   			result = true;
		   		}
		   }
		});
		return result;
	}
	function save(){
			var options = {
				url:"<%=path%>/czUtils!save.do",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_cz_add").validate().form() && verify()){
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
	         $("#frm_cz_add").ajaxSubmit(options);
	         return false;
	}
	</script>