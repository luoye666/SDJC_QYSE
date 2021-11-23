//验证电梯救援参数表是否填写完整
function verifyRequired(){
	var flag = true;
	$("input[required='required']").each(function(i,item){
		if($(this).val() == "" || $(this).val() == null){
			var text = $(this).parent().prev().text().replace("：","");
        	if(text == ""){
        		text = $(this).parent().parent().prev().text().replace("：","");
        	}
        	$(this).focus();
        	this.style.borderColor = 'red';
           	$.dialog.tips('<font color="red">【'+text+ '】未填写，请前往填写</font>',3,'error.gif');
            flag = false;
            return flag;
        }
    })

    return flag;
}



//判断填写的下次检验日期是否已经超期
$("input[name='reg.xiacijianyanriqi']").attr("onchange", "");

$("input[name='reg.xiacijianyanriqi']").change(function(i,item){
	var oDate = new Date($(this).val());
	alert(oDate.getTime() +"---"+ new Date().getTime());
	if(new Date().getTime()>oDate.getTime()){
		$(this).focus();
		$.dialog.alert('该设备不在有效检验周期内，请核实后办理使用登记业务！');
		flag = false;
        return flag;
	};
})