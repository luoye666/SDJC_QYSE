<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
<%@ taglib prefix="c" uri="/c.tld" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<jsp:include page="/jsp/common/include.jsp"></jsp:include>
<style>
	.inputWidth{
		width: 178px;
	}
	table th{
		text-align: right;
		width: 20%;
	}
	.long90{
		width: 90%;
	}
	.long98{
  		width:92%;
	}
	.long85{
  		width:85%;
	}
	.tabjcxx {
		border-collapse:collapse;
		border-bottom-color:white;
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
	
</style>
<script type="text/javascript">
var api = frameElement.api, W = api.opener;
api.button(
	{
	    id:'valueCx',
		name:'查询',
		callback:search
	},{
	    id:'valueQx',
		name:'取消'
	}
);


function closeBefore(){
	$("span").remove();
	W.searchForm = $("#frm_jcsj_search_conditions").html();
}

function search(){
	var params = $STONE.formSerializedToJSON("#frm_jcsj_search_conditions");
	W.search(params);
//	return false;
};
window.onload = function(){
	if("" != W.searchForm){
		$("#frm_jcsj_search_conditions").html(W.searchForm);
	}
	//生成级联下拉框
	$.post("<%=path%>/dirList!getSetypeList.do",{},
		function (data, textStatus){
			$STONE.creatSelectMenuBySeType("shebeizhonglei,shebeileibie",data.dirDatas,"200px",true,"<%=path%>");
	},"JSON");
	$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
		function (data, textStatus){
			$STONE.creatSelectMenu("shidaima,quhuadaima,xiangzhendaima",data.dicDatas,"200px",true,"<%=path%>");
	},"JSON");
	$("#jiankongshebei").selectmenu();
	$("#jujichangsuo").selectmenu();
	$("#yinhuan").selectmenu();
	$("#weihuapin").selectmenu();
	$("#zhongyaoshebei").selectmenu();
	$("#rongrongjinshu").selectmenu();
	$("#paixu").selectmenu();
}
function setInputValue(obj){
	$("#"+obj.id).attr("value",obj.value);
}


</script>
</head>

<body>
  <div id="search_div" class="mod-search cf">
	<form name="frm_jcsj_search_conditions" id="frm_jcsj_search_conditions">
	  	<table style="width: 98%;">
	  		<tr>
	  			<th>使用证编号</th>
	  			<td>
	        		<input type="text" name="dengjizhengbianhao" class="ui-input long90" id="dengjizhengbianhao" onkeyup="setInputValue(this)">
	  			</td>
	  			<th>设备名称</th>
	  			<td>
	  				<input name="shebeimingcheng" class="ui-input long90" id="shebeimingcheng" onkeyup="setInputValue(this)"> 
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>所在市</th>
	  			<td>
	  				<div id="shidaima_div">
	       				<select name="shidaima" class="long90" id="shidaima" ></select>
	  				</div>
	  			</td>
	  			<th>所在县</th>
	  			<td>
	  				<div id="quhuadaima_div">
	       				<select name="quhuadaima" class="long90" id="quhuadaima" ></select>
	  				</div>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>所在乡镇（街道办事处）</th>
	  			<td>
	  				<div id="xiangzhendaima_div">
	       				<select name="xiangzhendaima" class="long90" id="xiangzhendaima" ></select>
	  				</div>
	  			</td>
	  			<th>设备种类</th>
	  			<td>
	  				<div id="shebeizhonglei_div">
	  					<select name="shebeizhonglei" class="long90" id="shebeizhonglei"></select>
	  				</div>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>设备类别</th>
	  			<td>
	  				<div id="shebeileibie_div">
	  					<select name="shebeileibie" class="long90" id="shebeileibie"></select>
	  				</div>
	  			</td>
	  			<th>注册登记日期</th>
	  			<td>
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="zhuceriqi" id="zhuceriqi"  value="" onchange="setInputValue(this)"/>
					~
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="zhuceriqiend" id="zhuceriqiend"  value="" onchange="setInputValue(this)"/>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>检验日期（时间段）</th>
	  			<td>
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="jianyankaishiriqi" id="jianyankaishiriqi"  value="" onchange="setInputValue(this)"/>
					~
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="jianyanjieshuriqi" id="jianyanjieshuriqi"  value="" onchange="setInputValue(this)"/>
	  			</td>
	  			<th>注册代码</th>
	  			<td>
	  				<input name="zhucedaima" class="ui-input long90" id="zhucedaima" value = "" onpropertychange="onchan()" onkeyup="setInputValue(this)"/> 
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>设备产权单位</th>
	  			<td>
	  				<input name="chanquandanwei" class="ui-input long90" id="chanquandanwei" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  			<th>设备使用单位代码</th>
	  			<td>
	  				<input name="shiyongdanweiCode" class="ui-input long90" id="shiyongdanweiCode" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>设备使用单位</th>
	  			<td>
	  				<input name="shiyongdanwei" class="ui-input long90" id="shiyongdanwei" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  			<th>单位内部编号</th>
	  			<td>
	  				<input name="neibubianhao" class="ui-input long90" id="neibubianhao" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>设计单位代码</th>
	  			<td>
	  				<input name="shejidanweidaima" class="ui-input long90" id="shejidanweidaima" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  			<th>设计单位</th>
	  			<td>
	  				<input name="shejidanwei" class="ui-input long90" id="shejidanwei" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>制造单位代码</th>
	  			<td>
	  				<input name="zhizaodanweidaima" class="ui-input long90" id="zhizaodanweidaima" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  			<th>制造单位</th>
	  			<td>
	  				<input name="zhizaodanwei" class="ui-input long90" id="zhizaodanwei" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>监检单位代码</th>
	  			<td>
	  				<input name="jianjiandanweidaima" class="ui-input long90" id="jianjiandanweidaima" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  			<th>产品监检单位</th>
	  			<td>
	  				<input name="jianjiandanwei" class="ui-input long90" id="jianjiandanwei" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>出厂编号</th>
	  			<td>
	  				<input name="chuchangbianhao" class="ui-input long90" id="chuchangbianhao" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  			<th>安装单位代码</th>
	  			<td>
	  				<input name="anzhuangdanweidaima" class="ui-input long90" id="anzhuangdanweidaima" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>安装单位</th>
	  			<td>
	  				<input name="anzhuangdanwei" class="ui-input long90" id="anzhuangdanwei" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  			<th>隐患类别</th> <!-- 对应事故类别 -->
	  			<td>
	       			<select name="yinhuan" class="long90" id="yinhuan" onkeyup="setInputValue(this)">
	       				<option></option>
	       				<option value="特大">特大</option>
	       				<option value="重大">重大</option>
	       				<option value="严重">严重</option>
	       				<option value="一般">一般</option>
	       				<option value="无">无</option>
	       			</select>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>是否重大危险源</th>
	  			<td>
	       			<select name="weihuapin" class="long90" id="weihuapin" onkeyup="setInputValue(this)">
	       				<option></option>
	       				<option value="是">是</option>
	       				<option value="否">否</option>
	       			</select>
	  			</td>
	  			<th>是否公众聚集场所</th>
	  			<td>
	       			<select name="jujichangsuo" class="long90" id="jujichangsuo" onkeyup="setInputValue(this)">
	       				<option></option>
	       				<option value="是">是</option>
	       				<option value="否">否</option>
	       			</select>
	  			</td>
	  		</tr>
	  		<tr>
	  			
	  			<th>是否制定事故应急措施和救援预案</th>
	  			<td>
	       			<select name="zhongyaoshebei" class="long90" id="zhongyaoshebei" onkeyup="setInputValue(this)">
	       				<option></option>
	       				<option value="是">是</option>
	       				<option value="否">否</option>
	       			</select>
	  			</td>
	  			<th>安装竣工日期</th>
	  			<td>
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="jungongriqi" id="jungongriqi"  value="" onchange="setInputValue(this)"/>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>投用日期（时间段）</th>
	  			<td>
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="touyongkaishiriqi" id="touyongkaishiriqi"  value="" onchange="setInputValue(this)"/>
					~
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="touyongjieshuriqi" id="touyongjieshuriqi"  value="" onchange="setInputValue(this)"/>
	  			</td>
	  			<th>制造日期（时间段）</th>
	  			<td>
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="zhizaokaishiriqi" id="zhizaokaishiriqi"  value="" onchange="setInputValue(this)"/>
					~
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="zhizaojieshuriqi" id="zhizaojieshuriqi"  value="" onchange="setInputValue(this)"/>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>下次检验日期（时间段）</th>
	  			<td>
	  				<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="xiacijianyanriqi" id="xiacijianyanriqi"  value="" onchange="setInputValue(this)"/>
					~
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="xiacijianyanriqiend" id="xiacijianyanriqiend"  value="" onchange="setInputValue(this)"/>
	  			</td>
	  			<th>排序内容</th>
	  			<td>
	  				<select name="paixu" class="long90" id="paixu" onkeyup="setInputValue(this)">
	       				<option></option>
	       				<option value="shiyongdanwei">使用单位</option>
	       				<option value="zhucedaima">注册代码</option>
	       			</select>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>所在车间分厂</th>
	  			<td>
	  				<input name="suozaichejian" class="ui-input long90" id="suozaichejian" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  			<th>设备使用地点</th>
	  			<td>
	       			<input class="ui-input long90"   onkeyup="setInputValue(this)" name="shebeididian" id="shebeididian"  value=""/>
	  			</td>
	  		</tr>
	  		<tr>
	  			
	  			<th>是否重点监控特种设备</th>
	  			<td>
	       			<select name="jiankongshebei" class="long90" id="jiankongshebei" onkeyup="setInputValue(this)">
	       				<option></option>
	       				<option value="是">是</option>
	       				<option value="否">否</option>
	       			</select>
	  			</td>
	  			<th>维保单位</th>
	  			<td>
	  				<input name="weibaodanwei" class="ui-input long90" id="weibaodanwei" value = ""  onkeyup="setInputValue(this)"> 
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>（起重机械）是否吊运熔融金属</th>
	  			<td>
	  				<select name="rongrongjinshu" class="long90" id="rongrongjinshu" onkeyup="setInputValue(this)">
	       				<option></option>
	       				<option value="是">是</option>
	       				<option value="否">否</option>
	       			</select>
	  			</td>
	  			<th>更新日期</th>
	  			<td>
					<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="gengxinriqi" id="gengxinriqi"  value="" onchange="setInputValue(this)"/>
	  			</td>
	  		</tr>
	  		<tr>
	  			<c:if test="${param.zt == 'ls'}">
	  				<th>修改日期（时间段）</th>
		  			<td>
						<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="xiugaikaishiriqi" id="xiugaikaishiriqi"  value="" onchange="setInputValue(this)"/>
						~
						<input style="width: 90px;" class="ui-input" onclick="WdatePicker()" name="xiugaijieshuriqi" id="xiugaijieshuriqi"  value="" onchange="setInputValue(this)"/>
		  			</td>
	  			</c:if>
	  			
	  		</tr>
	  	</table>
	  </form>
  </div>
</body>
</html>
