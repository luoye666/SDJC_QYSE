(function(e){e.ligerMenu=function(i){return e.ligerui.run.call(null,"ligerMenu",arguments)};e.ligerDefaults.Menu={width:120,top:0,left:0,items:null,shadow:true};e.ligerMethos.Menu={};e.ligerui.controls.Menu=function(i){e.ligerui.controls.Menu.base.constructor.call(this,null,i)};e.ligerui.controls.Menu.ligerExtend(e.ligerui.core.UIComponent,{__getType:function(){return"Menu"},__idPrev:function(){return"Menu"},_extendMethods:function(){return e.ligerMethos.Menu},_render:function(){var i=this,t=this.options;i.menuItemCount=0;i.menus={};i.menu=i.createMenu();i.element=i.menu[0];i.menu.css({top:t.top,left:t.left,width:t.width});t.items&&e(t.items).each(function(e,t){i.addItem(t)});e(document).bind("click.menu",function(){for(var e in i.menus){var t=i.menus[e];if(!t)return;t.hide();if(t.shadow)t.shadow.hide()}});i.set(t)},show:function(e,i){var t=this,n=this.options;if(i==undefined)i=t.menu;if(e&&e.left!=undefined){i.css({left:e.left})}if(e&&e.top!=undefined){i.css({top:e.top})}i.show();t.updateShadow(i)},updateShadow:function(e){var i=this,t=this.options;if(!t.shadow)return;e.shadow.css({left:e.css("left"),top:e.css("top"),width:e.outerWidth(),height:e.outerHeight()});if(e.is(":visible"))e.shadow.show();else e.shadow.hide()},hide:function(e){var i=this,t=this.options;if(e==undefined)e=i.menu;i.hideAllSubMenu(e);e.hide();i.updateShadow(e)},toggle:function(){var e=this,i=this.options;e.menu.toggle();e.updateShadow(e.menu)},removeItem:function(i){var t=this,n=this.options;e("> .l-menu-item[menuitemid="+i+"]",t.menu.items).remove()},setEnabled:function(i){var t=this,n=this.options;e("> .l-menu-item[menuitemid="+i+"]",t.menu.items).removeClass("l-menu-item-disable")},setDisabled:function(i){var t=this,n=this.options;e("> .l-menu-item[menuitemid="+i+"]",t.menu.items).addClass("l-menu-item-disable")},isEnable:function(i){var t=this,n=this.options;return!e("> .l-menu-item[menuitemid="+i+"]",t.menu.items).hasClass("l-menu-item-disable")},getItemCount:function(){var i=this,t=this.options;return e("> .l-menu-item",i.menu.items).length},addItem:function(i,t){var n=this,s=this.options;if(!i)return;if(t==undefined)t=n.menu;if(i.line){t.items.append('<div class="l-menu-item-line"></div>');return}var u=e('<div class="l-menu-item"><div class="l-menu-item-text"></div> </div>');var l=e("> .l-menu-item",t.items).length;t.items.append(u);u.attr("ligeruimenutemid",++n.menuItemCount);i.id&&u.attr("menuitemid",i.id);i.text&&e(">.l-menu-item-text:first",u).html(i.text);i.icon&&u.prepend('<div class="l-menu-item-icon l-icon-'+i.icon+'"></div>');if(i.disable||i.disabled)u.addClass("l-menu-item-disable");if(i.children){u.append('<div class="l-menu-item-arrow"></div>');var o=n.createMenu(u.attr("ligeruimenutemid"));n.menus[u.attr("ligeruimenutemid")]=o;o.width(s.width);o.hover(null,function(){if(!o.showedSubMenu)n.hide(o)});e(i.children).each(function(){n.addItem(this,o)})}i.click&&u.click(function(){if(e(this).hasClass("l-menu-item-disable"))return;i.click(i,l)});i.dblclick&&u.dblclick(function(){if(e(this).hasClass("l-menu-item-disable"))return;i.dblclick(i,l)});var r=e("> .l-menu-over:first",t);u.hover(function(){if(e(this).hasClass("l-menu-item-disable"))return;var s=e(this).offset().top;var u=s-t.offset().top;r.css({top:u});n.hideAllSubMenu(t);if(i.children){var l=e(this).attr("ligeruimenutemid");if(!l)return;if(n.menus[l]){n.show({top:s,left:e(this).offset().left+e(this).width()-5},n.menus[l]);t.showedSubMenu=true}}},function(){if(e(this).hasClass("l-menu-item-disable"))return;var t=e(this).attr("ligeruimenutemid");if(i.children){var t=e(this).attr("ligeruimenutemid");if(!t)return}})},hideAllSubMenu:function(i){var t=this,n=this.options;if(i==undefined)i=t.menu;e("> .l-menu-item",i.items).each(function(){if(e("> .l-menu-item-arrow",this).length>0){var i=e(this).attr("ligeruimenutemid");if(!i)return;t.menus[i]&&t.hide(t.menus[i])}});i.showedSubMenu=false},createMenu:function(i){var t=this,n=this.options;var s=e('<div class="l-menu" style="display:none"><div class="l-menu-yline"></div><div class="l-menu-over"><div class="l-menu-over-l"></div> <div class="l-menu-over-r"></div></div><div class="l-menu-inner"></div></div>');i&&s.attr("ligeruiparentmenuitemid",i);s.items=e("> .l-menu-inner:first",s);s.appendTo("body");if(n.shadow){s.shadow=e('<div class="l-menu-shadow"></div>').insertAfter(s);t.updateShadow(s)}s.hover(null,function(){if(!s.showedSubMenu)e("> .l-menu-over:first",s).css({top:-24})});if(i)t.menus[i]=s;else t.menus[0]=s;return s}});e.ligerui.controls.Menu.prototype.setEnable=e.ligerui.controls.Menu.prototype.setEnabled;e.ligerui.controls.Menu.prototype.setDisable=e.ligerui.controls.Menu.prototype.setDisabled})(jQuery);