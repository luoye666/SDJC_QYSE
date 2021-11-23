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
	th{
		text-align: right;
		width: 20%;
	}
</style>
</head>
<body>
	<div class="wrapper">
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_app_edit_save">保存</a>
	  </div>
            <div>
                <form class="frm_subBase" id="frm_editOrgan" method="post">
                	<!-- 表单隐藏域 -->
                	<div class="formHiddenRegion">
	                	<input type="hidden" name="organ.id" value="${organ.id}"/>
	                	<input type="hidden" name="organ.parentId" value="${organ.parentId}"/>
                	</div>
                	<table style="width: 60%">
						<tr>
							<th>机构名称(中)：</th>
							<td><input class="ui-input long98" name="organ.name" id="organname" required value="${organ.name}"/></td>
						</tr>
						<tr>
							<th>机构名称(英)：</th>
							<td><input class="ui-input long98" name="organ.nameEN" required value="${organ.nameEN}"/></td>
						</tr>
						<tr>
							<th>机构代码：</th>
							<td><input class="ui-input long98" name="organ.code" required value="${organ.code}"/></td>
						</tr>
						<tr>
							<th>单位电话：</th>
							<td><input class="ui-input long98" name="organ.tel" value="${organ.tel}"/></td>
						</tr>
						<tr>
							<th>经度：</th>
							<td><input class="ui-input long98" name="organ.jingdu" value="${organ.jingdu}" /></td>
						</tr>
						<tr>
							<th>纬度：</th>
							<td><input class="ui-input long98" name="organ.weidu" value="${organ.weidu}" /></td>
						</tr>
						<tr>
							<th>管辖机构代码：</th>
							<td><input class="ui-input long98" name="organ.guanxiajigou" value="${organ.guanxiajigou}" /></td>
						</tr>
						<tr>
							<th>机构描述：</th>
							<td>
								<textarea rows="5" cols="26" style="width: 98%" name="organ.notes">${organ.notes}</textarea>
							</td>
						</tr>
						<tr>
							<th>排序号：</th>
							<td><input class="ui-input long98" name="organ.sort_num" value="${organ.sort_num}" /></td>
						</tr>
					</table>
				</form>
            </div>
        </div>  
   </body>
   </html>
	<!-- 脚本 -->
	<script type="text/javascript">
		/**页面元素事件注册*/
		$().ready(function(){
			/*************************************************************************************************************************/
			//编辑机构窗口提交按钮点击
			$("#mnubtn_app_edit_save").click(function(){
				var options = {
				    url:"<%=path%>/organ!edit.do",
					dataType:'json',
		            beforeSubmit:function(formData, jqForm, options){
					    if($("#frm_editOrgan").validate().form()){
				    		self.parent.parent.showMask("正在保存......");
					    	return true;
					    }
						return false;
		           	},
		            success:function(rsp, statusText, xhr, $form){
		            	if(rsp.success){
				    		self.parent.frames["organTree"].updOrganName($("#organname").val());
		            		self.parent.parent.hideMask();
							$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
		            	}else{
							$.dialog.tips('<font color="red">保存失败!</font>',3,'error.gif');
					    }
		            }
		         };
		         $("#frm_editOrgan").ajaxSubmit(options);
		         return false;
				
			});
			
		})
		
	</script>