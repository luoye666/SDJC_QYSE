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
			<form name="frm_jy_edit" id="frm_jy_edit" method="POST">
				<div class="formHiddenRegion">
	            	<input type="hidden" name="entity.id"  id="jydwid" value="${entity.id}"/>
	            	<input type="hidden" name="entity.pid" value="${entity.pid}"/>
					<input type="hidden" value="${entity.tmpData}" name="entity.tmpData" />
                </div>
                <br/>
				<table style="width: 98%" id="jy_tab">
					<tr>
						<th colspan="4">
							<div id="jydwinfo_edit" style="text-align: left;"></div>
						</th>
					</tr>
					<tr>
					    <th>单位名称:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.dwmc" value="${entity.dwmc}" oldValue="${entityOld.dwmc}">
						</td>
						<th>单位地址:</th>
						<td><input class="ui-input long98" required="required" name="entity.dwdz" value="${entity.dwdz}" oldValue="${entityOld.dwdz}"></td>
					</tr>
					<tr>
					    <th>组织机构代码：</th>
						<td>
							<input class="ui-input long98" name="entity.jgdm" value="${entity.jgdm}" oldValue="${entityOld.jgdm}">
						</td>
						<th>市：</th>
						<td>
							<div id="shi_div">
								<select name="entity.shidaima" class="long98" id="shi" sltValue="${entity.shidaima}" oldValue="${entityOld.shidaima}"></select>
							</div>
						</td>
					</tr>
					<tr>
						<th>区县：</th>
						<td>
							<div id="quxian_div">
								<select name="entity.quxiandaima" class="long98" id="quxian" sltValue="${entity.quxiandaima}" oldValue="${entityOld.quxiandaima}"></select>
							</div>
						</td>
						<th>乡镇：</th>
						<td>
							<div id="xiangzhen_div">
								<select name="entity.xiangzhendaima" class="long98" id="xiangzhen" sltValue="${entity.xiangzhendaima}" oldValue="${entityOld.xiangzhendaima}"></select>
							</div>
						</td>
					</tr>
					<tr>
						<th>法人代表:</th>
						<td><input class="ui-input long98" required="required" name="entity.frdb" value="${entity.frdb}" oldValue="${entityOld.frdb}"></td>
					    <th>联系电话:</th>
						<td><input class="ui-input long98" required="required" name="entity.frtel" value="${entity.frtel}" oldValue="${entityOld.frtel}"></td>
					</tr>
					<tr>
					    <th>证书编号：</th>
						<td>
							<input class="ui-input long98" name="entity.zsbh" value="${entity.zsbh}" oldValue="${entityOld.zsbh}">
						</td>
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th>检验范围:</th>
						<td colspan="3">
							<input class="ui-input long98" name="entity.jynr" value="${entity.jynr}" oldValue="${entityOld.jynr}">
						</td>
					</tr>
					<tr>
						<th>发证日期:</th>
						<td>
							<input class="ui-input long98" name="entity.fzrq" onclick="WdatePicker()" value="<fmt:formatDate value='${entity.fzrq}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${entityOld.fzrq}' pattern='yyyy-MM-dd'/>">
						</td>
						<th>证书有效期:</th>
						<td>
							<input class="ui-input long98" name="entity.zsyxq" onclick="WdatePicker()" value="<fmt:formatDate value='${entity.zsyxq}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${entityOld.zsyxq}' pattern='yyyy-MM-dd'/>">
						</td>
					</tr>
					<tr>
						<th>系统类别:</th>
						<td>
							<s:select name="entity.xt" list="#{'系统内':'系统内','系统外':'系统外'}" value="entity.xt" id="xtlb" style="width:170px" sltValue="${entity.xt}" oldValue="${entityOld.xt}"></s:select>
						</td>
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th>备注:</th>
						<td colspan="3">
							<input class="ui-input long98" name="entity.meo" value="${entity.meo}" oldValue="${entityOld.meo}">
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

var disb = false;
	if(("db" == "${address}" && "1" == "${tjstate}") || ${session.sbxx != "yes"}){
		disb = true;
	}
api.button(
	{
	    id:'valueCx',
		name:'保存',
		callback:save,
		disabled:disb
	},{
	    id:'valueTj',
		name:'提交',
		callback:tijiao,
		disabled:disb
	},{
	    id:'valueQx',
		name:'关闭'
	}
);
	$("#xtlb").selectmenu();
	//生成级联下拉框
	$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
		function (data, textStatus){
			$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			//判断哪些值正在修改
			setTimeout(function(){
				$STONE.verifyUpdSltValue("select");
			},2000);
	},"JSON");
	//判断哪些值正在修改
	$STONE.verifyUpdValue("input");
	//验证单位是否重复
	function verify(){
		var result = false;
		var dwid = $("#jydwid").val();
		var dwmc = $('#jy_utils_edit_dwmc').val();
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/jyUtils!verifyByDwmc.do",
		   data:'dwmc='+encodeURI(encodeURI(dwmc))+'&dwid='+dwid,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result>1){
		   			$("#jydwinfo_edit").html("<font color='red'>单位名称重复!</font>");
		   		}else{
		   			$("#jydwinfo_edit").html("");
		   			result = true;
		   		}
		   }
		});
		return result;
	}
	function save(tjstate){
			var options = {
				url:"<%=path%>/jyUtils!save.do?tjstate="+tjstate+"&address=${address}&dbid=${dbid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_jy_edit").validate().form() && verify()){
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
	         $("#frm_jy_edit").ajaxSubmit(options);
	         return false;
	}
	function tijiao(){
		save("1");
		return false;
	}
	</script>