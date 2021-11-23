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
			<form name="frm_msg_edit" id="frm_msg_edit" method="POST">
				<table>
					<tr>
						<th>发布时间：</th>
						<td>
							<span class="btn">${box.createDate}</span>
						</td>
					</tr>
					<tr>
						<th>是否置顶：</th>
						<td>
							<span class="btn" id="isup"></span></div>
						</td>
					</tr>
					<tr>
						<th>发布内容：</th>
						<td>
							<textarea id="editor_id" name="box.content" style="width:430px;height:100px;">${box.content}</textarea>
						</td>
					</tr>
					<tr>
						<th>发布内容类别：</th>
						<td>
							<span class="btn" id="leibie"></span>
						</td>
					</tr>
					<tr>
						<th>发布人：</th>
						<td>
							<span class="btn">${box.faburen}</span>
						</td>
					</tr>
					<tr>
						<th>阅读者类型：</th>
						<td>
							<div><span class="btn" id="ydzTypeSpan"></span>
						</td>
					</tr>
					<tr>
						<th>阅读者：</th>
						<td>
							<span class="btn" >${box.name} ${box.yueduzhe}</span>
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
	var leibie="", jigou="",jigouA='${box.jigou}';
	api.button(
		{
		    id:'valueQx',
			name:'关闭'
		}
	);
	
	if(${box.isUp == '0'}){
		$('#isup').html('否');
	}else{
		$('#isup').html('是');
	}
	
	switch(${box.leibie}){
		case 1:
 			leibie = "通知公告";
  			break;
		case 2:
 	 		leibie = "紧急通知";
  			break;
		case 3:
			leibie = "软件功能";
			break;
		case 4:
			leibie = "版本更新";
			break;
		case 5:
			leibie = "征求意见";
			break;
	}
	
	var jigouArr = jigouA.split(',');
	
	$.each(jigouArr,function(index,item){
			if(item == 1){
				jigou += "质监局 ";
			}else if(item == 2){
				jigou += "特检机构 ";
			}else if(item == 3){
				jigou += "使用单位 ";
			}else if(item == 4){
				jigou += "安装单位 ";
			}
		});
	
	$('#leibie').html(leibie);
	$('#ydzTypeSpan').html(jigou);
		
	</script>