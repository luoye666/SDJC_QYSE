<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ taglib uri="/struts-tags" prefix="s"%>  
<%response.setContentType("application/vnd.ms-excel");   %>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="/fmt.tld" %>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="ProgId" content="Excel.Sheet"/>
  <meta name="Generator" content="WPS Office ET"/>
  <!--[if gte mso 9]>
   <xml>
    <o:DocumentProperties>
     <o:Author>Chao</o:Author>
     <o:Created>2017-09-12T16:43:00</o:Created>
     <o:LastAuthor>admin</o:LastAuthor>
     <o:LastSaved>2017-09-12T16:51:31</o:LastSaved>
    </o:DocumentProperties>
    <o:CustomDocumentProperties>
     <o:KSOProductBuildVer dt:dt="string">2052-10.1.0.6747</o:KSOProductBuildVer>
    </o:CustomDocumentProperties>
   </xml>
  <![endif]-->
  <style>
<!-- @page
	{margin:0.75in 0.55in 0.75in 0.70in;
	mso-header-margin:0.32in;
	mso-footer-margin:0.32in;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.font0
	{color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font1
	{color:windowtext;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font2
	{color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font3
	{color:#FF0000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font4
	{color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"仿宋_GB2312";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font5
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font6
	{color:#000000;
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font7
	{color:#000000;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"方正仿宋简体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font8
	{color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font9
	{color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font10
	{color:#FF0000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font11
	{color:#000000;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font12
	{color:#006100;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font13
	{color:#800080;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font14
	{color:#3F3F76;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font15
	{color:#1F497D;
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font16
	{color:#0000FF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font17
	{color:#9C0006;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font18
	{color:#FFFFFF;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font19
	{color:#1F497D;
	font-size:15.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font20
	{color:#1F497D;
	font-size:18.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font21
	{color:#1F497D;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font22
	{color:#000000;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font23
	{color:#3F3F3F;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font24
	{color:#7F7F7F;
	font-size:11.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font25
	{color:#FA7D00;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font26
	{color:#FA7D00;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font27
	{color:#9C6500;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.style0
	{mso-number-format:"General";
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-pattern:auto;
	mso-background-source:auto;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"常规";
	mso-style-id:0;}
.style16
	{mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0_ \;_ \0022\00A5\0022* \\-\#\,\#\#0_ \;_ \0022\00A5\0022* \0022-\0022_ \;_ \@_ ";
	mso-style-name:"货币[0]";
	mso-style-id:7;}
.style17
	{mso-pattern:auto none;
	background:#EBF1DE;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"20% - 强调文字颜色 3";}
.style18
	{mso-pattern:auto none;
	background:#FFCC99;
	color:#3F3F76;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:.5pt solid #7F7F7F;
	mso-style-name:"输入";}
.style19
	{mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0\.00_ \;_ \0022\00A5\0022* \\-\#\,\#\#0\.00_ \;_ \0022\00A5\0022* \0022-\0022??_ \;_ \@_ ";
	mso-style-name:"货币";
	mso-style-id:4;}
.style20
	{mso-number-format:"_ * \#\,\#\#0_ \;_ * \\-\#\,\#\#0_ \;_ * \0022-\0022_ \;_ \@_ ";
	mso-style-name:"千位分隔[0]";
	mso-style-id:6;}
.style21
	{mso-pattern:auto none;
	background:#D8E4BC;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"40% - 强调文字颜色 3";}
.style22
	{mso-pattern:auto none;
	background:#FFC7CE;
	color:#9C0006;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"差";}
.style23
	{mso-number-format:"_ * \#\,\#\#0\.00_ \;_ * \\-\#\,\#\#0\.00_ \;_ * \0022-\0022??_ \;_ \@_ ";
	mso-style-name:"千位分隔";
	mso-style-id:3;}
.style24
	{mso-pattern:auto none;
	background:#C4D79B;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"60% - 强调文字颜色 3";}
.style25
	{color:#0000FF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"超链接";
	mso-style-id:8;}
.style26
	{mso-number-format:"0%";
	mso-style-name:"百分比";
	mso-style-id:5;}
.style27
	{color:#800080;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"已访问的超链接";
	mso-style-id:9;}
.style28
	{mso-pattern:auto none;
	background:#FFFFCC;
	border:.5pt solid #B2B2B2;
	mso-style-name:"注释";}
.style29
	{mso-pattern:auto none;
	background:#DA9694;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"60% - 强调文字颜色 2";}
.style30
	{color:#1F497D;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-style-name:"标题 4";}
.style31
	{color:#FF0000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"警告文本";}
.style32
	{color:#1F497D;
	font-size:18.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-style-name:"标题";}
.style33
	{color:#7F7F7F;
	font-size:11.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"解释性文本";}
.style34
	{color:#1F497D;
	font-size:15.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border-left:none;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid #4F81BD;
	mso-style-name:"标题 1";}
.style35
	{color:#1F497D;
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border-left:none;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid #4F81BD;
	mso-style-name:"标题 2";}
.style36
	{mso-pattern:auto none;
	background:#95B3D7;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"60% - 强调文字颜色 1";}
.style37
	{color:#1F497D;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border-left:none;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid #A7BFDE;
	mso-style-name:"标题 3";}
.style38
	{mso-pattern:auto none;
	background:#B1A0C7;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"60% - 强调文字颜色 4";}
.style39
	{
	background:#F2F2F2;
	color:#3F3F3F;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:.5pt solid #3F3F3F;}
.style40
	{
	background:#F2F2F2;
	color:#FA7D00;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:.5pt solid #7F7F7F;}
.style41
	{
	background:#A5A5A5;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:2.0pt double #3F3F3F;}
.style42
	{
	background:#FDE9D9;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
}
.style43
	{
	background:#C0504D;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
}
.style44
	{color:#FA7D00;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border-left:none;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double #FF8001;
	}
.style45
	{color:#000000;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border-left:none;
	border-top:.5pt solid #4F81BD;
	border-right:none;
	border-bottom:2.0pt double #4F81BD;}
.style46
	{mso-pattern:auto none;
	background:#C6EFCE;
	color:#006100;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"好";}
.style47
	{mso-pattern:auto none;
	background:#FFEB9C;
	color:#9C6500;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"适中";}
.style48
	{mso-pattern:auto none;
	background:#DAEEF3;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"20% - 强调文字颜色 5";}
.style49
	{mso-pattern:auto none;
	background:#4F81BD;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"强调文字颜色 1";}
.style50
	{mso-pattern:auto none;
	background:#DCE6F1;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"20% - 强调文字颜色 1";}
.style51
	{mso-pattern:auto none;
	background:#B8CCE4;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"40% - 强调文字颜色 1";}
.style52
	{mso-pattern:auto none;
	background:#F2DCDB;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"20% - 强调文字颜色 2";}
.style53
	{mso-pattern:auto none;
	background:#E6B8B7;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"40% - 强调文字颜色 2";}
.style54
	{mso-pattern:auto none;
	background:#9BBB59;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"强调文字颜色 3";}
.style55
	{mso-pattern:auto none;
	background:#8064A2;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"强调文字颜色 4";}
.style56
	{mso-pattern:auto none;
	background:#E4DFEC;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"20% - 强调文字颜色 4";}
.style57
	{mso-pattern:auto none;
	background:#CCC0DA;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"40% - 强调文字颜色 4";}
.style58
	{mso-pattern:auto none;
	background:#4BACC6;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"强调文字颜色 5";}
.style59
	{mso-pattern:auto none;
	background:#B7DEE8;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"40% - 强调文字颜色 5";}
.style60
	{mso-pattern:auto none;
	background:#92CDDC;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"60% - 强调文字颜色 5";}
.style61
	{mso-pattern:auto none;
	background:#F79646;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"强调文字颜色 6";}
.style62
	{mso-pattern:auto none;
	background:#FCD5B4;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"40% - 强调文字颜色 6";}
.style63
	{mso-pattern:auto none;
	background:#FABF8F;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"60% - 强调文字颜色 6";}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	mso-number-format:"General";
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-pattern:auto;
	mso-background-source:auto;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;
	text-align: center;}
.xl65
	{mso-style-parent:style0;
	mso-number-format:"\@";
	white-space:normal;
	mso-font-charset:134;}
.xl66
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	font-size:14.0pt;
	font-weight:700;
	mso-font-charset:134;
	mso-protection:unlocked visible;}
.xl67
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:right;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl68
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl69
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:#FF0000;
	mso-font-charset:134;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl70
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl71
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl72
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl73
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl74
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl75
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	border-top:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl76
	{mso-style-parent:style0;
	mso-number-format:"yyyy/m/d\;\@";
	text-align:center;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl77
	{mso-style-parent:style0;
	mso-number-format:"\@";
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	border-top:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl78
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:left;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	mso-protection:unlocked visible;}
.xl79
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:right;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	font-family:仿宋_GB2312, monospace;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl80
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:right;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	font-family:仿宋_GB2312, monospace;
	mso-font-charset:134;
	mso-protection:unlocked visible;}
.xl81
	{mso-style-parent:style0;
	mso-number-format:"\@";
	white-space:normal;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	mso-protection:unlocked visible;}
.xl82
	{mso-style-parent:style0;
	mso-number-format:"\@";
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	font-family:仿宋_GB2312, monospace;
	mso-font-charset:134;
	mso-protection:unlocked visible;}
.xl83
	{mso-style-parent:style0;
	text-align:center;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	font-size:12.0pt;
	mso-font-charset:134;
	mso-protection:unlocked visible;}
.xl84
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:right;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl85
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:right;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	mso-protection:unlocked visible;}
.xl86
	{mso-style-parent:style0;
	text-align:right;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	font-size:12.0pt;
	mso-font-charset:134;
	mso-protection:unlocked visible;}
.xl87
	{mso-style-parent:style0;
	mso-number-format:"yyyy/m/d\;\@";
	text-align:right;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	font-size:12.0pt;
	mso-font-charset:134;
	mso-protection:unlocked visible;}
.xl88
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-top:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl89
	{mso-style-parent:style0;
	mso-number-format:"\@";
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl90
	{mso-style-parent:style0;
	mso-number-format:"\@";
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	mso-protection:unlocked visible;}
.xl91
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	mso-protection:unlocked visible;}
.xl92
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:right;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl93
	{mso-style-parent:style0;
	text-align:right;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	font-size:12.0pt;
	mso-font-charset:134;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl94
	{mso-style-parent:style0;
	text-align:center;
	font-size:16.0pt;
	font-weight:700;
	mso-font-charset:134;}
.xl95
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	font-size:12.0pt;
	font-family:方正仿宋简体;
	mso-font-charset:134;
	border:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl96
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	font-size:12.0pt;
	font-family:方正仿宋简体;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	border-top:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl97
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;
	font-size:12.0pt;
	font-family:方正仿宋简体;
	mso-font-charset:134;
	border-top:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl98
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl99
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:left;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-right:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl100
	{mso-style-parent:style0;
	mso-number-format:"\@";
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	font-family:仿宋_GB2312, monospace;
	mso-font-charset:134;
	border-right:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl101
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	mso-protection:unlocked visible;}
.xl102
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-right:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl103
	{mso-style-parent:style0;
	text-align:right;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	font-size:12.0pt;
	mso-font-charset:134;
	border-right:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl104
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	mso-font-charset:134;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl105
	{mso-style-parent:style0;
	text-align:right;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	font-size:12.0pt;
	mso-font-charset:134;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl106
	{mso-style-parent:style0;
	text-align:right;
	white-space:normal;
	mso-pattern:auto none;
	background:#FFFFFF;
	color:windowtext;
	font-size:12.0pt;
	mso-font-charset:134;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl107
	{mso-style-parent:style0;
	white-space:normal;
	font-size:12.0pt;
	font-family:方正仿宋简体;
	mso-font-charset:134;
	border:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl108
	{mso-style-parent:style0;
	mso-number-format:"\@";
	white-space:normal;
	mso-font-charset:134;
	border:.5pt solid windowtext;}
 -->  </style>
  <!--[if gte mso 9]>
   <xml>
    <x:ExcelWorkbook>
     <x:ExcelWorksheets>
      <x:ExcelWorksheet>
       <x:Name>Sheet1</x:Name>
       <x:WorksheetOptions>
        <x:DefaultRowHeight>600</x:DefaultRowHeight>
        <x:Unsynced/>
        <x:Selected/>
        <x:Panes>
         <x:Pane>
          <x:Number>3</x:Number>
          <x:ActiveCol>13</x:ActiveCol>
          <x:ActiveRow>11</x:ActiveRow>
          <x:RangeSelection>N12</x:RangeSelection>
         </x:Pane>
        </x:Panes>
        <x:DoNotDisplayZeros/>
        <x:ProtectContents>False</x:ProtectContents>
        <x:ProtectObjects>False</x:ProtectObjects>
        <x:ProtectScenarios>False</x:ProtectScenarios>
        <x:PageBreakZoom>100</x:PageBreakZoom>
        <x:Print>
         <x:ValidPrinterInfo/>
         <x:PaperSizeIndex>9</x:PaperSizeIndex>
        </x:Print>
       </x:WorksheetOptions>
       <x:DataValidation>
        <x:Range>$C$2:D2,$E$2:G2,$D$3:G3,$J$3:K3,$D$4:G4,$J$4:K4,$D$5:G5,$J$5:K5,$D$6:G6,$J$6:K6,$D$7:G7,$J$7:K7,$D$8:G8,$J$8:K8,$D$9:G9,$H$9:I9,$J$9:K9,$D$10:G10,$J$10:K10,$D$11:G11,$J$11:K11,$D$12:G12,$J$12:K12,$D$13:G13,$J$13:K13,$D$14:G14,$J$14:K14,$D$15:G15,$J$15:K15,$D$16:G16,$J$16:K16,$D$17:G17,$J$17:K17,$D$18:G18,$J$18:K18,$D$19:G19,$J$19:K19,$D$20:G20,$J$20:K20,$D$21:G21,$J$21:K21,$D$22:G22,$J$22:K22,$D$23:G23,$H$23:I23,$J$23:K23,$B$28,$D$30,$D$31,$F$31,$D$24:D25</x:Range>
       </x:DataValidation>
      </x:ExcelWorksheet>
     </x:ExcelWorksheets>
     <x:ProtectStructure>False</x:ProtectStructure>
     <x:ProtectWindows>False</x:ProtectWindows>
     <x:WindowHeight>8370</x:WindowHeight>
     <x:WindowWidth>15825</x:WindowWidth>
    </x:ExcelWorkbook>
    <x:SupBook>
     <x:Path>C:\Users\xiaod\Desktop\</x:Path>
     <x:SheetName>电梯</x:SheetName>
     <x:SheetName>电梯产品数据表（自动扶梯与自动人行道除外）</x:SheetName>
     <x:SheetName>电梯产品数据表（适用于自动扶梯与自动人行道）</x:SheetName>
     <x:SheetName>补充参数表</x:SheetName>
     <x:SheetName>打印页</x:SheetName>
     <x:SheetName>地市</x:SheetName>
     <x:SheetName>各市乡镇</x:SheetName>
     <x:SheetName>设备种类</x:SheetName>
    </x:SupBook>
   </xml>
  <![endif]-->
 </head>
 <body link="blue" vlink="purple" class="xl65">
  <table width="713.40" border="0" cellpadding="0" cellspacing="0" style='width:535.05pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="72" class="xl65" style='mso-width-source:userset;mso-width-alt:2304;'/>
   <col width="87.67" class="xl65" style='mso-width-source:userset;mso-width-alt:2805;'/>
   <col width="45" class="xl65" style='mso-width-source:userset;mso-width-alt:1440;'/>
   <col width="40.93" class="xl65" style='mso-width-source:userset;mso-width-alt:1309;'/>
   <col width="91" class="xl65" style='mso-width-source:userset;mso-width-alt:2912;'/>
   <col width="45" class="xl65" style='mso-width-source:userset;mso-width-alt:1440;'/>
   <col width="36" class="xl65" style='mso-width-source:userset;mso-width-alt:1152;'/>
   <col width="75" class="xl65" style='mso-width-source:userset;mso-width-alt:2400;'/>
   <col width="39" class="xl65" style='mso-width-source:userset;mso-width-alt:1248;'/>
   <col width="91" class="xl65" style='mso-width-source:userset;mso-width-alt:2912;'/>
   <col width="90.80" class="xl65" style='mso-width-source:userset;mso-width-alt:2905;'/>
   <col width="72" span="16373" class="xl65" style='mso-width-source:userset;mso-width-alt:2304;'/>
   <tr height="40" class="xl65" style='height:30.00pt;mso-height-source:userset;mso-height-alt:600;'>
    <td class="xl66" height="40" width="713.40" colspan="11" style='height:30.00pt;width:535.05pt;border-right:none;border-bottom:none;' x:str>特种设备使用登记表</td>
   </tr>
   <tr height="22.67" class="xl65" style='height:17.00pt;mso-height-source:userset;mso-height-alt:340;'>
    <td class="xl67" height="22.67" colspan="2" style='height:17.00pt;border-right:none;border-bottom:.5pt solid windowtext;' x:str>登记类别：</td>
    <td class="xl68" colspan="5" style='border-right:none;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.dengjileibie }</td>
    <td class="xl69" colspan="4" style='border-right:none;border-bottom:.5pt solid windowtext;'></td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl70" height="257.33" rowspan="7" style='height:193.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>设备基本情况</td>
    <td class="xl71" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>设备种类</td>
    <td class="xl71" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shebeizhonglei }</td>
    <td class="xl71" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>设备类别</td>
    <td class="xl71" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shebeileibie }</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>设备品种</td>
    <td class="xl73" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shebeipinzhong }</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>产品名称</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shebeimingcheng }</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>设备代码</td>
    <td class="xl73" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${baseInfo.shebeidaima }</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>型号(规格)</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shebeixinghao }</td>
   </tr>
   <tr height="48" class="xl65" style='height:36.00pt;mso-height-source:userset;mso-height-alt:720;'>
    <td class="xl74" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>设计使用年限</td>
    <td class="xl74" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${baseInfo.shebeishiyongnianxian }</td>
    <td class="xl74" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>设计单位名称</td>
    <td class="xl74" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shejidanwei }</td>
   </tr>
   <tr height="49.33" class="xl65" style='height:37.00pt;mso-height-source:userset;mso-height-alt:740;'>
    <td class="xl74" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>制造单位名称</td>
    <td class="xl74" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.zhizaodanwei }</td>
    <td class="xl74" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>施工单位名称</td>
    <td class="xl74" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shigongdanwei }</td>
   </tr>
   <tr height="48" class="xl65" style='height:36.00pt;mso-height-source:userset;mso-height-alt:720;'>
    <td class="xl74" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>监督检验机构名称</td>
    <td class="xl74" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.jianyanjigou }</td>
    <td class="xl74" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>型式试验机构名称</td>
    <td class="xl74" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str></td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>产品编号</td>
    <td class="xl73" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.chuchangbianhao }</td>
    <td class="xl75" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str></td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str></td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl72" height="288" rowspan="10" style='height:216.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>设备使用情况</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>使用单位名称</td>
    <td class="xl73" colspan="8" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shiyongdanwei }</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>使用单位地址</td>
    <td class="xl73" colspan="8" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shiyongdanwei_dizhi }</td>
   </tr>
   <tr height="32" class="xl65" style='height:24.00pt;mso-height-source:userset;mso-height-alt:480;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>使用单位统一社会信<span style='display:none;'>用代码</span></td>
    <td class="xl73" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shiyongdanwei_code }</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>邮政编码</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shiyongdanwei_youbian }</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>单位内编号</td>
    <td class="xl73" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.neibubianhao }</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>设备使用地点</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shebeididian }</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>投入使用日期</td>
    <td class="xl76" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.touyongriqi }</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>单位固定电话</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.shiyongdanwei_lianxidianhua }</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>安全管理人员</td>
    <td class="xl73" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.anquanguanlirenyuan }</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>移动电话</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.anquanguanli_lianxidianhua }</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>产权单位名称</td>
    <td class="xl73" colspan="8" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.dengjileibie }</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>产权单位地址</td>
    <td class="xl73" colspan="8" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.chanquandanwei }</td>
   </tr>
   <tr height="32" class="xl65" style='height:24.00pt;mso-height-source:userset;mso-height-alt:480;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>产权单位统一社会信<span style='display:none;'>用代码</span></td>
    <td class="xl73" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.chanquandanwei_daima }</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>联系电话</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.chanquandanwei_dianhua }</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>维保单位</td>
    <td class="xl73" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.weihubaoyangdanwei }</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>联系电话</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.weihubaoyangdanwei_dianhua }</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl72" height="112" rowspan="4" style='height:84.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>设备检验情况</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>检验机构名称</td>
    <td class="xl73" colspan="8" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.jianyanjigou }</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>检验类别</td>
    <td class="xl73" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.jianyanleixing}</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>检验报告编号</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.baogaobianhao}</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>检验日期</td>
    <td class="xl76" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str><fmt:formatDate value='${baseInfo.jianyanjieshuriqi}' pattern='yyyy-MM-dd'/></td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>检验结论</td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${baseInfo.jianyanjielun }</td>
   </tr>
   <tr height="28" class="xl65" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>下次检验日期</td>
    <td class="xl76" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str><fmt:formatDate value='${baseInfo.xiacijianyanriqi}' pattern='yyyy-MM-dd'/></td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str></td>
    <td class="xl73" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str></td>
   </tr>
   <tr height="44" class="xl65" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl77" height="44" style='height:33.00pt;'></td>
    <td class="xl78" colspan="10" style='border-right:.5pt solid windowtext;border-bottom:none;' x:str>在此申明：所申报的内容真实；在使用过程中，将严格执行《中华人民共和国特种设备安全法》及相关规定，并且接受特种设备安全监督管理部门的监督管理。</td>
   </tr>
   <tr height="25.33" class="xl65" style='height:19.00pt;mso-height-source:userset;mso-height-alt:380;'>
    <td class="xl79" height="25.33" colspan="3" style='height:19.00pt;border-right:none;border-bottom:none;' x:str>附：含产品数据表</td>
    <td class="xl81"></td>
    <td class="xl82"></td>
    <td class="xl83" colspan="2" style='border-right:none;border-bottom:none;'></td>
    <td class="xl82" colspan="3" style='mso-ignore:colspan;'></td>
    <td class="xl100"></td>
   </tr>
   <tr height="20" class="xl65" style='height:15.00pt;mso-height-source:userset;mso-height-alt:300;'>
    <td class="xl84" height="20" colspan="3" style='height:15.00pt;border-right:none;border-bottom:none;' x:str>使用单位填表人员：</td>
    <td class="xl86" colspan="2" style='border-right:none;border-bottom:none;' x:str>${baseInfo.tianbiaorenyuan }</td>
    <td class="xl86" colspan="2" style='border-right:none;border-bottom:none;' x:str></td>
    <td class="xl87" colspan="2" style='border-right:none;border-bottom:none;' x:str></td>
    <td class="xl101" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:none;' x:str>(使用单位公章)</td>
   </tr>
   <tr height="20" class="xl65" style='height:15.00pt;mso-height-source:userset;mso-height-alt:300;'>
    <td class="xl84" height="20" colspan="3" style='height:15.00pt;border-right:none;border-bottom:none;' x:str>使用单位安全管理人员：</td>
    <td class="xl86" colspan="2" style='border-right:none;border-bottom:none;' x:str>${baseInfo.anquanguanlirenyuan }</td>
    <td class="xl86" colspan="2" style='border-right:none;border-bottom:none;' x:str></td>
    <td class="xl87" colspan="2" style='border-right:none;border-bottom:none;' x:str></td>
    <td class="xl86" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:none;' x:str></td>
   </tr>
   <tr height="20" class="xl65" style='height:15.00pt;mso-height-source:userset;mso-height-alt:300;'>
    <td class="xl77" height="20" style='height:15.00pt;' x:str>说明:</td>
    <td class="xl88" colspan="10" style='border-right:.5pt solid windowtext;border-bottom:none;'></td>
   </tr>
   <tr height="20" class="xl65" style='height:15.00pt;mso-height-source:userset;mso-height-alt:300;'>
    <td class="xl84" height="20" colspan="3" style='height:15.00pt;border-right:none;border-bottom:none;' x:str>登记机关登记人员：</td>
    <td class="xl86" colspan="2" style='border-right:none;border-bottom:none;' x:str>${baseInfo.zhucedengjirenyuan }</td>
    <td class="xl86" colspan="2" style='border-right:none;border-bottom:none;' x:str></td>
    <td class="xl87" colspan="2" style='border-right:none;border-bottom:none;' x:str></td>
    <td class="xl101" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:none;' x:str>（登记机关专用章）</td>
   </tr>
   <tr height="20" class="xl65" style='height:15.00pt;mso-height-source:userset;mso-height-alt:300;'>
    <td class="xl89" height="20" style='height:15.00pt;'></td>
    <td class="xl90" colspan="2" style='mso-ignore:colspan;'></td>
    <td class="xl91" colspan="2" style='border-right:none;border-bottom:none;'></td>
    <td class="xl90" colspan="2" style='mso-ignore:colspan;'></td>
    <td class="xl86" colspan="2" style='border-right:none;border-bottom:none;' x:str></td>
    <td class="xl86" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:none;' x:str></td>
   </tr>
   <tr height="44" class="xl65" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl92" height="44" colspan="3" style='height:33.00pt;border-right:none;border-bottom:.5pt solid windowtext;' x:str>使用登记证编号：</td>
    <td class="xl68" colspan="4" style='border-right:none;border-bottom:.5pt solid windowtext;'>${baseInfo.dengjizhengbianhao }</td>
    <td class="xl93" colspan="2" style='border-right:none;border-bottom:.5pt solid windowtext;' x:str>登记机关：</td>
    <td class="xl105" colspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str></td>
   </tr>
   <tr height="40" style='height:30.00pt;'>
    <td class="xl65" height="40" colspan="11" style='height:30.00pt;mso-ignore:colspan;'></td>
   </tr>
   <tr height="40" class="xl65" style='height:30.00pt;mso-height-source:userset;mso-height-alt:600;'>
    <td class="xl94" height="40" colspan="11" style='height:30.00pt;border-right:none;border-bottom:none;' x:str>门座式起重机产品数据表</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl221" height="28" colspan="6" style='height:21.00pt;mso-ignore:colspan;'></td>
    <td class="xl223" colspan="3" style='border-right:none;border-bottom:none;' x:str>编号：</td>
    <td class="xl245" colspan="2" style='border-right:none;border-bottom:none;'></td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="2" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>产品品种</td>
    <td class="xl224" colspan="4" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' >${craneParam.shebeipinzhong }</td>
    <td class="xl225" colspan="3" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>产品总图图号</td>
    <td class="xl225" colspan="2" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${craneParam.chanpintuhao }</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="2" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>整机制造标准</td>
    <td class="xl224" colspan="4" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${craneParam.zhizaobiaozhun }</td>
    <td class="xl225" colspan="3" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>设计使用年限</td>
    <td class="xl225" colspan="2" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${craneParam.shebeishiyongnianxian }</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="2" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>型式试验机构</td>
    <td class="xl224" colspan="9" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' >${craneParam.shiyanjigou }</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="2" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>型式试验日期</td>
    <td class="xl227" colspan="4" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${craneParam.shiyanriqi }</td>
    <td class="xl225" colspan="3" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>型式试验证书编号</td>
    <td class="xl225" colspan="2" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${craneParam.shiyanzhengshubianhao }</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl228" height="28" colspan="11" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:none;text-align: center;' x:str>主要参数和用途</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="3" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>额定起重力矩</td>
    <td class="xl225" colspan="2" style='border:none;border:.5pt solid windowtext;'>${craneParam.edingqizhongliju }</td>
    <td class="xl230" style='border:.5pt solid windowtext;' x:str>t•m</td>
    <td class="xl226" colspan="3" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>最大起重力矩</td>
    <td class="xl225" colspan="1" style='border:none;border:.5pt solid windowtext;'>${craneParam.zuidaqizhongliju }</td>
    <td class="xl230" style='border:.5pt solid windowtext;' x:str>t•m</td>
   </tr>
   <tr height="18.67" style='height:14.00pt;mso-height-source:userset;mso-height-alt:280;'>
    <td class="xl231" height="37.33" colspan="3" rowspan="2" style='height:28.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>整机工作级别</td>
    <td class="xl231" colspan="3" rowspan="2" style='border:.5pt solid windowtext;'>${craneParam.gongzuojibie }</td>
    <td class="xl231" colspan="2" rowspan="2" style='border:none;border-bottom:.5pt solid windowtext;' x:str>起升高度</td>
    <td class="xl247" style='border:.5pt solid windowtext;' x:str>轨上</td>
    <td class="xl225" colspan="1" style='border:none;border-bottom:.5pt solid windowtext;'>${craneParam.qishenggaodu_shang }</td>
    <td class="xl238" style='border:.5pt solid windowtext;' x:str>m</td>
   </tr>
   <tr height="18.67" style='height:14.00pt;mso-height-source:userset;mso-height-alt:280;'>
    <td class="xl247" style='border:.5pt solid windowtext;' x:str>轨下</td>
    <td class="xl225" colspan="1" style='border:none;border-bottom:.5pt solid windowtext;'>${craneParam.qishenggaodu_xia }</td>
    <td class="xl230" style='border:.5pt solid windowtext;' x:str>m</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="3" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>最小工作幅度</td>
    <td class="xl225" colspan="2" style='border:none;border-bottom:.5pt solid windowtext;'>${craneParam.gongzuofudu }</td>
    <td class="xl230" style='border:.5pt solid windowtext;' x:str><span style='border:.5pt solid windowtext;'></span>m</td>
    <td class="xl226" colspan="3" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>最小幅度起重量</td>
    <td class="xl225" colspan="1" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${craneParam.zuixiaofuduqizhongliang }</td>
    <td class="xl238" style='border:.5pt solid windowtext;' x:str>t</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="3" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>最大工作幅度</td>
    <td class="xl225" colspan="2" style='border:none;border-bottom:.5pt solid windowtext;'>${craneParam.zuidagongzuofudu }</td>
    <td class="xl238" style='border:.5pt solid windowtext;' x:str><span style='mso-spacerun:yes;'></span>m</td>
    <td class="xl226" colspan="3" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>最大幅度起重量</td>
    <td class="xl225" colspan="1" style='border:.5pt solid windowtext;'>${craneParam.zuidafuduqizhongliang }</td>
    <td class="xl230" style='border:.5pt solid windowtext;' x:str>t</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="3" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>整机最大高度</td>
    <td class="xl225" colspan="2" style='border:none;border-bottom:.5pt solid windowtext;'>${craneParam.zuidagaodu }</td>
    <td class="xl230" style='border:.5pt solid windowtext;' x:str>m</td>
    <td class="xl226" colspan="3" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>全程变幅时间</td>
    <td class="xl225" colspan="1" style='border:none;border-bottom:.5pt solid windowtext;'>${craneParam.bianfushijian }</td>
    <td class="xl238" style='border:.5pt solid windowtext;' x:str>m/min</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="3" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>行走机械轨距</td>
    <td class="xl225" colspan="2" style='border:none;border-bottom:.5pt solid windowtext;'>${craneParam.jixieguiju }</td>
    <td class="xl238" style='border:.5pt solid windowtext;' x:str>m</td>
    <td class="xl226" colspan="3" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>支腿调节长度</td>
    <td class="xl225" colspan="1" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${craneParam.zhituichangdu }</td>
    <td class="xl230" style='border:.5pt solid windowtext;' x:str>mm</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="3" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>最大计算轮压</td>
    <td class="xl225" colspan="2" style='border:none;border-bottom:.5pt solid windowtext;'>${craneParam.zuidalunya }</td>
    <td class="xl230" style='border:.5pt solid windowtext;' x:str>kN</td>
    <td class="xl226" colspan="3" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>整机设计重量</td>
    <td class="xl225" colspan="1" style='border:none;border-bottom:.5pt solid windowtext;'>${craneParam.zhengchezhongliang }</td>
    <td class="xl238" style='border:.5pt solid windowtext;' x:str>t</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="3" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>供电电源</td>
    <td class="xl225" colspan="2" style='border:none;border-bottom:.5pt solid windowtext;'>${craneParam.gongdiandianyuan }</td>
    <td class="xl238" style='border:.5pt solid windowtext;' x:str>V</td>
    <td class="xl226" colspan="3" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>整机功率</td>
    <td class="xl225" colspan="1" style='border:none;border-bottom:.5pt solid windowtext;'>${craneParam.zhengjigonglv }</td>
    <td class="xl230" style='border:.5pt solid windowtext;' x:str>kW</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="3" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>工作环境温度</td>
    <td class="xl225" colspan="2" style='border:none;border-bottom:.5pt solid windowtext;'>${craneParam.gongzuowendu }</td>
    <td class="xl230" style='border:.5pt solid windowtext;' x:str>℃</td>
    <td class="xl226" colspan="3" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>用<span style='mso-spacerun:yes;'>&nbsp; </span>途</td>
    <td class="xl225" colspan="2" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${craneParam.yongtu }</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl228" height="28" colspan="11" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>主要结构型式</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="3" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>臂架结构型式</td>
    <td class="xl240" colspan="8" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${craneParam.bijiaxingshi }</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="3" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>门架结构型式</td>
    <td class="xl241" colspan="4" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${craneParam.menjiajiegouxingshi }</td>
    <td class="xl224" colspan="2" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>回转支承型式</td>
    <td class="xl224" colspan="2" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${craneParam.huizhuanzhichengxingshi }</td>
   </tr>
   <tr height="28" style='height:21.00pt;mso-height-source:userset;mso-height-alt:420;'>
    <td class="xl224" height="28" colspan="3" style='height:21.00pt;border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>主要受力结构件材料</td>
    <td class="xl242" colspan="8" style='border:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>${craneParam.shoulijiegoucailiao }</td>
   </tr>
 
  </table>
 </body>
</html>
