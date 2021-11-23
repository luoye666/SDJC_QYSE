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
</style>
</head>
<body>
	<div class="wrapper">
	</div>
		<div>
			<!-- 条件筛选--> 
			<form name="frm_se_zhuanyi" id="frm_se_zhuanyi" method="POST">
			<!--	标注类型:
			 <div id="bzlx_div">
				
				</div>  -->	
				
				
				<table style="width: 95%" id="tab">
					<tr>
					    <th>是否在人口密集区:</th>
						<td>
							<select id="sf_rkmj" name="rkmj" style="width: 195px;">
						    	<option value=""></option>
						    	<option value="否" >否</option>
						    	<option value="是" >是</option>
						    </select>
						</td>
					</tr>
					<tr>
					    <th>是否重大危险源:</th>
						<td>
							<select id="sf_zdwxy" name="zdwxy" style="width: 195px;">
						    	<option value=""></option>
						    	<option value="否" >否</option>
						    	<option value="是" >是</option>
						    </select>
						</td>
					</tr>
					<tr>
					    <th>是否重点监控特种设备:</th>
						<td>
							<select id="sf_zdjk" name="zdjk" style="width: 195px;">
						    	<option value=""></option>
						    	<option value="否" >否</option>
						    	<option value="是" >是</option>
						    </select>
						</td>
					</tr>
					<tr>
					    <th>是否制定事故应急措施<br/>和救援预案:</th>
						<td>
							<select id="sf_yjcs" name="yjcs" style="width: 195px;">
						    	<option value=""></option>
						    	<option value="否" >否</option>
						    	<option value="是" >是</option>
						    </select>
						</td>
					</tr>
					<tr>
					    <th>是否吊运熔融金属:</th>
						<td>
							<select id="sf_rrjs" name="rrjs" style="width: 195px;">
						    	<option value=""></option>
						    	<option value="否" >否</option>
						    	<option value="是" >是</option>
						    </select>
						</td>
					</tr>
					<tr>
					    <th>是否冷库设备:</th>
						<td>
							<select id="sf_lk" name="lk" style="width: 195px;">
						    	<option value=""></option>
						    	<option value="否" >否</option>
						    	<option value="是" >是</option>
						    </select>
						</td>
					</tr>
				</table>
			</form>
		</div>
</body>
</html>
	<!-- 脚本 -->
	<script type="text/javascript">
	
var api = frameElement.api, W = api.opener;

api.button(
	{
	    id:'valueTj',
		name:'确定',
		callback:tijiao
	},{
	    id:'valueQx',
		name:'取消'
	}
);
	$().ready(function(){
		$("#sf_zdjk").selectmenu();
		$("#sf_lk").selectmenu();
		$("#sf_rkmj").selectmenu();
		$("#sf_yjcs").selectmenu();
		$("#sf_zdwxy").selectmenu();
		$("#sf_rrjs").selectmenu();
<%--		$.post("<%=path%>/dicList!getDataListByCode.do",{code:"BZSBLX"},
			function (data, textStatus){
				data = data.dicDatas;
				for(var i in data){
					$("#bzlx_div").append("<input type='checkbox' name='bzlx' value='"+data[i].name+"' />"+data[i].name+"<br/>"); 
				}
		},"JSON"); --%>
	})
	 function tijiao(){
		var options = {
				url:"<%=path%>/se!bzSe.do?ids=${param.ids}",
				dataType:'json',
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
	         $("#frm_se_zhuanyi").ajaxSubmit(options);
	         return false;
		
	 }
	</script>