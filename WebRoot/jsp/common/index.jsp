<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.sys.pojo.TOrgan"%>
<%@ taglib prefix="c" uri="/c.tld" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
    //当前用户名称
    String username=user.getName();
    String shidaima = user.getShidaima();
    String bjstate = user.getBjstate();
 	response.setHeader("Cache-Control","no-cache");
    
    response.setHeader("Pragrma","no-cache");
     
    response.setDateHeader("Expires",-1);
    
%>
<c:set var="bjstate" value="<%=bjstate %>"/>
<c:set var="shidaima" value="<%=shidaima %>"/>
<html>
  <head>
	<title>企业设备管理系统</title>
	<META HTTP-EQUIV="pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
	<META HTTP-EQUIV="expires" CONTENT="0">
	<style type="text/css">
		*{  
    -moz-user-select:-moz-none;  
}  
	</style>
<link href="<%=path %>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/baseSupportStyle.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/ui.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/base/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/base/jquery.ui.core.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/base/jquery.ui.theme.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/base/jquery.ui.datepicker.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/base/jquery.ui.autocomplete.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/base/ui.jqgrid.css" rel="stylesheet" type="text/css">
<script src="<%=path %>/js/jquery.js"></script>
<script src="<%=path %>/js/json2.js"></script>
<script src="<%=path %>/js/common.js"></script>
<script src="<%=path %>/js/jquery.combo.js"></script>
<script src="<%=path %>/js/grid/i18n/grid.locale-cn.js"></script>
<script src="<%=path %>/js/grid/grid.base.js"></script>
<script src="<%=path %>/js/grid/grid.custom.js"></script>
<script src="<%=path %>/js/grid/jquery.fmatter.js"></script>
<script src="<%=path %>/js/grid/grid.common.js"></script>
<script src="<%=path %>/js/grid/grid.celledit.js"></script>
<script src="<%=path %>/js/ui/jquery.ui.core.js"></script>
<script src="<%=path %>/js/ui/jquery.ui.widget.js"></script>
<script src="<%=path %>/js/ui/jquery.ui.datepicker.js"></script>
<script src="<%=path %>/js/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<script src="<%=path %>/js/plugin/lhgdialog.js?self=true&skin=blue"></script>
<script src="<%=path %>/js/ui/jquery.validate.js"></script>
<script src="<%=path %>/js/ui/jquery-powerFloat-min.js"></script>
<link href="<%=path %>/css/default.css" rel="stylesheet" type="text/css">
<script src="<%=path %>/js/ui/base.js?v=20131218"></script>
<script src="<%=path %>/js/ui/jquery.tab.js"></script>
<script src="<%=path %>/js/ui/jquery.menu.js"></script>
<script type="text/javascript" src="<%=path%>/js/comet4j.js"></script>
<script src="<%=path %>/js/jquery-ui-1.10.4.custom.min.js"></script>

<style type="text/css">
	.left{
		text-align: center;
		height: 38px;
		line-height:38px;
		width:100%;
		background: url(<%=path %>/images/left_top.jpg) no-repeat;
		padding-top: 2px;
	}
.left a{
	font-size: 14px;
	color:black;
}
	
.div_top{
	color: blue;
	font-size: 16px;
	font-weight: normal;
	BACKGROUND: url(<%=path%>/images/top.gif) #DED4BD no-repeat left top;
	PADDING-RIGHT: 5px; 
	PADDING-LEFT: 5px; 
	PADDING-BOTTOM: 5px; 
	MARGIN: 0px; 
	PADDING-TOP: 5px; 
	BORDER-BOTTOM: #444 1px solid;
	text-align: center;
}
.div_li{
	
	PADDING-RIGHT: 0px; 
	PADDING-LEFT: 0px; 
	Z-INDEX: 100; 
	FLOAT: left; 
	PADDING-BOTTOM: 0px; 
	MARGIN: 0px 1px 0px 0px; 
	PADDING-TOP: 0px; 
	POSITION: relative; 
	
	TEXT-ALIGN: left;
}
.div_bottom{
	BACKGROUND: url(<%=path%>/images/bottom.gif) #EFE5CE no-repeat left bottom
}
.imga{
	background: url("<%=path%>/images/edit.png") no-repeat;
	padding-right: 15px;
}
.img_font{
	margin-left: 8px;
	font-size: 13px;
}

.slide{
	padding: 0 0 0 45%;
	position: fixed;
	z-index: 999;
}
.btn-slide{
	background: url(<%=path%>/images/top_split.png) no-repeat;
	text-align: center;
	width:90px;
	height:10px;
	padding: 0px 0px 0 0;
	margin: 0 auto;
	display: block;
	text-decoration: none;
}
#mnubtn_index_dialog{
	position:fixed;
	z-index: 999;
	margin: 0 0 0 92%;
	height: 28px;
}
.dhbt{
	padding-right: 30px;
	text-align: right;
	color: black;
}
.wdhbt{
	padding-right: 50px;
	text-align: right;
	color: black;
}
.item{
	display: none;
}
</style>
<script>
	var CONFIG = {
		DEFAULT_PAGE: true,
		SERVICE_URL: 'http://online-gd.youshang.com/onlinegd/'
	};
	//系统参数控制
	var SYSTEM = {
		version: 1,
		curDate: '1387689566393',  //系统当前日期
		DBID: '793892194292',      //账套ID
		serviceType: '12',         //账套类型，13：表示收费服务，12：表示免费服务
	//	realName: '赵林场',          //真实姓名
		userName: 'zhaolinchang@baidu.com', //用户名
		companyName: '山东质监特种设备综合管理系统',	//公司名称
		startDate: '2014-12-22', //启用日期
		currency: 'RMB',	//本位币
		qtyPlaces: '2',	    //数量小数位
		pricePlaces: '2',	//单价小数位
		amountPlaces: '2',  //金额小数位
		valMethods:	'movingAverage',	//存货计价方法
		invEntryCount: '300',//试用版单据分录数
		rights: {},//权限列表
		billRequiredCheck: 0, //是否启用单据审核功能  1：是、0：否
		requiredCheckStore: 1, //是否检查负库存  1：是、0：否
		requiredMoney: 1, //是否启用资金功能  1：是、0：否
		taxRequiredCheck: 0,
		taxRequiredInput: 17,
		isAdmin:true, //是否管理员
		siExpired:false,//是否过期
		siType:2, //服务版本，1表示基础版，2表示标准版
		siVersion:3, //1表示试用、2表示免费（百度版）、3表示收费，4表示体验版
		Mobile:"",//当前用户手机号码
		isMobile:false,//是否验证手机
		isshortUser:true,//是否联邦用户
		shortName:"baidu",//shortName
		isOpen:false,//是否弹出手机验证
		indexHref:"推送通知;jsp/message/message_list.jsp?1=1"//首页显示内容
	};
	SYSTEM.servicePro = 'forscm3';
	if(SYSTEM.siType === 2) {
		SYSTEM.servicePro = 'forbscm3';
	};
	
	SYSTEM.date = {
				format:function(dateValue,pattern){
						if(!dateValue) return;
						if(typeof dateValue == "string"){
							dateValue = $.parseJSON(dateValue);
	  	  				}
						pattern = pattern || "yyyy-MM-dd";
						var o = {
							"y+" : dateValue.year + 1900,
							"M+" : dateValue.month + 1,
							"d+" : dateValue.date,
							"h+" : dateValue.hours,
							"m+" : dateValue.minutes,
							"s+" : dateValue.seconds,
						}
						if (/(y+)/.test(pattern))
							pattern = pattern.replace(RegExp.$1, (dateValue.year + 1900 + "").substr(4 - RegExp.$1.length));
						for (var k in o)
							if (new RegExp("(" + k + ")")
							.test(pattern))
								pattern = pattern.replace(
										RegExp.$1,
										RegExp.$1.length == 1 ? o[k] : ("00" + o[k]
										)
										.substr(("" + o[k]).length));
						return pattern;
				}
			};
	var cacheList = {};	//缓存列表查询   
	$(function(){
		/*
		 * 判断IE6，提示使用高级版本
		 */
		if(Public.isIE6) {
			 var Oldbrowser = {
				 init: function(){
					 this.addDom();
				 },
				 addDom: function() {
				 	var html = $('<div id="browser">您使用的浏览器版本过低，影响网页性能，建议您换用<a href="http://www.google.cn/chrome/intl/zh-CN/landing_chrome.html" target="_blank">谷歌</a>、<a href="http://download.microsoft.com/download/4/C/A/4CA9248C-C09D-43D3-B627-76B0F6EBCD5E/IE9-Windows7-x86-chs.exe" target="_blank">IE9</a>、或<a href=http://firefox.com.cn/" target="_blank">火狐浏览器</a>，以便更好的使用！<a id="bClose" title="关闭">x</a></div>').insertBefore('#container').slideDown(500); 
				 	this._colse();
				 },
				 _colse: function() {
					  $('#bClose').click(function(){
							 $('#browser').remove();
					 });
				 }
			 };
			 Oldbrowser.init();
		};
		
		$( "#dialog" ).dialog({
	        autoOpen: false,
	        width: 300,
	        height: 300,
		    min:true,
			cache:false,
			position: ['right','bottom']
	    });
		
		dialogInfo();
		
	})
		//打印URL
		function printURL(sHref) {
			//$.browser.msie = /rv/.test(navigator.userAgent.toLowerCase());
			if(document.getElementById && document.all && sHref){
				if(!self.oPrintElm){
			      var aHeads = document.getElementsByTagName('HEAD');
			      if(!aHeads || !aHeads.length)
			        return false;
			      if(!self.oPrintElm)
			        self.oPrintElm = document.createElement('LINK');
			      	self.oPrintElm.rel = 'alternate';
			      	self.oPrintElm.media = 'print';
		      		aHeads[0].appendChild(self.oPrintElm);
			    }
			    self.oPrintElm.href = sHref;
			    self.focus();
			  	self.print();
			  	//WebBrowser.ExecWB(6,2,3);
			    return true;
		    }else{
	    		if(!self.oPrintElm){
			      var aHeads = document.getElementsByTagName('HEAD');
			      if(!aHeads || !aHeads.length)
			        return false;
			      if(!self.oPrintElm){
				        self.oPrintElm = document.createElement('LINK');
				      	self.oPrintElm.rel = 'alternate';
				      	self.oPrintElm.media = 'print';
			      		aHeads[0].appendChild(self.oPrintElm);
		      		}
			    }
			    self.oPrintElm.href = sHref;
			    self.focus();    
			  	self.print();
			    return true;
		    }
		}
	
	//在线消息推送提醒 
		function messageReminder(){
			// 建立连接，send 即web.xml中 CometServlet的<url-pattern>
			JS.Engine.start('<%=path%>/send');
			// 监听后台某个频道
			
			JS.Engine.on({
				// 对应服务端 “频道2” 的值 result2
				message : function(contents){
					if(contents != "" && contents != null){
						var messagestrarray = contents.split(",");
						if(messagestrarray!=null){
								var content = '<a href="javascript:void(0)" class="messagehref" style="font-weight: bold;text-decoration:none;color:red;" ><span>标题:'+messagestrarray[0]+'</span><span  style="float:right;color:black;" >'+messagestrarray[1]+'</span></br><span style="color:#776B6B;font-size:12px;text-indent:2em;"><p>&nbsp;&nbsp;&nbsp;&nbsp;'+messagestrarray[2]+'</p></span></a><br/>';
								showMessageBox(content);
								
						}
					}
				},
				stop : function(cause, cId, url, engine){
			      //alert('连接已断开，连接ID为：' + cId + ',断开原因：' + cause + ',断开的连接地址：'+ url+'其他：'+engine);  
			      	if(cause == '服务器异常'){
			      		//IE版本存在缺陷 不能建立长连接，所以每次的需要重新建立连接来保证程序的正常运行
			      		JS.Engine.start('<%=path%>/send');
			      	}
			    }
			});
		}
		
		//显示消息弹出框 
		function showMessageBox(content){
			
			if($("a.messagehref").length>=1){
				var messagereminder=$("a.messagehref:first");  
				messagereminder.before(content);
				return ;
			}
			
			$('#dialog').append(content);
			
			$('#dialog').dialog("open");
			
			
		}
</script>
</head>
	<body>
	    <OBJECT classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 id=WebBrowser width=0></OBJECT>
		
		<div id="container" class="cf" style="background: #4C8BC9">
		
			<div id="topDiv">
		  	<table class="toptab">
		  		<tr>
		  			<td style="width: 429px;">
		  				<img src="<%=path %>/images/top1.jpg" style="width: 100%">
		  			</td>
		  			<td style="background: url(<%=path %>/images/top2.jpg) repeat-x;"></td>
		  			<td style="background: url(<%=path %>/images/top3.jpg) no-repeat;width:547px" valign="top" >
		  				<div id="bt">
		  					<span id="tel"></span>QQ支持：3561207735 | 电话：0531-67881719 | <span id="help">帮助</span> |
		  					<a href="javascript:void(0)" id="btn_sys_logout_exit" style="color: black;">退出</a>
		  				</div>
		  			</td>
		  		</tr>
		  	</table>
		  	
		  	</div>
			<p class="slide"><a href="javascript:;" class="btn-slide active"></a></p> 
		  
		  <div id="col-main" style="background: url(<%=path %>/images/left_bottom.jpg);">
		  
		  
		  <div id="col-side">
		<div style="position: relative;z-index: 9999;">
			<div class="left"><a href="javascript:void(0)" id="btn_sys_user_info" title="点击查看个人信息"><%=user.getName() %></a></div> 
			<div style="display: none;">
	 	 		<button id="menuUp" class="ui-btn-sp">▲</button><button id="menuDown" class="ui-btn-sp">▼</button>
			</div>
		</div>
		    <ul id="nav">
		    	<li class="item">
		    		<a href="javascript:void(0);" class="report main-nav">设备信息<span class="arrow"></span></a>
		        	<div class="sub-nav-wrap cf group-nav setting-nav" style="display: none; width: 960px;" id="1136_5">
		        	<div class="nav-item div_bottom" style="height: 240px;">
		        	<div class="div_top">在用停用</div>
		        	<ul class="sub-nav" style="padding-top: 0px; height: 180px;">
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/sbxx/sbxx_list.jsp?zt=all&amp;zcstatus=1&amp;ty=1&amp;mid=1587" rel="pageTab" tabid="jcsj-zy-ty-all-List" data-right="BU_QUERY"><font color="black" class="img_font">设备总数</font></a></li>
		        	<li class="div_li"><a class="imga" href="jsp/biz/sbxx/sbxx_list.jsp?zt=all&amp;zcstatus=1&amp;mid=1147" rel="pageTab" tabid="jcsj-zy-all-List" data-right="BU_QUERY"><font color="black" class="img_font">全部在用</font></a></li>
		        	<li class="div_li"><a class="imga" href="jsp/biz/sbxx/sbxx_list.jsp?zcstatus=3&amp;mid=1148" rel="pageTab" tabid="jcsj-ty-List" data-right="BU_QUERY"><font color="black" class="img_font">全部停用</font></a></li>
		        	<li class="div_li"><a class="imga" href="jsp/biz/sbxx/sbxx_list.jsp?zt=1&amp;zcstatus=1&amp;mid=1142" rel="pageTab" tabid="jcsj-zy-hg-List" data-right="BU_QUERY"><font color="black" class="img_font">未超期设备</font></a></li>
		        	<li class="div_li"><a class="imga" href="jsp/biz/sbxx/sbxx_list.jsp?zt=2&amp;zcstatus=1&amp;mid=1143" rel="pageTab" tabid="jcsj-zy-yj-List" data-right="BU_QUERY"><font color="black" class="img_font">预警设备</font></a></li>
		        	<li class="div_li"><a class="imga" href="jsp/biz/sbxx/sbxx_list.jsp?zt=3&amp;zcstatus=1&amp;mid=1144" rel="pageTab" tabid="jcsj-zy-cq-List" data-right="BU_QUERY"><font color="black" class="img_font">超期设备</font></a></li>
		        	</ul>
		        	</div><b></b>
		        	<div class="nav-item div_bottom" style="height: 240px;"><div class="div_top">压力管道</div><ul class="sub-nav" style="padding-top: 0px; height: 180px;">
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/sbxx/sbxx_list.jsp?zt=all&amp;zcstatus=1&amp;ty=1&amp;gd=1&amp;mid=1828" rel="pageTab" tabid="jcsj-zy-ty-gd-List" data-right="BU_QUERY"><font color="black" class="img_font">压力管道</font></a></li>
		        	<li class="div_li"><a class="imga" href="jsp/biz/sbxx/sbxx_list.jsp?zt=all&amp;zcstatus=1&amp;gd=1&amp;mid=1830" rel="pageTab" tabid="jcsj-zy-all-gd-List" data-right="BU_QUERY"><font color="black" class="img_font">管道在用</font></a></li>
		        	<li class="div_li"><a class="imga" href="jsp/biz/sbxx/sbxx_list.jsp?zcstatus=3&amp;gd=1&amp;mid=1831" rel="pageTab" tabid="jcsj-ty-gd-List" data-right="BU_QUERY"><font color="black" class="img_font">管道停用</font></a></li>
		        	<li class="div_li"><a class="imga" href="jsp/biz/sbxx/sbxx_list.jsp?zt=3&amp;zcstatus=1&amp;gd=1&amp;mid=1829" rel="pageTab" tabid="jcsj-zy-cq-gd-List" data-right="BU_QUERY"><font color="black" class="img_font">管道超期</font></a></li>
		        	<li class="div_li"><a class="imga" href="jsp/biz/sbxx/sbxx_list.jsp?zcstatus=5&amp;gd=1&amp;mid=1832" rel="pageTab" tabid="jcsj-zx-gd-List" data-right="BU_QUERY"><font color="black" class="img_font">管道注销</font></a></li>
		        	</ul>
		        	</div><b></b>
		        	</div>
		      	</li>
		      	<li class="item">
		      		<a href="javascript:void(0);" class="zhucedengji main-nav">使用登记<span class="arrow"></span></a>
		        	<div class="sub-nav-wrap cf group-nav setting-nav" style="display: none; width: 120px; opacity: 1;" id="1466_4">
		        	<div class="nav-item last div_bottom" style="height: 90px;"><div class="div_top">使用登记</div>
		        	<ul class="sub-nav" style="padding-top: 0px; height: 30px;">
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/jcgl/zcdj_list.jsp" rel="pageTab" tabid="xzsb-ydj-wtj-list" data-right="BU_QUERY"><font color="black" class="img_font">使用登记</font></a>
		        	</li>
		        	</ul>
		        	</div><b></b>
		        	</div>
		      	</li>
		      	<li class="item">
		      		<a href="javascript:void(0);" class="setting main-nav">单位信息<span class="arrow"></span></a>
		        	<div class="sub-nav-wrap cf group-nav setting-nav" style="display: none; width: 120px; opacity: 1;" id="1167_5">
		        	<div class="nav-item div_bottom" style="height: 90px;">
		        	<div class="div_top">使用单位</div>
		        	<ul class="sub-nav" style="padding-top: 0px; height: 160px;">
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/utils/syUtils_list.jsp?1=1&amp;mid=1159" rel="pageTab" tabid="dwxx-sydw-List" data-right="BU_QUERY">
		        	<font color="black" class="img_font">使用单位</font>
		        	</a>
		        	</li>
		        	</ul>
		        	</div>
		        	<div class="nav-item div_bottom" style="height: 90px;">
		        	<div class="div_top">企业自查</div>
		        	<ul class="sub-nav" style="padding-top: 0px; height: 160px;">
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/utils/enterprise_inspect_list.jsp?type=1&amp;mid=115911" rel="pageTab" tabid="dwxx-inspect-List" data-right="BU_QUERY">
		        	<font color="black" class="img_font">企业自查</font>
		        	</a>
		        	</li>
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/utils/enterprise_inspect_list.jsp?type=2&amp;mid=115911" rel="pageTab" tabid="dwxx-inspectsb-List" data-right="BU_QUERY">
		        	<font color="black" class="img_font">设备自查</font>
		        	</a>
		        	</li>
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/utils/enterprise_inspect_list.jsp?type=4&amp;mid=115911" rel="pageTab" tabid="dwxx-inspectsb-List" data-right="BU_QUERY">
		        	<font color="black" class="img_font">风险管理</font>
		        	</a>
		        	</li>
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/utils/enterprise_inspect_list.jsp?type=5&amp;mid=115911" rel="pageTab" tabid="dwxx-inspectsb-List" data-right="BU_QUERY">
		        	<font color="black" class="img_font">隐患管理</font>
		        	</a>
		        	</li>
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/utils/enterprise_inspect_list.jsp?type=6&amp;mid=115911" rel="pageTab" tabid="dwxx-inspectsb-List" data-right="BU_QUERY">
		        	<font color="black" class="img_font">应急演练</font>
		        	</a>
		        	</li>
		        	
		        	</ul>
		        	</div>
		        	
		        	</div>
		      	</li>
		      	<li class="item">
		      		<a href="javascript:void(0);" class="renyuanxinxi main-nav">人员信息<span class="arrow"></span></a>
		        	<div class="sub-nav-wrap cf group-nav setting-nav" style="display: none; width: 120px; opacity: 1;" id="1167_6">
		        	<div class="nav-item last div_bottom" style="height: 90px;"><div class="div_top">作业人员</div>
		        	<ul class="sub-nav" style="padding-top: 0px; height: 30px;">
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/rygl/zuoyerenyuan_list.jsp" rel="pageTab" tabid="ryxx-zyry-ryxx-List" data-right="BU_QUERY"><font color="black" class="img_font">人员信息</font></a>
		        	</li>
		        	</ul>
		        	</div><b></b>
		        	</div>
		      	</li>
		      	<li class="item">
		      		<a href="javascript:void(0);" class="shujushenhe main-nav">数据审核<span class="arrow"></span></a>
		        	<div class="sub-nav-wrap cf group-nav setting-nav" style="display: none; width: 120px; opacity: 1;" id="1167_7">
		        	<div class="nav-item last div_bottom" style="height: 90px;"><div class="div_top">数据审核</div>
		        	<ul class="sub-nav" style="padding-top: 0px; height: 30px;">
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/sjsh/shujushenhe_list.jsp" rel="pageTab" tabid="sjsh-List" data-right="BU_QUERY"><font color="black" class="img_font">数据审核</font></a>
		        	</li>
		        	</ul>
		        	</div><b></b>
		        	</div>
		      	</li>
		      	
		      	<li class="item" id="learn">
		      		<a href="javascript:void(0);" class="peixun main-nav">全员培训<span class="arrow"></span></a>
		        	<div class="sub-nav-wrap cf group-nav setting-nav" style="display: none; width: 120px; opacity: 1;" id="1167_5">
		        	
		        	<div class="nav-item div_bottom" style="height: 90px;">
		        	<div class="div_top">企业学习</div>
		        	<ul class="sub-nav" style="padding-top: 0px; height: 160px;">
		        	<li class="div_li">
			        	<a class="imga" href="jsp/biz/utils/use_data_list.jsp?type=1" rel="pageTab" tabid="dwxx-inspect-List1" data-right="BU_QUERY">
			        		<font color="black" class="img_font">法律规章</font>
			        	</a>
		        	</li>
		        	
		        	<li class="div_li">
			        	<a class="imga" href="jsp/biz/utils/use_data_list.jsp?type=2" rel="pageTab" tabid="dwxx-inspect-List2" data-right="BU_QUERY">
			        		<font color="black" class="img_font">标准</font>
			        	</a>
		        	</li>
		        	<li class="div_li">
			        	<a class="imga" href="jsp/biz/utils/use_data_list.jsp?type=3" rel="pageTab" tabid="dwxx-inspect-List3" data-right="BU_QUERY">
			        		<font color="black" class="img_font">视频材料</font>
			        	</a>
		        	</li>
		        	<li class="div_li">
			        	<a class="imga" href="jsp/biz/utils/use_data_list.jsp?type=4" rel="pageTab" tabid="dwxx-inspect-List4" data-right="BU_QUERY">
			        		<font color="black" class="img_font">学习网站</font>
			        	</a>
		        	</li>
		        	<li class="div_li">
			        	<a class="imga" href="jsp/biz/utils/use_data_list.jsp?type=5" rel="pageTab" tabid="dwxx-inspect-List5" data-right="BU_QUERY">
			        		<font color="black" class="img_font">考题</font>
			        	</a>
		        	</li>
		        	</ul>
		        	</div>
		        	</div>
		      	</li>
		      	
		      	<li class="item" id="learn">
		      		<a href="javascript:void(0);" class="qingdan main-nav">企业责任清单<span class="arrow"></span></a>
		        	<div class="sub-nav-wrap cf group-nav setting-nav" style="display: none; width: 120px; opacity: 1;" id="1167_5">
		        	<div class="nav-item div_bottom" style="height: 90px;">
		        	<div class="div_top">责任清单</div>
		        	<ul class="sub-nav" style="padding-top: 0px; height: 160px;">
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/utils/enterprise_inspect_list.jsp?type=3&amp;mid=115911" rel="pageTab" tabid="dwxx-inspect-List" data-right="BU_QUERY">
		        		<font color="black" class="img_font">责任清单</font>
		        	</a>
		        	</li>
		        	</ul>
		        	</div>
		        	</div>
		      	</li>
		      	
		      	
		      	<c:if test="${bjstate == '1'}">
		      	<li class="item">
		      		<a href="javascript:void(0);" class="money main-nav">报检信息<span class="arrow"></span></a>
		        	<div class="sub-nav-wrap cf group-nav setting-nav" style="display: none; width: 120px; opacity: 1;" id="1167_8">
		        	<div class="nav-item last div_bottom" style="height: 90px;"><div class="div_top">报检信息</div>
		        	<ul class="sub-nav" style="padding-top: 0px; height: 30px;">
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/bjgl/sbbj/sbbj_list.jsp" rel="pageTab" tabid="sbbj-List" data-right="BU_QUERY"><font color="black" class="img_font">设备报检</font></a>
		        	</li>
		        	<li class="div_li">
		        	<a class="imga" href="jsp/biz/bjgl/sbbj/bjd_list.jsp" rel="pageTab" tabid="bjxx-List" data-right="BU_QUERY"><font color="black" class="img_font">报检状态</font></a>
		        	</li>
		        	</ul>
		        	</div><b></b>
		        	</div>
		      	</li>
		      	</c:if>
		    </ul>
		  </div>
		  
		    <div id="main-bd" >
		   	 
			<div id="mask" class="black_overlay" style="z-index: 9999">
		    </div>
		    <div id="mask_msg" class="white_content" style="z-index: 9999">
		    </div>

		      <div class="page-tab" id="page-tab">
		      </div>
		    </div>
		    
		  </div>
		</div>
		
		<div id="dialog" style="word-wrap: break-word;">
	  		<p></p>
		</div>
		
		
		<iframe id="downloadFile" height="0" width="0" src="" style="display: none;"></iframe>
		<script src="js/bs/default.js"></script>
		<script type="text/javascript">
		var chatDialog;
		var ckUserLoginId = "";
		var ckUserDataId = "";
		var ckUserName = "";
		var userid = "<%=user.getId()%>";
		var loginid = "<%=user.getLoginId()%>";
		var username = "<%=user.getName()%>";
		var xiandaima = "<%=user.getXiandaima()%>";
		
		if(loginid == 'learn'){
			$('.item').hide();
			$('#learn').show();
		}else{
			$('.item').show();
		}
		
		//判断是否可以显示质监局电话
		if(xiandaima.length > 0){
			$.post("<%=path%>/organ!getByTel.do",{code:xiandaima},
				function (data, textStatus){
					if(data.tel == undefined || data.tel == ""){
						$('#bt').addClass('wdhbt');
					}else{
						$('#tel').html('质监：'+data.tel+' | ');
						$('#bt').addClass('dhbt');
					}
			},"JSON");
		}else{
			$('#bt').addClass('wdhbt');
		}
		$('#mnubtn_index_dialog').draggable();
		$.ajaxSetup({  
		    cache: false, //close AJAX cache  
		    contentType:"application/x-www-form-urlencoded;charset=utf-8",   
		    complete:function(XHR,textStatus){     
		        var resText = XHR.responseText;  
		        if(resText=='notLogin'){     
		            location.href = location.href;
		        }
		    }   
		}); 
	
		 (function ($) {
			$.fn.extend({
			Scroll: function (opt, callback) {
				if (!opt) var opt = {};
					var _btnUp = $("#" + opt.up); //Shawphy:向上按钮
					var _btnDown = $("#" + opt.down); //Shawphy:向下按钮
					var _this = this.eq(0).find("ul:first");
					var lineH = _this.find("li:first").height(); //获取行高
					var line = opt.line ? parseInt(opt.line, 5) : parseInt(this.height() / lineH, 5); //每次滚动的行数，默认为一屏，即父容器高度
					var speed = opt.speed ? parseInt(opt.speed, 10) : 600; //卷动速度，数值越大，速度越慢（毫秒）
					var m = line; //用于计算的变量
					var count = _this.find("li").length; //总共的<li>元素的个数
					var upHeight = 2 * lineH;
				function scrollUp() {
					if (!_this.is(":animated")) { //判断元素是否正处于动画，如果不处于动画状态，则追加动画。
						if (m < count) { //判断 m 是否小于总的个数
					//	m += line;
							var toppx = $('#nav').css('marginTop');
							var liht = $("#nav").find("li:first").height();
							var lict = $("#nav").find("li[class='item']").length;
							if(Math.abs(parseInt(toppx))<parseFloat(lict/2)*liht){
								_this.animate({ marginTop: "-=" + upHeight + "px" }, speed);
							}
						}
					}
				}
				function scrollDown() {
					if (!_this.is(":animated")) {
						if (m > -10) { //判断m 是否大于一屏个数
					//	m -= line;
						var toppx = $('#nav').css('marginTop');
						if(toppx != '0px'){
							_this.animate({ marginTop: "+="+upHeight+"px" }, speed);
						}
						}
					}
				}
				_btnUp.bind("click", scrollUp);
				_btnDown.bind("click", scrollDown);
			}
			});
			})(jQuery);
		   
			$(function () {
			   $("#col-side").Scroll({ line: 10, speed: 500,up: "menuUp", down: "menuDown" });
			   $("#mask").css("height",$(document).height());     
			   $("#mask").css("width",$(document).width());    
			   $("#mask").css("left",$("#col-side").width()); 
			   $("#mask").css("top",$("#main-hd").height()+53);
			   $("#mask_msg").css("left",$(document).width()/2-$("#col-side").width()); 
			   $("#mask_msg").css("top",$(document).height()/2-53);
			   $(".btn-slide").click(function(){ 
					$("#topDiv").slideToggle("slow",function(){
						setTabHeight();
					}); 
					return false; 
				}); 
			   
  				//退出
  	  			$("#btn_sys_logout_exit").click(function(){
  	  				if(confirm('确定要退出系统吗?')){
	  	                window.location = "<%=path%>/account!logout.do"; 
  	  				}
  	  			})
  	  			//下载中心
  	  			$("#btn_sys_download").click(function(){
  	  				var url = "<%=path%>/jsp/message/download_info.jsp";
  	  				addTabsItem("tab_index_download_list","下载中心",url);
  	  			});
  				//个人信息
  				$("#btn_sys_user_info").click(function(){
  					$.dialog({
						title:'个人信息',
					    width: '550px',
					    height: '350px',
					    lock: true,
					    content: 'url:<%=path%>/user!openUserInfo.do?id=<%=user.getId()%>&adr=index'
					});
  				});
  				//发起对话窗口
  				$("#mnubtn_index_dialog").click(function(){
  					if(ckUserLoginId == ""){
  						check_user();
  					}else{
  						openChatDialog();
  					}
  				});
  				
  				$("#help").click(function(){
					var uri = "<%=basePath%>";
					uri = uri.replace("/QYSE","");
					window.open(uri+"ziliao/省局使用单位-360浏览器极速模式设置.pdf","帮助文档",null);
			   });
  				
  			
			}); 
			
			/** Event handler for mouse wheel event.
				 *鼠标滚动事件
				 */
				var wheel = function(event) {
					var delta = 0;
					if (!event) /* For IE. */
						event = window.event;
					if (event.wheelDelta) { /* IE/Opera. */
						delta = event.wheelDelta / 120;
					} else if (event.detail) {
						delta = -event.detail / 3;
					}
					if (delta)
						handle(delta);
					if (event.preventDefault)
						event.preventDefault();
					event.returnValue = false;
				}
				if (window.addEventListener) {
					window.addEventListener('DOMMouseScroll', wheel, false);
				}
				window.onmousewheel = document.onmousewheel = wheel;
		
				var handle = function(delta) {
					var random_num = Math.floor((Math.random() * 100) + 50);
					if (delta < 0) {
						$("#menuUp").click();
						return;
					} else {
						$("#menuDown").click();
						return;
					}
				}
		//添加tabs
		function addTabsItem(tabid,text,url){
			tab.addTabItem({tabid: tabid, text: text, url: url, showClose: true});
		}
		//获取选中id
		function getSelectTabsItemId(){
			return tab.getSelectedTabItemID();
		}
		//关闭指定tabs
		function closeTabsItemId(tabid){
			if(tab.isTabItemExist(tabid)){
				tab.removeTabItem(tabid);
			}
		}
		//刷新所有基础数据grid
		function reloadJcsjGrid(){
			$(".l-tab-content iframe").each(function(i){
				var id = $(this).attr("id");
				if(id.indexOf("jcsj-")>=0 || id.indexOf("dbsx-db-list")>=0){
					document.getElementById(id).contentWindow.reloadGrid();
				}
			});
		}
		//兼容火狐、IE8   
    //显示遮罩层    
    function showMask(text){ 
	   document.getElementById("mask_msg").style.display='block';
	   document.getElementById("mask").style.display='block' ;
	   text = text == undefined ? '正在处理......' : text;
	   $("#mask_msg").html('<img src="<%=path %>/js/plugin/skins/icons/loading.gif">'+text);
    }  
    //隐藏遮罩层  
    function hideMask(){     
        $("#mask").hide();  
        $("#mask_msg").hide(); 
    } 
		//下载
		function downloadFile(path){
			var url = '<%=path%>/upload!downloadFile.do';
			var html = '<form action="'+url+'" method="post" id="file_down_form">'+
                 '<input id="file_path" name="path" type="hidden" value=""/>'+
                '</form>';
			document.getElementById('downloadFile').innerHTML = "";
			document.getElementById('downloadFile').contentWindow.document.write(html);
			document.getElementById('downloadFile').contentWindow.document.getElementById('file_path').value=path;
			document.getElementById('downloadFile').contentWindow.document.getElementById('file_down_form').submit();
		}
		function openMsg(){
			chatDialog = $.dialog({
				title:'对话',
				width: '650px',
				height: '450px',
		//		lock: true,
				init:function(){
					this.hide();
				},
				close:function(){
					this.hide();
					return false;
				},
				content: 'url:http:\/\/192.168.1.136:3000/SDJC_CHAT/'
			});
		}
		function getUserInfo(){
			return {loginid:loginid,username:username,dataid:userid};
		}
		function openChatDialog(){
			chatDialog.show();
		}
		function check_user(){
			$.dialog({
				title:'选择人员',
				width: '350px',
				height: '450px',
				lock: true,
				content: 'url:<%=path%>/jsp/common/check_user.jsp'
			});
		}
		var timer = window.setInterval(function(){
			  if((new Date().getTime() - sessionStorage.getItem("maxtime")) >= 24*60*1000 && 
					  (new Date().getTime() - sessionStorage.getItem("maxtime")) <= (24*60*1000+10000 )){
				  $.dialog.confirm("请保存信息，否则已填写内容将无法保存（5分钟后页面失效）。", function(){
					  $.ajax({
					        type: "post",
					        async: false, //同步执行
					        url: '<%=path%>/userList!userOnLineNums.do',
					        dataType: "json", //返回数据形式为json
					        success: function(data){
					        	sessionStorage.setItem("maxtime", new Date().getTime());
					        }
					    });
			       });
			  }
			  
		  },1000*10)
		
		 
		 /*
		  * 提示信息
		  */
		 function dialogInfo(){
			
			var msg = "";
			if('${shidaima}' == '3701'){
			     msg = $.dialog({
					    id: 'msg',
					    title: '消息通知',
					    content: "<div style='width:290px;height:240px;font-size:18px;font-family:Microsoft YaHei;'>&nbsp;&nbsp;&nbsp;授权书提交申请机关为\"济南市市场监督管理局\"</div>",
					    width: 300,
					    height: 250,
					    left: '100%',
					    top: '100%',
					    fixed: true,
					    drag: false,
					    resize: false
					});
			}else if('${bjstate}' == '1'){
				 msg = $.dialog({
					    id: 'msg',
					    title: '消息通知',
					    content: "<div style='width:290px;height:240px;font-size:18px;font-family:Microsoft YaHei;'>&nbsp;&nbsp;&nbsp;请及时查看您的报检申请是否已受理。显示【审核通过】表明已受理，其他情况请按提示操作</div>",
					    width: 300,
					    height: 250,
					    left: '100%',
					    top: '100%',
					    fixed: true,
					    drag: false,
					    resize: false
					});
			}
		
		}
		
		//验证密码是否符合
		function isPassword(pass){
			//字母+数字，字母+特殊字符，数字+特殊字符
			
			var reg = new RegExp('(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,30}');
		    var result=reg.test(pass);
		    if(result==false){
		        alert("密码由字母+数字+特殊字符 （!@#），8-30位组成！");
		        return false;
		    }
		    return true;
		}
		
		if(!isPassword("<%=user.getPassword()%>")){
			$.dialog({
				title:'修改登录密码',
			    width: '350px',
			    height: '200px',
			    lock: true,
			    // 关闭功能：返回true可关闭，返回false禁止关闭
			    close: function() { return false; },
			    content: 'url:<%=path%>/jsp/sys/userManager_editUser_editUserPass.jsp?id=<%=user.getId()%>'
			});
		}
		
		
		localStorage.setItem('userid','<%=user.getId()%>');
		 window.addEventListener('storage', res => {
		      if (res.key === 'userid') {
		    	  window.location = "<%=path%>/account!logout.do"; 
		      }
		    })
	</script> 
</body>
</html>