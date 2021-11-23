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
			<center><h3>合并后信息</h3></center>
			<br/>
			<!-- 条件筛选--> 
			<form name="frm_sy_hebing" id="frm_sy_hebing" method="POST" enctype="multipart/form-data">
				<table style="width: 98%">
					<tr>
					    <th>单位名称:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.dwmc" id="sy_utils_add_dwmc">
						</td>
						<th>单位地址:</th>
						<td>
							<input class="ui-input long98" required="required" name="entity.dwdz">
						</td>
					</tr>
					<tr>
						<th>机构代码:</th>
						<td><input class="ui-input long98" name="entity.jgdm" ></td>
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
						<th>所在乡镇</th>
						<td>
							<div id="sy_edit_hebing_xiangzhen_div">
								<select class="long98" name="entity.xiangzhendaima" id="sy_edit_hebing_xiangzhen">
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>联系人:</th>
						<td><input class="ui-input long98" required="required" name="entity.lxr" ></td>
					    <th>联系电话:</th>
						<td><input class="ui-input long98" required="required" name="entity.lxdh" ></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div>
		<table id="tab">
			
		</table>
	</div>
	</body>
	</html>
	<!-- 脚本 -->
	<script type="text/javascript">
var api = frameElement.api, W = api.opener;

api.button(
	{
	    id:'valueCx',
		name:'提交合并',
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
					$STONE.creatSelectMenu("sy_edit_hebing_shi,sy_edit_hebing_quxian,sy_edit_hebing_xiangzhen",data.dicDatas,"180px",true,"<%=path%>");
			},"JSON");
			
			appendSelTo();
			
			//
			 $.ajax({
	            type: "post",
	            dataType: "json",
	            url: "<%=path%>/syUtilsList!getListHb.do",
	            data:"sydwids=${param.ids}",
	            success: function (msg) {
	                var str = "";
	                for (i in msg) {
	                    str += "<tr> " +
								"<th>（原）单位名称:</th>" + 
								"<td>" + msg[i].dwmc + "</td> "+
				                "<td>有（"+msg[i].count+"）台设备</td> "+
								"</tr>";
	                }
	                $("#tab").append(str);
	            }
	        });
			
		});
	
	function save(){
			var options = {
				url:"<%=path%>/syUtils!mergeUtils.do?sydwids=${param.ids}",
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
				    if(statusText == "success"){
						W.reloadGrid();
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
						setTimeout(function(){
							api.close();
						}, 2000 );
				    }else{
				    	$.dialog.alert('保存不成功！');
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