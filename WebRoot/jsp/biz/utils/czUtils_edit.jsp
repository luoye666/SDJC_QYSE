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
			<form name="frm_cz_edit" id="frm_cz_edit" method="POST">
				<div class="formHiddenRegion">
	            	<input type="hidden" name="entity.id" id="czdwid" value="${entity.id}"/>
	            	<input type="hidden" name="entity.pid" value="${entity.pid}"/>
					<input type="hidden" value="${entity.tmpData}" name="entity.tmpData" />
                </div>
                <br/>
				<table style="width: 98%" id="cz_tab">
					<tr>
						<th colspan="4">
							<div id="czdwinfo_edit" style="text-align: left;"></div>
						</th>
					</tr>
					<tr>
					    <th>单位名称:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.dwmc" id="cz_utils_edit_dwmc" value="${entity.dwmc}" oldValue="${entityOld.dwmc}">
						</td>
						<th>单位地址:</th>
						<td><input class="ui-input long98" required="required" name="entity.dwdz" value="${entity.dwdz}" oldValue="${entityOld.dwdz}"></td>
					</tr>
					<tr>
						<th>所在市:</th>
						<td>
							<div id="cz_utils_shi_div">
								<select class="long98" required="required" name="entity.shidaima" id="cz_utils_shi" sltValue="${entity.shidaima}" oldValue="${entityOld.shidaima}"></select>
							</div>
						</td>
						<th>所在区县:</th>
						<td>
							<div id="cz_utils_qx_div">
								<select class="long98" name="entity.quxiandaima" id="cz_utils_qx" sltValue="${entity.quxiandaima}" oldValue="${entityOld.quxiandaima}"></select>
							</div>
						</td>
					</tr>
					<tr>
						<th>所在乡镇:</th>
						<td>
							<div id="cz_utils_xz_div">
								<select class="long98" name="entity.xiangzhendaima" id="cz_utils_xz" sltValue="${entity.xiangzhendaima}" oldValue="${entityOld.xiangzhendaima}"></select>
							</div>
						</td>
					    <th>证书编号:</th>
						<td>
							<input class="ui-input long98" name="entity.zsbh" value="${entity.zsbh}" oldValue="${entityOld.zsbh}">
						</td>
					</tr>
					<tr>
						<th>法人代表:</th>
						<td><input class="ui-input long98" required="required" name="entity.frdb" value="${entity.frdb}" oldValue="${entityOld.frdb}"></td>
					    <th>联系电话:</th>
						<td><input class="ui-input long98" required="required" name="entity.frtel" value="${entity.frtel}" oldValue="${entityOld.frtel}"></td>
					</tr>
					<tr>
						<th>气瓶品种:</th>
						<td><input class="ui-input" required="required" name="entity.qtlb" id="cz_utils_pz_edit" value="${entity.qtlb}" oldValue="${entityOld.qtlb}"></td>
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
							<input class="ui-input long98" name="entity.fzrq" onclick="WdatePicker()" value="<fmt:formatDate value='${entity.fzrq}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${entityOld.fzrq}' pattern='yyyy-MM-dd'/>">
						</td>
						<th>证书有效期:</th>
						<td>
							<input class="ui-input long98" name="entity.zsyxq" onclick="WdatePicker()" value="<fmt:formatDate value='${entity.zsyxq}' pattern='yyyy-MM-dd'/>" oldValue="<fmt:formatDate value='${entityOld.zsyxq}' pattern='yyyy-MM-dd'/>">
						</td>
					</tr>
					<tr>
						<th>充装范围:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.czfw" value="${entity.czfw}" oldValue="${entityOld.czfw}">
						</td>
						<th>备注:</th>
						<td>
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
		$().ready(function(){
			loadQTZL("${entity.qtzl}");
			
			//生成级联下拉框
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("cz_utils_shi,cz_utils_qx,cz_utils_xz",data.dicDatas,"200px",true,"<%=path%>");
					//判断哪些值正在修改
					setTimeout(function(){
						$STONE.verifyUpdSltValue("select");
					},2000);
			},"JSON");
			//判断哪些值正在修改
			$STONE.verifyUpdValue("input");
		});
	function loadQTZL(zl){
		if(zl.length > 0){
			var zlArr = zl.split("|");
			$("input[name=saveArray]").each(function(i,obj){
				if(zl.indexOf(obj.value)>=0){
					obj.checked=true;
				}
			});
		}
	}
	//验证单位是否重复
	function verify(){
		var result = false;
		var dwid = $("#czdwid").val();
		var dwmc = $('#cz_utils_edit_dwmc').val();
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/czUtils!verifyByDwmc.do",
		   data:'dwmc='+encodeURI(encodeURI(dwmc))+'&dwid='+dwid,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result>1){
		   			$("#czdwinfo_edit").html("<font color='red'>单位名称重复!</font>");
		   		}else{
		   			$("#czdwinfo_edit").html("");
		   			result = true;
		   		}
		   }
		});
		return result;
	}
	function save(tjstate){
			var options = {
				url:"<%=path%>/czUtils!save.do?tjstate="+tjstate+"&address=${address}&dbid=${dbid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_cz_edit").validate().form() && verify()){
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
						},1000);
	            	}else{
						$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_cz_edit").ajaxSubmit(options);
	         return false;
	}
	function tijiao(){
		save("1");
		return false;
	}
	</script>