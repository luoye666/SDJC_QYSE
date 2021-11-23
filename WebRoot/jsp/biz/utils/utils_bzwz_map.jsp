<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
	
	<title>单位标注位置</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="http://www.sdmap.gov.cn/api/javascript/js/esri/css/esri.css" />
    <script type="text/javascript" src="http://www.sdmap.gov.cn/api/javascript/js/init.js"></script>
	<jsp:include page="/jsp/common/include.jsp"></jsp:include>
	
<script type="text/javascript">
        //定义地图对象
        var map;
        var wmsLayer;
		var graphic;
    	var attr = { "null": "" };
        var lod1 = [
				{ "level": 1, "resolution": 0.703125000000119, "scale": 295497593.0588 },
                { "level": 2, "resolution": 0.351562500000059, "scale": 147748796.5294 },
                { "level": 3, "resolution": 0.17578125000003, "scale": 73874398.2647 },
                { "level": 4, "resolution": 0.0878906250000148, "scale": 36937199.1323 },
                { "level": 5, "resolution": 0.0439453125000074, "scale": 18468599.566175 },
                { "level": 6, "resolution": 0.0219726562500037, "scale": 9234299.7830875 },
                { "level": 7, "resolution": 0.0109863281250019, "scale": 4617149.89154375 },
                { "level": 8, "resolution": 0.00549316406250093, "scale": 2308574.94577187 },
                { "level": 9, "resolution": 0.00274658203125046, "scale": 1154287.47288594 },
                { "level": 10, "resolution": 0.00137329101562523, "scale": 577143.736442969 },
                { "level": 11, "resolution": 0.000686645507812616, "scale": 288571.868221484 },
                { "level": 12, "resolution": 0.000343322753906308, "scale": 144285.934110742 },
                { "level": 13, "resolution": 0.000171661376953154, "scale": 72223.960000000006 },
                { "level": 14, "resolution": 8.5830688476577E-05, "scale": 36071.4835276855 },
                { "level": 15, "resolution": 4.29153442382885E-05, "scale": 18035.7417638428 },
				{ "level": 16, "resolution": 2.14576721191443E-05, "scale": 9017.87088192139 },
				{ "level": 17, "resolution": 1.07288360595721E-05, "scale": 4508.93544096069 },
				{ "level": 18, "resolution": 5.36441802978606E-06, "scale": 2254.46772048035 }
            ];



        //引入天地图山东矢量图层
        require(["esri/map",
                "tdlib/SDTDTLayer",
                "esri/geometry/Extent",
                "esri/layers/WMSLayer",
                "esri/geometry/Point",
                "esri/geometry/Circle",
                "esri/SpatialReference",
                "esri/symbols/SimpleLineSymbol",
                "esri/symbols/SimpleFillSymbol",
                "esri/symbols/PictureMarkerSymbol",
                "esri/symbols/TextSymbol",
                "esri/symbols/Font",
                "esri/config",
                "esri/graphic", "dojo/domReady!"],
                function (Map, SDTDTLayer, Extent, WMSLayer, Point, Circle, SpatialReference, SimpleLineSymbol, SimpleFillSymbol, PictureMarkerSymbol, TextSymbol, Font, esriConfig, Graphic) {
                    //地图初始化 
                    map = new Map("mapDiv",
                    {
                        logo: false,
                        lods: lod1,
                        slider: false,
                        nav: false,
                        extent: new Extent({ xmin: 116.5, ymin: 36.2, xmax: 117.5, ymax: 37.2, spatialReference: { wkid: 4490} })
                    });

                    //图层初始化 
                    var sdvecLayer = new SDTDTLayer();
                    //添加图层到地图 
                    map.addLayer(sdvecLayer);
                    //增加区域范围显示
                    var layer = new esri.layers.WMSLayerInfo({ name: "s", title: "山东行政区划地图" });
                    var resourceInfo = {
                        extent: new esri.geometry.Extent(118.211027, 37.261129, 118.972056, 37.536511, { wkid: 4326 }),
                        layerInfos: [layer]
                    };
                    wmsLayer = new esri.layers.WMSLayer("http://124.128.48.217:6080/arcgis/services/sdxzj/MapServer/WMSServer",
                    {
                        "opacity": 0.8,
                        resourceInfo: resourceInfo, visibleLayers: ["2"]
                    });
					map.addLayers([wmsLayer]);
                    //设置中心点和缩放级别
			        var point = new esri.geometry.Point(117.90,36.44, new SpatialReference({ wkid: 4490 }));
			        map.graphics.clear();
			        map.centerAndZoom(point, 7);
	                $.post("<%=path%>/syUtils!getZuobiao.do?id=${param.dwid}",{},
		        		function (data, textStatus){
	                		if(data.jingdu != ""){
	                			var dingweiBtn = '<input id="dw" type="button" onClick = "area('+data.jingdu+','+data.weidu+','+data.sfjb+')" value="定位"';
	                			$(".left").append(dingweiBtn);
	                			$("#dw").trigger("click");
	                			if(data.sfmd == "true"){
									var point = new Point(data.jingdu,data.weidu, new SpatialReference({ wkid: 4490 }));
									var pictureMarkerSymbol = new PictureMarkerSymbol('../dzdt/icons/map_pin.png', 32, 32);
									var graphic = new Graphic(point, pictureMarkerSymbol);
									map.graphics.add(graphic);
	                			}
	                		}
		        	},"JSON");
	                //标点
			        map.on("click", addPoint);
			        function addPoint(evt) {
			        	map.graphics.clear();
			            map.infoWindow.setTitle("标注位置");
			            map.infoWindow.resize(100,50);
			            map.infoWindow.setContent(
			  //            "经度：" + evt.mapPoint.x + "<br/>纬度：" + evt.mapPoint.y +
			  //            "<br/>屏幕坐标 : " + evt.screenPoint.x + ", " + evt.screenPoint.y+"<br/>"+
			              "<a style='text-decoration:none;' onClick='saveBz("+evt.mapPoint.x+","+evt.mapPoint.y+")' class='ui-btn ui-btn-sp'>保存标注</a>"
			            );
						var point = new Point(evt.mapPoint.x,evt.mapPoint.y, new SpatialReference({ wkid: 4490 }));
						var pictureMarkerSymbol = new PictureMarkerSymbol('../dzdt/icons/map_pin.png', 32, 32);
						var graphic = new Graphic(point, pictureMarkerSymbol);
						map.graphics.add(graphic);
			            map.infoWindow.show(evt.mapPoint, map.getInfoWindowAnchor(evt.screenPoint));
			        }
	                
                });
        
	    //定位到指定地区
	    function area(jingdu,weidu,sfjb){
	    	if(jingdu == "0"){
	    		return false;
	    	}
		    var point = new esri.geometry.Point(jingdu,weidu, map.spatialReference);
		    map.centerAndZoom(point, sfjb);
	    }
	    //保存
	    function saveBz(jingdu,weidu){
			parent.showMask("正在保存......");
	    	$.post("<%=path%>/syUtils!saveBz.do?id=${param.dwid}",{jingdu:jingdu,weidu:weidu},
		        function (data, textStatus){
					parent.hideMask();
	                if(data.success){
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
						map.infoWindow.hide();
	                }
			},"JSON");
	    }
    </script>
    <style type="text/css">
        .main
        {
            width: 100%;
            height: 100%;
            padding:  0 0 0 0px;
            margin: 0 0 0 0px;
        }
     
        .left
        {
            width: 100px;
            z-index: 9999;
            float: right;
            display: none;
        }
    </style>
</head>
<body>
	<div class="main">
    <div class="left">
      </div>
      <div id="mapDiv" class="content">
      </div>
    </div>
</body>
<script type="text/javascript">
    //定义地图标志
 //   var icon_star = new esri.symbol.PictureMarkerSymbol("icons/icon_star_32.png", 32, 32);
    $().ready(function(){
		$("#mapDiv").css("height",$(document).height()+"px");
		$("#main").css("width",$(document).width()+"px");
     });
</script>
</html>