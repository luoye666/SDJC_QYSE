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
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_edit_save">保存</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_edit_tj">提交至审核</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_zcdj_edit_dy">打印</a>
	  </div>
	  
		    	<form id="frm_zcdj_edit${uuid}" method="post" enctype="multipart/form-data">
<div id="tabbox">
    <ul class="tabs" id="tabs">
       <li><a href="javascript:void(0)">登记表</a></li>
       <li><a href="javascript:void(0)">汇总表</a></li>
    </ul>
    <ul class="tab_conbox" id="tab_conbox">
        <li class="tab_con">
        
	<div class="wrapper">
	   		<div>
		   			<div style="width: 80%;text-align: center;font-size: 30px">
		   				特种设备使用登记表
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
								<th>登记类别：</th>
								<td>
									<select style="width:200px" name="register.dengjileibie" id="djlb">
										<option value=""></option>
										<option value="新设备首次启用" ${register.dengjileibie == "新设备首次启用" ? "selected" : ""}>新设备首次启用</option>
										<option value="停用后启用" ${register.dengjileibie == "停用后启用" ? "selected" : ""}>停用后启用</option>
										<option value="改造" ${register.dengjileibie == "改造" ? "selected" : ""}>改造</option>
										<option value="使用单位更名" ${register.dengjileibie == "使用单位更名" ? "selected" : ""}>使用单位更名</option>
										<option value="使用地址变更" ${register.dengjileibie == "使用地址变更" ? "selected" : ""}>使用地址变更</option>
										<option value="过户" ${register.dengjileibie == "过户" ? "selected" : ""}>过户</option>
										<option value="移装" ${register.dengjileibie == "移装" ? "selected" : ""}>移装</option>
										<option value="达到设计使用年限" ${register.dengjileibie == "达到设计使用年限" ? "selected" : ""}>达到设计使用年限</option>
									</select>
								</td>
							</tr>
						</table>
						<table class="tabjcxx">
							<tr>
								<th rowspan="2" style="width: 10%">设备基本情况</th>
								<th style="width: 15%">设备类别</th>
								<td style="width: 35%">
									<div id="yzc_shebeileibie_div">
										<select name="register.shebeileibiedaima" sltValue="${register.shebeileibiedaima}" class="long98" id="yzc_shebeileibie"></select>
									</div>
								</td>
								<th style="width: 20%">设备品种</th>
								<td style="width: 20%">
									<div id="yzc_shebeipinzhong_div">
					    				<select class="long98" name="register.shebeipinzhongdaima" sltValue="${register.shebeipinzhongdaima}" id="yzc_shebeipinzhong"></select>
									</div>
					    		</td>
							</tr>
							<tr>
								<th>产品名称</th>
								<td>
									<input class="ui-input long98" name="register.shebeimingcheng" value="${register.shebeimingcheng}" />
					    		</td>
								<th>设备数量</th>
								<td>
									<input class="ui-input long98" name="register.shebeishuliang" value="${register.shebeishuliang}" />
								</td>
							</tr>
							<tr>
								<th rowspan="7" style="width: 10%">设备使用情况</th>
								<th>使用单位名称</th>
								<td colspan="3">
									${register.shiyongdanwei}
								</td>
							</tr>
							<tr>
								<th>使用单位地址</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.shiyongdanweidizhi" value="${register.shiyongdanweidizhi}" />
								</td>
							</tr>
							<tr>
								<th>市</th>
								<td>
									<div id="shi_div">
										<select class="long98" sltValue="${register.shiyongdanweidizhi_shi_daima}" name="register.shiyongdanweidizhi_shi_daima" id="shi"></select>
									</div>
								</td>
								<th>区县</th>
								<td >
									<div id="quxian_div">
										<select class="long98" sltValue="${register.shiyongdanweidizhi_qu_daima}" name="register.shiyongdanweidizhi_qu_daima" id="quxian"></select>
									</div>
								</td>
							</tr>
							<tr>
								<th>乡镇</th>
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
								<th>设备使用地点</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdidian" value="${register.shiyongdidian}" />
								</td>
								<th>单位固定电话</th>
								<td>
									<input class="ui-input long98" name="register.sydw_gudingdianhua" value="${register.sydw_gudingdianhua}" />
								</td>
							</tr>
							<tr>
								<th>使用单位统一社会</br>信用代码</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdanweidaima" value="${register.shiyongdanweidaima}" />
								</td>
								<th>邮政编码</th>
								<td>
									<input class="ui-input long98" name="register.sydw_youzhengbianma" value="${register.sydw_youzhengbianma}" />
								</td>
							</tr>
							<tr>
								<th>安全管理人员</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlirenyuan" value="${register.anquanguanlirenyuan}"/>
								</td>
								<th>移动电话</th>
								<td>
									<input class="ui-input long98" name="register.aqglry_lianxidianhua" value="${register.aqglry_lianxidianhua}" />
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div style="text-align: left;">
										    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在此申明：所申报的内容真实；在使用过程中，将严格执行《中华人民共和国特种设备安全法》及相关规定，并且接受特种设备安全监督管理部门的监督管理。
									</div>
									<div style="text-align: left;">
										 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;附：压力管道基本信息汇总表
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">使用单位填表人员：</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.tianbiaorenyuan" value="${register.tianbiaorenyuan}" />
											</td>
											<td style="width: 10%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.tianbiaoriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.tianbiaoriqi}' pattern='yyyy-MM-dd'/>" />
											</td>
											<td style="width: 20%">(使用单位公章)</td>
										</tr>
										<tr>
											<td>使用单位安全管理人员：</td>
											<td>${register.anquanguanlirenyuan}</td>
											<td>日期：</td>
											<td>
												<input class="ui-input long98" name="register.aqglry_riqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.aqglry_riqi}' pattern='yyyy-MM-dd'/>" />
											</td>
											<td><input class="ui-input long98" name="register.shiyongdanwei_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})" value="${register.shiyongdanwei_nyr}"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div style="text-align: left;">
										说明：<textarea rows="3" style="width: 98%" name="register.beizhu">${register.beizhu}</textarea>
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">登记机关登记人员：</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.zhucedengjirenyuan" value="${register.zhucedengjirenyuan}" />
											</td>
											<td style="width: 20%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.zhucedengjiriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.zhucedengjiriqi}' pattern='yyyy-MM-dd'/>" required="required"/>
											</td>
											<td style="width: 20%">（登记机关专用章）</td>
										</tr>
										<tr>
											<td>使用登记证编号：</td>
											<td>
												${register.shiyongdengjizhenghaoma}
											</td>
											<td>登记机关</td>
											<td>
												<input class="ui-input long98" name="register.zhucedengjijigou" value="${register.zhucedengjijigou}"/>
											</td>
											<td><input class="ui-input long98" name="register.dengjijiguan_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})" value="${register.dengjijiguan_nyr}"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<th>附件</th>
								<td>
									<div id="zcdjb_fj_${uuid}" style="text-align: center;">没有附件</div>
								</td>
								<td colspan="4">
									<div id="zcdjb_fj_input_${uuid}" style="display: inline;">
										<input type="file" style="width: 70%" name="uploadify"/>
									</div>
									(不能大于10M)
								</td>
							</tr>
						</table>
		   			</div>
		    </div>
		</div>
        </li>
            
        <li class="tab_con">
		  
		   			<div style="width: 100%;text-align: center;font-size: 30px;">
		   				压力管道基本信息汇总表--工业管道
		   			</div>
		   			<br/>
	    			<a class="ui-btn ui-btn-sp" id="hzb_add">增加行</a>
	    			<br/>
	    			<br/>
		    		<table class="tabjcxx" id="hzb" style="width: 100%">
		    			<tr>
		    				<th colspan="3" style="border: none;">工程(装置)名称：</th>
		    				<td colspan="4" style="border: none;text-align: left;">
	    						<input name="register.gongchengmingcheng" value="${register.gongchengmingcheng}" class="ui-input" style="width: 80%" />
		    				</td>
		    				<th colspan="3" style="border: none;">安全管理部门：</th>
		    				<td colspan="9" style="border: none;text-align: left;">
	    						<input name="register.anquanguanlibumen" value="${register.anquanguanlibumen}" class="ui-input" style="width: 50%" />
		    				</td>
		    			</tr>
		    			<tr>
		    				<th rowspan="2" style="width: 2%">序号</th>
		    				<th rowspan="2" style="width: 5%">管道名称(登记单元)</th>
		    				<th rowspan="2" style="width: 5%">管道编号</th>
		    				<th rowspan="2" style="width: 5%">管道级别</th>
		    				<th rowspan="2" style="width: 5%">设计单位</th>
		    				<th rowspan="2" style="width: 5%">安装单位</th>
		    				<th rowspan="2" style="width: 5%">安装年月</th>
		    				<th rowspan="2" style="width: 5%">投用年月</th>
		    				<th colspan="3" style="width: 5%">管道规格</th>
		    				<th colspan="3" style="width: 5%">设计/工作条件</th>
		    				<th rowspan="2" style="width: 5%">检验结论</th>
		    				<th rowspan="2" style="width: 5%">检验机构名称</th>
		    				<th rowspan="2" style="width: 7%">下次检验日期</th>
		    				<th rowspan="2" style="width: 5%">备注</th>
		    				<th rowspan="2" style="width: 3%">操作</th>
		    			</tr>
		    			<tr>
		    				<th style="width: 5%">公称直径(mm)</th>
		    				<th style="width: 5%">公称壁厚(mm)</th>
		    				<th style="width: 5%">管道长度(m)</th>
		    				<th style="width: 5%">压力(MPa)</th>
		    				<th style="width: 5%">温度(℃)</th>
		    				<th style="width: 5%">介质</th>
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
									<option value="允许运行" ${h.jianyanjielun == "允许运行" ? "selected" : ""}>允许运行</option>
									<option value="整改后运行" ${h.jianyanjielun == "整改后运行" ? "selected" : ""}>整改后运行</option>
									<option value="限制条件运行" ${h.jianyanjielun == "限制条件运行" ? "selected" : ""}>限制条件运行</option>
									<option value="停止运行" ${h.jianyanjielun == "停止运行" ? "selected" : ""}>停止运行</option>
									<option value="监督运行" ${h.jianyanjielun == "监督运行" ? "selected" : ""}>监督运行</option>
									<option value="合格" ${h.jianyanjielun == "合格" ? "selected" : ""}>合格</option>
									<option value="不合格" ${h.jianyanjielun == "不合格" ? "selected" : ""}>不合格</option>
									<option value="无" ${h.jianyanjielun == "无" ? "selected" : ""}>无</option>
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
			    				<a href="javascript:void(0)" onclick="delRow(this)">删除</a>
			    			</td>
			    		</tr>
		    			</c:forEach>
		    		</table>
		    		<table style="width: 100%">
		    			<tr>
		    				<th style="border: none;">填表日期：</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_tianbiaoriqi" class="ui-input long98" onclick="WdatePicker()" value="<fmt:formatDate value='${register.hzb_tianbiaoriqi}' pattern='yyyy-MM-dd'/>" />
		    				</td>
		    				<th style="border: none;">经办人：</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_jingbanren" class="ui-input long98" value="${register.hzb_jingbanren}" />
		    				</td>
		    				<th style="border: none;">联系电话：</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_lianxidianhua" class="ui-input long98" value="${register.hzb_lianxidianhua}" />
		    				</td>
		    				<th style="border: none;">电子邮箱：</th>
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
	//编辑行的下标
	 function delRow(obj){  
  		if($("#hzb").find("tr").length == 4){
			$.dialog.alert('该表格至少保留一行!');
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
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"8000"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie,yzc_shebeipinzhong",data.dirDatas,"200px",true,"<%=path%>");
			},"JSON");
			
		if("${register.fj_filepath}" != ""){
			var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\'${register.fj_filepath}\')">下载附件</a>';
			$("#zcdjb_fj_${uuid}").html(down);
		}
		//提交
		$("#mnubtn_zcdj_edit_tj").click(function(){
			$.dialog.confirm("确定要提交至审核吗?提交后将不能修改!", function(){
				save("2");
			});
		});
		//保存表单
		$("#mnubtn_zcdj_edit_save").click(function(){
			save("0");
			return false;
		});
		
		//下载登记表
		$("#mnubtn_baseInfo_edit_djb_xz").click(function(){
			var path = $("#zcdjb_filepath_${uuid}").attr("value");
			if(path == ""){
				$.dialog.alert('未找到源文件，该登记表可能是新建的');
				return false;
			}else{
				parent.downloadFile(path);
			}
		});
		//打印
		$("#mnubtn_jcsj_zcdj_edit_dy${uuid}").click(function(){
			var id = $("#reg_id_${uuid}").attr("value");
			//openwindow("<%=path%>/jsp/biz/sbxx/zcdj/PrintPage.html?urls="+id+"&bglx=yl",400,200);
			window.open ('<%=path%>/register!djbDyByJsp.do?id='+id,'登记表打印窗口','height=500,width=650,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no'); 
		});
		//添加行
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
	
			//使window.open弹出的窗口居中
			function openwindow(url,iWidth,iHeight) {
				var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
				var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
				var i=window.open("","批量打印",'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
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
							parent.showMask("正在保存......");
							return true;
						}
						return false;
		           	},
		            success:function(rsp, statusText, xhr, $form){
		            	parent.hideMask();
		            	parent.frames["${param.fid}"].reloadGrid();
		            	if(rsp.msg == "SUCCESS"){
							if(tjstate == '2'){
		            			$.dialog.tips('<font color="blue">已成功提交至审核！</font>',3,'success.gif');
		            		}else{
		            			$.dialog.tips('<font color="blue">保存成功！</font>',3,'success.gif');
		            		}
						    $("#zcdjb_filepath_hid_${uuid}").attr("value",rsp.fjpath);
						    if(rsp.fjpath != ""){
						    	var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\''+rsp.fjpath.replace(/\\/g,"/")+'\')">下载附件</a>';
						    	$("#zcdjb_fj_${uuid}").html(down);
						    }
						    $("#zcdjb_fj_input_${uuid}").html($("#zcdjb_fj_input_${uuid}").html());
						    if(tjstate == "2"){
								$("#mnubtn_zcdj_edit_tj").hide();
								$("#mnubtn_zcdj_edit_save").hide();
							}
		            	}else if(rsp.msg == "OUTSIZE"){
							$.dialog.tips('<font color="blue">保存成功！附件上传失败！</font>',3,'success.gif');
		            	}else{
							$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
		            	}
		            }
		         };
		         $("#frm_zcdj_edit${uuid}").ajaxSubmit(options);
		         return false;
			}
			
			//验证注册代码
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
		   			$.dialog.alert('注册代码重复！');
		   		}else{
		   			flag = true;
		   		}
		   }
		});
		return flag;
	}
			
	//验证select 是否有值
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
	
	//对select 进行追加元素 p
	function appendSelTo(){
		var divS = $('td > div');
		for(var i=0;i<divS.length-1;i++){
			$("<p>不能为空</p>").appendTo(divS[i]);
		}
	}
	
	//对select 选中数据后延迟执行方法
	function delay(){
		
		setTimeout(function(){verifySelect()},3000);
	}
	</script> 