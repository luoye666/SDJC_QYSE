<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	 
<!doctype html>
<html>
<head>
<link href="<%=path %>/js/SelectMenu/css/selectmenu.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/js/SelectMenu/css/normalize.css" rel="stylesheet" type="text/css">
<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<script src="<%=path %>/js/SelectMenu/js/selectmenu.js"></script>
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
			<form name="frm_msg_add" id="frm_msg_add" method="POST">
				<table>
					<tr>
						<th>发布时间：</th>
						<td>
							<input class="ui-input" type="text" name="box.createDate" id="createDate" onfocus="this.blur()" />
						</td>
					</tr>
					<tr>
						<th>是否置顶：</th>
						<td>
							<select name="box.isUp" id="isup" style="width: 189px;">
								<option value="0">否</option>
								<option value="1">是</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>发布内容：</th>
						<td>
							<textarea id="editor_id" name="box.content" style="width:450px;height:100px;"></textarea>
						</td>
					</tr>
					<tr>
						<th>发布内容类别：</th>
						<td>
							<select name="box.leibie" id="leibie" style="width: 189px;">
								<option value="1">通知公告</option>
								<option value="2">紧急通知</option>
								<option value="3">软件功能</option>
								<option value="4">版本更新</option>
								<option value="5">征求意见</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>发布人：</th>
						<td>
							<input class="ui-input long98" type="text" name="box.faburen" value="${box.faburen}" onfocus="this.blur()" />
						</td>
					</tr>
					<tr>
						<th>阅读者类型：</th>
						<td>
							<button type="button" id="ydzType" style="width:50px;height:20px;"><i class="fa fa-server"></i>选择</button>
							<div style="height:50px;width:100%;border:1px soild red;display: inline;">
							<span class="btn" id="ydzTypeSpan">质监局</span></div>
							<input type="text" name="box.jigou" id="jigou" value="1" style="display: none;"/>
						</td>
					</tr>
					<tr>
						<th>阅读者：</th>
						<td>
							<button type="button" id="yueduzhe" style="width:50px;height:20px;"><i class="fa fa-server"></i>选择</button>
							<div style="height:50px;width:100%;border:1px soild red;display: inline;">
							<span class="btn" id="ydzSpan">${box.name}</span></div>
							<input type="text" name="box.code" id="code" value="${box.code}" style="display: none;"/>
							<input type="text" name="box.name" id="name" value="${box.name}" style="display: none;"/>
						</td>
					</tr>
					<tr id="tt" style="display: none;">
						<th></th>
						<td>
							<button type="button" id="yueduzhequ" style="width:50px;height:20px;"><i class="fa fa-server"></i>区</button>
							<div style="height:50px;width:100%;border:1px soild red;display: inline;">
							<span class="btn" id="ydzquSpan"></span></div>
							<input type="text" name="box.yueduzhe" id="quname" value="${box.yueduzhe}" style="display: none;"/>
						</td>
					</tr>
					<tr>
						<th>附件：</th>
						<td>
							<input type="file" style="width: 70%" name="file" id="file"/>&nbsp;&nbsp;<font color="red">(不能超过10M)</font>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</body>
	</html>
	<!-- 脚本 -->
	<script runat="server" type="text/javascript">
	var api = frameElement.api, W = api.opener;
	var ydzTypeSpan; //阅读者类型显示区内容
	var ydzTypeIpt; //阅读者类型隐藏内容
	var ydzSpan; //阅读者显示区内容
	var ydzIpt; //阅读者隐藏内容（当省局发布精确到区时使用）
	var ydzquSpan; //阅读者显示区内容（当省局发布精确到区时使用）
	var ydzquIpt=""; //阅读者隐藏内容（当省局发布精确到区时使用）
	var yueduzheData; //地市区县初始化
	var yueduzhequData; //地市区县初始化（区）
	var organCode = '${box.code}';
	var a = '<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %>';
	
    a =a.getFullYear()+ "-"+(a.getMonth()+1)+"-"+a.getDate()+" "+a.getHours()+":"+a.getMinutes();
    //发布日期（服务器时间）
    $('#createDate').val(a);
    
	api.button(
		{
		    id:'valueCx',
			name:'保存',
			callback:save
		},{
		    id:'valueQx',
			name:'关闭'
		}
	);
	//是否置顶默认否
	$("#isup").selectmenu().selectmenu("menuWidget").css("height","50px");
	//发布内容类别
	$("#leibie").selectmenu().selectmenu("menuWidget").css("height","120px");
	//阅读者类型
	var yueduzhetypeData = [
		{id:1 ,name:'质监局'},
		{id:3 ,name:'使用单位'},
		{id:4 ,name:'安装单位'}
	];
	//获取地市
	if(organCode.length == '2'){
		$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
			function (data, textStatus){
				yueduzheData = data.dicDatas;
		},"JSON");
	}else if(organCode.length == '4'){
		//获取区县
		$.post("<%=path%>/dicList!getDataListByParentCodeForDic.do",{code:organCode,type:'1'},
			function (data, textStatus){
				yueduzheData = data.dicDatas;
			},"JSON");
	}else if(organCode.length == '6'){
		$('#yueduzhe').hide();
	}
	
	
	/**
	 * 阅读者类型选择（多选不能为空）
	 * @memberOf {TypeName} 
	 */
	$('#ydzType').click(function(){
		$(this).selectMenu({
			showField : 'name',  //显示字段
			keyField : 'id',  //key值
			search : false,  //是否可以输入搜索
			title:false,  //是否有标题
			initSelected: '1', //默认选择
			multiple: true,  //是否多选
			data : yueduzhetypeData,  //json格式内容
			eSelect: function(data){ 
				ydzTypeSpan = "";  //清空
				ydzTypeIpt = "";
				$.each(data,function(index,item){
					ydzTypeSpan +=item.name+' ';  //赋值
					ydzTypeIpt += item.id+',';
				});
				$('#ydzTypeSpan').html(ydzTypeSpan.substring(0,ydzTypeSpan.length-1));
				$('#jigou').val(ydzTypeIpt.substring(0,ydzTypeIpt.length-1));
				if($("#ydzTypeSpan").html() == ""){
				    $('#ydzTypeSpan').html("不能为空");
				}
			}
		});
	});
	
	/**
	 * 阅读者默认是用户的所属区划，不可以选更高级别，可以复选市、县区，
	 * 如省局用户，默认山东省，则全省都可以看；
	 * 烟台市局用户，默认为烟台，
	 * 但是可以在烟台下面复选县区，但不可以选择其他地市；
	 * 如果是县区用户，则锁死县区，不能选择；
	 */
	$('#yueduzhe').click(function(){
		yueduzhequData = "";
		$(this).selectMenu({
			showField : 'name',  //显示字段
			keyField : 'code',  //key值
			search : false,  //是否可以输入搜索
			title: false,  //是否有标题
			multiple: true,  //是否多选
			listSize : 5,//设置显示的菜单项目个数（菜单高度）
			data : yueduzheData,
			eSelect: function(data){ 
				ydzSpan = '${box.name}'+" ";  //清空
				ydzIpt = '${box.code}'+",";
				$.each(data,function(index,item){
					ydzSpan +=item.name+' ';  //赋值
					ydzIpt += item.code+',';
				});
				$('#ydzSpan').html(ydzSpan.substring(0,ydzSpan.length-1));
				$('#name').val(ydzSpan.substring(0,ydzSpan.length-1));
				$('#code').val(ydzIpt.substring(0,ydzIpt.length-1));
				if($("#ydzSpan").html() == ""){
				    $('#ydzSpan').html('${box.name}');
				    $('#name').val('${box.name}');
				    $('#code').val('${box.code}');
				}
				//当只选择一个地市时，出现区县的选择（待完善：争取多地市的区县都能选择）
				if(data.length == 1){
					organCode = data[0].code;
					if(organCode.length == 4){
						//获取区县
						$.post("<%=path%>/dicList!getDataListByParentCodeForDic.do",{code:organCode,type:'1'},
							function (data, textStatus){
								yueduzhequData = data.dicDatas;
							},"JSON");
						$('#tt').show();
					}
					
				}else{
					$('#ydzquSpan').html("");
					ydzquIpt = "";
					ydzquSpan = "";
					$('#quname').val('');
					$('#tt').hide();
				}
			}
		});
	});
	
	
	
	/**
	 * 阅读者默认是用户的所属区划，不可以选更高级别，可以复选市、县区，
	 * 如省局用户，默认山东省，则全省都可以看；
	 * 烟台市局用户，默认为烟台，
	 * 但是可以在烟台下面复选县区，但不可以选择其他地市；
	 * 如果是县区用户，则锁死县区，不能选择；
	 */
	$('#yueduzhequ').click(function(){
		$(this).selectMenu({
			showField : 'name',  //显示字段
			keyField : 'code',  //key值
			search : false,  //是否可以输入搜索
			title: false,  //是否有标题
			multiple: true,  //是否多选
			listSize : 5,//设置显示的菜单项目个数（菜单高度）
			data : yueduzhequData,
			eSelect: function(data){ 
				ydzquSpan = "";  //清空
				ydzquIpt = "";
				$.each(data,function(index,item){
					ydzquSpan +=item.name+' ';  //赋值
					ydzquIpt +=item.code+',';
				});
				$('#ydzquSpan').html(ydzquSpan.substring(0,ydzquSpan.length-1));
				$('#quname').val(ydzquSpan.substring(0,ydzquSpan.length-1));
			}
		});
	});
	
	 
	$("#editor_id").keydown(function(event){  
		if(event.keyCode==13){  
			$("#editor_id").val($("#editor_id").val()+"<br>");
		}  
	});  
	
		
	function save(){
		if(ydzquIpt.length > 0){
			$('#code').val($('#code').val()+','+ydzquIpt);
		}
		var options = {
			url:"<%=path%>/messageBox!add.do",
			dataType:'json',
            beforeSubmit:function(formData, jqForm, options){
				var fname = $("#file").val();
				var ftype = fname.substring(fname.lastIndexOf("."));
				if(ftype == ".exe"){
					$.dialog.alert('上传文件类型不能为.exe类型!');
					return false;
				}
				if($("#frm_msg_add").validate().form()){
					W.parent.showMask("正在保存......");
					return true;
				}
			   
			    return false;
           	},
            success:function(rsp, statusText, xhr, $form){
            	W.parent.hideMask();
            	if(rsp.msg == "SUCCESS"){
	            	$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
					W.reloadGrid();
					setTimeout(function(){
						api.close();
					}, 2000 );
	            }else if(rsp.msg == "OUTSIZE"){
					$.dialog.tips('<font color="blue">上传附件过大，最大为10M!</font>',3,'error.gif');
	            }else{
					$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
            	}
            }
         };
         $("#frm_msg_add").ajaxSubmit(options);
         return false;
	}
		
	</script>