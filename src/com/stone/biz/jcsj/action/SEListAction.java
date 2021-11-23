package com.stone.biz.jcsj.action;

/**
 * <pre>
 *	基础数据  已注册  设备 List。
 * @author
 * </pre>
 */
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletOutputStream;

import net.sf.json.JSONArray;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFComment;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

import jxl.Workbook;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.stone.biz.jcsj.pojo.TBaseInfo;
import com.stone.biz.jcsj.pojo.TBaseInfoGDTools;
import com.stone.biz.jcsj.pojo.TBaseInfoSearch;
import com.stone.biz.jcsj.service.SECommonService;

import com.stone.para.IConstant;
import com.stone.support.SupportListAction;
import com.stone.support.utils.DWRTool;
import com.stone.support.utils.DateFormatTool;
import com.stone.support.utils.StringUtils;
import com.stone.sys.pojo.DwUserSE;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TUser;

@SuppressWarnings("unchecked")
public class SEListAction extends SupportListAction {

	private static final long serialVersionUID = 3979577965804736350L;

	private SECommonService seService;
	
	public void setSeService(SECommonService seService) {
		this.seService = seService;
	}


	/**
	 * 所有的设备 
	 * @return
	 * @throws Exception
	 */
	public String getList() throws Exception{
		
		String ids = super.getParameter("ids");
		
		String query = "from TBaseInfoSearch se where 1=1";
		String conditions = "";
		String order = " order by se.id desc";

		if(super.checkParam(ids)){
			conditions += " and se.id in (" + ids + ")";
		}
		
		query += conditions + order;
		List ses = seService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long total = seService.findTotalByHql("select count(se) " + query);
		super.addActionData(ROWS, ses).addActionData(TOTAL, total);
		return SUCCESS;
	}
	/**
	 * 所有的设备    不分页
	 * @return
	 * @throws Exception
	 */
	public String getSesList() throws Exception{
		
		String ids = super.getParameter("ids");
		
		String query = "from TBaseInfoSearch se where 1=1";
		String conditions = "";
		String order = " order by se.id desc";

		if(super.checkParam(ids)){
			conditions += " and se.id in (" + ids + ")";
		}
		query += conditions + order;
		List ses = seService.findListByHql(query);
		long total = seService.findTotalByHql("select count(se) " + query);
		super.addActionData(ROWS, ses).addActionData(TOTAL, total);
		return SUCCESS;
	}
	/**
	 * 已注册 设备
	 * @return
	 * @throws Exception
	 */
	public String getListForZhuCe() throws Exception{
		
		TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
		//设备种类
		String sbzl = super.getParameter("shebeizhonglei");
		sbzl = URLDecoder.decode(sbzl,"utf-8");
		//注册代码
		String zcdm = super.getParameter("zhucedaima");
		
		//设备名称
		String sbmc = super.getParameter("shebeimingcheng");
		sbmc = URLDecoder.decode(sbmc,"utf-8");
		sbmc = StringUtils.convertToChinese(sbmc);
		//设备类别
		String sblb = super.getParameter("shebeileibie");
		sblb = URLDecoder.decode(sblb,"utf-8");
		sblb = StringUtils.convertToChinese(sblb);
		//使用单位
		String sydw = super.getParameter("shiyongdanwei");
		sydw = URLDecoder.decode(sydw,"utf-8");
		sydw = StringUtils.convertToChinese(sydw);
		//城市         区县       乡镇
		String shidaima = super.getParameter("shidaima");
		String quhuadaima = super.getParameter("quhuadaima");
		String xiangzhendaima = super.getParameter("xiangzhendaima");
		//检验日期
		String jianyanriqi = super.getParameter("jianyankaishiriqi");
		String jianyanriqiend = super.getParameter("jianyanjieshuriqi");
		//制造日期
		String zhizaoriqi = super.getParameter("zhizaokaishiriqi");
		String zhizaoriqiend = super.getParameter("zhizaojieshuriqi");
		//投用日期
		String touyongriqi = super.getParameter("touyongkaishiriqi");
		String touyongriqiend = super.getParameter("touyongjieshuriqi");
		//主键id
		String sydwid = super.getParameter("sydwid");
		//审批状态
		String state = super.getParameter("state");
		//使用证编号
		String dengjizhengbianhao =  super.getParameter("dengjizhengbianhao");
		dengjizhengbianhao = URLDecoder.decode(dengjizhengbianhao,"utf-8");
		dengjizhengbianhao = StringUtils.convertToChinese(dengjizhengbianhao);
		//注册登记日期
		String zhuceriqi = super.getParameter("zhuceriqi");
		String zhuceriqiend = super.getParameter("zhuceriqiend");
		//设备使用单位代码
		String shiyongdanweiId = super.getParameter("shiyongdanweiId");
		//设备使用单位
	//	String shiyongdanwei = super.getParameter("shiyongdanwei");
	//	shiyongdanwei = URLDecoder.decode(shiyongdanwei,"utf-8");
		//单位内部代码（使用单位代码）
		String shiyongdanwei_code = super.getParameter("shiyongdanwei_code");
		//单位内部编号
		String neibubianhao = super.getParameter("neibubianhao");
		//设备使用地点
		String shebeididian =  super.getParameter("shebeididian");
		shebeididian = URLDecoder.decode(shebeididian,"utf-8");
		shebeididian = StringUtils.convertToChinese(shebeididian);
		//制造单位
		String zhizaodanwei = super.getParameter("zhizaodanwei");
		zhizaodanwei = URLDecoder.decode(zhizaodanwei,"utf-8");
		zhizaodanwei = StringUtils.convertToChinese(zhizaodanwei);
		//是否已删除
		String zfstate = super.getParameter("zfstate");
		//出厂编号
		String chuchangbianhao = super.getParameter("chuchangbianhao");
		chuchangbianhao = URLDecoder.decode(chuchangbianhao,"utf-8");
		chuchangbianhao = StringUtils.convertToChinese(chuchangbianhao);
		//安装单位代码
		String anzhuangdanwei_daima = super.getParameter("anzhuangdanweidaima");
		//安装单位
		String shigongdanwei = super.getParameter("anzhuangdanwei");
		shigongdanwei = URLDecoder.decode(shigongdanwei,"utf-8");
		shigongdanwei = StringUtils.convertToChinese(shigongdanwei);
		//使用状态
		String zcstatus = super.getParameter("zcstatus");
		//是否包含停用
		String ty = super.getParameter("ty");
		//下次检验日期小于（含空的）
		String xiacijianyanriqi = super.getParameter("xiacijianyanriqi");
		String xiacijianyanriqiend = super.getParameter("xiacijianyanriqiend");
		//隐患类别（事故类别）
		String yhtype = super.getParameter("yinhuan");
		yhtype = URLDecoder.decode(yhtype,"utf-8");
		yhtype = StringUtils.convertToChinese(yhtype);
		String weibaodanwei = super.getParameter("weibaodanwei");
		weibaodanwei = URLDecoder.decode(weibaodanwei,"utf-8");
		weibaodanwei = StringUtils.convertToChinese(weibaodanwei);
		//判断设备
		String zt = super.getParameter("zt");
		String expExcel = super.getParameter("expExcel");
		String isflag = super.getParameter("isflag");
		//产权单位
		String chanquandanwei = super.getParameter("chanquandanwei");
		chanquandanwei = URLDecoder.decode(chanquandanwei,"utf-8");
		chanquandanwei = StringUtils.convertToChinese(chanquandanwei);
		//设计单位代码
		String shejidanweidaima = super.getParameter("shejidanweidaima");
		String shejidanwei = super.getParameter("shejidanwei");
		shejidanwei = URLDecoder.decode(shejidanwei,"utf-8");
		shejidanwei = StringUtils.convertToChinese(shejidanwei);
		//制造单位代码
		String zhizaodanweidaima = super.getParameter("zhizaodanweidaima");
		//监检单位
		String jianyanjigou = super.getParameter("jianjiandanwei");
		jianyanjigou = URLDecoder.decode(jianyanjigou,"utf-8");
		jianyanjigou = StringUtils.convertToChinese(jianyanjigou);
		//监检单位代码
		String jianyanjigou_code = super.getParameter("jianjiandanweidaima");
		jianyanjigou_code = URLDecoder.decode(jianyanjigou_code,"utf-8");
		jianyanjigou_code = StringUtils.convertToChinese(jianyanjigou_code);
		//是否危化品
		String weihuapin = super.getParameter("weihuapin");
		weihuapin = URLDecoder.decode(weihuapin,"utf-8");
		weihuapin = StringUtils.convertToChinese(weihuapin);
		//是否公众聚集场所
		String jujichangsuo = super.getParameter("jujichangsuo");
		jujichangsuo = URLDecoder.decode(jujichangsuo,"utf-8");
		jujichangsuo = StringUtils.convertToChinese(jujichangsuo);
		//是否重要特种设备
		String zhongyaoshebei = super.getParameter("zhongyaoshebei");
		zhongyaoshebei = URLDecoder.decode(zhongyaoshebei,"utf-8");
		zhongyaoshebei = StringUtils.convertToChinese(zhongyaoshebei);
		//是否重点监控特种设备
		String jiankongshebei = super.getParameter("jiankongshebei");
		jiankongshebei = URLDecoder.decode(jiankongshebei,"utf-8");
		jiankongshebei = StringUtils.convertToChinese(jiankongshebei);
		//所在车间分厂
		String suozaichejian = super.getParameter("suozaichejian");
		suozaichejian = URLDecoder.decode(suozaichejian,"utf-8");
		suozaichejian = StringUtils.convertToChinese(suozaichejian);
		//是否熔融金属
		String rongrongjinshu = super.getParameter("rongrongjinshu");
		rongrongjinshu = URLDecoder.decode(rongrongjinshu,"utf-8");
		rongrongjinshu = StringUtils.convertToChinese(rongrongjinshu);
		//排序内容
		String paixu = super.getParameter("paixu");
		//排序类型
		String pxlx = super.getParameter("paixuleixing");
		
		//修改开始日期
		String xiugaikaishiriqi = super.getParameter("xiugaikaishiriqi"); 
		//修改结束日期
		String xiugaijishuriqi = super.getParameter("xiugaijieshuriqi");
		//管道使用
		String gd = super.getParameter("gd");
		//气瓶使用
		String qp = super.getParameter("qp");
		//使用单位代码
		String shiyongdanweiCode = super.getParameter("shiyongdanweiCode");
		
		
		//自定义查询使用
		String chaxunsql = super.getParameter("chaxunsql");
		if("exp".equals(expExcel)){
			chaxunsql = URLDecoder.decode(chaxunsql,"utf-8");
		}
		

		String query = "from TBaseInfoSearch se where 1=1 and se.tmpData = '0' and se.eqhide = '0'  ";
		if(super.checkParam(chaxunsql)){
			query = "select id,shebeimingcheng,zhucedaima  from TBaseInfo se where 1=1 and tmpData = '0' ";
		}
		
		String conditions = " and se.zfstate = '0' and se.shebeizhongleidaima in('1000','2000','3000','4000','5000','6000','9000') ";
		if(super.checkParam(gd)){
			conditions = " and se.zfstate = '0' and se.shebeizhongleidaima = '8000' ";
		}
		if(super.checkParam(qp)){
			conditions = " and se.zfstate = '0' and se.shebeizhongleidaima = 'Q000' ";
		}
		
		String order = "";
		
		//设备类别
		if(super.checkParam(sblb)){
			conditions += " and se.shebeileibiedaima = '" + sblb + "'";
		}
		//主键id
		if(super.checkParam(sydwid)){
			query = "from TBaseInfoSearch se where 1=1 ";
			conditions += " and se.shiyongdanweiId = '" + sydwid + "' and zfstate = '0' and tmpData = '0' ";
		}
		String seidHql = "select seId from DwUserSE where userId = '"+user.getId()+"' ";
	//	String seids = seService.findListByHql(seidHql).toString().replace("[","").replace("]","");
		//关联设备id
		conditions += " and se.id in ("+seidHql+")";
		
		//判断进入的是哪个页面 （首次登陆）
		if(super.checkParam(zt)){
			if("1".equals(zt)){//合格设备
				conditions += " and to_date(to_char(se.xiacijianyanriqi,'yyyy/MM/dd'),'yyyy/MM/dd')-trunc(sysdate) > 30 ";
			}else if("2".equals(zt)){//预警设备
				conditions += " and to_date(to_char(se.xiacijianyanriqi,'yyyy/MM/dd'),'yyyy/MM/dd') - trunc(sysdate) <= 30 and to_date(to_char(se.xiacijianyanriqi,'yyyy/MM/dd'),'yyyy/MM/dd') - trunc(sysdate) >= 0 ";
			}else if("3".equals(zt)){//超期设备
				conditions += " and (to_date(to_char(se.xiacijianyanriqi,'yyyy/MM/dd'),'yyyy/MM/dd') - trunc(sysdate) < 0 or se.xiacijianyanriqi is null) ";
			}else if("4".equals(zt)){//合格设备
				conditions += " and ((jianyanjielun = '合格' or jianyanjielun = '复检合格' or jianyanjielun = '符合要求' or jianyanjielun = '允许运行') or jianyanjielun is null)";
			}else if("5".equals(zt)){//不合格设备
				conditions += " and (jianyanjielun != '合格' and  jianyanjielun != '复检合格' and jianyanjielun != '符合要求' and jianyanjielun != '允许运行')";
			}
		}
		//设备类别
		if(super.checkParam(sbzl)){
			conditions += " and se.shebeizhongleidaima = '" + sbzl + "'";
		}
		//设备名称
		if(super.checkParam(sbmc)){
			conditions += " and se.shebeimingcheng like '%" + sbmc + "%'";
		}
		//注册代码
		if(super.checkParam(zcdm)){
			conditions += " and se.zhucedaima like '%" + zcdm + "%'";
		}
		//城市
		if(super.checkParam(shidaima)){
				conditions += " and se.shidaima = '" + shidaima + "'";
		}
		//区县
		if(super.checkParam(quhuadaima)){
			conditions += " and se.quhuadaima = '" + quhuadaima + "'";
		}
		//乡镇
		if(super.checkParam(xiangzhendaima)){
			conditions += " and se.xiangzhendaima = '" + xiangzhendaima + "'";
		}
		//检验开始日期
		if(super.checkParam(jianyanriqi)){
			conditions += " and TO_CHAR(se.jianyanjieshuriqi,'yyyy-MM-dd') >= '" + jianyanriqi + "'";
		}
		//检验结束日期
		if(super.checkParam(jianyanriqiend)){
			conditions += " and TO_CHAR(se.jianyanjieshuriqi,'yyyy-MM-dd') <= '" + jianyanriqiend + "'";
		}
		//下次检验开始日期
		if(super.checkParam(xiacijianyanriqi)){
			conditions += " and TO_CHAR(se.xiacijianyanriqi,'yyyy-MM-dd') >= '" + xiacijianyanriqi + "'";
		}
		//下次检验结束日期
		if(super.checkParam(xiacijianyanriqiend)){
			conditions += " and TO_CHAR(se.xiacijianyanriqi,'yyyy-MM-dd') <= '" + xiacijianyanriqiend + "'";
		}
		//制造开始日期
		if(super.checkParam(zhizaoriqi)){
			conditions += " and TO_CHAR(se.zhizaoriqi_date,'yyyy-MM-dd') >= '" + zhizaoriqi + "'";
		}
		//制造结束日期
		if(super.checkParam(zhizaoriqiend)){
			conditions += " and TO_CHAR(se.zhizaoriqi_date,'yyyy-MM-dd') <= '" + zhizaoriqiend + "'";
		}
		//投用开始日期
		if(super.checkParam(touyongriqi)){
			conditions += " and TO_CHAR(se.touyongriqi_date,'yyyy-MM-dd') >= '" + touyongriqi + "'";
		}
		//投用结束日期
		if(super.checkParam(touyongriqiend)){
			conditions += " and TO_CHAR(se.touyongriqi_date,'yyyy-MM-dd') <= '" + touyongriqiend + "'";
		}
		//安装单位代码
		if(super.checkParam(anzhuangdanwei_daima)){
			conditions += " and se.anzhuangdanwei_daima like '%" + anzhuangdanwei_daima + "%'";
		}
		//安装单位
		if(super.checkParam(shigongdanwei)){
			conditions += " and se.anzhuangdanwei like '%" + shigongdanwei + "%'";
		}
		//维保单位
		if(super.checkParam(weibaodanwei)){
			conditions += " and se.weihubaoyangdanwei like '%" + weibaodanwei + "%'";
		}
		//注册登记日期
		if(super.checkParam(zhuceriqi)){
			conditions += " and TO_CHAR(se.zhuceriqi,'yyyy-MM-dd') >= '" + zhuceriqi + "'";
		}
		if(super.checkParam(zhuceriqiend)){
			conditions += " and TO_CHAR(se.zhuceriqi,'yyyy-MM-dd') <= '" + zhuceriqiend + "'";
		}
		//设备使用单位代码
		if(super.checkParam(shiyongdanweiId)){
			conditions += " and se.shiyongdanweiId like '%" + shiyongdanweiId + "%'";
		}
		//审批状态
		if(super.checkParam(state)){
			conditions += " and se.state = '" + state + "'";
		}
		
		if(super.checkParam(isflag)){
			if("0".equals(isflag)){
				conditions += " and se.xiacijianyanriqi is not null";
			}else if("1".equals(isflag)){
				conditions += " and se.xiacijianyanriqi is null";
			}
		}
		
		//出厂编号
		if(super.checkParam(chuchangbianhao)){
			conditions += " and se.chuchangbianhao like '%" + chuchangbianhao + "%'";
		}
		//内部编号
		if(super.checkParam(neibubianhao)){
			conditions += " and se.neibubianhao like '%" + neibubianhao + "%'";
		}
		//使用证编号
		if(super.checkParam(dengjizhengbianhao)){
			conditions += " and se.dengjizhengbianhao like '%" + dengjizhengbianhao + "%'";
		}
		//单位内部代码
		if(super.checkParam(shiyongdanwei_code)){
			conditions += " and se.shiyongdanwei_code like '%" + shiyongdanwei_code + "%'";
		}
		//设备使用地点
		if(super.checkParam(shebeididian)){
			conditions += " and se.shebeididian like '%" + shebeididian + "%'";
		}
		//制造单位
		if(super.checkParam(zhizaodanwei)){
			conditions += " and se.zhizaodanwei like '%" + zhizaodanwei + "%'";
		}
		//是否已删除
		if(super.checkParam(zfstate)){
			conditions += " and se.zfstate = '" + zfstate + "'";
		}
		//使用单位
		if(super.checkParam(sydw)){
			conditions += " and se.shiyongdanwei like '%" + sydw + "%'";
		}
		
		//产权单位
		if(super.checkParam(chanquandanwei)){
			conditions += " and se.chanquandanwei like '%" + chanquandanwei + "%'";
		}
		//设计单位
		if(super.checkParam(shejidanwei)){
			conditions += " and se.shejidanwei like '%" + shejidanwei + "%'";
		}
		//设计单位代码
		if(super.checkParam(shejidanweidaima)){
			conditions += " and se.shejidanweidaima like '%" + shejidanweidaima + "%'";
		}
		//隐患类别（事故类别）
		if(super.checkParam(yhtype)){
			conditions += " and se.shiguleibie = '" + yhtype + "'";
		}
		//制造单位代码
		if(super.checkParam(zhizaodanweidaima)){
			conditions += " and se.zhizaodanwei_code like '%" + zhizaodanweidaima + "%'";
		}
		//监检单位
		if(super.checkParam(jianyanjigou)){
			conditions += " and se.jianyanjigou like '%" + jianyanjigou + "%'";
		}
		//监检单位代码
		if(super.checkParam(jianyanjigou_code)){
			conditions += " and se.jianyanjigou_code like '%" + jianyanjigou_code + "%'";
		}
		//是否危化品
		if(super.checkParam(weihuapin)){
			conditions += " and se.shifou_zhongdaweixianyuan = '" + weihuapin + "'";
		}
		//是否公众聚集场所
		if(super.checkParam(jujichangsuo)){
			conditions += " and se.shifou_renkoumijiqu = '" + jujichangsuo + "'";
		}
		//是否重要特种设备
		if(super.checkParam(zhongyaoshebei)){
			conditions += " and se.shifou_yingjifangan = '" + zhongyaoshebei + "'";
		}
		//是否重点监控特种设备
		if(super.checkParam(jiankongshebei)){
			conditions += " and se.shifou_zhongdianjiankong = '" + jiankongshebei + "'";
		}
		//所在车间分厂
		if(super.checkParam(suozaichejian)){
			conditions += " and se.suoshuchejian like '%" + suozaichejian + "%'";
		}
		//是否熔融金属
		if(super.checkParam(rongrongjinshu)){
			conditions += " and se.shifou_dyrrjs = '" + rongrongjinshu + "'";
		}
		
		//修改日期
		if(super.checkParam(xiugaikaishiriqi)){
			conditions += " and TO_CHAR(se.updateTime,'yyyy-MM-dd') >= '" + xiugaikaishiriqi + "'";
		}
		if(super.checkParam(xiugaijishuriqi)){
			conditions += " and TO_CHAR(se.updateTime,'yyyy-MM-dd') <= '" + xiugaijishuriqi + "'";
		}
		
		//使用单位代码
		if(super.checkParam(shiyongdanweiCode)){
			conditions += " and se.shiyongdanwei_code like '%" + shiyongdanweiCode + "%'";
		}
		
		//排序
		if(super.checkParam(paixu) ){
			order = " order by "+paixu+" "; 
		}
		
		if(super.checkParam(zt)){
			if("ls".equals(zt)){
				if("".equals(conditions)){
					//eqhide = '0' and tmpData = '0'
					conditions += " and tmpData = '0' ";
				}
				conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0' OR se.zcstatus = '3') )"; 
			}else{
				//使用状态
				if(super.checkParam(zcstatus)){
					if("1".equals(zcstatus)){
						//是否包含停用
						if("1".equals(ty)){
							conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0' OR se.zcstatus = '3') )"; 
						}else{
							conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0') )"; 
						}
					}else{
						conditions += " and se.zcstatus = '" + zcstatus + "'";
					}
					//conditions += " and se.zcstatus = '" + zcstatus + "'";
				}else{
					conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0') )";
				}
			}
		}else{
			//使用状态
			if(super.checkParam(zcstatus)){
				if("1".equals(zcstatus)){
					//是否包含停用
					if("1".equals(ty)){
						conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0' OR se.zcstatus = '3') )"; 
					}else{
						conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0') )"; 
					}
				}else{
					conditions += " and se.zcstatus = '" + zcstatus + "'";
				}
				//conditions += " and se.zcstatus = '" + zcstatus + "'";
			}else{
				conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0') )";
			}
		}

		//是否重复
		if("cf".equals(zt)){
			conditions += " and se.chongfu = '1' ";  
			order = " order by se.zhucedaima desc ";
		}else if("bhg".equals(zt)){
			conditions += " and se.chongfu = '2' ";
		}else{
			conditions += " and se.chongfu = '0' ";
		}
		if(super.checkParam(chaxunsql)){
			String str = "";
			//设备类别
			if(super.checkParam(sblb)){
				str += " and shebeileibiedaima = '" + sblb + "' ";
			}
			//设备类别
			if(super.checkParam(sbzl)){
				str += " and shebeizhongleidaima = '" + sbzl + "' ";
			}
			//城市
			if(super.checkParam(shidaima)){
				str += " and shidaima = '" + shidaima + "' ";
			}
			//区县
			if(super.checkParam(quhuadaima)){
				str += " and quhuadaima = '" + quhuadaima + "' ";
			}
			//乡镇
			if(super.checkParam(xiangzhendaima)){
				str += " and xiangzhendaima = '" + xiangzhendaima + "' ";
			}
			
			//排序
			if(super.checkParam(pxlx) && super.checkParam(paixu) ){
				order = " order by "+paixu+" "+pxlx+" "; 
			}else {
				order = " order by id desc "; 
			}
			
			chaxunsql = str+chaxunsql+order;
		}

		if("exp".equals(expExcel)){
			String ids = super.getParameter("ids");
			String columns = super.getParameter("columns");
			if(super.checkParam(ids)){
				query += " and se.id in ("+ids+") ";
			}
			OutputStream os = null;
			String name = "设备列表";
			try {
				os = super.getResponse().getOutputStream();
				super.getResponse().reset();
				super.getResponse().setHeader("Content-disposition",
						"attachment; filename=" + new String(name.getBytes(), "ISO8859-1")+ ".xls"); 
				super.getResponse().setContentType("application/msexcel");
				
				seService.expExcel(query += conditions + order,os,columns,chaxunsql);
			} catch (Exception ex) {
		//		System.out.println("流操作错误:" + ex.getMessage());
			}
			return null;
		}
		
		
		query += conditions + order;
		
		long records = 0L;
		long total = 0L;
		List ses = null;
		
		if(super.checkParam(zt)){
			if("ls".equals(zt)){
				int startPage = (super.getPagination()-1)*super.getRowNumber();
				int endPage = super.getRowNumber()*super.getPagination();
				ses = seService.findPro(conditions,startPage,endPage,"{call two_pro(?,?,?,?,?)}");
				records = seService.getTotal();
			}else{
				if(super.checkParam(chaxunsql)){
					
					int startPage = (super.getPagination()-1)*super.getRowNumber();
					int endPage = super.getRowNumber()*super.getPagination();
					
					ses = seService.findPro(chaxunsql,startPage,endPage,"{call one_pro(?,?,?,?,?)}");
					
					records = seService.getTotal();
				}else{
					
					ses = seService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
					
					records = seService.findTotalByHql("select count(se) " + query);
					
				}
			}
		}else{
			if(super.checkParam(chaxunsql)){
				
				int startPage = (super.getPagination()-1)*super.getRowNumber();
				int endPage = super.getRowNumber()*super.getPagination();
				
				ses = seService.findPro(chaxunsql,startPage,endPage,"{call one_pro(?,?,?,?,?)}");
				
				records = seService.getTotal();
			}else{
				ses = seService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
				records = seService.findTotalByHql("select count(se) " + query);
			}
		}
		total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, ses);
		return SUCCESS;
	}
	
	
	/**
	 * 已停用 设备
	 * @return
	 * @throws Exception
	 */
	public String getListForStop() throws Exception{
		TUser user = (TUser)getSession().getAttribute(IConstant.SESSION_TUSER);
		
		TDicType type = (TDicType) seService.findSingletonByHql("FROM TDicType t WHERE t.code = 'SD_XZQH'");
		
		String zcdm = super.getParameter("zhucedaima");
		String sbzl = super.getParameter("shebeizhonglei");
		String gzbh = super.getParameter("gaozhibianhao");
		String gzrq = super.getParameter("gaozhiriqi");
		String ccbh = super.getParameter("chuchangbianhao");
		String qx = super.getParameter("quhuadaima");
		String sgdw = super.getParameter("shigongdanwei");
		String sydw = super.getParameter("shiyongdanwei");
		String qhdm = super.getParameter("quhuadaima");

//		System.out.println("sbzl="+sbzl+"&sbmc="+sbmc+"&sydw="+sydw+"&zcdm="+zcdm+"&qx="+qx);
		String query = "from TBaseInfoSearch se where 1=1 and zcstatus='3'";
		String conditions = "";
		String order = " order by se.id desc";
		
		if(super.checkParam(sbzl)){
			conditions += " and se.shebeizhongleidaima like '%" + sbzl + "%'";
		}
		if(super.checkParam(zcdm)){
			conditions += " and se.zhucedaima like '%" + zcdm + "%'";
		}
		if(super.checkParam(gzbh)){
			conditions += " and se.gaozhibianhao like '%" + gzbh + "%'";
		}
		if(super.checkParam(gzrq)){
			conditions += " and se.gaozhiriqi like '%" + gzrq + "%'";
		}
		if(super.checkParam(ccbh)){
			conditions += " and se.chuchangbianhao like '%" + ccbh + "%'";
		}
		if(super.checkParam(qx)){
			conditions += " and se.quhuadaima like '%" + qx + "%'";
		}
		if(super.checkParam(sydw)){
			conditions += " and se.shiyongdanwei like '%" + sydw + "%'";
		}
		if(super.checkParam(sgdw)){
			conditions += " and se.shigongdanwei like '%" + sgdw + "%'";
		}
		query += conditions + order;
		
		List ses = seService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long total = seService.findTotalByHql("select count(se) " + query);
		super.addActionData(ROWS, ses).addActionData(TOTAL, total);
		return SUCCESS;
	}
	
	/**
	 * 管道  根据使用登记证分组查看
	 * @return
	 * @throws Exception
	 */
	public String getGDListGRDjz() throws Exception{

		TOrgan organ = (TOrgan)getSession().getAttribute(IConstant.SESSION_TORGAN);
		//设备种类
		String sbzl = super.getParameter("shebeizhonglei");
		sbzl = URLDecoder.decode(sbzl,"utf-8");
		//注册代码
		String zcdm = super.getParameter("zhucedaima");
		
		//设备名称
		String sbmc = super.getParameter("shebeimingcheng");
		sbmc = URLDecoder.decode(sbmc,"utf-8");
		//设备类别
		String sblb = super.getParameter("shebeileibie");
		sblb = URLDecoder.decode(sblb,"utf-8");
		//使用单位
		String sydw = super.getParameter("shiyongdanwei");
		sydw = URLDecoder.decode(sydw,"utf-8");
		//城市         区县       乡镇
		String shidaima = super.getParameter("shidaima");
		String quhuadaima = super.getParameter("quhuadaima");
		String xiangzhendaima = super.getParameter("xiangzhendaima");
		//检验日期
		String jianyanriqi = super.getParameter("jianyankaishiriqi");
		String jianyanriqiend = super.getParameter("jianyanjieshuriqi");
		//制造日期
		String zhizaoriqi = super.getParameter("zhizaokaishiriqi");
		String zhizaoriqiend = super.getParameter("zhizaojieshuriqi");
		//投用日期
		String touyongriqi = super.getParameter("touyongkaishiriqi");
		String touyongriqiend = super.getParameter("touyongjieshuriqi");
		//主键id
		String sydwid = super.getParameter("sydwid");
		//审批状态
		String state = super.getParameter("state");
		//使用证编号
		String dengjizhengbianhao =  super.getParameter("dengjizhengbianhao");
		dengjizhengbianhao = URLDecoder.decode(dengjizhengbianhao,"utf-8");
		//注册登记日期
		String zhuceriqi = super.getParameter("zhuceriqi");
		String zhuceriqiend = super.getParameter("zhuceriqiend");
		//设备使用单位代码
		String shiyongdanweiId = super.getParameter("shiyongdanweiId");
		//设备使用单位
		String shiyongdanwei = super.getParameter("shiyongdanwei");
		shiyongdanwei = URLDecoder.decode(shiyongdanwei,"utf-8");
		//单位内部代码（使用单位代码）
		String shiyongdanwei_code = super.getParameter("shiyongdanwei_code");
		//单位内部编号
		String neibubianhao = super.getParameter("neibubianhao");
		//设备使用地点
		String shebeididian =  super.getParameter("shebeididian");
		shebeididian = URLDecoder.decode(shebeididian,"utf-8");
		//制造单位
		String zhizaodanwei = super.getParameter("zhizaodanwei");
		zhizaodanwei = URLDecoder.decode(zhizaodanwei,"utf-8");
		//是否已删除
		String zfstate = super.getParameter("zfstate");
		//出厂编号
		String chuchangbianhao = super.getParameter("chuchangbianhao");
		chuchangbianhao = URLDecoder.decode(chuchangbianhao,"utf-8");
		//安装单位代码
		String anzhuangdanwei_daima = super.getParameter("anzhuangdanweidaima");
		//安装单位
		String shigongdanwei = super.getParameter("anzhuangdanwei");
		shigongdanwei = URLDecoder.decode(shigongdanwei,"utf-8");
		//使用状态
		String zcstatus = super.getParameter("zcstatus");
		//是否包含停用
		String ty = super.getParameter("ty");
		//下次检验日期小于（含空的）
		String xiacijianyanriqi = super.getParameter("xiacijianyanriqi");
		String xiacijianyanriqiend = super.getParameter("xiacijianyanriqiend");
		//隐患类别（事故类别）
		String yhtype = super.getParameter("yinhuan");
		yhtype = URLDecoder.decode(yhtype,"utf-8");
		String weibaodanwei = super.getParameter("weibaodanwei");
		weibaodanwei = URLDecoder.decode(weibaodanwei,"utf-8");
		//判断设备
		String zt = super.getParameter("zt");
		String expExcel = super.getParameter("expExcel");
		String isflag = super.getParameter("isflag");
		//产权单位
		String chanquandanwei = super.getParameter("chanquandanwei");
		chanquandanwei = URLDecoder.decode(chanquandanwei,"utf-8");
		//设计单位代码
		String shejidanweidaima = super.getParameter("shejidanweidaima");
		String shejidanwei = super.getParameter("shejidanwei");
		shejidanwei = URLDecoder.decode(shejidanwei,"utf-8");
		//制造单位代码
		String zhizaodanweidaima = super.getParameter("zhizaodanweidaima");
		//监检单位
		String jianyanjigou = super.getParameter("jianjiandanwei");
		jianyanjigou = URLDecoder.decode(jianyanjigou,"utf-8");
		//监检单位代码
		String jianyanjigou_code = super.getParameter("jianjiandanweidaima");
		jianyanjigou_code = URLDecoder.decode(jianyanjigou_code,"utf-8");
		//是否危化品
		String weihuapin = super.getParameter("weihuapin");
		weihuapin = URLDecoder.decode(weihuapin,"utf-8");
		//是否公众聚集场所
		String jujichangsuo = super.getParameter("jujichangsuo");
		jujichangsuo = URLDecoder.decode(jujichangsuo,"utf-8");
		//是否重要特种设备
		String zhongyaoshebei = super.getParameter("zhongyaoshebei");
		zhongyaoshebei = URLDecoder.decode(zhongyaoshebei,"utf-8");
		//是否重点监控特种设备
		String jiankongshebei = super.getParameter("jiankongshebei");
		jiankongshebei = URLDecoder.decode(jiankongshebei,"utf-8");
		//所在车间分厂
		String suozaichejian = super.getParameter("suozaichejian");
		suozaichejian = URLDecoder.decode(suozaichejian,"utf-8");
		//是否熔融金属
		String rongrongjinshu = super.getParameter("rongrongjinshu");
		rongrongjinshu = URLDecoder.decode(rongrongjinshu,"utf-8");
		//排序内容
		String paixu = super.getParameter("paixu");
		//排序类型
		String pxlx = super.getParameter("paixuleixing");
		
		//修改开始日期
		String xiugaikaishiriqi = super.getParameter("xiugaikaishiriqi"); 
		//修改结束日期
		String xiugaijishuriqi = super.getParameter("xiugaijieshuriqi");
		//管道使用
		String gd = super.getParameter("gd");
		//使用单位代码
		String shiyongdanweiCode = super.getParameter("shiyongdanweiCode");

		String conditions = " where se.tmpData = '0' and se.eqhide = '0' and se.zfstate = '0' and se.shebeizhongleidaima = '8000' and se.dengjizhengbianhao is not null ";
		
		String order = " order by se.xiacijianyanriqi ";
		
		//设备类别
		if(super.checkParam(sblb)){
			conditions += " and se.shebeileibiedaima = '" + sblb + "'";
		}
		
		//权限控制
		if(organ.getCode().length() == 4){//市级用户
			conditions += " and se.shidaima = '" + organ.getCode() + "'";
		}else if(organ.getCode().length() == 6){//县级用户
			conditions += " and se.quhuadaima = '" + organ.getCode() + "'";
		}else if(organ.getCode().length() == 9){//乡镇街道级用户
			if(super.checkParam(organ.getGuanxiajigou())){
				conditions += " and se.xiangzhendaima in ('" + organ.getGuanxiajigou().replace(",","','") + "')";
			}else{
				conditions += " and se.xiangzhendaima = '" + organ.getCode() + "'";
			}
		}
		//判断进入的是哪个页面 （首次登陆）
		if(super.checkParam(zt)){
			if("1".equals(zt)){//合格设备
				conditions += " and to_date(to_char(se.xiacijianyanriqi,'yyyy/MM/dd'),'yyyy/MM/dd')-trunc(sysdate) > 30 ";
			}else if("2".equals(zt)){//预警设备
				conditions += " and to_date(to_char(se.xiacijianyanriqi,'yyyy/MM/dd'),'yyyy/MM/dd') - trunc(sysdate) <= 30 and to_date(to_char(se.xiacijianyanriqi,'yyyy/MM/dd'),'yyyy/MM/dd') - trunc(sysdate) >= 0 ";
			}else if("3".equals(zt)){//超期设备
				conditions += " and (to_date(to_char(se.xiacijianyanriqi,'yyyy/MM/dd'),'yyyy/MM/dd') - trunc(sysdate) < 0 or se.xiacijianyanriqi is null) ";
			}else if("4".equals(zt)){//合格设备
				conditions += " and ((jianyanjielun = '合格' or jianyanjielun = '复检合格' or jianyanjielun = '符合要求' or jianyanjielun = '允许运行') or jianyanjielun is null)";
			}else if("5".equals(zt)){//不合格设备
				conditions += " and (jianyanjielun != '合格' and  jianyanjielun != '复检合格' and jianyanjielun != '符合要求' and jianyanjielun != '允许运行')";
			}
		}
		//设备类别
		if(super.checkParam(sbzl)){
			conditions += " and se.shebeizhongleidaima = '" + sbzl + "'";
		}
		//设备名称
		if(super.checkParam(sbmc)){
			conditions += " and se.shebeimingcheng like '%" + sbmc + "%'";
		}
		//注册代码
		if(super.checkParam(zcdm)){
			conditions += " and se.zhucedaima like '%" + zcdm + "%'";
		}
		//城市
		if(super.checkParam(shidaima)){
				conditions += " and se.shidaima = '" + shidaima + "'";
		}
		//区县
		if(super.checkParam(quhuadaima)){
			conditions += " and se.quhuadaima = '" + quhuadaima + "'";
		}
		//乡镇
		if(super.checkParam(xiangzhendaima)){
			conditions += " and se.xiangzhendaima = '" + xiangzhendaima + "'";
		}
		//检验开始日期
		if(super.checkParam(jianyanriqi)){
			conditions += " and TO_CHAR(se.jianyanjieshuriqi,'yyyy-MM-dd') >= '" + jianyanriqi + "'";
		}
		//检验结束日期
		if(super.checkParam(jianyanriqiend)){
			conditions += " and TO_CHAR(se.jianyanjieshuriqi,'yyyy-MM-dd') <= '" + jianyanriqiend + "'";
		}
		//下次检验开始日期
		if(super.checkParam(xiacijianyanriqi)){
			conditions += " and TO_CHAR(se.xiacijianyanriqi,'yyyy-MM-dd') >= '" + xiacijianyanriqi + "'";
		}
		//下次检验结束日期
		if(super.checkParam(xiacijianyanriqiend)){
			conditions += " and TO_CHAR(se.xiacijianyanriqi,'yyyy-MM-dd') <= '" + xiacijianyanriqiend + "'";
		}
		//制造开始日期
		if(super.checkParam(zhizaoriqi)){
			conditions += " and TO_CHAR(se.zhizaoriqi_date,'yyyy-MM-dd') >= '" + zhizaoriqi + "'";
		}
		//制造结束日期
		if(super.checkParam(zhizaoriqiend)){
			conditions += " and TO_CHAR(se.zhizaoriqi_date,'yyyy-MM-dd') <= '" + zhizaoriqiend + "'";
		}
		//投用开始日期
		if(super.checkParam(touyongriqi)){
			conditions += " and TO_CHAR(se.touyongriqi_date,'yyyy-MM-dd') >= '" + touyongriqi + "'";
		}
		//投用结束日期
		if(super.checkParam(touyongriqiend)){
			conditions += " and TO_CHAR(se.touyongriqi_date,'yyyy-MM-dd') <= '" + touyongriqiend + "'";
		}
		//安装单位代码
		if(super.checkParam(anzhuangdanwei_daima)){
			conditions += " and se.anzhuangdanwei_daima like '%" + anzhuangdanwei_daima + "%'";
		}
		//安装单位
		if(super.checkParam(shigongdanwei)){
			conditions += " and se.anzhuangdanwei like '%" + shigongdanwei + "%'";
		}
		//使用单位
		if(super.checkParam(shiyongdanwei)){
			conditions += " and se.shiyongdanwei like '%" + shiyongdanwei + "%'";
		}
		//维保单位
		if(super.checkParam(weibaodanwei)){
			conditions += " and se.weihubaoyangdanwei like '%" + weibaodanwei + "%'";
		}
		//注册登记日期
		if(super.checkParam(zhuceriqi)){
			conditions += " and TO_CHAR(se.zhuceriqi,'yyyy-MM-dd') >= '" + zhuceriqi + "'";
		}
		if(super.checkParam(zhuceriqiend)){
			conditions += " and TO_CHAR(se.zhuceriqi,'yyyy-MM-dd') <= '" + zhuceriqiend + "'";
		}
		//设备使用单位代码
		if(super.checkParam(shiyongdanweiId)){
			conditions += " and se.shiyongdanweiId like '%" + shiyongdanweiId + "%'";
		}
		//审批状态
		if(super.checkParam(state)){
			conditions += " and se.state = '" + state + "'";
		}
		
		/*//隐患类别
		if(super.checkParam(yhtype)){
			conditions += " and se.yhtype = '" + yhtype + "'";
		}*/
		
		if(super.checkParam(isflag)){
			if("0".equals(isflag)){
				conditions += " and se.xiacijianyanriqi is not null";
			}else if("1".equals(isflag)){
				conditions += " and se.xiacijianyanriqi is null";
			}
		}
		
		//出厂编号
		if(super.checkParam(chuchangbianhao)){
			conditions += " and se.chuchangbianhao like '%" + chuchangbianhao + "%'";
		}
		//使用证编号
		if(super.checkParam(dengjizhengbianhao)){
			conditions += " and se.dengjizhengbianhao like '%" + dengjizhengbianhao + "%'";
		}
		//单位内部代码
		if(super.checkParam(shiyongdanwei_code)){
			conditions += " and se.shiyongdanwei_code like '%" + shiyongdanwei_code + "%'";
		}
		//设备使用地点
		if(super.checkParam(shebeididian)){
			conditions += " and se.shebeididian like '%" + shebeididian + "%'";
		}
		//制造单位
		if(super.checkParam(zhizaodanwei)){
			conditions += " and se.zhizaodanwei like '%" + zhizaodanwei + "%'";
		}
		//是否已删除
		if(super.checkParam(zfstate)){
			conditions += " and se.zfstate = '" + zfstate + "'";
		}
		//使用单位
		if(super.checkParam(sydw)){
			conditions += " and se.shiyongdanwei like '%" + sydw + "%'";
		}
		
		//产权单位
		if(super.checkParam(chanquandanwei)){
			conditions += " and se.chanquandanwei like '%" + chanquandanwei + "%'";
		}
		//设计单位
		if(super.checkParam(shejidanwei)){
			conditions += " and se.shejidanwei like '%" + shejidanwei + "%'";
		}
		//设计单位代码
		if(super.checkParam(shejidanweidaima)){
			conditions += " and se.shejidanweidaima like '%" + shejidanweidaima + "%'";
		}
		//隐患类别（事故类别）
		if(super.checkParam(yhtype)){
			conditions += " and se.shiguleibie = '" + yhtype + "'";
		}
		//制造单位代码
		if(super.checkParam(zhizaodanweidaima)){
			conditions += " and se.zhizaodanwei_code like '%" + zhizaodanweidaima + "%'";
		}
		//监检单位
		if(super.checkParam(jianyanjigou)){
			conditions += " and se.jianyanjigou like '%" + jianyanjigou + "%'";
		}
		//监检单位代码
		if(super.checkParam(jianyanjigou_code)){
			conditions += " and se.jianyanjigou_code like '%" + jianyanjigou_code + "%'";
		}
		//是否危化品
		if(super.checkParam(weihuapin)){
			conditions += " and se.shifou_zhongdaweixianyuan = '" + weihuapin + "'";
		}
		//是否公众聚集场所
		if(super.checkParam(jujichangsuo)){
			conditions += " and se.shifou_renkoumijiqu = '" + jujichangsuo + "'";
		}
		//是否重要特种设备
		if(super.checkParam(zhongyaoshebei)){
			conditions += " and se.shifou_yingjifangan = '" + zhongyaoshebei + "'";
		}
		//是否重点监控特种设备
		if(super.checkParam(jiankongshebei)){
			conditions += " and se.shifou_zhongdianjiankong = '" + jiankongshebei + "'";
		}
		//所在车间分厂
		if(super.checkParam(suozaichejian)){
			conditions += " and se.suoshuchejian like '%" + suozaichejian + "%'";
		}
		//是否熔融金属
		if(super.checkParam(rongrongjinshu)){
			conditions += " and se.shifou_dyrrjs = '" + rongrongjinshu + "'";
		}
		
		//修改日期
		if(super.checkParam(xiugaikaishiriqi)){
			conditions += " and TO_CHAR(se.updateTime,'yyyy-MM-dd') >= '" + xiugaikaishiriqi + "'";
		}
		if(super.checkParam(xiugaijishuriqi)){
			conditions += " and TO_CHAR(se.updateTime,'yyyy-MM-dd') <= '" + xiugaijishuriqi + "'";
		}
		
		//使用单位代码
		if(super.checkParam(shiyongdanweiCode)){
			conditions += " and se.shiyongdanwei_code like '%" + shiyongdanweiCode + "%'";
		}
		
		//排序
		if(super.checkParam(paixu) ){
			order = " order by "+paixu+" "; 
		}
		
		if(super.checkParam(zt)){
			if("ls".equals(zt)){
				if("".equals(conditions)){
					//eqhide = '0' and tmpData = '0'
					conditions += " and tmpData = '0' ";
				}
				conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0' OR se.zcstatus = '3') )"; 
			}else{
				//使用状态
				if(super.checkParam(zcstatus)){
					if("1".equals(zcstatus)){
						//是否包含停用
						if("1".equals(ty)){
							conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0' OR se.zcstatus = '3') )"; 
						}else{
							conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0') )"; 
						}
					}else{
						conditions += " and se.zcstatus = '" + zcstatus + "'";
					}
					//conditions += " and se.zcstatus = '" + zcstatus + "'";
				}else{
					conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0') )";
				}
			}
		}else{
			//使用状态
			if(super.checkParam(zcstatus)){
				if("1".equals(zcstatus)){
					//是否包含停用
					if("1".equals(ty)){
						conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0' OR se.zcstatus = '3') )"; 
					}else{
						conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0') )"; 
					}
				}else{
					conditions += " and se.zcstatus = '" + zcstatus + "'";
				}
				//conditions += " and se.zcstatus = '" + zcstatus + "'";
			}else{
				conditions += " and ((se.zcstatus='1' OR se.zcstatus = '0') )";
			}
		}

		//是否重复
		if("cf".equals(zt)){
			conditions += " and se.chongfu = '1' ";  
			order = " order by se.zhucedaima desc ";
		}else if("bhg".equals(zt)){
			conditions += " and se.chongfu = '2' ";
		}else{
			conditions += " and se.chongfu = '0' ";
		}

//		query += conditions + order;

		int start = (super.getPagination()-1)*super.getRowNumber()+1;
		String query = "SELECT * "+
			 " FROM (SELECT ROWNUM AS rowno,gt.* " +
			         " FROM ( "+
			          " select b.* from ( "+
			          " select row_number() over (partition by ltrim(rtrim(se.dengjizhengbianhao)) order by se.dengjizhengbianhao) as gid,"+
			          " count(se.dengjizhengbianhao) over (partition by ltrim(rtrim(se.dengjizhengbianhao)) order by se.dengjizhengbianhao) as shuliang,"+
			          " se.* from biz_se se "+conditions+order+") b "+
			          " where b.gid = 1 "+
			          " ) gt "+
			         " WHERE  ROWNUM <= "+super.getPagination()*super.getRowNumber()+") t " +
			" WHERE t.rowno >= "+start;

		long records = 0L;
		long total = 0L;
		List<HashMap<String,Object>> ses = null;
		List list = new ArrayList();
		TBaseInfoGDTools bs = null;
		
		ses = seService.findListBySql(query);
	//	records = seService.findTotalByHql("select count(*) from (select dengjizhengbianhao from TBaseInfoSearch se "+conditions+" group by dengjizhengbianhao)");
		List<HashMap<String,Object>> recordsList = seService.findListBySql("select count(*) ct from (select dengjizhengbianhao from biz_se se "+conditions+" group by dengjizhengbianhao)");
		records = Long.parseLong(recordsList.get(0).get("ct").toString());
		total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;
		
		for(HashMap<String,Object> m : ses){
			bs = new TBaseInfoGDTools();
			bs.setId(Long.parseLong(m.get("id").toString()));
			bs.setShiyongdanwei(String.valueOf(m.get("shiyongdanwei")));
			bs.setShebeimingcheng(String.valueOf(m.get("shebeimingcheng")));
			bs.setShebeixinghao(String.valueOf(m.get("shebeixinghao")));
			bs.setDengjizhengbianhao(String.valueOf(m.get("dengjizhengbianhao")));
			bs.setZhucedaima(String.valueOf(m.get("zhucedaima")));
			bs.setShebeileibie(String.valueOf(m.get("shebeileibie")));
			bs.setShi(String.valueOf(m.get("shi")));
			bs.setQuhuamingcheng(String.valueOf(m.get("quhuamingcheng")));
			bs.setXiangzhen(String.valueOf(m.get("xiangzhen")));
			if(null != m.get("xiacijianyanriqi") && !"null".equals(m.get("xiacijianyanriqi"))){
				bs.setXiacijianyanriqi(DateFormatTool.formate(DateFormatTool.formatStringToDate(String.valueOf(m.get("xiacijianyanriqi")), "yyyy-MM-dd"),"yyyy-MM-dd"));
			}
			bs.setShuliang(String.valueOf(m.get("shuliang")));
			list.add(bs);
		}
		
		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, list);
		return SUCCESS;
	}
  	/**
  	 * 查找设备文件方法
  	 * @return
  	 */
  	public String seListFile(){
  		String seId = super.getParameter("id"); //设备主键
  		
  		List list = seService.findPageListByHql("from TBaseFile t where t.dataId = "+seId, super.getPagination(), super.getRowNumber());
  		long records = seService.findTotalByHql("select count(t) from TBaseFile t where t.dataId = "+seId);


  		long total = records%super.getRowNumber() == 0 ? records/super.getRowNumber() : records/super.getRowNumber()+1;

		super.addActionData(TOTAL, total).addActionData(RECORDS, records).addActionData(ROWS, list);
  		
  		return SUCCESS;
  	}
  	
  	
  	
  	
}
