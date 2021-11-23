<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
%>
<!doctype html>
<html>
<head>

<jsp:include page="/jsp/common/include.jsp"></jsp:include>
</head>
<body>
	<div id="main" style="width: 100%;min-height: 550px"></div>
</body>
</html>
	<!-- 脚本 -->
<script type="text/javascript">
	$("#main").css("height",$(window).height()+"px");
	var myChart = echarts.init(document.getElementById('main'));
	$().ready(function(){
		// 基于准备好的dom，初始化echarts实例
		myChart.showLoading({text:"正在加载画像..."});
		$.post("<%=path%>/se!getHuaXiang.do",{id:"${param.id}"},function(data){
			myChart.hideLoading();
			createHx(data);
		},"json");
	})
	
	function createHx(data){
	    option = {
	        title: {
	            text: '特种设备画像',
	            subtext: '',
	            top: 'bottom',
	            left: 'right'
	        },
	        color:['#c23531','#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3'],
	        tooltip: {
	        	trigger: 'item',
		        formatter: '{b}'
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            restore : {show: true},
		            magicType: {show: false, type: ['force', 'chord']},
		            saveAsImage : {show: true}
		        }
		    },
<%--	        legend: [{--%>
<%--	            // selectedMode: 'single',--%>
<%--	            data: categories.map(function (a) {--%>
<%--	                return a.name;--%>
<%--	            })--%>
<%--	        }],--%>
	        legend: {
		        x: 'left',
		        orient:'vertical',
		        data:data.legend
		    },
	        animation: false,
	        series : [
	            {
	                name: '',
	                type: 'graph',
	                layout: 'force',
	                data: data.nodes,
	                links: data.links,
	                categories: data.categories,
	                roam: true,
	                force: {
	                    repulsion: 300,
	                    edgeLength:60
	                },
	                focusNodeAdjacency:true,
		            ribbonType: false
	            }
	        ]
	    };

	    myChart.setOption(option);
	    
	    myChart.on('click', function (params) {
	    	if(params.data.category == 2){
	    		if(params.data.url == ""){
	    			return false;
	    		}
	    		$.dialog({
					title:params.data.name,
				    width: '900px',
				    height: '450px',
				    min:true,
				    max:true,
				    cache:false,
				    autoOpen: false,
				    content: 'url:'+params.data.url
				});
	    	}
	    });
	}
</script>