package com.stone.biz.sjsh.action;

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
import com.stone.biz.sjsh.pojo.TShuJuShenHe;
import com.stone.biz.sjsh.service.SjshService;

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
public class SjshListAction extends SupportListAction {

	private static final long serialVersionUID = 3979577965804736350L;

	private SjshService sjshService;
	
	public void setSjshService(SjshService sjshService) {
		this.sjshService = sjshService;
	}

	public String getList() throws Exception{
		TUser user = (TUser) getSession().getAttribute(IConstant.SESSION_TUSER);
		String shujuleibie = super.getParameter("shujuleibie");
		String danweimingcheng = super.getParameter("danweimingcheng");
		String danweidizhi = super.getParameter("danweidizhi");
		String zhucedaima = super.getParameter("zhucedaima");
		String shebeizhonglei = super.getParameter("shebeizhonglei");
		String shujuneirong = super.getParameter("shujuneirong");
		String xiugaishijian = super.getParameter("xiugaishijian"); //最后修改时间开始
		String xiugaishijianend = super.getParameter("xiugaishijianend"); //最后修改时间结束日期
		String shstate = super.getParameter("shstate");
		String query = "from TShuJuShenHe s where 1=1 ";
		String conditions = "";
		String order = " order by s.id desc";
		conditions += " and s.tijiaoren_loginId = '"+user.getLoginId()+"'";

		if(super.checkParam(shstate)){
			conditions += " and s.shstate = '" + shstate+"'";
		}
		if(super.checkParam(shujuleibie)){
			conditions += " and s.type = '" + shujuleibie+"'";
		}
		if(super.checkParam(shujuneirong)){
			conditions += " and s.neirong like '%" + shujuneirong+"%'";
		}
		if(super.checkParam(danweimingcheng)){
			conditions += " and s.neirong like '%" + danweimingcheng+"%'";
		}
		if(super.checkParam(danweidizhi)){
			conditions += " and s.neirong like '%" + danweidizhi+"%'";
		}
		if(super.checkParam(zhucedaima)){
			conditions += " and s.neirong like '%" + zhucedaima+"%'";
		}
		if(super.checkParam(shebeizhonglei)){
			conditions += " and s.neirong like '%" + sjshService.getSeNameByCode(shebeizhonglei)+"%'";
		}
		//最后修改时间
		if(super.checkParam(xiugaishijian)){
			conditions += " and s.tijiaoriqi >= to_date('"+xiugaishijian+"','yyyy-MM-dd hh24:mi:ss') ";
		}
		if(super.checkParam(xiugaishijianend)){
			conditions += " and s.tijiaoriqi <= to_date('"+xiugaishijianend+"','yyyy-MM-dd hh24:mi:ss') ";
		}
		
		query += conditions + order;
		List ses = sjshService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long total = sjshService.findTotalByHql("select count(s) " + query);
		super.addActionData(ROWS, ses).addActionData(TOTAL, total);
		return SUCCESS;
	}
}
