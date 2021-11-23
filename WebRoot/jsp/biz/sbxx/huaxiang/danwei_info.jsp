<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.sys.pojo.TOrgan"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<jsp:include page="/jsp/common/includeyl.jsp"></jsp:include>
<style type="text/css">
	.tab{
		width: 100%;
		border-collapse:collapse;
	}
	.tab th{
		border: 1px solid black;
		text-align: center;
		width: 20%;
		padding: 5px 3px 5px 3px;
	}
	.tab td{
		border: 1px solid black;
		text-align: center;
		width: 30%;
	}
</style> 
</head>
<body>
					<table id="sgdw" class="tab">
						<tr>
							<th>施工单位</th>
							<td>${baseInfo.shigongdanwei}</td>
							<th>组织机构代码</th>
							<td>${baseInfo.shigongdanwei_daima}</td>
						</tr>
						<tr>
							<th>法人代表</th>
							<td>${baseInfo.shigongdanwei_faren}</td>
							<th>施工日期</th>
							<td><fmt:formatDate value='${baseInfo.shigongdanwei_shigongriqi}' pattern='yyyy-MM-dd'/></td>
						</tr>
						<tr>
							<th>验收单位</th>
							<td>${baseInfo.yanshoudanwei}</td>
							<th>验收日期</th>
							<td><fmt:formatDate value='${baseInfo.yanshouriqi}' pattern='yyyy-MM-dd'/></td>
						</tr>
						<tr>
							<th>检验机构</th>
							<td>${baseInfo.yanshoujigou}</td>
							<th>验收报告编号</th>
							<td>${baseInfo.yanshoubaogaobianhao}</td>
						</tr>
					</table>
					<table id="wbdw" class="tab">
						<tr>
							<th>维保单位</th>
							<td>${baseInfo.weihubaoyangdanwei}</td>
							<th>资格证书号</th>
							<td>${baseInfo.whbydw_zizhizhengshu}</td>
						</tr>
						<tr>
							<th>联系人</th>
							<td>${baseInfo.weihubaoyangdanwei_lianxiren}</td>
							<th>联系电话</th>
							<td>${baseInfo.weihubaoyangdanwei_dianhua}</td>
						</tr>
						<tr>
							<th>单位代码</th>
							<td>${baseInfo.weihubaoyangdanwei_code}</td>
							<th>维保周期(周)</th>
							<td>${baseInfo.weibaozhouqi}</td>
						</tr>
						<tr>
							<th>大修周期(月)</th>
							<td>${baseInfo.daxiuzhouqi}</td>
							<th>所在车间分厂</th>
							<td>${baseInfo.suoshuchejian}</td>
						</tr>
					</table>
					<table id="zzdw" class="tab">
						<tr>
							<th>制造单位</th>
							<td>${baseInfo.zhizaodanwei}</td>
							<th>制造许可证编号</th>
							<td>${baseInfo.zhizaodanweixukezhengbianhao}</td>
						</tr>
						<tr>
							<th>资格证书名称</th>
							<td>${baseInfo.zhizaodanwei_zigezhengshu}</td>
							<th>联系电话</th>
							<td>${baseInfo.zhizaodanwei_lianxidianhua}</td>
						</tr>
						<tr>
							<th>使用场合</th>
							<td>${baseInfo.zhizaodanwei_shiyongchanghe}</td>
							<th></th><td></td>
						</tr>
					</table>
					<table id="sjdw" class="tab">
						<tr>
							<th>设计单位</th>
							<td>${baseInfo.shejidanwei}</td>
							<th>设计单位代码</th>
							<td>${baseInfo.shejidanweidaima}</td>
						</tr>
					</table>
					<table id="azdw" class="tab">
						<tr>
							<th>安装单位</th>
							<td>${baseInfo.anzhuangdanwei}</td>
							<th>安装单位代码</th>
							<td>${baseInfo.anzhuangdanwei_daima}</td>
						</tr>
						<tr>
							<th>联系电话</th>
							<td>${baseInfo.anzhuangdanwei_lianxidianhua}</td>
							<th>项目负责人</th>
							<td>${baseInfo.anzhuangdanwei_lianxiren}</td>
						</tr>
						<tr>
							<th>资格证书编号</th>
							<td>${baseInfo.anzhuangdanwei_zigezhengshu}</td>
							<th></th><td></td>
						</tr>
					</table>
		    	</form>
	</body>
	</html>
	<script type="text/javascript">
		$(function(){
			$(".tab").each(function(i,v){
				if("${param.type}" != $(this).attr("id")){
					$(this).hide();
				}
			});
		});
	</script>