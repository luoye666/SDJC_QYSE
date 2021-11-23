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
.redStyle{
	color: red;
}
</style>
</head>
<body>
	<div class="wrapper">
	  <div class="mod-search cf">
	    <a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_add_save">保存</a><a class="ui-btn ui-btn-sp" id="mnubtn_zcdj_add_tiqu">提取信息</a>
	  </div>
	   		<div>
		    	<form id="frm_zcdj_add${uuid}" method="post">
		   			<div style="width: 80%;text-align: center;font-size: 30px">
		   				特种设备使用登记表
		   			</div>
		   			<br/>
			    	<div class="formHiddenRegion">
	                	 <input type="hidden" name="register.filepath"/>
	                	 <input type="hidden" name="register.shebeizhonglei" value="压力管道"/>
	                	 <input type="hidden" name="register.shebeizhongleidaima" value="8000"/>
	                	 <input type="hidden" name="register.tjstate" value="0"/>
						 <input type="hidden" name="register.shiyongdanwei" value="${register.shiyongdanwei}" id="reg_add_sydw"/>
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
									<div id="shi_div">
										<select style="width:150px" sltValue="${register.shiyongdanweidizhi_shi_daima}" name="register.shiyongdanweidizhi_shi_daima" id="shi"></select>
									</div>
								</td>
								<th >区县</th>
								<td style="text-align: left;">
									<div id="quxian_div" >
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
									<input class="ui-input long98" name="register.zhuguanbumen"/>
								</td>
								<th>行业</th>
								<td>
									<input class="ui-input long98" name="register.suoshuhangye" />
								</td>
							</tr>
							<tr>
								<th>联系电话</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhuguanfuzerendianhua"/>
								</td>
								<th>安全管理部门</th>
								<td>
									<input class="ui-input long98" name="register.anquanguanlibumen" />
								</td>
							</tr>
							<tr>
								<th>安全管理人员</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.anquanguanlirenyuan" value="${register.anquanguanlirenyuan}" />
								</td>
								<th>经办人</th>
								<td>
									<input class="ui-input long98" name="register.jingbanren" />
								</td>
							</tr>
							<tr>
								<th>压力管道类别</th>
								<td colspan="3" style="text-align: left;">
									<div id="yzc_shebeileibie_div">
										<select name="register.shebeileibiedaima" style="width:150px" id="yzc_shebeileibie"></select>
									</div>
								</td>
								<th>工程(装置)名称</th>
								<td>
									<input class="ui-input long98" name="register.gongchengmingcheng" />
								</td>
							</tr>
							<tr>
								<th>设计单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.shejidanwei" />
								</td>
								<th>设计单位代码</th>
								<td>
									<input class="ui-input long98" name="register.shejidanweidaima" />
								</td>
							</tr>
							<tr>
								<th>安装单位</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.anzhuangdanwei" value="${register.anzhuangdanwei}" />
								</td>
								<th>安装单位代码</th>
								<td>
									<input class="ui-input long98" name="register.anzhuangdanweidaima" />
								</td>
							</tr>
							<tr>
								<th style="width: 13%">竣工验收日期</th>
								<td style="width: 20%">
									<input class="ui-input long98" name="register.jungongriqi" onclick="WdatePicker()" />
								</td>
								<th style="width: 10%">投用日期(日期)</th>
								<td style="width: 20%">
									<input class="ui-input long98" name="register.touyongriqi" onclick="WdatePicker()" />
								</td>
								<th style="width: 15%">管道规格</th>
								<td style="width: 22%">
									<input class="ui-input long98" name="register.guandaoguige"/>
								</td>
							</tr>
							<tr>
								<th>管道名称</th>
								<td>
									<input class="ui-input long98" name="register.shebeimingcheng" value="${register.shebeimingcheng}"/>
								</td>
								<th>投用日期(文本)</th>
								<td>
									<input class="ui-input long98" name="register.touyongriqi_str" />
								</td>
								<th class="redStyle">管道编号</th>
								<td>
									<input class="ui-input long98 redStyle" name="register.guandaobianhao" value="${register.guandaobianhao}" id="cpbh"/>
								</td>
							</tr>
							<tr>
								<th>公称直径(mm)</th>
								<td>
									<input class="ui-input long98" name="register.gongchengzhijing"/>
								</td>
								<th>公称壁厚(mm)</th>
								<td>
									<input class="ui-input long98" name="register.gongchengbihou"/>
								</td>
								<th>管道级别</th>
								<td>
									<input class="ui-input long98" name="register.guandaojibie"/>
								</td>
							</tr>
							<tr>
								<th>设计压力(Mpa)</th>
								<td>
									<input class="ui-input long98" name="register.shejiyali"/>
								</td>
								<th>设计温度(℃)</th>
								<td>
									<input class="ui-input long98" name="register.shejiwendu"/>
								</td>
								<th>管道长度(km)</th>
								<td>
									<input class="ui-input long98" name="register.guandaochangdu"/>
								</td>
							</tr>
							<tr>
								<th>最高工作压力(Mpa)</th>
								<td>
									<input class="ui-input long98" name="register.gongzuoyali"/>
								</td>
								<th>最高工作温度(℃)</th>
								<td>
									<input class="ui-input long98" name="register.gongzuowendu"/>
								</td>
								<th>输送介质</th>
								<td>
									<input class="ui-input long98" name="register.shusongjiezhi"/>
								</td>
							</tr>
							<tr>
								<th>是否重要管道</th>
								<td>
									<input class="ui-input long98" name="register.shifouzhongyaoguandao"/>
								</td>
								<th>所属车间</th>
								<td >
									<input class="ui-input long98" name="register.chejianfenchang" />
								</td>
								<th>检验结论</th>
								<td>
									<select class="long98" name="register.jianyanjielun" id="jyjl">
										<option value="允许运行">允许运行</option>
										<option value="整改后运行">整改后运行</option>
										<option value="限制条件运行">限制条件运行</option>
										<option value="停止运行">停止运行</option>
										<option value="监督运行">监督运行</option>
										<option value="合格">合格</option>
										<option value="不合格">不合格</option>
										<option value="无">无</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>压力管道代码</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhucedaima" value="${register.zhucedaima}" id="reg_add"/>
								</td>
								<th>检验日期</th>
								<td>
									<input class="ui-input long98" name="register.jianyanriqi"  onclick="WdatePicker()" />
								</td>
							</tr>
							<tr>
								<th>下次检验日期</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.xiacijianyanriqi"  onclick="WdatePicker()" />
								</td>
								<th>固定资产值</th>
								<td>
									<input class="ui-input long98" name="register.gudingzichan" />
								</td>
							</tr>
							<tr>
								<th>备注</th>
								<td colspan="5">
									<input class="ui-input long98" name="register.beizhu" />
								</td>
							</tr>
							<tr>
								<th>审核日期</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.shenheriqi"  onclick="WdatePicker()" />
								</td>
								<th>登记意见</th>
								<td>
									<select name="register.shenheyijian" class="long98" id="shyj">
										<option value=""></option>
										<option value="允许使用登记，颁发《使用登记证》">允许使用登记，颁发《使用登记证》</option>
										<option value="允许使用登记，《使用登记证》注明有效期">允许使用登记，《使用登记证》注明有效期</option>
										<option value="不允许登记">不允许登记</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>注册登记日期</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhucedengjiriqi" onclick="WdatePicker()"/>
								</td>
								<th>注册登记人员</th>
								<td>
									<input class="ui-input long98" name="register.zhucedengjirenyuan" />
								</td>
							</tr>
							<tr>
								<th>注册登记机构</th>
								<td colspan="3">
									<input class="ui-input long98" name="register.zhucedengjijigou" />
								</td>
								<th></th>
								<td></td>
							</tr>
						</table>
					 </div>
					 <br/>
		    	</form>
		    </div>
		</div>
		</body>
	</html>
	<script type="text/javascript">
	
	$("#jyjl").selectmenu();
	$("#shyj").selectmenu();
	
	 function delRow(obj){  
            var tr=obj.parentNode.parentNode;  
            var tbody=tr.parentNode;  
            tbody.removeChild(tr);
     } 
	$().ready(function(){
		
			$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
				function (data, textStatus){
					$STONE.creatSelectMenu("shi,quxian,xiangzhen",data.dicDatas,"200px",true,"<%=path%>");
			},"JSON");
			//生成级联下拉框
			$.post("<%=path%>/dirList!getDataListByParentCodeForSe.do",{code:"8000"},
				function (data, textStatus){
					$STONE.creatSelectMenuBySeType("yzc_shebeileibie",data.dirDatas,"200px",false,"<%=path%>");
			},"JSON");
			
		//提交表单
		$("#mnubtn_zcdj_add_save").click(function(){
			var options = {
			    url:"<%=path%>/register!save.do?gzid=${gzid}",
				dataType:'json',
	            beforeSubmit:function(formData, jqForm, options){
			 //   	if(checkZcdmDw()){
						parent.showMask("正在保存......");
						return true;
			 //   	}
			 //   	return false;
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
		//根据产品编号提取信息
		$("#mnubtn_zcdj_add_tiqu").click(function(){
			var cpbh = $("#cpbh").val();
			var url = window.location.href;
			if(url.indexOf("cpbh=")>=0){//已经提取过一次的
				url = url.substring(0,url.indexOf("&cpbh="));
			}
			url += "&cpbh="+cpbh;
			window.location.href = url;
		});
		
	});
	
	
  	//验证注册代码和使用单位
  	function checkZcdmDw(){
  		var result = false;
  		var zcdm = $("#reg_add").val();
  		var sydw = $("#reg_add_sydw").val();
  		if(zcdm.length < 17 || zcdm.length > 20){
			$.dialog.alert('压力管道代码位数不正确!');
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
					$.dialog.alert('压力管道代码重复!');
		   		}else{
		   			result = true;
		   		}
		   }
		});
  		return result;
  	}
	</script> 