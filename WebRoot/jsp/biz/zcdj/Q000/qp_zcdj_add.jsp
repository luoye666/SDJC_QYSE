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
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_add_save">保存</a>
	  </div>

<form id="frm_zcdj_add${uuid}" method="post">
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
	                	 <input type="hidden" name="register.filepath"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="气瓶"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="${param.zldm}"/>
	                	 <input type="hidden" name="register.shebeileibie" value="气瓶"/>
	                	 <input type="hidden" name="register.shebeileibiedaima" value="Q200"/>
	                	 <input type="hidden" name="register.tjstate" value="0"/>
	                	 <input type="hidden" name="register.shiyongdanwei" value="${register.shiyongdanwei}" id="reg_add_sydw"/>
	                </div>
					<div>
						<table>
							<tr>
								<th>登记类别：</th>
								<td>
									<select style="width:200px" name="register.dengjileibie" id="djlb">
										<option value=""></option>
										<option value="新设备首次启用">新设备首次启用</option>
										<option value="停用后启用">停用后启用</option>
										<option value="改造">改造</option>
										<option value="使用单位更名">使用单位更名</option>
										<option value="使用地址变更">使用地址变更</option>
										<option value="过户">过户</option>
										<option value="移装">移装</option>
										<option value="达到设计使用年限">达到设计使用年限</option>
									</select>
								</td>
							</tr>
						</table>
						<table class="tabjcxx">
							<tr>
								<th rowspan="2" style="width: 10%">设备基本情况</th>
								<th style="width: 15%">设备类别</th>
								<td style="width: 35%">
									气瓶
								</td>
								<th style="width: 20%">设备品种</th>
								<td style="width: 20%">
									<div id="yzc_shebeipinzhong_div" onclick="delay()">
					    				<select class="long98" name="register.shebeipinzhongdaima" id="yzc_shebeipinzhong"></select>
									</div>
					    		</td>
							</tr>
							<tr>
								<th>产品名称</th>
								<td>
									<input class="ui-input long98" name="register.shebeimingcheng" />
					    		</td>
								<th>设备数量</th>
								<td>
									<input class="ui-input long98" name="register.shebeishuliang" />
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
									<div id="shi_div" onclick="delay()">
										<select class="long98" sltValue="${register.shiyongdanweidizhi_shi_daima}" name="register.shiyongdanweidizhi_shi_daima" id="shi"></select>
									</div>
								</td>
								<th>区县</th>
								<td >
									<div id="quxian_div" onclick="delay()">
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
									<input class="ui-input long98" name="register.sydw_gudingdianhua" />
								</td>
							</tr>
							<tr>
								<th>使用单位统一社会</br>信用代码</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdanweidaima" />
								</td>
								<th>邮政编码</th>
								<td>
									<input class="ui-input long98" name="register.sydw_youzhengbianma" value="${register.sydw_youzhengbianma}" />
								</td>
							</tr>
							<tr>
								<th>安全管理人员</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlirenyuan"/>
								</td>
								<th>移动电话</th>
								<td>
									<input class="ui-input long98" name="register.aqglry_lianxidianhua" />
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div style="text-align: left;">
										    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在此申明：所申报的内容真实；在使用过程中，将严格执行《中华人民共和国特种设备安全法》及相关规定，并且接受特种设备安全监督管理部门的监督管理。
									</div>
									<div style="text-align: left;">
										 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;附：气瓶基本信息汇总表
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">使用单位填表人员：</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.tianbiaorenyuan" />
											</td>
											<td style="width: 10%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.tianbiaoriqi" onclick="WdatePicker()" />
											</td>
											<td style="width: 20%">(使用单位公章)</td>
										</tr>
										<tr>
											<td>使用单位安全管理人员：</td>
											<td></td>
											<td>日期：</td>
											<td>
												<input class="ui-input long98" name="register.aqglry_riqi" onclick="WdatePicker()" />
											</td>
											<td><input class="ui-input long98" name="register.shiyongdanwei_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div style="text-align: left;">
										说明：<textarea rows="3" style="width: 98%" name="register.beizhu"></textarea>
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">登记机关登记人员：</td>
											<td style="width: 15%">
												<input class="ui-input long98" name="register.zhucedengjirenyuan" />
											</td>
											<td style="width: 20%">日期：</td>
											<td style="width: 20%">
												<input class="ui-input long98" name="register.zhucedengjiriqi" onclick="WdatePicker()" required="required" />
											</td>
											<td style="width: 20%">（登记机关专用章）</td>
										</tr>
										<tr>
											<td>使用登记证编号：</td>
											<td>
											</td>
											<td>登记机关</td>
											<td>
												<input class="ui-input long98" name="register.zhucedengjijigou" />
											</td>
											<td><input class="ui-input long98" name="register.dengjijiguan_nyr" onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})"/></td>
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
		   				气瓶基本信息汇总表
		   			</div>
		   			<br/>
	    			<a class="ui-btn ui-btn-sp" id="hzb_add">增加行</a>
	    			<br/>
		    		<table class="tabjcxx" id="hzb" style="width: 100%">
		    			<tr>
		    				<th style="width: 5%">设备品种</th>
		    				<th style="width: 5%">产品编号</th>
		    				<th style="width: 5%">充装介质</th>
		    				<th style="width: 5%">制造单位</th>
		    				<th style="width: 5%">制造年月</th>
		    				<th style="width: 5%">公称工作压力(MPa)</th>
		    				<th style="width: 5%">容积(L)</th>
		    				<th style="width: 5%">最近一次检验日期 </th>
		    				<th style="width: 5%">下次检验日期</th>
		    				<th style="width: 5%">单位内编号</th>
		    				<th style="width: 5%">变更或者停用情况</th>
		    				<th style="width: 7%">信息化管理情况</th>
		    				<th style="width: 3%">操作</th>
		    			</tr>
		    			<tr>
			    			<td>
			    				<select inum="0" name="qp_hzb_list[0].shebeipinzhong">
			    					<option value="无缝气瓶">无缝气瓶</option>
			    					<option value="焊接气瓶">焊接气瓶</option>
			    					<option value="内装填料气瓶">内装填料气瓶</option>
			    					<option value="纤维缠绕气瓶">纤维缠绕气瓶</option>
			    					<option value="低温绝热气瓶">低温绝热气瓶</option>
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
			    					<option value="新增">新增</option>
			    					<option value="停用">停用</option>
			    					<option value="注销">注销</option>
			    					<option value="报废">报废</option>
			    				</select>
			    			</td>
			    			<td>
			    				<input class="ui-input" inum="0" name="qp_hzb_list[0].xinxihua"/>
			    			</td>
			    			<td>
			    				<a href="javascript:void(0)" onclick="delRow(this)">删除</a>
			    			</td>
			    		</tr>
		    		</table>
		    		<table style="width: 100%">
		    			<tr>
		    				<th style="border: none;">填表日期：</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_tianbiaoriqi" class="ui-input long98" onclick="WdatePicker()" />
		    				</td>
		    				<th style="border: none;">经办人：</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_jingbanren" class="ui-input long98" />
		    				</td>
		    				<th style="border: none;">联系电话：</th>
		    				<td style="border: none;">
		    					<input name="register.hzb_lianxidianhua" class="ui-input long98" />
		    				</td>
		    				<th style="border: none;">电子邮箱：</th>
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
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"Q200"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeipinzhong",data.dirDatas,"200px",false,"<%=path%>");
			},"JSON");
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			
		//提交表单
		$("#mnubtn_zcdj_add_save${uuid}").click(function(){
			var options = {
			    url:"<%=path%>/register!save.do?gzid=${gzid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
				    if(!verifySelect()){ return false;}
					if($("#frm_zcdj_add${uuid}").validate().form()){
						parent.showMask("正在保存......");
						return true;
					}
			    	return false;
	           	},
	            success:function(rsp, statusText, xhr, $form){
	            	parent.hideMask();
	            	if(rsp.success){
						$.dialog.tips('<font color="blue">保存成功!</font>',3,'success.gif');
	            		parent.frames["${param.fid}"].reloadGrid();
						parent.addTabsItem("add_djb_${param.zldm}",rsp.sydw+"_登记表_"+rsp.id,"<%=path%>/register!openZcdjbById.do?id="+rsp.id+"&zldm=${param.zldm}&fid=${param.fid}");
	            	}else{
						$.dialog.tips('<font color="blue">保存不成功!</font>',3,'error.gif');
	            	}
	            }
	         };
	         $("#frm_zcdj_add${uuid}").ajaxSubmit(options);
	         return false;
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
	
  	//验证注册代码和使用单位
  	function checkZcdmDw(){
  		var result = false;
  		var zcdm = $("#reg_add").val();
  		var sydw = $("#reg_add_sydw").val();
  		if(zcdm.length < 17 || zcdm.length > 20){
			$.dialog.alert('注册代码位数不正确!');
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
					$.dialog.alert('注册代码重复!');
		   		}else{
		   			result = true;
		   		}
		   }
		});
  		return result;
  	}
  	function delRow(obj){
  		if($("#hzb").find("tr").length == 2){
			$.dialog.alert('该表格至少保留一行!');
			return false;
  		}
        var tr=obj.parentNode.parentNode;  
        var tbody=tr.parentNode;  
        tbody.removeChild(tr);
   } 
	//验证select 是否有值
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