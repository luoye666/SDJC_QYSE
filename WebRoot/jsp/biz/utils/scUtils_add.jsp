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
	#sc_tab th{
		width: 15;
		text-align: right;
	}
	#sc_tab td{
		width: 35%;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div>
			<center><h3>生产单位信息</h3></center>
			<!-- 条件筛选-->
			<form name="frm_sc_add" id="frm_sc_add" method="POST">
				<div class="formHiddenRegion">
					<input type="hidden" value="0" name="entity.tmpData" />
                </div>
                <br/>
				<table style="width: 98%" id="sc_tab">
					<tr>
						<th colspan="4">
							<div id="scdwinfo_add" style="text-align: left;"></div>
						</th>
					</tr>
					<tr>
					    <th style="width: 20%">单位名称:</th>
						<td style="width: 30%">
							<input class="ui-input long98" required="required" name="entity.dwmc" id="sc_utils_add_dwmc">
						</td>
						<th style="width: 20%">单位地址:</th>
						<td style="width: 30%">
							<input class="ui-input long98" required="required" name="entity.dwdz">
						</td>
					</tr>
					<tr>
					    <th>组织机构代码：</th>
						<td>
							<input class="ui-input long98" name="entity.jgdm" >
						</td>
						<th>市：</th>
						<td>
							<div id="shi_div">
								<select name="entity.shidaima" style="width: 179px;" id="shi"></select>
							</div>
						</td>
					</tr>
					<tr>
						<th>区县：</th>
						<td>
							<div id="quxian_div">
								<select name="entity.quxiandaima" style="width: 179px;" id="quxian"></select>
							</div>
						</td>
						<th>乡镇：</th>
						<td>
							<div id="xiangzhen_div">
								<select name="entity.xiangzhendaima" style="width: 179px;" id="xiangzhen"></select>
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
						<th>固定资产(万元):</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.gdzc">
						</td>
						<th>注册资金(万元):</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.zczj">
						</td>
					</tr>
					<tr>
						<th>技术负责人:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.jsfzr">
						</td>
						<th>质量负责人:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.zlfzr">
						</td>
					</tr>
					<tr>
						<th>管理者代表:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.glzdb">
						</td>
						<th>管理者代表职务:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.glzdbzw">
						</td>
					</tr>
					<tr>
						<th>单位总人数:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.zrs"">
						</td>
						<th>设计总人数:</th>
						<td>
							<input class="ui-input long98" name="entity.sjrs"" >
						</td>
					</tr>
					<tr>
						<th>设计审批人员总人数:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.sjsprs" >
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
		var dwmc = $('#sc_utils_add_dwmc').val();
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/scUtils!verifyByDwmc.do",
		   data:'dwmc='+encodeURI(encodeURI(dwmc))+'&dwid='+dwid,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result>0){
		   			$("#scdwinfo_add").html("<font color='red'>单位名称重复!</font>");
		   		}else{
		   			$("#scdwinfo_add").html("");
		   			result = true;
		   		}
		   }
		});
		return result;
	}
	function save(){
			var options = {
				url:"<%=path%>/scUtils!save.do",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_sc_add").validate().form() && verify()){
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
	         $("#frm_sc_add").ajaxSubmit(options);
	         return false;
	}
	</script>