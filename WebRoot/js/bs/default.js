$(function(){
	$('#companyName').text(SYSTEM.companyName);
});
setTabHeight();
$(window).bind('resize',function(){
	setTabHeight();
});

function setTabHeight(){
	var winHeight = $(window).height();
	var tab = $('#main-bd');
	var h = winHeight - tab.offset().top;
	tab.height(h);
	$('#page-tab').height(h);
};

(function($){
	var navLi = $('#nav > li');
	$.each(navLi,function(){
		var subNav = $(this).find('.sub-nav-wrap');
		$(this).bind('mouseover',function(){
			$(this).addClass('on');
			subNav.stop(true,true).fadeIn(250,function(){
				var os = subNav.offset();
				if(os.top<=50){//菜单被遮挡
					subNav.addClass("top30");
				}else{
					subNav.removeClass("top30");
					os = subNav.offset();
					if(os.top<=50){//菜单被遮挡
						subNav.addClass("top30");
					}
				}
			});
		}).bind('mouseleave',function(){
			$(this).removeClass('on');
			subNav.stop(true,true).fadeOut(250);
		});
		if(subNav.length == 0){return ;}
		if(subNav.css('top') == 'auto' && subNav.css('bottom') == 'auto'){
			var top = ($(this).outerHeight() - subNav.outerHeight()) / 2;
			subNav.css({top : top});
		}
/*			//定义子菜单的长度与其内部元素的样式*/
		var _sumWidth = 0;
		var _hasSubDiv = false;
		subNav.children('div').each(function(i,e){
			_sumWidth += $(e).width() + 1;
			$(this).removeClass('last');
			_hasSubDiv = true;
		})
		subNav.find('div:last').addClass('last');
		_hasSubDiv && subNav.width(_sumWidth-1);
	});
	
	$('.sub-nav-wrap a').bind('click',function(){
		$(this).parents('.sub-nav-wrap').hide();
	});
	
	//$('#nav a').bind('click',function(){
		//$('#nav .item').removeClass('current');
		//$(this).parents('#nav .item').addClass('current');
	//});
})(jQuery);

$('#page-tab').ligerTab({ 
	height: '100%', 
	changeHeightOnResize : true,
	onBeforeAddTabItem : function(tabid){
		setCurrentNav(tabid);
	},
	onAfterAddTabItem : function(tabid){
		
	},
	onAfterSelectTabItem : function(tabid){
		setCurrentNav(tabid);
	},
	onBeforeRemoveTabItem : function(tabid){
		//if(confirm('要关闭吗')){
			//return true;
		//} else{
			//return false;
		//}
	},
	onAfterLeaveTabItem: function(tabid){
		
	}
});

function setCurrentNav(tabid){
	if(!tabid){return ;}
	var pre = tabid.match((/([a-zA-Z]+)[-]?/))[1];
	$('#nav > li').removeClass('current');
	$('#nav > li.item-' + pre).addClass('current');
};
  
/*
 * 
 *  on(events,[selector],[data],fn)
	events:一个或多个用空格分隔的事件类型和可选的命名空间，如"click"或"keydown.myPlugin" 。
	selector:一个选择器字符串用于过滤器的触发事件的选择器元素的后代。如果选择器为null或省略，当它到达选定的元素，事件总是触发。
	data:当一个事件被触发时要传递event.data给事件处理函数。
	fn:该事件被触发时执行的函数。 false 值也可以做一个函数的简写，返回false。
 * 
 * 
 * */


//增加页签
var tab = $("#page-tab").ligerGetTabManager();
$('#nav').on('click', 'a[rel=pageTab]', function(e){
	//取消事件的默认动作。
	e.preventDefault();
	var right = $(this).data('right');
	if (right && !Business.verifyRight(right)) {
		return false;
	}
	var tabid = $(this).attr('tabid'), url = $(this).attr('href'), showClose = $(this).attr('showClose'), text = $(this).text().replace('>',''),parentOpen = $(this).attr('parentOpen');
	if(parentOpen){
		parent.tab.addTabItem({tabid: tabid, text: text, url: url, showClose: showClose});
	} else {
		var flag = tab.isTabItemExist(tabid);
		tab.addTabItem({tabid: tabid, text: text, url: url, showClose: showClose});
		if(flag){
			tab.reload(tabid);
		}
		
	}
	setTabHeight();
	return false;
});

if(SYSTEM.indexHref == "null"){//默认首页
	tab.addTabItem({tabid: 'index', text: '电子地图', url: 'jsp/biz/dzdt/maphome.jsp', showClose: false});
}else{
	tab.addTabItem({tabid: 'index', text: SYSTEM.indexHref.split(";")[0], url: SYSTEM.indexHref.split(";")[1], showClose: false});
}

$(window).load(function(e) {
	function getNewsTip() {
		var version;
		switch (SYSTEM.siVersion) {
			case 3:
			  version = '1';
			  break;
			case 4:
			  version = '3';
			  break;
			default:
			  version = '2';
		};
		$.getJSON( CONFIG.SERVICE_URL + "asy/Services.ashx?callback=?", {coid : SYSTEM.DBID, loginuserno: SYSTEM.UserName, version: version, type: 'getallunreadcount' + SYSTEM.servicePro}, function(data){ 
			if(data.count == 0){ return; }
			var $a = $('#SysNews a'), href = $a.attr('href');
			$a.append('<span>' + data.count + '</span>');
			if(data.syscount == 0){
				$a.data('tab', 2);
			}
		});
	};
	getNewsTip();
	$('.service-tab').click(function(){
		var toTab = $(this).data('tab');
		tab.addTabItem({tabid: 'myService', text: '服务支持', url: '/service/service.html', callback: function(){
			document.getElementById('myService').contentWindow.openTab(toTab);
		}});
	});
	//跳转提示
	if($.cookie('ReloadTips')){	
		Public.tips({content:$.cookie('ReloadTips')});
		$.cookie('ReloadTips',null);
	}
});