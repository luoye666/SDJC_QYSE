/**
 * 
 * JavaScript函数封装 
 * 提供对项目当中前端页面通用功能的函数进行封装 
 * 调用方法：$STONE.XXX()
 * @author foo
 */
var $STONE = {
	getCheckGridIds:function(gridid){
		return $("#"+gridid).jqGrid('getGridParam', 'selarrrow');
	},
	getCheckGridRow:function(gridid,id){
		return $("#"+gridid).jqGrid("getRowData",id);
	},
	getGridRows:function(gridid){
		return $("#"+gridid).jqGrid('getRowData');
	},
	formSerialized:function(formSelector){
		return $(formSelector).serializeArray();
	},
	formSerializedToJSON:function(formSelector){
		var elements = $STONE.formSerialized(formSelector);
		var length = elements.length;
		var json = "{";
		$.each(elements,function(i,v){
			json += "\""+v.name+"\"" + ":" + "\""+v.value+"\"";
			if((length-1) != i){
				json += ",";
			}
		});
		json += "}";
		return $.parseJSON(json);
	},
	sc_formSerializedToJSON:function(formSelector){
		var params = $STONE.formSerializedToJSON(formSelector);
		var sc_JSON = {sc_params:JSON.stringify(params)};
		return sc_JSON;
	},
	formClear:function(formSelector){
		$(":input",formSelector).not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").removeAttr("selected");
		$(".combo-value").val("");
	},
	sc_setGridQueryParams:function(gridSelector,params){
		 $(gridSelector).jqGrid('setGridParam',{ 
     //       url:path+"/apprizesList!getListForXzsb.do?state="+state+"&zfstate="+zfstate, 
            postData:params, //发送数据 
            page:1 
        }).trigger("reloadGrid");
	},
	gridClear:function(gridSelector){
		var item = $(gridSelector).datagrid('getRows');
        if(item){
            for (var i = item.length - 1; i >= 0; i--) {
                var index = $(gridSelector).datagrid('getRowIndex', item[i]);
                $(gridSelector).datagrid('deleteRow', index);
            }
        }
	},
	gridClearChecked:function(gridSelector){
		var item = $(gridSelector).datagrid('getChecked');
        if(item){
            for (var i = item.length - 1; i >= 0; i--) {
                var index = $(gridSelector).datagrid('getRowIndex', item[i]);
                $(gridSelector).datagrid('deleteRow', index);
            }
        }
	},
	treeCheckedAll:function(treeSelector){
		var roots = $(treeSelector).tree("getRoots");
		$.each(roots,function(rootIndex,root){
			$(treeSelector).tree('update', {target: root.target,checked:true});
			var children = $(treeSelector).tree("getChildren",root.target);
			$.each(children,function(childIndex,child){
				$(treeSelector).tree('update', {target: child.target,checked:true});
			});
		});
	},
	treeUnCheckedAll:function(treeSelector){
		var roots = $(treeSelector).tree("getRoots");
		$.each(roots,function(rootIndex,root){
			$(treeSelector).tree('update', {target: root.target,checked:false});
			var children = $(treeSelector).tree("getChildren",root.target);
			$.each(children,function(childIndex,child){
				$(treeSelector).tree('update', {target: child.target,checked:false});
			});
		});
	},
	//使window.open弹出的窗口居中
	openwindow:function(urlstr,bglx,types,name,basePath,iWidth,iHeight){
//	    urlstr=urlstr.replace(/&/g, "%26");
		 var urlpath;
		if(types == "ysjl" ){
			urlpath =basePath+"jsp/biz/bggl/2000/PrintPage.html?urls="+urlstr+"bglx="+types;
		}else{
			urlpath =basePath+"jsp/biz/bggl/2000/PrintPage.html?urls="+urlstr+"bglx="+bglx;
		}
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		var printWindow=window.open("","批量打印",'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
		
		setTimeout(function(){
			printWindow.location=urlpath;
		}, 600);
		
	},
	//让图片按等比例自动缩放
	DrawImage:function(ImgD,FitWidth,FitHeight){
		var image=new Image(); 
		image.src=ImgD.src; 
		if(image.width>0 && image.height>0){ 
			if(image.width/image.height>= FitWidth/FitHeight){ 
				if(image.width>FitWidth){ 
					ImgD.width=FitWidth; 
					ImgD.height=(image.height*FitWidth)/image.width; 
				}else{ 
					ImgD.width=image.width; 
					ImgD.height=image.height; 
				} 
			}else{ 
				if(image.height>FitHeight){ 
					ImgD.height=FitHeight; 
					ImgD.width=(image.width*FitHeight)/image.height; 
				} 
				else{ 
					ImgD.width=image.width; 
					ImgD.height=image.height; 
				}
			} 
		} 
	},
	//上、下标转换
	sxbzh:function(type,div_id,div_value){
		var element = document.getElementById(div_id);
	    var range = document.selection.createRange();
	    var htmlText = range.htmlText;
	    if("" == htmlText){
			$.messager.alert('友情提示','请选择内容!');
			return false;
	    }
	    var stored_range = range.duplicate();
	    stored_range.moveToElementText( element );
	    stored_range.setEndPoint( 'EndToEnd', range );
	    element.selectionStart = stored_range.htmlText.length - range.htmlText.length;
	    element.selectionEnd = element.selectionStart + range.htmlText.length;
	    var div_html = $("#"+div_id).html();
	    var text = range.text;
	    div_html = div_html.replace(htmlText,"");
	    var txtBefore = div_value.substring(0,element.selectionStart);
	    var txtAfter = div_value.substring(element.selectionEnd);
	    if("sb" == type){
		    if(htmlText.indexOf("<SUP>") == 0){
		    	return false;
		    }else if(htmlText.indexOf("<SUB>") == 0){
		    	htmlText = htmlText.replace(eval("/SUB/gi"),"SUP");
	    		$("#"+div_id).html(txtBefore+htmlText+txtAfter);
		    }else{
	    		$("#"+div_id).html(txtBefore+"<SUP>"+htmlText+"</SUP>"+txtAfter);
		    }
	    }else if("xb" == type){
		    if(htmlText.indexOf("<SUB>") == 0){
		    	return false;
		    }else if(htmlText.indexOf("<SUP>") == 0){
		    	htmlText = htmlText.replace(eval("/SUP/gi"),"SUB");
	    		$("#"+div_id).html(txtBefore+htmlText+txtAfter);
		    }else{
	    		$("#"+div_id).html(txtBefore+"<SUB>"+htmlText+"</SUB>"+txtAfter);
		    }
	    }else if("qc" == type){
	    	$("#"+div_id).html(txtBefore+text+txtAfter);
	    }
	    div_value = $("#"+div_id).html();
	    $("#"+div_id+"_input").attr("value",div_value);
	},
	//使window.open弹出的窗口居中
	openwindowgl:function(urlstr,sezl,bglx,types,name,basePath,iWidth,iHeight){
//	    urlstr=urlstr.replace(/&/g, "%26");
		 var urlpath;
		if(types == "glysjl" ){//锅炉制造监检原始记录打印
			urlpath =basePath+"jsp/biz/print/PrintPage.html?urls="+urlstr+"bglx="+types;
		}else{//锅炉制造监检的报告打印
			urlpath =basePath+"jsp/biz/print/PrintPage.html?urls="+urlstr+"bglx="+types;
		}
	 
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		var printWindow=window.open("","批量打印",'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
		
		setTimeout(function(){
			printWindow.location=urlpath;
		}, 600);
		
	},
	/**
	 * 创建select级联下拉框
	 * @param  selectId  控件ID   可多个，用,隔开
	 * @param  options   option JSON数据  
	 * @param  height  控件高度   单位:px
	 * @param  ld    是否带有级联功能  true 有  false 无
	 * @param  path  项目根路径
	 */
	creatSelectMenu:function(selectId,options,height,ld,path,type){
		var selectIdArr = selectId.split(",");
		for(var i = 0;i<selectIdArr.length;i++){
			$("#"+selectIdArr[i]).selectmenu();
		}
		var select = $("#"+selectIdArr[0]);
		var sltValue = select.attr("sltValue");
		//因selectMenu插件本身存在问题，必须得把控件重新添加，才能做级联
		select.empty();
		select.css("display","inline");
		$("#"+selectIdArr[0]+"-button").remove();
		var selectHtml = $("#"+selectIdArr[0]+"_div").html();
		$("#"+selectIdArr[0]+"_div").html(selectHtml);
		select = $("#"+selectIdArr[0]);
		select.append("<option value = ''></option>"); 
		for(var i in options){
			if(isNaN(i)){
				break;
			}
			if(sltValue == options[i].code){
				select.append("<option value = '"+options[i].code+"' selected = 'selected'>"+options[i].name+"</option>"); 
			}else{
				if(options.length == 1){//只有一个时，默认
					select.append("<option value = '"+options[i].code+"' selected = 'selected'>"+options[i].name+"</option>");
				}else{
					select.append("<option value = '"+options[i].code+"'>"+options[i].name+"</option>"); 
				}
			}
		}
		select.selectmenu().selectmenu("menuWidget").css("height",height);
		if(ld){
			select.selectmenu({
				change:function(){
					$STONE.creatChildSelectMenu(selectId,selectIdArr[0],select.val(),height,path,type);
	    		}
			})
			if(undefined != sltValue){
				$STONE.creatChildSelectMenu(selectId,selectIdArr[0],select.val(),height,path,type);
			}else if(options.length == 1){
				$STONE.creatChildSelectMenu(selectId,selectIdArr[0],select.val(),height,path,type);
			}
		}
	},
	//获取下级下拉框，重复调用
	creatChildSelectMenu:function(selectId,selectIdArrVal,selectVal,height,path,type){
			selectId = selectId.replace(selectIdArrVal+",","");
			$.post(path+"/dicList!getDataListByParentCodeForDic.do",{code:selectVal,type:type},
				function (data, textStatus){
					$STONE.creatSelectMenu(selectId,data.dicDatas,height,selectId.split(",").length>1 ? true : false,path,type);
			},"JSON");
	},
	/**
	 * 创建select级联下拉框
	 * @param  selectId  控件ID   可多个，用,隔开
	 * @param  options   option JSON数据  
	 * @param  height  控件高度   单位:px
	 * @param  ld    是否带有级联功能  true 有  false 无
	 * @param  path  项目根路径
	 */
	creatSelectMenuByOrgan:function(selectId,options,height,ld,path){
		var selectIdArr = selectId.split(",");
		for(var i in selectIdArr){
			$("#"+selectIdArr[i]).selectmenu();
		}
		var select = $("#"+selectIdArr[0]);
		var sltValue = select.attr("sltValue");
		//因selectMenu插件本身存在问题，必须得把控件重新添加，才能做级联
		select.empty();
		select.css("display","inline");
		$("#"+selectIdArr[0]+"-button").remove();
		var selectHtml = $("#"+selectIdArr[0]+"_div").html();
		$("#"+selectIdArr[0]+"_div").html(selectHtml);
		select = $("#"+selectIdArr[0]);
		select.append("<option value = ''></option>"); 
		for(var i in options){
			if(isNaN(i)){
				break;
			}
			if(sltValue == options[i].name){
				select.append("<option value = '"+options[i].name+"' selected = 'selected'>"+options[i].name+"</option>"); 
			}else{
				select.append("<option value = '"+options[i].name+"'>"+options[i].name+"</option>"); 
			}
		}
		select.selectmenu().selectmenu("menuWidget").css("height",height);
		if(ld){
			select.selectmenu({
				change:function(){
					$STONE.creatChildSelectMenuByOrgan(selectId,selectIdArr[0],select.val(),height,path);
	    		}
			})
			if(undefined != sltValue){
				$STONE.creatChildSelectMenuByOrgan(selectId,selectIdArr[0],select.val(),height,path);
			}
		}
	},
	//获取下级下拉框，重复调用
	creatChildSelectMenuByOrgan:function(selectId,selectIdArrVal,selectVal,height,path){
			selectId = selectId.replace(selectIdArrVal+",","");
			$.post(path+"/organList!getOrganListByParentName.do",{name:selectVal},
				function (data, textStatus){
					$STONE.creatSelectMenuByOrgan(selectId,data.datas,height,selectId.split(",").length>1 ? true : false);
			},"JSON");
	},
	/**
	 * 创建设备类别select级联下拉框
	 * @param  selectId  控件ID   可多个，用,隔开
	 * @param  options   option JSON数据  
	 * @param  height  控件高度   单位:px
	 * @param  ld    是否带有级联功能  true 有  false 无
	 * @param  path  项目根路径
	 */
	creatSelectMenuBySeType:function(selectId,options,height,ld,path){
		var selectIdArr = selectId.split(",");
		for(var i =0;i<selectIdArr.length;i++){
			$("#"+selectIdArr[i]).selectmenu();
		}
		var select = $("#"+selectIdArr[0]);
		var sltValue = select.attr("sltValue");
		//因selectMenu插件本身存在问题，必须得把控件重新添加，才能做级联
		select.empty();
		select.css("display","inline");
		$("#"+selectIdArr[0]+"-button").remove();
		var selectHtml = $("#"+selectIdArr[0]+"_div").html();
		$("#"+selectIdArr[0]+"_div").html(selectHtml);
		select = $("#"+selectIdArr[0]);
		select.append("<option value = ''></option>"); 
		for(var i in options){
			if(isNaN(i)){
				break;
			}
			if(sltValue == options[i].daima){
				select.append("<option value = '"+options[i].daima+"' selected = 'selected'>"+options[i].mingcheng+"</option>"); 
			}else{
				select.append("<option value = '"+options[i].daima+"'>"+options[i].mingcheng+"</option>"); 
			}
		}
		select.selectmenu().selectmenu("menuWidget").css("height",height);
		if(ld){
			select.selectmenu({
				change:function(){
					$STONE.creatChildSelectMenuBySeType(selectId,selectIdArr[0],select.val(),height,path);
	    		}
			});
			if(undefined != sltValue){
				$STONE.creatChildSelectMenuBySeType(selectId,selectIdArr[0],select.val(),height,path);
			}
		}
	},
	//获取下级下拉框，重复调用
	creatChildSelectMenuBySeType:function(selectId,selectIdArrVal,selectVal,height,path){
			selectId = selectId.replace(selectIdArrVal+",","");
			$.post(path+"/dirList!getDataListByParentCodeForSe.do",{code:selectVal},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType(selectId,data.dirDatas,height,selectId.split(",").length>1 ? true : false);
			},"JSON");
	},
	//在待办事项中打开的信息，判断哪些数据正在修改中
	verifyUpdValue:function(selected){	//input
		$(selected).each(function(){
			var value = $(this).attr("value");
			var valueOld = $(this).attr("oldValue");
			if(value != valueOld){
				$(this).css("background","#FFE4C4");
			}
		});
	},
	verifyUpdSltValue:function(selected){	//select
		$(selected).each(function(){
			var value = $(this).attr("sltValue");
			var valueOld = $(this).attr("oldValue");
			var id = $(this).attr("id");
			if(value != valueOld){
				$("#"+id+"-button").css("background","#FFE4C4");
			}
		});
	},
	setInpSelBySydw:function(path,formId,type){//使用单位账号只能修改特定信息
				$.post(path+"/user!getEditSeField.do",{nameen:"SDSYDW"},
					function (data, textStatus){
						$("#"+formId+" input").each(function(){
							var iname = $(this).attr("name");
							if(iname != undefined){
								if(data.esf.indexOf(iname.replace(type,""))<0){
									$(this).attr("readonly","true");
									$(this).attr("onclick","");
									$(this).css("background-color","#E0E0E0");
								}
							}
						});
						setSel = setInterval(function(){
							$("#"+formId+" select").each(function(){
								var id = $(this).attr("id");
								$("#"+id+"-menu").css("display","none");
							});
						},2000);
						setTimeout("window.clearInterval(setSel)",10000);
				},"JSON");
	},
	inpFoucs:function(){
		$("input[required=required]").each(function(){
			var value = $(this).val();
			if(value.length <= 0){
				$(this).focus();
				$(this).blur();
			}
		});
	},
	getNowFormatDate:function(){
		 //获取当前日期
		 var date_time = new Date();
		 //定义星期
		 var week;
		 //switch判断
		 switch (date_time.getDay()){
			 case 1: week="星期一"; break;
			 case 2: week="星期二"; break;
			 case 3: week="星期三"; break;
			 case 4: week="星期四"; break;
			 case 5: week="星期五"; break;
			 case 6: week="星期六"; break;
			 default:week="星期天"; break;
		 }
		 
		 //年
		 var year = date_time.getFullYear();
		 	//判断小于10，前面补0
		   if(year<10){
		 	year="0"+year;
		 }
		 
		 //月
		 var month = date_time.getMonth()+1;
		 	//判断小于10，前面补0
		  if(month<10){
			 month="0"+month;
		 }
		 
		 //日
		 var day = date_time.getDate();
		 	//判断小于10，前面补0
		   if(day<10){
		 	day="0"+day;
		 }
		 
		 //时
		 var hours =date_time.getHours();
		 	//判断小于10，前面补0
		    if(hours<10){
		 	hours="0"+hours;
		 }
		 
		 //分
		 var minutes =date_time.getMinutes();
		 	//判断小于10，前面补0
		    if(minutes<10){
		 	minutes="0"+minutes;
		 }
		 
		 //秒
		 var seconds=date_time.getSeconds();
		 	//判断小于10，前面补0
		    if(seconds<10){
		 	seconds="0"+seconds;
		 }
		 
		 //拼接年月日时分秒
		 var date_str = year+"年"+month+"月"+day+"日 "+hours+":"+minutes+":"+seconds;
		 
		//显示在id为showtimes的容器里
 		document.getElementById("showtimes").innerHTML= date_str;
		
	}
	
}
$.ajaxSetup({  
		    cache: false,
		    contentType:"application/x-www-form-urlencoded;charset=utf-8",   
		    complete:function(XHR,textStatus){     
		        var resText = XHR.responseText;  
		        if(resText=='notLogin'){     
		        	alert("请重新登录！");
		            parent.location.href = parent.location.href;
		        }        
		    }   
		});


