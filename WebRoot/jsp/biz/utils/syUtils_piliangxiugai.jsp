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
	th{
		width: 20%;
	}
	td{
		width: 30%;
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
			<br/>
			<!-- 条件筛选--> 
			<form name="frm_sy_hebing" id="frm_sy_hebing" method="POST" enctype="multipart/form-data">
				<div class="formHiddenRegion">
                </div>
				<table style="width: 98%">
					<tr>
						<th>所在市</th>
						<td>
							<div id="sy_edit_hebing_shi_div" onclick="delay()">
								<select class="long98"  name="entity.shidaima" id="sy_edit_hebing_shi">
								</select>
							</div>
						</td>
					</tr>
					<tr>
					    <th>所在区县</th>
						<td>
							<div id="sy_edit_hebing_quxian_div" onclick="delay()">
								<select class="long98" name="entity.quxiandaima" id="sy_edit_hebing_quxian">
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>所在乡镇</th>
						<td>
							<div id="sy_edit_hebing_xiangzhen_div">
								<select class="long98" name="entity.xiangzhendaima" id="sy_edit_hebing_xiangzhen">
								</select>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div id="yuanyin" style="color: red;"></div>
	</body>
	</html>
	<!-- 脚本 -->
	<script type="text/javascript">
var api = frameElement.api, W = api.opener;

api.button(
	{
	    id:'valueCx',
		name:'提交',
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
					$STONE.creatSelectMenu("sy_edit_hebing_shi,sy_edit_hebing_quxian,sy_edit_hebing_xiangzhen",data.dicDatas,"150px",true,"<%=path%>");
			},"JSON");
			
			appendSelTo()
		});
	
	function save(){
			var options = {
				url:"<%=path%>/syUtils!updPLQX.do?sydwids=${param.ids}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					if(!verifySelect()) {  return false; }
				    if($("#frm_sy_hebing").validate().form() ){
						W.parent.showMask("正在保存......");
				    	return true;
				    }
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
				    if(rsp.dwmc == ""){
						W.reloadGrid();
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
						setTimeout(function(){
							api.close();
						}, 2000 );
				    }else{
				    	//$.dialog.alert('单位名称为：'+rsp.dwmc+'发现单位重复，请查询或使用合并功能！');
				    	$('#yuanyin').text('单位名称为：'+rsp.dwmc+'发现单位重复，请查询或使用合并功能！');
				    }
	            }
	         };
	         $("#frm_sy_hebing").ajaxSubmit(options);
	         return false;
	}
	
	
	//验证select 是否有值
	function verifySelect(){
		var s = $('#sy_edit_hebing_shi').val();
		var q = $('#sy_edit_hebing_quxian').val();
		var flag = false;
		
		if(s == ""){
			$("#sy_edit_hebing_shi_div  p").show();
			flag = false;
		}else{
			$("#sy_edit_hebing_shi_div  p").hide();
			flag = true;
		}
		if(q == "" || q == null){
			$("#sy_edit_hebing_quxian_div  p").show();
			flag = false;
		}else{
			$("#sy_edit_hebing_quxian_div  p").hide();
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