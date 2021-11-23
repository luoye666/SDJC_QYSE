<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
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
		width: 90%
	}
	.tab{
		border:solid 2px #AAAAAA; 
		border-collapse: collapse;
	}
	.tab th{
	}
	.tab td{
		text-align: center;
		padding: 1px 0px 1px 0px;
	}
	input[disabled],input:disabled{
		border:1px solid #DDD;
		background-color:#CCEEFF;
		color:#ACA899;
	}
	s{
		border:1px solid #DDD;
		background-color:#F5F5F5;
		color:#ACA899;
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
			<form name="frm_se_upd_cqdw" id="frm_se_upd_cqdw" method="POST">
				<table style="width: 95%" class="tab" cellpadding="0" cellspacing="0">
					<tr>
						<td width="15%" style="border:solid 1px #AAAAAA; color: red;font-size: 15px;">
							【注意】
						</td>
						<td colspan="3" style="border:solid 1px #AAAAAA; color: red;font-size: 15px;text-align: left;">
							您正在对选中的N条数据记录进行批量修改操作，请谨慎填写！！
						</td>
					</tr>
					<tr>
						<td width="15%" style="border:solid 1px #AAAAAA; color: red;font-size: 15px;">
							【操作方法】
						</td>
						<td colspan="3" style="border:solid 1px #AAAAAA; color: red;font-size: 15px;text-align: left;">
							1、新值里没有填写，则跳过本字段的批量修改。 <br/>
							2、如有设备不含有当前要修改的值，则跳过，如锅炉不含有维保单位，则维保单位不更新当前锅炉。
						</td>
					</tr>
					<tr>
						<td width="15%" style="border:solid 1px #AAAAAA;">单位类别</td>
						<td width="15%">数据项</td>
						<td width="35%">修改前数据值</td>
						<td width="35%">修改后数据值</td>
					</tr>
					<tr>
						<td rowspan="9" style="border:solid 1px #AAAAAA;">使用单位</td>
					    <td style="border:solid 1px #AAAAAA;border-bottom: none;border-right: none;border-left: none;">使用单位</td>
						<td style="border:solid 1px #AAAAAA;border-bottom: none;border-right: none;border-left: none;">
							<input class="ui-input long98" disabled value="${baseInfo.shiyongdanwei}"/>
						</td>
						<td style="border:solid 1px #AAAAAA;border-bottom: none;border-right: none;border-left: none;">
							<input class="ui-input long98" name="baseInfo.shiyongdanwei"  />
						</td>
					</tr>
					<tr>
					    <td>使用单位地址</td>
						<td>
							<input class="ui-input long98" disabled value="${baseInfo.shiyongdanwei_dizhi}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.shiyongdanwei_dizhi"  />
						</td>
					</tr>
					<tr>
					    <td>联系电话</td>
						<td>
							<input class="ui-input long98" disabled value="${baseInfo.shiyongdanwei_lianxidianhua}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.shiyongdanwei_lianxidianhua"  />
						</td>
					</tr>
					<tr>
					    <td>联系人</td>
						<td>
							<input class="ui-input long98" disabled value="${baseInfo.shiyongdanwei_lianxiren}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.shiyongdanwei_lianxiren"  />
						</td>
					</tr>
					<tr>
					    <td>安全管理部门</td>
						<td>
							<input class="ui-input long98" disabled value="${baseInfo.anquanguanlibumen}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.anquanguanlibumen"  />
						</td>
					</tr>
					<tr>
					    <td>安全管理人员</td>
						<td>
							<input class="ui-input long98" disabled value="${baseInfo.anquanguanlirenyuan}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.anquanguanlirenyuan"  />
						</td>
					</tr>
					<tr>
					    <td>联系电话</td>
						<td>
							<input class="ui-input long98" disabled value="${baseInfo.anquanguanli_lianxidianhua}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.anquanguanli_lianxidianhua"  />
						</td>
					</tr>
					<tr>
					    <td>法人</td>
						<td>
							<input class="ui-input long98" disabled value="${baseInfo.fadingdaibiaoren}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.fadingdaibiaoren"  />
						</td>
					</tr>
					<tr>
					    <td>法人联系电话</td>
						<td>
							<input class="ui-input long98" disabled value="${baseInfo.frdb_dianhua}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.frdb_dianhua"  />
						</td>
					</tr>
					<tr>
						<td rowspan="5" style="border:solid 1px #AAAAAA;">产权单位</td>
					    <td style="border:solid 1px #AAAAAA;border-bottom: none;border-right: none;border-left: none;">产权单位</td>
						<td style="border:solid 1px #AAAAAA;border-bottom: none;border-right: none;border-left: none;">
							<input class="ui-input long98" name="chanquandanwei" disabled value="${baseInfo.chanquandanwei}"/>
						</td>
						<td style="border:solid 1px #AAAAAA;border-bottom: none;border-right: none;border-left: none;">
							<input class="ui-input long98" name="baseInfo.chanquandanwei"  />
						</td>
					</tr>
					<tr>
					    <td>产权单位地址</td>
						<td>
							<input class="ui-input long98"  disabled value="${baseInfo.chanquandanwei_dizhi}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.chanquandanwei_dizhi"  />
						</td>
					</tr>
					<tr>
					    <td>产权单位代码</td>
						<td>
							<input class="ui-input long98" name="chanquandanweidaima" disabled value="${baseInfo.chanquandanwei_daima}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.chanquandanwei_daima"  />
						</td>
					</tr>
					<tr>
					    <td>法人</td>
						<td>
							<input class="ui-input long98" disabled value="${baseInfo.chanquandanwei_farendaibiao}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.chanquandanwei_farendaibiao"  />
						</td>
					</tr>
					<tr>
					    <td>法人联系电话</td>
						<td>
							<input class="ui-input long98" disabled value="${baseInfo.cqdw_frdbdh}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.cqdw_frdbdh"  />
						</td>
					</tr>
					<tr>
					    <td rowspan="4" style="border:solid 1px #AAAAAA;">维保单位</td>
					    <td style="border:solid 1px #AAAAAA;border-bottom: none;border-right: none;border-left: none;">维保单位</td>
						<td style="border:solid 1px #AAAAAA;border-bottom: none;border-right: none;border-left: none;">
							<input class="ui-input long98" disabled value="${baseInfo.weihubaoyangdanwei}"/>
						</td>
						<td style="border:solid 1px #AAAAAA;border-bottom: none;border-right: none;border-left: none;">
							<input class="ui-input long98" name="baseInfo.weihubaoyangdanwei"  />
						</td>
					</tr>
					<tr>
					    <td>联系人</td>
						<td>
							<input class="ui-input long98" disabled value="${baseInfo.weihubaoyangdanwei_lianxiren}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.weihubaoyangdanwei_lianxiren"  />
						</td>
					</tr>
					<tr>
					    <td>联系电话:</td>
						<td>
							<input class="ui-input long98" name="weibaodianhua" disabled value="${baseInfo.weihubaoyangdanwei_dianhua}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.weihubaoyangdanwei_dianhua"  />
						</td>
					</tr>
					<tr>
					    <td>资质证书号</td>
						<td>
							<input class="ui-input long98" disabled value="${baseInfo.whbydw_zizhizhengshu}"/>
						</td>
						<td>
							<input class="ui-input long98" name="baseInfo.whbydw_zizhizhengshu"  />
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
	    id:'valueTj',
		name:'确认',
		callback:tijiao
	},{
	    id:'valueQx',
		name:'取消'
	}
);
	 function tijiao(){
			var options = {
				url:"<%=path%>/se!updPLXGDW.do?ids=${param.ids}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					W.parent.showMask("正在提交......");
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">修改成功!</font>',3,'success.gif');
						W.reloadGrid();
						setTimeout(function(){
							api.hide();
						}, 1000 );
	            	}else{
						$.dialog.tips('<font color="blue">修改不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_se_upd_cqdw").ajaxSubmit(options);
	         return false;
	 }
	 
	$().ready(function(){
	});
	</script>