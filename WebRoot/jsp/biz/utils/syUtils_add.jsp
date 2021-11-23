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
	p{
		color:red;
		display: none;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div>
			<center><h3>使用单位信息</h3></center>
			<!-- 条件筛选-->
			<form name="frm_sy_add" id="frm_sy_add" method="POST">
				<input type="hidden" value="0" name="entity.tmpData" />
				<table style="width: 98%">
					<tr>
						<th colspan="4">
							<div id="sydwinfo_add" style="text-align: left;"></div>
						</th>
					</tr>
					<tr>
					    <th style="width: 15%">单位名称:</th>
						<td style="width: 35%">
							<input class="ui-input long98" required="required" name="entity.dwmc" id="sy_utils_add_dwmc">
						</td>
						<th style="width: 15%">单位地址:</th>
						<td style="width: 35%"><input class="ui-input long98" required="required" name="entity.dwdz"></td>
					</tr>
					<tr>
						<th>市：</th>  
						<td>
							<div id="shi_div" onclick="delay()">
								<select name="entity.shidaima" style="width: 179px;" id="shi" ></select>
							</div>
						</td>
						<th>区县：</th>
						<td>
							<div id="quxian_div" onclick="delay()">
								<select name="entity.quxiandaima" style="width: 179px;" id="quxian" ></select>
							</div>
						</td>
					</tr>
					<tr>
						<th>乡镇：</th>
						<td>
							<div id="xiangzhen_div" >
								<select name="entity.xiangzhendaima" style="width: 179px;" id="xiangzhen"></select>
							</div>
						</td>
						<th>机构代码:</th>
						<td><input class="ui-input long98" name="entity.jgdm" ></td>
					</tr>
					<tr>
						<th>联系人:</th>
						<td><input class="ui-input long98" required="required" name="entity.lxr" ></td>
					    <th>联系电话:</th>
						<td><input class="ui-input long98" required="required" name="entity.lxdh" ></td>
					</tr>
					<tr>
						<th>备注:</th>
						<td colspan="3"><input class="ui-input long98" name="entity.meo" ></td>
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
			
			appendSelTo();
			
		});
	//验证单位是否重复
	function verify(){
		var result = false;
		var dwid = "";
		var dwmc = $('#sy_utils_add_dwmc').val();
		var shi = $('#shi').val();
		var quxian = $('#quxian').val();
		var xiangzhen = $('#xiangzhen').val();
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/syUtils!verifyByDwmc.do",
		   data:'dwmc='+encodeURI(encodeURI(dwmc))+'&dwid='+dwid+'&shi='+shi+'&quxian='+quxian+'&xiangzhen='+xiangzhen+' ',
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result>0){
		   			$("#sydwinfo_add").html("<font color='red'>单位名称重复!</font>");
		   		}else{
		   			$("#sydwinfo_add").html("");
		   			result = true;
		   		}
		   }
		});
		return result;
	}
	function save(){
			var options = {
				url:"<%=path%>/syUtils!save.do?seid=${param.seid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					if(!verifySelect()) {  return false; }
						
					if($("#frm_sy_add").validate().form() && verify()){
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
						}, 2000 );
	            	}else{
						$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_sy_add").ajaxSubmit(options);
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