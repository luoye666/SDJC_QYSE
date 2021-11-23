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
	.overflow {      height: 120px;    }
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
			<form name="frm_sy_edit" id="frm_sy_edit" method="POST">
				<div class="formHiddenRegion">
	            	<input type="hidden" name="entity.id" id="sydwid" value="${entity.id}"/>
	            	<input type="hidden" name="entity.flag" value="${entity.flag}"/>
	            	<input type="hidden" name="entity.pid" value="${entity.pid}"/>
					<input type="hidden" value="${entity.tmpData}" name="entity.tmpData" />
	            	<input type="hidden" name="entity.jingdu" value="${entity.jingdu}"/>
	            	<input type="hidden" name="entity.weidu" value="${entity.weidu}"/>
	            	<input type="hidden" name="entity.fujian" value="${entity.fujian}"/>
                </div>
				<table style="width: 98%">
					<tr>
						<th colspan="4">
							<div id="sydwinfo_edit" style="text-align: left;"></div>
						</th>
					</tr>
					<tr>
					    <th style="width: 15%">单位名称:</th>
						<td style="width: 35%">
							<input class="ui-input long98" required="required" name="entity.dwmc" value="${entity.dwmc }" oldValue="${entityOld.dwmc}" id="sy_utils_edit_dwmc">
						</td>
						<th style="width: 15%">单位地址:</th>
						<td style="width: 35%"><input class="ui-input long98" required="required" name="entity.dwdz" value="${entity.dwdz}" oldValue="${entityOld.dwdz}"></td>
					</tr>
					<tr>
						<th>市：</th>
						<td>
							<div id="shi_div" onclick="delay()">
								<select name="entity.shidaima" style="width: 179px;" id="shi" sltValue="${entity.shidaima}" oldValue="${entityOld.shidaima}"></select>
							</div>
						</td>
						<th>区县：</th>
						<td>
							<div id="quxian_div" onclick="delay()">
								<select name="entity.quxiandaima" style="width: 179px;" id="quxian" sltValue="${entity.quxiandaima}" oldValue="${entityOld.quxiandaima}"></select>
							</div>
						</td>
					</tr>
					<tr>
						<th>乡镇：</th>
						<td>
							<div id="xiangzhen_div">
								<select name="entity.xiangzhendaima" style="width: 179px;" id="xiangzhen" sltValue="${entity.xiangzhendaima}" oldValue="${entityOld.xiangzhendaima}"></select>
							</div>
						</td>
						<th>机构代码:</th>
						<td><input class="ui-input long98" name="entity.jgdm" value="${entity.jgdm}" oldValue="${entityOld.jgdm}"></td>
					</tr>
					<tr>
						<th>联系人:</th>
						<td><input class="ui-input long98"  name="entity.lxr" value="${entity.lxr}" oldValue="${entityOld.lxr}"></td>
					    <th>联系电话:</th>
						<td><input class="ui-input long98"  name="entity.lxdh" value="${entity.lxdh}" oldValue="${entityOld.lxdh}"></td>
					</tr>
					<tr>
						<th>备注:</th>
						<td colspan="3"><input class="ui-input long98" name="entity.meo" value="${entity.meo}" oldValue="${entityOld.meo}"></td>
					</tr>
					<tr>
						<th>附件:</th>
						<td colspan="2">
							<input type="file" class="long98" name="updFile" id="fujian">
						</td>
						<td>
							<div id="sydw_fj" style="text-align: center;">没有附件</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<iframe id="dwzhDownloadFile" height="0" width="0" src="" style="display: none;"></iframe>
	</body>
	</html>
	<!-- 脚本 -->
	<script type="text/javascript">
var api = frameElement.api, W = api.opener;

	if("${adr}" == "dsh"){
		api.button(
			{
			    id:'valueQx',
				name:'关闭'
			}
		);
	}else{
		api.button(
			{
			    id:'valueTj',
				name:'提交至审核',
				callback:tijiao,
			},{
			    id:'valueQx',
				name:'关闭'
			}
		);
	}

	if("${entity.fujian}" != ""){
		var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\'${entity.fujian}\')">下载附件</a>';
		$("#sydw_fj").html(down);
	}
	//生成级联下拉框
	$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
		function (data, textStatus){
			$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			//判断哪些值正在修改
			setTimeout(function(){
				$STONE.verifyUpdSltValue("select");
			},2000);
	},"JSON");
	//追加
	appendSelTo();
	//判断哪些值正在修改
	$STONE.verifyUpdValue("input");
	//验证单位是否重复
	function verify(){
		
		var result = false;
		var dwid = $("#sydwid").val();
		var dwmc = $('#sy_utils_edit_dwmc').val();
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
		   			$("#sydwinfo_edit").html("<font color='red'>单位名称重复!</font>");
		   		}else{
		   			$("#sydwinfo_edit").html("");
		   			result = true;
		   		}
		   }
		});
		return result;
	}
	function save(tjstate){
			var options = {
				url:"<%=path%>/syUtils!save.do?tjstate="+tjstate+"&address=${address}&dbid=${dbid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
					var fname = $("#fujian").val();
					var ftype = fname.substring(fname.lastIndexOf("."));
					if(fname == ""){
						$.dialog.alert('请上传附件，只支持.rar或.zip的压缩文件!');
						return false;
					}else{
						if(ftype != ".rar" && ftype != ".zip"){
							$.dialog.alert('上传文件类型只支持.rar或.zip的压缩文件!');
							return false;
						}
					}
					if(!verifySelect()) {  return false; }
				    if($("#frm_sy_edit").validate().form() && verify()){
						W.parent.showMask("正在提交至审核......");
				    	return true;
				    }
				    return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	W.parent.hideMask();
	            	if(rsp.msg == "SUCCESS"){
						$.dialog.tips('<font color="blue">提交成功!</font>',3,'success.gif');
						setTimeout(function(){
							api.close();
						}, 2000 );
	            	}else if(rsp.msg == "OUTSIZE"){
						$.dialog.tips('<font color="blue">附件过大!不能超过5M!</font>',3,'success.gif');
	            	}else{
						$.dialog.tips('<font color="blue">提交不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_sy_edit").ajaxSubmit(options);
	         return false;
	}
	function tijiao(){
		$.dialog.confirm("确定要变更吗?（您本次提交的使用单位变更申请，需经当地安全监察机构确认后方能生效！）", function(){  
			save("0");
		});
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