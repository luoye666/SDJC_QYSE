$("#tab_conbox").find("li").hide();
$("#tabs").find("li:first").addClass("thistab").show();
$("#tab_conbox").find("li:first").show();
$("#tabs").find("li").bind("click", function() {
	$(this).addClass("thistab").siblings("li").removeClass("thistab");
	var activeindex = $("#tabs").find("li").index(this);
	$("#tab_conbox").children().eq(activeindex).show().siblings().hide();
	return false;
});