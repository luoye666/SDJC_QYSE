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
	#sc_tab th{
		width: 15%;
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
			<form name="frm_sc_edit" id="frm_sc_edit" method="POST">
				<div class="formHiddenRegion">
	            	<input type="hidden" name="entity.id" id="scdwid" value="${entity.id}"/>
	            	<input type="hidden" name="entity.pid" value="${entity.pid}"/>
					<input type="hidden" value="${entity.tmpData}" name="entity.tmpData" />
                </div>
                <br/>
				<table style="width: 98%" id="sc_tab">
					<tr>
						<th colspan="4">
							<div id="scdwinfo_edit" style="text-align: left;"></div>
						</th>
					</tr>
					<tr>
					    <th style="width: 20%">单位名称:</th>
						<td style="width: 30%">
							<input class="ui-input long98" required="required" name="entity.dwmc" id="sc_utils_edit_dwmc" value="${entity.dwmc}" oldValue="${entityOld.dwmc}">
						</td>
						<th style="width: 20%">单位地址:</th>
						<td style="width: 30%">
							<input class="ui-input long98" required="required" name="entity.dwdz" value="${entity.dwdz}" oldValue="${entityOld.dwdz}">
						</td>
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
						<th>固定资产(万元):</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.gdzc" value="${entity.gdzc}" oldValue="${entityOld.gdzc}">
						</td>
						<th>注册资金(万元):</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.zczj" value="${entity.zczj}" oldValue="${entityOld.zczj}">
						</td>
					</tr>
					<tr>
						<th>技术负责人:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.jsfzr" value="${entity.jsfzr}" oldValue="${entityOld.jsfzr}">
						</td>
						<th>质量负责人:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.zlfzr" value="${entity.zlfzr}" oldValue="${entityOld.zlfzr}">
						</td>
					</tr>
					<tr>
						<th>管理者代表:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.glzdb" value="${entity.glzdb}" oldValue="${entityOld.glzdb}">
						</td>
						<th>管理者代表职务:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.glzdbzw" value="${entity.glzdbzw}" oldValue="${entityOld.glzdbzw}">
						</td>
					</tr>
					<tr>
						<th>单位总人数:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.zrs" value="${entity.zrs}" oldValue="${entityOld.zrs}"/>
						</td>
						<th>设计总人数:</th>
						<td>
							<input class="ui-input long98" name="entity.sjrs" value="${entity.sjrs}" oldValue="${entityOld.sjrs}" >
						</td>
					</tr>
					<tr>
						<th>设计审批人员总人数:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.sjsprs" value="${entity.sjsprs}" oldValue="${entityOld.sjsprs}">
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
		var dwid = $("#scdwid").val();
		var dwmc = $('#sc_utils_edit_dwmc').val();
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/scUtils!verifyByDwmc.do",
		   data:'dwmc='+encodeURI(encodeURI(dwmc))+'&dwid='+dwid,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result>1){
		   			$("#scdwinfo_edit").html("<font color='red'>单位名称重复!</font>");
		   		}else{
		   			$("#scdwinfo_edit").html("");
		   			result = true;
		   		}
		   }
		});
		return result;
	}
	function save(tjstate){
			var options = {
				url:"<%=path%>/scUtils!save.do?tjstate="+tjstate+"&address=${address}&dbid=${dbid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if($("#frm_sc_edit").validate().form() && verify()){
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
	         $("#frm_sc_edit").ajaxSubmit(options);
	         return false;
	}
	function tijiao(){
		save("1");
		return false;
	}
	</script>