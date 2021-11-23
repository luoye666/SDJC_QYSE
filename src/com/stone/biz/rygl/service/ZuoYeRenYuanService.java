package com.stone.biz.rygl.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.stone.biz.dbsx.pojo.TDaiBanShiXiang;
import com.stone.biz.rygl.pojo.TZuoYeRenYuan;
import com.stone.biz.utils.pojo.TCzUtils;
import com.stone.biz.utils.pojo.TSyUtils;
import com.stone.support.SupportService;
import com.stone.support.utils.DateFormatTool;
import com.stone.support.utils.FileUtils;
import com.stone.support.utils.ParameterUtils;
import com.stone.support.utils.Resources;
import com.stone.support.utils.StringUtils;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TMenu;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TRole;
import com.stone.sys.pojo.TSeDirectory;
import com.stone.sys.pojo.TUser;

public class ZuoYeRenYuanService extends SupportService {
	public void deleteByXkz(String ids){
		super.deleteAll(ids, TZuoYeRenYuan.class.getName());
	}
	//删除文件
	public void delFileByPath(String path){
		String filePath = ServletActionContext.getRequest().getRealPath("")+path;
		File file = new File(filePath);
		if(file.exists()){
			file.delete();
		}
	}
	//获取证书信息菜单的id
	public long getZhengShuId(String mid){
		long id = 0;
		TMenu menu = (TMenu)super.findById(Long.parseLong(mid), TMenu.class.getName());
		String hql = "from TMenu where parentId = '"+menu.getParentId()+"' and title = '许可证信息'";
		List<TMenu> list = super.findListByHql(hql);
		if(list.size()>0){
			id = list.get(0).getId();
		}
		return id;
	}
	
	//更新待办的信息
	public void updateDbInfo(String neirong,TUser user,String dbid,String tjstate){
		TDaiBanShiXiang db = (TDaiBanShiXiang)super.findById(Long.parseLong(dbid),TDaiBanShiXiang.class.getName());
		if("1".equals(tjstate)){
	//		super.delete(dbid,TDaiBanShiXiang.class.getName());
			db.setTjstate(tjstate);
		}else{
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
		}
		super.update(db);
	}
	// 根据代码获取设备种类名称
	public String getNameByCode(String code) {
		String name = "";
		String hql = "from TDicData s where s.code = '" + code + "'";
		List<TDicData> list = super.findListByHql(hql);
		if(list.size()>0){
			name = list.get(0).getName();
		}
		return name;
	}
	
	// 根据代码获取设备种类名称
	public String getCodeByName(String name,String jigoudaima) {
		String code = "";
		String hql = "from TDicData s where s.name = '" + name + "'";
		if(!"".equals(jigoudaima)){
			hql += " and s.code like '"+jigoudaima+"%'";
			if(jigoudaima.length() == 4){
				hql += " and length(s.code) = 6";
			}
		}
		List<TDicData> list = super.findListByHql(hql);
		if(list.size()>0){
			code = list.get(0).getCode();
		}
		return code;
	}
	
	/**
	 * 许可证信息------导入Excel 如果Excel模板发生变动，例如列进行互换，需要在方法变量中修改 title 对应外网中文列名称
	 * 
	 * @return
	 */
	public String ReadExcelForXkz(Workbook wb, Object[] countObj,TUser user,File uploadify,String fileName,String sydwid) {
		List<HashMap<String, Object>> list = null;// 查询结果集用
		StringBuffer errorMsg = new StringBuffer();// 错误记录
		StringBuffer nemSb = new StringBuffer();// 重复记录
		StringBuffer nullSb = new StringBuffer();// 空值记录
		StringBuffer quhuaSb = new StringBuffer();// 区划记录
		StringBuffer shizhiSb = new StringBuffer();// 市值记录
		StringBuffer gzIds = new StringBuffer(); 
		String type = "";

		int rowNum = 1;// 当前行记录
		Cell[] thisRow = null;// 列

		Map<String, Object> map = null; // 转义

		//for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {// 开始循环
			Sheet sheet = wb.getSheet(0);// 取得sheet
			int rowCount = sheet.getRows();// 取得sheet的行数
			
				String title = // 定义列元素 方便直接取值修改
				"xingming#sex#shenfenzhenghao#shi#quxian#dianhua" 
						+"#xukezhengbianhao#fazhengjiguan#fazhengriqi#youxiaoqi"
						+"#zuoyezhonglei#zuoyexiangmu1#zuoyexiangmu2#zuoyexiangmu3#zuoyexiangmu4#zuoyexiangmu5";
				try {
					// 循环行
					for (int rowIndex = 2; rowIndex < rowCount; rowIndex++) {
						map = new HashMap<String, Object>();// 初始化
						rowNum = rowIndex;// 赋值
						thisRow = sheet.getRow(rowIndex);// 获取当前行的所有列数据
						if (thisRow == null || thisRow.length <= 0) {// 如果当前列对象为空
																		// 退出
							break;
						}
						// 第一列取得为空就退出返回
						if (thisRow[0] == null
								|| thisRow[0].getType() == CellType.EMPTY
								|| "".equals(String.valueOf(thisRow[0]))) {
							// errorMsg.append("导入失败，第一列不能为空！");
							break;
						}
						
						TZuoYeRenYuan xkz = new TZuoYeRenYuan();
						
						String[] titleRow = title.split("#");// 列拆分

						for (int j = 0; j < titleRow.length; j++) {// 对列进行循环
								if (thisRow[j] == null
										|| thisRow[j].getType() == CellType.EMPTY
										|| "".equals(String.valueOf(thisRow[j]))) {
									map.put(titleRow[j], "");
								} else {
									if("fazhengriqi".equals(titleRow[j]) || "youxiaoqi".equals(titleRow[j])){
										map.put(titleRow[j], ((DateCell)thisRow[j]).getDate());
									}else{
										map.put(titleRow[j], thisRow[j].getContents().trim());
									}
								}
						}
						xkz.setXingming(map.get("xingming").toString()); //姓名
						xkz.setSex(map.get("sex").toString()); //性别
						xkz.setShenfenzhenghao(map.get("shenfenzhenghao").toString()); //身份证号
						xkz.setShi(map.get("shi").toString()); //市
						xkz.setShidaima(getCodeByName(xkz.getShi(),"")); //市代码
						xkz.setQuxian(map.get("quxian").toString()); //区县
						xkz.setQuxiandaima(getCodeByName(xkz.getQuxian(),xkz.getShidaima())); //区县代码
						xkz.setLianxidianhua(map.get("dianhua").toString()); //电话
					//	xkz.setType("3"); // 1 、作业人员   2、检验人员   3、监察人员
						
						xkz.setZuoyezhonglei(map.get("zuoyezhonglei").toString()); //作业种类
						String xiangmu = ""; //作业项目
						for(int i=1;i<6;i++){
							if(map.get("zuoyexiangmu"+i).toString().length() > 0){
								xiangmu += map.get("zuoyexiangmu"+i).toString()+",";
							}
						}
						xiangmu = xiangmu.substring(0,xiangmu.length()-1);
						xkz.setZuoyexiangmu(xiangmu); //作业项目
						xkz.setFazhengjiguan(map.get("fazhengjiguan").toString()); //发证机关
						xkz.setZhengshubianhao(map.get("xukezhengbianhao").toString()); //证书编号
						String fazhengriqi = map.get("fazhengriqi").toString();
						String youxiaoqi = map.get("youxiaoqi").toString();
						if(!"".equals(fazhengriqi)){
							xkz.setFazhengriqi((Date)map.get("fazhengriqi"));//发证日期
						}
						if(!"".equals(youxiaoqi)){
							xkz.setZhengshuyouxiaoqi_end((Date)map.get("youxiaoqi"));//有效期
						}
						xkz.setSydw_id(Long.parseLong(sydwid));
						
						super.save(xkz);// 保存事务
					}
				} catch (ClassCastException e) {
					Cell[] titleRow = sheet.getRow(1);// 获取当前行的所有列数据
					errorMsg
							.append("格式转换异常：第（" + (rowNum + 1) + "）行第（"
									+ (map.size() + 1) + "）列("
									+ titleRow[map.size() - 1].getContents()
									+ ")非日期格式");
					e.printStackTrace();
				}catch (NullPointerException npe) {
					errorMsg.append("有未填写项！");
					npe.printStackTrace();
				}catch (Exception e) {
					// TODO: handle exception
					errorMsg.append("异常错误！请勿修改本模板！");
					e.printStackTrace();
				} finally {
					if(null != wb){
						wb.close();
					}
				}
//		}
		
		return errorMsg.toString();
	}
	public String getSydwName(String sydwid){
		String hql = "select dwmc from TSyUtils where id = '"+sydwid+"'";
		List list = super.findListByHql(hql);
		if(list.size()>0){
			return list.toString().replace("[","").replace("]","");
		}
		return "";
	}
}
