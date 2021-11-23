<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
%>	
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	.grid tr.jqgrow td {
			  white-space: normal !important;
			  height:auto;
			  vertical-align:text-top;
			  padding-top:2px;
			  word-break:break-all;
			 }
</style>
</head>
<body>
	<div class="wrapper">
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_msg_add" style="display:none">添加</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_msg_del" style="display:none">删除</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_msg_fb" style="display:none" >发布</a>
	  </div>

	  <div class="grid-wrap">
	    <table id="grid" class="grid">
	    </table>
    	<div id="page"></div>
	  </div>
	</div>
</body>
</html>	
	<!-- 脚本 -->
	<script type="text/javascript">
	
	var path = "<%=path %>";
	
	if('<%=user.getLoginId() %>' == 'admin'){
		$('#mnubtn_msg_del').show();
	}
		function editMsg(id){
			$.dialog({
				title:'消息信息',
			    width: '550px',
			    height: '400px',
			    lock: true,
			    content: 'url:<%=path%>/messageBox!getMsgById.do?id='+id
			});
		}
		
		function yulan(title,id){
			$.dialog({
			    id: 'msg',
			    title: title,
			    content: 'url:<%=path%>/messageBox!getNeirong.do?ids='+id,
			    width: 300,
			    height: 250,
			    left: '100%',
			    top: '100%',
			    fixed: true,
			    drag: false,
			    resize: false
			});
		}
		
		/**页面所需资源初始化*/
		$().ready(function(){
			
			//发送消息
			$("#mnubtn_msg_fb").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				
				if(ids.length !=1){
					$.dialog.alert("请选择一条消息进行发布！");
					return false;
				}
				$.post("<%=path%>/messageBox!sendMessage.do?id="+ids,{},
       				function (data, textStatus){
               			reloadGrid();
       			}); 
			});
			
			//发送消息
			$("#mnubtn_cancelMessage").click(function(){
				var ids = $STONE.getGridCheckedIds("#grd_Messages");
				var checkedNum = $STONE.getGridChecked("#grd_Messages").length;
				
				if(checkedNum !=1){
					$.messager.alert("警告","只能选择一条消息进行发送!","info");
					return false;
				}
				$.post("<%=path%>/messageBox!cancelMessage.do",{id:ids},
       				function (data, textStatus){
               			$("#grd_Messages").datagrid("reload");
       			}); 
			});
			
			$("#mnubtn_msg_add").click(function(){
				$.dialog({
						title:'添加消息',
					    width: '550px',
					    height: '450px',
					    lock: true,
					    content: 'url:<%=path%>/messageBox!openAdd.do'
					    //content: 'url:<%=path%>/jsp/message/message_add.jsp'
				});
			});
			
			$("#mnubtn_msg_del").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				
				if(ids.length==0){
					$.dialog.alert("请选择要删除的项目！");
					return false;
				}
				
				$.dialog.confirm("确定要删除选择的数据吗?", function(){  
	                $.post("<%=path%>/messageBox!deleteByIds.do?ids="+ids,{},
	        			function (data, textStatus){
	                		reloadGrid();
	        		});
	            });
			});
		})
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	</script>
<script src="<%=path %>/js/bs/message/message_list.js"></script>