<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.sys.pojo.TOrgan"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser user = (TUser)session.getAttribute(IConstant.SESSION_TUSER);
TOrgan organ = (TOrgan)session.getAttribute(IConstant.SESSION_TORGAN_CODE);
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

.long98{
  width:92%;
}
.long85{
  width:85%;
}
.tabjcxx {
	border-collapse:collapse; 
	text-align:center; 
	margin:0 0 0 0;
	width: 80%;
}
.tabjcxx th{
	border:1px black solid;
	text-align:center; 
	font-size:14px;
}
.tabjcxx td{
	border:1px black solid;
	font-size:12px;
	text-align:center; 
	margin:0px; 
	padding:0 0 0 0px;
}
input{
	text-align: center;
	vertical-align: middle;
}
.shuoming {
	border-collapse:collapse; 
	text-align:center; 
	margin:0 0 0 0;
	width: 100%;
	border: none;
}
.shuoming td {
	border: none;
}
.redStyle{
	color: red;
}
a{text-decoration: none;color: #000;font-size: 14px;}

#tabbox{ width:100%; overflow:hidden; margin:0 auto;}
.tab_conbox{border: 1px solid #999;border-top: none;}
.tab_con{ display:none;}

.tabs{height: 32px;border-bottom:1px solid #999;border-left: 1px solid #999;width: 100%;}
.tabs li{height:31px;line-height:31px;float:left;border:1px solid #999;border-left:none;margin-bottom: -1px;background: #e0e0e0;overflow: hidden;position: relative;}
.tabs li a {display: block;padding: 0 20px;border: 1px solid #fff;outline: none;}
.tabs li a:hover {background: #ccc;}	
.tabs .thistab,.tabs .thistab a:hover{background: #fff;border-bottom: 1px solid #fff;}

.tab_con {padding:12px;font-size: 14px; line-height:175%;}

#hzb td input{
	width: 80%;
}
p{
	color:red;
	display: none;
}
</style>
</head>
<body>

	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_add_save">??????</a>
	  </div>

<form id="frm_zcdj_add${uuid}" method="post">
<div id="tabbox">
    <ul class="tabs" id="tabs">
       <li><a href="javascript:void(0)">?????????</a></li>
       <li><a href="javascript:void(0)">?????????</a></li>
    </ul>
    <ul class="tab_conbox" id="tab_conbox">
        <li class="tab_con">
        
	<div class="wrapper">
	   		<div>
		   			<div style="width: 80%;text-align: center;font-size: 30px">
		   				???????????????????????????
		   			</div>
		   			<br/>
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.filepath"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="${param.zl}"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="${param.zldm}"/>
	                	 <input type="hidden" name="register.shebeileibie" value="??????"/>
	                	 <input type="hidden" name="register.shebeileibiedaima" value="Q200"/>
	                	 <input type="hidden" name="register.tjstate" value="0"/>
						 <input type="hidden" name="register.shiyongdanwei" id="reg_add_sydw" value="${register.shiyongdanwei}"/>
	                </div>
					<div>
						<table>
							<tr>
								<th>???????????????</th>
								<td>
									<select style="width:200px" name="register.dengjileibie" id="djlb">
										<option value=""></option>
										<option value="?????????????????????">?????????????????????</option>
										<option value="???????????????">???????????????</option>
										<option value="??????">??????</option>
										<option value="??????????????????">??????????????????</option>
										<option value="??????????????????">??????????????????</option>
										<option value="??????">??????</option>
										<option value="??????">??????</option>
										<option value="????????????????????????">????????????????????????</option>
									</select>
								</td>
							</tr>
						</table>
						<table class="tabjcxx">
							<tr>
								<th rowspan="2" style="width: 10%">??????????????????</th>
								<th style="width: 15%">????????????</th>
								<td style="width: 35%">
									??????
								</td>
								<th style="width: 20%">????????????</th>
								<td style="width: 20%">
									<div id="yzc_shebeipinzhong_div">
					    				<select class="long98" name="register.shebeipinzhongdaima" id="yzc_shebeipinzhong"></select>
									</div>
					    		</td>
							</tr>
							<tr>
								<th>????????????</th>
								<td>
									<input class="ui-input long98" name="register.shebeimingcheng" />
					    		</td>
								<th>????????????</th>
								<td>
									<input class="ui-input long98" name="register.shebeishuliang" />
								</td>
							</tr>
							<tr>
								<th rowspan="7" style="width: 10%">??????????????????</th>
								<th>??????????????????</th>
								<td colspan="3">
									${register.shiyongdanwei}
								</td>
							</tr>
							<tr>
								<th>??????????????????</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.shiyongdanweidizhi" value="${register.shiyongdanweidizhi}" />
								</td>
							</tr>
							<tr>
								<th>???</th>
								<td>
									<div id="shi_div">
										<select class="long98" sltValue="${register.shiyongdanweidizhi_shi_daima}" name="register.shiyongdanweidizhi_shi_daima" id="shi"></select>
									</div>
								</td>
								<th>??????</th>
								<td >
									<div id="quxian_div">
										<select class="long98" sltValue="${register.shiyongdanweidizhi_qu_daima}" name="register.shiyongdanweidizhi_qu_daima" id="quxian"></select>
									</div>
								</td>
							</tr>
							<tr>
								<th>??????</th>
								<td>
									<div id="xiangzhen_div">
										<select class="long98" sltValue="${register.suozaixiangzhen_daima}" name="register.suozaixiangzhen_daima" id="xiangzhen"></select>
									</div>
								</td>
								<th></th>
								<td >
								</td>
							</tr>
							<tr>
								<th>??????????????????</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdidian" value="${register.shiyongdidian}" />
								</td>
								<th>??????????????????</th>
								<td>
									<input class="ui-input long98" name="register.sydw_gudingdianhua" />
								</td>
							</tr>
							<tr>
								<th>????????????????????????</br>????????????</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdanweidaima" />
								</td>
								<th>????????????</th>
								<td>
									<input class="ui-input long98" name="register.sydw_youzhengbianma" value="${register.sydw_youzhengbianma}" />
								</td>
							</tr>
							<tr>
								<th>??????????????????</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlirenyuan"/>
								</td>
								<th>????????????</th>
								<td>
									<input class="ui-input long98" name="register.aqglry_lianxidianhua" />
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div style="text-align: left;">
										    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
									</div>
									<div style="text-align: left;">
										 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????????????????????????????????
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">???????????????????????????</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.tianbiaorenyuan" />
											</td>
											<td style="width: 10%">?????????</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.tianbiaoriqi" onclick="WdatePicker()" />
											</td>
											<td style="width: 20%">(??????????????????)</td>
										</tr>
										<tr>
											<td>?????????????????????????????????</td>
											<td></td>
											<td>?????????</td>
											<td>
												<input class="ui-input long98" name="register.aqglry_riqi" onclick="WdatePicker()" />
											</td>
											<td><input class="ui-input long98" name="register.shiyongdanwei_nyr" onclick="WdatePicker({dateFmt:'yyyy???MM???dd???'})"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div style="text-align: left;">
										?????????<textarea rows="3" style="width: 98%" name="register.beizhu"></textarea>
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">???????????????????????????</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.zhucedengjirenyuan" />
											</td>
											<td style="width: 20%">?????????</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.zhucedengjiriqi" onclick="WdatePicker()" required="required" />
											</td>
											<td style="width: 20%">???????????????????????????</td>
										</tr>
										<tr>
											<td>????????????????????????</td>
											<td>
											</td>
											<td>????????????</td>
											<td>
												<input class="ui-input long98" name="register.zhucedengjijigou"/>
											</td>
											<td><input class="ui-input long98" name="register.dengjijiguan_nyr" onclick="WdatePicker({dateFmt:'yyyy???MM???dd???'})"/></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
		   			</div>
		    </div>
		</div>
        </li>
            
        <li class="tab_con">
		  
		   			<div style="width: 100%;text-align: center;font-size: 30px"><br/>
		   				???????????????????????????
		   			</div>
		   			<br/>
	    			<a class="ui-btn ui-btn-sp" id="hzb_add">?????????</a>
	    			<br/>
		    		<table class="tabjcxx" id="hzb" style="width: 100%">
		    			<tr>
		    				<th style="width: 5%">????????????</th>
		    				<th style="width: 5%">????????????</th>
		    				<th style="width: 5%">????????????</th>
		    				<th style="width: 5%">????????????</th>
		    				<th style="width: 5%">????????????</th>
		    				<th style="width: 5%">??????????????????(MPa)</th>
		    				<th style="width: 5%">??????(L)</th>
		    				<th style="width: 5%">???????????????????????? </th>
		    				<th style="width: 5%">??????????????????</th>
		    				<th style="width: 5%">???????????????</th>
		    				<th style="width: 5%">????????????????????????</th>
		    				<th style="width: 7%">?????????????????????</th>
		    				<th style="width: 3%">??????</th>
		    			</tr>
		    			<tr>
			    			<td>
			    				<select inum="0" name="qp_hzb_list[0].shebeipinzhong">
			    					<option value="????????????">????????????</option>
			    					<option value="????????????">????????????</option>
			    					<option value="??????????????????">??????????????????</option>
			    					<option value="??????????????????">??????????????????</option>
			    					<option value="??????????????????">??????????????????</option>
			    				</select>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="0" name="qp_hzb_list[0].chanpinbianhao"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="0" name="qp_hzb_list[0].chongzhuangjiezhi"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="0" name="qp_hzb_list[0].zhizaodanwei"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="0" name="qp_hzb_list[0].zhizaonianyue"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="0" name="qp_hzb_list[0].gongzuoyali"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="0" name="qp_hzb_list[0].rongji"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="0" name="qp_hzb_list[0].zuihoujianyanriqi" onclick="WdatePicker()"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="0" name="qp_hzb_list[0].xiacijianyanriqi" onclick="WdatePicker()"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="0" name="qp_hzb_list[0].danweineibianhao"/>
			    			</td>
			    			<td>
			    				<select inum="0" name="qp_hzb_list[0].biangengtingyong" style="width:90%">
			    					<option value="??????">??????</option>
			    					<option value="??????">??????</option>
			    					<option value="??????">??????</option>
			    					<option value="??????">??????</option>
			    				</select>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="0" name="qp_hzb_list[0].xinxihua"/>
			    			</td>
			    			<td>
			    				<a href="javascript:void(0)" onclick="delRow(this)">??????</a>
			    			</td>
			    		</tr>
		    		</table>
		    		<table style="width: 100%">
		    			<tr>
		    				<th style="border: none;">???????????????</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_tianbiaoriqi" class="ui-input long98" onclick="WdatePicker()" />
		    				</td>
		    				<th style="border: none;">????????????</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_jingbanren" class="ui-input long98" />
		    				</td>
		    				<th style="border: none;">???????????????</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_lianxidianhua" class="ui-input long98" />
		    				</td>
		    				<th style="border: none;">???????????????</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_dianziyouxiang" class="ui-input long98" />
		    				</td>
		    			</tr>
		    		</table>
        </li>
    </ul>
    
</div>
	  
	</form>
</body>
</html>
	<script type="text/javascript">
	
	var path = "<%=path%>";
	
	$("#djlb").selectmenu();
	
	var hzbnum = 1;
	
	$().ready(function(){
			$("#tab_conbox").find("li").hide();
			$("#tabs").find("li:first").addClass("thistab").show(); 
			$("#tab_conbox").find("li:first").show();
			$("#tabs").find("li").bind("click",function(){
			  $(this).addClass("thistab").siblings("li").removeClass("thistab"); 
				var activeindex = $("#tabs").find("li").index(this);
				$("#tab_conbox").children().eq(activeindex).show().siblings().hide();
				return false;
			});
			//?????????????????????
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"Q200"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeipinzhong",data.dirDatas,"200px",false,"<%=path%>");
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			
		//????????????
		$("#mnubtn_zcdj_add_save${uuid}").click(function(){
			var options = {
			    url:"<%=path%>/register!save.do?gzid=${gzid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if(!verifySelect()){ return false;}
					if($("#frm_zcdj_add${uuid}").validate().form()){
						parent.showMask("????????????......");
						return true;
					}
			    	return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">????????????!</font>',3,'success.gif');
	            		parent.frames["${param.fid}"].reloadGrid();
						parent.addTabsItem("add_djb_${param.zldm}",rsp.sydw+"_?????????_"+rsp.id,"<%=path%>/register!openZcdjbById.do?id="+rsp.id+"&zldm=${param.zldm}&fid=${param.fid}");
	            	}else{
						$.dialog.tips('<font color="blue">???????????????!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_zcdj_add${uuid}").ajaxSubmit(options);
	         return false;
		});
		//?????????
		$("#hzb_add").click(function(){
			var tdList = $("#hzb").find("tr").last();
			var newTr = tdList.clone(true);
			newTr.find("td").children().each(function(){
				if($(this).attr("name") != undefined){
					$(this).attr("name",$(this).attr("name").replace($(this).attr("inum"),hzbnum));
					$(this).attr("inum",hzbnum);
				}
			});
			$("#hzb").append(newTr);
			hzbnum++;
		});
		appendSelTo();
	});
	
  	//?????????????????????????????????
  	function checkZcdmDw(){
  		var result = false;
  		var zcdm = $("#reg_add").val();
  		var sydw = $("#reg_add_sydw").val();
  		if(zcdm.length < 17 || zcdm.length > 20){
			$.dialog.alert('???????????????????????????!');
			return false;
  		}
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/register!verifyByDwmcOrZcdm.do",
		   data:'dwmc='+encodeURI(encodeURI(sydw))+'&zcdm='+zcdm,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.result == "0"){
					$.dialog.alert('??????????????????!');
		   		}else{
		   			result = true;
		   		}
		   }
		});
  		return result;
  	}
  	function delRow(obj){
  		if($("#hzb").find("tr").length == 2){
			$.dialog.alert('???????????????????????????!');
			return false;
  		}
        var tr=obj.parentNode.parentNode;  
        var tbody=tr.parentNode;  
        tbody.removeChild(tr);
   } 
	//??????select ????????????
	function verifySelect(){
		var s = $('#shi').val();
		var q = $('#quxian').val();
		var sbpz = $("#yzc_shebeipinzhong").val();
		var flag = false;
		
		if(s == ""){
			$("#shi_div  p").show();
			flag = false;
		}else{
			$("#shi_div  p").hide();
			flag = true;
		}
		if(q == "" || q == null){
			$("#quxian_div  p").show();
			flag = false;
		}else{
			$("#quxian_div  p").hide();
			flag = true;
		}
		if(sbpz == "" || sbpz == null){
			$("#yzc_shebeipinzhong_div  p").show();
			flag = false;
		}else{
			$("#yzc_shebeipinzhong_div  p").hide();
			flag = true;
		}
		return flag;
	}
	
	//???select ?????????????????? p
	function appendSelTo(){
		var divS = $('td > div');
		for(var i=0;i<divS.length-1;i++){
			$("<p>????????????</p>").appendTo(divS[i]);
		}
	}
	
	//???select ?????????????????????????????????
	function delay(){
		
		setTimeout(function(){verifySelect()},3000);
	}
  	
	</script> 