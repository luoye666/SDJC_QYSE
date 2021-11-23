<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="/fmt.tld" %>
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
	
	.ttt{
		
		}
	.ttt tr{
	border:1px solid black;}
</style>
<script type="text/javascript">
var api = frameElement.api, W = api.opener;
api.button(
	{
	    id:'valueAdd',
		name:'添加',
		callback:add
	},{
	    id:'valueCx',
		name:'查询',
		callback:search
	},{
	    id:'valueQx',
		name:'取消'
	}
);

var unitJSONLX = [
				   {"id":"shebeixinxi","name":"设备信息"},
				   {"id":"guolushuxing","name":"锅炉属性"},
				   {"id":"yalirongqishuxing","name":"压力容器属性"},
				   {"id":"diantishuxiing","name":"电梯属性"},
				   {"id":"qizhongjishuxing","name":"起重机属性"},
				   {"id":"changcheshuxing","name":"厂车属性"},
				   {"id":"youlesheshishuxing","name":"游乐设施属性"},
				   {"id":"guandaoshuxing","name":"管道属性"},
				   {"id":"suodaoshuxing","name":"索道属性"}
				];

var unitJSON = [
				{"id":"t.shebeimingcheng","name":"设备名称","type":"VARCHAR2"},  //设备
				{"id":"chuchangbianhao","name":"设备出厂编号","type":"VARCHAR2"},
				{"id":"NEIBUBIANHAO","name":"单位内部编号","type":"VARCHAR2"},
				{"id":"zhucedaima","name":"设备注册代码","type":"VARCHAR2"},
				{"id":"SHEBEIDAIMA","name":"设备代码","type":"VARCHAR2"},
				{"id":"dengjizhengbianhao","name":"使用登记证编号","type":"VARCHAR2"},
				{"id":"shiyongdanwei","name":"使用单位","type":"VARCHAR2"},
				{"id":"shiyongdanwei_dizhi","name":"使用单位地址","type":"VARCHAR2"},
				{"id":"shiyongdanwei_lianxiren","name":"使用联系人","type":"VARCHAR2"},
				{"id":"shiyongdanwei_lianxidianhua","name":"使用联系人电话","type":"VARCHAR2"},
				{"id":"shiyongdanwei_youbian","name":"使用单位邮编","type":"VARCHAR2"},
				{"id":"SHIYONGDANWEI_CODE","name":"使用单位代码","type":"VARCHAR2"},
				{"id":"SHIYONGDANWEI_SUOSHUHANGYE","name":"使用单位行业","type":"VARCHAR2"},
				{"id":"FADINGDAIBIAOREN","name":"使用单位代表人","type":"VARCHAR2"},
				{"id":"SHIYONGDANWEI_XINGZHI","name":"使用单位性质","type":"VARCHAR2"},
				{"id":"BAOGAOBIANHAO","name":"报告编号","type":"VARCHAR2"},
				{"id":"ANQUANGUANLIBUMEN","name":"安全管理部门","type":"VARCHAR2"},
				{"id":"ANQUANGUANLI_LIANXIDIANHUA","name":"安全管理部门电话","type":"VARCHAR2"},
				{"id":"ANQUANGUANLIRENYUAN","name":"安全管理部门联系人","type":"VARCHAR2"},
				
				{"id":"zhizaodanwei","name":"制造单位","type":"VARCHAR2"},
				{"id":"ZHIZAORIQI","name":"制造日期（字符型）","type":"VARCHAR2"},
				{"id":" ZHIZAORIQI_DATE","name":"制造日期（日期型）","type":"date"},
				{"id":"ZHIZAODANWEIXUKEZHENGBIANHAO","name":"制造单位许可证编号","type":"VARCHAR2"},
				
				{"id":"ZHIZAODANWEI_CODE","name":"制造单位代码","type":"VARCHAR2"},
				{"id":"ZHIZAODANWEI_ZIGEZHENGSHU","name":"制造单位资格证书","type":"VARCHAR2"},
				{"id":"ZHIZAODANWEI_LIANXIDIANHUA","name":"制造单位联系电话","type":"VARCHAR2"},
				{"id":"ZHIZAODANWEI_SHIYONGCHANGHE","name":"制造单位使用场合","type":"VARCHAR2"},
				
				{"id":"shigongdanwei","name":"施工单位","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_DIZHI","name":"施工单位地址","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_LIANXIDIANHUA","name":"施工单位联系电话","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_LIANXIREN","name":"施工单位联系人","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_JIANCHENG","name":"施工单位简称","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_XUKEZHENGBIANHAO","name":"施工单位许可证","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_CHUANZHEN","name":"施工单位传真","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_YOUBIAN","name":"施工单位邮编","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_DAIMA","name":"施工单位代码","type":"VARCHAR2"},
				{"id":"WEIHUBAOYANGDANWEI","name":"维保单位","type":"VARCHAR2"},
				{"id":"WEIHUBAOYANGDANWEI_DIANHUA","name":"维保单位电话","type":"VARCHAR2"},
				{"id":"WHBYDW_ZIZHIZHENGSHU","name":"维保单位资质证书","type":"VARCHAR2"},
				{"id":"WEIHUBAOYANGDANWEI_LIANXIREN","name":"维保单位联系人","type":"VARCHAR2"},
				{"id":"WEIHUBAOYANGDANWEI_DIANHUA","name":"维保单位电话","type":"VARCHAR2"},
				{"id":"WEIHUBAOYANGDANWEI_CODE","name":"维保单位代码","type":"VARCHAR2"},
				{"id":"anzhuangdanwei","name":"安装单位","type":"VARCHAR2"},
				{"id":"ANZHUANGDANWEI_DAIMA","name":"安装单位代码","type":"VARCHAR2"},
				{"id":"ANZHUANGDANWEI_ZIGEZHENGSHU","name":"安装单位资格证书","type":"VARCHAR2"},
				{"id":"ANZHUANGDANWEI_LIANXIREN","name":"安装单位联系人","type":"VARCHAR2"},
				{"id":"ANZHUANGDANWEI_LIANXIDIANHUA","name":"安装单位联系电话","type":"VARCHAR2"},
				{"id":"ANZHUANGJIANJIANRIQI","name":"安装监检日期","type":"date"},
				{"id":"ANZHUANGJIANJIANJIGOU","name":"安装监检机构","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_SHIGONGRIQI","name":"施工日期","type":"date"},
				{"id":"SHIGONGDANWEI_JUNGONGRIQI","name":"竣工日期","type":"date"},
				{"id":"anzhuangdanwei","name":"安装单位","type":"VARCHAR2"},
				{"id":"ANZHUANGRIQI","name":"安装日期","type":"date"},
				{"id":"ANQUANDENGJI","name":"安全等级","type":"VARCHAR2"},
				{"id":"NIANCHANZHI","name":"年产值","type":"VARCHAR2"},
				{"id":"TIANBIAORENYUAN","name":"填表人","type":"VARCHAR2"},
				{"id":"TIANBIAORIQI","name":"填表日期","type":"date"},
				{"id":"JIANGUANLEIBIE","name":"监管类别","type":"VARCHAR2"},
				
				{"id":"SHEJIDANWEI","name":"设计单位","type":"VARCHAR2"},
				{"id":"SHEJIDANWEIDAIMA","name":"设计单位代码","type":"VARCHAR2"},
				{"id":"TOUYONGRIQI","name":"投用日期（字符型）","type":"VARCHAR2"},
				{"id":"TOUYONGRIQI_DATE","name":"投用日期（日期型）","type":"date"},
				{"id":"SUOSHUCHEJIAN","name":"所属车间","type":"VARCHAR2"},
				{"id":"BEIZHU","name":"备注","type":"VARCHAR2"},
				{"id":"CHANPINHEGEZHENGBIANHAO","name":"产品合格证编号","type":"VARCHAR2"},
				{"id":"JIANDINGBAOGAOBIANHAO","name":"鉴定报告编号","type":"VARCHAR2"},
				{"id":"WENJIANJIANDINGJIGOU","name":"文件鉴定机构","type":"VARCHAR2"},
				
				
				{"id":"ZHIZAOJIANJIANJIGOU","name":"制造监检机构","type":"VARCHAR2"},
				{"id":"JIANJIANHEZHUNZHENG","name":"监检整证书","type":"VARCHAR2"},
				{"id":"JIANJIANZHENGSHUBIANHAO","name":"监检证书编号","type":"VARCHAR2"},
				
				{"id":"ZHIZAOJIANJIANRIQI","name":"制造监检日期","type":"date"},
				{"id":"YANSHOUDANWEI","name":"验收单位","type":"VARCHAR2"},
				{"id":"YANSHOURIQI","name":"验收日期","type":"date"},
				
				{"id":"ZHUCEDENGJIJIGOU","name":"注册登记机构","type":"VARCHAR2"},
				{"id":"dj_jingbanren","name":"注册登记人","type":"VARCHAR2"},
				{"id":"ZHUCERIQI","name":"注册日期","type":"date"},
				{"id":"JINGBANREN","name":"经办人","type":"VARCHAR2"},
				{"id":"JINGBANRENDIANHUA","name":"经办人电话","type":"VARCHAR2"},
				{"id":"GUDINGZICHANZHI","name":"固定资产","type":"VARCHAR2"},
				{"id":"SHEBEISHIYONGNIANXIAN","name":"设备使用年限","type":"VARCHAR2"},
				{"id":"chanquandanwei","name":"产权单位","type":"VARCHAR2"},
				{"id":"CHANQUANDANWEI_FARENDAIBIAO","name":"产权单位法人代表","type":"VARCHAR2"},
				{"id":"CHANQUANDANWEI_DIANHUA","name":"产权单位电话","type":"VARCHAR2"},
				{"id":"CHANQUANDANWEI_SUOSHUHANGYE","name":"产权单位行业","type":"VARCHAR2"},
				{"id":"CHANQUANDANWEI_YOUBIAN","name":"产权单位邮编","type":"VARCHAR2"},
				{"id":"CHANQUANDANWEI_XINGZHI","name":"产权单位性质","type":"VARCHAR2"},
				
				
				{"id":"state","name":"设备状态:0 未报检  1已报检  2 检验中  3 已检验  4 已登记0 领取","type":"VARCHAR2"},
				{"id":"ZCSTATUS","name":"是否注册 0 未注册    1 已注册---定期检监  2  已告知----安装监检  3 已停用  4 改造维修监检 5拆除 6待办 7报废","type":"VARCHAR2"},
				{"id":"shebeididian","name":"设备地点","type":"VARCHAR2"},
				{"id":"ZHUGUANBUMEN","name":"主管部门","type":"VARCHAR2"},
				{"id":"ZHUGUANFUZEREN","name":"主管负责人","type":"VARCHAR2"},
				{"id":"ZHUGUANFUZERENDIANHUA","name":"主管负责人电话","type":"VARCHAR2"},
				
				{"id":"xiacijianyanriqi","name":"下次检验日期","type":"date"},
				{"id":"JIANYANJIESHURIQI","name":"检验日期","type":"date"},
				
				{"id":"SHEBEIXINGHAO","name":"设备型号","type":"VARCHAR2"},
				{"id":"SHEBEIXINGSHI","name":"设备型式","type":"VARCHAR2"},
				{"id":"BIAOZHUNJIAGE","name":"标准价格","type":"VARCHAR2"},
				{"id":"DINGSHENGXINGSHI","name":"顶升形式","type":"VARCHAR2"},
				{"id":"EDINGSUDU","name":"额定速度","type":"VARCHAR2"},
				{"id":"EDINGSUDU_SHANGXING","name":"额定速度事项","type":"VARCHAR2"},
				{"id":"EDINGSUDU_XIAXING","name":"额定速度下行","type":"VARCHAR2"},
				{"id":"EDINGZAIZHONGLIANG","name":"额定起重量","type":"VARCHAR2"},
				{"id":"ERLIEJIANYANHUANJING","name":"恶劣检验环境","type":"VARCHAR2"},
				{"id":"GONGGONGJIAOTONGXING","name":"公共交通","type":"VARCHAR2"},
				{"id":"JIAOYANXIANSUQI","name":"校验线索","type":"VARCHAR2"},
				{"id":"KONGZHIFANGSHI","name":"控制方式","type":"VARCHAR2"},
				{"id":"MINGYIKUANDU","name":"名义宽度","type":"VARCHAR2"},
				{"id":"MINGYISUDU","name":"名义速度","type":"VARCHAR2"},
				{"id":"QINGXIEJIAO","name":"倾斜角","type":"VARCHAR2"},
				{"id":"QUDUANCHANGDU","name":"区段长度","type":"VARCHAR2"},
				{"id":"TISHENGGAODU","name":"提升高度","type":"VARCHAR2"},
				{"id":"YOUGUANSHULIANG","name":"油罐数量","type":"VARCHAR2"},
				{"id":"CAIZHI","name":"材质","type":"VARCHAR2"},
				{"id":"CHELIANGDIPANHAO","name":"车辆牌号","type":"VARCHAR2"},
				{"id":"CHELIANGLEIXING","name":"车辆类型","type":"VARCHAR2"},
				{"id":"CHELIANGXINGHAO","name":"车辆型号","type":"VARCHAR2"},
				{"id":"CHEPAIHAO","name":"车牌号","type":"VARCHAR2"},
				{"id":"FADONGJIHAO","name":"发动机号","type":"VARCHAR2"},
				{"id":"GONGZUOJIEZHI","name":"工作介质","type":"VARCHAR2"},
				
				{"id":"QIPINGJINGZHONG","name":"气瓶净重","type":"VARCHAR2"},
				{"id":"QIPINGSHULIANG","name":"气瓶数量","type":"VARCHAR2"},
				{"id":"QITILEIXING","name":"气瓶类型","type":"VARCHAR2"},
				{"id":"RONGJI","name":"容积","type":"VARCHAR2"},
				{"id":"CHELIANGLEIXING","name":"车辆类型","type":"VARCHAR2"},
				
				{"id":"GAOZHIRIQI","name":"告知日起","type":"date"},
				{"id":"GAOZHIBIANHAO","name":"告知编号","type":"VARCHAR2"},
				
				{"id":"JIANYANJIELUN","name":"检验结论","type":"VARCHAR2"},
				{"id":"JIANYANLEIXING","name":"检验类型","type":"VARCHAR2"},
				{"id":"JIANYANJIGOU","name":"检验机构","type":"VARCHAR2"},
				{"id":"JIANYANJIGOU_CODE","name":"检验机构代码","type":"VARCHAR2"},
				{"id":"BIANGENGRIQI","name":"变更日期","type":"date"},
				{"id":"WJ_BAOGAOBIANHAO","name":"外检报告编号","type":"VARCHAR2"},
				{"id":"NJ_BAOGAOBIANHAO","name":"内检报告编号","type":"VARCHAR2"},
				{"id":"ND_BAOGAOBIANHAO","name":"年度报告编号","type":"VARCHAR2"},
				{"id":"QM_BAOGAOBIANHAO","name":"全面报告编号","type":"VARCHAR2"},
				{"id":"GONGCHENGMINGCHENG","name":"工程名称","type":"VARCHAR2"},
				{"id":"YANSHOUJIGOU ","name":"验收机构","type":"VARCHAR2"},
				{"id":"YANSHOUBAOGAOBIANHAO","name":"验收报告编号","type":"VARCHAR2"},
				{"id":"DAXIUZHOUQI","name":"大修周期","type":"VARCHAR2"},
				{"id":"WEIBAOZHOUQI","name":"维保周期","type":"VARCHAR2"},
				{"id":"ZHUYAOWENTI","name":"主要问题","type":"VARCHAR2"},
				{"id":"SHIGULEIBIE","name":"事故类别","type":"VARCHAR2"},
				{"id":"SHIGUFASHENGRIQI","name":"事故发生日期","type":"date"},
				{"id":"SHIGUCHULIJIEGUO","name":"事故处理结果","type":"VARCHAR2"},
				{"id":"SHEBEIBIANDONGFANGSHI","name":"设备变动方式","type":"VARCHAR2"},
				{"id":"SHEBEIBIANDONGXIANGMU","name":"设备变动项目","type":"VARCHAR2"},
				{"id":"SHEBEIBIANDONGRIQI","name":"设备变动日期","type":"VARCHAR2"},
				{"id":"CHENGDANDANWEI","name":"承担单位","type":"VARCHAR2"},
				{"id":"CHENGDANDANWEI_CODE","name":"承担单位代码","type":"VARCHAR2"},
				{"id":"BAOXIANJIGOU","name":"保险机构","type":"VARCHAR2"},
				{"id":"BAOXIANXIANZHONG","name":"保险险种","type":"VARCHAR2"},
				{"id":"BAOXIANFEI","name":"保险费","type":"VARCHAR2"},
				{"id":"BAOXIANJI","name":"保险金","type":"VARCHAR2"},
				{"id":"BAOXIANJIAZHI","name":"保险价值","type":"VARCHAR2"},
				{"id":"SHIFOU_ZHONGDAWEIXIANYUAN","name":"是否重大危险源","type":"VARCHAR2"},
				{"id":"SHIFOU_RENKOUMIJIQU ","name":"是否人口密集区","type":"VARCHAR2"},
				{"id":"SHIFOU_YINGJIFANGAN","name":"是否设置应急方案","type":"VARCHAR2"},
				{"id":"SHIFOU_ZHONGDIANJIANKONG","name":"是否重点监控","type":"VARCHAR2"},
				{"id":"SHIYONGCHANGSUO","name":"使用场所","type":"VARCHAR2"},
				{"id":"SHIYONGDANWEI_CAOZUORENYUAN","name":"操作人员","type":"VARCHAR2"},
				{"id":"DENGJILEIBIE","name":"登记类别","type":"VARCHAR2"},
				{"id":"CHANPINTUHAO","name":"产品图号","type":"VARCHAR2"},
				{"id":"SHEJIXUKEZHENG","name":"设计许可证","type":"VARCHAR2"},
				{"id":"SHIFOU_DYRRJS","name":"是否吊运熔融金属","type":"VARCHAR2"},
				//锅炉：
				{"id":"","name":"**************************锅炉属性*******************************","type":"varchar2"},
				{"id":"edingchuli","name":"额定出力","type":"varchar2"},
				{"id":"edingyali","name":"额定压力","type":"varchar2"},
				{"id":"jiezhi","name":"介质","type":"varchar2"},
				{"id":"yunxingrexiaolv","name":"运行热效率","type":"varchar2"},
				{"id":"edingwendu","name":"额定温度","type":"varchar2"},
				{"id":"shiyongwendu","name":"使用温度","type":"varchar2"},
				{"id":"edinggonglv","name":"额定功率","type":"varchar2"},
				{"id":"gonglvdanwei","name":"功率单位","type":"varchar2"},
				{"id":"chukouwendu","name":"出口温度","type":"varchar2"},
				{"id":"shejiyali","name":"设计压力","type":"varchar2"},
				{"id":"gongzuoyali","name":"工作压力","type":"varchar2"},
				{"id":"gongzuowendu","name":"工作温度","type":"varchar2"},
				{"id":"ranliaozhonglei","name":"燃料种类","type":"varchar2"},
				{"id":"yongtu","name":"用途","type":"varchar2"},
				{"id":"yalidengji","name":"压力等级","type":"varchar2"},
				{"id":"edingzhengfaliang","name":"额定蒸发量(蒸吨/时)","type":"varchar2"},
				{"id":"chengqu","name":"是否在城市建成区内","type":"varchar2"},
				{"id":"chuchenzhuangzhi","name":"是否配备有效的除尘装置和脱硫脱硝装置","type":"varchar2"},
				{"id":"wuranwu_pm25","name":"污染物排放量-PM2.5(吨/年)","type":"varchar2"},
				{"id":"wuranwu_pm10","name":"污染物排放量-PM10(吨/年)","type":"varchar2"},
				{"id":"wuranwu_pmso2","name":"污染物排放量-二氧化硫(SO2)(吨/年)","type":"varchar2"},
				{"id":"wuranwu_pmno2","name":"污染物排放量-二氧化氮(NO2)(吨/年)","type":"varchar2"},
				{"id":"fuhebiaozhun","name":"是否符合山东省排放标准","type":"varchar2"},
				{"id":"ranshaojiezhiliang","name":"年耗燃烧介质量","type":"varchar2"},
				{"id":"biaozhunmei","name":"折合标准煤","type":"varchar2"},
				{"id":"nianhaodianliang","name":"年耗电量","type":"varchar2"},
				{"id":"nengxiaoceshi_dx","name":"是否按规定完成能效测试(定型)","type":"varchar2"},
				{"id":"nengxiaoceshi_dq","name":"是否按规定完成能效测试(定期)","type":"varchar2"},
				{"id":"rexiaolv_sheji","name":"热效率(设计值)","type":"varchar2"},
				{"id":"rexiaolv_shiji","name":"热效率(实际值)","type":"varchar2"},
				//压力容器：
				{"id":"","name":"**************************压力容器*******************************","type":"varchar2"},
				{"id":"caizhitongti","name":"材质筒体","type":"varchar2"},
				{"id":"caizhifengtou","name":"材质封头","type":"varchar2"},
				{"id":"caizhijiatao","name":"材质夹套","type":"varchar2"},
				{"id":"caizhineichen","name":"材质内衬","type":"varchar2"},
				{"id":"yalikecheng","name":"压力壳程","type":"varchar2"},
				{"id":"yaliguancheng","name":"压力管程","type":"varchar2"},
				{"id":"jiezhikecheng","name":"介质壳程","type":"varchar2"},
				{"id":"jiezhiguancheng","name":"介质管程","type":"varchar2"},
				{"id":"wendukecheng","name":"温度壳程","type":"varchar2"},
				{"id":"wenduguancheng","name":"温度管程","type":"varchar2"},
				{"id":"rongqineijing","name":"容器内径","type":"varchar2"},
				{"id":"gaodu","name":"容器高","type":"varchar2"},
				{"id":"rongqichang","name":"容器长","type":"varchar2"},
				{"id":"rongqimianji","name":"容积面积","type":"varchar2"},
				{"id":"jiegouxingshi","name":"结构型式","type":"varchar2"},
				{"id":"gongzuojiezhi","name":"介质","type":"varchar2"},
				{"id":"gongzuoyali","name":"工作压力","type":"varchar2"},
				{"id":"gongzuowendu","name":"工作温度","type":"varchar2"},
				//电梯：
				{"id":"","name":"**************************电梯*******************************","type":"varchar2"},
				{"id":"ceng","name":"层","type":"varchar2"},
				{"id":"zhan","name":"站","type":"varchar2"},
				{"id":"men","name":"门","type":"varchar2"},
				{"id":"mingyikuandu","name":"名义宽度","type":"varchar2"},
				{"id":"qingxiejiao","name":"倾斜角","type":"varchar2"},
				{"id":"shusongnengli","name":"输送能力","type":"varchar2"},
				{"id":"tishenggaodu","name":"提升高度","type":"varchar2"},
				{"id":"quduanchangdu","name":"区段长度","type":"varchar2"},
				{"id":"edingzaizhongliang","name":"额定载重量","type":"varchar2"},
				{"id":"edingsudu","name":"额定速度","type":"varchar2"},
				{"id":"edingsudu_shangxing","name":"额定速度（最大）","type":"varchar2"},
				{"id":"edingsudu_xiaxing","name":"额定速度（最小）","type":"varchar2"},
				{"id":"kongzhifangshi","name":"控制方式","type":"varchar2"},
				{"id":"youguanshuliang","name":"油罐数量","type":"varchar2"},
				{"id":"dingshengxingshi","name":"顶升形式","type":"varchar2"},
				{"id":"yunxingsudu","name":"电梯运行速度","type":"varchar2"},
				{"id":"zouxingjuli","name":"电梯走形距离","type":"varchar2"},
				{"id":"dianticengzhan","name":"电梯层站","type":"varchar2"},
				{"id":"shifou_zhongdaweixianyuan","name":"是否在人口密集区","type":"varchar2"},
				{"id":"shifou_renkoumijiqu","name":"是否重大危险源","type":"varchar2"},
				{"id":"shifou_yingjifangan","name":"是否重点监控特种设备","type":"varchar2"},
				{"id":"shifou_zhongdianjiankong","name":"是否制定事故应急措施和救援预案","type":"varchar2"},
				//游乐设施：
				{"id":"","name":"**************************游乐设施*******************************","type":"varchar2"},
				{"id":"xiansudu","name":"游乐设施线速度（m/s）","type":"varchar2"},
				{"id":"ylss_gaodu","name":"游乐设施高度(m)","type":"varchar2"},
				{"id":"edingchengkerenshu","name":"额定乘客人数（人）","type":"varchar2"},
				{"id":"edingzaihe","name":"额定载荷（Kg）","type":"varchar2"},
				{"id":"sudu","name":"额定速度（m/s）","type":"varchar2"},
				{"id":"qingjiao","name":"倾夹角或坡度","type":"varchar2"},
				{"id":"fusudu","name":"副速度（m/s）","type":"varchar2"},
				{"id":"qudongxingshi","name":"驱动形式","type":"varchar2"},
				{"id":"qudongzhugonglv","name":"驱动主功率（kw）","type":"varchar2"},
				{"id":"dianya","name":"电压（v）","type":"varchar2"},
				{"id":"fugonglv","name":"副功率（kw）","type":"varchar2"},
				{"id":"gaodu","name":"座舱高度（m）","type":"varchar2"},
				{"id":"huizhuanzhijing","name":"回转直径（m）","type":"varchar2"},
				{"id":"guiju","name":"轨距","type":"varchar2"},
				{"id":"guijuchangdu","name":"轨距长度（m）","type":"varchar2"},
				{"id":"shuihuatigaodu","name":"水滑梯高度（m）","type":"varchar2"},
				{"id":"youlechishuishen","name":"游乐池水深（m）","type":"varchar2"},
				//压力管道：
				{"id":"","name":"**************************压力管道*******************************","type":"varchar2"},
				{"id":"gongchengzhijing","name":"公称直径（mm）","type":"varchar2"},
				{"id":"gongchengbihou","name":"公称壁厚（mm）","type":"varchar2"},
				{"id":"guandaochangdu","name":"管道长度（km）","type":"varchar2"},
				{"id":"shusongjiezhi","name":"输送介质","type":"varchar2"},
				{"id":"shejiyali","name":"设计压力","type":"varchar2"},
				{"id":"gongzuoyali","name":"最高工作压力","type":"varchar2"},
				{"id":"shejiwendu","name":"设计温度","type":"varchar2"},
				{"id":"gongzuowendu","name":"最高工作温度","type":"varchar2"},
				//客运索道：
				{"id":"","name":"**************************客运索道*******************************","type":"varchar2"},
				{"id":"yunxingsudu","name":"运行速度（m/s）","type":"varchar2"},
				{"id":"changdu","name":"索道长度（m）","type":"varchar2"},
				{"id":"yunzainengli","name":"运载能力（p/h）","type":"varchar2"},
				{"id":"yunzaicheliangxingshi","name":"运载车辆形式","type":"varchar2"},

				
				
				
				//起重
				{"id":"","name":"**************************起重机*******************************","type":"varchar2"},
				{"id":"EDINGQIZHONGLIANG","name":"额定起重量","type":"varchar2"},
				{"id":"zuidafuduqizhongliang","name":"最大幅度起重量","type":"varchar2"},
				{"id":"zuidaqizhongliju","name":"最大起重力矩","type":"varchar2"},
				{"id":"KUADU","name":"跨度","type":"varchar2"},
				{"id":"QISHENGSUDU","name":"起升速度","type":"varchar2"},
				{"id":"craneParam.qishenggaodu","name":"起升高度","type":"varchar2"},
				{"id":"DACHEYUNXINGSUDU","name":"大车运行速度","type":"varchar2"},
				{"id":"xiaocheyunxingsudu","name":"小车运行速度","type":"varchar2"},
				{"id":"gongzuofudu_guju","name":"工作幅度_前伸","type":"varchar2"},
				{"id":"gongzuofudu_guju","name":"工作幅度_轨距:","type":"varchar2"},
				{"id":"gongzuofudu_houshen","name":"工作幅度_后伸","type":"varchar2"},
				{"id":"huizhuansudu","name":"回转速度","type":"varchar2"},
				{"id":"sijishi","name":"司机室","type":"varchar2"},
				{"id":"yidongsudu","name":"移动速度","type":"varchar2"},
				//厂车
				{"id":"","name":"**************************厂车*******************************","type":"varchar2"},
				{"id":"PAIZHAOHAOMA","name":"厂车牌照编号","type":"varchar2"},
				{"id":"CHANGPAIXINGHAO","name":"厂牌型号","type":"varchar2"},
				{"id":"CHANGNEICHELIANG_EDINGZAIHE","name":"车辆额定载荷","type":"varchar2"},
				{"id":"CHELIANGMINGCHENG","name":"车辆名称","type":"varchar2"},
				{"id":"DONGLIFANGSHI","name":"动力方式","type":"varchar2"},
				{"id":"QUDONG","name":"驱动","type":"varchar2"},
				{"id":"KONGCHEZHONGLIANG","name":"空车重量","type":"varchar2"},
				{"id":"edingqizhongliang","name":"额定载重","type":"varchar2"},
				{"id":"YANSE","name":"颜色","type":"varchar2"},
				{"id":"tuoguache","name":"是否拖挂车","type":"varchar2"},
				{"id":"FADONGJIBIANHAO","name":"发动机编号","type":"varchar2"},
				{"id":"DIPANBIANHAO","name":"底盘编号","type":"varchar2"},
				{"id":"SHIYONGQUYU","name":"使用区域","type":"varchar2"},
				{"id":"ZUIGAOSHISU","name":"最高时速(Km)","type":"varchar2"},
				{"id":"yunxingsudu","name":"车辆运行速度（km/h）","type":"varchar2"},
				{"id":"ranliaozhonglei","name":"燃料种类","type":"varchar2"},
				];
var unitJsonTiaojian = [
						{"id":"1","name":"包含"},
						{"id":"=","name":"等于"},
						{"id":"<>","name":"不等于"},
						{"id":"2","name":"不包含"},
						{"id":"3","name":"为空"},
						{"id":"4","name":"大于"},
						{"id":"5","name":"小于"},
						{"id":"8","name":"以其开头"},
						{"id":"9","name":"不以其开头"},
						{"id":"10","name":"以其结尾"},
						{"id":"11","name":"不以其结尾"},
						];
var unitJsonLianjie = [{"id":"AND","name":"AND"},
						{"id":"OR","name":"OR"}];

var unitJsonPXNR = [{"id":"ID","name":"主键"},
					{"id":"shiyongdanwei","name":"使用单位"},
					{"id":"zhucedaima","name":"注册代码"},
					{"id":"xiacijianyanriqi","name":"下次检验日期"}];

var unitJsonPXLX = [{"id":"asc","name":"正序"},
						{"id":"desc","name":"倒序"}];

function closeBefore(){
	$("span").remove();
}
//增加条件
var index = 0;
function add(){
	index++ ;
	zhuijia(index);
	return false;
};
//保存自定义流程
function save(){
	//alert($('#zdytj').val());
	//var s = $('#zdytj option:selected').val();//选中的文本
};
//查询自定义语句
function find(){
	tiaojianZhuanhuan();
	return false;
};
function search(){
	tiaojianZhuanhuan();
	var params = $STONE.formSerializedToJSON("#frm_jcsj_zdy_search_conditions");
	W.search(params);
//	return false;
};
window.onload = function(){
	//生成级联下拉框
	$.post("<%=path%>/dirList!getSetypeList.do",{},
		function (data, textStatus){
			$STONE.creatSelectMenuBySeType("shebeizhonglei,shebeileibie",data.dirDatas,"200px",true,"<%=path%>");
	},"JSON");
	$.post("<%=path%>/dicList!getDataListByCode.do",{code:"SD_XZQH"},
		function (data, textStatus){
			$STONE.creatSelectMenu("shidaima,quhuadaima,xiangzhendaima",data.dicDatas,"200px",true,"<%=path%>");
	},"JSON");
	
	
	selectDemo("lianjie",unitJsonLianjie,"120px");
	selectDemo("zdytj",unitJSON,"120px");
	selectDemo("zdytj_fh",unitJsonTiaojian,"80px");
	$('#zdytj').selectmenu({
		change:function(){
			var lx = $('#zdytj').val();
   		}
	})
	selectDemo("paixuneirong",unitJsonPXNR,"120px");
	selectDemo("paixuleixing",unitJsonPXLX,"120px");
}
function setInputValue(obj){
	$("#"+obj.id).attr("value",obj.value);
}

//增加追加
function zhuijia(index){
				var str = '<span><table style="width: 100%;" name="ttt" >' +
				'<tr><th style="width: 20%;"></th><td style="width: 15%;"></td><td style="width: 15%;"></td><td style="width: 20%;"></td><td style="width: 40%;"></td> </tr>' +
				'<tr><th></th><td colspan="4"><div id="lianjie'+index+'_div" style="width:120px;"><select name="lianjie" sltValue="AND"  id="lianjie'+index+'" style="width:120px;"></select></div></td></tr>'+
				'<tr>' +
				'<th>追加条件：</th>' +
				
	  			'<td >' +
	  			'<div id="zdyfw'+index+'_div" style="display: inline;width:150px;"><select name="zdyfw"  id="zdyfw'+index+'" style="width:150px;"></select></div>' +
	  			'</td> <td> ' +
	  			'<div id="zdytj'+index+'_div" style="display: inline;width:150px;"><select name="zdytj"  id="zdytj'+index+'" style="width:150px;"></select></div>' +
	  			'</td> <td>' +
	  			'<div id="zdytj_fh'+index+'_div" style="display: inline;width:120px;"><select name="zdytj_fh"  id="zdytj_fh'+index+'" style="width:120px;"></select></div>' +
	  			//'<div style="display: inline;width:120px;"><input type="text" name="neirong" id="neirong'+index+'" class="ui-input" /></div>'
	  			'</td><td>' +
	  			'<div id="txt'+index+'" style="display: inline;"><input type="text" name="neirong" id="neirong'+index+'" class="ui-input long90" /></div>' +
	  			'<div id="dt'+index+'" style="display: inline;width:200px;"><input type="text"   onclick="WdatePicker()" onchange="fuzhi(index,this.value)" class="ui-input long90"/>' +
	  			
	  			'<input type="hidden" name="neirong" id="neirongt'+index+'" ></div>'+
	  			'</td>' +
				'</tr>' +
				'</table></span>';
				$("#myDiv").append(str);
				$('#dt'+index).hide();
				selectDemo("zdyfw"+index,unitJSONLX,"200px");
				selectDemo("lianjie"+index,unitJsonLianjie,"120px");
				selectDemo("zdytj_fh"+index,unitJsonTiaojian,"200px");
				selectDemo("zdytj"+index,unitJSON,"200px");
				$('#zdyfw'+index).selectmenu({
					select:function(){
						if($('#zdyfw'+index).val() == 'shebeixinxi'){
							unitJSON = [
										{"id":"shebeimingcheng","name":"设备名称","type":"VARCHAR2"},  //设备
				{"id":"chuchangbianhao","name":"设备出厂编号","type":"VARCHAR2"},
				{"id":"NEIBUBIANHAO","name":"单位内部编号","type":"VARCHAR2"},
				{"id":"zhucedaima","name":"设备注册代码","type":"VARCHAR2"},
				{"id":"SHEBEIDAIMA","name":"设备代码","type":"VARCHAR2"},
				{"id":"dengjizhengbianhao","name":"使用登记证编号","type":"VARCHAR2"},
				{"id":"shiyongdanwei","name":"使用单位","type":"VARCHAR2"},
				{"id":"shiyongdanwei_dizhi","name":"使用单位地址","type":"VARCHAR2"},
				{"id":"shiyongdanwei_lianxiren","name":"使用联系人","type":"VARCHAR2"},
				{"id":"shiyongdanwei_lianxidianhua","name":"使用联系人电话","type":"VARCHAR2"},
				{"id":"shiyongdanwei_youbian","name":"使用单位邮编","type":"VARCHAR2"},
				{"id":"SHIYONGDANWEI_CODE","name":"使用单位代码","type":"VARCHAR2"},
				{"id":"SHIYONGDANWEI_SUOSHUHANGYE","name":"使用单位行业","type":"VARCHAR2"},
				{"id":"FADINGDAIBIAOREN","name":"使用单位代表人","type":"VARCHAR2"},
				{"id":"SHIYONGDANWEI_XINGZHI","name":"使用单位性质","type":"VARCHAR2"},
				{"id":"BAOGAOBIANHAO","name":"报告编号","type":"VARCHAR2"},
				{"id":"ANQUANGUANLIBUMEN","name":"安全管理部门","type":"VARCHAR2"},
				{"id":"ANQUANGUANLI_LIANXIDIANHUA","name":"安全管理部门电话","type":"VARCHAR2"},
				{"id":"ANQUANGUANLIRENYUAN","name":"安全管理部门联系人","type":"VARCHAR2"},
				
				{"id":"zhizaodanwei","name":"制造单位","type":"VARCHAR2"},
				{"id":"ZHIZAORIQI","name":"制造日期（字符型）","type":"VARCHAR2"},
				{"id":" ZHIZAORIQI_DATE","name":"制造日期（日期型）","type":"date"},
				{"id":"ZHIZAODANWEIXUKEZHENGBIANHAO","name":"制造单位许可证编号","type":"VARCHAR2"},
				
				{"id":"ZHIZAODANWEI_CODE","name":"制造单位代码","type":"VARCHAR2"},
				{"id":"ZHIZAODANWEI_ZIGEZHENGSHU","name":"制造单位资格证书","type":"VARCHAR2"},
				{"id":"ZHIZAODANWEI_LIANXIDIANHUA","name":"制造单位联系电话","type":"VARCHAR2"},
				{"id":"ZHIZAODANWEI_SHIYONGCHANGHE","name":"制造单位使用场合","type":"VARCHAR2"},
				
				{"id":"shigongdanwei","name":"施工单位","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_DIZHI","name":"施工单位地址","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_LIANXIDIANHUA","name":"施工单位联系电话","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_LIANXIREN","name":"施工单位联系人","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_JIANCHENG","name":"施工单位简称","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_XUKEZHENGBIANHAO","name":"施工单位许可证","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_CHUANZHEN","name":"施工单位传真","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_YOUBIAN","name":"施工单位邮编","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_DAIMA","name":"施工单位代码","type":"VARCHAR2"},
				{"id":"WEIHUBAOYANGDANWEI","name":"维保单位","type":"VARCHAR2"},
				{"id":"WEIHUBAOYANGDANWEI_DIANHUA","name":"维保单位电话","type":"VARCHAR2"},
				{"id":"WHBYDW_ZIZHIZHENGSHU","name":"维保单位资质证书","type":"VARCHAR2"},
				{"id":"WEIHUBAOYANGDANWEI_LIANXIREN","name":"维保单位联系人","type":"VARCHAR2"},
				{"id":"WEIHUBAOYANGDANWEI_DIANHUA","name":"维保单位电话","type":"VARCHAR2"},
				{"id":"WEIHUBAOYANGDANWEI_CODE","name":"维保单位代码","type":"VARCHAR2"},
				{"id":"anzhuangdanwei","name":"安装单位","type":"VARCHAR2"},
				{"id":"ANZHUANGDANWEI_DAIMA","name":"安装单位代码","type":"VARCHAR2"},
				{"id":"ANZHUANGDANWEI_ZIGEZHENGSHU","name":"安装单位资格证书","type":"VARCHAR2"},
				{"id":"ANZHUANGDANWEI_LIANXIREN","name":"安装单位联系人","type":"VARCHAR2"},
				{"id":"ANZHUANGDANWEI_LIANXIDIANHUA","name":"安装单位联系电话","type":"VARCHAR2"},
				{"id":"ANZHUANGJIANJIANRIQI","name":"安装监检日期","type":"date"},
				{"id":"ANZHUANGJIANJIANJIGOU","name":"安装监检机构","type":"VARCHAR2"},
				{"id":"SHIGONGDANWEI_SHIGONGRIQI","name":"施工日期","type":"date"},
				{"id":"SHIGONGDANWEI_JUNGONGRIQI","name":"竣工日期","type":"date"},
				{"id":"anzhuangdanwei","name":"安装单位","type":"VARCHAR2"},
				{"id":"ANZHUANGRIQI","name":"安装日期","type":"date"},
				{"id":"ANQUANDENGJI","name":"安全等级","type":"VARCHAR2"},
				{"id":"NIANCHANZHI","name":"年产值","type":"VARCHAR2"},
				{"id":"TIANBIAORENYUAN","name":"填表人","type":"VARCHAR2"},
				{"id":"TIANBIAORIQI","name":"填表日期","type":"date"},
				{"id":"JIANGUANLEIBIE","name":"监管类别","type":"VARCHAR2"},
				
				{"id":"SHEJIDANWEI","name":"设计单位","type":"VARCHAR2"},
				{"id":"SHEJIDANWEIDAIMA","name":"设计单位代码","type":"VARCHAR2"},
				{"id":"TOUYONGRIQI","name":"投用日期（字符型）","type":"VARCHAR2"},
				{"id":"TOUYONGRIQI_DATE","name":"投用日期（日期型）","type":"date"},
				{"id":"SUOSHUCHEJIAN","name":"所属车间","type":"VARCHAR2"},
				{"id":"BEIZHU","name":"备注","type":"VARCHAR2"},
				{"id":"CHANPINHEGEZHENGBIANHAO","name":"产品合格证编号","type":"VARCHAR2"},
				{"id":"JIANDINGBAOGAOBIANHAO","name":"鉴定报告编号","type":"VARCHAR2"},
				{"id":"WENJIANJIANDINGJIGOU","name":"文件鉴定机构","type":"VARCHAR2"},
				
				
				{"id":"ZHIZAOJIANJIANJIGOU","name":"制造监检机构","type":"VARCHAR2"},
				{"id":"JIANJIANHEZHUNZHENG","name":"监检整证书","type":"VARCHAR2"},
				{"id":"JIANJIANZHENGSHUBIANHAO","name":"监检证书编号","type":"VARCHAR2"},
				
				{"id":"ZHIZAOJIANJIANRIQI","name":"制造监检日期","type":"date"},
				{"id":"YANSHOUDANWEI","name":"验收单位","type":"VARCHAR2"},
				{"id":"YANSHOURIQI","name":"验收日期","type":"date"},
				
				{"id":"ZHUCEDENGJIJIGOU","name":"注册登记机构","type":"VARCHAR2"},
				{"id":"dj_jingbanren","name":"注册登记人","type":"VARCHAR2"},
				{"id":"ZHUCERIQI","name":"注册日期","type":"date"},
				{"id":"JINGBANREN","name":"经办人","type":"VARCHAR2"},
				{"id":"JINGBANRENDIANHUA","name":"经办人电话","type":"VARCHAR2"},
				{"id":"GUDINGZICHANZHI","name":"固定资产","type":"VARCHAR2"},
				{"id":"SHEBEISHIYONGNIANXIAN","name":"设备使用年限","type":"VARCHAR2"},
				{"id":"chanquandanwei","name":"产权单位","type":"VARCHAR2"},
				{"id":"CHANQUANDANWEI_FARENDAIBIAO","name":"产权单位法人代表","type":"VARCHAR2"},
				{"id":"CHANQUANDANWEI_DIANHUA","name":"产权单位电话","type":"VARCHAR2"},
				{"id":"CHANQUANDANWEI_SUOSHUHANGYE","name":"产权单位行业","type":"VARCHAR2"},
				{"id":"CHANQUANDANWEI_YOUBIAN","name":"产权单位邮编","type":"VARCHAR2"},
				{"id":"CHANQUANDANWEI_XINGZHI","name":"产权单位性质","type":"VARCHAR2"},
				
				
				{"id":"state","name":"设备状态:0 未报检  1已报检  2 检验中  3 已检验  4 已登记0 领取","type":"VARCHAR2"},
				{"id":"ZCSTATUS","name":"是否注册 0 未注册    1 已注册---定期检监  2  已告知----安装监检  3 已停用  4 改造维修监检 5拆除 6待办 7报废","type":"VARCHAR2"},
				{"id":"shebeididian","name":"设备地点","type":"VARCHAR2"},
				{"id":"ZHUGUANBUMEN","name":"主管部门","type":"VARCHAR2"},
				{"id":"ZHUGUANFUZEREN","name":"主管负责人","type":"VARCHAR2"},
				{"id":"ZHUGUANFUZERENDIANHUA","name":"主管负责人电话","type":"VARCHAR2"},
				
				{"id":"xiacijianyanriqi","name":"下次检验日期","type":"date"},
				{"id":"JIANYANJIESHURIQI","name":"检验日期","type":"date"},
				
				{"id":"SHEBEIXINGHAO","name":"设备型号","type":"VARCHAR2"},
				{"id":"SHEBEIXINGSHI","name":"设备型式","type":"VARCHAR2"},
				{"id":"BIAOZHUNJIAGE","name":"标准价格","type":"VARCHAR2"},
				{"id":"DINGSHENGXINGSHI","name":"顶升形式","type":"VARCHAR2"},
				{"id":"EDINGSUDU","name":"额定速度","type":"VARCHAR2"},
				{"id":"EDINGSUDU_SHANGXING","name":"额定速度事项","type":"VARCHAR2"},
				{"id":"EDINGSUDU_XIAXING","name":"额定速度下行","type":"VARCHAR2"},
				{"id":"EDINGZAIZHONGLIANG","name":"额定起重量","type":"VARCHAR2"},
				{"id":"ERLIEJIANYANHUANJING","name":"恶劣检验环境","type":"VARCHAR2"},
				{"id":"GONGGONGJIAOTONGXING","name":"公共交通","type":"VARCHAR2"},
				{"id":"JIAOYANXIANSUQI","name":"校验线索","type":"VARCHAR2"},
				{"id":"KONGZHIFANGSHI","name":"控制方式","type":"VARCHAR2"},
				{"id":"MINGYIKUANDU","name":"名义宽度","type":"VARCHAR2"},
				{"id":"MINGYISUDU","name":"名义速度","type":"VARCHAR2"},
				{"id":"QINGXIEJIAO","name":"倾斜角","type":"VARCHAR2"},
				{"id":"QUDUANCHANGDU","name":"区段长度","type":"VARCHAR2"},
				{"id":"TISHENGGAODU","name":"提升高度","type":"VARCHAR2"},
				{"id":"YOUGUANSHULIANG","name":"油罐数量","type":"VARCHAR2"},
				{"id":"CAIZHI","name":"材质","type":"VARCHAR2"},
				{"id":"CHELIANGDIPANHAO","name":"车辆牌号","type":"VARCHAR2"},
				{"id":"CHELIANGLEIXING","name":"车辆类型","type":"VARCHAR2"},
				{"id":"CHELIANGXINGHAO","name":"车辆型号","type":"VARCHAR2"},
				{"id":"CHEPAIHAO","name":"车牌号","type":"VARCHAR2"},
				{"id":"FADONGJIHAO","name":"发动机号","type":"VARCHAR2"},
				{"id":"GONGZUOJIEZHI","name":"工作介质","type":"VARCHAR2"},
				
				{"id":"QIPINGJINGZHONG","name":"气瓶净重","type":"VARCHAR2"},
				{"id":"QIPINGSHULIANG","name":"气瓶数量","type":"VARCHAR2"},
				{"id":"QITILEIXING","name":"气瓶类型","type":"VARCHAR2"},
				{"id":"RONGJI","name":"容积","type":"VARCHAR2"},
				{"id":"CHELIANGLEIXING","name":"车辆类型","type":"VARCHAR2"},
				
				{"id":"GAOZHIRIQI","name":"告知日起","type":"date"},
				{"id":"GAOZHIBIANHAO","name":"告知编号","type":"VARCHAR2"},
				
				{"id":"JIANYANJIELUN","name":"检验结论","type":"VARCHAR2"},
				{"id":"JIANYANLEIXING","name":"检验类型","type":"VARCHAR2"},
				{"id":"JIANYANJIGOU","name":"检验机构","type":"VARCHAR2"},
				{"id":"JIANYANJIGOU_CODE","name":"检验机构代码","type":"VARCHAR2"},
				{"id":"BIANGENGRIQI","name":"变更日期","type":"date"},
				{"id":"WJ_BAOGAOBIANHAO","name":"外检报告编号","type":"VARCHAR2"},
				{"id":"NJ_BAOGAOBIANHAO","name":"内检报告编号","type":"VARCHAR2"},
				{"id":"ND_BAOGAOBIANHAO","name":"年度报告编号","type":"VARCHAR2"},
				{"id":"QM_BAOGAOBIANHAO","name":"全面报告编号","type":"VARCHAR2"},
				{"id":"GONGCHENGMINGCHENG","name":"工程名称","type":"VARCHAR2"},
				{"id":"YANSHOUJIGOU ","name":"验收机构","type":"VARCHAR2"},
				{"id":"YANSHOUBAOGAOBIANHAO","name":"验收报告编号","type":"VARCHAR2"},
				{"id":"DAXIUZHOUQI","name":"大修周期","type":"VARCHAR2"},
				{"id":"WEIBAOZHOUQI","name":"维保周期","type":"VARCHAR2"},
				{"id":"ZHUYAOWENTI","name":"主要问题","type":"VARCHAR2"},
				{"id":"SHIGULEIBIE","name":"事故类别","type":"VARCHAR2"},
				{"id":"SHIGUFASHENGRIQI","name":"事故发生日期","type":"date"},
				{"id":"SHIGUCHULIJIEGUO","name":"事故处理结果","type":"VARCHAR2"},
				{"id":"SHEBEIBIANDONGFANGSHI","name":"设备变动方式","type":"VARCHAR2"},
				{"id":"SHEBEIBIANDONGXIANGMU","name":"设备变动项目","type":"VARCHAR2"},
				{"id":"SHEBEIBIANDONGRIQI","name":"设备变动日期","type":"VARCHAR2"},
				{"id":"CHENGDANDANWEI","name":"承担单位","type":"VARCHAR2"},
				{"id":"CHENGDANDANWEI_CODE","name":"承担单位代码","type":"VARCHAR2"},
				{"id":"BAOXIANJIGOU","name":"保险机构","type":"VARCHAR2"},
				{"id":"BAOXIANXIANZHONG","name":"保险险种","type":"VARCHAR2"},
				{"id":"BAOXIANFEI","name":"保险费","type":"VARCHAR2"},
				{"id":"BAOXIANJI","name":"保险金","type":"VARCHAR2"},
				{"id":"BAOXIANJIAZHI","name":"保险价值","type":"VARCHAR2"},
				{"id":"SHIFOU_ZHONGDAWEIXIANYUAN","name":"是否重大危险源","type":"VARCHAR2"},
				{"id":"SHIFOU_RENKOUMIJIQU ","name":"是否人口密集区","type":"VARCHAR2"},
				{"id":"SHIFOU_YINGJIFANGAN","name":"是否设置应急方案","type":"VARCHAR2"},
				{"id":"SHIFOU_ZHONGDIANJIANKONG","name":"是否重点监控","type":"VARCHAR2"},
				{"id":"SHIYONGCHANGSUO","name":"使用场所","type":"VARCHAR2"},
				{"id":"SHIYONGDANWEI_CAOZUORENYUAN","name":"操作人员","type":"VARCHAR2"},
				{"id":"DENGJILEIBIE","name":"登记类别","type":"VARCHAR2"},
				{"id":"CHANPINTUHAO","name":"产品图号","type":"VARCHAR2"},
				{"id":"SHEJIXUKEZHENG","name":"设计许可证","type":"VARCHAR2"},
				{"id":"SHIFOU_DYRRJS","name":"是否吊运熔融金属","type":"VARCHAR2"},
										];
						}else if($('#zdyfw'+index).val() == 'guolushuxing'){
							unitJSON = [
										{"id":"edingchuli","name":"额定出力","type":"varchar2"},
										{"id":"edingyali","name":"额定压力","type":"float"},
										{"id":"jiezhi","name":"介质","type":"varchar2"},
										{"id":"yunxingrexiaolv","name":"运行热效率","type":"varchar2"},
										{"id":"edingwendu","name":"额定温度","type":"float"},
										{"id":"shiyongwendu","name":"使用温度","type":"varchar2"},
										{"id":"edinggonglv","name":"额定功率","type":"varchar2"},
										{"id":"gonglvdanwei","name":"功率单位","type":"varchar2"},
										{"id":"chukouwendu","name":"出口温度","type":"float"},
										{"id":"shejiyali","name":"设计压力","type":"float"},
										{"id":"gongzuoyali","name":"工作压力","type":"float"},
										{"id":"gongzuowendu","name":"工作温度","type":"float"},
										{"id":"ranliaozhonglei","name":"燃料种类","type":"varchar2"},
										{"id":"yongtu","name":"用途","type":"varchar2"},
										{"id":"yalidengji","name":"压力等级","type":"varchar2"},
										{"id":"edingzhengfaliang","name":"额定蒸发量(蒸吨/时)","type":"varchar2"},
										{"id":"chengqu","name":"是否在城市建成区内","type":"varchar2"},
										{"id":"chuchenzhuangzhi","name":"是否配备有效的除尘装置和脱硫脱硝装置","type":"varchar2"},
										{"id":"wuranwu_pm25","name":"污染物排放量-PM2.5(吨/年)","type":"varchar2"},
										{"id":"wuranwu_pm10","name":"污染物排放量-PM10(吨/年)","type":"varchar2"},
										{"id":"wuranwu_pmso2","name":"污染物排放量-二氧化硫(SO2)(吨/年)","type":"varchar2"},
										{"id":"wuranwu_pmno2","name":"污染物排放量-二氧化氮(NO2)(吨/年)","type":"varchar2"},
										{"id":"fuhebiaozhun","name":"是否符合山东省排放标准","type":"varchar2"},
										{"id":"ranshaojiezhiliang","name":"年耗燃烧介质量","type":"varchar2"},
										{"id":"biaozhunmei","name":"折合标准煤","type":"varchar2"},
										{"id":"nianhaodianliang","name":"年耗电量","type":"varchar2"},
										{"id":"nengxiaoceshi_dx","name":"是否按规定完成能效测试(定型)","type":"varchar2"},
										{"id":"nengxiaoceshi_dq","name":"是否按规定完成能效测试(定期)","type":"varchar2"},
										{"id":"rexiaolv_sheji","name":"热效率(设计值)","type":"varchar2"},
										{"id":"rexiaolv_shiji","name":"热效率(实际值)","type":"varchar2"},
										];
							
						}else if($('#zdyfw'+index).val() == 'yalirongqishuxing'){
							unitJSON = [
										{"id":"caizhitongti","name":"材质筒体","type":"varchar2"},
										{"id":"caizhifengtou","name":"材质封头","type":"varchar2"},
										{"id":"caizhijiatao","name":"材质夹套","type":"varchar2"},
										{"id":"caizhineichen","name":"材质内衬","type":"varchar2"},
										{"id":"yalikecheng","name":"压力壳程","type":"float"},
										{"id":"yaliguancheng","name":"压力管程","type":"varchar2"},
										{"id":"jiezhikecheng","name":"介质壳程","type":"varchar2"},
										{"id":"jiezhiguancheng","name":"介质管程","type":"varchar2"},
										{"id":"wendukecheng","name":"温度壳程","type":"float"},
										{"id":"wenduguancheng","name":"温度管程","type":"varchar2"},
										{"id":"rongqineijing","name":"容器内径","type":"varchar2"},
										{"id":"gaodu","name":"容器高","type":"float"},
										{"id":"rongqichang","name":"容器长","type":"float"},
										{"id":"rongqimianji","name":"容积面积","type":"varchar2"},
										{"id":"jiegouxingshi","name":"结构型式","type":"varchar2"},
										{"id":"gongzuojiezhi","name":"介质","type":"varchar2"},
										{"id":"gongzuoyali","name":"工作压力","type":"varchar2"},
										{"id":"gongzuowendu","name":"工作温度","type":"varchar2"},
										];
							
						}else if($('#zdyfw'+index).val() == 'diantishuxiing'){
							unitJSON = [
										{"id":"ceng","name":"层","type":"float"},
										{"id":"zhan","name":"站","type":"float"},
										{"id":"men","name":"门","type":"float"},
										{"id":"mingyikuandu","name":"名义宽度","type":"float"},
										{"id":"qingxiejiao","name":"倾斜角","type":"float"},
										{"id":"shusongnengli","name":"输送能力","type":"float"},
										{"id":"tishenggaodu","name":"提升高度","type":"float"},
										{"id":"quduanchangdu","name":"区段长度","type":"float"},
										{"id":"edingzaizhongliang","name":"额定载重量","type":"float"},
										{"id":"edingsudu","name":"额定速度","type":"float"},
										{"id":"edingsudu_shangxing","name":"额定速度（最大）","type":"float"},
										{"id":"edingsudu_xiaxing","name":"额定速度（最小）","type":"float"},
										{"id":"kongzhifangshi","name":"控制方式","type":"varchar2"},
										{"id":"youguanshuliang","name":"油罐数量","type":"float"},
										{"id":"dingshengxingshi","name":"顶升形式","type":"varchar2"},
										{"id":"zouxingjuli","name":"电梯走形距离","type":"varchar2"},
										{"id":"dianticengzhan","name":"电梯层站","type":"varchar2"},
										{"id":"shifou_zhongdaweixianyuan","name":"是否在人口密集区","type":"varchar2"},
										{"id":"shifou_renkoumijiqu","name":"是否重大危险源","type":"varchar2"},
										{"id":"shifou_yingjifangan","name":"是否重点监控特种设备","type":"varchar2"},
										{"id":"shifou_zhongdianjiankong","name":"是否制定事故应急措施和救援预案","type":"varchar2"},
										];
							
						}else if($('#zdyfw'+index).val() == 'qizhongjishuxing'){
							unitJSON = [{"id":"EDINGQIZHONGLIANG","name":"额定起重量","type":"varchar2"},
										{"id":"zuidafuduqizhongliang","name":"最大幅度起重量","type":"varchar2"},
										{"id":"zuidaqizhongliju","name":"最大起重力矩","type":"varchar2"},
										{"id":"KUADU","name":"跨度","type":"varchar2"},
										{"id":"QISHENGSUDU","name":"起升速度","type":"varchar2"},
										{"id":"craneParam.qishenggaodu","name":"起升高度","type":"varchar2"},
										{"id":"DACHEYUNXINGSUDU","name":"大车运行速度","type":"varchar2"},
										{"id":"xiaocheyunxingsudu","name":"小车运行速度","type":"varchar2"},
										{"id":"gongzuofudu_qianshen","name":"工作幅度_前伸","type":"float"},
										{"id":"gongzuofudu_guju","name":"工作幅度_轨距:","type":"float"},
										{"id":"gongzuofudu_houshen","name":"工作幅度_后伸","type":"float"},
										{"id":"huizhuansudu","name":"回转速度","type":"float"},
										{"id":"sijishi","name":"司机室","type":"varchar2"},
										{"id":"yidongsudu","name":"移动速度","type":"float"},];
							
						}else if($('#zdyfw'+index).val() == 'changcheshuxing'){
							unitJSON = [{"id":"PAIZHAOHAOMA","name":"厂车牌照编号","type":"varchar2"},
										{"id":"CHANGPAIXINGHAO","name":"厂牌型号","type":"varchar2"},
										{"id":"CHANGNEICHELIANG_EDINGZAIHE","name":"车辆额定载荷","type":"float"},
										{"id":"CHELIANGMINGCHENG","name":"车辆名称","type":"varchar2"},
										{"id":"DONGLIFANGSHI","name":"动力方式","type":"varchar2"},
										{"id":"QUDONG","name":"驱动","type":"varchar2"},
										{"id":"KONGCHEZHONGLIANG","name":"空车重量","type":"varchar2"},
										{"id":"edingqizhongliang","name":"额定载重","type":"varchar2"},
										{"id":"YANSE","name":"颜色","type":"varchar2"},
										{"id":"tuoguache","name":"是否拖挂车","type":"varchar2"},
										{"id":"FADONGJIBIANHAO","name":"发动机编号","type":"varchar2"},
										{"id":"DIPANBIANHAO","name":"底盘编号","type":"varchar2"},
										{"id":"SHIYONGQUYU","name":"使用区域","type":"varchar2"},
										{"id":"ZUIGAOSHISU","name":"最高时速(Km)","type":"varchar2"},
										{"id":"yunxingsudu","name":"车辆运行速度（km/h）","type":"float"},
										{"id":"ranliaozhonglei","name":"燃料种类","type":"varchar2"},];
							
						}else if($('#zdyfw'+index).val() == 'youlesheshishuxing'){
							unitJSON = [{"id":"xiansudu","name":"游乐设施线速度（m/s）","type":"varchar2"},
										{"id":"ylss_gaodu","name":"游乐设施高度(m)","type":"varchar2"},
										{"id":"edingchengkerenshu","name":"额定乘客人数（人）","type":"varchar2"},
										{"id":"edingzaihe","name":"额定载荷（Kg）","type":"varchar2"},
										{"id":"sudu","name":"额定速度（m/s）","type":"varchar2"},
										{"id":"qingjiao","name":"倾夹角或坡度","type":"varchar2"},
										{"id":"fusudu","name":"副速度（m/s）","type":"varchar2"},
										{"id":"qudongxingshi","name":"驱动形式","type":"varchar2"},
										{"id":"qudongzhugonglv","name":"驱动主功率（kw）","type":"varchar2"},
										{"id":"dianya","name":"电压（v）","type":"varchar2"},
										{"id":"fugonglv","name":"副功率（kw）","type":"varchar2"},
										{"id":"gaodu","name":"座舱高度（m）","type":"varchar2"},
										{"id":"huizhuanzhijing","name":"回转直径（m）","type":"varchar2"},
										{"id":"guiju","name":"轨距","type":"varchar2"},
										{"id":"guijuchangdu","name":"轨距长度（m）","type":"varchar2"},
										{"id":"shuihuatigaodu","name":"水滑梯高度（m）","type":"varchar2"},
										{"id":"youlechishuishen","name":"游乐池水深（m）","type":"varchar2"},];
							
						}else if($('#zdyfw'+index).val() == 'guandaoshuxing'){
							unitJSON = [{"id":"gongchengzhijing","name":"公称直径（mm）","type":"varchar2"},
										{"id":"gongchengbihou","name":"公称壁厚（mm）","type":"varchar2"},
										{"id":"guandaochangdu","name":"管道长度（km）","type":"varchar2"},
										{"id":"shusongjiezhi","name":"输送介质","type":"varchar2"},
										{"id":"shejiyali","name":"设计压力","type":"varchar2"},
										{"id":"gongzuoyali","name":"最高工作压力","type":"varchar2"},
										{"id":"shejiwendu","name":"设计温度","type":"varchar2"},
										{"id":"gongzuowendu","name":"最高工作温度","type":"varchar2"},];
							
						}else if($('#zdyfw'+index).val() == 'suodaoshuxing'){
							unitJSON = [{"id":"yunxingsudu","name":"运行速度（m/s）","type":"varchar2"},
										{"id":"changdu","name":"索道长度（m）","type":"varchar2"},
										{"id":"yunzainengli","name":"运载能力（p/h）","type":"varchar2"},
										{"id":"yunzaicheliangxingshi","name":"运载车辆形式","type":"varchar2"},];
							
						}
						selectDemo("zdytj"+index,unitJSON,"200px");
						
						$('#zdytj'+index).selectmenu({
					select:function(){
						$('#dt'+index).hide();
						$('#txt'+index).show();
						for(var i=0;i<unitJSON.length;i++){
							if(unitJSON[i].id == $('#zdytj'+index).val()){
								if(unitJSON[i].type == 'date'){
									$('#dt'+index).show();
									$('#txt'+index).hide();
									unitJsonTiaojian = [
														{"id":"=","name":"＝"},
														{"id":"<>","name":"≠"},
														{"id":"4","name":"＞"},
														{"id":"5","name":"＜"},
														{"id":"6","name":"≥"},
														{"id":"7","name":"≤"},
														];
								}else if(unitJSON[i].type == 'float'){
									unitJsonTiaojian = [
														{"id":"=","name":"＝"},
														{"id":"<>","name":"≠"},
														{"id":"4","name":"＞"},
														{"id":"5","name":"＜"},
														{"id":"6","name":"≥"},
														{"id":"7","name":"≤"},
														];
								}else{
									unitJsonTiaojian = [
										{"id":"1","name":"包含"},
										{"id":"=","name":"等于"},
										{"id":"<>","name":"不等于"},
										{"id":"2","name":"不包含"},
										{"id":"3","name":"为空"},
										{"id":"4","name":"大于"},
										{"id":"5","name":"小于"},
										{"id":"8","name":"以其开头"},
										{"id":"9","name":"不以其开头"},
										{"id":"10","name":"以其结尾"},
										{"id":"11","name":"不以其结尾"},
										];
								}
							}
						}  
						selectDemo("zdytj_fh"+index,unitJsonTiaojian,"200px");
		    		}
				})
					}
				})
				
		}

function selectDemo(selectId,options,height){
		var selectIdArr = selectId.split(",");
		for(var i in selectIdArr){
			$("#"+selectIdArr[i]).selectmenu();
		}
		var select = $("#"+selectIdArr[0]);
		var sltValue = select.attr("sltValue");
		//因selectMenu插件本身存在问题，必须得把控件重新添加，才能做级联
		select.empty();
		select.css("display","inline");
		$("#"+selectIdArr[0]+"-button").remove();
		var selectHtml = $("#"+selectIdArr[0]+"_div").html();
		$("#"+selectIdArr[0]+"_div").html(selectHtml);
		select = $("#"+selectIdArr[0]);
		select.append("<option value = ''></option>"); 
		for(var i in options){
			if(sltValue == options[i].id){
				select.append("<option value = '"+options[i].id+"' selected = 'selected'>"+options[i].name+"</option>"); 
			}else{
				select.append("<option value = '"+options[i].id+"'>"+options[i].name+"</option>"); 
			}
		}
		select.selectmenu().selectmenu("menuWidget").css("height",height);
	}
//条件追加
function tiaojianZhuanhuan(){
			var sql = "";
			var varcharSql = "";
			var dateSql = "";
			
			for(var ii=1;ii<=index;ii++){
				var orAnd = $("#lianjie"+ii).val();   // AND OR 
				if(orAnd == 'AND'){
					orAnd = " AND ("
				}else if(orAnd == 'AND NOT'){
					orAnd = " AND NOT ("
				}else if(orAnd == 'OR'){
					if(ii != 1){
						orAnd = " OR ";
						sql = sql.substring(0,sql.lastIndexOf(")"));
					}else{
						orAnd = " OR ("
					}
				}
				sql += orAnd+" ";
				if( $("#zdytj"+ii).val() == "" ){
					return false;
				}
				
				var ziduan = "";
				var bianhao = $("#zdytj"+ii).val(); //各种条件  包含 等于 不等于 。。。
				var neirong = $("#neirong"+ii).val()==""?$("#neirongt"+ii).val():$("#neirong"+ii).val();
				var nt = $("#neirongt"+ii).val();
				if($("#zdytj_fh"+ii).val() != ""){
					ziduan = $("#zdytj_fh"+ii).val();
				}
				if(nt != ""){
					if(ziduan == "="){
						sql += bianhao + " = to_date('"+nt+"','yyyy-MM-dd') ";
					}else if(ziduan == "<>"){
						sql += bianhao + " <> to_date('"+nt+"','yyyy-MM-dd') ";
					}else if(ziduan == "3"){
						sql += bianhao + " is null ";
					}else if(ziduan == "4"){
						sql += bianhao + " > to_date('"+nt+"','yyyy-MM-dd') ";
					}else if(ziduan == "5"){
						sql += bianhao + " < to_date('"+nt+"','yyyy-MM-dd') ";
					}else if(ziduan == "6"){
						sql += bianhao + " >= to_date('"+nt+"','yyyy-MM-dd') ";
					}else if(ziduan == "7"){
						sql += bianhao + " <= to_date('"+nt+"','yyyy-MM-dd') ";
					}
				}else{
					
					if(ziduan == "1"){
						sql += bianhao + " LIKE '%"+neirong+"%' ";
					}else if(ziduan == "2"){
						sql += bianhao + " NOT LIKE '%"+neirong+"%' ";
					}else if(ziduan == "3"){
						sql += bianhao + " is null ";
					}else if(ziduan == "4"){
						sql += bianhao + " > '"+neirong+"' ";
					}else if(ziduan == "5"){
						sql += bianhao + " < '"+neirong+"' ";
					}else if(ziduan == "6"){
						sql += bianhao + " >= '"+neirong+"' ";
					}else if(ziduan == "7"){
						sql += bianhao + " <= '"+neirong+"' ";
					}else if(ziduan == "8"){
						sql += bianhao + " like '"+neirong+"%' ";
					}else if(ziduan == "9"){
						sql += bianhao + " not like '"+neirong+"%' ";
					}else if(ziduan == "10"){
						sql += bianhao + " like '%"+neirong+"' ";
					}else if(ziduan == "11"){
						sql += bianhao + " not like '%"+neirong+"' ";
					}else if(ziduan == "="){
						sql += bianhao + " = '"+neirong+"' ";
					}else if(ziduan == "<>"){
						sql += bianhao + " <> '"+neirong+"' ";
					}
				}
				
				sql += " ) ";
			}
			$("#chaxunsql").val(sql);
		}

function fuzhi(id,value){
	$("#neirongt"+id).val(value);
}
</script>
</head>

<body>
  <div id="search_zdy_div" class="mod-search cf">
	<form name="frm_jcsj_zdy_search_conditions" id="frm_jcsj_zdy_search_conditions">
	  	<table id="zdy_tab" style="width: 98%;">
	  		<tr>
	  			<th style="width:20%;">设备种类</th>
	  			<td style="width:30%;">
	  				<div id="shebeizhonglei_div">
	  					<select name="shebeizhonglei" class="long90" id="shebeizhonglei"></select>
	  				</div>
	  			</td>
	  			<th style="width:20%;">设备类别</th>
	  			<td style="width:30%;">
	  				<div id="shebeileibie_div">
	  					<select name="shebeileibie" class="long90" id="shebeileibie"></select>
	  				</div>
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
	  			
	  			<th>排序内容</th>
	  			<td>
	  				<div id="paixuneirong_div">
	       				<select name="paixu" class="long90" id="paixuneirong" ></select>
	  				</div>
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>排序类型</th>
	  			<td>
	  				<div id="paixuleixing_div">
	       				<select name="paixuleixing" class="long90" id="paixuleixing" ></select>
	  				</div>
	  			</td>
	  		</tr>
	  		
	  	<!--<tr>
	  			<th></th>
	  			<td colspan="3">
	  				<div id="lianjie_div" style="width:120px;">
	       				<select name="lianjie"  id="lianjie" style="width:120px;"></select>
	  				</div>
	  			</td>
	  		</tr>
	  		<tr id="tr">
	  			<th>自定义条件：</th>
	  			<td colspan="3">
	  				<div id="zdytj_div" style="display: inline;width:150px;">
	       				<select name="zdytj" id="zdytj" style="width:150px;" ></select>
	  				</div>
	  				<div id="zdytj_fh_div" style="display: inline;width:120px;">
	       				<select name="zdytj_fh"  id="zdytj_fh" style="width:120px;"></select>
	  				</div>
	  				<div style="display: inline;width:120px;">
	  					<input type="text" name="neirong" id="neirong" class="ui-input" />
	  				</div>
	  			</td>
	  		</tr> -->
	  	</table>
	  	<div id="myDiv" style="width: 98%;">
	  	</div>
	  	<input type="hidden" id="chaxunsql" name="chaxunsql" width="100%"/>
	  </form>
  </div>
</body>
</html>
