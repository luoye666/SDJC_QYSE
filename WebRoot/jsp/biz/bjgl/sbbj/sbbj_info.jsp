<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date d = new Date();
long datetime = d.getTime();
String riqi = sdf.format(d);
%>
<!doctype html>
<html>
<head>
<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style type="text/css">


        #tit {height: 30px;}
        #tit span {float: left; height: 30px; line-height: 30px; width: 50px; text-align: center; color: #000000;background: #84C1FF;margin-right: 2px; }
        #con li{display: none; }
        #con li.show {display: block;}


h3 {
font-size:14px;
font-weight:bold;
}

pre,p {
color:#1E7ACE;
margin:4px;
}
input, select,textarea {
padding:1px;
margin:2px;
font-size:11px;
} 

fieldset {
padding:10px;
margin-top:5px;
border:1px solid #1E7ACE;
background:#fff;
width:96%;
}

fieldset legend {
color:#1E7ACE;
font-weight:bold;
padding:3px 20px 3px 20px;
border:1px solid #1E7ACE;
background:#fff;
}
fieldset div {
clear:left;
margin-bottom:2px;
}
.enter{ text-align:center;}
.clear {
clear:both;
}

label {
	text-align:right;
	display:-moz-inline-box;
 	display:inline-block;
	width: 90px;
}
.divSlt{
	display: inline;
} 
.width100{
	width: 120px;
}
b{
	color:red;
	display: none;
}
.param label{
	width: 200px;
}
</style> 
</head>
<body>
	<div class="wrapper" style="width:100%;">
	  <div class="mod-search cf" id="menu_tools">
		<a class="ui-btn ui-btn-sp" id="mnubtn_sbbj_tijiao">提交审核</a>  
		<a class="ui-btn ui-btn-sp" id="mnubtn_sbbj_shangchuan">上传缴费凭证</a>  <br/><br/>
		<a class="ui-btn ui-btn-sp select" id="mnubtn_sbbj_bjd">报检单</a>
		<a class="ui-btn ui-btn-sp" id="mnubtn_sbbj_sb">设备</a>
	  </div>
    <div style="float: left;box-sizing: border-box;width:70%;">
	  <ul id="con">
            <li class="show">
            	
			    	<form id="frm_sbbj_save" method="post">
			    	<div class="formHiddenRegion">
		                	 <input type="hidden" name="bjd.shi" value="${bjd.shi}" />
		                	 <input type="hidden" name="bjd.quhuamingcheng" value="${bjd.quhuamingcheng}"/>
		                	 <input type="hidden" name="bjd.shebeizhongleidaima" value="${bjd.shebeizhongleidaima}"/>
		                	 <input type="hidden" name="bjd.se_id" value="${bjd.se_id}"/>
		                	 <input type="hidden" name="bjd.seZhucedaima" value="${bjd.seZhucedaima}"/>
		                	 <input type="hidden" name="bjd.fujian" value="${bjd.fujian}" id="fj"/>
		                	 <input type="hidden" name="bjd.seDengjizhengbianhao" value="${bjd.seDengjizhengbianhao}"/>
		                	 <input type="hidden" name="bjd.jiaofeipingzheng" value="${bjd.jiaofeipingzheng}" id="jiaofeifj"/>
	                	</div>
						<fieldset>
						<legend>基本信息（不可修改）</legend>
						<div>
							<label>检验类别:</label>
						    <input class="ui-input" name="bjd.jianyanleibie" value="${bjd.jianyanleibie}" style="width: 179px;" onfocus="this.blur();" />
						    <label>设备种类:</label>
						    <input class="ui-input" name="bjd.shebeizhonglei" value="${bjd.shebeizhonglei}" style="width: 179px;" onfocus="this.blur();" /><br/>
							<label>市:</label>
								<div id="shi_div" class="divSlt" onclick="delay()">
		        					<select name="bjd.shidaima" sltValue="${bjd.shidaima}"  style="width: 195px;" id="shi"></select>
								</div>
							<label>区划名称:</label>
								<div id="quxian_div" class="divSlt" onclick="delay()">
		        					<select name="bjd.quhuadaima" sltValue="${bjd.quhuadaima}" style="width: 195px;" id="quxian"></select>
								</div>
							<br/>
						</div>
						</fieldset>
						<fieldset>
						<legend>单位信息</legend>
						<div>
							<label>使用单位:</label>
							<input class="ui-input"   style="width: 420px;" name="bjd.shiyongdanwei" value="${bjd.shiyongdanwei}" onfocus="this.blur()"/>&nbsp;&nbsp;<font class="fjh" color="red">(不能修改)</font><br/>
							<label>单位地址:</label>
							<input class="ui-input"   style="width: 420px;" name="bjd.shiyongdanweiDizhi" value="${bjd.shiyongdanweiDizhi}" /><br/>
							<label>设备地点:</label>
							<input class="ui-input" style="width: 420px;" name="bjd.shiyongdanweiShebeidizhi" value="${bjd.shiyongdanweiShebeidizhi}" /><br/>
							<label>联系人:</label>
						    <input class="ui-input" name="bjd.shiyongdanweiLianxiren" value="${bjd.shiyongdanweiLianxiren}" style="width: 179px;" required="required"/>&nbsp;&nbsp;<font class="fjh" color="red">(必填)</font>
						    <label>联系电话:</label>
						    <input class="ui-input" name="bjd.shiyongdanweiLianxidianhua" value="${bjd.shiyongdanweiLianxidianhua}" style="width: 179px;" required="required" />&nbsp;&nbsp;<font class="fjh" color="red">(必填)</font><br/>
						    <div id="jns">
						    	<label>邮箱:</label>
						    	<input class="ui-input" name="bjd.youxiang" value="${bjd.youxiang}" style="width: 179px;" required="required" />&nbsp;&nbsp;<font class="fjh" color="red">(必填)</font><br/>
						    </div>
						    <label>附件:</label>
						    <input type="file" style="width: 30%" name="uploadify" id="file" class="fjh" />&nbsp;&nbsp;<font class="fjh" color="red">(必填)(不能超过10M)</font>
							<a href="javascript:void(0);" id="xiazai" onclick="downloadFile()">报检资料下载</a>  
							
							<a href="javascript:void(0);" id="jiaofeixiazai" onclick="downloadJiaofeiFile()">缴费凭证下载</a>  
						</div>
						</fieldset>
						<fieldset>
						
						
						<legend>邮寄信息</legend>
						<div>
							<label>是否邮寄:</label>
							<select class="long98" name="bjd.mail" id="isyj" style="width:179px" >
								<option value="否" ${bjd.mail=="安装监督检验" ? "selected" : ""}>否</option>
								<option value="是" ${bjd.mail=="改造监督检验" ? "selected" : ""}>是</option>
							</select><br/>
							<label>收件单位:</label>
							<input class="ui-input req dis"   style="width: 179px;" name="bjd.shoujiandanwei" value="${bjd.shoujiandanwei}" />
							<label>收件人:</label>
							<input class="ui-input req dis"   style="width: 179px;" name="bjd.shojianren" value="${bjd.shojianren}" /><br/>
							<label>地址:</label>
							<input class="ui-input req dis" style="width: 179px;" name="bjd.shoujiandizhi" value="${bjd.shoujiandizhi}" />
							<label>收件电话:</label>
						    <input class="ui-input req dis" name="bjd.shoujiandianhuan" value="${bjd.shoujiandianhuan}" style="width: 179px;" /><br/>
						    <label>邮寄物名称:</label>
							<input class="ui-input dis"   style="width: 179px;" name="bjd.youjiwumingcheng" value="${bjd.youjiwumingcheng}" />
							<label>数量:</label>
							<input class="ui-input dis"   style="width: 179px;" name="bjd.shuliang" value="${bjd.shuliang}" /><br/>
							<label>费用:</label>
							<input class="ui-input dis" style="width: 179px;" name="bjd.cost" value="${bjd.cost}" />
							<label>月结账号:</label>
						    <input class="ui-input dis" name="bjd.yuejiezhanghao" value="${bjd.yuejiezhanghao}" style="width: 179px;" /><br/>
						    <label>备注:</label>
						    <input class="ui-input dis" name="bjd.youjibeizhu" value="${bjd.youjibeizhu}" style="width: 420px;" />
						</div>
						</fieldset>
						
						<fieldset>
						<legend>业务信息（特检院填写）</legend>
						<div>
							<label>受理编号:</label>
							<input class="ui-input" style="width: 179px;" name="bjd.shoulibianhao" value="${bjd.shoulibianhao}" onfocus="this.blur();" />
							<label>受理日期:</label>
							<input class="ui-input" style="width: 179px;" name="bjd.shouliriqi" value="<fmt:formatDate value='${bjd.shouliriqi}' pattern='yyyy-MM-dd'/>" onfocus="this.blur();" /><br/>
							<label>核定类型:</label>
							<input class="ui-input" style="width: 179px;" name="bjd.hedingleixing" value="${bjd.hedingleixing}" onfocus="this.blur();" />
							<label>标准费用:</label>
						    <input class="ui-input" name="bjd.biaozhunfeiyong" value="${bjd.biaozhunfeiyong}" style="width: 179px;" onfocus="this.blur();" /><br/>
						    <label>核定人员:</label>
						    <input class="ui-input" name="bjd.hedingrenyuan" value="${bjd.hedingrenyuan}" style="width: 179px;" onfocus="this.blur();" />
						    <label>缴费状态:</label>
							<input class="ui-input" style="width: 179px;" name="bjd.jiaofeizhuangtai" value="${bjd.jiaofeizhuangtai}" onfocus="this.blur();" /><br/>
							<label>发票号:</label>
							<input class="ui-input" style="width: 179px;" name="bjd.fapiaohao" value="${bjd.fapiaohao}" onfocus="this.blur();" />
							<label>开具人员:</label>
							<input class="ui-input" style="width: 179px;" name="bjd.kaijurenyuan" value="${bjd.kaijurenyuan}" onfocus="this.blur();" /><br/>
							<label>检验地点:</label>
						    <input class="ui-input" name="bjd.jianyandidian" value="${bjd.jianyandidian}" style="width: 179px;" onfocus="this.blur();" />
						    <label>协商检验时间:</label>
						    <input class="ui-input" name="bjd.jianyanriqi" value="${bjd.jianyanriqi}" style="width: 179px;" onfocus="this.blur();" /><br/>
						    <label>备注:</label>
						    <input class="ui-input" name="bjd.beizhu" value="${bjd.beizhu}" style="width: 420px;" onfocus="this.blur();" /><br/>
						</div>
						</fieldset>
			    	</form>
            </li>
            <li>
	  	    	<fieldset>
            		<legend>报检设备</legend>
					 <div class="grid-wrap" >
					    <table id="grid" >
					    </table>
					    <div id="page"></div>
					  </div>
				</fieldset>
            </li>
        </ul>
	    	  </div>
	    	  <div id="sm" style="float: left;box-sizing: border-box;width:25%;display: none;">
		    	  <fieldset>
		    	  <legend>说明</legend>
		    	  <div>1. 如果单位名称、设备信息等有误、遗漏，请联系监察机构补正。</div>
		    	  <div>2. 定期检验设备，检验周期为一年的设备，超期半年以上，必须提供监察机构意见；检验周期为两年及以上设备，超期一年以上，必须提供监察机构意见（可在附件中上传扫描件）。否则报检信息不予受理。</div>
		    	  <div>3. <span style="color:red">请上传"盖章后的报检申请表扫描件"。</span></div>
		    	  </fieldset>
			 </div>
		 </div>
	</body>
	<iframe id="downloadFile" height="0" width="0" src="" style="display: none;"></iframe>
</html>
	<script type="text/javascript">
	/**页面所需资源初始化*/
	var columns = "";
	var setSel;
	var djzbh = "";
	var path = "<%=path %>";
	var id = $('#bid').val();
	var type = $('#status').val();
	var seId = '${bjd.se_id}';
	var ziliao = '${bjd.fujian}';
	var jiaofeiziliao = '${bjd.jiaofeipingzheng}';
	var shidaima = "<%=user.getShidaima() %>";
	
	if(${param.status == 'bjd'}){
		$("#mnubtn_sbbj_tijiao").hide();
	}else{
		$("#mnubtn_sbbj_shangchuan").hide();
	}
	
	if(ziliao.length == 0){
		$('#xiazai').html('');
	}else{
		$('.fjh').hide();
	}
	
	if(jiaofeiziliao.length == 0){
		$('#jiaofeixiazai').hide();
	}
	
	if(shidaima == '3716'){
		$('#sm').show();
		 $('#file').attr("required", "required");
	}else{
		$('#jns').remove();
	}
	
	$("#isyj").selectmenu({
		change:function(){
			if(this.value == '是'){
				$('.req').attr("required", "required");
				$('.dis').attr("disabled", false);
			}else{
				$('.dis').attr("disabled", true);
			}
		}
	});
		$().ready(function(){
			
			
			//附件
			 $("#mnubtn_sbbj_shangchuan").click(function(){
				$.dialog({
					title:'上传缴费凭证',
				    width: '550px',
				    lock:true,
				    content: 'url:<%=path%>/jsp/biz/bjgl/sbbj/SimpleFileUpload_BJ.jsp?id=${bjd.id}'
				});
			  
				return false;
			});
			//tab
			$('#mnubtn_sbbj_bjd').click(function() {
	            $(this).addClass('select').siblings().removeClass('select');
	            $('#con li').eq(0).show().siblings().hide();
	        });
			//tab
			$('#mnubtn_sbbj_sb').click(function() {
	            $(this).addClass('select').siblings().removeClass('select');
	            $('#con li').eq(1).show().siblings().hide();
	        });
			
			
			//提交表单
			$("#mnubtn_sbbj_tijiao").click(function(){
				var options = {
				    url:"<%=path%>/bjd!saveBjd.do",
					dataType:'json',
		            beforeSubmit:function(formData, jqForm, options){
				    		if(!$("#frm_sbbj_save").validate().form()){
						    	return false;
						    }
				    		if(!mustFill()){return false;};
				    		parent.showMask("正在保存......");
							return true;
		           	},
		            success:function(rsp, statusText, xhr, $form){
		            	parent.hideMask();
		            	if(rsp.msg == '成功'){
							$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
							parent.dialogInfo();
							var url = "<%=path%>/jsp/biz/bjgl/sbbj/bjd_list.jsp";
							parent.addTabsItem("sbbj_list","报检状态",url);
							parent.closeTabsItemId("sbbj_info");
		            	}else if(rsp.msg == 'OUTSIZE'){
				    		$.dialog.tips('<font color="blue">文件过大，请控制在10M内!</font>',3,'error.gif');
				    	}else{
				    		$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
				    	}
	            	
		            }
		         };
		         $("#frm_sbbj_save").ajaxSubmit(options);
		         return false;
			});
			
			
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			
		});
	
	//对select 选中数据后延迟执行方法
	function delay(){
		setTimeout(function(){verifySelect()},3000);
	}
	
	function fujian(){
		$('#jiaofeixiazai').show();
	}
	
	//下载
	function downloadFile(){
		var path = $("#fj").val();
		document.getElementById("downloadFile").src="<%=path%>/upload!downloadFile.do?path="+encodeURI(encodeURI(path));
	}
	//缴费下载
	function downloadJiaofeiFile(){
		var path = $("#jiaofeifj").val();
		document.getElementById("downloadFile").src="<%=path%>/upload!downloadFile.do?path="+encodeURI(encodeURI(path));
	}
	
	
	function mustFill(){
		var flag = true;
		$("input[required='required']").each(function(i,item){
	        if($(this).val() == ""){
	            $.dialog.tips('<font color="blue">报检单单位信息填写不完整，请查看！</font>',3,'success.gif');
	            $(this).focus();
	            flag = false;
	        	return false;
	        }
	    })
	    return flag;
	}
	
	</script> 
	<script src="<%=path %>/js/bs/bjgl/sbbj/sbbj_info.js"></script>
