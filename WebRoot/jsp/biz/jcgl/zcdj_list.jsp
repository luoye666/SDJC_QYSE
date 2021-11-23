<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.para.IConstant"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String freePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
%>
<!doctype html>
<html>
<head>

<style type="text/css">

	ul,li{ list-style:none:}

	a{ text-decoration: none;}

	.DivHidden{ width: 100px; border: 1px solid #CCC; border-bottom: none; z-index: 9999; display:none;position: fixed;top: 33px;}

	.DivHidden ul li{ background: #C2E0F1; text-align:center; height: 26px; line-height: 26px; border-bottom: 1px solid #CCC; position:relative;}

	.DivHidden ul li a{ color:#333;}

	.DivHidden ul li a:hover{ color:#f00;}
	
</style>
<jsp:include page="/jsp/common/include.jsp"></jsp:include>

</head>
<body>

<div class="wrapper">


  <div class="mod-search cf" id="Toolbar">
  	<a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_xj">新建</a><a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_sc">删除</a><a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_fz">复制</a><a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_ztqh">状态切换</a>
  	<a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_ytj_sybz_pdf_dy">下载使用标志</a><a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_ytj_djz_pdf_dy">下载使用登记</a>
	<div class="DivHidden box" id="mnubtn_zcdj_xj_div"></div> 
	<div class="DivHidden box" style="left: 185px" id="mnubtn_zcdj_ztqh_div">
		<ul>
			<li><a onclick="ztqh('')">全部</a></li>
			<li><a onclick="ztqh('0')">已保存</a></li>
			<li><a onclick="ztqh('2')">待审核</a></li>
			<li><a onclick="ztqh('1')">审核通过</a></li>
			<li><a onclick="ztqh('4')">预审通过</a></li>
			<li><a onclick="ztqh('3')">审核未通过</a></li>
		</ul>
	</div>
    <a style="float:right;" class="ui-btn" id="baozhi_search">查询条件</a>
  </div>
  
  <div class="grid-wrap">
    <table id="grid">
    </table>
    <div id="page"></div>
  </div>
</div>
<script>
var num = 0;
var cxtj;
var searchForm = "";
var path = "<%=path %>";
var url = "";
var title = "";
var zldm = "";
var tjstate = "${param.tjstate}";

	$(function(){
			$.post("<%=path%>/dirList!getSetypeList.do",{},
				function (data, textStatus){
					data = data.dirDatas;
					var setype = ""
					$.each(data,function(i){
						if(data[i].daima != "Q000"){
							setype += '<li><a onClick="selDw(\''+data[i].daima+'\',\''+data[i].mingcheng+'\')">'+data[i].mingcheng+'</a></li>';
						}
					});
					$("#mnubtn_zcdj_xj_div").html("<ul>"+setype+"</ul>");
			},"JSON");
			//悬浮
			$("#Toolbar").delegate("#mnubtn_zcdj_xj","mouseover",function(){
				$('#mnubtn_zcdj_xj_div').show();
			});
			//悬浮
			$("#Toolbar").delegate("#mnubtn_zcdj_xj","mouseout",function(){
				$('#mnubtn_zcdj_xj_div').hide();
			});
			//悬浮
			$("#Toolbar").delegate("#mnubtn_zcdj_ztqh","mouseover",function(){
				$('#mnubtn_zcdj_ztqh_div').show();
			});
			//悬浮
			$("#Toolbar").delegate("#mnubtn_zcdj_ztqh","mouseout",function(){
				$('#mnubtn_zcdj_ztqh_div').hide();
			});
			
			$("#mnubtn_zcdj_xj_div").on("mouseenter", function() {
                $('#mnubtn_zcdj_xj_div').show();
            })
			$("#mnubtn_zcdj_xj_div").on("mouseleave", function() {
                $('#mnubtn_zcdj_xj_div').hide();
            });
			$("#mnubtn_zcdj_ztqh_div").on("mouseenter", function() {
                $('#mnubtn_zcdj_ztqh_div').show();
            })
			$("#mnubtn_zcdj_ztqh_div").on("mouseleave", function() {
                $('#mnubtn_zcdj_ztqh_div').hide();
            });
	//导入登记表
	$("#Toolbar").delegate("#mnubtn_jcsj_sb_ydj_zcdjb_dr","click",function(){
		$.dialog({
				title:'导入注册登记表',
				lock: true,
			    width: '550px',
			    height: '450px',
			    content: 'url:<%=path%>/jsp/biz/jcgl/SimpleFileUpload_DJB.jsp?gzid='
		});
	});
	//新建登记表
	$("#Toolbar").delegate("#mnubtn_jcsj_sb_ydj_zcdjb_xj","click",function(){
		$.dialog({
				title:'选择注册登记表种类',
				lock: true,
			    width: '450px',
			    content: 'url:<%=path%>/jsp/biz/jcgl/check_zcdjb_type.jsp'
		});
	});
	
	//复制
	$("#mnubtn_zcdj_fz").click(function(){
		var ids = $STONE.getCheckGridIds("grid");
		if(ids == ""){
			$.dialog.alert("请选择复制的设备！");
			return false;
		}
		if(ids.length != '1'){
			$.dialog.alert("只能选择一条设备！");
			return false;
		}
		var row = $STONE.getCheckGridRow("grid",ids[0]);
	
		$.dialog({
				title:'复制',
				lock: true,
			    width: '350px',
			    height: '50px',
			    content: 'url:<%=path%>/jsp/biz/jcgl/zcdj_fz.jsp?ids='+ids
		});
	});
	
	//删除  只能删除未提交的数据
	$("#mnubtn_zcdj_sc").click(function(){
		var ids = $STONE.getCheckGridIds("grid");
		if(ids == ""){
			$.dialog.alert("请选择要删除的记录！");
			return false;
		}
		for(var i = 0;i<ids.length;i++){
			var row = $STONE.getCheckGridRow("grid",ids[i]);
			if(row.tjstate == '待审核' || row.tjstate == '审核通过'){
				$.dialog.alert("请不要选择【待审核】【审核通过】的记录!");
				return false;
			}
		}
		$.dialog.confirm("确定要删除选中的记录吗?", function(){  
				parent.showMask("正在删除......");
               	$.post("<%=path%>/register!delRegInfo.do?ids="+ids,{},
        				function (data, textStatus){
							parent.hideMask();
               				if(data.success){
               				}else{
               					$.dialog.alert("删除失败!");
               				}
                			reloadGrid();
        	    },"JSON");
		});
	});
	
	//批量提交
	$("#Toolbar").delegate("#mnubtn_jcsj_sb_ydj_zcdjb_tj","click",function(){
		var ids = $STONE.getCheckGridIds("grid");
		if(ids == ""){
			$.dialog.alert("请选择要提交的设备！");
			return false;
		}
		
       	$.post("<%=path%>/register!updateTj.do?ids="+ids,{},
 				function (data, textStatus){
       			data = data.msg;
				if(data == ""){
					$.dialog.alert("提交成功!");
				}else{
					$.dialog.alert(data);
				}
       			reloadGrid();
        				
 	    },"JSON");
		
	});
	
	//打印登记证
	$("#Toolbar").delegate("#mnubtn_jcsj_sb_yzc_djz_dy","click",function(){
		var ids = $STONE.getCheckGridIds("grid");
		if(ids == ""){
			$.dialog.alert('请选择设备!');
			return false;
		}
	//	window.open("<%=path%>/register!sydjzDyByJsp.do?id="+ids);
		openwindowByDjz("<%=path%>/jsp/biz/sbxx/zcdj/PrintPageByDjz.html?urls="+ids,400,200);
	});
	
	//查询条件
	$("#baozhi_search").click(function(){
		if(cxtj == undefined){
			cxtj = $.dialog({
					title:'查询条件',
				    width: '650px',
				    height: '400px',
					min:true,
				    close:function(){
						this.hide();
						return false;
					},
				    content: 'url:<%=path%>/jsp/biz/jcgl/zcdj_list_search.jsp'
			});
		}else{
			cxtj.show();
		}
	});
	
	//打印登记证PDF
	$("#Toolbar").delegate("#mnubtn_zcdj_ytj_djz_pdf_dy","click",function(){
		var ids = $STONE.getCheckGridIds("grid");
		if(ids.length != '1'){
			$.dialog.alert("只能选择一条登记信息！");
			return false;
		}
		 $.post("<%=path%>/register!printReg.do?id="+ids, {type:"djz"},
            function (data) {
                if(data.url == ""){
	 				$.dialog.alert("该设备还未打印登记证，如需下载请联系市场监督管理局进行打印！");
	 			}else{
	 				const url = "<%=freePath%>" + "/"+ data.url
	                window.open(url)
	 			}
            }, "JSON");
	});
	//打印使用标志PDF
	$("#Toolbar").delegate("#mnubtn_zcdj_ytj_sybz_pdf_dy","click",function(){
		
		var ids = $STONE.getCheckGridIds("grid");
		if(ids.length != '1'){
			$.dialog.alert("只能选择一条登记信息！");
			return false;
		}
		 $.post("<%=path%>/register!printReg.do?id="+ids, {type:"sybz"},
		            function (data) {
			 			if(data.url == ""){
			 				$.dialog.alert("该设备还未打印使用标志，如需下载请联系市场监督管理局进行打印！");
			 			}else{
			 				const url = "<%=freePath%>" + "/"+ data.url
			                window.open(url)
			 			}
		                
		            }, "JSON");
	
	});
	
	//条件筛选清空按钮点击
	$("#kggz_clear").click(function(){
		$STONE.formClear("#frm_kggz_search_conditions");
	});
	
});

	//选择单位
	function selDw(st,mc){
		zldm = st;
		title = mc;
		if("<%=user.getShiyongdanwei_id()%>" == "null"){
			addZcdj("0");
		}else{
			$.dialog({
				title:'选择使用单位',
				width: '650px',
				height: '400px',
				lock:true,
				content: 'url:<%=path%>/jsp/biz/jcgl/zcdj_check_sydw.jsp'
			});
		}
		
	}
	//查看未通过原因
	function checkYY(id){
		var row = $STONE.getCheckGridRow("grid",id);
		$.dialog({
			title:'未通过原因',
			width: '450px',
			height: '300px',
			lock:true,
			content: row.wtg_yuanyin
		});
	}
function addZcdj(sydwid){
	var fid = parent.getSelectTabsItemId();
	parent.addTabsItem("add_djb_"+zldm,"新建_"+title+"注册登记","<%=path%>/register!addZcdjb.do?sydwid="+sydwid+"&zldm="+zldm+"&fid="+fid);
}
//状态切换
function ztqh(state){
	var zt = '{"tjstate":"'+state+'"}';
	$STONE.sc_setGridQueryParams("#grid",$.parseJSON(zt));
}
//查询
function search(params){
	$STONE.sc_setGridQueryParams("#grid",params);
}

function reloadGrid(){
	$("#grid").trigger("reloadGrid");
}
	function editDjb(id,sydw,zldm){
		var fid = parent.getSelectTabsItemId();
		parent.addTabsItem("djb_"+id,sydw+"_登记表_"+id,"<%=path%>/register!openZcdjbById.do?id="+id+"&zldm="+zldm+"&fid="+fid);
	}
			//使window.open弹出的窗口居中
	function openwindowByDjz(url,iWidth,iHeight) {
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		var i=window.open("","批量打印",'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
		setTimeout(function(){
			i.location=url;
		}, 600);
	}
</script>
<script src="<%=path %>/js/bs/zcdj/zcdj_list.js"></script>
</body>
</html>