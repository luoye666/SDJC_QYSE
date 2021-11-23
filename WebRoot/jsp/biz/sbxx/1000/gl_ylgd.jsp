<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="/c.tld" %>
<%@ taglib prefix="fn" uri="/fn.tld" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <jsp:include page="/jsp/common/include.jsp"></jsp:include>
   <link href="<%=path %>/css/page_tabs/page_tabs.css" rel="stylesheet" type="text/css">
<style type="text/css">
.tabjcxx {
	border-collapse:collapse; 
	margin:0 0 0 0;
	width: 80%;
}
.tabjcxx tr{
	height:40px;
}
.tabjcxx th{
	border:1px black solid;
	text-align:center; 
	font-size:14px;
}
.tabjcxx td{
	border:1px black solid;
	font-size:12px;
	text-align:center;
	margin:0px; 
	padding:0 0 0 0px;
}

#gdhzb td input{
	width: 90%;
	height: 40px;
}
</style>
  </head>
  
  <body>
  <form id="frm_zcdj_gl_yldg" method="post" >
    	<div style="width: 100%;text-align: center;font-size: 30px;">
			电站范围内压力管道基本信息汇总表
		</div>
		<br/>
		<div id="title">
			<a class="ui-btn ui-btn-sp" onclick="save()">保存</a>
			<a class="ui-btn ui-btn-sp" id="gdhzb_add">增加行</a>
		</div>
		<br/>
		<br/>
   		<table class="tabjcxx" id="gdhzb" style="width: 100%">
   			<tr>
   				<th rowspan="2" style="width: 2%">序号</th>
   				<th rowspan="2" style="width: 5%">管道名称(登记单元)</th>
   				<th rowspan="2" style="width: 5%">管道编号</th>
   				<th rowspan="2" style="width: 5%">管道级别</th>
   				<th rowspan="2" style="width: 5%">设计单位</th>
   				<th rowspan="2" style="width: 5%">安装单位</th>
   				<th rowspan="2" style="width: 5%">安装年月</th>
   				<th rowspan="2" style="width: 5%">投用年月</th>
   				<th colspan="3" style="width: 5%">管道规格</th>
   				<th colspan="3" style="width: 5%">设计/工作条件</th>
   				<th rowspan="2" style="width: 5%">检验结论</th>
   				<th rowspan="2" style="width: 5%">检验机构名称</th>
   				<th rowspan="2" style="width: 7%">下次检验日期</th>
   				<th rowspan="2" style="width: 5%">备注</th>
   				<th class="endTd" rowspan="2" style="width: 3%">操作</th>
   			</tr>
   			<tr>
   				<th style="width: 5%">公称直径(mm)</th>
   				<th style="width: 5%">公称壁厚(mm)</th>
   				<th style="width: 5%">管道长度(m)</th>
   				<th style="width: 5%">压力(MPa)</th>
   				<th style="width: 5%">温度(℃)</th>
   				<th style="width: 5%">介质</th>
   			</tr>
   			<c:forEach var="h" items="${gdhzbList}" varStatus="i">
   			<tr>
   				<td>${i.index+1}</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].guandaomingcheng" value="${h.guandaomingcheng}"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].guandaobianhao" value="${h.guandaobianhao}"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].guandaojibie" value="${h.guandaojibie}"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].shejidanwei" value="${h.shejidanwei}"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].anzhuangdanwei" value="${h.anzhuangdanwei}"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].anzhuangnianyue" onclick="WdatePicker()" value="<fmt:formatDate value='${h.anzhuangnianyue}' pattern='yyyy-MM-dd'/>"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].touyongnianyue" value="${h.touyongnianyue}"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].gongchengzhijing" value="${h.gongchengzhijing}"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].gongchengbihou" value="${h.gongchengbihou}"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].guandaochangdu" value="${h.guandaochangdu}"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].yali" value="${h.yali}"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].wendu" value="${h.wendu}"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].jiezhi" value="${h.jiezhi}"/>
    			</td>
    			<td>
    				<select name="ylgd_hzb_list[${i.index}].jianyanjielun" inum="${i.index}">
						<option value="允许运行" ${h.jianyanjielun == "允许运行" ? "selected" : ""}>允许运行</option>
						<option value="整改后运行" ${h.jianyanjielun == "整改后运行" ? "selected" : ""}>整改后运行</option>
						<option value="限制条件运行" ${h.jianyanjielun == "限制条件运行" ? "selected" : ""}>限制条件运行</option>
						<option value="停止运行" ${h.jianyanjielun == "停止运行" ? "selected" : ""}>停止运行</option>
						<option value="监督运行" ${h.jianyanjielun == "监督运行" ? "selected" : ""}>监督运行</option>
						<option value="合格" ${h.jianyanjielun == "合格" ? "selected" : ""}>合格</option>
						<option value="不合格" ${h.jianyanjielun == "不合格" ? "selected" : ""}>不合格</option>
						<option value="无" ${h.jianyanjielun == "无" ? "selected" : ""}>无</option>
    				</select>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].jigoumingcheng" value="${h.jigoumingcheng}"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].xiacijianyanriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${h.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>"/>
    			</td>
    			<td>
    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].beizhu" value="${h.beizhu}"/>
    			</td>
    			<td class="endTd">
    				<a href="javascript:void(0)" onclick="delGdRow(this)">删除</a>
    			</td>
    		</tr>
   			</c:forEach>
   		</table>
   	</form>
  </body>
  
<script src="<%=path %>/js/page_tabs/page_tabs.js"></script>
<script type="text/javascript">

	if(${param.se == 'se'}){
		$("#title").show();
	}else{
		$("#title").hide();
		$(".endTd").hide();
	}
	var id = "${id}";
	var gdhzbnum = "${fn:length(gdhzbList)}";
	$().ready(function(){
		
		//添加行（管道）
		$("#gdhzb_add").click(function(){
			var tdList = $("#gdhzb").find("tr").last();
			var newTr = tdList.clone(true);
			newTr.find("td").children().each(function(){
				if($(this).attr("name") != undefined){
					$(this).attr("name",$(this).attr("name").replace($(this).attr("inum"),gdhzbnum));
					$(this).attr("inum",gdhzbnum);
					$(this).val('')
				}
			});
			$("#gdhzb").append(newTr);
			gdhzbnum++;
		});
	}); //结束
	
	function delGdRow(obj){
		if($("#gdhzb").find("tr").length == 3){
			$.dialog.alert('该表格至少保留一行!');
			return false;
  		}
        var tr=obj.parentNode.parentNode;  
        var tbody=tr.parentNode;  
        tbody.removeChild(tr); 
   } 

   function save(){
		var options = {
		    url:"<%=path%>/se!saveGlYlgd.do?id="+id,
			dataType:'json',
            beforeSubmit:function(formData, jqForm, options){
				parent.showMask("正在保存......");
				return true;
           	},
            success:function(rsp, statusText, xhr, $form){
            	parent.hideMask();
            	if(statusText == 'success'){
            		$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
            	}else {
					$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
            	}
            }
         };
         $("#frm_zcdj_gl_yldg").ajaxSubmit(options);
         return false;
	}
</script> 
</html>
