<%@page import="com.stone.para.IConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
	<div class="easyui-layout unit_layout" data-options="fit:true"> 
    	<div data-options="region:'center'">
    		<form class="frm_subBase" id="frm_mes_group_user_selectuser" method="post">
				 <ul id="selectUser" class="easyui-tree"></ul>  
			</form>
		</div>
		<div data-options="region:'south',border:false" class="align-right">  
                <a id="btn_mesGroupUserSelectUser_submit" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)">确定</a>  
                <a id="btn_mesGroupUserSelectUser_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)">取消</a>  
         </div>
	</div>
	<!-- 脚本 -->
	<script type="text/javascript">
		//
		$().ready(function(){
			$('#selectUser').tree({
				checkbox: true,
				animate:true,
				onlyLeafCheck:true,
				url:"<%=path%>/userList!getListTree.do",
				onClick:function(node){
            alert(node.id);
          },
				loadFilter: function(data,parent){
	  				var filterData = [];
	  				$.each(data.menus,function(index,value){
	  					var treeNote = {"id":value.id,"text":value.text};
	  					filterData[index] = treeNote;
	  				});
	  		    	return filterData;
	  		    },
			});
			
		});
		//
		$().ready(function(){
			//确定按钮点击
			$("#btn_mesGroupUserSelectUser_submit").click(function(){
				
			});
			
			//取消按钮点击
			$("#btn_mesGroupUserSelectUser_cancel").click(function(){
				$("#win_selectUser").window("close");	//关闭窗口
			});
			
		});
	</script>