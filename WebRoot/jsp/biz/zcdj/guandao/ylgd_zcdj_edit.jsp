<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.sys.pojo.TOrgan"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ taglib prefix="c" uri="/c.tld" %>
<%@ taglib prefix="fn" uri="/fn.tld" %>
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
  width:91%;
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
p{
	color:red;
	display: none;
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
.shuoming{
	width: 100%;
}
.shuoming th{
	border: none;
}
.shuoming td{
	border: none;
}
</style>
</head>
<body>
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_edit_save">??????</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_edit_tj">???????????????</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_zcdj_edit_dy">??????</a>
	  </div>
	  
		    	<form id="frm_zcdj_edit${uuid}" method="post" enctype="multipart/form-data">
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
	                	 <input type="hidden" name="register.id" id="reg_id_${uuid}" value="${register.id}"/>
	                	 <input type="hidden" name="register.filepath" id="zcdjb_filepath_${uuid}" value="${register.filepath}"/>
	                	 <input type="hidden" name="register.fj_filepath" id="zcdjb_filepath_hid_${uuid}" value="${register.fj_filepath}"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="${register.shebeizhonglei}"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="${register.shebeizhongleidaima}"/>
	                	 <input type="hidden" name="register.tjstate" value="${register.tjstate}"/>
	                	 <input type="hidden" name="register.organ_code" value="${register.organ_code}"/>
	                	 <input type="hidden" name="register.creat_user" value="${register.creat_user}"/>
	                	 <input type="hidden" name="register.wtg_yuanyin" value="${register.wtg_yuanyin}"/>
						 <input type="hidden" name="register.shiyongdanwei" id="reg_add_sydw" value="${register.shiyongdanwei}"/>
	                	 <input type="hidden" name="register.shiyongdengjizhenghaoma" value="${register.shiyongdengjizhenghaoma}"/>
	                </div>
					<div>
						<table>
							<tr>
								<th>???????????????</th>
								<td>
									<select style="width:200px" name="register.dengjileibie" id="djlb">
										<option value=""></option>
										<option value="?????????????????????" ${register.dengjileibie == "?????????????????????" ? "selected" : ""}>?????????????????????</option>
										<option value="???????????????" ${register.dengjileibie == "???????????????" ? "selected" : ""}>???????????????</option>
										<option value="??????" ${register.dengjileibie == "??????" ? "selected" : ""}>??????</option>
										<option value="??????????????????" ${register.dengjileibie == "??????????????????" ? "selected" : ""}>??????????????????</option>
										<option value="??????????????????" ${register.dengjileibie == "??????????????????" ? "selected" : ""}>??????????????????</option>
										<option value="??????" ${register.dengjileibie == "??????" ? "selected" : ""}>??????</option>
										<option value="??????" ${register.dengjileibie == "??????" ? "selected" : ""}>??????</option>
										<option value="????????????????????????" ${register.dengjileibie == "????????????????????????" ? "selected" : ""}>????????????????????????</option>
									</select>
								</td>
							</tr>
						</table>
						<table class="tabjcxx">
							<tr>
								<th rowspan="2" style="width: 10%">??????????????????</th>
								<th style="width: 15%">????????????</th>
								<td style="width: 35%">
									<div id="yzc_shebeileibie_div">
										<select name="register.shebeileibiedaima" sltValue="${register.shebeileibiedaima}" class="long98" id="yzc_shebeileibie"></select>
									</div>
								</td>
								<th style="width: 20%">????????????</th>
								<td style="width: 20%">
									<div id="yzc_shebeipinzhong_div">
					    				<select class="long98" name="register.shebeipinzhongdaima" sltValue="${register.shebeipinzhongdaima}" id="yzc_shebeipinzhong"></select>
									</div>
					    		</td>
							</tr>
							<tr>
								<th>????????????</th>
								<td>
									<input class="ui-input long98" name="register.shebeimingcheng" value="${register.shebeimingcheng}" />
					    		</td>
								<th>????????????</th>
								<td>
									<input class="ui-input long98" name="register.shebeishuliang" value="${register.shebeishuliang}" />
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
									<input class="ui-input long98" name="register.sydw_gudingdianhua" value="${register.sydw_gudingdianhua}" />
								</td>
							</tr>
							<tr>
								<th>????????????????????????</br>????????????</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdanweidaima" value="${register.shiyongdanweidaima}" />
								</td>
								<th>????????????</th>
								<td>
									<input class="ui-input long98" name="register.sydw_youzhengbianma" value="${register.sydw_youzhengbianma}" />
								</td>
							</tr>
							<tr>
								<th>??????????????????</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlirenyuan" value="${register.anquanguanlirenyuan}"/>
								</td>
								<th>????????????</th>
								<td>
									<input class="ui-input long98" name="register.aqglry_lianxidianhua" value="${register.aqglry_lianxidianhua}" />
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div style="text-align: left;">
										    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
									</div>
									<div style="text-align: left;">
										 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;???????????????????????????????????????
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">???????????????????????????</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.tianbiaorenyuan" value="${register.tianbiaorenyuan}" />
											</td>
											<td style="width: 10%">?????????</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.tianbiaoriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" />
											</td>
											<td style="width: 20%">(??????????????????)</td>
										</tr>
										<tr>
											<td>?????????????????????????????????</td>
											<td>${register.anquanguanlirenyuan}</td>
											<td>?????????</td>
											<td>
												<input class="ui-input long98" name="register.aqglry_riqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.aqglry_riqi}' pattern='yyyy-MM-dd'/>" />
											</td>
											<td><input class="ui-input long98" name="register.shiyongdanwei_nyr" onclick="WdatePicker({dateFmt:'yyyy???MM???dd???'})" value="${register.shiyongdanwei_nyr}"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div style="text-align: left;">
										?????????<textarea rows="3" style="width: 98%" name="register.beizhu">${register.beizhu}</textarea>
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">???????????????????????????</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.zhucedengjirenyuan" value="${register.zhucedengjirenyuan}" />
											</td>
											<td style="width: 20%">?????????</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.zhucedengjiriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.zhucedengjiriqi}' pattern='yyyy-MM-dd'/>" required="required"/>
											</td>
											<td style="width: 20%">???????????????????????????</td>
										</tr>
										<tr>
											<td>????????????????????????</td>
											<td>
												${register.shiyongdengjizhenghaoma}
											</td>
											<td>????????????</td>
											<td>
												<input class="ui-input long98" name="register.zhucedengjijigou" value="${register.zhucedengjijigou}"/>
											</td>
											<td><input class="ui-input long98" name="register.dengjijiguan_nyr" onclick="WdatePicker({dateFmt:'yyyy???MM???dd???'})" value="${register.dengjijiguan_nyr}"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<th>??????</th>
								<td>
									<div id="zcdjb_fj_${uuid}" style="text-align: center;">????????????</div>
								</td>
								<td colspan="4">
									<div id="zcdjb_fj_input_${uuid}" style="display: inline;">
										<input type="file" style="width: 70%" name="uploadify"/>
									</div>
									(????????????10M)
								</td>
							</tr>
						</table>
		   			</div>
		    </div>
		</div>
        </li>
            
        <li class="tab_con">
		  
		   			<div style="width: 100%;text-align: center;font-size: 30px;">
		   				?????????????????????????????????--????????????
		   			</div>
		   			<br/>
	    			<a class="ui-btn ui-btn-sp" id="hzb_add">?????????</a>
	    			<br/>
	    			<br/>
		    		<table class="tabjcxx" id="hzb" style="width: 100%">
		    			<tr>
		    				<th colspan="3" style="border: none;">??????(??????)?????????</th>
		    				<td colspan="4" style="border: none;text-align: left;">
	    						<input name="register.gongchengmingcheng" value="${register.gongchengmingcheng}" class="ui-input" style="width: 80%" />
		    				</td>
		    				<th colspan="3" style="border: none;">?????????????????????</th>
		    				<td colspan="9" style="border: none;text-align: left;">
	    						<input name="register.anquanguanlibumen" value="${register.anquanguanlibumen}" class="ui-input" style="width: 50%" />
		    				</td>
		    			</tr>
		    			<tr>
		    				<th rowspan="2" style="width: 2%">??????</th>
		    				<th rowspan="2" style="width: 5%">????????????(????????????)</th>
		    				<th rowspan="2" style="width: 5%">????????????</th>
		    				<th rowspan="2" style="width: 5%">????????????</th>
		    				<th rowspan="2" style="width: 5%">????????????</th>
		    				<th rowspan="2" style="width: 5%">????????????</th>
		    				<th rowspan="2" style="width: 5%">????????????</th>
		    				<th rowspan="2" style="width: 5%">????????????</th>
		    				<th colspan="3" style="width: 5%">????????????</th>
		    				<th colspan="3" style="width: 5%">??????/????????????</th>
		    				<th rowspan="2" style="width: 5%">????????????</th>
		    				<th rowspan="2" style="width: 5%">??????????????????</th>
		    				<th rowspan="2" style="width: 7%">??????????????????</th>
		    				<th rowspan="2" style="width: 5%">??????</th>
		    				<th rowspan="2" style="width: 3%">??????</th>
		    			</tr>
		    			<tr>
		    				<th style="width: 5%">????????????(mm)</th>
		    				<th style="width: 5%">????????????(mm)</th>
		    				<th style="width: 5%">????????????(m)</th>
		    				<th style="width: 5%">??????(MPa)</th>
		    				<th style="width: 5%">??????(???)</th>
		    				<th style="width: 5%">??????</th>
		    			</tr>
		    			<c:forEach var="h" items="${hzbList}" varStatus="i">
		    			<tr>
		    				<td>${i.index+1}</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].guandaomingcheng" value="${h.guandaomingcheng}"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].guandaobianhao" value="${h.guandaobianhao}"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].guandaojibie" value="${h.guandaojibie}"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].shejidanwei" value="${h.shejidanwei}"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].anzhuangdanwei" value="${h.anzhuangdanwei}"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].anzhuangnianyue" onclick="WdatePicker()" value="<fmt:formatDate value='${h.anzhuangnianyue}' pattern='yyyy-MM-dd'/>"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].touyongnianyue" value="${h.touyongnianyue}"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].gongchengzhijing" value="${h.gongchengzhijing}"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].gongchengbihou" value="${h.gongchengbihou}"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].guandaochangdu" value="${h.guandaochangdu}"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].yali" value="${h.yali}"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].wendu" value="${h.wendu}"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].jiezhi" value="${h.jiezhi}"/>
			    			</td>
			    			<td>
			    				<select name="ylgd_hzb_list[${i.index}].jianyanjielun" inum="${i.index}">
									<option value="????????????" ${h.jianyanjielun == "????????????" ? "selected" : ""}>????????????</option>
									<option value="???????????????" ${h.jianyanjielun == "???????????????" ? "selected" : ""}>???????????????</option>
									<option value="??????????????????" ${h.jianyanjielun == "??????????????????" ? "selected" : ""}>??????????????????</option>
									<option value="????????????" ${h.jianyanjielun == "????????????" ? "selected" : ""}>????????????</option>
									<option value="????????????" ${h.jianyanjielun == "????????????" ? "selected" : ""}>????????????</option>
									<option value="??????" ${h.jianyanjielun == "??????" ? "selected" : ""}>??????</option>
									<option value="?????????" ${h.jianyanjielun == "?????????" ? "selected" : ""}>?????????</option>
									<option value="???" ${h.jianyanjielun == "???" ? "selected" : ""}>???</option>
			    				</select>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].jigoumingcheng" value="${h.jigoumingcheng}"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].xiacijianyanriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${h.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>"/>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="${i.index}" name="ylgd_hzb_list[${i.index}].beizhu" value="${h.beizhu}"/>
			    			</td>
			    			<td>
			    				<a href="javascript:void(0)" onclick="delRow(this)">??????</a>
			    			</td>
			    		</tr>
		    			</c:forEach>
		    		</table>
		    		<table style="width: 100%">
		    			<tr>
		    				<th style="border: none;">???????????????</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_tianbiaoriqi" class="ui-input long98" onclick="WdatePicker()" value="<fmt:formatDate value='${register.hzb_tianbiaoriqi}' pattern='yyyy-MM-dd'/>" />
		    				</td>
		    				<th style="border: none;">????????????</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_jingbanren" class="ui-input long98" value="${register.hzb_jingbanren}" />
		    				</td>
		    				<th style="border: none;">???????????????</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_lianxidianhua" class="ui-input long98" value="${register.hzb_lianxidianhua}" />
		    				</td>
		    				<th style="border: none;">???????????????</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_dianziyouxiang" class="ui-input long98" value="${register.hzb_dianziyouxiang}" />
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
	
	$("#djlb").selectmenu();
	var hzbnum = "${fn:length(hzbList)}";
	//??????????????????
	 function delRow(obj){  
  		if($("#hzb").find("tr").length == 4){
			$.dialog.alert('???????????????????????????!');
			return false;
  		}
        var tr=obj.parentNode.parentNode;  
        var tbody=tr.parentNode;  
        tbody.removeChild(tr);
     } 
	
	$().ready(function(){
		
		if("${register.tjstate}" == "1" || "${register.tjstate}" == "2"){
			$("#mnubtn_zcdj_edit_tj").hide();
			$("#mnubtn_zcdj_edit_save").hide();
		}
		
			$("#tab_conbox").find("li").hide();
			$("#tabs").find("li:first").addClass("thistab").show(); 
			$("#tab_conbox").find("li:first").show();
			$("#tabs").find("li").bind("click",function(){
			  $(this).addClass("thistab").siblings("li").removeClass("thistab"); 
				var activeindex = $("#tabs").find("li").index(this);
				$("#tab_conbox").children().eq(activeindex).show().siblings().hide();
				return false;
			});
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			//?????????????????????
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"8000"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie,yzc_shebeipinzhong",data.dirDatas,"200px",true,"<%=path%>");
			},"JSON");
			
		if("${register.fj_filepath}" != ""){
			var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\'${register.fj_filepath}\')">????????????</a>';
			$("#zcdjb_fj_${uuid}").html(down);
		}
		//??????
		$("#mnubtn_zcdj_edit_tj").click(function(){
			$.dialog.confirm("????????????????????????????????????????????????????!", function(){
				save("2");
			});
		});
		//????????????
		$("#mnubtn_zcdj_edit_save").click(function(){
			save("0");
			return false;
		});
		
		//???????????????
		$("#mnubtn_baseInfo_edit_djb_xz").click(function(){
			var path = $("#zcdjb_filepath_${uuid}").attr("value");
			if(path == ""){
				$.dialog.alert('???????????????????????????????????????????????????');
				return false;
			}else{
				parent.downloadFile(path);
			}
		});
		//??????
		$("#mnubtn_jcsj_zcdj_edit_dy${uuid}").click(function(){
			var id = $("#reg_id_${uuid}").attr("value");
			//openwindow("<%=path%>/jsp/biz/sbxx/zcdj/PrintPage.html?urls="+id+"&bglx=yl",400,200);
			window.open ('<%=path%>/register!djbDyByJsp.do?id='+id,'?????????????????????','height=500,width=650,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no'); 
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
	
			//???window.open?????????????????????
			function openwindow(url,iWidth,iHeight) {
				var iTop = (window.screen.availHeight-30-iHeight)/2; //???????????????????????????;
				var iLeft = (window.screen.availWidth-10-iWidth)/2; //???????????????????????????;
				var i=window.open("","????????????",'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
				setTimeout(function(){
					i.location=url;
				}, 600);
			}
			function save(tjstate){
				var options = {
				    url:"<%=path%>/register!update.do?tjstate="+tjstate,
					dataType:'json',
		            beforeSubmit:function(formData, jqForm, options){
				    		//if( !verifyCode() ){ return false;};
				    	if(!verifySelect()){ return false;}
						if($("#frm_zcdj_edit${uuid}").validate().form()){
							parent.showMask("????????????......");
							return true;
						}
						return false;
		           	},
		            success:function(rsp, statusText, xhr, $form){
		            	parent.hideMask();
		            	parent.frames["${param.fid}"].reloadGrid();
		            	if(rsp.msg == "SUCCESS"){
							if(tjstate == '2'){
		            			$.dialog.tips('<font color="blue">???????????????????????????</font>',3,'success.gif');
		            		}else{
		            			$.dialog.tips('<font color="blue">???????????????</font>',3,'success.gif');
		            		}
						    $("#zcdjb_filepath_hid_${uuid}").attr("value",rsp.fjpath);
						    if(rsp.fjpath != ""){
						    	var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\''+rsp.fjpath.replace(/\\/g,"/")+'\')">????????????</a>';
						    	$("#zcdjb_fj_${uuid}").html(down);
						    }
						    $("#zcdjb_fj_input_${uuid}").html($("#zcdjb_fj_input_${uuid}").html());
						    if(tjstate == "2"){
								$("#mnubtn_zcdj_edit_tj").hide();
								$("#mnubtn_zcdj_edit_save").hide();
							}
		            	}else if(rsp.msg == "OUTSIZE"){
							$.dialog.tips('<font color="blue">????????????????????????????????????</font>',3,'success.gif');
		            	}else{
							$.dialog.tips('<font color="blue">???????????????!</font>',3,'error.gif');
		            	}
		            }
		         };
		         $("#frm_zcdj_edit${uuid}").ajaxSubmit(options);
		         return false;
			}
			
			//??????????????????
	function verifyCode(){
		var code = $('#reg_add').val();
		var flag = false;
		$.ajax({
		   type: "POST",
		   url: "<%=path%>/se!findSeCode.do",
		   data:'code='+code,
		   dataType:"json",
		   async: false,
		   success: function(data, textStatus){
		   		if(data.count>0){
		   			$.dialog.alert('?????????????????????');
		   		}else{
		   			flag = true;
		   		}
		   }
		});
		return flag;
	}
			
	//??????select ????????????
	function verifySelect(){
		var s = $('#shi').val();
		var q = $('#quxian').val();
		var sblb = $("#yzc_shebeileibie").val();
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
		if(sblb == ""){
			$("#yzc_shebeileibie_div  p").show();
			flag = false;
		}else{
			$("#yzc_shebeileibie_div  p").hide();
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