<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>

</head>
<body>

<div class="wrapper">
  <div class="mod-search cf">
    <a class="ui-btn ui-btn-sp" id="mnubtn_addUser">添加</a>
    <a class="ui-btn ui-btn-sp" id="mnubtn_delUser">删除</a>
    <a class="ui-btn ui-btn-sp" id="mnubtn_disableUserState">冻结账户</a>
    <a class="ui-btn ui-btn-sp" id="mnubtn_enableUserState">恢复账户</a>
    <a class="ui-btn ui-btn-sp" id="mnubtn_sejyxxqx">设备检验信息权限</a>
    <a style="float:right;" class="ui-btn" id="baozhi_search">查询条件</a>
  </div>
  <div class="grid-wrap">
    <table id="grid">
    </table>
    <div id="page"></div>
  </div>
	</div>
	</body>
	</html>
	<script type="text/javascript">
var cxtj;
var searchForm = "";
var path = "<%=path %>";
var organId = "${param.organId}";
		//编辑人员方法
		function editUser(id){
				$.dialog({
						title:'详细信息',
					    width: '550px',
					    height: '350px',
					    lock: true,
					    content: 'url:<%=path%>/user!openUserInfo.do?id='+id
				});
		}
		
		/**页面元素事件注册*/
		$().ready(function(){
			
			//添加人员按钮点击
			$("#mnubtn_addUser").click(function(){
				$.dialog({
						title:'添加人员',
					    width: '550px',
					    height: '350px',
					    lock: true,
					    max:true,
					    content: 'url:<%=path%>/jsp/sys/userManager_addUser.jsp'
				});
			});
			
			//删除人员按钮点击
			$("#mnubtn_delUser").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择要删除的人员！");
					return false;
				}
				$.dialog.confirm("确定要删除选择的人员吗?", function(){
				    self.parent.parent.showMask("正在删除......");
	                $.post("<%=path%>/user!deleteByIds.do?ids="+ids,{},
	        			function (data, textStatus){
		            		self.parent.parent.hideMask();
	                		reloadGrid();
	        		});
	            });  
			});
			//设备检验信息修改权限
			$("#mnubtn_sejyxxqx").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择人员！");
					return false;
				}
				$.dialog({
						title:'设置权限',
					    width: '150px',
					    height: '50px',
					    lock: true,
					    ok:function(){
							var rs = $("input[name='seinfo']:checked").val();
						    self.parent.parent.showMask("正在设置......");
			                $.post("<%=path%>/user!updSeJyInfoByIds.do?ids="+ids+"&rs="+rs,{},
			        			function (data, textStatus){
				            		self.parent.parent.hideMask();
			                		reloadGrid();
			        		});
					    },
					    cancel:true,
					    content: '<input type="radio" name="seinfo" value="0" />可修改&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="seinfo" value="1" />不可修改'
				});
			});
			
			//冻结账户
			$("#mnubtn_disableUserState").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择要冻结的账户！");
					return false;
				}
				$.dialog.confirm("帐户冻结之后将不能登录，确定要冻结选择的账户吗?", function(){  
	                $.post("<%=path%>/user!stateDisable.do?ids="+ids,{},
	            		function (data, textStatus){
	                   		reloadGrid();
	            	});
	            });  
			})
			
			//恢复账户
			$("#mnubtn_enableUserState").click(function(){
				var ids = $STONE.getCheckGridIds("grid");
				if(ids == ""){
					$.dialog.alert("请选择要恢复的账户！");
					return false;
				}
				$.dialog.confirm("该操作将恢复被冻结的帐户，确定继续执行吗?", function(){  
	                $.post("<%=path%>/user!stateEnable.do?ids="+ids,{},
	            		function (data, textStatus){
	                   		reloadGrid();
	            	});
	            }); 
			})
			//查询条件
			$("#baozhi_search").click(function(){
					cxtj = $.dialog({
							title:'查询条件',
						    width: '550px',
						    height: '250px',
							min:true,
						    cache:false,
						    autoOpen: false,
						    close:function(){
								cxtj.content.closeBefore();
							},
						    content: 'url:<%=path%>/jsp/sys/userManager_search.jsp'
					});
			});

		})
		
//查询
function search(params){
	$STONE.sc_setGridQueryParams("#grid",params);
}
	function reloadGrid(){
		$("#grid").trigger("reloadGrid");
	}
	function ajaxLoad(){
		var ids = $("#grid").jqGrid("getDataIDs");
		for(var i = 0;i<ids.length;i++){
			var row = $("#grid").jqGrid("getRowData",ids[i]);
			$.ajax({
			   type: "POST",
			   url: "<%=path%>/user!loadInfo.do",
			   data:'organId='+row.organId+"&userId="+row.id,
			   dataType:"json",
			   async: false,
			   success: function(data, textStatus){
					$("#grid").jqGrid("setCell",ids[i],"organName", data.organ.name);
					$("#grid").jqGrid("setCell",ids[i],"ssjs", data.ssjs);
			   }
			});
		}
	}
	</script>
<script src="<%=path %>/js/bs/sys/rygl_list.js"></script>