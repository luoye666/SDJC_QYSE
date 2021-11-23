<%@page import="com.stone.para.IConstant"%>
<%@page import="com.stone.sys.pojo.TUser"%>
<%@page import="com.stone.sys.pojo.TOrgan"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ taglib prefix="c" uri="/c.tld" %>
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
</style>
</head>
<body>
	<div class="wrapper">
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_edit_save">保存</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_edit_tj">提交至审核</a>
	    <a class="ui-btn ui-btn-sp" id="mnubtn_jcsj_zcdj_edit_dy">打印</a>
	  </div>
	   		<div>
		    	<form id="frm_zcdj_edit${uuid}" method="post" enctype="multipart/form-data">
		   			<div style="width: 80%;text-align: center;font-size: 30px">
		   				特种设备使用登记表
		   			</div>
		   			<br/>
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.id" id="reg_id_${uuid}" value="${register.id}"/>
	                	 <input type="hidden" name="register.filepath" id="zcdjb_filepath_${uuid}" value="${register.filepath}"/>
	                	 <input type="hidden" name="register.fj_filepath" id="zcdjb_filepath_hid_${uuid}" value="${register.fj_filepath}"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="压力管道"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="8000"/>
	                	 <input type="hidden" name="register.tjstate" value="${register.tjstate}"/>
	                	 <input type="hidden" name="register.organ_code" value="${register.organ_code}"/>
	                	 <input type="hidden" name="register.creat_user" value="${register.creat_user}"/>
	                	 <input type="hidden" name="register.wtg_yuanyin" value="${register.wtg_yuanyin}"/>
						 <input type="hidden" name="register.shiyongdanwei" id="reg_add_sydw" value="${register.shiyongdanwei}"/>
	                </div>
					<div>
						编号：<input class="ui-input" style="width:160px;" name="register.shiyongdengjizhenghaoma" value="${register.shiyongdengjizhenghaoma}" />
						<table class="tabjcxx">
							<tr>
								<th>使用单位</th>
								<td colspan="3">
									${register.shiyongdanwei}
								</td>
								<th>使用单位地址</th>
								<td>
									<input class="ui-input long98" name="register.shiyongdanweidizhi" value="${register.shiyongdanweidizhi}" />
								</td>
							</tr>
							<tr>
								<th>市</th>
								<td colspan="3" style="text-align: left;">
									<div id="shi_div" onclick="delay()">
										<select style="width:150px" sltValue="${register.shiyongdanweidizhi_shi_daima}" name="register.shiyongdanweidizhi_shi_daima" id="shi"></select>
									</div>
								</td>
								<th >区县</th>
								<td style="text-align: left;">
									<div id="quxian_div" onclick="delay()">
										<select style="width:150px" sltValue="${register.shiyongdanweidizhi_qu_daima}" name="register.shiyongdanweidizhi_qu_daima" id="quxian"></select>
									</div>
								</td>
							</tr>
							<tr>
								<th>乡镇</th>
								<td colspan="3" style="text-align: left;">
									<div id="xiangzhen_div" >
										<select style="width:150px" sltValue="${register.suozaixiangzhen_daima}" name="register.suozaixiangzhen_daima" id="xiangzhen"></select>
									</div>
								</td>
								<th ></th>
								<td >
								</td>
							</tr>
							<tr>
								<th>主管部门</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhuguanbumen" value="${register.zhuguanbumen}"/>
								</td>
								<th>行业</th>
								<td>
									<input class="ui-input long98" name="register.suoshuhangye" value="${register.suoshuhangye}" />
								</td>
							</tr>
							<tr>
								<th>联系电话</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhuguanfuzerendianhua" value="${register.zhuguanfuzerendianhua}"/>
								</td>
								<th>安全管理部门</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlibumen" value="${register.anquanguanlibumen}" />
								</td>
							</tr>
							<tr>
								<th>安全管理人员</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.anquanguanlirenyuan" value="${register.anquanguanlirenyuan}" />
								</td>
								<th>经办人</th>
								<td>
									<input class="ui-input long98" name="register.jingbanren" value="${register.jingbanren}" />
								</td>
							</tr>
							<tr>
								<th>压力管道类别</th>
								<td colspan="3" style="text-align: left;">
									<div id="yzc_shebeileibie_div">
										<select name="register.shebeileibiedaima" sltValue="${register.shebeileibiedaima}" style="width:150px" id="yzc_shebeileibie"></select>
									</div>
								</td>
								<th>工程(装置)名称</th>
								<td>
									<input class="ui-input long98" name="register.gongchengmingcheng" value="${register.gongchengmingcheng}" />
								</td>
							</tr>
							<tr>
								<th>设计单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.shejidanwei" value="${register.shejidanwei}" />
								</td>
								<th>设计单位代码</th>
								<td>
									<input class="ui-input long98" name="register.shejidanweidaima" value="${register.shejidanweidaima}" />
								</td>
							</tr>
							<tr>
								<th>安装单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.anzhuangdanwei" value="${register.anzhuangdanwei}" />
								</td>
								<th>安装单位代码</th>
								<td>
									<input class="ui-input long98" name="register.anzhuangdanweidaima" value="${register.anzhuangdanweidaima}" />
								</td>
							</tr>
							<tr>
								<th style="width: 13%">竣工验收日期</th>
								<td style="width: 20%">
									<input class="ui-input long98" name="register.jungongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.jungongriqi}' pattern='yyyy-MM-dd'/>" />
								</td>
								<th style="width: 10%">投用日期(日期)</th>
								<td style="width: 20%">
									<input class="ui-input long98" name="register.touyongriqi" onclick="WdatePicker()" value="<fmt:formatDate value='${register.touyongriqi}' pattern='yyyy-MM-dd'/>" />
								</td>
								<th style="width: 15%">管道规格</th>
								<td style="width: 22%">
									<input class="ui-input long98" name="register.guandaoguige" value="${register.guandaoguige}"/>
								</td>
							</tr>
							<tr>
								<th>管道名称</th>
								<td>
									<input class="ui-input long98" name="register.shebeimingcheng" value="${register.shebeimingcheng}"/>
								</td>
								<th>投用日期(文本)</th>
								<td>
									<input class="ui-input long98" name="register.touyongriqi_str" value="${register.touyongriqi_str}" />
								</td>
								<th>管道编号</th>
								<td>
									<input class="ui-input long98" name="register.guandaobianhao" value="${register.guandaobianhao}"/>
								</td>
							</tr>
							<tr>
								<th>公称直径(mm)</th>
								<td>
									<input class="ui-input long98" name="register.gongchengzhijing" value="${register.gongchengzhijing}"/>
								</td>
								<th>公称壁厚(mm)</th>
								<td>
									<input class="ui-input long98" name="register.gongchengbihou" value="${register.gongchengbihou}"/>
								</td>
								<th>管道级别</th>
								<td>
									<input class="ui-input long98" name="register.guandaojibie" value="${register.guandaojibie}"/>
								</td>
							</tr>
							<tr>
								<th>设计压力(Mpa)</th>
								<td>
									<input class="ui-input long98" name="register.shejiyali" value="${register.shejiyali}"/>
								</td>
								<th>设计温度(℃)</th>
								<td>
									<input class="ui-input long98" name="register.shejiwendu" value="${register.shejiwendu}"/>
								</td>
								<th>管道长度(km)</th>
								<td>
									<input class="ui-input long98" name="register.guandaochangdu" value="${register.guandaochangdu}"/>
								</td>
							</tr>
							<tr>
								<th>最高工作压力(Mpa)</th>
								<td>
									<input class="ui-input long98" name="register.gongzuoyali" value="${register.gongzuoyali}"/>
								</td>
								<th>最高工作温度(℃)</th>
								<td>
									<input class="ui-input long98" name="register.gongzuowendu" value="${register.gongzuowendu}"/>
								</td>
								<th>输送介质</th>
								<td>
									<input class="ui-input long98" name="register.shusongjiezhi" value="${register.shusongjiezhi}"/>
								</td>
							</tr>
							<tr>
								<th>是否重要管道</th>
								<td>
									<input class="ui-input long98" name="register.shifouzhongyaoguandao" value="${register.shifouzhongyaoguandao}"/>
								</td>
								<th>所属车间</th>
								<td>
									<input class="ui-input long98" name="register.chejianfenchang" value="${register.chejianfenchang}" />
								</td>
								<th>检验结论</th>
								<td>
									<s:select style="width: 179px" id="jyjl" name="register.jianyanjielun" list="#{'允许运行':'允许运行','整改后运行':'整改后运行','限制条件运行':'限制条件运行','停止运行':'停止运行','监督运行':'监督运行','合格':'合格','不合格':'不合格','无':'无'}" value="register.jianyanjielun"></s:select>
								</td>
							</tr>
							<tr>
								<th>压力管道代码</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhucedaima" value="${register.zhucedaima}" id="reg_add"/>
								</td>
								<th>检验日期</th>
								<td>
									<input class="ui-input long98" name="register.jianyanriqi" value="<fmt:formatDate value='${register.jianyanriqi}' pattern='yyyy-MM-dd'/>"  onclick="WdatePicker()"/>
								</td>
							</tr>
							<tr>
								<th>下次检验日期</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.xiacijianyanriqi" value="<fmt:formatDate value='${register.xiacijianyanriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
								</td>
								<th>固定资产值</th>
								<td>
									<input class="ui-input long98" name="register.gudingzichan" value="${register.gudingzichan}" />
								</td>
							</tr>
							<tr>
								<th>备注</th>
								<td colspan="5">
									<input class="ui-input long98" name="register.beizhu" value="${register.beizhu}" />
								</td>
							</tr>
							<tr>
								<th>审核日期</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.shenheriqi" value="<fmt:formatDate value='${register.shenheriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()" />
								</td>
								<th>登记意见</th>
								<td>
									<select name="register.shenheyijian" class="long98" id="shyj">
										<option value=""></option>
										<option value="允许使用登记，颁发《使用登记证》" ${register.shenheyijian == "允许使用登记，颁发《使用登记证》" ? "selected" : ""}>允许使用登记，颁发《使用登记证》</option>
										<option value="允许使用登记，《使用登记证》注明有效期" ${register.shenheyijian == "允许使用登记，《使用登记证》注明有效期" ? "selected" : ""}>允许使用登记，《使用登记证》注明有效期</option>
										<option value="不允许登记" ${register.shenheyijian == "不允许登记" ? "selected" : ""}>不允许登记</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>注册登记日期</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhucedengjiriqi" value="<fmt:formatDate value='${register.zhucedengjiriqi}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker()"/>
								</td>
								<th>注册登记人员</th>
								<td>
									<input class="ui-input long98" name="register.zhucedengjirenyuan" value="${register.zhucedengjirenyuan}" />
								</td>
							</tr>
							<tr>
								<th>注册登记机构</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhucedengjijigou" value="${register.zhucedengjijigou}" />
								</td>
								<th></th>
								<td></td>
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
					 <br/>
					 <div style="width: 80%;text-align: center;font-size: 30px"><br/>
		   				主要安全附件及附属设备、水处理设备	
		   			</div>
	    			<a class="ui-btn ui-btn-sp" id="fssb_add">增加行</a>
		    		<table class="tabjcxx" id="fssb">
		    			<tr>
		    				<th>名称</th>
		    				<th>型号</th>
		    				<th>规格</th>
		    				<th>数量</th>
		    				<th>制造厂家</th>
		    				<th>操作</th>
		    			</tr>
		    			<c:forEach var="f" items="${fssbList}">
			    			<tr>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.mingcheng" value="${f.mingcheng}"/>
			    				</td>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.xinghao" value="${f.xinghao}"/>
			    				</td>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.guige" value="${f.guige}"/>
			    				</td>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.shuliang" value="${f.shuliang}"/>
			    				</td>
			    				<td>
			    					<input class="ui-input long98" name="fssbBean.zhizaochangjia" value="${f.zhizaochangjia}"/>
			    				</td>
			    				<td>
			    					<a href="javascript:void(0)" onclick="delRow(this)">删除</a>
			    				</td>
			    			</tr>
		    			</c:forEach>
		    		</table>
		    	</form>
		    </div>
		</div>
	<iframe id="dwzhDownloadFile" height="0" width="0" src="" style="display: none;"></iframe>
</body>
</html>
	<script type="text/javascript">
	
	$("#jyjl").selectmenu();
	$("#shyj").selectmenu();
	
	//编辑行的下标
	 function delRow(obj){  
            var tr=obj.parentNode.parentNode;  
            var tbody=tr.parentNode;  
            tbody.removeChild(tr);
     } 
	
	$().ready(function(){
		
		if("${register.tjstate}" == "1" || "${register.tjstate}" == "2"){
			$("#mnubtn_zcdj_edit_tj").hide();
			$("#mnubtn_zcdj_edit_save").hide();
		}
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"8000"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie",data.dirDatas,"200px",false,"<%=path%>");
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
			$("#mnubtn_jcsj_zcdj_edit_dy").click(function(){
				var id = $("#reg_id_${uuid}").attr("value");
				window.open ('<%=path%>/register!djbDyByJsp.do?id='+id,'登记表打印窗口','height=500,width=650,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no'); 
			});
		//增加
		$("#fssb_add").click(function(){
			var tr = "<tr>";
			tr += '<td><input class="ui-input long98" name="fssbBean.mingcheng" /></td>';
			tr += '<td><input class="ui-input long98" name="fssbBean.xinghao" /></td>';
			tr += '<td><input class="ui-input long98" name="fssbBean.guige" /></td>';
			tr += '<td><input class="ui-input long98" name="fssbBean.shuliang" /></td>';
			tr += '<td><input class="ui-input long98" name="fssbBean.zhizaochangjia" /></td>';
			tr += '<td><a href="javascript:void(0)" onclick="delRow(this)">删除</a></td>';
			tr += '</tr>';
			$("#fssb").append(tr);
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
				    	if(tjstate == '2'){
				    		//if( !verifyCode() ){ return false;};
				    		if(!verifySelect()){ return false;}
				    	}
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
						    	var fpath = rsp.fjpath.replace(/\\/g,"/");
						    	var down = '<a href="javascript:void(0)" onclick="parent.downloadFile(\''+fpath+'\')">下载附件</a>';
						    	$("#zcdjb_fj_${uuid}").html(down);
						    }
						    $("#zcdjb_fj_input_${uuid}").html($("#zcdjb_fj_input_${uuid}").html());
						    if(tjstate == "2"){
								$("#mnubtn_zcdj_edit_tj").hide();
								$("#mnubtn_zcdj_edit_save").hide();
							}
		            	}else if(rsg.msg == "OUTSIZE"){
							$.dialog.tips('<font color="blue">保存成功！附件过大上传失败！</font>',3,'success.gif');
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