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
		width: 20%
	}
</style>
</head>
<body>
	<div class="wrapper">
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="btn_addOrgan_submit">保存</a>
	  </div>
            <div> 
                <form class="frm_subBase" id="frm_addOrgan" method="post">
                	<input type="hidden" name="organ.parentId" value="${param.pid}"/>
					<table style="width: 60%">
						<tr>
							<th>机构名称(中)：</th>
							<td><input class="ui-input long98" name="organ.name" required id="organname"/></td>
						</tr>
						<tr>
							<th>机构名称(英)：</th>
							<td><input class="ui-input long98" name="organ.nameEN" required /></td>
						</tr>
						<tr>
							<th>机构代码：</th>
							<td><input class="ui-input long98" name="organ.code" required /></td>
						</tr>
						<tr>
							<th>单位电话：</th>
							<td><input class="ui-input long98" name="organ.tel" /></td>
						</tr>
						<tr>
							<th>经度：</th>
							<td><input class="ui-input long98" name="organ.jingdu" /></td>
						</tr>
						<tr>
							<th>纬度：</th>
							<td><input class="ui-input long98" name="organ.weidu" /></td>
						</tr>
						<tr>
							<th>管辖机构代码：</th>
							<td><input class="ui-input long98" name="organ.guanxiajigou" /></td>
						</tr>
						<tr>
							<th>机构描述：</th>
							<td>
								<textarea rows="5" style="width: 98%" name="organ.notes"></textarea>
							</td>
						</tr>
						<tr>
							<th>排序号：</th>
							<td><input class="ui-input long98" name="organ.sort_num" /></td>
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
			//添加机构窗口提交按钮点击
			$("#btn_addOrgan_submit").click(function(){
				var options = {
					url:"<%=path%>/organ!add.do",  
					dataType:'json',
		            beforeSubmit:function(formData, jqForm, options){
					    if($("#frm_addOrgan").validate().form()){
				    		self.parent.parent.showMask("正在保存......");
					    	return true;
					    }
					    return false;
		           	},
		            success:function(rsp, statusText, xhr, $form){
		            	self.parent.parent.hideMask();
		            	if(rsp.success){
							var newNode = {id:rsp.id,name:$("#organname").val(),target:"showOrganManager"};
		            		self.parent.frames["organTree"].addOrganName(newNode);
							window.location="<%=path%>/organ!getOrganInfo.do?id="+rsp.id;
		            	}else{
							$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
		            	}
		            }
		         };
		         $("#frm_addOrgan").ajaxSubmit(options);
		         return false;
			});
		})
		
	</script>