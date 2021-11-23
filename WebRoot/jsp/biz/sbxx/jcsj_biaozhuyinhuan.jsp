<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
	Date date = new Date();
%>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	.long98{
		width: 98%
	}
	#tab th{
		width: 15%;
		text-align: right;
	}
	#tab td{
		width: 30%;
	}
	
</style>
</head>
<body>
	<div class="wrapper">
	</div>
	<!-- Grid工具栏 -->
	<div id="" class="tlb_baseGrid">
		<div>
		<br/>
			<!-- 条件筛选--> 
			<form name="frm_se_upd_bzyh" id="frm_se_upd_bzyh" method="POST">
				<table style="width: 95%" id="tab">
					<tr>
					    <th>隐患日期:</th>
						<td>
							<input class="ui-input long98" name="yinhuanriqi" value="<fmt:formatDate value='<%=date %>' pattern='yyyy-MM-dd'/>" onClick="WdatePicker()" id="yhrq" required />
						</td>
					    <th>标注人:</th>
						<td>
							<input class="ui-input long98" value="<%=user.getName() %>" disabled="disabled" id="bzr" />
						</td>
					</tr>
					<tr id="yhk">
						<th></th>
						<td colspan="3">
							<input type='checkbox' name='bzlx' value='1、使用非法生产的特种设备的；' />1、使用非法生产的特种设备的；<br/>
							<input type='checkbox' name='bzlx' value='2、超过特种设备规定的参数范围使用的；' />2、超过特种设备规定的参数范围使用的；<br/>
							<input type='checkbox' name='bzlx' value='3、缺少安全附件、安全装置或者安全附件、安全装置失灵而继续使用的；' />3、缺少安全附件、安全装置或者安全附件、安全装置失灵而继续使用的；<br/>
							<input type='checkbox' name='bzlx' value='4、应当予以报废或者经经验检测结论为不允许使用而继续使用特种设备的；' />4、应当予以报废或者经经验检测结论为不允许使用而继续使用特种设备的；<br/>
							<input type='checkbox' name='bzlx' value='5、使用有明显故障、异常情况或者责令改正而未予以改正的特种设备的；' />5、使用有明显故障、异常情况或者责令改正而未予以改正的特种设备的；<br/>
							<input type='checkbox' name='bzlx' value='6、特种设备发生事故不予报告而继续使用的；' />6、特种设备发生事故不予报告而继续使用的；<br/>
						</td>
					</tr>
					<tr>
					    <th>隐患原因:</th>
						<td colspan="3">
							<textarea name="yuanyin" class="long98" rows="10" id="yhyy" required></textarea>
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
	
	var address= "" != "${param.yhid}";
var api = frameElement.api, W = api.opener;

api.button(
	{
	    id:'valueTj',
		name:'确定',
		callback:tijiao,
		disabled:address
	},{
	    id:'valueQx',
		name:'取消'
	}
);

	$().ready(function(){
		if(address){//从隐患列表打开，获取隐患信息
			  $('#yhk').hide();
	          $.post("<%=path%>/noweqhideList!getYhyyById.do?id=${param.yhid}",{},
		      		function (data, textStatus){
	          			$("#yhrq").attr("value",W.SYSTEM.date.format(data.yhrq,'yyyy-MM-dd'));
	          			$("#bzr").val(data.bzr);
	          			$("#yhyy").val(data.yhyy);
		      },"JSON");
		}
	});
	 function tijiao(){
		 var lx = "";
		$("input[type='checkbox']:checked").each(function(i){
			lx += $(this).attr("value");
		});
		var yy = $('#yhyy').val();
		$('#yhyy').val(lx+yy);
			var options = {
				url:"<%=path%>/se!bzyhByIds.do?ids=${param.ids}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					if(!$("#frm_se_upd_bzyh").validate().form()){
						return false;
					}
					W.parent.showMask("正在提交......");
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">标注成功!</font>',3,'success.gif');
						W.reloadGrid();
						setTimeout(function(){
							api.hide();
						}, 1000 );
	            	}else{
						$.dialog.tips('<font color="blue">标注失败!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_se_upd_bzyh").ajaxSubmit(options);
	         return false;
	 }
	</script>