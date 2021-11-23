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
	#tab th{
		width: 15%;
	}
	#tab td{
		width: 35%;
	}
	p{
		color:red;
		display: none;
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
			<form name="frm_se_zhuanyi" id="frm_se_zhuanyi" method="POST">
                <br/>
				<table style="width: 100%" id="tab">
					<tr>
					    <th>新单位名称:</th>
						<td>
							<input class="ui-input long98" name="baseInfo.shiyongdanwei" required />
						</td>
						<th>转移至市</th>
						<td>
							<div id="shi_div" onclick="delay()">
	        					<select name="baseInfo.shidaima" class="long98" id="shi"></select>
							</div>
						</td>
					</tr>
					<tr>
					    <th>区县:</th>
						<td>
							<div id="quxian_div" onclick="delay()">
	        					<select name="baseInfo.quhuadaima" class="long98" id="quxian"></select>
							</div>
						</td>
						<th>乡镇</th>
						<td>
							<div id="xiangzhen_div">
	        					<select name="baseInfo.xiangzhendaima" class="long98" id="xiangzhen"></select>
							</div>
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
		name:'提交',
		callback:tijiao
	},{
	    id:'valueQx',
		name:'取消'
	}
);
	$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
		function (data, textStatus){
			$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"150px",true,"<%=path%>");
	},"JSON");
	
	appendSelTo();
	
	
	 function tijiao(){
			var options = {
				url:"<%=path%>/se!transferSe.do?ids="+${param.ids},
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					if(!verifySelect()) {  return false; }
					if(!$("#frm_se_zhuanyi").validate().form()){
						return false;
					}
					W.parent.showMask("正在提交......");
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">提交成功!</font>',3,'success.gif');
						W.reloadGrid();
						setTimeout(function(){
							api.hide();
						}, 2000 );
	            	}else{
						$.dialog.tips('<font color="blue">提交不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_se_zhuanyi").ajaxSubmit(options);
	         return false;
	 }
	 
	 //验证select 是否有值
	function verifySelect(){
		var s = $('#shi').val();
		var q = $('#quxian').val();
		var flag = false;
		
		if(s == ""){
			$("#shi_div  p").show();
			flag = false;
		}else{
			$("#shi_div  p").hide();
			flag = true;
		}
		if(q == "" || q == null){
			$("#quxian_div  p").show();
			flag = false;
		}else{
			$("#quxian_div  p").hide();
			flag = true;
		}
		return flag;
	}
	
	//对select 进行追加元素 p
	function appendSelTo(){
		var divS = $('td > div');
		for(var i=0;i<divS.length-1;i++){
			$("<p>不能为空</p>").appendTo(divS[i]);
		}
	}
	
	//对select 选中数据后延迟执行方法
	function delay(){
		
		setTimeout(function(){verifySelect()},3000);
	}
	
	</script>