package com.stone.biz.jcsj.service;

/**
 * <pre>
 *  基础数据的Service
 * </pre>
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.LabelCell;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.VerticalAlignment;
import jxl.write.DateFormat;
import jxl.write.DateTime;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.lowagie.text.pdf.codec.Base64.InputStream;
import com.stone.biz.jcsj.pojo.TApprizes;
import com.stone.biz.jcsj.pojo.TBaseInfo;
import com.stone.biz.jcsj.pojo.TBaseInfoSearch;
import com.stone.biz.jcsj.pojo.TBoilerParam;
import com.stone.biz.jcsj.pojo.TCablewaysParam;
import com.stone.biz.jcsj.pojo.TCraneParam;
import com.stone.biz.jcsj.pojo.TElevatorParam;
import com.stone.biz.jcsj.pojo.TFssbBean;
import com.stone.biz.jcsj.pojo.TFujianfuji;
import com.stone.biz.jcsj.pojo.TGuandaoxiangmu;
import com.stone.biz.jcsj.pojo.TPressurePipingParam;
import com.stone.biz.jcsj.pojo.TPressureVesselsParam;
import com.stone.biz.jcsj.pojo.TQpzcdj;
import com.stone.biz.jcsj.pojo.TRecreationParam;
import com.stone.biz.jcsj.pojo.TRegister;
import com.stone.biz.jcsj.pojo.TRegisterFile;
import com.stone.biz.jcsj.pojo.TRegisterParam;
import com.stone.biz.jcsj.pojo.TRegister_CYQP_XINXI;
import com.stone.biz.jcsj.pojo.TRegister_GL_HZB;
import com.stone.biz.jcsj.pojo.TRegister_QP_HZB;
import com.stone.biz.jcsj.pojo.TRegister_YLGD_HZB;
import com.stone.biz.utils.pojo.TAzUtils;
import com.stone.biz.utils.pojo.TSyUtils;
import com.stone.para.IConstant;
import com.stone.support.SupportService;
import com.stone.support.utils.CopyUtils;
import com.stone.support.utils.DateFormatTool;
import com.stone.support.utils.FileUtils;
import com.stone.support.utils.Resources;
import com.stone.support.utils.StringUtils;
import com.stone.sys.pojo.TDicData;
import com.stone.sys.pojo.TDicType;
import com.stone.sys.pojo.TLog;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.pojo.TSeDirectory;
import com.stone.sys.pojo.TUser;

public class RegisterService extends SupportService {
	//保存
	public void saveReg(TRegisterParam reg,TUser user,List<TFujianfuji> fjfj_list){
		reg.setShebeileibie(getNameByCode(reg.getShebeileibiedaima()));
		reg.setShebeipinzhong(getNameByCode(reg.getShebeipinzhongdaima()));
		reg.setShiyongdanweidizhi_shi(getNameByCodeDic(reg.getShiyongdanweidizhi_shi_daima()));
		reg.setShiyongdanweidizhi_qu(getNameByCodeDic(reg.getShiyongdanweidizhi_qu_daima()));
		reg.setSuozaixiangzhen(getNameByCodeDic(reg.getSuozaixiangzhen_daima()));
		reg.setOrgan_code(reg.getShiyongdanweidizhi_qu_daima());
		reg.setCreat_user(user.getLoginId());
		super.save(reg);
		if(null != fjfj_list){
			for(TFujianfuji fjfj : fjfj_list){
				if(null != fjfj){
					fjfj.setDjbid(reg.getId().toString());
					super.save(fjfj);
				}
			}
		}
	}
	//保存锅炉
	public void saveGLOrYLRQ(TRegisterParam reg,TFssbBean fssb,TUser user){
		reg.setShebeileibie(getNameByCode(reg.getShebeileibiedaima()));
		reg.setShebeipinzhong(getNameByCode(reg.getShebeipinzhongdaima()));
		reg.setShiyongdanweidizhi_shi(this.getNameByCodeDic(reg.getShiyongdanweidizhi_shi_daima()));
		reg.setShiyongdanweidizhi_qu(this.getNameByCodeDic(reg.getShiyongdanweidizhi_qu_daima()));
		reg.setSuozaixiangzhen(this.getNameByCodeDic(reg.getSuozaixiangzhen_daima()));
		reg.setOrgan_code(reg.getShiyongdanweidizhi_qu_daima());
		reg.setCreat_user(user.getLoginId());
		super.save(reg);
		TFujianfuji jyxm = null;
		if(null != fssb){
			for(int i = 0 ; i < fssb.getMingcheng().length ; i++){
				jyxm = new TFujianfuji();
				jyxm.setMingcheng(fssb.getMingcheng()[i]);
				jyxm.setXinghao(fssb.getXinghao()[i]);
				jyxm.setGuige(fssb.getGuige()[i]);
				jyxm.setShuliang(fssb.getShuliang()[i]);
				jyxm.setZhizaochangjia(fssb.getZhizaochangjia()[i]);
				jyxm.setDjbid(reg.getId().toString());
				super.save(jyxm);
			}
		}
	}
	//保存客运索道、游乐设施
	public void saveKYSDOrYLSS(TRegisterParam reg,TFssbBean fssb,TUser user){
		reg.setShebeileibie(getNameByCode(reg.getShebeileibiedaima()));
		reg.setShebeipinzhong(getNameByCode(reg.getShebeipinzhongdaima()));
		reg.setChanquandanweidizhi_shi(getNameByCodeDic(reg.getChanquandanweidizhi_shi_daima()));
		reg.setChanquandanweidizhi_qu(getNameByCodeDic(reg.getChanquandanweidizhi_qu_daima()));
		reg.setShiyongdanweidizhi_shi(getNameByCodeDic(reg.getShiyongdanweidizhi_shi_daima()));
		reg.setShiyongdanweidizhi_qu(getNameByCodeDic(reg.getShiyongdanweidizhi_qu_daima()));
		reg.setShiyongdidian_shi(getNameByCodeDic(reg.getShiyongdidian_shi_daima()));
		reg.setShiyongdidian_qu(getNameByCodeDic(reg.getShiyongdidian_qu_daima()));
		reg.setOrgan_code(reg.getShiyongdanweidizhi_qu_daima());
		reg.setCreat_user(user.getLoginId());
		super.save(reg);
		TFujianfuji jyxm = null;
		if(null != fssb){
			for(int i = 0 ; i < fssb.getMingcheng().length ; i++){
				jyxm = new TFujianfuji();
				jyxm.setMingcheng(fssb.getMingcheng()[i]);
				jyxm.setXinghao(fssb.getXinghao()[i]);
				jyxm.setGuige(fssb.getGuige()[i]);
				jyxm.setShuliang(fssb.getShuliang()[i]);
				jyxm.setZhizaochangjia(fssb.getZhizaochangjia()[i]);
				jyxm.setDjbid(reg.getId().toString());
				super.save(jyxm);
			}
		}
	}
	//保存气瓶
	public void saveQP(TRegisterParam reg,TUser user,List<TRegister_QP_HZB> qp_hzb_list){
		reg.setOrgan_code(reg.getShiyongdanweidizhi_qu_daima());
		reg.setCreat_user(user.getLoginId());
		reg.setShebeipinzhong(getNameByCode(reg.getShebeipinzhongdaima()));
		reg.setShiyongdanweidizhi_shi(this.getNameByCodeDic(reg.getShiyongdanweidizhi_shi_daima()));
		reg.setShiyongdanweidizhi_qu(this.getNameByCodeDic(reg.getShiyongdanweidizhi_qu_daima()));
		reg.setSuozaixiangzhen(this.getNameByCodeDic(reg.getSuozaixiangzhen_daima()));
		super.save(reg);
		if(null != qp_hzb_list){
			for(TRegister_QP_HZB  qpxx : qp_hzb_list){
				if(null != qpxx){
					qpxx.setRegister_id(reg.getId());
					super.save(qpxx);
				}
			}
		}
	}
	//保存车用气瓶
	public void saveCYQP(TRegisterParam reg,TUser user,List<TRegister_CYQP_XINXI> cyqp_xx_list,List<TFujianfuji> fjfj_list){
		reg.setOrgan_code(reg.getShiyongdanweidizhi_qu_daima());
		reg.setCreat_user(user.getLoginId());
		reg.setShebeipinzhong(getNameByCode(reg.getShebeipinzhongdaima()));
		reg.setShiyongdanweidizhi_shi(this.getNameByCodeDic(reg.getShiyongdanweidizhi_shi_daima()));
		reg.setShiyongdanweidizhi_qu(this.getNameByCodeDic(reg.getShiyongdanweidizhi_qu_daima()));
		reg.setSuozaixiangzhen(this.getNameByCodeDic(reg.getSuozaixiangzhen_daima()));
		super.save(reg);
		if(null != cyqp_xx_list){
			for(TRegister_CYQP_XINXI  qpxx : cyqp_xx_list){
				if(null != qpxx){
					qpxx.setRegister_id(reg.getId());
					super.save(qpxx);
				}
			}
		}
		if(null != fjfj_list){
			for(TFujianfuji  fjfj : fjfj_list){
				if(null != fjfj){
					fjfj.setDjbid(reg.getId().toString());
					super.save(fjfj);
				}
			}
		}
	}
	//保存压力管道
	public void saveYlgd(TRegisterParam reg,TUser user,List<TRegister_YLGD_HZB> hzbList){
		reg.setShebeileibie(getNameByCode(reg.getShebeileibiedaima()));
		reg.setShebeipinzhong(getNameByCode(reg.getShebeipinzhongdaima()));
		reg.setShiyongdanweidizhi_shi(this.getNameByCodeDic(reg.getShiyongdanweidizhi_shi_daima()));
		reg.setShiyongdanweidizhi_qu(this.getNameByCodeDic(reg.getShiyongdanweidizhi_qu_daima()));
		reg.setSuozaixiangzhen(this.getNameByCodeDic(reg.getSuozaixiangzhen_daima()));
		reg.setOrgan_code(reg.getShiyongdanweidizhi_qu_daima());
		reg.setCreat_user(user.getLoginId());
		super.save(reg);
		if(null != hzbList){
			for(TRegister_YLGD_HZB  hzb : hzbList){
				if(null != hzb){
					hzb.setRegister_id(reg.getId());
					super.save(hzb);
				}
			}
		}
	}
	//更新
	public void updateReg(TRegisterParam reg,List<TFujianfuji> fjfj_list){
		reg.setShebeileibie(getNameByCode(reg.getShebeileibiedaima()));
		reg.setShebeipinzhong(getNameByCode(reg.getShebeipinzhongdaima()));
		reg.setShiyongdanweidizhi_shi(getNameByCodeDic(reg.getShiyongdanweidizhi_shi_daima()));
		reg.setShiyongdanweidizhi_qu(getNameByCodeDic(reg.getShiyongdanweidizhi_qu_daima()));
		reg.setSuozaixiangzhen(getNameByCodeDic(reg.getSuozaixiangzhen_daima()));
		reg.setOrgan_code(reg.getShiyongdanweidizhi_qu_daima());
		super.update(reg);
		List<TFujianfuji> oldFjfjList = super.findListByHql("from TFujianfuji where djbid = '"+reg.getId()+"' order by id ");
		if(null != fjfj_list){
			if("3000".equals(reg.getShebeizhongleidaima())){
				TFujianfuji fjfj = null;
				for(int i = 0;i<fjfj_list.size();i++){
					fjfj = oldFjfjList.get(i);
					fjfj.setXinghao(fjfj_list.get(i).getXinghao());
					fjfj.setChanpinbianhao(fjfj_list.get(i).getChanpinbianhao());
					fjfj.setZhizaochangjia(fjfj_list.get(i).getZhizaochangjia());
					super.update(fjfj);
				}
			}else{
				for(TFujianfuji fjfj : fjfj_list){
					if(null != fjfj){
						fjfj.setDjbid(reg.getId().toString());
						super.save(fjfj);
					}
				}
			}
		}
		if(!"3000".equals(reg.getShebeizhongleidaima())){
			for(TFujianfuji f : oldFjfjList){
				super.delete(f);
			}
		}
	}
	//更新锅炉
	public void updateGL(TRegisterParam reg,TFssbBean fssb){
		reg.setShebeileibie(getNameByCode(reg.getShebeileibiedaima()));
		reg.setShebeipinzhong(getNameByCode(reg.getShebeipinzhongdaima()));
		reg.setShiyongdanweidizhi_shi(this.getNameByCodeDic(reg.getShiyongdanweidizhi_shi_daima()));
		reg.setShiyongdanweidizhi_qu(this.getNameByCodeDic(reg.getShiyongdanweidizhi_qu_daima()));
		reg.setSuozaixiangzhen(this.getNameByCodeDic(reg.getSuozaixiangzhen_daima()));
		reg.setOrgan_code(reg.getShiyongdanweidizhi_qu_daima());
		super.update(reg);
		List<TFujianfuji> list = super.findListByHql("from TFujianfuji where djbid = '"+reg.getId()+"'");
		TFujianfuji jyxm = null;
		if(null != fssb){
			for(int i = 0 ; i < fssb.getMingcheng().length ; i++){
				jyxm = new TFujianfuji();
				jyxm.setMingcheng(fssb.getMingcheng()[i]);
				jyxm.setXinghao(fssb.getXinghao()[i]);
				jyxm.setGuige(fssb.getGuige()[i]);
				jyxm.setShuliang(fssb.getShuliang()[i]);
				jyxm.setZhizaochangjia(fssb.getZhizaochangjia()[i]);
				jyxm.setDjbid(reg.getId().toString());
				super.save(jyxm);
			}
		}
		
		for(TFujianfuji ff : list){
			super.delete(ff);
		}
	}
	//更新客运索道
	public void updateKYSDOrYLSS(TRegisterParam reg,TFssbBean fssb){
		reg.setShebeileibie(getNameByCode(reg.getShebeileibiedaima()));
		reg.setShebeipinzhong(getNameByCode(reg.getShebeipinzhongdaima()));
		reg.setChanquandanweidizhi_shi(getNameByCodeDic(reg.getChanquandanweidizhi_shi_daima()));
		reg.setChanquandanweidizhi_qu(getNameByCodeDic(reg.getChanquandanweidizhi_qu_daima()));
		reg.setShiyongdanweidizhi_shi(getNameByCodeDic(reg.getShiyongdanweidizhi_shi_daima()));
		reg.setShiyongdanweidizhi_qu(getNameByCodeDic(reg.getShiyongdanweidizhi_qu_daima()));
		reg.setShiyongdidian_shi(getNameByCodeDic(reg.getShiyongdidian_shi_daima()));
		reg.setShiyongdidian_qu(getNameByCodeDic(reg.getShiyongdidian_qu_daima()));
		reg.setOrgan_code(reg.getShiyongdanweidizhi_qu_daima());
		super.update(reg);
		List<TFujianfuji> list = super.findListByHql("from TFujianfuji where djbid = '"+reg.getId()+"'");
		TFujianfuji jyxm = null;
		if(null != fssb){
			for(int i = 0 ; i < fssb.getMingcheng().length ; i++){
				jyxm = new TFujianfuji();
				jyxm.setMingcheng(fssb.getMingcheng()[i]);
				jyxm.setXinghao(fssb.getXinghao()[i]);
				jyxm.setGuige(fssb.getGuige()[i]);
				jyxm.setShuliang(fssb.getShuliang()[i]);
				jyxm.setZhizaochangjia(fssb.getZhizaochangjia()[i]);
				jyxm.setDjbid(reg.getId().toString());
				super.save(jyxm);
			}
		}
		
		for(TFujianfuji ff : list){
			super.delete(ff);
		}
	}
	//更新气瓶
	public void updateQP(TRegisterParam reg,List<TRegister_QP_HZB> qp_hzb_list){
		List<TRegister_QP_HZB> oldQPxxList = super.findListByHql("from TRegister_QP_HZB where register_id = '"+reg.getId()+"'");
		if(null != qp_hzb_list){
			for(TRegister_QP_HZB qpxx : qp_hzb_list){
				if(null != qpxx){
					qpxx.setRegister_id(reg.getId());
					super.save(qpxx);
				}
			}
		}
		for(TRegister_QP_HZB qpxx : oldQPxxList){
			super.delete(qpxx);
		}
	}
	//更新车用气瓶
	public void updateCYQP(TRegisterParam reg,List<TRegister_CYQP_XINXI> cyqp_xx_list){
		List<TRegister_CYQP_XINXI> oldQPxxList = super.findListByHql("from TRegister_CYQP_XINXI where register_id = '"+reg.getId()+"'");
		if(null != cyqp_xx_list){
			for(TRegister_CYQP_XINXI qpxx : cyqp_xx_list){
				if(null != qpxx){
					qpxx.setRegister_id(reg.getId());
					super.save(qpxx);
				}
			}
		}
		for(TRegister_CYQP_XINXI qpxx : oldQPxxList){
			super.delete(qpxx);
		}
	}
	//更新管道
	public void updateGD(TRegisterParam reg,List<TRegister_YLGD_HZB> hzbList){
		List<TRegister_YLGD_HZB> oldHzbList = super.findListByHql("from TRegister_YLGD_HZB where register_id = '"+reg.getId()+"'");
		if(null != hzbList){
			for(TRegister_YLGD_HZB hzb : hzbList){
				if(null != hzb){
					hzb.setRegister_id(reg.getId());
					super.save(hzb);
				}
			}
		}
		for(TRegister_YLGD_HZB hzb : oldHzbList){
			super.delete(hzb);
		}
	}
	//删除
	public void delByIds(String ids){
		String hql = "from TRegister where id in ("+ids+")";
		List<TRegister> list = super.findListByHql(hql);
		for(TRegister r : list){
			if(null != r.getFilepath() && !"".equals(r.getFilepath())){
				//删除注册登记表源文件
				delFileByPath(r.getFilepath());
		        //删除原来的附件
		        delFileByPath(r.getFj_filepath());
			}
			super.delete(r);
		}
		super.deleteByDHql("djbid in ("+ids+")", null,TFujianfuji.class.getName());
		super.deleteByDHql("djbid in ("+ids+")", null,TQpzcdj.class.getName());
		super.deleteByDHql("djbid in ("+ids+")", null,TGuandaoxiangmu.class.getName());
	}
	//删除文件
	public void delFileByPath(String path){
		if(null != path && !"".equals(path) && !"null".equals(path)){
			File file = new File(path);
			if(file.exists()){
				file.delete();
			}
		}
	}

	/**
	 * 注册登记表------
	 * 
	 * @return
	 */
	public String ReadExcelForDjb(Workbook wb, Object[] countObj,TUser user,File uploadify,String fileName,String gzid,TOrgan organ) {
		List<HashMap<String, Object>> list = null;// 查询结果集用
		StringBuffer errorMsg = new StringBuffer();// 错误记录
		StringBuffer nemSb = new StringBuffer();// 重复记录
		StringBuffer nullSb = new StringBuffer();// 空值记录
		StringBuffer quhuaSb = new StringBuffer();// 区划记录
		String id = "";
		String type = "";

		int rowNum = 2;// 当前行记录
		Cell[] thisRow = null;// 列
		Cell[] oneRow = null;// 列
		String title = "";

		Map<String, Object> map = null; // 转义
		// 非Hibernate事物控制
		Session session = super.getBaseDAO().getHibernateTemplate()
				.getSessionFactory().openSession();
		session.beginTransaction();
		Sheet sheet = null;
		TRegisterParam reg = null;

			try {
				sheet = wb.getSheet(0);// 取得sheet
				if("电梯".equals(sheet.getName())){
					oneRow = sheet.getRow(0);
					title = oneRow[1].getContents();
					if(!"特种设备使用登记表20161120".equals(title)){
						errorMsg.append("请使用最新导入模板！");
						return errorMsg.toString();
					}
					reg = new TRegisterParam();
					reg.setShebeizhonglei("电梯");
					reg.setShebeizhongleidaima("3000");
					reg.setOrgan_code(organ.getCode());
					//注册登记表信息
					setZcdjbForDT(reg,thisRow,sheet,rowNum);
					//登记卡基本信息
					setDjkForDT(reg,thisRow,sheet,rowNum);
					//技术参数
					setJscsForDT(reg,thisRow,sheet,rowNum);
					
					//校验注册代码和单位
					errorMsg = checkZcdmOrSydw(reg);
					if ("".equals(errorMsg.toString())) {
						session.save(reg);
						//附件及辅机
						sheet = wb.getSheet(1);
						setFujianfuji(sheet,reg.getId(),errorMsg,session);
						id = reg.getId().toString();
						type = "电梯";
					}
					
				}else if("起重机".equals(sheet.getName())){
					oneRow = sheet.getRow(0);
					title = oneRow[0].getContents();
					if(!"特种设备使用登记表20161120".equals(title)){
						errorMsg.append("请使用最新导入模板！");
						return errorMsg.toString();
					}
					reg = new TRegisterParam();
					reg.setShebeizhonglei("起重机械");
					reg.setShebeizhongleidaima("4000");
					reg.setOrgan_code(organ.getCode());
					//注册登记表信息
					setZcdjbForQZJX(reg,thisRow,sheet,rowNum);
					//登记卡基本信息
				//	setDjkForDT(reg,thisRow,sheet,rowNum);
					//技术参数
				//	setJscsForQZJX(reg,thisRow,sheet,rowNum);
					//校验注册代码和单位
					errorMsg = checkZcdmOrSydw(reg);
					if("".equals(errorMsg.toString())){
						session.save(reg);
						//附件及辅机
						sheet = wb.getSheet(1);
						setFujianfuji(sheet,reg.getId(),errorMsg,session);
						id = reg.getId().toString();
						type = "起重机械";
					}
				}else if("厂内机动车辆".equals(sheet.getName())){
					oneRow = sheet.getRow(0);
					title = oneRow[1].getContents();
					if(!"特种设备使用登记表20161120".equals(title)){
						errorMsg.append("请使用最新导入模板！");
						return errorMsg.toString();
					}
					reg = new TRegisterParam();
					reg.setShebeizhonglei("场（厂）内专用机动车辆");
					reg.setShebeizhongleidaima("5000");
					reg.setOrgan_code(organ.getCode());
					//注册登记表信息
					setZcdjbForDT(reg,thisRow,sheet,rowNum);
					//登记卡基本信息
					setDjkForDT(reg,thisRow,sheet,rowNum);
					//技术参数
					setJscsForCNC(reg,thisRow,sheet,rowNum);
					//校验注册代码和单位
					errorMsg = checkZcdmOrSydw(reg);
					if("".equals(errorMsg.toString())){
						session.save(reg);
						//附件及辅机
						sheet = wb.getSheet(1);
						setFujianfuji(sheet,reg.getId(),errorMsg,session);
						id = reg.getId().toString();
						type = "厂内车";
					}
					
					
				}else if("锅炉".equals(sheet.getName())){
					oneRow = sheet.getRow(0);
					title = oneRow[0].getContents();
					if(!"特种设备使用登记表20161120".equals(title)){
						errorMsg.append("请使用最新导入模板！");
						return errorMsg.toString();
					}
					reg = new TRegisterParam();
					reg.setShebeizhonglei("锅炉");
					reg.setShebeizhongleidaima("1000");
					reg.setOrgan_code(organ.getCode());
					//注册登记表信息
					setZcdjbForGL(reg,thisRow,sheet,rowNum);
					//锅炉登记卡（电站锅炉副页）
				//	setZcdjbForDZGLFY(reg,thisRow,sheet,rowNum);
					//登记卡基本信息
				//	setDjkForGL(reg,thisRow,sheet,rowNum);
					//技术参数
				//	setJscsForCNC(reg,thisRow,sheet,rowNum);
					//校验注册代码和单位
					errorMsg = checkZcdmOrSydw(reg);
					if("".equals(errorMsg.toString())){
						session.save(reg);
						//附件及辅机
						sheet = wb.getSheet(1);
						setFujianfuji(sheet,reg.getId(),errorMsg,session);
						id = reg.getId().toString();
						type = "锅炉";
					}
				}else if("游乐设施".equals(sheet.getName())){
					oneRow = sheet.getRow(0);
					title = oneRow[1].getContents();
					if(!"特种设备使用登记表20161120".equals(title)){
						errorMsg.append("请使用最新导入模板！");
						return errorMsg.toString();
					}
					reg = new TRegisterParam();
					reg.setShebeizhonglei("大型游乐设施");
					reg.setShebeizhongleidaima("6000");
					reg.setOrgan_code(organ.getCode());
					//注册登记表信息
					setZcdjbForYlss(reg,thisRow,sheet,rowNum);
					//登记卡基本信息
					setDjkForYlss(reg,thisRow,sheet,rowNum);
					//技术参数
					setJscsForYlss(reg,thisRow,sheet,rowNum);
					//校验注册代码和单位
					errorMsg = checkZcdmOrSydw(reg);
					if("".equals(errorMsg.toString())){
						session.save(reg);
						//附件及辅机
						sheet = wb.getSheet(1);
						setFujianfuji(sheet,reg.getId(),errorMsg,session);
						id = reg.getId().toString();
						type = "游乐设施";
					}
				}else if("压力容器".equals(sheet.getName())){
					oneRow = sheet.getRow(0);
					title = oneRow[0].getContents();
					if(!"特种设备使用登记表20161120".equals(title)){
						errorMsg.append("请使用最新导入模板！");
						return errorMsg.toString();
					}
					reg = new TRegisterParam();
					reg.setShebeizhonglei("压力容器");
					reg.setShebeizhongleidaima("2000");
					reg.setOrgan_code(organ.getCode());
					//注册登记表信息
					setZcdjbForYlrq(reg,thisRow,sheet,rowNum);
					//登记卡基本信息
				//	setDjkForYlrq(reg,thisRow,sheet,rowNum);
					//校验注册代码和单位
					errorMsg = checkZcdmOrSydw(reg);
					if("".equals(errorMsg.toString())){
						session.save(reg);
						//附件及辅机
						sheet = wb.getSheet(1);
						setFujianfuji(sheet,reg.getId(),errorMsg,session);
						id = reg.getId().toString();
						type = "压力容器";
					}
				}else if("压力管道".equals(sheet.getName())){
					oneRow = sheet.getRow(0);
					title = oneRow[0].getContents();
					if(!"压力管道注册登记表20161120".equals(title)){
						errorMsg.append("请使用最新导入模板！");
						return errorMsg.toString();
					}
					oneRow = sheet.getRow(0);
					reg = new TRegisterParam();
					reg.setShebeizhonglei("压力管道");
					reg.setShebeizhongleidaima("8000");
					reg.setOrgan_code(organ.getCode());
					//注册登记表信息
					//setZcdjbForYlgd(reg,thisRow,sheet,rowNum);
					
					//注册登记表信息
					setZcdjbForYlgd(reg,thisRow,sheet,rowNum);
					try {
						id = setGDXiangmu(sheet,reg,errorMsg,null,id);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					//校验注册代码和单位
					errorMsg = checkZcdmOrSydw(reg);
					if("".equals(errorMsg.toString())){
						//session.save(reg);
						//项目
						//setGDXiangmu(sheet,reg.getId(),errorMsg,session);
						//id = reg.getId().toString();
						id = id.substring(0,id.length()-1);
						type = "压力管道";
					}
				}else if("客运索道".equals(sheet.getName())){
					reg = new TRegisterParam();
					reg.setShebeizhonglei("客运索道");
					reg.setShebeizhongleidaima("9000");
					reg.setOrgan_code(organ.getCode());
					reg.setTjstate("0");
					//注册登记表信息
					setZcdjbForDT(reg,thisRow,sheet,rowNum);
					//登记卡基本信息
					setDjkForDT(reg,thisRow,sheet,rowNum);
					//技术参数
					setJscsForSD(reg,thisRow,sheet,rowNum);
					
					//校验注册代码和单位
					errorMsg = checkZcdmOrSydw(reg);
					if("".equals(errorMsg.toString())){
						session.save(reg);
						//项目
						//setGDXiangmu(sheet,reg.getId(),errorMsg,session);
						id = reg.getId().toString();
						type = "客运索道";
					}
				}
					if (!"".equals(nemSb.toString())) {
						errorMsg.append("如下行数据已经存在，无法重复导入（" + nemSb + "）");
					}
					if (!"".equals(nullSb.toString())) {
						errorMsg.append("出厂编号或制造单位存在空值（" + nullSb + "）");
					}
					if (!"".equals(quhuaSb.toString())) {
						errorMsg.append("区划存在空值，无法导入（" + quhuaSb + "）");
					}
					session.getTransaction().commit();// 提交事务
				} catch (ClassCastException e) {
				//	Cell[] titleRow = sheet.getRow(1);// 获取当前行的所有列数据
					errorMsg.append("格式转换异常：请仔细核对修改过的单元格格式（重点检查日期类型单元格）");
					session.getTransaction().rollback();
					e.printStackTrace();
				}catch (NullPointerException npe) {
					errorMsg.append("有未填写项！");
					session.getTransaction().rollback();
					npe.printStackTrace();
				}catch (Exception e) {
					errorMsg.append("修改过单元格格式无法导入，请仔细核对修改过的单元格格式（重点检查日期类型单元格）");
					session.getTransaction().rollback();
					e.printStackTrace();
				} finally {
					if (null != session) {
						session.close();
					}
					if(null != wb){
						wb.close();
					}
				}
		if ("".equals(errorMsg.toString())) {
			//上传该Excel
			try {
				if("压力管道".equals(type)){
					List<TRegisterParam> rp = super.findListByIds(id, TRegisterParam.class);
					for(TRegisterParam t : rp){
						uploadExcelByDjb(t,type,uploadify,fileName);
					}
				}else{
					uploadExcelByDjb(reg,type,uploadify,fileName);
				}
				//uploadExcelByDjb(reg,type,uploadify,fileName);
		//		updSeInfo(gzid,reg);
			} catch (IOException e) {
				errorMsg.append("文件上传时发生错误!");
				//删除文件及数据
				delDate(id);
				e.printStackTrace();
			}
		//	return "导入成功！";
		}
		return errorMsg.toString();
	}
	//上传Excel
	public void uploadExcelByDjb(TRegisterParam reg,String type,File uploadify,String fileFileName) throws IOException{
		String foledName = "/upload_file/zhucedengjibiao/"+StringUtils.getPinYinHeadChar(type);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Random rd = new Random();
		String fileType = fileFileName.substring(fileFileName.indexOf("."));
		if(FileUtils.fileType(fileType)){
			
		}else{
			String fileName = fileFileName.substring(0,fileFileName.indexOf("."));
			String newfileName = fileName+"_"+sdf.format(new Date())+(rd.nextInt(90000)+10000)+fileType;
		    //得到工程保存文件的路径
	        String savePath = ServletActionContext.getRequest().getRealPath(foledName);
	        File uploadFolder = new File(savePath);
	        if(!uploadFolder.exists()){
	        	uploadFolder.mkdirs();
	        }
	        FileInputStream is = new FileInputStream(uploadify);
	        File file = new File(savePath,newfileName);
	        OutputStream os = new FileOutputStream(file);
	        byte[] b = new byte[1024];
	        int length = 0;
	        while((length = is.read(b))>0){
	        	os.write(b, 0, length);
	        }
	        is.close();
	        os.close();
	        
	        reg.setFilepath(foledName+"/"+newfileName);
	        super.update(reg);
		}
		
	}
	//删除数据
	public void delDate(String ids){
        ids = StringUtils.trimEndTomma(ids);
		super.deleteAll(ids, TRegisterParam.class.getName());
	}

	// 根据名称获取设备种类代码
	public String getCodeByName(String name) {
		String hql = "from TSeDirectory s where s.mingcheng = '" + name + "'";
		TSeDirectory dire = (TSeDirectory) super.findListByHql(hql).get(0);
		return dire.getDaima();
	}
	// 根据代码获取名称
	public String getNameByCode(String code) {
		String hql = "from TSeDirectory s where s.daima = '" + code + "'";
		List list = super.findListByHql(hql);
		if(list.size()>0){
			TSeDirectory dire = (TSeDirectory) super.findListByHql(hql).get(0);
			return dire.getMingcheng();
		}
		return "";
	}
	// 根据代码获取dic名称
	public String getNameByCodeDic(String code) {
		String name = "";
		String hql = "from TDicData s where s.code = '" + code + "'";
		List list = super.findListByHql(hql);
		if(list.size()>0){
			TDicData dire = (TDicData) super.findListByHql(hql).get(0);
			name = dire.getName();
		}
		return name;
	}
	// 根据名称获取dic代码
	public String getCodeByNameDic(String name,String jigoudaima) {
		String code = "";
		String hql = "from TDicData s where s.name = '" + name + "'";
		if(!"".equals(jigoudaima)){
			hql += " and s.code like '"+jigoudaima+"%'";
			if(jigoudaima.length() == 4){//查询区县代码时  要限制长度
				hql += " and length(s.code) = 6";
			}
		}
		List list = super.findListByHql(hql);
		if(list.size()>0){
			TDicData dire = (TDicData)list.get(0);
			code = dire.getCode();
		}
		return code;
	}
	
	//注册登记表信息
	public void setZcdjbForDT(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(2);
		rowNum = 2;
		//注册登记机构
		reg.setZhucedengjijigou(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//注册登记日期
		reg.setZhucedengjiriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[7]).getDate());

		thisRow = sheet.getRow(3);
		rowNum = 3;
		//设备注册代码
		reg.setZhucedaima(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//更新日期
		reg.setGengxinriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[7]).getDate());
		thisRow = sheet.getRow(4);
		//单位内部编号
		reg.setNeibubianhao(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//牌号编号
		reg.setPaizhaobianhao(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//注册登记人员
		reg.setZhucedengjirenyuan(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(5);
		//产权单位
		reg.setChanquandanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//产权单位代码
		reg.setChanquandanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(6);
		//产权单位地址
		reg.setChanquandanweidizhi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//产权单位邮政编码
		reg.setCqdw_youzhengbianma(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(7);
		//产权单位法人代表
		reg.setDanweifarendaibiao(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//产权单位联系电话
		reg.setFarenlianxidianhua(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(8);
		//使用单位
		reg.setShiyongdanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//使用单位代码
		reg.setShiyongdanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(9);
		//使用单位地址
		reg.setShiyongdanweidizhi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//使用单位邮政编码
		reg.setSydw_youzhengbianma(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(10);
		//安全管理部门
		reg.setAnquanguanlibumen(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//安全管理人员
		reg.setAnquanguanlirenyuan(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//安全管理人员联系电话
		reg.setAqglry_lianxidianhua(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(11);
		//使用地点
		reg.setShiyongdidian(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//操作人员
		reg.setCaozuorenyuan(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(12);
		//设备类别
		reg.setShebeileibie(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		// 设备类别代码
		if (!"".equals(reg.getShebeileibie())) {
			List<HashMap<String,Object>> l = super.findListBySql("select daima from sys_sedirectory where mingcheng = '" + reg.getShebeileibie() + "'");
			if (l.size() > 0) {
				reg.setShebeileibiedaima(l.get(0).get("daima").toString());
			}
		}
		//设备名称
		reg.setShebeimingcheng(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//设备型号
		reg.setShebeixinghao(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(13);
		//设计单位
		reg.setShejidanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//设计单位代码
		reg.setShejidanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(14);
		//制造单位
		reg.setZhizaodanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//制造单位代码
		reg.setZhizaodanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(15);
		//资格证书名称
		reg.setZzdw_zigezhengshumingcheng(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//资格证书号
		reg.setZzdw_zigezhengshuhao(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//联系电话
		reg.setZzdw_lianxidianhua(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(16);
		//制造年月
		reg.setZhizaoriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[2]).getDate());
		//出厂编号
		reg.setChuchangbianhao(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//适用场合
		reg.setShiyongchanghe(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(17);
		//安装单位
		reg.setAnzhuangdanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//安装单位代码
		reg.setAnzhuangdanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(18);
		//资格证书编号
		reg.setAzdw_zigezhengshubianhao(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//项目负责人
		reg.setXiangmufuzeren(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//联系电话
		reg.setXmfzr_lianxidianhua(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(19);
		//土建施工单位
		reg.setShigongdanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//开始施工日期
		reg.setShigongriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[7]).getDate());
		thisRow = sheet.getRow(20);
		//土建验收单位
		reg.setYanshoudanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//竣工验收日期
		reg.setJungongriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[7]).getDate());
		thisRow = sheet.getRow(21);
		//验收检验机构
		reg.setYanshoujianyanjigou(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//验收报告编号
		reg.setYanshoubaogaobianhao(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(22);
		//投用日期
		reg.setTouyongriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[2]).getDate());
		//维保周期
		reg.setWeibaozhouqi(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//大修周期
		reg.setDaxiuzhouqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(23);
		//维修保养单位
		reg.setWeibaodanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//维保单位代码
		reg.setWeibaodanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(24);
		//资格证书号
		reg.setWbdw_zigezhengshuhao(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//维保负责人
		reg.setWeibaofuzeren(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//电话
		reg.setWeibaofuzerendianhua(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(25);
		//所在车间分厂
		reg.setChejianfenchang(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		thisRow = sheet.getRow(26);
		//检验单位
		reg.setJianyandanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//检验单位代码
		reg.setJianyandanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(27);
		//检验日期
		reg.setJianyanriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[2]).getDate());
		//检验类别
		reg.setJianyanleibie(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//主要问题
		reg.setZhuyaowenti(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(28);
		//检验结论
		reg.setJianyanjielun(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//报告书编号
		reg.setBaogaoshubianhao(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//下次检验日期
		reg.setXiacijianyanriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[7]).getDate());
		thisRow = sheet.getRow(29);
		//事故类别
		reg.setShiguleibie(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//事故发生日期
		reg.setShigufashengriqi(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[5]).getDate());
		//事故处理结果
		reg.setShiguchulijieguo(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(30);
		//设备变动方式
		reg.setBiandongfangshi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//设备变动项目
		reg.setBiandongxiangmu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//设备变动日期
		reg.setBiandongriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[7]).getDate());
		thisRow = sheet.getRow(31);
		//设备承担单位
		reg.setChengdandanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//承担单位代码
		reg.setChengdandanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
	}
	//注册登记表信息   压力管道    更改前使用的
	public void setZcdjbForYlgd2(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(1);
		//使用单位
		reg.setShiyongdanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//使用单位地址
		reg.setShiyongdanweidizhi(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents().trim());
		thisRow = sheet.getRow(2);
		rowNum = 2;
		//主管部门
		reg.setZhuguanbumen(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//行业
		reg.setSuoshuhangye(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents().trim());
		thisRow = sheet.getRow(3);
		rowNum = 3;
		//联系电话
		reg.setZhuguanfuzerendianhua(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//安全管理部门
		reg.setAnquanguanlibumen(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents().trim());
		
		thisRow = sheet.getRow(4);
		rowNum = 4;
		//安全管理人员
		reg.setAnquanguanlirenyuan(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//经办人
		reg.setJingbanren(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents().trim());
		
		thisRow = sheet.getRow(5);
		rowNum = 5;
		//管道类别  
		reg.setShebeileibie(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//工程(装置)名称
		reg.setGongchengmingcheng(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		
		thisRow = sheet.getRow(6);
		rowNum = 6;
		//设计单位
		reg.setShejidanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//设计单位代码
		reg.setShejidanweidaima(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		
		thisRow = sheet.getRow(7);
		rowNum = 7;
		//安装单位
		reg.setAnzhuangdanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//安装单位代码
		reg.setAnzhuangdanweidaima(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		thisRow = sheet.getRow(8);
		rowNum = 8;
		//竣工验收日期
		reg.setJungongriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[2]).getDate());
		//投用日期
		reg.setTouyongriqi(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[5]).getDate());
		//管道规格
		reg.setGuandaoguige(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		
		thisRow = sheet.getRow(9);
		rowNum = 9;
		//管道名称
		reg.setShebeimingcheng(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//管道编号
		reg.setGuandaobianhao(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents());
		//管道级别
		reg.setGuandaojibie(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		
		thisRow = sheet.getRow(10);
		rowNum = 10;
		//公称直径(mm)
		reg.setGongchengzhijing(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//公称壁厚(mm)
		reg.setGongchengbihou(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents());
		//管道长度
		reg.setGuandaochangdu(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		
		thisRow = sheet.getRow(11);
		rowNum = 11;
		//设计压力
		reg.setShejiyali(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//设计温度
		reg.setShejiwendu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents());
		//输送介质
		reg.setShusongjiezhi(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		
		thisRow = sheet.getRow(12);
		rowNum = 12;
		//最高工作压力
		reg.setGongzuoyali(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//最高工作温度
		reg.setGongzuowendu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents());
		//是否重要管道
		reg.setShifouzhongyaoguandao(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		
		thisRow = sheet.getRow(13);
		rowNum = 13;
		//所属车间
		reg.setChejianfenchang(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//检验结论
		reg.setJianyanjielun(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		
		thisRow = sheet.getRow(14);
		rowNum = 14;
		//压力管道代码
		reg.setZhucedaima(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//检验日期
		reg.setJianyanriqi(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[8]).getDate());
		
		thisRow = sheet.getRow(15);
		rowNum = 15;
		//下次检验日期
		reg.setXiacijianyanriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[2]).getDate());
		//固定资产值
		reg.setGudingzichan(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		
		thisRow = sheet.getRow(16);
		rowNum = 16;
		//备注
		reg.setBeizhu(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		
		thisRow = sheet.getRow(17);
		rowNum = 17;
		//审核日期
		reg.setShenheriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[2]).getDate());
		//登记意见
		reg.setShenheyijian(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		
		thisRow = sheet.getRow(18);
		rowNum = 18;
		//注册登记日期
		reg.setZhucedengjiriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[2]).getDate());
		//注册登记人员
		reg.setZhucedengjirenyuan(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		
		thisRow = sheet.getRow(19);
		rowNum = 19;
		//注册登记机构
		reg.setZhucedengjijigou(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		
		thisRow = sheet.getRow(20);
		rowNum = 20;
		//市
		reg.setShiyongdanweidizhi_shi(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents().trim());
		
		reg.setShiyongdanweidizhi_shi_daima(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[1].getContents().trim(),""));
		//区县
		reg.setShiyongdanweidizhi_qu(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		
		reg.setShiyongdanweidizhi_qu_daima(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[4].getContents().trim(),reg.getShiyongdanweidizhi_shi_daima()));
		//乡镇
		reg.setSuozaixiangzhen(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents().trim());
		
		reg.setSuozaixiangzhen_daima(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[8].getContents().trim(),reg.getShiyongdanweidizhi_qu_daima()));
		
	}
	//注册登记表信息   游乐设施
	public void setZcdjbForYlss(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(2);
		rowNum = 2;
		//注册登记机构
		reg.setZhucedengjijigou(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//注册登记日期
		reg.setZhucedengjiriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[7]).getDate());

		thisRow = sheet.getRow(3);
		rowNum = 3;
		//设备注册代码
		reg.setZhucedaima(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//更新日期
		reg.setGengxinriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[7]).getDate());
		thisRow = sheet.getRow(4);
		//单位内部编号
		reg.setNeibubianhao(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//牌号编号
		reg.setPaizhaobianhao(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//注册登记人员
		reg.setZhucedengjirenyuan(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(5);
		//产权单位
		reg.setChanquandanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//产权单位代码
		reg.setChanquandanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(6);
		//产权单位地址
		reg.setChanquandanweidizhi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//产权单位邮政编码
		reg.setCqdw_youzhengbianma(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(7);
		//产权单位法人代表
		reg.setDanweifarendaibiao(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//产权单位联系电话
		reg.setFarenlianxidianhua(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(8);
		//使用单位
		reg.setShiyongdanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//使用单位代码
		reg.setShiyongdanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(9);
		//使用单位地址
		reg.setShiyongdanweidizhi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//使用单位邮政编码
		reg.setSydw_youzhengbianma(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(10);
		//安全管理部门
		reg.setAnquanguanlibumen(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//安全管理人员
		reg.setAnquanguanlirenyuan(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//安全管理人员联系电话
		reg.setAqglry_lianxidianhua(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(11);
		//使用地点
		reg.setShiyongdidian(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//操作人员
		reg.setCaozuorenyuan(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(12);
		//设备类别
		reg.setShebeileibie(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		// 设备类别代码
		if (!"".equals(reg.getShebeileibie())) {
			List<HashMap<String,Object>> l = super.findListBySql("select daima from sys_sedirectory where mingcheng = '" + reg.getShebeileibie() + "'");
			if (l.size() > 0) {
				reg.setShebeileibiedaima(l.get(0).get("daima").toString());
			}
		}
		//设备名称
		reg.setShebeimingcheng(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//设备型号
		reg.setShebeixinghao(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(13);
		//设计单位
		reg.setShejidanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//设计单位代码
		reg.setShejidanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(14);
		//制造单位
		reg.setZhizaodanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//制造单位代码
		reg.setZhizaodanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(15);
		//资格证书名称
		reg.setZzdw_zigezhengshumingcheng(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//资格证书号
		reg.setZzdw_zigezhengshuhao(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//联系电话
		reg.setZzdw_lianxidianhua(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(16);
		//制造年月
		reg.setZhizaoriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[2]).getDate());
		//出厂编号
		reg.setChuchangbianhao(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//适用场合
		reg.setShiyongchanghe(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(17);
		//安装单位
		reg.setAnzhuangdanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//安装单位代码
		reg.setAnzhuangdanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(18);
		//资格证书编号
		reg.setAzdw_zigezhengshubianhao(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//项目负责人
		reg.setXiangmufuzeren(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//联系电话
		reg.setXmfzr_lianxidianhua(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(19);
		//土建施工单位
		reg.setShigongdanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//开始施工日期
		reg.setShigongriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[7]).getDate());
		thisRow = sheet.getRow(20);
		//土建验收单位
		reg.setYanshoudanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//竣工验收日期
		reg.setJungongriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[7]).getDate());
		thisRow = sheet.getRow(21);
		//验收检验机构
		reg.setYanshoujianyanjigou(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//验收报告编号
		reg.setYanshoubaogaobianhao(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(22);
		//投用日期
		reg.setTouyongriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[2]).getDate());
		//维保周期
		reg.setWeibaozhouqi(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//大修周期
		reg.setDaxiuzhouqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(23);
		//维修保养单位
		reg.setWeibaodanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//维保单位代码
		reg.setWeibaodanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(24);
		//资格证书号
		reg.setWbdw_zigezhengshuhao(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//维保负责人
		reg.setWeibaofuzeren(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//电话
		reg.setWeibaofuzerendianhua(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(26);
		//检验单位
		reg.setJianyandanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//检验单位代码
		reg.setJianyandanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(27);
		//检验日期
		reg.setJianyanriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[2]).getDate());
		//检验类别
		reg.setJianyanleibie(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//主要问题
		reg.setZhuyaowenti(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(28);
		//检验结论
		reg.setJianyanjielun(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//报告书编号
		reg.setBaogaoshubianhao(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//下次检验日期
		reg.setXiacijianyanriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[7]).getDate());
		thisRow = sheet.getRow(29);
		//事故类别
		reg.setShiguleibie(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//事故发生日期
		reg.setShigufashengriqi(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[5]).getDate());
		//事故处理结果
		reg.setShiguchulijieguo(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(30);
		//设备变动方式
		reg.setBiandongfangshi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//设备变动项目
		reg.setBiandongxiangmu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//设备变动日期
		reg.setBiandongriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[7]).getDate());
		thisRow = sheet.getRow(31);
		//设备承担单位
		reg.setChengdandanwei(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//承担单位代码
		reg.setChengdandanweidaima(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
	}
	//注册登记表信息    压力容器
	public void setZcdjbForYlrq(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(1);
		rowNum = 1;
		//登记类别
		reg.setDengjileibie(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//注册代码
		reg.setZhucedaima(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents());
		thisRow = sheet.getRow(2);
		rowNum = 2;
		//设备类别
		reg.setShebeileibie(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		// 设备类别代码
		if (!"".equals(reg.getShebeileibie())) {
			List<HashMap<String,Object>> l = super.findListBySql("select daima from sys_sedirectory where mingcheng = '" + reg.getShebeileibie() + "'");
			if (l.size() > 0) {
				reg.setShebeileibiedaima(l.get(0).get("daima").toString());
			}
		}
		thisRow = sheet.getRow(3);
		rowNum = 3;
		//设备品种
		reg.setShebeipinzhong(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		// 设备品种代码
		if (!"".equals(reg.getShebeipinzhong())) {
			List<HashMap<String,Object>> l = super.findListBySql("select daima from sys_sedirectory where mingcheng = '" + reg.getShebeipinzhong() + "'");
			if (l.size() > 0) {
				reg.setShebeipinzhongdaima(l.get(0).get("daima").toString());
			}
		}
		//产品名称
		reg.setShebeimingcheng(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(4);
		//设备代码
		reg.setShebeidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//设备型号
		reg.setShebeixinghao(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(5);
		//设计使用年限
		reg.setYlrq_pinzhong(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//设备型号
		reg.setJiegouxingshi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(6);
		//设计使用年限
		reg.setShejishiyongnianxian(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//设备型号
		reg.setGudingzichan(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(7);
		//使用单位
		reg.setShiyongdanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(8);
		//使用单位地址
		reg.setShiyongdanweidizhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(9);
		//使用单位代码
		reg.setShiyongdanweidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//邮政编码
		reg.setSydw_youzhengbianma(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(10);
		//单位性质
		reg.setDanweixingzhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//所属行业
		reg.setSuoshuhangye(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(11);
		//法定代表人
		reg.setSydw_fadingdaibiaoren(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//安全管理部门
		reg.setAnquanguanlibumen(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(12);
		//安全管理人员
		reg.setAnquanguanlirenyuan(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//安全管理电话
		reg.setAqglry_lianxidianhua(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(13);
		//单位内编号
		reg.setNeibubianhao(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//设备使用地点
		reg.setShiyongdidian(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(14);
		//使用场合
		reg.setShiyongchanghe(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//经度
		reg.setJingdu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(15);
		//运行状态
		reg.setYxzt_yongtu(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//纬度
		reg.setWeidu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(16);
		//投用日期
		reg.setTouyongriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[3]).getDate());
		//海拔高度
		reg.setHaibagaodu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(17);
		//产权单位名称
		reg.setChanquandanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(18);
		//组织机构代码
		reg.setChanquandanweidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//联系电话
		reg.setCqdw_dianhua(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(19);
		//单位性质
		reg.setCqdw_xingzhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//所属行业
		reg.setCqdw_suoshuhangye(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(20);
		//制造单位名称
		reg.setZhizaodanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(21);
		//制造许可证编号
		reg.setZzdw_zigezhengshuhao(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//产品编号
		reg.setChuchangbianhao(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(22);
		//制造日期
		reg.setZhizaoriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[3]).getDate());
		//产品合格证编号
		reg.setChanpinhegezhengbianhao(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(23);
		reg.setShejidanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(24);
		//鉴定报告书编号
		reg.setShejixukezhengbianhao(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//产品图号
		reg.setChanpintuhao(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		
		thisRow = sheet.getRow(25);
		//设计文件鉴定机构
		reg.setXingshishiyanjiegou(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(26);
		//鉴定报告书编号
		reg.setShiyanjiegouhezhunzheng(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//产品图号
		reg.setXingshishiyanzhengshu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(27);
		//制造监检机构
		reg.setZhizaojianjianjigou(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(28);
		//监检机构核准证编号
		reg.setJianjianjigouhezhunzheng(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//制造监检证书编号
		reg.setZhizaojianjianzhengshu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(29);
		//施工单位名称
		reg.setShigongdanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(30);
		//施工许可证编号
		reg.setAzdw_zigezhengshubianhao(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//施工类别
		reg.setShigongleibie(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(31);
		//施工告知日期
		reg.setShigongriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[3]).getDate());
		//施工竣工日期
		reg.setJungongriqi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(32);
		//工作压力
		reg.setGongzuoyali(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//工作温度
		reg.setGongzuowendu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(33);
		//介质
		reg.setJiezhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//运行热效率
		//reg.setYunxingrexiaolv(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		reg.setEdingqizhongliang(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		reg.setChongzhuangliang(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(34);
		//保险机构
		reg.setBaoxianjigou(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(35);
		//保险险种
		reg.setBaoxianpinzhong(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//保险价值
		reg.setBaoxianjiazhi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(36);
		//保险费
		reg.setBaoxianfei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//保险金额
		reg.setBaoxianjine(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(38);
		//变更项目
		reg.setBiandongxiangmu(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents().trim());
		//变更类别
		reg.setBiandongfangshi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//变更原因
		reg.setBiandongyuanyin(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		//变更日期
		reg.setBiandongriqi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(39);
		//变更项目
		reg.setBiandongxiangmu_2(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents().trim());
		//变更类别
		reg.setBiandongfangshi_2(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//变更原因
		reg.setBiandongyuanyin_2(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		//变更日期
		reg.setBiandongriqi_2(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(40);
		//变更项目
		reg.setBiandongxiangmu_3(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents().trim());
		//变更类别
		reg.setBiandongfangshi_3(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//变更原因
		reg.setBiandongyuanyin_3(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		//变更日期
		reg.setBiandongriqi_3(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(41);
		//检验机构
		reg.setJianyandanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(42);
		//组织机构代码
		reg.setJianyandanweidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//检验类别
		reg.setJianyanleibie(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(43);
		//检验日期
		reg.setJianyanriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[3]).getDate());
		//检验结论
		reg.setJianyanjielun(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(44);
		//检验报告编号
		reg.setBaogaoshubianhao(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//下次检验日期
		reg.setXiacijianyanriqi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(48);
		//使用单位填表人员
		reg.setTianbiaorenyuan(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//日期
		reg.setTianbiaoriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[7]).getDate());
		
		thisRow = sheet.getRow(49);
		//安全管理人员日期
		reg.setAqglry_riqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[7]).getDate());
		
		//使用单位 盖章日期
		reg.setShiyongdanwei_nyr(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(50);
		//首次定期检验日期
		reg.setDingqijianyanriqi(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[4]).getDate());
		
		thisRow = sheet.getRow(51);
		//说明
		reg.setShuoming(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents());
		
		thisRow = sheet.getRow(52);
		//登记机关登记人员
		reg.setZhucedengjirenyuan(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//日期
		reg.setZhucedengjiriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[7]).getDate());
		
		thisRow = sheet.getRow(53);
		//登记机关 盖章日期
		reg.setDengjijiguan_nyr(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(54);
		//监管类别
		reg.setAnquanzhuangkuangdengji(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//监管类别
		reg.setJianguanleibie(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//使用登记证编号
		reg.setShiyongdengjizhenghaoma(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(55);
		//市
		reg.setShiyongdanweidizhi_shi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());

		reg.setShiyongdanweidizhi_shi_daima(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[2].getContents().trim(),""));
		//区县
		reg.setShiyongdanweidizhi_qu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		
		reg.setShiyongdanweidizhi_qu_daima(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[5].getContents().trim(),reg.getShiyongdanweidizhi_shi_daima()));
		
		//乡镇
		reg.setSuozaixiangzhen(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		reg.setSuozaixiangzhen_daima(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[9].getContents().trim(),reg.getShiyongdanweidizhi_qu_daima()));
		
	}
	//注册登记表信息   起重机械
	public void setZcdjbForQZJX(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(1);
		rowNum = 1;
		//登记类别
		reg.setDengjileibie(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//注册代码
		reg.setZhucedaima(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents());
		thisRow = sheet.getRow(2);
		rowNum = 2;
		//设备类别
		reg.setShebeileibie(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		// 设备类别代码
		if (!"".equals(reg.getShebeileibie())) {
			List<HashMap<String,Object>> l = super.findListBySql("select daima from sys_sedirectory where mingcheng = '" + reg.getShebeileibie() + "'");
			if (l.size() > 0) {
				reg.setShebeileibiedaima(l.get(0).get("daima").toString());
			}
		}
		thisRow = sheet.getRow(3);
		rowNum = 3;
		//设备品种
		reg.setShebeipinzhong(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		// 设备品种代码
		if (!"".equals(reg.getShebeipinzhong())) {
			List<HashMap<String,Object>> l = super.findListBySql("select daima from sys_sedirectory where mingcheng = '" + reg.getShebeipinzhong() + "'");
			if (l.size() > 0) {
				reg.setShebeipinzhongdaima(l.get(0).get("daima").toString());
			}
		}
		//设备名称
		reg.setShebeimingcheng(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(4);
		//设备代码
		reg.setShebeidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//设备型号
		reg.setShebeixinghao(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(5);
		//设备级别
		reg.setShebeijibie(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//固定资产
		reg.setGudingzichan(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(6);
		//结构型式
		reg.setJiegouxingshi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//防爆型式
		reg.setFangbaoxingshi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(7);
		//吊具型式
		reg.setDiaojuxingshi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//操作方式
		reg.setCaozuofangshi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(8);
		//额定起重量
		reg.setEdingqizhongliang(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//额定起重量 单位
		reg.setEdingqizhongliang_dw(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "t" : thisRow[5].getContents().trim());
		//改单位之前的模板
		if(reg.getEdingqizhongliang_dw().indexOf("(kN")>=0){
			reg.setEdingqizhongliang_dw("t");
		}else if(reg.getEdingqizhongliang_dw().indexOf("kN")>=0){
			reg.setEdingqizhongliang_dw("kN·m");
		}
		//跨度
		reg.setKuadu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(9);
		//提升高度
		reg.setTishenggaodu(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//运行速度
		reg.setYunxingsudu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(10);
		//工作级别
		reg.setGongzuojibie(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//整机总功率
		reg.setZhengjizonggonglv(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(11);
		//使用单位
		reg.setShiyongdanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(12);
		//使用单位地址
		reg.setShiyongdanweidizhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(13);
		//使用单位代码
		reg.setShiyongdanweidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//邮政编码
		reg.setSydw_youzhengbianma(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(14);
		//单位性质
		reg.setDanweixingzhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//所属行业
		reg.setSuoshuhangye(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(15);
		//法定代表人
		reg.setSydw_fadingdaibiaoren(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//安全管理部门
		reg.setAnquanguanlibumen(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(16);
		//安全管理人员
		reg.setAnquanguanlirenyuan(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//安全管理电话
		reg.setAqglry_lianxidianhua(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(17);
		//产权单位名称
		reg.setChanquandanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(18);
		//产权单位地址
		reg.setChanquandanweidizhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(19);
		//组织机构代码
		reg.setCqdw_fuzeren(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//联系电话
		reg.setCqdw_dianhua(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(20);
		//设备用途
		reg.setShebeiyongtu(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//内部编号
		reg.setNeibubianhao(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(21);
		//使用地点
		reg.setShiyongdidian(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//经度
		reg.setJingdu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(22);
		//投用日期
		reg.setTouyongriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[3]).getDate());
		//纬度
		reg.setWeidu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(23);
		reg.setBuzhishuliang(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//海拔高度
		reg.setHaibagaodu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(24);
		//制造单位名称
		reg.setZhizaodanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(25);
		//制造许可证编号
		reg.setZhizaodanweidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		reg.setZzdw_zigezhengshuhao(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(26);
		//产品编号
		reg.setChuchangbianhao(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//制造日期
		reg.setZhizaoriqi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());

		thisRow = sheet.getRow(27);
		//产品合格证编号
		reg.setChanpinhegezhengbianhao(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());

		thisRow = sheet.getRow(28);
		//制造监检机构
		reg.setZhizaojianjianjigou(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());

		thisRow = sheet.getRow(29);
		//监检机构核准证编号
		reg.setJianjianjigouhezhunzheng(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//制造监检证书编号
		reg.setZhizaojianjianzhengshu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(30);
		//设计文件鉴定机构
		reg.setXingshishiyanjiegou(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());

		thisRow = sheet.getRow(31);
		reg.setShiyanjiegouhezhunzheng(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//鉴定报告书编号
		reg.setXingshishiyanzhengshu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(32);
		//施工单位名称
		reg.setAnzhuangdanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(33);
		//施工单位名称
		reg.setAnzhuangdanweidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(34);
		//施工类别
		reg.setShigongleibie(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//施工许可证编号
		reg.setAzdw_zigezhengshubianhao(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(35);
		//施工告知日期
		reg.setShigongriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[3]).getDate());
		//施工竣工日期
		reg.setJungongriqi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(36);
		//工作压力
		reg.setWeibaodanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(37);
		//介质
		reg.setWeibaodanweidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//运行热效率
		reg.setWeibaoxingshi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(38);
		//介质
		reg.setGongzuohuanjing(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//运行热效率
		reg.setYunxingfangshi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(39);
		//介质
		reg.setYunxingcaozuoxingshi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(40);
		//保险机构
		reg.setBaoxianjigou(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(41);
		//保险机构
		reg.setBaoxianjigoudaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//保险险种
		reg.setBaoxianpinzhong(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(42);
		//保险价值
		reg.setBaoxianjiazhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//保险费
		reg.setBaoxianfei(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(43);
		//保险金额
		reg.setBaoxianjine(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(45);
		//变更项目
		reg.setBiandongxiangmu(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents().trim());
		//变更类别
		reg.setBiandongfangshi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//变更原因
		reg.setBiandongyuanyin(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		//变更日期
		reg.setBiandongriqi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(46);
		//变更项目
		reg.setBiandongxiangmu_2(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents().trim());
		//变更类别
		reg.setBiandongfangshi_2(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//变更原因
		reg.setBiandongyuanyin_2(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		//变更日期
		reg.setBiandongriqi_2(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(47);
		//变更项目
		reg.setBiandongxiangmu_3(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents().trim());
		//变更类别
		reg.setBiandongfangshi_3(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//变更原因
		reg.setBiandongyuanyin_3(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		//变更日期
		reg.setBiandongriqi_3(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(48);
		//检验机构
		reg.setJianyandanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(49);
		//组织机构代码
		reg.setJianyandanweidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//检验类别
		reg.setJianyanleibie(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(50);
		//检验日期
		reg.setJianyanriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[3]).getDate());
		//检验结论
		reg.setJianyanjielun(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(51);
		//检验报告编号
		reg.setBaogaoshubianhao(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//下次检验日期
		reg.setXiacijianyanriqi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(52);
		//检验报告编号
		reg.setShuoming_2(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents().trim());
		
		thisRow = sheet.getRow(54);
		//使用单位填表人员
		reg.setTianbiaorenyuan(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//日期
		reg.setTianbiaoriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[7]).getDate());
		
		thisRow = sheet.getRow(55);
		//安全管理人员日期
		reg.setAqglry_riqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[7]).getDate());
		
		//使用单位 盖章日期
		reg.setShiyongdanwei_nyr(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(56);
		//说明
		reg.setShuoming(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents());
		
		thisRow = sheet.getRow(57);
		//登记机关登记人员
		reg.setDengjirenyuan(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//日期
		reg.setDengjiriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[7]).getDate());
		reg.setZhucedengjiriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[7]).getDate());
		
		thisRow = sheet.getRow(58);
		//登记机关 盖章日期
		reg.setDengjijiguan_nyr(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(59);
		//使用登记证编号
		reg.setShiyongdengjizhenghaoma(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(60);
		//市
		reg.setShiyongdanweidizhi_shi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());

		reg.setShiyongdanweidizhi_shi_daima(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[2].getContents().trim(),""));
		//区县
		reg.setShiyongdanweidizhi_qu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		
		reg.setShiyongdanweidizhi_qu_daima(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[5].getContents().trim(),reg.getShiyongdanweidizhi_shi_daima()));
		
		//乡镇
		reg.setSuozaixiangzhen(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		reg.setSuozaixiangzhen_daima(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[9].getContents().trim(),reg.getShiyongdanweidizhi_qu_daima()));
		
	}
	//注册登记表信息   锅炉
	public void setZcdjbForGL(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(1);
		rowNum = 1;
		//登记类别
		reg.setDengjileibie(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents());
		//注册代码
		reg.setZhucedaima(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		thisRow = sheet.getRow(2);
		rowNum = 2;
		//设备类别
		reg.setShebeileibie(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		// 设备类别代码
		if (!"".equals(reg.getShebeileibie())) {
			List<HashMap<String,Object>> l = super.findListBySql("select daima from sys_sedirectory where mingcheng = '" + reg.getShebeileibie() + "'");
			if (l.size() > 0) {
				reg.setShebeileibiedaima(l.get(0).get("daima").toString());
			}
		}
		thisRow = sheet.getRow(3);
		rowNum = 3;
		//设备品种
		reg.setShebeipinzhong(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		// 设备品种代码
		if (!"".equals(reg.getShebeipinzhong())) {
			List<HashMap<String,Object>> l = super.findListBySql("select daima from sys_sedirectory where mingcheng = '" + reg.getShebeipinzhong() + "'");
			if (l.size() > 0) {
				reg.setShebeipinzhongdaima(l.get(0).get("daima").toString());
			}
		}
		//产品名称
		reg.setShebeimingcheng(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(4);
		//设备代码
		reg.setShebeidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//设备型号
		reg.setShebeixinghao(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(5);
		//设计使用年限
		reg.setShejishiyongnianxian(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//设备型号
		reg.setGudingzichan(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(6);
		//使用单位
		reg.setShiyongdanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(7);
		//使用单位地址
		reg.setShiyongdanweidizhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(8);
		//使用单位代码
		reg.setShiyongdanweidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//邮政编码
		reg.setSydw_youzhengbianma(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(9);
		//单位性质
		reg.setDanweixingzhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//所属行业
		reg.setSuoshuhangye(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(10);
		//法定代表人
		reg.setSydw_fadingdaibiaoren(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//安全管理部门
		reg.setAnquanguanlibumen(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(11);
		//安全管理人员
		reg.setAnquanguanlirenyuan(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//安全管理电话
		reg.setAqglry_lianxidianhua(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(12);
		//单位内编号
		reg.setNeibubianhao(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//设备使用地点
		reg.setShiyongdidian(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(13);
		//使用场合
		reg.setShiyongchanghe(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//经度
		reg.setJingdu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(14);
		//运行状态
		reg.setYxzt_yongtu(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//纬度
		reg.setWeidu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(15);
		//投用日期
		reg.setTouyongriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[3]).getDate());
		//海拔高度
		reg.setHaibagaodu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(16);
		//产权单位名称
		reg.setChanquandanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(17);
		//组织机构代码
		reg.setChanquandanweidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//联系电话
		reg.setCqdw_dianhua(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(18);
		//单位性质
		reg.setCqdw_xingzhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//所属行业
		reg.setCqdw_suoshuhangye(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(19);
		//职工人数
		reg.setZhigongrenshu(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//年产值
		reg.setNianchanzhi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(20);
		//制造单位名称
		reg.setZhizaodanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(21);
		//制造许可证编号
		reg.setZzdw_zigezhengshuhao(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//产品编号
		reg.setChuchangbianhao(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(22);
		//制造日期
		reg.setZhizaoriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[3]).getDate());
		//产品合格证编号
		reg.setChanpinhegezhengbianhao(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(23);
		//设计文件鉴定机构
		reg.setXingshishiyanjiegou(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(24);
		//鉴定报告书编号
		reg.setXingshishiyanzhengshu(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//产品图号
		reg.setChanpintuhao(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(25);
		//制造监检机构
		reg.setZhizaojianjianjigou(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(26);
		//监检机构核准证编号
		reg.setJianjianjigouhezhunzheng(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//制造监检证书编号
		reg.setZhizaojianjianzhengshu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(27);
		//制造监检日期
		reg.setZhizaojianjianriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[3]).getDate());
		//安装日期
		reg.setAnzhuangriqi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(28);
		//施工单位名称
		reg.setAnzhuangdanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(29);
		//施工许可证编号
		reg.setAzdw_zigezhengshubianhao(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//施工类别
		reg.setShigongleibie(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(30);
		//施工告知日期
		reg.setShigongriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[3]).getDate());
		//施工竣工日期
		reg.setJungongriqi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());

		thisRow = sheet.getRow(31);
		//安装监检日期
		reg.setAnzhuangjianjianriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[3]).getDate());
		//安装日期
		reg.setAnzhuangriqi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());

		thisRow = sheet.getRow(32);
		//安装监检机构
		reg.setAnzhuangjianjianjigou(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(33);
		//工作压力
		reg.setGongzuoyali(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//工作温度
		reg.setGongzuowendu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(34);
		//介质
		reg.setJiezhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//运行热效率
		reg.setYunxingrexiaolv(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());

		thisRow = sheet.getRow(35);
		//燃料种类
		reg.setRanshaozhonglei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//压力等级
		reg.setYalidengji(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(36);
		//额定蒸发量
		reg.setEdingzhengfaliang(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//是否在城市建成区内
		reg.setChengqu(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(37);
		//是否配备有效的除尘装置和脱硫脱硝装置
		reg.setChuchenzhuangzhi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//污染物排放量-PM2.5
		reg.setWuranwu_pm25(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(38);
		//污染物排放量-PM10
		reg.setWuranwu_pm10(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//污染物排放量-二氧化硫（SO2）
		reg.setWuranwu_pmso2(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(39);
		//污染物排放量-二氧化氮（NO2）
		reg.setWuranwu_pmno2(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//是否符合山东省排放标准
		reg.setFuhebiaozhun(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(40);
		//年耗燃烧介质量
		reg.setRanshaojiezhiliang(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//折合标准煤
		reg.setBiaozhunmei(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(41);
		//年耗电量
		reg.setNianhaodianliang(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//是否按规定完成能效测试(定型)
		reg.setNengxiaoceshi_dx(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(42);
		//是否按规定完成能效测试(定期)
		reg.setNengxiaoceshi_dq(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//热效率(设计值)
		reg.setRexiaolv_sheji(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(43);
		//热效率(实际值)
		reg.setRexiaolv_shiji(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(44);
		//保险机构
		reg.setBaoxianjigou(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(45);
		//保险险种
		reg.setBaoxianpinzhong(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//保险价值
		reg.setBaoxianjiazhi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(46);
		//保险费
		reg.setBaoxianfei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//保险金额
		reg.setBaoxianjine(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(48);
		//变更项目
		reg.setBiandongxiangmu(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents().trim());
		//变更类别
		reg.setBiandongfangshi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//变更原因
		reg.setBiandongyuanyin(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		//变更日期
		reg.setBiandongriqi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(49);
		//变更项目
		reg.setBiandongxiangmu_2(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents().trim());
		//变更类别
		reg.setBiandongfangshi_2(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//变更原因
		reg.setBiandongyuanyin_2(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		//变更日期
		reg.setBiandongriqi_2(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(50);
		//变更项目
		reg.setBiandongxiangmu_3(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents().trim());
		//变更类别
		reg.setBiandongfangshi_3(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//变更原因
		reg.setBiandongyuanyin_3(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		//变更日期
		reg.setBiandongriqi_3(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(51);
		//检验机构
		reg.setJianyandanwei(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		
		thisRow = sheet.getRow(52);
		//组织机构代码
		reg.setJianyandanweidaima(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//检验类别
		reg.setJianyanleibie(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(53);
		//检验日期
		reg.setJianyanriqi(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[3]).getDate());
		//检验结论
		reg.setJianyanjielun(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(54);
		//检验报告编号
		reg.setBaogaoshubianhao(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//下次检验日期
		reg.setXiacijianyanriqi(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[9]).getDate());
		
		thisRow = sheet.getRow(58);
		//使用单位填表人员
		reg.setTianbiaorenyuan(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//日期
		reg.setTianbiaoriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[7]).getDate());
		
		thisRow = sheet.getRow(59);
		//安全管理人员日期
		reg.setAqglry_riqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[7]).getDate());
		
		//使用单位 盖章日期
		reg.setShiyongdanwei_nyr(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(60);
		//首次定期检验日期
		reg.setDingqijianyanriqi(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[4]).getDate());
		
		thisRow = sheet.getRow(61);
		//说明
		reg.setShuoming(thisRow[1] == null || thisRow[1].getType() == jxl.CellType.EMPTY ? "" : thisRow[1].getContents());
		
		thisRow = sheet.getRow(62);
		//登记机关登记人员
		reg.setZhucedengjirenyuan(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//日期
		reg.setDengjiriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[7]).getDate());
		reg.setZhucedengjiriqi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[7]).getDate());
		
		thisRow = sheet.getRow(63);
		//登记机关 盖章日期
		reg.setDengjijiguan_nyr(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(64);
		//监管类别
		reg.setJianguanleibie(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//使用登记证编号
		reg.setShiyongdengjizhenghaoma(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		thisRow = sheet.getRow(65);
		//市
		reg.setShiyongdanweidizhi_shi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());

		reg.setShiyongdanweidizhi_shi_daima(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[2].getContents().trim(),""));
		//区县
		reg.setShiyongdanweidizhi_qu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		
		reg.setShiyongdanweidizhi_qu_daima(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[5].getContents().trim(),reg.getShiyongdanweidizhi_shi_daima()));
		
		//乡镇
		reg.setSuozaixiangzhen(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		
		reg.setSuozaixiangzhen_daima(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[9].getContents().trim(),reg.getShiyongdanweidizhi_qu_daima()));
		
	}
	//锅炉登记卡（电站锅炉副页）
	public void setZcdjbForDZGLFY(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(27);
		//最大连续蒸发量(t/h)
		reg.setLianxuzhengfaliang(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//再热蒸汽流量t/h
		reg.setZairezhengqiliuliang(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		thisRow = sheet.getRow(28);
		//锅筒工作压力(Mpa)
		reg.setGt_gongzuoyali(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//过热器出口压力(Mpa)
		reg.setGrq_chukouwendu(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		thisRow = sheet.getRow(29);
		//再热器入口压力(Mpa)
		reg.setZrq_rukouyali(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//再热器出口压力(Mpa)
		reg.setZrq_chukouyali(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		thisRow = sheet.getRow(30);
		//给水温度(oC)
		reg.setGeishuiwendu(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//过热器出口温度(oC)
		reg.setGrq_chukouwendu(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		thisRow = sheet.getRow(31);
		//再热器入口温度(oC)
		reg.setZrq_rukouwendu(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//再热器出口温度(oC)
		reg.setZrq_chukouwendu(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		thisRow = sheet.getRow(32);
		//直流锅炉启动压力(Mpa)
		reg.setZlgl_qidongyali(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//直流锅炉启动流量(t/h)
		reg.setZlgl_qidongliuliang(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		thisRow = sheet.getRow(33);
		//水 循 环 方式
		reg.setShuixunhuanfangshi(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//燃烧器布置方式
		reg.setRsq_buzhifangshi(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		thisRow = sheet.getRow(34);
		//设计燃料可燃基挥发份
		reg.setSjrlkrj_huifafen(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//设计应用基低位发热值
		reg.setSjyyjdw_farezhi(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		thisRow = sheet.getRow(35);
		//补给水处理方式
		reg.setBgs_chulifangshi(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//过热蒸汽调温方式
		reg.setGrzq_tiaowenfangshi(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		thisRow = sheet.getRow(36);
		//再热蒸汽调温方式
		reg.setZrzq_tiaowenfangshi(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//锅炉汽水分离方式
		reg.setGlqs_fenlifangshi(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		thisRow = sheet.getRow(37);
		//其他情况
		reg.setQitaqingkuang(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
	}
	//登记卡基本信息   电梯
	public void setDjkForDT(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(33);
		//使用登记证号码
		reg.setShiyongdengjizhenghaoma(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		thisRow = sheet.getRow(36);
		//市
		reg.setShiyongdanweidizhi_shi(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		reg.setShiyongdanweidizhi_shi_daima(getCodeByNameDic(reg.getShiyongdanweidizhi_shi(),""));
		//区
		reg.setShiyongdanweidizhi_qu(thisRow[6] == null || thisRow[6].getType() == jxl.CellType.EMPTY ? "" : thisRow[6].getContents().trim());
		reg.setShiyongdanweidizhi_qu_daima(getCodeByNameDic(reg.getShiyongdanweidizhi_qu(),reg.getShiyongdanweidizhi_shi_daima()));
		thisRow = sheet.getRow(37);
		//法定代表人
		reg.setSydw_fadingdaibiaoren(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//电话
		reg.setSydw_farendianhua(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		thisRow = sheet.getRow(38);
		//Email
		reg.setSydw_farenemail(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//传真
		reg.setSydw_farenchuanzhen(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		thisRow = sheet.getRow(39);
		//主管负责人
		reg.setZhuguanfuzeren(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//主管负责人电话
		reg.setZhuguanfuzerendianhua(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		thisRow = sheet.getRow(40);
		//经办人
		reg.setJingbanren(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//经办人电话
		reg.setJingbanrendianhua(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//经办人手机
		reg.setJingbanrenshouji(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(41);
		//填表日期
		reg.setTianbiaoriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[2]).getDate());
		//人口密集区
		reg.setRenkoumijiqu(thisRow[6] == null || thisRow[6].getType() == jxl.CellType.EMPTY ? "" : thisRow[6].getContents().trim());
		if("5000".equals(reg.getShebeizhongleidaima())){
			thisRow = sheet.getRow(42);
			//重点监控
			reg.setZhongdianjiankong(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
			thisRow = sheet.getRow(43);
			//重大危险源
			reg.setZhongdaweixianyuan(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
			//应急措施
			reg.setYingjicuoshi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		}else{
			thisRow = sheet.getRow(42);
			//重大危险源
			reg.setZhongdaweixianyuan(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
			//应急措施
			reg.setYingjicuoshi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
			thisRow = sheet.getRow(43);
			//重点监控
			reg.setZhongdianjiankong(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		}
		thisRow = sheet.getRow(44);
		//备注
		reg.setBeizhu(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//所在乡镇
		reg.setSuozaixiangzhen(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		reg.setSuozaixiangzhen_daima(getCodeByNameDic(reg.getSuozaixiangzhen(),reg.getShiyongdanweidizhi_qu_daima()));
		//所在村
		reg.setSuozaicun(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
	}
	//登记卡基本信息   游乐设施
	public void setDjkForYlss(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(33);
		//使用登记证号码
		reg.setShiyongdengjizhenghaoma(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		thisRow = sheet.getRow(36);
		
		//市
		reg.setShiyongdanweidizhi_shi(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		
		reg.setShiyongdanweidizhi_shi_daima(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[4].getContents().trim(),""));
		//区
		reg.setShiyongdanweidizhi_qu(thisRow[6] == null || thisRow[6].getType() == jxl.CellType.EMPTY ? "" : thisRow[6].getContents().trim());
		
		reg.setShiyongdanweidizhi_qu_daima(thisRow[6] == null || thisRow[6].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[6].getContents().trim(),reg.getShiyongdanweidizhi_shi_daima()));
		thisRow = sheet.getRow(37);
		//法定代表人
		reg.setSydw_fadingdaibiaoren(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//电话
		reg.setSydw_farendianhua(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		thisRow = sheet.getRow(38);
		//Email
		reg.setSydw_farenemail(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//传真
		reg.setSydw_farenchuanzhen(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		thisRow = sheet.getRow(39);
		//主管负责人
		reg.setZhuguanfuzeren(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//主管负责人电话
		reg.setZhuguanfuzerendianhua(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		thisRow = sheet.getRow(40);
		//经办人
		reg.setJingbanren(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//经办人电话
		reg.setJingbanrendianhua(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//经办人手机
		reg.setJingbanrenshouji(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(41);
		//填表日期
		reg.setTianbiaoriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[2]).getDate());
		//人口密集区
		reg.setRenkoumijiqu(thisRow[6] == null || thisRow[6].getType() == jxl.CellType.EMPTY ? "" : thisRow[6].getContents().trim());
		thisRow = sheet.getRow(42);
		//重大危险源
		reg.setZhongdaweixianyuan(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//应急措施
		reg.setYingjicuoshi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(43);
		//备注
		reg.setBeizhu(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//所在乡镇
		reg.setSuozaixiangzhen(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		
		reg.setSuozaixiangzhen_daima(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : this.getCodeByNameDic(thisRow[4].getContents().trim(),reg.getShiyongdanweidizhi_qu_daima()));
		//所在村
		reg.setSuozaicun(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
	}
	//登记卡基本信息   压力容器
	public void setDjkForYlrq(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(38);
		//使用登记证号码
		reg.setShiyongdengjizhenghaoma(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		thisRow = sheet.getRow(42);
		//法定代表人
		reg.setSydw_fadingdaibiaoren(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//电话
		reg.setSydw_farendianhua(thisRow[14] == null || thisRow[14].getType() == jxl.CellType.EMPTY ? "" : thisRow[14].getContents().trim());
		thisRow = sheet.getRow(43);
		//填表日期
		reg.setTianbiaoriqi(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[4]).getDate());
		//人口密集区
		reg.setRenkoumijiqu(thisRow[14] == null || thisRow[14].getType() == jxl.CellType.EMPTY ? "" : thisRow[14].getContents().trim());
		thisRow = sheet.getRow(44);
		//重大危险源
		reg.setZhongdianjiankong(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//所在乡镇
		reg.setSuozaixiangzhen(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		//所在村
		reg.setSuozaicun(thisRow[16] == null || thisRow[16].getType() == jxl.CellType.EMPTY ? "" : thisRow[16].getContents().trim());
	}
	//登记卡基本信息   锅炉
	public void setDjkForGL(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(39);
		//使用登记证号码
		reg.setShiyongdengjizhenghaoma(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		thisRow = sheet.getRow(41);
		//详细地址
		reg.setShiyongdidian(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		thisRow = sheet.getRow(42);
		//市
		reg.setShiyongdanweidizhi_shi(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		//区
		reg.setShiyongdanweidizhi_qu(thisRow[12] == null || thisRow[12].getType() == jxl.CellType.EMPTY ? "" : thisRow[12].getContents().trim());
		thisRow = sheet.getRow(43);
		//法定代表人
		reg.setSydw_fadingdaibiaoren(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//电话
		reg.setSydw_farendianhua(thisRow[10] == null || thisRow[10].getType() == jxl.CellType.EMPTY ? "" : thisRow[10].getContents().trim());
		thisRow = sheet.getRow(44);
		//Email
		reg.setSydw_farenemail(thisRow[3] == null || thisRow[3].getType() == jxl.CellType.EMPTY ? "" : thisRow[3].getContents().trim());
		//传真
		reg.setSydw_farenchuanzhen(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		thisRow = sheet.getRow(45);
		//主管负责人
		reg.setZhuguanfuzeren(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//主管负责人电话
		reg.setZhuguanfuzerendianhua(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
		thisRow = sheet.getRow(46);
		//经办人
		reg.setJingbanren(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//经办人电话
		reg.setJingbanrendianhua(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents().trim());
		//经办人手机
		reg.setJingbanrenshouji(thisRow[12] == null || thisRow[12].getType() == jxl.CellType.EMPTY ? "" : thisRow[12].getContents().trim());
		thisRow = sheet.getRow(47);
		//填表日期
		reg.setTianbiaoriqi(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? null : ((DateCell) thisRow[4]).getDate());
		//人口密集区
		reg.setRenkoumijiqu(thisRow[12] == null || thisRow[12].getType() == jxl.CellType.EMPTY ? "" : thisRow[12].getContents().trim());
		thisRow = sheet.getRow(48);
		//重大危险源
		reg.setZhongdaweixianyuan(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//应急措施
		reg.setYingjicuoshi(thisRow[12] == null || thisRow[12].getType() == jxl.CellType.EMPTY ? "" : thisRow[12].getContents().trim());
		thisRow = sheet.getRow(49);
		//重点监控
		reg.setZhongdianjiankong(thisRow[12] == null || thisRow[12].getType() == jxl.CellType.EMPTY ? "" : thisRow[12].getContents().trim());
		thisRow = sheet.getRow(50);
		//备注
		reg.setBeizhu(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		thisRow = sheet.getRow(51);
		//所在乡镇
		reg.setSuozaixiangzhen(thisRow[4] == null || thisRow[4].getType() == jxl.CellType.EMPTY ? "" : thisRow[4].getContents().trim());
		//所在村
		reg.setSuozaicun(thisRow[11] == null || thisRow[11].getType() == jxl.CellType.EMPTY ? "" : thisRow[11].getContents().trim());
	}
	//技术参数   电梯
	public void setJscsForDT(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(46);
		rowNum = 46;
		//管理方式
		reg.setGuanlifangshi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//运行速度
		reg.setYunxingsudu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//额定载荷
		reg.setEdingzaihe(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(47);
		rowNum = 47;
		//层站
		reg.setCengzhan(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//提升高度
		reg.setTishenggaodu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//走形距离
		reg.setZouxingjuli(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(48);
		rowNum = 48;
		//层
		reg.setCeng(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//站
		reg.setZhan(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//电梯门
		reg.setMen(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(49);
		//梯级宽度
		reg.setTijikuandu(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//油缸压力
		reg.setYougangyali(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//使用区段长度
		reg.setQuduanchangdu(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(50);
		//倾斜角度
		reg.setQingxiejiaodu(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
	}
	//技术参数   起重机
	public void setJscsForQZJX(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(46);
		rowNum = 46;
		//起重机械载荷
		reg.setZaihe(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//起重机械提升力矩
		reg.setTishengliju(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//起重机械提升高度
		reg.setTishenggaodu(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(47);
		rowNum = 47;
		//起重机械工作半径
		reg.setGongzuobanjing(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
	}
	//技术参数   游乐设施
	public void setJscsForYlss(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(45);
		rowNum = 45;
		//游乐设施线速度
		reg.setXiansudu(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//游乐设施高度
		reg.setYlss_gaodu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//额定乘客人数
		reg.setEdingchengkerenshu(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(46);
		rowNum = 46;
		//高度
		reg.setGaodu(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//摆角
		reg.setBaijiao(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//回转直径
		reg.setHuizhuanzhijing(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(47);
		rowNum = 47;
		//倾角
		reg.setQingjiao(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//速度
		reg.setSudu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//轨道高度
		reg.setGuidaogaodu(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(48);
		rowNum = 48;
		//运行高度
		reg.setYunxinggaodu(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//高差
		reg.setGaocha(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
	}
	//技术参数   厂内车
	public void setJscsForCNC(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(46);
		rowNum = 46;
		//厂内车辆运行速度
		reg.setYunxingsudu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//厂内车辆额定载荷
		reg.setEdingzaihe(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
	}
	
	//技术参数  索道
	public void setJscsForSD(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		thisRow = sheet.getRow(46);
		rowNum = 46;
		//管理方式
		reg.setYunxingsudu(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//运行速度
		reg.setChangdu(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		//额定载荷
		reg.setYunzainengli(thisRow[7] == null || thisRow[7].getType() == jxl.CellType.EMPTY ? "" : thisRow[7].getContents().trim());
		thisRow = sheet.getRow(47);
		rowNum = 47;
		//层站
		reg.setYunzaicheliangxingshi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		
	}
	//附件及辅机
	public void setFujianfuji(Sheet sheet,long id,StringBuffer errorMsg,Session session){
		HashMap<String,Object> map = null;
		Cell[] thisRow = null;
		int rowNum = 0;
			int rowCount = sheet.getRows();// 取得sheet的行数
			// TODO: 告知电梯
				String title = // 定义列元素 方便直接取值修改
				"mingcheng#xinghao#guige#shuliang#zhizaochangjia";
				try {
					// 循环行
					for (int rowIndex = 2; rowIndex < rowCount; rowIndex++) {
						map = new HashMap<String, Object>();// 初始化
						rowNum = rowIndex;// 赋值
						thisRow = sheet.getRow(rowIndex);// 获取当前行的所有列数据
						
						//第一列数据为空，跳出
						if(0 == thisRow.length){
							break;
						}
						
						if(thisRow[2] == null
								|| thisRow[2].getType() == CellType.EMPTY
								|| "".equals(String.valueOf(thisRow[2]))){
							
							continue;
						}
						
						TFujianfuji entity = new TFujianfuji();

						String[] titleRow = title.split("#");// 列拆分

						for (int j = 0; j < titleRow.length; j++) {// 对列进行循环
								if (thisRow[j+2] == null
										|| thisRow[j+2].getType() == CellType.EMPTY
										|| "".equals(String.valueOf(thisRow[j+2]))) {
									map.put(titleRow[j], "");
								} else {
									map.put(titleRow[j], thisRow[j+2].getContents().trim());
								}
						}
						//名称
						entity.setMingcheng(map.get("mingcheng").toString());
						//型号
						entity.setXinghao(map.get("xinghao").toString());
						// 规格
						entity.setGuige(map.get("guige").toString());
						// 数量
						entity.setShuliang(map.get("shuliang").toString());
						//制造厂家
						entity.setZhizaochangjia(map.get("zhizaochangjia").toString());
						
						entity.setDjbid(String.valueOf(id));
						session.save(entity);// 保存事务
					}
				} catch (ClassCastException e) {
					Cell[] titleRow = sheet.getRow(1);// 获取当前行的所有列数据
					errorMsg
							.append("格式转换异常：第（" + (rowNum + 1) + "）行第（"
									+ (map.size() + 1) + "）列("
									+ titleRow[map.size() - 1].getContents()
									+ ")非日期格式");
					session.getTransaction().rollback();
					e.printStackTrace();
				}catch (NullPointerException npe) {
					errorMsg.append("有未填写项！");
					session.getTransaction().rollback();
					npe.printStackTrace();
				} finally {
				}
	}
	//管道项目
	public void setGDXiangmu(Sheet sheet,long id,StringBuffer errorMsg,Session session){
		HashMap<String,Object> map = null;
		Cell[] thisRow = null;
		int rowNum = 0;
		int towNum = 0;
			int rowCount = sheet.getRows();// 取得sheet的行数
			
				String title_one = // 定义列元素 方便直接取值修改
				"xuhao#mingcheng#bianhao#jibie#gongchengzhijing#gongchengbihou#changdu#yali#wendu#jiezhi#suozaichejian";
				try {
					// 循环行
					for (int rowIndex = 11; rowIndex < rowCount; rowIndex++) {
						map = new HashMap<String, Object>();// 初始化
						rowNum = rowIndex;// 赋值
						thisRow = sheet.getRow(rowIndex);// 获取当前行的所有列数据
						
						//第一列数据为空，跳出
						if(0 == thisRow.length){
							break;
						}
						
						if(thisRow[0] == null
								|| thisRow[0].getType() == CellType.EMPTY
								|| "".equals(String.valueOf(thisRow[0]))){
							continue;
						}
						//说明到第二个列表了
						if("序号".equals(thisRow[0].getContents().trim())){
							towNum = rowIndex;
							break;
						}
						
						TGuandaoxiangmu entity = new TGuandaoxiangmu();

						String[] titleRow = title_one.split("#");// 列拆分

						for (int j = 0; j < titleRow.length; j++) {// 对列进行循环
								if (thisRow[j] == null
										|| thisRow[j].getType() == CellType.EMPTY
										|| "".equals(String.valueOf(thisRow[j]))) {
									map.put(titleRow[j], "");
								} else {
									map.put(titleRow[j], thisRow[j].getContents().trim());
								}
						}
						entity.setXuhao(map.get("xuhao").toString());
						entity.setMingcheng(map.get("mingcheng").toString());
						entity.setBianhao(map.get("bianhao").toString());
						entity.setJibie(map.get("jibie").toString());
						entity.setGongchengzhijing(map.get("gongchengzhijing").toString());
						entity.setGongchengbihou(map.get("gongchengbihou").toString());
						entity.setGuandaochangdu(map.get("changdu").toString());
						entity.setYali(map.get("yali").toString());
						entity.setWendu(map.get("wendu").toString());
						entity.setJiezhi(map.get("jiezhi").toString());
						entity.setSuoshuchejian(map.get("suozaichejian").toString());
						entity.setType("one");
						entity.setDjbid(String.valueOf(id));
						session.save(entity);// 保存事务
					}
					//第二个列表
					// 循环行
					String title_two = // 定义列元素 方便直接取值修改
					"xuhao#qidian#zhongdian#pushefangshi#fangfufangshi#caizhi#daima#zichanzhi#beizhu";
					
					for (int rowIndex = towNum+1; rowIndex < rowCount; rowIndex++) {
						map = new HashMap<String, Object>();// 初始化
						rowNum = rowIndex;// 赋值
						thisRow = sheet.getRow(rowIndex);// 获取当前行的所有列数据
						
						//第一列数据为空，跳出
						if(0 == thisRow.length){
							break;
						}
						
						if(thisRow[0] == null
								|| thisRow[0].getType() == CellType.EMPTY
								|| "".equals(String.valueOf(thisRow[0]))){
							continue;
						}
						
						TGuandaoxiangmu entity = new TGuandaoxiangmu();

						String[] titleRow = title_two.split("#");// 列拆分

						for (int j = 0; j < titleRow.length; j++) {// 对列进行循环
								if (thisRow[j] == null
										|| thisRow[j].getType() == CellType.EMPTY
										|| "".equals(String.valueOf(thisRow[j]))) {
									map.put(titleRow[j], "");
								} else {
									map.put(titleRow[j], thisRow[j].getContents().trim());
								}
						}
						entity.setXuhao(map.get("xuhao").toString());
						entity.setQidian(map.get("qidian").toString());
						entity.setZhongdian(map.get("zhongdian").toString());
						entity.setPushefangshi(map.get("pushefangshi").toString());
						entity.setFangfufangshi(map.get("fangfufangshi").toString());
						entity.setGuandaocaizhi(map.get("caizhi").toString());
						entity.setGuandaodaima(map.get("daima").toString());
						entity.setGudingzichan(map.get("zichanzhi").toString());
						entity.setBeizhu(map.get("beizhu").toString());
						entity.setType("two");
						entity.setDjbid(String.valueOf(id));
						session.save(entity);// 保存事务
					}
				} catch (ClassCastException e) {
					Cell[] titleRow = sheet.getRow(1);// 获取当前行的所有列数据
					errorMsg
							.append("格式转换异常：第（" + (rowNum + 1) + "）行第（"
									+ (map.size() + 1) + "）列("
									+ titleRow[map.size() - 1].getContents()
									+ ")非日期格式");
					session.getTransaction().rollback();
					e.printStackTrace();
				}catch (NullPointerException npe) {
					errorMsg.append("有未填写项！");
					session.getTransaction().rollback();
					npe.printStackTrace();
				} finally {
				}
	}
	
	//校验注册代码和使用单位
	public StringBuffer checkZcdmOrSydw(TRegisterParam reg){
		StringBuffer sb = new StringBuffer();
		if(!"".equals(reg.getZhucedaima()) && null != reg.getZhucedaima()){
			if(reg.getZhucedaima().trim().length() < 17 || reg.getZhucedaima().trim().length() > 20){
				sb.append("设备注册代码位数不正确！（应为17-20位）");
				return sb;
			}
//			String hql = "from TBaseInfo where zhucedaima = '"+reg.getZhucedaima().trim()+"' and zcstatus = '1'";
//			if(super.findListByHql(hql).size()>0){
//				sb.append("设备注册代码重复！");
//				return sb;
//			}
			
		}
//		if(!"".equals(reg.getShiyongdanwei()) && null != reg.getShiyongdanwei()){
//			String hql = "from TSyUtils where dwmc = '"+reg.getShiyongdanwei().trim()+"'";
//			if(super.findListByHql(hql).size()==0){
//				//新建单位
//				TSyUtils sy = new TSyUtils();
//				sy.setDwdz(reg.getShiyongdanweidizhi());
//				sy.setDwmc(reg.getShiyongdanwei());
//				sy.setJgdm(reg.getShiyongdanweidaima());
//				sy.setFlag("0");
//				sy.setShi(reg.getShiyongdanweidizhi_shi());
//				sy.setShidaima(reg.getShiyongdanweidizhi_shi_daima());
//				sy.setQuxian(reg.getShiyongdanweidizhi_qu());
//				sy.setQuxiandaima(reg.getShiyongdanweidizhi_qu_daima());
//				sy.setXiangzhen(reg.getSuozaixiangzhen());
//				sy.setXiangzhendaima(reg.getSuozaixiangzhen_daima());
//				super.save(sy);
//			//	sb.append("使用单位不存在，请先添加单位！");
//				return sb;
//			}
//		}
		
		return sb;
	}
	//验证
	public String verifyByDwmcOrZcdm(String dwmc) throws UnsupportedEncodingException{
		String result = "";
		dwmc = URLDecoder.decode(dwmc, "utf-8"); 
		String hql = "from TBaseInfoSearch where tmpData = '0' and  ( zcstatus ='1' or zcstatus ='3' )";
		if(super.findListByHql(hql).size()>0){
			result = "0";
		}
		return result;
	}
	//生成设备信息
	public boolean updSeInfo(TRegisterParam reg,String ispl){
		boolean flag = false;
		TBaseInfo base = null;
		
		//新导入  没有设备
			//新建设备
    	if("1000".equals(reg.getShebeizhongleidaima())){
    		base = new TBoilerParam();
    		base.setChuchangbianhao(reg.getChuchangbianhao()); //出厂编号
    		updateGlParam((TBoilerParam)base,reg,ispl);
    	}else if("2000".equals(reg.getShebeizhongleidaima())){
    		base = new TPressureVesselsParam();
    		base.setChuchangbianhao(reg.getChuchangbianhao()); //出厂编号
    		udpateYlrqParam((TPressureVesselsParam)base,reg,ispl);
    	}else if("3000".equals(reg.getShebeizhongleidaima())){
    		base = new TElevatorParam();
    		base.setChuchangbianhao(reg.getChuchangbianhao()); //出厂编号
    		updateDtParam((TElevatorParam)base,reg,ispl);
    	}else if("4000".equals(reg.getShebeizhongleidaima())){
    		base = new TCraneParam();
    		base.setChuchangbianhao(reg.getChuchangbianhao()); //出厂编号
    		updateQzjParam((TCraneParam)base,reg,ispl);
    	}else if("5000".equals(reg.getShebeizhongleidaima())){
    		base = new TCraneParam();
    		base.setChuchangbianhao(reg.getChuchangbianhao()); //出厂编号
    		updateQzjParam((TCraneParam)base,reg,ispl);
    	}else if("6000".equals(reg.getShebeizhongleidaima())){
    		base = new TRecreationParam();
    		base.setChuchangbianhao(reg.getChuchangbianhao()); //出厂编号
    		updateYlssParam((TRecreationParam)base,reg,ispl);
    	}else if("8000".equals(reg.getShebeizhongleidaima())){
    		base = new TPressurePipingParam();
    		base.setGongchengmingcheng(reg.getGongchengmingcheng());
    		base.setChuchangbianhao(reg.getGuandaobianhao());
    		updatePressureParam((TPressurePipingParam)base,reg,ispl);
    		
    	}else if("9000".equals(reg.getShebeizhongleidaima())){
    		base = new TCablewaysParam();
    		base.setChuchangbianhao(reg.getChuchangbianhao()); //出厂编号
    	}
    	
    	
    	/**********施工单位信息********/
		base.setShigongdanwei(reg.getShigongdanwei()); //施工单位
		//base.setShigongdanwei_daima(reg.getAnzhuangdanweidaima()); //施工单位代码
		//base.setShigongdanwei_xukezhengbianhao(reg.getAzdw_zigezhengshubianhao());//施工单位许可证编号
		//base.setShigongdanwei_lianxiren(reg.getXiangmufuzeren()); //施工单位联系人
		//base.setShigongdanwei_lianxidianhua(reg.getXmfzr_lianxidianhua()); //施工单位联系电话
		base.setShigongdanwei_shigongriqi(reg.getShigongriqi()); //施工日期（施工告知日期）
		base.setShigongdanwei_jungongriqi(reg.getJungongriqi()); //竣工日期
		base.setShigongleibie(reg.getShigongleibie()); //施工类别
		base.setYanshoudanwei(reg.getYanshoudanwei()); //验收单位
		base.setYanshoubaogaobianhao(reg.getYanshoubaogaobianhao()); //验收报告编号
		base.setYanshoujigou(reg.getYanshoujianyanjigou()); //验收机构
		base.setDaxiuzhouqi(reg.getDaxiuzhouqi()); //大修周期
		base.setWeibaozhouqi(reg.getWeibaozhouqi()); //维保周期
		
		/*************安装单位*******************/
		base.setAnzhuangdanwei(reg.getAnzhuangdanwei()); //安装单位
		base.setAnzhuangdanwei_daima(reg.getAnzhuangdanweidaima()); //安装单位代码
		base.setAnzhuangriqi(reg.getAnzhuangriqi()); //安装日期
		base.setAnzhuangdanwei_lianxiren(reg.getXiangmufuzeren()); //安装单位联系人
		base.setAnzhuangdanwei_lianxidianhua(reg.getXmfzr_lianxidianhua()); //联系电话
		base.setAnzhuangdanwei_zigezhengshu(reg.getAzdw_zigezhengshubianhao()); //安装资格证书
		
		
		/***********使用单位信息**********/
		base.setShiyongdanwei(reg.getShiyongdanwei()); //使用单位
		base.setShiyongdanwei_dizhi(reg.getShiyongdanweidizhi()); //使用单位地址
		base.setShiyongdanwei_lianxiren(reg.getAnquanguanlirenyuan());//使用单位联系人
		base.setShiyongdanwei_lianxidianhua(reg.getAqglry_lianxidianhua()); //使用单位联系电话 
		if("8000".equals(reg.getShebeizhongleidaima())){
			base.setShiyongdanwei_lianxidianhua(reg.getZhuguanfuzerendianhua()); //使用单位联系电话 
		}
		base.setShiyongdanwei_suoshuhangye(reg.getSuoshuhangye()); //使用单位所属行业   ************8
		base.setHangye(reg.getSuoshuhangye()); //行业（使用单位所行业） ****************8
		base.setShiyongdanwei_code(reg.getShiyongdanweidaima()); //使用单位代码  组织机构代码
		base.setAnquanguanlibumen(reg.getAnquanguanlibumen());//安全管理部门
		base.setAnquanguanli_lianxidianhua(reg.getAqglry_lianxidianhua()); //安全管理联系电话
		base.setAnquanguanlirenyuan(reg.getAnquanguanlirenyuan()); //安全管理人
		base.setTouyongriqi(reg.getTouyongriqi_str()); //投用日期（文本）
		base.setTouyongriqi_date(reg.getTouyongriqi()); //投用日期（日期）
		base.setSuoshuchejian(reg.getChejianfenchang()); //所属车间
		base.setTianbiaoriqi(reg.getTianbiaoriqi()); //填表日期
		base.setTianbiaorenyuan(reg.getTianbiaorenyuan()); //填表人员
		base.setBeizhu(reg.getBeizhu()); //备注
		base.setZhuguanbumen(reg.getZhuguanbumen()); //主管部门
		base.setFadingdaibiaoren(reg.getSydw_fadingdaibiaoren()); // 使用单位法人代表
		base.setShiyongdanwei_youbian(reg.getSydw_youzhengbianma()); //使用单位邮政编码
		base.setZhuguanfuzeren(reg.getZhuguanfuzeren()); //主管负责人
		base.setZhuguanfuzerendianhua(reg.getZhuguanfuzerendianhua()); //主管负责人电话
		base.setJingbanren(reg.getJingbanren()); //经办人
		base.setJingbanrendianhua(reg.getJingbanrendianhua()); //经办人电话
		base.setShiyongdanwei_caozuorenyuan(reg.getCaozuorenyuan()); //操作人员
		base.setShiyongdanwei_xingzhi(reg.getDanweixingzhi()); //使用单位性质
		
		
		
		/**************设备信息**************/
		base.setShebeizhonglei(reg.getShebeizhonglei()); //设备种类
		base.setShebeizhongleidaima(reg.getShebeizhongleidaima()); //设备种类代码
		base.setShebeileibie(reg.getShebeileibie()); //设备类别
		base.setShebeileibiedaima(reg.getShebeileibiedaima()); //设备类别代码
		base.setShebeipinzhong(reg.getShebeipinzhong()); //设备品种
		base.setShenbeipinzhongdaima(reg.getShebeipinzhongdaima()); //设备品种代码
		base.setShebeididian(reg.getShiyongdidian()); //设备地点
		
		base.setShebeixinghao(reg.getShebeixinghao()); //设备形式
		base.setNeibubianhao(reg.getNeibubianhao()); //内部编号
		base.setShenheriqi(reg.getShenheriqi()); //审核日期
		base.setDengjiyijian(reg.getShenheyijian()); //审核意见
		
		base.setZcstatus("1"); //状态
		base.setTmpData("0"); //是否正式数据
		base.setShebeimingcheng(reg.getShebeimingcheng()); //设备名称
		base.setQuhuadaima(reg.getShiyongdanweidizhi_qu_daima()); //区划代码
		base.setQuhuamingcheng(reg.getShiyongdanweidizhi_qu()); //区划
		base.setXiangzhen(reg.getSuozaixiangzhen()); //乡镇
		base.setXiangzhendaima(reg.getSuozaixiangzhen_daima()); //乡镇
		base.setDjb_id(reg.getId()); //登记表主键
		base.setShi(reg.getShiyongdanweidizhi_shi()); //市
		base.setShidaima(reg.getShiyongdanweidizhi_shi_daima()); //市代码
		base.setZhucedaima(reg.getZhucedaima()); //注册代码
		base.setShebeidaima(reg.getShebeidaima()); // 设备代码
		base.setDengjizhengbianhao(reg.getShiyongdengjizhenghaoma());  //登记证编号
		base.setState("4");
		base.setEqhide("0");
		base.setZfstate("0");
		base.setShebeishiyongnianxian(reg.getShejishiyongnianxian());//设计使用年限
		base.setGudingzichanzhi(reg.getGudingzichan());//固定资产
		base.setDengjileibie(reg.getDengjileibie()); //登记类别
		base.setJianguanleibie(reg.getJianguanleibie());  //监管类别
		
		/******制造信息********/
		base.setZhizaodanwei(reg.getZhizaodanwei()); //制造单位
		base.setZhizaoriqi(reg.getZhizaoriqi_str()); //制造日期（字符串）
		base.setZhizaoriqi_date(reg.getZhizaoriqi()); //制造日期（日期）
		
		base.setZhizaojianjianjigou(reg.getZhizaojianjianjigou()); //制造监检机构
		base.setZhizaojianjianriqi(reg.getZhizaojianjianriqi()); //制造监检日期
		base.setChanpinhegezhengbianhao(reg.getChanpinhegezhengbianhao()); //产品合格证编号
		base.setWenjianjiandingjigou(reg.getXingshishiyanjiegou()); //设计文件鉴定机构
		base.setJiandingbaogaobianhao(reg.getXingshishiyanzhengshu()); //鉴定报告书编号
		base.setChanpintuhao(reg.getChanpintuhao()); //产品图号
		base.setJianjianzhengshubianhao(reg.getZhizaojianjianzhengshu()); //制造监检证书编号
		base.setJianjianhezhunzheng(reg.getJianjianjigouhezhunzheng()); //制造监检核准证
		
		base.setZhizaodanweixukezhengbianhao(reg.getZzdw_zigezhengshuhao());//制造单位许可证编号
		base.setZhizaodanwei_code(reg.getZhizaodanweidaima()); //制造单位代码
		base.setZhizaodanwei_zigezhengshu(reg.getZzdw_zigezhengshumingcheng()); //资格证书名称
		base.setZhizaodanweixukezhengbianhao(reg.getZzdw_zigezhengshuhao()); //资格证书编号
		base.setZhizaodanwei_lianxidianhua(reg.getZzdw_lianxidianhua()); //联系电话
		base.setShiyongchangsuo(reg.getShiyongchanghe()); //使用场合
		
		/*****维保信息********/
		base.setWeihubaoyangdanwei(reg.getWeibaodanwei()); //维保单位
		base.setWeihubaoyangdanwei_dianhua(reg.getWeibaofuzerendianhua()); //电话
		base.setWeihubaoyangdanwei_lianxiren(reg.getWeibaofuzeren());//维保单位联系人
		base.setWhbydw_zizhizhengshu(reg.getWbdw_zigezhengshuhao()); //维保单位资质证书
		base.setWeihubaoyangdanwei_code(reg.getWeibaodanweidaima()); //维保单位代码
		/*****产权单位********/
		base.setChanquandanwei(reg.getChanquandanwei()); //产权单位
		base.setChanquandanwei_dizhi(reg.getChanquandanweidizhi()); //产权单位地址
		base.setChanquandanwei_daima(reg.getChanquandanweidaima()); //产权单位代码
		base.setChanquandanwei_suoshuhangye(reg.getCqdw_suoshuhangye()); //产权单位所属行业
		base.setChanquandanwei_farendaibiao(reg.getDanweifarendaibiao());//产权单位法人代表
		base.setChanquandanwei_youbian(reg.getCqdw_youzhengbianma()); //产权单位邮政编码
		base.setChanquandanwei_dianhua(reg.getFarenlianxidianhua()); //产权单位电话
		base.setChanquandanwei_xingzhi(reg.getCqdw_xingzhi()); //产权单位性质
		/********注册信息*************/
		base.setZhuceriqi(reg.getZhucedengjiriqi()); //设备注册日期
		base.setZhucedengjijigou(reg.getZhucedengjijigou()); //注册登记机构
		base.setZhucedengjirenyuan(reg.getZhucedengjirenyuan()); //注册登记人员
		
		/******设计单位*******/
		base.setShejidanwei(reg.getShejidanwei()); //设计单位
		base.setShejidanweidaima(reg.getShejidanweidaima()); //设计单位代码
		/******检验单位*********/
		base.setJianyanjigou(reg.getJianyandanwei()); //检验机构
		base.setJianyanjielun(reg.getJianyanjielun()); //检验结论
		base.setJianyanjieshuriqi(reg.getJianyanriqi()); //检验日期
		base.setXiacijianyanriqi(reg.getXiacijianyanriqi()); //下次检验日期
		base.setJianyanjigou_code(reg.getJianyandanweidaima()); //检验单位代码
		base.setJianyanleixing(reg.getJianyanleibie()); //检验类别
		base.setZhuyaowenti(reg.getZhuyaowenti()); //主要问题
		base.setBaogaobianhao(reg.getBaogaoshubianhao()); // 报告编号
		
		base.setShiguleibie(reg.getShiguleibie()); //事故类别
		base.setShiguchulijieguo(reg.getShiguchulijieguo()); //事故处理结果
		base.setShigufashengriqi(reg.getShigufashengriqi()); // 事故发生日期
		base.setShebeibiandongfangshi(reg.getBiandongfangshi()); //变动方式
		base.setShebeibiandongxiangmu(reg.getBiandongxiangmu()); //变动项目
		base.setShebeibiandongriqi(reg.getBiandongriqi()); // 变动日期
		base.setChengdandanwei(reg.getChengdandanwei()); //承担单位
		base.setChengdandanwei_code(reg.getChengdandanweidaima()); //承担单位代码
		
		base.setShifou_renkoumijiqu(reg.getRenkoumijiqu()); //人口密集区
		base.setShifou_yingjifangan(reg.getYingjicuoshi()); //应急预案
		base.setShifou_zhongdaweixianyuan(reg.getZhongdaweixianyuan()); //重大危险
		base.setShifou_zhongdianjiankong(reg.getZhongdianjiankong()); //重点监控
		
		base.setZhigongrenshu(reg.getZhigongrenshu()); //职工人数
		base.setNianchanzhi(reg.getNianchanzhi()); //年产值
		
		/************保险**********/
		base.setBaoxianfei(reg.getBaoxianfei()); //保险费
		base.setBaoxianji(reg.getBaoxianjine()); //保险金额
		base.setBaoxianjiazhi(reg.getBaoxianjiazhi()); //保险价值
		base.setBaoxianjigou(reg.getBaoxianjigou()); //保险机构
		base.setBaoxianxianzhong(reg.getBaoxianpinzhong()); //保险险种
		
		base.setBiangengriqi(reg.getGengxinriqi()); //变更日期 
		
		base.setShifou_dyrrjs(reg.getShifou_dyrrjs()); //是否吊运熔融金属
		
		String hql = "";
		if("".equals(reg.getSuozaixiangzhen_daima())){
			hql = "from TSyUtils where dwmc = '"+reg.getShiyongdanwei()+"' " +
			" and shidaima = '"+reg.getShiyongdanweidizhi_shi_daima()+"' and quxiandaima = '"+reg.getShiyongdanweidizhi_qu_daima()+"'" +
					" and xiangzhendaima is null and tmpData = '0' ";
		}else{
			hql = "from TSyUtils where dwmc = '"+reg.getShiyongdanwei()+"' " +
			" and shidaima = '"+reg.getShiyongdanweidizhi_shi_daima()+"' and quxiandaima = '"+reg.getShiyongdanweidizhi_qu_daima()+"'" +
					" and xiangzhendaima  = '"+reg.getSuozaixiangzhen_daima()+"' and tmpData = '0' ";
		}
		
		
		List<TSyUtils> syList = super.findListByHql(hql);
		if(syList.size()==0){
			//新建单位
			TSyUtils sy = new TSyUtils();
			sy.setDwdz(reg.getShiyongdanweidizhi());
			sy.setDwmc(reg.getShiyongdanwei());
			sy.setJgdm(reg.getShiyongdanweidaima());
			sy.setFlag("0");
			sy.setTmpData("0");
			sy.setQuxian(reg.getShiyongdanweidizhi_qu());
			sy.setQuxiandaima(reg.getShiyongdanweidizhi_qu_daima());
			sy.setXiangzhen(reg.getSuozaixiangzhen());
			sy.setXiangzhendaima(reg.getSuozaixiangzhen_daima());
			sy.setShi(reg.getShiyongdanweidizhi_shi());
			sy.setShidaima(reg.getShiyongdanweidizhi_shi_daima());
			sy.setLxr(reg.getAnquanguanlirenyuan());
			sy.setLxdh(reg.getAqglry_lianxidianhua());
			base.setShiyongdanweiId(super.saveReturnId(sy));
		}else{
			base.setShiyongdanweiId(syList.get(0).getId());
		}
		
		String hqlAzdw = "from TAzUtils where unitsname = '"+reg.getShigongdanwei()+"'";
		List<TAzUtils> azList = super.findListByHql(hqlAzdw);
		if(azList.size()>0){
			base.setShigongdanweiId(azList.get(0).getId());
		}
		
		
		base.setDj_jingbanren(reg.getJingbanren());
		base.setDj_jingbanriqi(new Date());
		//base.setJingbanren(reg.getJingbanren()); //经办人
		base.setUpdateTime(new Date());//修改时间
		
		if(super.saveReturnId(base) > 0){
			flag = true;
		}
		
		return flag;
//		if("1000".equals(base.getShebeizhongleidaima())){//锅炉填充参数
//			TBoilerParam bp = (TBoilerParam)super.findById(base.getId(),TBoilerParam.class.getName());
//			setParamsByGL(bp,reg);
//		}
	}
	public String uploadFj(TRegisterParam reg,File file,String fileName,String tjstate) throws IOException{
//		if (file != null) {
//			if ((fileName == null) || (file == null)
//					|| (file.length() > 1024*1024*10)) {
//				return "OUTSIZE";
//			}
//
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//			Random rd = new Random();
//			String fileType = fileName.substring(fileName.lastIndexOf("."));
//			String fName = fileName.substring(0,fileName.indexOf("."));
//			String newfileName = fName+"_"+sdf.format(new Date())+(rd.nextInt(90000)+10000)+fileType;
//		    //得到工程保存文件的路径
//	        String savePath = Resources.getString("QIYEZHUCEDENGJIFILE", "struts");
//	        File uploadFolder = new File(savePath);
//	        if(!uploadFolder.exists()){
//	        	uploadFolder.mkdirs();
//	        }
//	        FileInputStream is = new FileInputStream(file);
//		    File f = new File(savePath,newfileName);
//		    OutputStream os = new FileOutputStream(f);
//		    byte[] b = new byte[1024];
//		    int length = 0;
//		    while((length = is.read(b))>0){
//		    	os.write(b, 0, length);
//		    }
//	        is.close();
//	        os.close();
//	        //删除原来的附件
//	        delFileByPath(reg.getFj_filepath());
//			reg.setFj_filepath(savePath+newfileName);
//			reg.setTjstate(tjstate);
//			super.update(reg);
//		}else{
			reg.setTjstate(tjstate);
			super.update(reg);
//		}
		return "SUCCESS";
	}
	
	/**
	 * 注册登记表复制方法
	 */
	public void doRegisterCopy(String id,String num){
		
		TRegisterParam reg = (TRegisterParam) super.findById(Long.parseLong(id), TRegisterParam.class.getName());
		
		for(int i=0;i<Integer.parseInt(num);i++){
			TRegisterParam rp = new TRegisterParam();
			try {
				CopyUtils.CopyNotNullParam(reg, rp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rp.setId(null);
			rp.setShiyongdengjizhenghaoma("");
			rp.setTjstate("0");
			rp.setFilepath("");
			rp.setDjz_bf("");
			rp.setDjz_liushuihao("");
			rp.setDjz_af("");
			rp.setZhucedengjirenyuan("");
			rp.setZhucedengjijigou("");
			rp.setZhucedengjiriqi(null);
			super.save(rp);
			if("8000".equals(rp.getShebeizhongleidaima())){
				TRegister_YLGD_HZB hzb = new TRegister_YLGD_HZB();
				hzb.setRegister_id(rp.getId());
				super.save(hzb);
			}else if("Q000".equals(rp.getShebeizhongleidaima()) && !"Q100".equals(rp.getShebeileibiedaima())){
				TRegister_QP_HZB hzb = new TRegister_QP_HZB();
				hzb.setRegister_id(rp.getId());
				super.save(hzb);
			}
			TFujianfuji fj = null;
			List<TFujianfuji> list = super.findListByHql("from TFujianfuji where djbid = '"+reg.getId()+"'");
			for(TFujianfuji f : list){
				fj = f.clone();
				fj.setId(null);
				fj.setDjbid(rp.getId().toString());
				super.save(fj);
			}
		}
	}
	
	
	/**
	 * 删除注册登记信息
	 * 只删除已提交的设备信息
	 * @param ids
	 * @return
	 */
	public void delRegInfo(String ids){
		
		String hql = "from TRegister where id in ("+ids+")";
		List<TRegister> list = super.findListByHql(hql);
		for(TRegister r : list){
			if(!"1".equals(r.getTjstate()) && !"2".equals(r.getTjstate())){
				delFileByPath(r.getFilepath());
				delFileByPath(r.getFj_filepath());
				if("8000".equals(r.getShebeizhongleidaima())){
					super.deleteByDHql("register_id='"+r.getId()+"'", null, TRegister_YLGD_HZB.class.getName());
				}else if("Q100".equals(r.getShebeileibiedaima())){
					super.deleteByDHql("register_id='"+r.getId()+"'", null, TRegister_CYQP_XINXI.class.getName());
				}else if("Q000".equals(r.getShebeizhongleidaima()) && !"Q100".equals(r.getShebeileibiedaima())){
					super.deleteByDHql("register_id='"+r.getId()+"'", null, TRegister_QP_HZB.class.getName());
				}
				super.deleteByDHql("djbid='"+r.getId()+"'", null, TFujianfuji.class.getName());
				super.delete(r);
			}
		}
	}
	//获取压力管道汇总表
	public List<TRegister_YLGD_HZB> getListByYlgdHzb(String id){
		String query = "from TRegister_YLGD_HZB app where register_id = '"+id+"'";
		String order = " order by app.id";
		List<TRegister_YLGD_HZB> list = super.findListByHql(query + order);
		if(list.size()==0){
			list.add(new TRegister_YLGD_HZB());
		}
		return list;
	}
	//获取车用气瓶个信息表
	public List<TRegister_CYQP_XINXI> getListByCyqpXx(String id){
		String query = "from TRegister_CYQP_XINXI app where register_id = '"+id+"'";
		String order = " order by app.id";
		List<TRegister_CYQP_XINXI> list = super.findListByHql(query + order);
		return list;
	}
	//获取气瓶个信息表
	public List<TRegister_QP_HZB> getListByQpHzb(String id){
		String query = "from TRegister_QP_HZB app where register_id = '"+id+"'";
		String order = " order by app.id";
		List<TRegister_QP_HZB> list = super.findListByHql(query + order);
		if(list.size()==0){
			list.add(new TRegister_QP_HZB());
		}
		return list;
	}
	//登记表提交时，生成设备，填充参数
	public void setParamsByGL(TBoilerParam bp,TRegisterParam reg){
		bp.setGongzuoyali(reg.getGongzuoyali());
		bp.setGongzuowendu(reg.getGongzuowendu());
		bp.setZhigongrenshu(reg.getZhigongrenshu());
		bp.setNianchanzhi(reg.getNianchanzhi());
		bp.setAnzhuangriqi(reg.getAnzhuangriqi());
		bp.setAnzhuangjianjianriqi(reg.getAnzhuangjianjianriqi());
		bp.setAnzhuangjianjianjigou(reg.getAnzhuangjianjianjigou());
		bp.setZhizaojianjianriqi(reg.getZhizaojianjianriqi());
		bp.setRanliaozhonglei(reg.getRanshaozhonglei());
		bp.setYalidengji(reg.getYalidengji());
		bp.setEdingzhengfaliang(reg.getEdingzhengfaliang());
		bp.setChengqu(reg.getChengqu());
		bp.setChuchenzhuangzhi(reg.getChuchenzhuangzhi());
		bp.setWuranwu_pm25(reg.getWuranwu_pm25());
		bp.setWuranwu_pm10(reg.getWuranwu_pm10());
		bp.setWuranwu_pmno2(reg.getWuranwu_pmno2());
		bp.setWuranwu_pmso2(reg.getWuranwu_pmso2());
		bp.setFuhebiaozhun(reg.getFuhebiaozhun());
		bp.setRanshaojiezhiliang(reg.getRanshaojiezhiliang());
		bp.setBiaozhunmei(reg.getBiaozhunmei());
		bp.setNianhaodianliang(reg.getNianhaodianliang());
		bp.setNengxiaoceshi_dq(reg.getNengxiaoceshi_dq());
		bp.setNengxiaoceshi_dx(reg.getNengxiaoceshi_dx());
		bp.setRexiaolv_sheji(reg.getRexiaolv_sheji());
		bp.setRexiaolv_shiji(reg.getRexiaolv_shiji());
		super.update(bp);
	}
	
	
	/**
	 * 保存锅炉的属性信息 
	 */
	public void updateGlParam(TBoilerParam base,TRegisterParam reg,String pl){
		base.setGongzuoyali(reg.getGongzuoyali());
		base.setGongzuowendu(reg.getGongzuowendu());
		base.setJiezhi(reg.getJiezhi());
		base.setYunxingrexiaolv(reg.getYunxingrexiaolv());
		base.setRanliaozhonglei(reg.getRanshaozhonglei());
		base.setYalidengji(reg.getYalidengji());
		base.setEdingzhengfaliang(reg.getEdingzhengfaliang());
		base.setChengqu(reg.getChengqu());
		base.setChuchenzhuangzhi(reg.getChuchenzhuangzhi());
		base.setWuranwu_pm25(reg.getWuranwu_pm25());
		base.setWuranwu_pm10(reg.getWuranwu_pm10());
		base.setWuranwu_pmso2(reg.getWuranwu_pmso2());
		base.setWuranwu_pmno2(reg.getWuranwu_pmno2());
		base.setFuhebiaozhun(reg.getFuhebiaozhun());
		base.setRanshaojiezhiliang(reg.getRanshaojiezhiliang());
		base.setBiaozhunmei(reg.getBiaozhunmei());
		base.setNianhaodianliang(reg.getNianhaodianliang());
		base.setNengxiaoceshi_dq(reg.getNengxiaoceshi_dq());
		base.setNengxiaoceshi_dx(reg.getNengxiaoceshi_dx());
		base.setRexiaolv_sheji(reg.getRexiaolv_sheji());
		base.setRexiaolv_shiji(reg.getRexiaolv_shiji());
		base.setAnzhuangjianjianjigou(reg.getAnzhuangjianjianjigou());
		base.setAnzhuangjianjianriqi(reg.getAnzhuangjianjianriqi());
	}
	
	/**
	 * 保存压力容器的属性信息
	 */
	public void udpateYlrqParam(TPressureVesselsParam base,TRegisterParam reg,String pl){
		base.setGongzuoyali(reg.getGongzuoyali());
		base.setGongzuowendu(reg.getGongzuowendu());
		base.setGongzuojiezhi(reg.getJiezhi());
		base.setJiegouxingshi(reg.getJiegouxingshi());
	}
	
	/**
	 * 保存电梯的属性信息
	 * @param base
	 * @param reg
	 */
	public void updateDtParam(TElevatorParam base,TRegisterParam reg,String pl){
		base.setDianticengzhan(reg.getCengzhan());
		if("1".equals(pl)){
			base.setEdingsudu(reg.getYunxingsudu()==null?0L:Double.parseDouble(reg.getYunxingsudu()));//运行速度
			base.setEdingzaizhongliang(reg.getEdingzaihe()==null?0L:Double.parseDouble(reg.getEdingzaihe()));//额定载荷
			base.setCeng(reg.getCeng()==null?Double.parseDouble(reg.getCengzhan()==null?"0":reg.getCengzhan()):Double.parseDouble(reg.getCeng()));
			base.setZhan(reg.getZhan()==null?Double.parseDouble(reg.getCengzhan()==null?"0":reg.getCengzhan()):Double.parseDouble(reg.getZhan()));
			base.setMen(reg.getMen()==null?Double.parseDouble(reg.getCengzhan()==null?"0":reg.getCengzhan()):Double.parseDouble(reg.getMen()));
			base.setTishenggaodu(reg.getTishenggaodu()==null?0L:Double.parseDouble(reg.getTishenggaodu()));
			base.setQuduanchangdu(reg.getQuduanchangdu()==null?0L:Double.parseDouble(reg.getQuduanchangdu()));
			base.setQingxiejiao(reg.getQingxiejiaodu()==null?0L:Double.parseDouble(reg.getQingxiejiaodu()));
		}else{
			base.setEdingsudu(reg.getYunxingsudu().length()==0?0L:Double.parseDouble(reg.getYunxingsudu()));//运行速度
			base.setEdingzaizhongliang(reg.getEdingzaihe().length()==0?0L:Double.parseDouble(reg.getEdingzaihe()));//额定载荷
			base.setCeng(reg.getCeng().length() == 0?Double.parseDouble(reg.getCengzhan().length() == 0?"0":reg.getCengzhan()):Double.parseDouble(reg.getCeng()));
			base.setZhan(reg.getZhan().length() == 0?Double.parseDouble(reg.getCengzhan().length() == 0?"0":reg.getCengzhan()):Double.parseDouble(reg.getZhan()));
			base.setMen(reg.getMen().length() == 0?Double.parseDouble(reg.getCengzhan().length() == 0?"0":reg.getCengzhan()):Double.parseDouble(reg.getMen()));
			base.setTishenggaodu(reg.getTishenggaodu().length()== 0?0L:Double.parseDouble(reg.getTishenggaodu()));
			base.setQuduanchangdu(reg.getQuduanchangdu().length()== 0?0L:Double.parseDouble(reg.getQuduanchangdu()));
			base.setQingxiejiao(reg.getQingxiejiaodu().length()==0?0L:Double.parseDouble(reg.getQingxiejiaodu()));
		}
		
	}
	
	/**
	 * 保存起重机的属性信息
	 * @param base
	 * @param reg
	 */
	public void updateQzjParam(TCraneParam base,TRegisterParam reg,String pl){
		
		if("t".equals(reg.getEdingqizhongliang_dw())){
			base.setEdingqizhongliang(reg.getEdingqizhongliang());
		}else{
			base.setZuidaqizhongliju(reg.getEdingqizhongliang());
		}
		base.setKuadu(reg.getKuadu());
		base.setQishenggaodu(reg.getTishenggaodu());
		base.setQishengsudu(reg.getYunxingsudu()); //起重机起升速度
		base.setGongzuojibie(reg.getGongzuojibie());
		base.setPaizhaohaoma(reg.getPaizhaobianhao());
		base.setYunxingsudu(reg.getYunxingsudu());
		base.setShifou_zhongdaweixianyuan(reg.getZhongdaweixianyuan());
		base.setShifou_zhongdianjiankong(reg.getZhongdianjiankong());
		base.setShifou_yingjifangan(reg.getYingjicuoshi());
		base.setShifou_renkoumijiqu(reg.getRenkoumijiqu());
		base.setShiguleibie(reg.getShiguleibie());
	//	base.setEdingqizhongliang(reg.getEdingzaihe());
		
	}
	
	/**
	 * 
	 * @param base
	 * @param reg
	 */
	public void updateYlssParam(TRecreationParam base,TRegisterParam reg,String pl){
		base.setXiansudu(reg.getXiansudu());
		base.setYlss_gaodu(reg.getYlss_gaodu());
		base.setEdingchengkerenshu(reg.getEdingchengkerenshu());
		base.setEdingzaihe(reg.getEdingzaihe());
		base.setQingjiao(reg.getQingjiao());
		base.setSudu(reg.getSudu());
		base.setFusudu(reg.getFusudu());
		base.setQudongxingshi(reg.getQudongxingshi());
		base.setQudongzhugonglv(reg.getQudongzhugonglv());
		base.setDianya(reg.getDianya());
		base.setFugonglv(reg.getFugonglv());
		base.setGaodu(reg.getGaodu());
		base.setHuizhuanzhijing(reg.getHuizhuanzhijing());
		base.setGuiju(reg.getGuiju());
		base.setGuijuchangdu(reg.getGuijuchangdu());
		base.setShuihuatigaodu(reg.getShuihuatigaodu());
		base.setYoulechishuishen(reg.getYoulechishuishen());
	}
	
	/**
	 * 
	 * @param base
	 * @param reg
	 */
	public void updatePressureParam(TPressurePipingParam base,TRegisterParam reg,String pl){
		base.setGongchengzhijing(reg.getGongchengzhijing());
		base.setGongchengbihou(reg.getGongchengbihou());
		base.setGuandaochangdu(reg.getGuandaochangdu());
		base.setShejiyali(reg.getShejiyali());
		base.setShejiwendu(reg.getShejiwendu());
		base.setShusongjiezhi(reg.getShusongjiezhi());
		base.setGongzuoyali(reg.getGongzuoyali());
		base.setGongzuowendu(reg.getGongzuowendu());
		base.setZhongyaoguandao(reg.getShifouzhongyaoguandao());
		base.setGuandaojibie(reg.getGuandaojibie());
	}
	
	
	//注册登记表信息   压力管道
	public void setZcdjbForYlgd(TRegisterParam reg,Cell[] thisRow,Sheet sheet,int rowNum){
		
		thisRow = sheet.getRow(1);
		reg.setBianhao(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		reg.setShiyongdengjizhenghaoma(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//使用单位
		reg.setShiyongdanwei(thisRow[6] == null || thisRow[6].getType() == jxl.CellType.EMPTY ? "" : thisRow[6].getContents().trim());


		//市
		reg.setShiyongdanweidizhi_shi(thisRow[12] == null || thisRow[12].getType() == jxl.CellType.EMPTY ? "" : thisRow[12].getContents().trim());
		reg.setShiyongdanweidizhi_shi_daima(getCodeByNameDic(reg.getShiyongdanweidizhi_shi(),""));
		//区
		reg.setShiyongdanweidizhi_qu(thisRow[15] == null || thisRow[15].getType() == jxl.CellType.EMPTY ? "" : thisRow[15].getContents().trim());
		reg.setShiyongdanweidizhi_qu_daima(getCodeByNameDic(reg.getShiyongdanweidizhi_qu(),reg.getShiyongdanweidizhi_shi_daima()));
		

		//使用单位地址
		reg.setShiyongdanweidizhi(thisRow[18] == null || thisRow[18].getType() == jxl.CellType.EMPTY ? "" : thisRow[18].getContents().trim());
		
		thisRow = sheet.getRow(2);
		rowNum = 2;
		
		//主管部门
		reg.setZhuguanbumen(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//行业
		reg.setSuoshuhangye(thisRow[6] == null || thisRow[6].getType() == jxl.CellType.EMPTY ? "" : thisRow[6].getContents());
		//联系电话
		reg.setZhuguanfuzerendianhua(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents());
		//安全管理部门
		reg.setAnquanguanlibumen(thisRow[15] == null || thisRow[15].getType() == jxl.CellType.EMPTY ? "" : thisRow[15].getContents().trim());
		//安全管理人员
		reg.setAnquanguanlirenyuan(thisRow[18] == null || thisRow[18].getType() == jxl.CellType.EMPTY ? "" : thisRow[18].getContents().trim());
		
		thisRow = sheet.getRow(3);
		rowNum = 3;
		//经办人
		reg.setJingbanren(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? "" : thisRow[2].getContents().trim());
		//管道类别  
		reg.setShebeileibie(thisRow[5] == null || thisRow[5].getType() == jxl.CellType.EMPTY ? "" : thisRow[5].getContents().trim());
		// 设备类别代码
		if (!"".equals(reg.getShebeileibie())) {
			List<HashMap<String,Object>> l = super.findListBySql("select daima from sys_sedirectory where mingcheng = '" + reg.getShebeileibie() + "'");
			if (l.size() > 0) {
				reg.setShebeileibiedaima(l.get(0).get("daima").toString());
			}
		}
		//工程名称
		reg.setGongchengmingcheng(thisRow[9] == null || thisRow[9].getType() == jxl.CellType.EMPTY ? "" : thisRow[9].getContents().trim());
		//审核日期
		reg.setShenheriqi(thisRow[15] == null || thisRow[15].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[15]).getDate());
		//登记意见(审核意见)
		reg.setShenheyijian(thisRow[18] == null || thisRow[18].getType() == jxl.CellType.EMPTY ? "" : thisRow[18].getContents().trim());
		
		thisRow = sheet.getRow(4);
		rowNum = 4;
		//登记日期
		reg.setDengjiriqi(thisRow[2] == null || thisRow[2].getType() == jxl.CellType.EMPTY ? null : ((DateCell)thisRow[2]).getDate());
		//登记人员
		reg.setDengjirenyuan(thisRow[6] == null || thisRow[6].getType() == jxl.CellType.EMPTY ? "" : thisRow[6].getContents().trim());
		//登记机关
		reg.setZhucedengjijigou(thisRow[8] == null || thisRow[8].getType() == jxl.CellType.EMPTY ? "" : thisRow[8].getContents().trim());
	}
	//管道项目
	public String setGDXiangmu(Sheet sheet,TRegisterParam reg,StringBuffer errorMsg,Session session,String id) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		HashMap<String,Object> map = null;
		Cell[] thisRow = null;
		int rowNum = 0;
		int towNum = 0;
			int rowCount = sheet.getRows();// 取得sheet的行数
			
				String title_one = // 定义列元素 方便直接取值修改
				"xuhao#mingcheng#bianhao#jibie#shejidanwei#anzhuangdanwei#anzhuangriqi#touyongriqi" +
				"#gongchengzhijing#gongchengbihou#changdu#yali#wendu#jiezhi#caizhi#jianyanjielun#jianyanjigou#guandaodaima#xiacijianyanriqi" +
				"#gudingzichan#beizhu";
				try {
					// 循环行
					for (int rowIndex = 8; rowIndex < rowCount; rowIndex++) {
						map = new HashMap<String, Object>();// 初始化
						rowNum = rowIndex;// 赋值
						thisRow = sheet.getRow(rowIndex);// 获取当前行的所有列数据
						
						//第一列数据为空，跳出
						if(0 == thisRow.length){
							break;
						}
						
						if(thisRow[0] == null
								|| thisRow[0].getType() == CellType.EMPTY
								|| "".equals(String.valueOf(thisRow[0]))){
							continue;
						}
						
						TRegisterParam entity = new TRegisterParam();

						String[] titleRow = title_one.split("#");// 列拆分

						for (int j = 0; j < titleRow.length; j++) {// 对列进行循环
							if("anzhuangriqi".equals(titleRow[j]) || "touyongriqi".equals(titleRow[j]) || "xiacijianyanriqi".equals(titleRow[j])){
								if(thisRow[j] == null || thisRow[j].getType() == CellType.EMPTY || "".equals(String.valueOf(thisRow[j]))){
									map.put(titleRow[j], null);
								}else{
									map.put(titleRow[j], ((DateCell)thisRow[j]).getDate());
								}
							}else if (thisRow[j] == null
									|| thisRow[j].getType() == CellType.EMPTY
									|| "".equals(String.valueOf(thisRow[j]))) {
								map.put(titleRow[j], "");
							} else {
								map.put(titleRow[j], thisRow[j].getContents().trim());
							}
						}
						
						entity.setBianhao(map.get("xuhao").toString());
						entity.setShebeimingcheng(map.get("mingcheng").toString());
						entity.setGuandaobianhao(map.get("bianhao").toString());
						entity.setGuandaojibie(map.get("jibie").toString());
						entity.setShejidanwei(map.get("shejidanwei").toString());
						entity.setAnzhuangdanwei(map.get("anzhuangdanwei").toString());
						
						entity.setAnzhuangriqi(map.get("anzhuangriqi") == null ? null:(Date)map.get("anzhuangriqi"));
						entity.setTouyongriqi(map.get("touyongriqi") == null ? null:(Date)map.get("touyongriqi"));
						
						//entity.setAnzhuangriqi(DateFormatTool.formatStringToDate(map.get("anzhuangriqi").toString(), "yyyy-MM-dd"));
						//entity.setTouyongriqi(DateFormatTool.formatStringToDate(map.get("touyongriqi").toString(), "yyyy-MM-dd"));
						
						
						entity.setGongchengzhijing(map.get("gongchengzhijing").toString());
						entity.setGongchengbihou(map.get("gongchengbihou").toString());
						entity.setGuandaochangdu(map.get("changdu").toString());
						String yali = map.get("yali").toString();
						String wendu = map.get("wendu").toString();
						if(yali != ""){
							String[] yl = yali.split("/");
							entity.setShejiyali(yl[0]);
							if(yl.length > 1){
								entity.setGongzuoyali(yl[1]);
							}
							

						}
						if(wendu != ""){
							String[] wd = wendu.split("/");
							entity.setShejiwendu(wd[0]);
							if(wd.length>1){
								entity.setGongzuowendu(wd[1]);
							}
							
						}
						
						
						
						
						entity.setJiezhi(map.get("jiezhi").toString());//介质 压力容器
						entity.setShusongjiezhi(map.get("jiezhi").toString());//输送介质  压力管道
						
						entity.setGuandaoguige(map.get("caizhi").toString());
						entity.setJianyanjielun(map.get("jianyanjielun").toString());
						entity.setJianyandanwei(map.get("jianyanjigou").toString());
						entity.setZhucedaima(map.get("guandaodaima").toString());
						//entity.setXiacijianyanriqi(DateFormatTool.formatStringToDate(map.get("xiacijianyanriqi").toString(), "yyyy-MM-dd"));
						entity.setXiacijianyanriqi(map.get("xiacijianyanriqi") == null ? null:(Date)map.get("xiacijianyanriqi"));
						entity.setGudingzichan(map.get("gudingzichan").toString());
						entity.setBeizhu(map.get("beizhu").toString());
						entity.setOrgan_code(reg.getOrgan_code());
						//entity.setBianhao(reg.getBianhao());
						entity.setShiyongdengjizhenghaoma(reg.getShiyongdengjizhenghaoma());
						entity.setShiyongdanwei(reg.getShiyongdanwei());

						entity.setShiyongdanweidizhi_shi(reg.getShiyongdanweidizhi_shi());
						entity.setShiyongdanweidizhi_shi_daima(reg.getShiyongdanweidizhi_shi_daima());

						entity.setShiyongdanweidizhi_qu(reg.getShiyongdanweidizhi_qu());

						entity.setShiyongdanweidizhi_qu_daima(reg.getShiyongdanweidizhi_qu_daima());

						entity.setShiyongdanweidizhi(reg.getShiyongdanweidizhi());
						entity.setZhuguanbumen(reg.getZhuguanbumen());
						entity.setSuoshuhangye(reg.getSuoshuhangye());
						entity.setSydw_farendianhua(reg.getSydw_farendianhua());
						entity.setZhuguanfuzerendianhua(reg.getZhuguanfuzerendianhua());
						entity.setAnquanguanlibumen(reg.getAnquanguanlibumen());
						entity.setAnquanguanlirenyuan(reg.getAnquanguanlirenyuan());
						entity.setJingbanren(reg.getJingbanren());
						entity.setShebeileibie(reg.getShebeileibie());
						entity.setShebeileibiedaima(reg.getShebeileibiedaima());
						entity.setGongchengmingcheng(reg.getGongchengmingcheng());
						entity.setShenheriqi(reg.getShenheriqi());
						entity.setShenheyijian(reg.getShenheyijian());
						entity.setDengjirenyuan(reg.getDengjirenyuan());
						entity.setZhucedengjirenyuan(reg.getDengjirenyuan());
						entity.setDengjiriqi(reg.getDengjiriqi());
						entity.setZhucedengjiriqi(reg.getDengjiriqi());
						entity.setZhucedengjijigou(reg.getZhucedengjijigou());
						entity.setShebeizhonglei("压力管道");
						entity.setShebeizhongleidaima("8000");
						entity.setTjstate("0");
						
						super.save(entity);// 保存事务
						id += entity.getId()+",";
					}
					
					
				} catch (ClassCastException e) {
					Cell[] titleRow = sheet.getRow(1);// 获取当前行的所有列数据
					errorMsg
							.append("格式转换异常：第（" + (rowNum + 1) + "）行第（"
									+ (map.size() + 1) + "）列("
									+ titleRow[map.size() - 1].getContents()
									+ ")非日期格式");
					//session.getTransaction().rollback();
					e.printStackTrace();
				}catch (NullPointerException npe) {
					errorMsg.append("有未填写项！");
					//session.getTransaction().rollback();
					npe.printStackTrace();
				} finally {
				}
				
				return id;
	}
	//获取告知信息
	public void getGaozhiInfo(String cpbh,TRegisterParam rg,String zldm){
		String hql = "from TApprizes where zhizaobianhao = '"+cpbh.trim()+"' and shebeizhongleidaima = '"+zldm+"'";
		List<TApprizes> list = super.findListByHql(hql);
		if(list.size()>0){
			TApprizes app = list.get(0);
			rg.setShiyongdanweidizhi_shi(app.getShi());
			rg.setShiyongdanweidizhi_shi_daima(app.getShidaima());
			rg.setShiyongdanweidizhi_qu(app.getQuhuamingcheng());
			rg.setShiyongdanweidizhi_qu_daima(app.getQuhuadaima());
			rg.setSuozaixiangzhen(app.getXiangzhen());
			rg.setSuozaixiangzhen_daima(app.getXiangzhendaima());
			rg.setShebeimingcheng(app.getShebeimingcheng());
			rg.setShebeixinghao(app.getXinghao());
			rg.setGuandaoguige(app.getXinghao());
			rg.setZhucedaima(app.getShebeidaima());
			rg.setChuchangbianhao(app.getZhizaobianhao());
			rg.setGuandaobianhao(app.getZhizaobianhao());
			rg.setZhizaodanwei(app.getZhizaodanwei());
			rg.setZzdw_zigezhengshuhao(app.getZhizaoxukezhengbianhao());
			rg.setShiyongdidian(app.getShebeididian());
			rg.setShigongdanwei(app.getShigongdanweiquancheng());
			rg.setAnzhuangdanwei(app.getShigongdanweiquancheng());
			rg.setShigongleibie(app.getShigongleibie());
			rg.setShigongriqi(app.getGaozhi_jingbanriqi());
			rg.setAzdw_zigezhengshubianhao(app.getShigongxukezhengbianhao());
			rg.setAnquanguanlirenyuan(app.getShiyongdanwei_lianxiren());
			rg.setAqglry_lianxidianhua(app.getShiyongdanwei_lianxidianhua());
			rg.setShiyongdanweidizhi(app.getShiyongdanwei_dizhi());
			rg.setSydw_youzhengbianma(app.getShiyongdanwei_youbian());
		}
	}
	//新建注册登记初始化信息
	public void getInitInfo(TRegisterParam rg,String sydwid,long userid){
		//没有关联单位或者还没有该用户对应的单位
		if("0".equals(sydwid)){
			TUser user = (TUser)super.findById(userid,TUser.class.getName());
			rg.setShiyongdanwei(user.getDanweimingcheng());
			rg.setShiyongdanweidizhi(user.getDanweidizhi());
			rg.setShiyongdanweidizhi_shi_daima(user.getShidaima());
			rg.setShiyongdanweidizhi_qu_daima(user.getXiandaima());
			rg.setAnquanguanlirenyuan(user.getLianxiren());
			rg.setAqglry_lianxidianhua(user.getLianxidianhua());
		}else{
			TSyUtils sy = (TSyUtils)super.findById(Long.parseLong(sydwid),TSyUtils.class.getName());
			rg.setShiyongdanwei(sy.getDwmc());
			rg.setShiyongdanweidizhi(sy.getDwdz());
			rg.setShiyongdanweidaima(sy.getJgdm());
			rg.setShiyongdanweidizhi_shi_daima(sy.getShidaima());
			rg.setShiyongdanweidizhi_qu_daima(sy.getQuxiandaima());
			rg.setSuozaixiangzhen_daima(sy.getXiangzhendaima());
			rg.setSydw_fadingdaibiaoren(sy.getFaren());
			rg.setAnquanguanlirenyuan(sy.getLxr());
			rg.setAqglry_lianxidianhua(sy.getLxdh());
		}
	}

	//获取字典数据
	public List<TDicData> getDataListByTypeCode(String code){
		List<TDicData> list = super.findListByHql("from TDicData where typeId = (select id from TDicType where code = '"+code+"') order by code");
		return list;
	}
	//获取辅机附件
	public List<TFujianfuji> getFjfjList(long reg_id){
		List<TFujianfuji> list = super.findListByHql("from TFujianfuji where djbid = '"+reg_id+"' order by id");
		return list;
	}
	
	//保存锅炉
	public void saveGl(TRegister reg,TUser user,List<TRegister_GL_HZB> gl_hzb_list,List<TFujianfuji> fjfj_list,List<TRegister_YLGD_HZB> hzbList){
		reg.setShebeileibie(getNameByCode(reg.getShebeileibiedaima()));
		reg.setShebeipinzhong(getNameByCode(reg.getShebeipinzhongdaima()));
		reg.setShiyongdanweidizhi_shi(this.getNameByCodeDic(reg.getShiyongdanweidizhi_shi_daima()));
		reg.setShiyongdanweidizhi_qu(this.getNameByCodeDic(reg.getShiyongdanweidizhi_qu_daima()));
		reg.setSuozaixiangzhen(this.getNameByCodeDic(reg.getSuozaixiangzhen_daima()));
		reg.setOrgan_code(reg.getShiyongdanweidizhi_qu_daima());
		reg.setCreat_user(user.getLoginId());
		super.save(reg);
		if(null != gl_hzb_list){
			for(TRegister_GL_HZB  gl : gl_hzb_list){
				if(null != gl){
					gl.setRegister_id(reg.getId());
					super.save(gl);
				}
			}
		}
		if(null != fjfj_list){
			for(TFujianfuji  fjfj : fjfj_list){
				if(null != fjfj){
					fjfj.setDjbid(reg.getId().toString());
					super.save(fjfj);
				}
			}
		}
		if(null != hzbList){
			for(TRegister_YLGD_HZB  hzb : hzbList){
				if(null != hzb){
					hzb.setRegister_id(reg.getId());
					super.save(hzb);
				}
			}
		}
	}
	
	//更新锅炉
	public void updateGL(TRegisterParam reg,List<TRegister_GL_HZB> hzbList,List<TRegister_YLGD_HZB> gdhzbList){
		List<TRegister_GL_HZB> oldHzbList = super.findListByHql("from TRegister_GL_HZB where register_id = '"+reg.getId()+"'");
		if(null != hzbList){
			for(TRegister_GL_HZB hzb : hzbList){
				if(null != hzb){
					hzb.setRegister_id(reg.getId());
					super.save(hzb);
				}
			}
		}
		for(TRegister_GL_HZB hzb : oldHzbList){
			super.delete(hzb);
		}
		
		List<TRegister_YLGD_HZB> oldGdHzbList = super.findListByHql("from TRegister_YLGD_HZB where register_id = '"+reg.getId()+"'");
		if(null != hzbList){
			for(TRegister_YLGD_HZB hzb : gdhzbList){
				if(null != hzb){
					hzb.setRegister_id(reg.getId());
					super.save(hzb);
				}
			}
		}
		for(TRegister_YLGD_HZB hzb : oldGdHzbList){
			super.delete(hzb);
		}
		
//		List<TFujianfuji> oldFjfjList = super.findListByHql("from TFujianfuji where djbid = '"+reg.getId()+"'");
//		if(null != fjfj_list){
//			for(TFujianfuji fjfj : fjfj_list){
//				if(null != fjfj){
//					fjfj.setDjbid(reg.getId().toString());
//					super.save(fjfj);
//				}
//			}
//		}
//		for(TFujianfuji f : oldFjfjList){
//			super.delete(f);
//		}
	}
	
	//获取锅炉hzb
	public List<TRegister_GL_HZB> getListByGlHzb(String id){
		String query = "from TRegister_GL_HZB app where register_id = '"+id+"'";
		String order = " order by app.id";
		List<TRegister_GL_HZB> list = super.findListByHql(query + order);
		if(list.size()==0){
			list.add(new TRegister_GL_HZB());
		}
		return list;
	}
	
	/**
	 * 告知单上传附件
	 * @param id  主键
	 * @param file 
	 * @param fileName
	 * @return
	 */
	public String addFujian(String id,File file,String fileName){
		
		if ((fileName == null) || (file == null)
				|| (file.length() > 1024*1024*10)) {
			return "OUTSIZE";
		}
		try {
			TRegister reg = (TRegister) super.findById(Long.parseLong(id), TRegister.class.getName());
	
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			Random rd = new Random();
			String fileType = fileName.substring(fileName.lastIndexOf("."));
			if(FileUtils.fileType(fileType)){
				return "OUTSIZE";
			}
			String fName = fileName.substring(0,fileName.indexOf("."));
			String newfileName = fName+"_"+sdf.format(new Date())+(rd.nextInt(90000)+10000)+fileType;
		    //得到工程保存文件的路径
	        String savePath = Resources.getString("QIYEZHUCEDENGJIFILE", "struts");
	        File uploadFolder = new File(savePath);
	        if(!uploadFolder.exists()){
	        	uploadFolder.mkdirs();
	        }
	        FileInputStream is = new FileInputStream(file);
		    File f = new File(savePath,newfileName);
		    OutputStream os = new FileOutputStream(f);
		    byte[] b = new byte[1024];
		    int length = 0;
		    while((length = is.read(b))>0){
		    	os.write(b, 0, length);
		    }
	        is.close();
	        os.close();
	        //删除原来的附件
	        delFileByPath(reg.getFj_filepath());
			reg.setFj_filepath(savePath+newfileName);
			super.update(reg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "SUCCESS";
		
	}
	
	/**
	 * 上传附件
	 * @param id  主键
	 * @param file 
	 * @param fileName
	 * @return
	 */
	public String addFujian(String id,File file,String fileName,String name){
		
		if ((fileName == null) || (file == null)
				|| (file.length() > 1024*1024*10)) {
			return "OUTSIZE";
		}
		
		//判断是否需要删除以前的文件
		TRegisterFile regFile = (TRegisterFile) super.findFirst("from TRegisterFile where djb_id='"+id+"' and file_name = '"+name+"'");
		if(regFile != null){
			//删除原来的附件
			delFileByPath(regFile.getFile_path());
			super.delete(regFile);
		}
		
		try {
			regFile = new TRegisterFile();
	
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			Random rd = new Random();
			String fileType = fileName.substring(fileName.lastIndexOf("."));
			if(FileUtils.fileType(fileType)){
				return "OUTSIZE";
			}
			String fName = fileName.substring(0,fileName.indexOf("."));
			String newfileName = fName+"_"+sdf.format(new Date())+(rd.nextInt(90000)+10000)+fileType;
	        newfileName = newfileName.replaceAll("[\\s\\\\/:\\*\\?\\\"<>\\|\\+]","_");
	        String savePath = Resources.getString("QIYEZHUCEDENGJIFUJIAN", "struts");
	        File uploadFolder = new File(savePath);
	        if(!uploadFolder.exists()){
	        	uploadFolder.mkdirs();
	        }
	        FileInputStream is = new FileInputStream(file);
		    File f = new File(savePath,newfileName);
		    OutputStream os = new FileOutputStream(f);
		    byte[] b = new byte[1024];
		    int length = 0;
		    while((length = is.read(b))>0){
		    	os.write(b, 0, length);
		    }
	        is.close();
	        os.close();
	        regFile.setFile_path(savePath+newfileName);
	        regFile.setDjb_id(Long.parseLong(id));
	        regFile.setFile_name(name);
	        regFile.setCreate_time(new Date());
			super.save(regFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "SUCCESS";
		
	}
	
	
}
