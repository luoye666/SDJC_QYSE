<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	input{
		margin-bottom: 20px;
		margin-left: 20px;
		padding-right: 10px
	}
</style>
	<script type="text/javascript">
var api = frameElement.api, W = api.opener;

api.button(
	{
	    id:'valueCx',
		name:'确定',
		callback:qd
	},{
	    id:'valueQx',
		name:'取消'
	}
);
function closeBefore(){
	W.searchForm = $("#frm_kggz_search_conditions").html();
}

function qd(){
	if($("input[type=radio]:checked").length == 0){
		$.dialog.alert("请选择注册登记表类型!");
		return false;
	}
	W.addZcdj();
//	return false;
};
function checkZcdj(url,title,zldm){
	W.url = url;
	W.title = title;
	W.zldm = zldm;
}
	</script>
</head>

<body>
  <div id="search_div" class="mod-search cf">
  <br/>
  	<div style="margin-bottom: 20px; ">
	    <p><input type="radio" name="zcdjbtype" onclick="checkZcdj('/1000/gl_zcdj_add.jsp','添加锅炉注册登记表','1000')" />锅炉</p>
	    <p><input type="radio" name="zcdjbtype" onclick="checkZcdj('/2000/ylrq_zcdj_add.jsp','添加压力容器注册登记表','2000')" />压力容器</p>
	    <p><input type="radio" name="zcdjbtype" onclick="checkZcdj('/3000/dt_zcdj_add.jsp','添加电梯注册登记表','3000')" />电梯</p>
	    <p><input type="radio" name="zcdjbtype" onclick="checkZcdj('/4000/qzjx_zcdj_add.jsp','添加起重机械注册登记表','4000')" />起重机械</p>
	    <p><input type="radio" name="zcdjbtype" onclick="checkZcdj('/5000/cnc_zcdj_add.jsp','添加厂内机动车注册登记表','5000')" />厂内机动车</p>
	    <p><input type="radio" name="zcdjbtype" onclick="checkZcdj('/6000/ylss_zcdj_add.jsp','添加大型游乐设施注册登记表','6000')" />大型游乐设施</p>
	    <p><input type="radio" name="zcdjbtype" onclick="checkZcdj('/8000/ylgd_zcdj_add.jsp','添加压力管道注册登记表','8000')" />压力管道</p>
	    <p><input type="radio" name="zcdjbtype" onclick="checkZcdj('/9000/kysd_zcdj_add.jsp','添加客运索道注册登记表','9000')" />客运索道</p>
	</div>
  </div>
</body>
</html>