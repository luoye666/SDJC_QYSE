<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="/SDJC/css/print/StickyFooter.css"type="text/css"></link>
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
<style type="text/css">
.tabjcxx {
	border-collapse:collapse; 
	text-align:center; 
	margin:0 0 0 0;
	width: 99%;
}
.tabjcxx td{
	border:1px black solid;
	font-size:12px;
	text-align:center; 
	margin:0px; 
	padding:3px 0 3px 0px;
}
.shuoming{
	width: 100%;
}
.shuoming td{
	border: none;
}
.hengxiang2{
			filter:progid:DXImageTransform.Microsoft.BasicImage(rotation:1);
			transform:rotate(90deg);
			-ms-transform:rotate(90deg); 	/* IE 9 */
			-moz-transform:rotate(90deg); 	/* Firefox */
			-webkit-transform:rotate(90deg); /* Safari 和 Chrome */
			-o-transform:rotate(90deg); 	/* Opera */
		}
		#demo2{
				/*border:1px blue solid;*/
				
				
				position: absolute;
				
				transform-origin: 33% 54%;
				transform:rotate(90deg);
				-webkit-transform-origin:33% 54%;
				
				filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=1)\9;
				transform:rotate(90deg);
				-ms-transform:rotate(90deg); 	/* IE 9 */
				-webkit-transform:rotate(90deg); /* Safari 和 Chrome */
			}
</style>
<script>
	function doPrint() { 
		var pdiv = document.getElementById('but_pt');
		pdiv.style.display = 'none';
		bdhtml=window.document.body.innerHTML; 
		sprnstr="<!--startprint-->"; 
		eprnstr="<!--endprint-->"; 
		prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
		prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
		window.document.body.innerHTML=prnhtml; 
		window.print(); 
	}
</script>
</head>
<body>
<!--startprint-->
<div  style="height: 970px;" >
<DIV align=center id="but_pt"> 
	<input name="Button" onClick="doPrint()" type="button" value="打印" class='noprint' style="padding: 2px 4px 2px 4px"/> 
</DIV>
					<div style="width: 100%;text-align: center;font-size: 15px;">
		   				<b>特种设备使用登记表</b>
		   			</div>
		   			<br/>
						<table style="width: 100%">
							<td style="width:50%;border: none;text-align: left;">登记类别：${(reg.dengjileibie)!}</td>
						</table>
						<table class="tabjcxx">
							
							<tr>
								<td rowspan="2" style="width: 10%">设备基本情况</td>
								<td style="width: 15%">设备类别</td>
								<td style="width: 35%">${(reg.shebeileibie)!}</td>
								<td style="width: 20%">设备品种</td>
								<td style="width: 20%">${(reg.shebeipinzhong)!}</td>
							</tr>
							<tr>
								<td>产品名称</td>
								<td>${(reg.shebeimingcheng)!}</td>
								<td>设备数量</td>
								<td>${(reg.shebeishuliang)!}</td>
							</tr>
							<tr>
								<td rowspan="5" style="width: 10%">设备使用情况</td>
								<td>使用单位名称</td>
								<td colspan="3">${(reg.shiyongdanwei)!}</td>
							</tr>
							<tr>
								<td>使用单位地址</td>
								<td colspan="3">${(reg.shiyongdanweidizhi)!}</td>
							</tr>
							<tr>
								<td>设备使用地点</td>
								<td>${(reg.shiyongdidian)!}</td>
								<td>单位固定电话</td>
								<td>${(reg.sydw_gudingdianhua)!}</td>
							</tr>
							<tr>
								<td>使用单位统一社会</br>信用代码</td>
								<td>${(reg.shiyongdanweidaima)!}</td>
								<td>邮政编码</td>
								<td>${(reg.sydw_youzhengbianma)!}</td>
							</tr>
							<tr>
								<td>安全管理人员</td>
								<td>${(reg.anquanguanlirenyuan)!}</td>
								<td>移动电话</td>
								<td>${(reg.aqglry_lianxidianhua)!}</td>
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
											<td style="width: 15%">${(reg.tianbiaorenyuan)!}</td>
											<td style="width: 10%">日期：</td>
											<td style="width: 20%">
							    			<#if reg.tianbiaoriqi??>
							    			${(reg.tianbiaoriqi)!?string("yyyy-MM-dd")}
									      	</#if>
											</td>
											<td style="width: 20%">(使用单位公章)</td>
										</tr>
										<tr>
											<td>使用单位安全管理人员：</td>
											<td>${(reg.anquanguanlirenyuan)!}</td>
											<td>日期：</td>
											<td>
							    			<#if reg.aqglry_riqi??>
							    			${(reg.aqglry_riqi)!?string("yyyy-MM-dd")}
									      	</#if>
											</td>
											<td>${(reg.shiyongdanwei_nyr)!}</td>
										</tr>
										<tr>
											<td style="height: 20px;"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div style="text-align: left;height: 10px;">
									</div>
									<div style="text-align: left;height: 30px;">
										说明：${(reg.beizhu)!}
									</div>
									<table class="shuoming">
										<tr>
											<td style="width: 25%">登记机关登记人员：</td>
											<td style="width: 15%">${(reg.zhucedengjirenyuan)!}</td>
											<td style="width: 20%">日期：</td>
											<td style="width: 20%">
							    			<#if reg.zhucedengjiriqi??>
							    			${(reg.zhucedengjiriqi)!?string("yyyy-MM-dd")}
									      	</#if>
											</td>
											<td style="width: 20%">（登记机关专用章）</td>
										</tr>
										<tr>
											<td>使用登记证编号：</td>
											<td>${(reg.shiyongdengjizhenghaoma)!}</td>
											<td>登记机关：</td>
											<td>${(reg.zhucedengjijigou)!}</td>
											<td>${(reg.dengjijiguan_nyr)!}</td>
										</tr>
										<tr>
											<td style="height: 20px;"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
</div>
<br/>
<#assign tiaoshu = 5>
<#assign ym = 1>
<div class="" style="width:680px;height:980px;margin:-30px 0px 0px 0px;" >
	<div id="demo2" style="width:960px;height:600px;">
		   			<div style="width: 99%;text-align: center;font-size: 15px;">
		   				压力管道基本信息汇总表--工业管道
		   			</div>
		    		<table class="tabjcxx" id="hzb" style="width: 99%">
		    			<tr>
		    				<td colspan="3" style="border: none;">工程(装置)名称：</td>
		    				<td colspan="4" style="border: none;text-align: left;">${(reg.gongchengmingcheng)!}</td>
		    				<td colspan="3" style="border: none;">安全管理部门：</td>
		    				<td colspan="9" style="border: none;text-align: left;">${(reg.anquanguanlibumen)!}</td>
		    			</tr>
		    			<tr>
		    				<td rowspan="2" style="width: 2%">序号</td>
		    				<td rowspan="2" style="width: 5%">管道名称(登记单元)</td>
		    				<td rowspan="2" style="width: 5%">管道编号</td>
		    				<td rowspan="2" style="width: 5%">管道级别</td>
		    				<td rowspan="2" style="width: 5%">设计单位</td>
		    				<td rowspan="2" style="width: 5%">安装单位</td>
		    				<td rowspan="2" style="width: 5%">安装年月</td>
		    				<td rowspan="2" style="width: 5%">投用年月</td>
		    				<td colspan="3" style="width: 5%">管道规格</td>
		    				<td colspan="3" style="width: 5%">设计/工作条件</td>
		    				<td rowspan="2" style="width: 5%">检验结论</td>
		    				<td rowspan="2" colspan="2" style="width: 8%">检验机构名称</td>
		    				<td rowspan="2" style="width: 7%">下次检验日期</td>
		    				<td rowspan="2" style="width: 3%">备注</td>
		    			</tr>
		    			<tr>
		    				<td style="width: 20px">公称直径(mm)</td>
		    				<td style="width: 5%">公称壁厚(mm)</td>
		    				<td style="width: 5%">管道长度(m)</td>
		    				<td style="width: 5%">压力(MPa)</td>
		    				<td style="width: 5%">温度(℃)</td>
		    				<td style="width: 5%">介质</td>
		    			</tr>
		   				<#list hzbList as h>
		   					<#if h_index lt tiaoshu >
		    			<tr>
		    				<td>${h_index+1}</td>
			    			<td>${(h.guandaomingcheng)!}</td>
			    			<td>${(h.guandaobianhao)!}</td>
			    			<td>${(h.guandaojibie)!}</td>
			    			<td>${(h.shejidanwei)!}</td>
			    			<td>${(h.anzhuangdanwei)!}</td>
			    			<td>
			    			<#if h.anzhuangnianyue??>
			    			${(h.anzhuangnianyue)!?string("yyyy-MM-dd")}
					      	</#if> 
			    			</td>
			    			<td>${(h.touyongnianyue)!}</td>
			    			<td>${(h.gongchengzhijing)!}</td>
			    			<td>${(h.gongchengbihou)!}</td>
			    			<td>${(h.guandaochangdu)!}</td>
			    			<td>${(h.yali)!}</td>
			    			<td>${(h.wendu)!}</td>
			    			<td>${(h.jiezhi)!}</td>
			    			<td>${(h.jianyanjielun)!}</td>
			    			<td colspan="2">${(h.jigoumingcheng)!}</td>
			    			<td>
			    			<#if h.xiacijianyanriqi??>
			    			${(h.xiacijianyanriqi)!?string("yyyy-MM-dd")}
					      	</#if> 
			    			</td>
			    			<td>${(h.beizhu)!}</td>
			    		</tr>
		   					</#if>
		   				</#list>
		   			
					<#list hzbList as h >
					<#list 1..(hzbList?size/5) as k >
					<!--6>=5  6<10-->
					<#if (h_index gte tiaoshu*k && h_index lt tiaoshu*(k+1) ) >
					<#if (h_index = tiaoshu*k)>
					<#assign ym = ym+1>
		    		</table>
		    		<table style="width: 100%">
		    			<tr>
		    				<td style="border: none;">填表日期：</td>
		    				<td style="border: none;"><#if reg.hzb_tianbiaoriqi??>
			    			${(reg.hzb_tianbiaoriqi)!?string("yyyy-MM-dd")}
					      	</#if></td>
		    				<td style="border: none;">经办人：</td>
		    				<td style="border: none;">${(reg.hzb_jingbanren)!}</td>
		    				<td style="border: none;">联系电话：</td>
		    				<td style="border: none;">${(reg.hzb_lianxidianhua)!}</td>
		    				<td style="border: none;">电子邮箱：</td>
		    				<td style="border: none;">${(reg.hzb_dianziyouxiang)!}</td>
		    			</tr>
		    		</table>
		    </div>
</div>
<br/>

<div class="" style="width:680px;height:980px;margin:-30px 0px 0px 0px;" >
	<div id="demo2" style="width:960px;height:600px;">
		   			<div style="width: 100%;text-align: center;font-size: 15px;">
		   				压力管道基本信息汇总表--工业管道
		   			</div>
		    		<table class="tabjcxx" id="hzb" style="width: 100%">
		    			<tr>
		    				<td colspan="3" style="border: none;">工程(装置)名称：</td>
		    				<td colspan="4" style="border: none;text-align: left;">${(reg.gongchengmingcheng)!}</td>
		    				<td colspan="3" style="border: none;">安全管理部门：</td>
		    				<td colspan="9" style="border: none;text-align: left;">${(reg.anquanguanlibumen)!}</td>
		    			</tr>
		    			<tr>
		    				<td rowspan="2" style="width: 2%">序号</td>
		    				<td rowspan="2" style="width: 5%">管道名称(登记单元)</td>
		    				<td rowspan="2" style="width: 5%">管道编号</td>
		    				<td rowspan="2" style="width: 5%">管道级别</td>
		    				<td rowspan="2" style="width: 5%">设计单位</td>
		    				<td rowspan="2" style="width: 5%">安装单位</td>
		    				<td rowspan="2" style="width: 5%">安装年月</td>
		    				<td rowspan="2" style="width: 5%">投用年月</td>
		    				<td colspan="3" style="width: 5%">管道规格</td>
		    				<td colspan="3" style="width: 5%">设计/工作条件</td>
		    				<td rowspan="2" style="width: 5%">检验结论</td>
		    				<td rowspan="2" colspan="2" style="width: 8%">检验机构名称</td>
		    				<td rowspan="2" style="width: 7%">下次检验日期</td>
		    				<td rowspan="2" style="width: 3%">备注</td>
		    			</tr>
		    			<tr>
		    				<td style="width: 5%">公称直径(mm)</td>
		    				<td style="width: 5%">公称壁厚(mm)</td>
		    				<td style="width: 5%">管道长度(m)</td>
		    				<td style="width: 5%">压力(MPa)</td>
		    				<td style="width: 5%">温度(℃)</td>
		    				<td style="width: 5%">介质</td>
		    			</tr>
	   					</#if>
		   					<tr style="">
		    				<td>${h_index+1}</td>
			    			<td>${(h.guandaomingcheng)!}</td>
			    			<td>${(h.guandaobianhao)!}</td>
			    			<td>${(h.guandaojibie)!}</td>
			    			<td>${(h.shejidanwei)!}</td>
			    			<td>${(h.anzhuangdanwei)!}</td>
			    			<td>
			    			<#if h.anzhuangnianyue??>
			    			${(h.anzhuangnianyue)!?string("yyyy-MM-dd")}
					      	</#if> 
			    			</td>
			    			<td>${(h.touyongnianyue)!}</td>
			    			<td>${(h.gongchengzhijing)!}</td>
			    			<td>${(h.gongchengbihou)!}</td>
			    			<td>${(h.guandaochangdu)!}</td>
			    			<td>${(h.yali)!}</td>
			    			<td>${(h.wendu)!}</td>
			    			<td>${(h.jiezhi)!}</td>
			    			<td>${(h.jianyanjielun)!}</td>
			    			<td colspan="2">${(h.jigoumingcheng)!}</td>
			    			<td>
			    			<#if h.xiacijianyanriqi??>
			    			${(h.xiacijianyanriqi)!?string("yyyy-MM-dd")}
					      	</#if>
					      	</td>
			    			<td>${(h.beizhu)!}</td>
		   					</tr>
	   					</#if>
	   				</#list>
	   				</#list>
	   		</table>
	   		
		    		<table style="width: 100%">
		    			<tr>
		    				<td style="border: none;">填表日期：</td>
		    				<td style="border: none;">
			    			<#if reg.hzb_tianbiaoriqi??>
			    			${(reg.hzb_tianbiaoriqi)!?string("yyyy-MM-dd")}
					      	</#if>
		    				</td>
		    				<td style="border: none;">经办人：</td>
		    				<td style="border: none;">${(reg.hzb_jingbanren)!}</td>
		    				<td style="border: none;">联系电话：</td>
		    				<td style="border: none;">${(reg.hzb_lianxidianhua)!}</td>
		    				<td style="border: none;">电子邮箱：</td>
		    				<td style="border: none;">${(reg.hzb_dianziyouxiang)!}</td>
		    			</tr>
		    		</table>
	  </div>
</div>


<!--endprint-->
</body>
</html>