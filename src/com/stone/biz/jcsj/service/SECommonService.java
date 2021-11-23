package com.stone.biz.jcsj.service;

/**
 * <pre>
 *  基础数据的Service
 * </pre>
 */

import java.io.File;
import java.io.FileInputStream;
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
import jxl.format.PaperSize;
import jxl.format.VerticalAlignment;
import jxl.write.DateFormat;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

import com.stone.biz.dbsx.pojo.TDaiBanShiXiang;
import com.stone.biz.jcsj.pojo.TBaseFile;
import com.stone.biz.jcsj.pojo.TBaseInfo;
import com.stone.biz.jcsj.pojo.TBaseInfoSearch;
import com.stone.biz.jcsj.pojo.TBoilerParam;
import com.stone.biz.jcsj.pojo.TBoiler_YLGD_HZB;
import com.stone.biz.jcsj.pojo.TCablewaysParam;
import com.stone.biz.jcsj.pojo.TCraneParam;
import com.stone.biz.jcsj.pojo.TElevatorParam;
import com.stone.biz.jcsj.pojo.TPressurePipingParam;
import com.stone.biz.jcsj.pojo.TPressureVesselsParam;
import com.stone.biz.jcsj.pojo.TQiPingParam;
import com.stone.biz.jcsj.pojo.TRecreationParam;
import com.stone.biz.sjsh.pojo.TShuJuShenHe;
import com.stone.biz.utils.pojo.TAzUtils;
import com.stone.biz.utils.pojo.TSyUtils;
import com.stone.para.IConstant;
import com.stone.support.SupportService;
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

public class SECommonService extends SupportService {

	// 根据名称获取设备种类代码
	public String getCodeByName(String name) {
		String hql = "from TSeDirectory s where s.mingcheng = '" + name + "'";
		TSeDirectory dire = (TSeDirectory) super.findListByHql(hql).get(0);
		return dire.getDaima();
	}
	//上传Excel
	public void uploadExcelByGz(String ids,String type,File uploadify,String fileFileName) throws IOException{
		String foledName = "/upload_file/gaozhidan/"+StringUtils.getPinYinHeadChar(type);
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
	        
	        ids = StringUtils.trimEndTomma(ids);
	  //      String hql = "update TBaseInfo set gz_filepath = '"+foledName+"/"+newfileName+"' where id in ("+ids+")";
	  //      super.updateByHql(hql);
	        //往参数表插数据
	        String hqlList = "from TBaseInfo where id in ("+ids+")";
	        List<TBaseInfo> list = super.findListByHql(hqlList);
	        for(TBaseInfo info : list){
	        	String sql = "";
	        	if("1000".equals(info.getShebeizhongleidaima())){
	        		sql = "insert into BIZ_BOILERPARAM(BoilerID) values("+info.getId()+")";
	        	}else if("2000".equals(info.getShebeizhongleidaima())){
	        		sql = "insert into BIZ_PRESSURE_VESSELS_PARAM(PressureVesselsID) values("+info.getId()+")";
	        	}else if("3000".equals(info.getShebeizhongleidaima())){
	        		sql = "insert into BIZ_ElEVATORPARAM(elevatorId) values("+info.getId()+")";
	        	}else if("4000".equals(info.getShebeizhongleidaima()) || "5000".equals(info.getShebeizhongleidaima())){
	        		sql = "insert into BIZ_CRANEPARAM(craneId) values("+info.getId()+")";
	        	}
	        	info.setGz_filepath(foledName+"/"+newfileName);
	        	super.insertBySql(sql);
	        	super.update(info);
	        }
		}
		
	}
	//删除数据
	public void delDate(String ids){
        ids = StringUtils.trimEndTomma(ids);
		super.deleteAll(ids, TBaseInfo.class.getName());
	}
	//设置单位的ID
	public void setDwInfo(TBaseInfo info,TBaseInfo base){
		String hqlSydw = "from TSyUtils where dwmc = '"+base.getShiyongdanwei()+"'";
		List<TSyUtils> syList = super.findListByHql(hqlSydw);
		if(syList.size()>0){
			info.setShiyongdanweiId(syList.get(0).getId());
		}
		String hqlAzdw = "from TAzUtils where unitsname = '"+base.getShigongdanwei()+"'";
		List<TAzUtils> azList = super.findListByHql(hqlAzdw);
		if(azList.size()>0){
			info.setShigongdanweiId(azList.get(0).getId());
		}
	}
	
	//设置使用单位的ID
	public long getSyDwId(String sydw,String ouid,String ouidname){
		long dwid = 0;
		if(!"".equals(sydw)){
			List<TSyUtils> syList = super.findListByHql("from TSyUtils where dwmc = '"+sydw.trim()+"'");
			if(syList.size()>0){
				dwid = syList.get(0).getId();
			}else{
				//新建单位
				TSyUtils sy = new TSyUtils();
				sy.setDwmc(sydw);
				sy.setQuxiandaima(ouid);
				sy.setQuxian(ouidname);
				sy.setFlag("0");
				dwid = super.saveReturnId(sy);
			}
		}
		return dwid;
	}
	//设置安装单位的ID
	public long getAzDwId(String azdw){
		long dwid = 0;
		if(!"".equals(azdw)){
			List<TAzUtils> azList = super.findListByHql("from TAzUtils where unitsname = '"+azdw.trim()+"'");
			if(azList.size()>0){
				dwid = azList.get(0).getId();
			}else{
				//新建单位
				TAzUtils az = new TAzUtils();
				az.setUnitsname(azdw);
				dwid = super.saveReturnId(az);
			}
		}
		return dwid;
	}
	
	//删除文件
	public void delFileByPath(String path){
		String filePath = ServletActionContext.getRequest().getRealPath("")+path;
		File file = new File(filePath);
		if(file.exists()){
			file.delete();
		}
	}
	//修改设备信息电梯
	public void updateByDT(TElevatorParam el,String tjstate,TUser user,String address,String dbid,TElevatorParam oldEle){
		String neirong = el.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+el.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+el.getZhucedaima()+
		"&nbsp;&nbsp;&nbsp;"+el.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+el.getShi()+"&nbsp;&nbsp;&nbsp;"+el.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+
		DateFormatTool.formate(el.getXiacijianyanriqi(), "yyyy-MM-dd");

		TDaiBanShiXiang db = null;
		String hql = "from TDaiBanShiXiang where dataId = '"+el.getId()+"' and qiyetijiao is not null and xiugairen_loginId = '"+user.getLoginId()+"' and type = '设备'";
		List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
		if(dbList.size()>0){
			db = dbList.get(0);
			db.setNeirong(neirong);
			db.setXiugairiqi(new Date());
			super.update(db);
		}else{
			el.setTmpData("1");
			el.setPid(el.getId());
			el.setId(null);
			super.save(el);
			db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(el.getId());
			db.setType("设备");
			db.setTjstate("0");
			db.setOrgan_code(el.getQuhuadaima());
			db.setQiyetijiao("1");
			TShuJuShenHe sj = new TShuJuShenHe();
			sj.setNeirong(neirong);
			sj.setDataId(el.getId());
			sj.setOrgan_code(el.getQuhuadaima());
			sj.setTijiaoren(user.getName());
			sj.setTijiaoren_loginId(user.getLoginId());
			sj.setTijiaoriqi(new Date());
			sj.setType("设备");
			sj.setShenheleixing("信息变更");
			sj.setShstate("0");
			sj.setDbId(super.saveReturnId(db));
			super.save(sj);
		}
	}
	//修改设备信息锅炉
	public void updateByGL(TBoilerParam bo,String tjstate,TUser user,String address,String dbid,TBoilerParam oldBoil){
		String neirong = bo.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+bo.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+bo.getZhucedaima()+"&nbsp;&nbsp;&nbsp;"+
		bo.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+bo.getShi()+"&nbsp;&nbsp;&nbsp;"+bo.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(bo.getXiacijianyanriqi(), "yyyy-MM-dd");

		TDaiBanShiXiang db = null;
		String hql = "from TDaiBanShiXiang where dataId = '"+bo.getId()+"' and qiyetijiao is not null and xiugairen_loginId = '"+user.getLoginId()+"' and type = '设备'";
		List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
		if(dbList.size()>0){
			db = dbList.get(0);
			db.setNeirong(neirong);
			db.setXiugairiqi(new Date());
			super.update(db);
		}else{
			bo.setTmpData("1");
			bo.setPid(bo.getId());
			bo.setId(null);
			super.save(bo);
			db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(bo.getId());
			db.setType("设备");
			db.setTjstate("0");
			db.setOrgan_code(bo.getQuhuadaima());
			db.setQiyetijiao("1");
			TShuJuShenHe sj = new TShuJuShenHe();
			sj.setNeirong(neirong);
			sj.setDataId(bo.getId());
			sj.setOrgan_code(bo.getQuhuadaima());
			sj.setTijiaoren(user.getName());
			sj.setTijiaoren_loginId(user.getLoginId());
			sj.setTijiaoriqi(new Date());
			sj.setType("设备");
			sj.setShenheleixing("信息变更");
			sj.setShstate("0");
			sj.setDbId(super.saveReturnId(db));
			super.save(sj);
		}
	}
	//修改设备信息起重机械
	public void updateByQZJX(TCraneParam cr,String tjstate,TUser user,String address,String dbid,TCraneParam oldCra){
		String neirong = cr.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+cr.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+cr.getZhucedaima()+"&nbsp;&nbsp;&nbsp;"+
		cr.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+cr.getShi()+"&nbsp;&nbsp;&nbsp;"+cr.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(cr.getXiacijianyanriqi(), "yyyy-MM-dd");

		TDaiBanShiXiang db = null;
		String hql = "from TDaiBanShiXiang where dataId = '"+cr.getId()+"' and qiyetijiao is not null and xiugairen_loginId = '"+user.getLoginId()+"' and type = '设备'";
		List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
		if(dbList.size()>0){
			db = dbList.get(0);
			db.setNeirong(neirong);
			db.setXiugairiqi(new Date());
			super.update(db);
		}else{
			cr.setTmpData("1");
			cr.setPid(cr.getId());
			cr.setId(null);
			super.save(cr);
			db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(cr.getId());
			db.setType("设备");
			db.setTjstate("0");
			db.setOrgan_code(cr.getQuhuadaima());
			db.setQiyetijiao("1");
			TShuJuShenHe sj = new TShuJuShenHe();
			sj.setNeirong(neirong);
			sj.setDataId(cr.getId());
			sj.setOrgan_code(cr.getQuhuadaima());
			sj.setTijiaoren(user.getName());
			sj.setTijiaoren_loginId(user.getLoginId());
			sj.setTijiaoriqi(new Date());
			sj.setType("设备");
			sj.setShenheleixing("信息变更");
			sj.setShstate("0");
			sj.setDbId(super.saveReturnId(db));
			super.save(sj);
		}
	}
	//修改设备信息压力容器
	public void updateByYLRQ(TPressureVesselsParam pr,String tjstate,TUser user,String address,String dbid,TPressureVesselsParam oldPre){
		String neirong = pr.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+pr.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+pr.getZhucedaima()+"&nbsp;&nbsp;&nbsp;"+
		pr.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+pr.getShi()+"&nbsp;&nbsp;&nbsp;"+pr.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(pr.getXiacijianyanriqi(), "yyyy-MM-dd");
		TDaiBanShiXiang db = null;
		String hql = "from TDaiBanShiXiang where dataId = '"+pr.getId()+"' and qiyetijiao is not null and xiugairen_loginId = '"+user.getLoginId()+"' and type = '设备'";
		List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
		if(dbList.size()>0){
			db = dbList.get(0);
			db.setNeirong(neirong);
			db.setXiugairiqi(new Date());
			super.update(db);
		}else{
			pr.setTmpData("1");
			pr.setPid(pr.getId());
			pr.setId(null);
			super.save(pr);
			db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(pr.getId());
			db.setType("设备");
			db.setTjstate("0");
			db.setOrgan_code(pr.getQuhuadaima());
			db.setQiyetijiao("1");
			TShuJuShenHe sj = new TShuJuShenHe();
			sj.setNeirong(neirong);
			sj.setDataId(pr.getId());
			sj.setOrgan_code(pr.getQuhuadaima());
			sj.setTijiaoren(user.getName());
			sj.setTijiaoren_loginId(user.getLoginId());
			sj.setTijiaoriqi(new Date());
			sj.setType("设备");
			sj.setShenheleixing("信息变更");
			sj.setShstate("0");
			sj.setDbId(super.saveReturnId(db));
			super.save(sj);
		}
	}
	//修改设备信息压力管道
	public void updateByYLGD(TPressurePipingParam piping,String tjstate,TUser user,String address,String dbid,TPressurePipingParam oldPi){
		String neirong = piping.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+piping.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+piping.getZhucedaima()+
		"&nbsp;&nbsp;&nbsp;"+piping.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+piping.getShi()+"&nbsp;&nbsp;&nbsp;"+piping.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(piping.getXiacijianyanriqi(), "yyyy-MM-dd");

		TDaiBanShiXiang db = null;
		String hql = "from TDaiBanShiXiang where dataId = '"+piping.getId()+"' and qiyetijiao is not null and xiugairen_loginId = '"+user.getLoginId()+"' and type = '设备'";
		List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
		if(dbList.size()>0){
			db = dbList.get(0);
			db.setNeirong(neirong);
			db.setXiugairiqi(new Date());
			super.update(db);
		}else{
			piping.setTmpData("1");
			piping.setPid(piping.getId());
			piping.setId(null);
			super.save(piping);
			db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(piping.getId());
			db.setType("设备");
			db.setTjstate("0");
			db.setOrgan_code(piping.getQuhuadaima());;
			db.setQiyetijiao("1");

			TShuJuShenHe sj = new TShuJuShenHe();
			sj.setNeirong(neirong);
			sj.setDataId(piping.getId());
			sj.setOrgan_code(piping.getQuhuadaima());
			sj.setTijiaoren(user.getName());
			sj.setTijiaoren_loginId(user.getLoginId());
			sj.setTijiaoriqi(new Date());
			sj.setType("设备");
			sj.setShenheleixing("信息变更");
			sj.setShstate("0");
			sj.setDbId(super.saveReturnId(db));
			super.save(sj);
		}
	}
	//修改设备信息气瓶
	public void updateByQP(TQiPingParam qiping,String tjstate,TUser user,String address,String dbid,TQiPingParam oldQi){
		String neirong = qiping.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+qiping.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+qiping.getDengjizhengbianhao()+
		"&nbsp;&nbsp;&nbsp;"+qiping.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+qiping.getShi()+"&nbsp;&nbsp;&nbsp;"+qiping.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(qiping.getXiacijianyanriqi(), "yyyy-MM-dd");

		TDaiBanShiXiang db = null;
		String hql = "from TDaiBanShiXiang where dataId = '"+qiping.getId()+"' and qiyetijiao is not null and xiugairen_loginId = '"+user.getLoginId()+"' and type = '设备'";
		List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
		if(dbList.size()>0){
			db = dbList.get(0);
			db.setNeirong(neirong);
			db.setXiugairiqi(new Date());
			super.update(db);
		}else{
			qiping.setTmpData("1");
			qiping.setPid(qiping.getId());
			qiping.setId(null);
			super.save(qiping);
			db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(qiping.getId());
			db.setType("设备");
			db.setTjstate("0");
			db.setOrgan_code(qiping.getQuhuadaima());;
			db.setQiyetijiao("1");

			TShuJuShenHe sj = new TShuJuShenHe();
			sj.setNeirong(neirong);
			sj.setDataId(qiping.getId());
			sj.setOrgan_code(qiping.getQuhuadaima());
			sj.setTijiaoren(user.getName());
			sj.setTijiaoren_loginId(user.getLoginId());
			sj.setTijiaoriqi(new Date());
			sj.setType("设备");
			sj.setShenheleixing("信息变更");
			sj.setShstate("0");
			sj.setDbId(super.saveReturnId(db));
			super.save(sj);
		}
	}
	//修改设备信息客运索道
	public void updateByKYSD(TCablewaysParam cable,String tjstate,TUser user,String address,String dbid,TCablewaysParam oldCa){
		String neirong = cable.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+cable.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+cable.getZhucedaima()+
		"&nbsp;&nbsp;&nbsp;"+cable.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+cable.getShi()+"&nbsp;&nbsp;&nbsp;"+cable.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(cable.getXiacijianyanriqi(), "yyyy-MM-dd");

		TDaiBanShiXiang db = null;
		String hql = "from TDaiBanShiXiang where dataId = '"+cable.getId()+"' and qiyetijiao is not null and xiugairen_loginId = '"+user.getLoginId()+"' and type = '设备'";
		List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
		if(dbList.size()>0){
			db = dbList.get(0);
			db.setNeirong(neirong);
			db.setXiugairiqi(new Date());
			super.update(db);
		}else{
			cable.setTmpData("1");
			cable.setPid(cable.getId());
			cable.setId(null);
			super.save(cable);
			db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(cable.getId());
			db.setType("设备");
			db.setTjstate("0");
			db.setOrgan_code(cable.getQuhuadaima());
			db.setQiyetijiao("1");
			TShuJuShenHe sj = new TShuJuShenHe();
			sj.setNeirong(neirong);
			sj.setDataId(cable.getId());
			sj.setOrgan_code(cable.getQuhuadaima());
			sj.setTijiaoren(user.getName());
			sj.setTijiaoren_loginId(user.getLoginId());
			sj.setTijiaoriqi(new Date());
			sj.setType("设备");
			sj.setShenheleixing("信息变更");
			sj.setShstate("0");
			sj.setDbId(super.saveReturnId(db));
			super.save(sj);
		}
	}
	//修改设备信息游乐设施
	public void updateByYLSS(TRecreationParam recreat,String tjstate,TUser user,String address,String dbid,TRecreationParam oldRe){
		String neirong = recreat.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+recreat.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+recreat.getZhucedaima()+
		"&nbsp;&nbsp;&nbsp;"+recreat.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+recreat.getShi()+"&nbsp;&nbsp;&nbsp;"+recreat.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(recreat.getXiacijianyanriqi(), "yyyy-MM-dd");

		TDaiBanShiXiang db = null;
		String hql = "from TDaiBanShiXiang where dataId = '"+recreat.getId()+"' and qiyetijiao is not null and xiugairen_loginId = '"+user.getLoginId()+"' and type = '设备'";
		List<TDaiBanShiXiang> dbList = super.findListByHql(hql);
		if(dbList.size()>0){
			db = dbList.get(0);
			db.setNeirong(neirong);
			db.setXiugairiqi(new Date());
			super.update(db);
		}else{
			recreat.setTmpData("1");
			recreat.setPid(recreat.getId());
			recreat.setId(null);
			super.save(recreat);
			db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(recreat.getId());
			db.setType("设备");
			db.setTjstate("0");
			db.setOrgan_code(recreat.getQuhuadaima());
			db.setQiyetijiao("1");
			TShuJuShenHe sj = new TShuJuShenHe();
			sj.setNeirong(neirong);
			sj.setDataId(recreat.getId());
			sj.setOrgan_code(recreat.getQuhuadaima());
			sj.setTijiaoren(user.getName());
			sj.setTijiaoren_loginId(user.getLoginId());
			sj.setTijiaoriqi(new Date());
			sj.setType("设备");
			sj.setShenheleixing("信息变更");
			sj.setShstate("0");
			sj.setDbId(super.saveReturnId(db));
			super.save(sj);
		}
	}
	//更新待办的信息
	public void updateDbInfo(String neirong,TUser user,String dbid,String state){
		TDaiBanShiXiang db = (TDaiBanShiXiang)super.findById(Long.parseLong(dbid),TDaiBanShiXiang.class.getName());
		if("1".equals(state)){//在待办中提交,直接删除待办信息
	//		super.delete(dbid,TDaiBanShiXiang.class.getName());
			db.setTjstate(state);
		}else{
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
		}
		super.update(db);
	}
	//更新seid
	public void updateJyywData(long newId,long oldId,String sbzldm){
		super.updateByHQL("update TEqhide set seid = ? where seid = '"+oldId+"'", new Object[] {newId});
		super.updateByHQL("update TBaseInfo set pid = ? where pid = '"+oldId+"'", new Object[] {newId});
	}
	//导出excel表格
	public void expExcel(String query,OutputStream os,String columns,String chaxunsql) throws UnsupportedEncodingException{
		columns = URLDecoder.decode(columns,"utf-8");
		WritableWorkbook workbook = null;
		String title = "使用单位,注册代码,使用登记证编号,出厂编号,设备种类,设备名称,设备型号,检验日期,下次检验日期,内部编号,报告编号";//标题
		String colName = "shiyongdanwei,zhucedaima,dengjizhengbianhao,chuchangbianhao,shebeizhonglei,shebeimingcheng,shebeixinghao,jianyanjieshuriqi,xiacijianyanriqi,neibubianhao,baogaobianhao";//表列名
		
		try {
			int sheetNum = 1;
			int sheetRowNum = 50000;
			// 创建Excel
			workbook = Workbook.createWorkbook(os);
			// 在Excel中新建一个sheet
			WritableSheet wsheet = workbook.createSheet("列表"+sheetNum, sheetNum-1);
	
			// 根据标题列数设置每列宽度
			String[] titles = title.split(",");
			for (int i = 0; i < titles.length; i++) {
				wsheet.setColumnView(i, 20);
			}
			// 标题字体
			WritableFont font = new WritableFont(WritableFont.ARIAL, 12,
					WritableFont.BOLD, false,
					jxl.format.UnderlineStyle.NO_UNDERLINE,
					jxl.format.Colour.BLACK);
			WritableCellFormat formatTitle = new WritableCellFormat(font);
			// 标题设置		
			for (int i = 0; i < titles.length; i++) {
				Label wlabel = new Label(i, 0, String.valueOf(titles[i]), formatTitle);
				wsheet.addCell(wlabel);
			}
			// 内容字体
			font = new jxl.write.WritableFont(WritableFont.createFont("宋体"),
					12, WritableFont.NO_BOLD, false,
					jxl.format.UnderlineStyle.NO_UNDERLINE,
					jxl.format.Colour.BLACK);
			WritableCellFormat format = new jxl.write.WritableCellFormat(font);
	
			if(chaxunsql != ""){
				query = "select "+ colName+ " from BIZ_SE t  left outer join BIZ_BOILERPARAM gl  on t.id=gl.BoilerID " +
						" left outer join BIZ_CABLEWAYS_PARAM sd on t.id=sd.CablewaysID " +
						" left outer join  BIZ_CRANEPARAM qz  on t.id=qz.craneId " +
						" left outer join BIZ_ElEVATORPARAM dt  on t.id=dt.elevatorId " +
						" left outer join BIZ_PRESSURE_PIPING_PARAM gd  on t.id=gd.PressurePipingID " +
						" left outer join  BIZ_PRESSURE_VESSELS_PARAM ylrq on t.id=ylrq.PressureVesselsID " +
						" left outer join BIZ_RECREATION_PARAM ylss  on t.id=ylss.RecreationID " +
						" left outer join BIZ_VESSELPARAM rqcl on t.id=rqcl.vesselId " +
						" where t.tmpData='0' and t.eqhide = '0' and ( t.zcstatus = '1' or t.zcstatus = '0' ) "+chaxunsql ;
				
			}else{
				query = "select "+ colName+ " " + query.replace("TBaseInfoSearch", "biz_se").replace("DwUserSE","sys_se_dwuser")
					.replace("seId","SE_ID").replace("userId","USER_ID");
			}
			
			
			List<HashMap<String,Object>> list = super.findListBySql(query);
			String v = "";
			int nowSheetNum = 0;
			for(int i = 0;i<list.size();i++){
				if(i%sheetRowNum == 0 && i>0){
					sheetNum++;
					wsheet = workbook.createSheet("列表"+sheetNum, sheetNum-1);
					for (int si = 0; si < titles.length; si++) {
						wsheet.setColumnView(si, 20);
					}
					for (int si = 0; si < titles.length; si++) {
						Label wlabel = new Label(si, 0, String.valueOf(titles[si]), formatTitle);
						wsheet.addCell(wlabel);
					}
					nowSheetNum = i;
				}
				String[] colNameArr = colName.split(",");
				String colNameTrue = "";
				HashMap<String,Object> m = list.get(i);
				for(int c = 0;c<colNameArr.length;c++){
					v = "";
					if(colNameArr[c].indexOf(" as ")>0){
						colNameTrue = colNameArr[c].split(" as ")[1];
					}else{
						colNameTrue = colNameArr[c];
					}
					if ((m.get(colNameTrue) instanceof Date)) {
						v = DateFormatTool.format((Date) m.get(colNameTrue), false);
					} else {
						v = m.get(colNameTrue) == null ? "" : m.get(colNameTrue).toString();
						if("zcstatus".equals(colNameTrue)){
							if(!"".equals(v)){
								switch (Integer.parseInt(v)) {
								case 0:
									v = "在用";
									break;
								case 1:
									v = "在用";
									break;
								case 3:
									v = "已停用";
									break;
								case 5:
									v = "已注销";
									break;
								case 7:
									v = "已报废";
									break;
								default:
									break;
								}
							}
						}
					}
					Label wlabel = new Label(c, (i-nowSheetNum)+1, v, format);
					wsheet.addCell(wlabel);
				}
			}
			// 循环记录放入Excel
		/*	for (int i = 0; i < list.size(); i++) {
				Label wlabel1 = new Label(0, i+1, list.get(i).getZhucedaima() , format);
				wsheet.addCell(wlabel1);
				Label wlabel2 = new Label(1, i+1, list.get(i).getDengjizhengbianhao() , format);
				wsheet.addCell(wlabel2);
				Label wlabel3 = new Label(2, i+1, list.get(i).getShebeimingcheng() , format);
				wsheet.addCell(wlabel3);
				Label wlabel4 = new Label(3, i+1, list.get(i).getShiyongdanwei() , format);
				wsheet.addCell(wlabel4);
				Label wlabel5 = new Label(4, i+1, list.get(i).getShiyongdanwei_dizhi() , format);
				wsheet.addCell(wlabel5);
				Label wlabel6 = new Label(5, i+1, list.get(i).getQuhuamingcheng() , format);
				wsheet.addCell(wlabel6);
				Label wlabel7 = new Label(6, i+1, null == list.get(i).getJianyanjieshuriqi() ? "" : DateFormatTool.formate(list.get(i).getJianyanjieshuriqi(),"yyyy-MM-dd") , format);
				wsheet.addCell(wlabel7);
				Label wlabel8 = new Label(7, i+1, null == list.get(i).getXiacijianyanriqi() ? "" : DateFormatTool.formate(list.get(i).getXiacijianyanriqi(), "yyyy-MM-dd") , format);
				wsheet.addCell(wlabel8);
				Label wlabel9 = new Label(8, i+1, list.get(i).getShiyongdanwei_lianxiren() , format);
				wsheet.addCell(wlabel9);
				Label wlabel10 = new Label(9, i+1, list.get(i).getShiyongdanwei_lianxidianhua() , format);
				wsheet.addCell(wlabel10);
			}*/
			workbook.write();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(null != workbook){
				try {
					workbook.close();
				} catch (WriteException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(null != os){
				try {
					os.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	//批量修改维保单位
	public void updWbdwByIds(String ids,String mingcheng,String dianhua,TUser user,TOrgan organ,String lianxiren){
		String hql = "update TBaseInfo set weihubaoyangdanwei = '"+mingcheng+"',weihubaoyangdanwei_dianhua = '"+
				dianhua+"',weihubaoyangdanwei_lianxiren = '"+lianxiren+"' where id in ("+ids+")";
		super.updateByHql(hql);
		
		TDaiBanShiXiang db = null;
		String neirong = "";
		List<TBaseInfoSearch> list = super.findListByHql("from TBaseInfoSearch where id in ("+ids+")");
		for(TBaseInfoSearch b : list){
			db = new TDaiBanShiXiang();
			neirong = "注册代码为"+b.getZhucedaima()+"的设备修改了维保单位信息";
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(b.getId());
			db.setType("设备");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
		}
	}
	//批量修改产权单位
	public void updCqdwByIds(String ids,String mingcheng,String dizhi,String daima,TUser user,TOrgan organ){
		String hql = "update TBaseInfo set chanquandanwei = '"+mingcheng+"',chanquandanwei_dizhi = '"+dizhi+"'" +
				",chanquandanwei_daima = '"+daima+"' where id in ("+ids+")";
		super.updateByHql(hql);

		TDaiBanShiXiang db = null;
		String neirong = "";
		List<TBaseInfoSearch> list = super.findListByHql("from TBaseInfoSearch where id in ("+ids+")");
		for(TBaseInfoSearch b : list){
			db = new TDaiBanShiXiang();
			neirong = "注册代码为"+b.getZhucedaima()+"的设备修改了产权单位信息";
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(b.getId());
			db.setType("设备");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
		}
	}
	//验证使用单位是否存在
	public void selectSydw(TBaseInfo b){
		String hql = "";
		if(b.getXiangzhendaima() == null){
			hql = "from TSyUtils where dwmc = '"+b.getShiyongdanwei()+"' and shidaima = '"+b.getShidaima()+"' and quxiandaima = '"+b.getQuhuadaima()+"' " +
			  " and xiangzhendaima is null	";
		}else{
			hql = "from TSyUtils where dwmc = '"+b.getShiyongdanwei()+"' and shidaima = '"+b.getShidaima()+"' and quxiandaima = '"+b.getQuhuadaima()+"' " +
			  " and xiangzhendaima ='"+b.getXiangzhendaima()+"'	";
		}
		
		List<TSyUtils> syList = super.findListByHql(hql);
		if(syList.size()==0){
			//新建单位
			TSyUtils sy = new TSyUtils();
			sy.setDwdz(b.getShiyongdanwei_dizhi());
			sy.setDwmc(b.getShiyongdanwei());
			sy.setJgdm(b.getShiyongdanwei_code());
			sy.setFlag("0");
			sy.setTmpData("0");
			sy.setQuxian(b.getQuhuamingcheng());
			sy.setQuxiandaima(b.getQuhuadaima());
			sy.setXiangzhen(b.getXiangzhen());
			sy.setXiangzhendaima(b.getXiangzhendaima());
			sy.setShi(b.getShi());
			sy.setShidaima(b.getShidaima());
			b.setShiyongdanweiId(super.saveReturnId(sy));
			
		}else{
			b.setShiyongdanweiId(syList.get(0).getId());
		}
	}
	
	public List<Map> getSeListByUser(TOrgan organ){
		StringBuilder sb = new StringBuilder("select ");
		List<Map> list = new ArrayList<Map>();
		Map<String,String> map = null;
		String code = organ.getCode();
		String hql = "";
		if(organ.getCode().length() == 2){
			hql = "from TDicData where code like '"+organ.getCode()+"%' and parentId is null order by code";
		}else{
			hql = "from TDicData where parentId = (select id from TDicData where code = '"+code+"') order by code";
		}
		List<TDicData> organList = super.findListByHql(hql);
		int count = 0;
		String num = "0";
		String sql = " from biz_se where chongfu='0' " +
	       " and zfstate = '0' and tmpdata = '0' and eqhide='0' and (zcstatus = '0' or zcstatus = '1' or zcstatus = '3') and shebeizhongleidaima <> '8000' ";
		String citySql = "";
		TDicData og = null;
		for(int i = 0;i<organList.size();i++){
			og = organList.get(i);
			if(code.length() == 2){//省级用户
				citySql = "sum(case shidaima when '"+og.getCode()+"' then 1 else 0 end) as num"+i;
			}else if(code.length() == 4){//市级用户
				citySql = "sum(case quhuadaima when '"+og.getCode()+"' then 1 else 0 end) as num"+i;
			}else if(code.length() == 6){//县级用户
				citySql = "sum(case xiangzhendaima when '"+og.getCode()+"' then 1 else 0 end) as num"+i;
			}
			sb.append(citySql);
			if((i+1) != organList.size()){
				sb.append(",");
			}
		}
		sb.append(sql);
		List<HashMap<String,Object>> listNum = super.findListBySql(sb.toString());
		Object obj = null;
		for(int i = 0;i<organList.size();i++){
			og = organList.get(i);
			map = new HashMap<String,String>();
			map.put("name", og.getName());
			map.put("jingdu", "");
			map.put("weidu","");
			if(og.getCode().length() == 4){
				List<TOrgan> ogList = super.findListByHql("from TOrgan where notes = '"+og.getName()+"'");
				if(ogList.size()>0){
					map.put("jingdu", ogList.get(0).getJingdu());
					map.put("weidu",ogList.get(0).getWeidu());
				}
			}
			obj = listNum.get(0).get("num"+i);
			if(null == obj){
				map.put("num", "0");
			}else{
				num = obj.toString();
				map.put("num", num);
			}
			list.add(map);
			count += Integer.parseInt(num);
		}
		map = new HashMap<String,String>();
		map.put("name", "总数");
		map.put("num", count+"");
		map.put("jingdu", "");
		map.put("weidu","");
		list.add(0,map);
		return list;
	}
	
	
	/**
	 * 根据code查找name
	 * @param code
	 * @return
	 */
	public String getNameByCode(String code){
		String name = "";
		List<TDicData> list = super.findListByHql("from TDicData where code = '"+code+"'");
		if(list.size()>0){
			name = list.get(0).getName();
		}
		return name;
	}
	
	
	/**
	 * 批量修改区县
	 * 1 判断使用单位是否存在
	 * @param ids
	 * @param baseInfo
	 */
	public void updPLXGQX(String ids,TBaseInfo baseInfo,TUser user,TOrgan organ){
		//查询出 修改的所有设备
		List<TBaseInfo> baseList = super.findListByHql(" from TBaseInfo t where t.id in ("+ids+")");
		TDaiBanShiXiang db = null;
		String neirong = "";
		if(baseList.size() > 0){
			//判断使用单位是否存在
			TSyUtils syUtils = this.createSYDW(baseList.get(0).getShiyongdanwei().toString(),baseInfo);
			for(TBaseInfo se : baseList){
				neirong = "注册代码为"+se.getZhucedaima()+"的设备乡镇修改为"+syUtils.getXiangzhen()+
				"("+se.getXiangzhen()+"),区划修改为"+syUtils.getQuxian()+"("+se.getQuhuamingcheng()+"),所在市修改为"+syUtils.getShi()+"("+se.getShi()+")";
				se.setShiyongdanweiId(syUtils.getId());
				se.setShi(syUtils.getShi());
				se.setShidaima(syUtils.getShidaima());
				se.setQuhuadaima(syUtils.getQuxiandaima());
				se.setQuhuamingcheng(syUtils.getQuxian());
				se.setXiangzhen(syUtils.getXiangzhen());
				se.setXiangzhendaima(syUtils.getXiangzhendaima());
				
				db = new TDaiBanShiXiang();
				db.setNeirong(neirong.replace("null",""));
				db.setXiugairen(user.getName());
				db.setXiugairiqi(new Date());
				db.setXiugairen_loginId(user.getLoginId());
				db.setDataId(se.getId());
				db.setType("设备");
				db.setTjstate("1");
				db.setOrgan_code(organ.getCode());
				super.save(db);
				
				super.update(se);
			}
		}
	}
	/**
	 * 批量修改设备类别
	 * @param ids
	 * @param baseInfo
	 */
	public void updPLXGSBLB(String ids,String sblbdm,String sblb,TUser user,TOrgan organ){
		//查询出 修改的所有设备
		List<TBaseInfo> baseList = super.findListByHql(" from TBaseInfo t where t.id in ("+ids+")");
		TDaiBanShiXiang db = null;
		String neirong = "";
		for(TBaseInfo se : baseList){
			neirong = "注册代码为"+se.getZhucedaima()+"的设备,设备类别修改为"+sblb+"("+se.getShebeileibie()+")";;
			se.setShebeileibie(sblb);
			se.setShebeileibiedaima(sblbdm);
			
			db = new TDaiBanShiXiang();
			db.setNeirong(neirong.replace("null",""));
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(se.getId());
			db.setType("设备");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
			
			super.update(se);
		}
	}
	
	
	/**
	 * 批量修改单位信息
	 * 1 使用单位  判断此单位是否存在 不存在创建单位
	 * 2 判断 信息是否有值 如果没有不更改
	 * @param ids
	 * @param sydw
	 * @param cqdw
	 * @param cqdwdz
	 * @param cqdwdm
	 * @param wbdw
	 * @param wbdh
	 * @param aqr
	 * @param aqdh
	 * @param biangengriqi
	 */
	public void updPLXGDW(String ids,TBaseInfo info,TUser user,TOrgan organ){
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
		List<TBaseInfo> seList = super.findListByHql(" from TBaseInfo t where t.id in ("+ids+") ");
		TSyUtils syUtils = null;
		if(!"".equals(info.getShiyongdanwei())){ //创建使用单位
			syUtils = this.createSYDW(info.getShiyongdanwei(),seList.get(0));
		}
		TDaiBanShiXiang db = null;
		String neirong = "";
		for(TBaseInfo base : seList){
			neirong = "注册代码为"+base.getZhucedaima()+"的设备修改了";
			if(!"".equals(info.getShiyongdanwei())){
				neirong += "[使用单位]";
				base.setShiyongdanwei(info.getShiyongdanwei());
				base.setShiyongdanweiId(syUtils.getId());
			}
			if(!"".equals(info.getShiyongdanwei_lianxidianhua())){
				neirong += "[使用单位联系电话]";
				base.setShiyongdanwei_lianxidianhua(info.getShiyongdanwei_lianxidianhua());
			}
			if(!"".equals(info.getShiyongdanwei_dizhi())){
				neirong += "[使用单位地址]";
				base.setShiyongdanwei_dizhi(info.getShiyongdanwei_dizhi());
			}
			if(!"".equals(info.getShiyongdanwei_lianxiren())){
				neirong += "[使用单位联系人]";
				base.setShiyongdanwei_lianxiren(info.getShiyongdanwei_lianxiren());
			}
			if(!"".equals(info.getAnquanguanlibumen())){
				neirong += "[安全管理部门]";
				base.setAnquanguanlibumen(info.getAnquanguanlibumen());
			}
			if(!"".equals(info.getAnquanguanlirenyuan())){
				neirong += "[安全管理人员]";
				base.setAnquanguanlirenyuan(info.getAnquanguanlirenyuan());
			}
			if(!"".equals(info.getAnquanguanli_lianxidianhua())){
				neirong += "[安全管理联系电话]";
				base.setAnquanguanli_lianxidianhua(info.getAnquanguanli_lianxidianhua());
			}
			if(!"".equals(info.getChanquandanwei())){
				neirong += "[产权单位]";
				base.setChanquandanwei(info.getChanquandanwei());
			}
			if(!"".equals(info.getChanquandanwei_dizhi())){
				neirong += "[产权单位地址]";
				base.setChanquandanwei_dizhi(info.getChanquandanwei_dizhi());
			}
			if(!"".equals(info.getChanquandanwei_daima())){
				neirong += "[产权单位代码]";
				base.setChanquandanwei_daima(info.getChanquandanwei_daima());
			}
			if(!"".equals(info.getWeihubaoyangdanwei())){
				neirong += "[维保单位]";
				base.setWeihubaoyangdanwei(info.getWeihubaoyangdanwei());
			}
			if(!"".equals(info.getWeihubaoyangdanwei_dianhua())){
				neirong += "[维保单位电话]";
				base.setWeihubaoyangdanwei_dianhua(info.getWeihubaoyangdanwei_dianhua());
			}
			if(!"".equals(info.getFadingdaibiaoren())){
				neirong += "[使用单位法人]";
				base.setFadingdaibiaoren(info.getFadingdaibiaoren());
			}
			if(!"".equals(info.getFrdb_dianhua())){
				neirong += "[使用单位法人电话]";
				base.setFrdb_dianhua(info.getFrdb_dianhua());
			}
			if(!"".equals(info.getChanquandanwei_farendaibiao())){
				neirong += "[产权单位法人]";
				base.setChanquandanwei_farendaibiao(info.getChanquandanwei_farendaibiao());
			}
			if(!"".equals(info.getCqdw_frdbdh())){
				neirong += "[产权单位法人电话]";
				base.setCqdw_frdbdh(info.getCqdw_frdbdh());
			}
			if(!"".equals(info.getWeihubaoyangdanwei_lianxiren())){
				neirong += "[维保单位联系人]";
				base.setWeihubaoyangdanwei_lianxiren(info.getWeihubaoyangdanwei_lianxiren());
			}
			if(!"".equals(info.getWhbydw_zizhizhengshu())){
				neirong += "[维保单位资质证书]";
				base.setWhbydw_zizhizhengshu(info.getWhbydw_zizhizhengshu());
			}

			db = new TDaiBanShiXiang();
			db.setNeirong(neirong+"信息");
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(base.getId());
			db.setType("设备");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
			super.update(base);
		}
	}
	
	/**
	 * 判断使用单位是否存在
	 * 如果没有创建一个使用单位
	 * @param baseInfo
	 * @return
	 */
	public TSyUtils createSYDW(TBaseInfo baseInfo){
		TSyUtils syUtils = null;
		if("".equals(baseInfo.getXiangzhendaima())){
			syUtils = (TSyUtils) super.findSingletonByHql(" from TSyUtils t where t.dwmc= '"+baseInfo.getShiyongdanwei()+"' " +
					" and t.shidaima = '"+baseInfo.getShidaima()+"'  and t.quxiandaima = '"+baseInfo.getQuhuadaima()+"'  " +
					" and t.xiangzhendaima is null and t.tmpData = '0' ");
		}else{
			syUtils = (TSyUtils) super.findSingletonByHql(" from TSyUtils t where t.dwmc= '"+baseInfo.getShiyongdanwei()+"' " +
					" and t.shidaima = '"+baseInfo.getShidaima()+"'  and t.quxiandaima = '"+baseInfo.getQuhuadaima()+"'  " +
					" and t.xiangzhendaima = '"+baseInfo.getXiangzhendaima()+"' and  t.tmpData = '0' ");
		}
		
		if(syUtils == null){ //判断单位是否存在
			syUtils = new TSyUtils();
			syUtils.setTmpData("0");
			syUtils.setFlag("0");
			syUtils.setShi(this.getNameByCode(baseInfo.getShidaima()));
			syUtils.setShidaima(baseInfo.getShidaima());
			syUtils.setQuxian(this.getNameByCode(baseInfo.getQuhuadaima()));
			syUtils.setQuxiandaima(baseInfo.getQuhuadaima());
			syUtils.setXiangzhen(this.getNameByCode(baseInfo.getXiangzhendaima()));
			syUtils.setXiangzhendaima(baseInfo.getXiangzhendaima());
			syUtils.setDwmc(baseInfo.getShiyongdanwei());
			
			syUtils.setDwdz(baseInfo.getShiyongdanwei_dizhi());
			syUtils.setJgdm(baseInfo.getShiyongdanwei_code());
			super.save(syUtils);
		}
		return syUtils;
	}
	
	/**
	 * 创建使用单方法
	 * @param sydw
	 * @param base
	 * @return
	 */
	public TSyUtils createSYDW(String sydw,TBaseInfo base){
		String hql = "";
		if(base.getXiangzhendaima() == null || "".equals(base.getXiangzhendaima())){
			hql = "from TSyUtils where dwmc = '"+sydw.trim()+"' and shidaima = '"+base.getShidaima()+"' and quxiandaima = '"+base.getQuhuadaima()+"' " +
			  " and xiangzhendaima is null and tmpData = '0'	";
		}else{
			hql = "from TSyUtils where dwmc = '"+sydw.trim()+"' and shidaima = '"+base.getShidaima()+"' and quxiandaima = '"+base.getQuhuadaima()+"' " +
			  " and xiangzhendaima ='"+base.getXiangzhendaima()+"' and tmpData = '0'	";
		}
		
		
		TSyUtils syUtils = (TSyUtils) super.findSingletonByHql(hql);
		if(syUtils == null){ //判断单位是否存在
			syUtils = new TSyUtils();
			syUtils.setTmpData("0");
			syUtils.setFlag("0");
			syUtils.setShi(this.getNameByCode(base.getShidaima()));
			syUtils.setShidaima(base.getShidaima());
			syUtils.setQuxian(this.getNameByCode(base.getQuhuadaima()));
			syUtils.setQuxiandaima(base.getQuhuadaima());
			syUtils.setXiangzhen(this.getNameByCode(base.getXiangzhendaima()));
			syUtils.setXiangzhendaima(base.getXiangzhendaima());
			syUtils.setDwmc(sydw.trim());
			
			syUtils.setDwdz(base.getShiyongdanwei_dizhi());
			syUtils.setJgdm(base.getShiyongdanwei_code());
			super.save(syUtils);
		}
		return syUtils;
	}
	
	/**
	 * 创建使用单方法(批量修改单位信息使用)
	 * @param sydw
	 * @param base
	 * @return
	 */
	public TSyUtils createSYDW(TBaseInfo info,TBaseInfo base){
		String hql = "";
		if(base.getXiangzhendaima() == null || "".equals(base.getXiangzhendaima())){
			hql = "from TSyUtils where dwmc = '"+info.getShiyongdanwei().trim()+"' and shidaima = '"+base.getShidaima()+"' and quxiandaima = '"+base.getQuhuadaima()+"' " +
			  " and xiangzhendaima is null and tmpData = '0'	";
		}else{
			hql = "from TSyUtils where dwmc = '"+info.getShiyongdanwei().trim()+"' and shidaima = '"+base.getShidaima()+"' and quxiandaima = '"+base.getQuhuadaima()+"' " +
			  " and xiangzhendaima ='"+base.getXiangzhendaima()+"' and tmpData = '0'	";
		}
		
		
		TSyUtils syUtils = (TSyUtils) super.findSingletonByHql(hql);
		if(syUtils == null){ //判断单位是否存在
			syUtils = new TSyUtils();
			syUtils.setTmpData("0");
			syUtils.setFlag("0");
			syUtils.setShi(this.getNameByCode(base.getShidaima()));
			syUtils.setShidaima(base.getShidaima());
			syUtils.setQuxian(this.getNameByCode(base.getQuhuadaima()));
			syUtils.setQuxiandaima(base.getQuhuadaima());
			syUtils.setXiangzhen(this.getNameByCode(base.getXiangzhendaima()));
			syUtils.setXiangzhendaima(base.getXiangzhendaima());
			syUtils.setDwmc(info.getShiyongdanwei().trim());
			
			syUtils.setDwdz(base.getShiyongdanwei_dizhi());
			syUtils.setJgdm(base.getShiyongdanwei_code());
			super.save(syUtils);
		}
		return syUtils;
	}
	
	
	/**
	 * 验证注册代码是否重复
	 * 1 只验证在用  zcstatus='1' 或  zcstatus = '3'
	 * @param id
	 * @param code
	 * @return
	 */
	public int findSeCode(String id,String code){
		
		String hql = "select zhucedaima from TBaseInfoSearch t where ( t.zcstatus = '1' or t.zcstatus = '3' ) " +
				" and t.zhucedaima = '"+code+"' and t.tmpData = '0' ";
		if(id != ""){
			hql += "  and t.id !="+id;
		}
		return super.findListByHql(hql).size();
	}
	
	
	
	
	/*************************************************************************************************/
	//修改设备信息锅炉
	public void updateByGL(TBoilerParam bo,String tjstate,TUser user,TOrgan organ){
		String neirong = bo.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+bo.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+bo.getZhucedaima()+"&nbsp;&nbsp;&nbsp;"+bo.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+bo.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(bo.getXiacijianyanriqi(), "yyyy-MM-dd");
		if("1".equals(tjstate)){//若点击提交按钮  则直接修改   要向待办区中写入数据
			TBoilerParam boClone = bo;
			boClone.setPid(bo.getId());
			boClone.setId(null);
			boClone.setTmpData("1");
			
			super.save(boClone);
			TDaiBanShiXiang db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(boClone.getId());
			db.setType("设备");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
		}else{//若不点击提交按钮  则要向待办区中写入数据
				TDaiBanShiXiang db = null;
				
				bo.setTmpData("1");
				
				bo.setId(null);
				super.save(bo);
				bo.setPid(bo.getId());
				super.update(bo);
				db = new TDaiBanShiXiang();
				db.setNeirong(neirong);
				db.setXiugairen(user.getName());
				db.setXiugairiqi(new Date());
				db.setXiugairen_loginId(user.getLoginId());
				db.setDataId(bo.getId());
				db.setType("设备");
				db.setTjstate("0");
				db.setOrgan_code(organ.getCode());
				super.save(db);
				
		}
	}
	
	
	//修改设备信息锅炉
	public void updateByYLRQ(TPressureVesselsParam bo,String tjstate,TUser user,TOrgan organ){
		String neirong = bo.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+bo.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+bo.getZhucedaima()+"&nbsp;&nbsp;&nbsp;"+bo.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+bo.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(bo.getXiacijianyanriqi(), "yyyy-MM-dd");
		if("1".equals(tjstate)){//若点击提交按钮  则直接修改   要向待办区中写入数据
			TPressureVesselsParam boClone = bo;
			boClone.setPid(bo.getId());
			boClone.setId(null);
			boClone.setTmpData("1");
			
			super.save(boClone);
			TDaiBanShiXiang db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(boClone.getId());
			db.setType("设备");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
		}else{//若不点击提交按钮  则要向待办区中写入数据
				TDaiBanShiXiang db = null;
				
				bo.setTmpData("1");
				
				bo.setId(null);
				super.save(bo);
				bo.setPid(bo.getId());
				super.update(bo);
				db = new TDaiBanShiXiang();
				db.setNeirong(neirong);
				db.setXiugairen(user.getName());
				db.setXiugairiqi(new Date());
				db.setXiugairen_loginId(user.getLoginId());
				db.setDataId(bo.getId());
				db.setType("设备");
				db.setTjstate("0");
				db.setOrgan_code(organ.getCode());
				super.save(db);
				
		}
	}
	
	//修改设备信息锅炉
	public void updateByDT(TElevatorParam bo,String tjstate,TUser user,TOrgan organ){
		String neirong = bo.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+bo.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+bo.getZhucedaima()+"&nbsp;&nbsp;&nbsp;"+bo.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+bo.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(bo.getXiacijianyanriqi(), "yyyy-MM-dd");
		if("1".equals(tjstate)){//若点击提交按钮  则直接修改   要向待办区中写入数据
			TElevatorParam boClone = bo;
			boClone.setPid(bo.getId());
			boClone.setId(null);
			boClone.setTmpData("1");
			
			super.save(boClone);
			TDaiBanShiXiang db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(boClone.getId());
			db.setType("设备");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
		}else{//若不点击提交按钮  则要向待办区中写入数据
				TDaiBanShiXiang db = null;
				
				bo.setTmpData("1");
				
				bo.setId(null);
				super.save(bo);
				bo.setPid(bo.getId());
				super.update(bo);
				db = new TDaiBanShiXiang();
				db.setNeirong(neirong);
				db.setXiugairen(user.getName());
				db.setXiugairiqi(new Date());
				db.setXiugairen_loginId(user.getLoginId());
				db.setDataId(bo.getId());
				db.setType("设备");
				db.setTjstate("0");
				db.setOrgan_code(organ.getCode());
				super.save(db);
				
		}
	}
	
	//修改设备信息锅炉
	public void updateByQZJX(TCraneParam bo,String tjstate,TUser user,TOrgan organ){
		String neirong = bo.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+bo.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+bo.getZhucedaima()+"&nbsp;&nbsp;&nbsp;"+bo.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+bo.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(bo.getXiacijianyanriqi(), "yyyy-MM-dd");
		if("1".equals(tjstate)){//若点击提交按钮  则直接修改   要向待办区中写入数据
			TCraneParam boClone = bo;
			boClone.setPid(bo.getId());
			boClone.setId(null);
			boClone.setTmpData("1");
			
			super.save(boClone);
			TDaiBanShiXiang db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(boClone.getId());
			db.setType("设备");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
		}else{//若不点击提交按钮  则要向待办区中写入数据
				TDaiBanShiXiang db = null;
				
				bo.setTmpData("1");
				
				bo.setId(null);
				super.save(bo);
				bo.setPid(bo.getId());
				super.update(bo);
				db = new TDaiBanShiXiang();
				db.setNeirong(neirong);
				db.setXiugairen(user.getName());
				db.setXiugairiqi(new Date());
				db.setXiugairen_loginId(user.getLoginId());
				db.setDataId(bo.getId());
				db.setType("设备");
				db.setTjstate("0");
				db.setOrgan_code(organ.getCode());
				super.save(db);
				
		}
	}
	
	//修改设备信息锅炉
	public void updateByYLSS(TRecreationParam bo,String tjstate,TUser user,TOrgan organ){
		String neirong = bo.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+bo.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+bo.getZhucedaima()+"&nbsp;&nbsp;&nbsp;"+bo.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+bo.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(bo.getXiacijianyanriqi(), "yyyy-MM-dd");
		if("1".equals(tjstate)){//若点击提交按钮  则直接修改   要向待办区中写入数据
			TRecreationParam boClone = bo;
			boClone.setPid(bo.getId());
			boClone.setId(null);
			boClone.setTmpData("1");
			
			super.save(boClone);
			TDaiBanShiXiang db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(boClone.getId());
			db.setType("设备");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
		}else{//若不点击提交按钮  则要向待办区中写入数据
				TDaiBanShiXiang db = null;
				
				bo.setTmpData("1");
				
				bo.setId(null);
				super.save(bo);
				bo.setPid(bo.getId());
				super.update(bo);
				db = new TDaiBanShiXiang();
				db.setNeirong(neirong);
				db.setXiugairen(user.getName());
				db.setXiugairiqi(new Date());
				db.setXiugairen_loginId(user.getLoginId());
				db.setDataId(bo.getId());
				db.setType("设备");
				db.setTjstate("0");
				db.setOrgan_code(organ.getCode());
				super.save(db);
				
		}
	}
	
	//修改设备信息锅炉
	public void updateByYLGD(TPressurePipingParam bo,String tjstate,TUser user,TOrgan organ){
		String neirong = bo.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+bo.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+bo.getZhucedaima()+"&nbsp;&nbsp;&nbsp;"+bo.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+bo.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(bo.getXiacijianyanriqi(), "yyyy-MM-dd");
		if("1".equals(tjstate)){//若点击提交按钮  则直接修改   要向待办区中写入数据
			TPressurePipingParam boClone = bo;
			boClone.setPid(bo.getId());
			boClone.setId(null);
			boClone.setTmpData("1");
			
			super.save(boClone);
			TDaiBanShiXiang db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(boClone.getId());
			db.setType("设备");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
		}else{//若不点击提交按钮  则要向待办区中写入数据
				TDaiBanShiXiang db = null;
				
				bo.setTmpData("1");
				
				bo.setId(null);
				super.save(bo);
				bo.setPid(bo.getId());
				super.update(bo);
				db = new TDaiBanShiXiang();
				db.setNeirong(neirong);
				db.setXiugairen(user.getName());
				db.setXiugairiqi(new Date());
				db.setXiugairen_loginId(user.getLoginId());
				db.setDataId(bo.getId());
				db.setType("设备");
				db.setTjstate("0");
				db.setOrgan_code(organ.getCode());
				super.save(db);
				
		}
	}
	
	//修改设备信息锅炉
	public void updateByKYSD(TCablewaysParam bo,String tjstate,TUser user,TOrgan organ){
		String neirong = bo.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+bo.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+bo.getZhucedaima()+"&nbsp;&nbsp;&nbsp;"+bo.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+bo.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(bo.getXiacijianyanriqi(), "yyyy-MM-dd");
		if("1".equals(tjstate)){//若点击提交按钮  则直接修改   要向待办区中写入数据
			TCablewaysParam boClone = bo;
			boClone.setPid(bo.getId());
			boClone.setId(null);
			boClone.setTmpData("1");
			
			super.save(boClone);
			TDaiBanShiXiang db = new TDaiBanShiXiang();
			db.setNeirong(neirong);
			db.setXiugairen(user.getName());
			db.setXiugairiqi(new Date());
			db.setXiugairen_loginId(user.getLoginId());
			db.setDataId(boClone.getId());
			db.setType("设备");
			db.setTjstate("1");
			db.setOrgan_code(organ.getCode());
			super.save(db);
		}else{//若不点击提交按钮  则要向待办区中写入数据
				TDaiBanShiXiang db = null;
				
				bo.setTmpData("1");
				
				bo.setId(null);
				super.save(bo);
				bo.setPid(bo.getId());
				super.update(bo);
				db = new TDaiBanShiXiang();
				db.setNeirong(neirong);
				db.setXiugairen(user.getName());
				db.setXiugairiqi(new Date());
				db.setXiugairen_loginId(user.getLoginId());
				db.setDataId(bo.getId());
				db.setType("设备");
				db.setTjstate("0");
				db.setOrgan_code(organ.getCode());
				super.save(db);
				
		}
	}
	
	
	/**
	 * 导出注册登记
	 * @param id
	 */
	public void findDaoChuZcdj(String id,OutputStream os){
		WritableWorkbook workbook = null;
		TBaseInfo report = (TBaseInfo) super.findById(Long.parseLong(id), TBaseInfo.class.getName());
		if("1000".equals(report.getShebeizhongleidaima())){
			zcdjDaoChuGl(workbook,id,os);
		}else if("2000".equals(report.getShebeizhongleidaima())){
			TPressureVesselsParam elevator = (TPressureVesselsParam) super.findById(Long.parseLong(id), TPressureVesselsParam.class.getName());
			
			try {
				// 创建Excel
				workbook = Workbook.createWorkbook(os);
				// 在Excel中新建一个sheet
				WritableSheet wsheet = workbook.createSheet("压力容器", 0);
				//去掉整个sheet中的网格线
				wsheet.getSettings().setShowGridLines(false);
				wsheet.getSettings().setPaperSize(PaperSize.A4);
				wsheet.getSettings().setFitHeight(297) ;                        // 打印区高度
		        wsheet.getSettings().setFitWidth(210) ;                        // 打印区宽度    
		        // 设置边距            
	            wsheet.getSettings().setTopMargin(0.5) ;
	            wsheet.getSettings().setBottomMargin(0.3) ;
	            wsheet.getSettings().setLeftMargin(0.3) ;
	            wsheet.getSettings().setRightMargin(0.3) ;
				
				String[] titles = new String[11];
				for (int i = 0; i < titles.length; i++) {
					if(i==0){
						wsheet.setColumnView(i, 10);
					}else if(i==6 || i==3 || i==4 || i==5 ){
						wsheet.setColumnView(i, 7);
					}else{
						wsheet.setColumnView(i, 10);
					}
				}
				// 标题字体
				WritableFont font = new WritableFont(WritableFont.ARIAL, 15,
						WritableFont.BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);
				WritableCellFormat titleFormat = new WritableCellFormat(font);
				//水平居中对齐
				titleFormat.setAlignment(Alignment.CENTRE);
	            //竖直方向居中对齐
				titleFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
				// 内容字体
				font = new jxl.write.WritableFont(WritableFont.createFont("宋体"),
						11, WritableFont.NO_BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);
				
				WritableCellFormat format = new jxl.write.WritableCellFormat(font);
				format.setAlignment(Alignment.CENTRE);
				format.setVerticalAlignment(VerticalAlignment.CENTRE);
				format.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				format.setWrap(true);
				
				WritableCellFormat formatNoBorder = new jxl.write.WritableCellFormat(font);
				formatNoBorder.setAlignment(Alignment.CENTRE);
				formatNoBorder.setVerticalAlignment(VerticalAlignment.CENTRE);
				formatNoBorder.setWrap(true);

				WritableCellFormat leftFormat= new jxl.write.WritableCellFormat(font);
				leftFormat.setAlignment(Alignment.LEFT);
				leftFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
				leftFormat.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				leftFormat.setWrap(true);
				
				WritableCellFormat rightFormat= new jxl.write.WritableCellFormat(font);
				rightFormat.setAlignment(Alignment.RIGHT);
				rightFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
				rightFormat.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				rightFormat.setWrap(true);
				
				DateFormat date = new DateFormat("yyyy-MM-dd");
				WritableCellFormat format2 = new jxl.write.WritableCellFormat(date);
				format2.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
					Label wlabel0 = new Label(0, 0, "特种设备使用登记表" , titleFormat);
					wsheet.mergeCells(0, 0, 10, 0);
					wsheet.addCell(wlabel0);
					Label wlabeldjlb = new Label(0, 1, "登记类别:" , formatNoBorder);
					wsheet.mergeCells(0, 1, 1, 1);
					wsheet.addCell(wlabeldjlb);
					Label wlabeldjlbv = new Label(2, 1, elevator.getDengjileibie(), formatNoBorder);
					wsheet.mergeCells(2, 1, 5, 1);
					wsheet.addCell(wlabeldjlbv);
					Label wlabelzcdm = new Label(6, 1, "注册代码:" , formatNoBorder);
					wsheet.mergeCells(6, 1, 7, 1);
					wsheet.addCell(wlabelzcdm);
					Label wlabelzcdmv = new Label(8, 1, elevator.getZhucedaima(), formatNoBorder);
					wsheet.mergeCells(8, 1, 10, 1);
					wsheet.addCell(wlabelzcdmv);
					int i = 1;
					Label wlabel1 = new Label(0, i+1, "设备基本情况" , format);
					wsheet.mergeCells(0, i+1, 0, i+5);
					wsheet.addCell(wlabel1);
					Label wlabel2 = new Label(1, i+1, "设备种类" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel2);
					Label wlabel3 = new Label(3, i+1, elevator.getShebeizhonglei() , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel3);
					Label wlabel4 = new Label(7, i+1, "设备类别", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel4);
					Label wlabel5 = new Label(9, i+1, elevator.getShebeileibie(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel5);
					i=2;
					Label wlabel6 = new Label(1, i+1, "设备品种" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel6);
					Label wlabel7 = new Label(3, i+1, elevator.getShebeipinzhong() , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel7);
					Label wlabel8 = new Label(7, i+1, "产品名称", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel8);
					Label wlabel9 = new Label(9, i+1, elevator.getShebeimingcheng(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel9);
					i=3;
					Label wlabel10 = new Label(1, i+1, "设备代码" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel10);
					Label wlabel11 = new Label(3, i+1, elevator.getShebeidaima() , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel11);
					Label wlabel12 = new Label(7, i+1, "设备型号", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel12);
					Label wlabel13 = new Label(9, i+1, elevator.getShebeixinghao(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel13);
					i=4;
					Label wlabel183 = new Label(1, i+1, "压力容器品种" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel183);
					Label wlabel184 = new Label(3, i+1, elevator.getShebeipinzhong() , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel184);
					Label wlabel185 = new Label(7, i+1, "主体结构型式", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel185);
					Label wlabel186 = new Label(9, i+1, elevator.getJiegouxingshi(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel186);
					i=5;
					Label wlabel14 = new Label(1, i+1, "设备使用年限" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel14);
					Label wlabel15 = new Label(3, i+1, elevator.getShebeishiyongnianxian() , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel15);
					Label wlabel16 = new Label(7, i+1, "固定资产值", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel16);
					Label wlabel17 = new Label(9, i+1, elevator.getGudingzichanzhi(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel17);
					i = 6;
					Label wlabel18 = new Label(0, i+1, "设备使用情况" , format);
					wsheet.mergeCells(0, i+1, 0, i+13);
					wsheet.addCell(wlabel18);
					Label wlabel19 = new Label(1, i+1, "使用单位名称" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel19);
					Label wlabel20 = new Label(3, i+1, elevator.getShiyongdanwei() , format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel20);
					i = 7;
					Label wlabel21 = new Label(1, i+1, "使用单位地址", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel21);
					Label wlabel22 = new Label(3, i+1, elevator.getShiyongdanwei_dizhi(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel22);
					i = 8;
					Label wlabel23 = new Label(1, i+1, "机构代码或信用代码", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel23);
					Label wlabel24 = new Label(3, i+1, elevator.getShiyongdanwei_code(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel24);
					Label wlabel25 = new Label(7, i+1, "邮政编码", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel25);
					Label wlabel26 = new Label(9, i+1, elevator.getShiyongdanwei_youbian(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel26);
					i = 9;
					Label wlabel27 = new Label(1, i+1, "单位性质", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel27);
					Label wlabel28 = new Label(3, i+1, elevator.getShiyongdanwei_xingzhi(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel28);
					Label wlabel29 = new Label(7, i+1, "所属行业", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel29);
					Label wlabel30 = new Label(9, i+1, elevator.getShiyongdanwei_suoshuhangye(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel30);
					i = 10;
					Label wlabel31 = new Label(1, i+1, "法定代表人", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel31);
					Label wlabel32 = new Label(3, i+1, elevator.getFadingdaibiaoren(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel32);
					Label wlabel33 = new Label(7, i+1, "安全管理部门", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel33);
					Label wlabel34 = new Label(9, i+1, elevator.getAnquanguanlibumen(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel34);
					i = 11;
					Label wlabel35 = new Label(1, i+1, "安全管理人员", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel35);
					Label wlabel36 = new Label(3, i+1, elevator.getAnquanguanlirenyuan(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel36);
					Label wlabel37 = new Label(7, i+1, "联系电话", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel37);
					Label wlabel38 = new Label(9, i+1, elevator.getAnquanguanli_lianxidianhua(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel38);
					i = 12;
					Label wlabel39 = new Label(1, i+1, "单位内编号", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel39);
					Label wlabel40 = new Label(3, i+1, elevator.getNeibubianhao(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel40);
					Label wlabel41 = new Label(7, i+1, "设备使用地点", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel41);
					Label wlabel42 = new Label(9, i+1, elevator.getShebeididian(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel42);
					i = 13;
					Label wlabel43 = new Label(1, i+1, "使用场所类别", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel43);
					Label wlabel44 = new Label(3, i+1, elevator.getShiyongchangsuo(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel44);
					Label wlabel45 = new Label(7, i+1, "设备地理信息", format);
					wsheet.mergeCells(7, i+1, 7, i+3);
					wsheet.addCell(wlabel45);
					Label wlabel46 = new Label(8, i+1, "经度", format);
					wsheet.addCell(wlabel46);
					Label wlabel47 = new Label(9, i+1, elevator.getJingdu(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel47);
					i = 14;
					Label wlabel48 = new Label(1, i+1, "运行状态", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel48);
					Label wlabel49 = new Label(3, i+1, elevator.getYunxingzhuangtai(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel49);
					Label wlabel50 = new Label(8, i+1, "纬度", format);
					wsheet.addCell(wlabel50);
					Label wlabel51 = new Label(9, i+1, elevator.getWeidu(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel51);
					i = 15;
					Label wlabel52 = new Label(1, i+1, "投入使用日期", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel52);
					Label wlabel53 = new Label(3, i+1, null == elevator.getTouyongriqi_date() ? elevator.getTouyongriqi() : DateFormatTool.formate(elevator.getTouyongriqi_date(), "yyyy-MM-dd") , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel53);
					Label wlabel54 = new Label(8, i+1, "海拔高度", format);
					wsheet.addCell(wlabel54);
					Label wlabel55 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel55);
					i = 16;
					Label wlabel56 = new Label(1, i+1, "产权单位名称", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel56);
					Label wlabel57 = new Label(3, i+1, elevator.getTouyongriqi() , format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel57);
					i = 17;
					Label wlabel58 = new Label(1, i+1, "机构代码或信用代码", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel58);
					Label wlabel59 = new Label(3, i+1, elevator.getChanquandanwei_daima(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel59);
					Label wlabel60 = new Label(7, i+1, "联系电话", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel60);
					Label wlabel61 = new Label(9, i+1, elevator.getChanquandanwei_dianhua(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel61);
					i = 18;
					Label wlabel62 = new Label(1, i+1, "单位性质", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel62);
					Label wlabel63 = new Label(3, i+1, elevator.getChanquandanwei_xingzhi(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel63);
					Label wlabel64 = new Label(7, i+1, "所属行业", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel64);
					Label wlabel65 = new Label(9, i+1, elevator.getChanquandanwei_suoshuhangye(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel65);
					i = 19;
					Label wlabel66 = new Label(0, i+1, "设备制造与监检情况", format);
					wsheet.mergeCells(0, i+1, 0, i+9);
					wsheet.addCell(wlabel66);
					Label wlabel67 = new Label(1, i+1, "制造单位名称", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel67);
					Label wlabel68 = new Label(3, i+1, elevator.getZhizaodanwei(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel68);
					i = 20;
					Label wlabel69 = new Label(1, i+1, "制造许可证编号", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel69);
					Label wlabel70 = new Label(3, i+1, elevator.getZhizaodanweixukezhengbianhao(), format);
					wsheet.mergeCells(3, i+1,6, i+1);
					wsheet.addCell(wlabel70);
					Label wlabel71 = new Label(7, i+1, "产品编号", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel71);
					Label wlabel72 = new Label(9, i+1, elevator.getChuchangbianhao(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel72);
					i = 21;
					Label wlabel73 = new Label(1, i+1, "制造日期", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel73);
					Label wlabel74 = new Label(3, i+1, null == elevator.getZhizaoriqi_date() ? elevator.getZhizaoriqi() : DateFormatTool.formate(elevator.getZhizaoriqi_date(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(3, i+1,6, i+1);
					wsheet.addCell(wlabel74);
					Label wlabel75 = new Label(7, i+1, "产品合格证编号", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel75);
					Label wlabel76 = new Label(9, i+1, elevator.getChanpinhegezhengbianhao(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel76);
					i = 22;
					Label wlabel187 = new Label(1, i+1, "设计单位名称", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel187);
					Label wlabel188 = new Label(3, i+1, elevator.getShejidanwei(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel188);
					i = 23;
					Label wlabel189 = new Label(1, i+1, "设计许可证编号", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel189);
					Label wlabel190 = new Label(3, i+1, elevator.getShejixukezheng(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel190);
					Label wlabel191 = new Label(7, i+1, "产品图号", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel191);
					Label wlabel192 = new Label(9, i+1, elevator.getChanpintuhao(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel192);
					i = 24;
					Label wlabel193 = new Label(1, i+1, "型式试验机构", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel193);
					Label wlabel194 = new Label(3, i+1, elevator.getZhizaojianjianjigou(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel194);
					i = 25;
					Label wlabel195 = new Label(1, i+1, "试验机构核准证编号", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel195);
					Label wlabel196 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel196);
					Label wlabel197 = new Label(7, i+1, "型式试验证书编号", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel197);
					Label wlabel198 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel198);
					i = 26;
					Label wlabel83 = new Label(1, i+1, "制造监检机构", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel83);
					Label wlabel84 = new Label(3, i+1, elevator.getZhizaojianjianjigou(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel84);
					i = 27;
					Label wlabel85 = new Label(1, i+1, "监检机构核准证编号", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel85);
					Label wlabel86 = new Label(3, i+1, elevator.getJianjianhezhunzheng(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel86);
					Label wlabel87 = new Label(7, i+1, "制造监检证书编号", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel87);
					Label wlabel88 = new Label(9, i+1, elevator.getJianjianzhengshubianhao(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel88);
					i = 28;
					Label wlabel89 = new Label(0, i+1, "设备施工情况", format);
					wsheet.mergeCells(0, i+1, 0, i+3);
					wsheet.addCell(wlabel89);
					Label wlabel90 = new Label(1, i+1, "施工单位名称", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel90);
					Label wlabel91 = new Label(3, i+1, elevator.getShigongdanwei(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel91);
					i = 29;
					Label wlabel92 = new Label(1, i+1, "施工许可证编号", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel92);
					Label wlabel93 = new Label(3, i+1, elevator.getShigongdanwei_xukezhengbianhao(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel93);
					Label wlabel94 = new Label(7, i+1, "施工类别", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel94);
					Label wlabel95 = new Label(9, i+1, elevator.getShigongleibie(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel95);
					i = 30;
					Label wlabel96 = new Label(1, i+1, "施工告知日期", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel96);
					Label wlabel97 = new Label(3, i+1, null == elevator.getShigongdanwei_shigongriqi()?"":DateFormatTool.formate(elevator.getShigongdanwei_shigongriqi(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel97);
					Label wlabel98 = new Label(7, i+1, "施工竣工日期", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel98);
					Label wlabel99 = new Label(9, i+1, null == elevator.getShigongdanwei_jungongriqi()?"":DateFormatTool.formate(elevator.getShigongdanwei_jungongriqi(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel99);
					i = 31;
					Label wlabel199 = new Label(0, i+1, "设备工作参数", format);
					wsheet.mergeCells(0, i+1, 0, i+2);
					wsheet.addCell(wlabel199);
					Label wlabel100 = new Label(1, i+1, "工作压力", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel100);
					Label wlabel101 = new Label(3, i+1, elevator.getGongzuoyali(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel101);
					Label wlabel102 = new Label(7, i+1, "工作温度", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel102);
					Label wlabel103 = new Label(9, i+1, elevator.getGongzuowendu(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel103);
					i = 32;
					Label wlabel104 = new Label(1, i+1, "介质", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel104);
					Label wlabel105 = new Label(3, i+1, elevator.getGongzuojiezhi(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel105);
					Label wlabel106 = new Label(7, i+1, "充装量(/额定人数)", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel106);
					Label wlabel107 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel107);
					i = 33;
					Label wlabel108 = new Label(0, i+1, "设备保险情况", format);
					wsheet.mergeCells(0, i+1, 0, i+3);
					wsheet.addCell(wlabel108);
					Label wlabel109 = new Label(1, i+1, "保险机构", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel109);
					Label wlabel110 = new Label(3, i+1, elevator.getBaoxianjigou(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel110);
					i = 34;
					Label wlabel111 = new Label(1, i+1, "保险险种", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel111);
					Label wlabel112 = new Label(3, i+1, elevator.getBaoxianxianzhong(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel112);
					Label wlabel113 = new Label(7, i+1, "保险价值", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel113);
					Label wlabel114 = new Label(9, i+1, elevator.getBaoxianjiazhi(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel114);
					i = 35;
					Label wlabel115 = new Label(1, i+1, "保险费", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel115);
					Label wlabel116 = new Label(3, i+1, elevator.getBaoxianfei(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel116);
					Label wlabel117 = new Label(7, i+1, "保险金额", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel117);
					Label wlabel118 = new Label(9, i+1, elevator.getBaoxianji(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel118);
					i = 36;
					Label wlabel119= new Label(0, i+1, "设备变更情况", format);
					wsheet.mergeCells(0, i+1, 0, i+4);
					wsheet.addCell(wlabel119);
					Label wlabel120 = new Label(1, i+1, "变更项目", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel120);
					Label wlabel121 = new Label(3, i+1, "变更类别", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel121);
					Label wlabel122 = new Label(7, i+1, "变更原因", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel122);
					Label wlabel123 = new Label(9, i+1, "变更日期", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel123);
					i = 37;
					Label wlabel124 = new Label(1, i+1, "", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel124);
					Label wlabel125 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel125);
					Label wlabel126 = new Label(7, i+1, "", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel126);
					Label wlabel127 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel127);
					i = 38;
					Label wlabel128 = new Label(1, i+1, "", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel128);
					Label wlabel129 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel129);
					Label wlabel130 = new Label(7, i+1, "", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel130);
					Label wlabel131 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel131);
					i = 39;
					Label wlabel132 = new Label(1, i+1, "", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel132);
					Label wlabel133 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel133);
					Label wlabel134 = new Label(7, i+1, "", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel134);
					Label wlabel135 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel135);
					i = 40;
					Label wlabel136 = new Label(0, i+1, "设备检验情况", format);
					wsheet.mergeCells(0, i+1, 0, i+4);
					wsheet.addCell(wlabel136);
					Label wlabel137 = new Label(1, i+1, "检验机构", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel137);
					Label wlabel138 = new Label(3, i+1, elevator.getJianyanjigou(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel138);
					i = 41;
					Label wlabel139 = new Label(1, i+1, "机构代码或信用代码", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel139);
					Label wlabel140 = new Label(3, i+1,  elevator.getJianyanjigou_code(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel140);
					Label wlabel141 = new Label(7, i+1, "检验类别", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel141);
					Label wlabel142 = new Label(9, i+1, elevator.getJianyanleixing(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel142);
					i = 42;
					Label wlabel143 = new Label(1, i+1, "检验日期", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel143);
					Label wlabel144 = new Label(3, i+1, null == elevator.getJianyankaishiriqi()?"":DateFormatTool.formate(elevator.getJianyankaishiriqi(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel144);
					Label wlabel145 = new Label(7, i+1, "检验结论", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel145);
					Label wlabel146 = new Label(9, i+1, elevator.getJianyanjielun(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel146);
					i = 43;
					Label wlabel147 = new Label(1, i+1, "检验报告编号", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel147);
					Label wlabel148 = new Label(3, i+1, elevator.getBaogaobianhao(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel148);
					Label wlabel149 = new Label(7, i+1, "下次检验日期", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel149);
					Label wlabel150 = new Label(9, i+1, null == elevator.getXiacijianyanriqi()?"":DateFormatTool.formate(elevator.getXiacijianyanriqi(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel150);
					i = 44;
					Label wlabel161 = new Label(0, i+1, "在此申明：所申报的内容真实；在使用过程中，将严格执行《特种设备安全监察条例》及其相关规定，并接受特种设备安全监督管理部门的监督管理。", leftFormat);
					wsheet.mergeCells(0, i+1, 10, i+2);
					wsheet.setRowView(i+1, 300);
					wsheet.addCell(wlabel161);
					i = 46;
					Label wlabel162 = new Label(0, i+1, "  附：产品数据表", leftFormat);
					wsheet.mergeCells(0, i+1, 10, i+1);
					wsheet.addCell(wlabel162);
					
					i = 47;
					Label wlabel151 = new Label(0, i+1, "使用单位填表人员：", format);
					wsheet.mergeCells(0, i+1, 2, i+1);
					wsheet.setRowView(i+1, 600);
					wsheet.addCell(wlabel151);
					Label wlabel152 = new Label(3, i+1, elevator.getTianbiaorenyuan(), format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel152);
					Label wlabel153 = new Label(5, i+1, "日期：", format);
					wsheet.mergeCells(5, i+1, 6, i+1);
					wsheet.addCell(wlabel153);
					Label wlabel154 = new Label(7, i+1, null== elevator.getTianbiaoriqi()?"":DateFormatTool.formate(elevator.getTianbiaoriqi(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel154);
					Label wlabel163 = new Label(9, i+1, "(使用单位公章或者专用章)", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel163);
					i = 48;
					Label wlabel155 = new Label(0, i+1, "使用单位安全管理人员：", format);
					wsheet.mergeCells(0, i+1, 2, i+1);
					wsheet.addCell(wlabel155);
					Label wlabel156 = new Label(3, i+1, elevator.getAnquanguanlirenyuan(), format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel156);
					Label wlabel157 = new Label(5, i+1, "日期：", format);
					wsheet.mergeCells(5, i+1, 6, i+1);
					wsheet.addCell(wlabel157);
					Label wlabel158 = new Label(7, i+1, "", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel158);
					Label wlabel164 = new Label(9, i+1, "  年   月   日", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel164);
					i = 49;
					Label wlabel159 = new Label(0, i+1, "首次定期检验日期：", format);
					wsheet.mergeCells(0, i+1, 3, i+1);
					wsheet.addCell(wlabel159);
					Label wlabel160 = new Label(4, i+1, "", format);
					wsheet.mergeCells(4, i+1, 10, i+1);
					wsheet.addCell(wlabel160);
					i = 50;
					Label wlabel165 = new Label(0, i+1, "说明：", format);
					wsheet.addCell(wlabel165);
					Label wlabel166 = new Label(1, i+1, elevator.getBeizhu(), format);
					wsheet.mergeCells(1, i+1, 10, i+1);
					wsheet.addCell(wlabel166);
					i = 51;
					Label wlabel167 = new Label(0, i+1, "登记机关登记人员：", format);
					wsheet.mergeCells(0, i+1, 2, i+1);
					wsheet.addCell(wlabel167);
					Label wlabel168 = new Label(3, i+1, elevator.getDj_jingbanren(), format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel168);
					Label wlabel169 = new Label(5, i+1, "日期：", format);
					wsheet.mergeCells(5, i+1, 6, i+1);
					wsheet.addCell(wlabel169);
					Label wlabel170 = new Label(7, i+1, null == elevator.getDj_jingbanriqi()?"":DateFormatTool.formate(elevator.getDj_jingbanriqi(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel170);
					Label wlabel171 = new Label(9, i+1, "登记机关(专用章)", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel171);
					i=52;
					Label wlabel172 = new Label(0, i+1, "   年   月   日", rightFormat);
					wsheet.mergeCells(0, i+1, 10, i+1);
					wsheet.addCell(wlabel172);
					i = 53;
					Label wlabel173 = new Label(0, i+1, "安全状况等级：", format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel173);
					Label wlabel174 = new Label(2, i+1, elevator.getAnquandengji(), format);
					wsheet.addCell(wlabel174);
					Label wlabel200 = new Label(3, i+1, "监管类别：", format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel200);
					Label wlabel201 = new Label(5, i+1, elevator.getJianguanleibie(), format);
					wsheet.mergeCells(5, i+1, 6, i+1);
					wsheet.addCell(wlabel201);
					Label wlabel175 = new Label(7, i+1, "使用登记证编号：", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel175);
					Label wlabel176 = new Label(9, i+1, elevator.getDengjizhengbianhao(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel176);
					i = 54;
					Label wlabel177 = new Label(0, i+1, "市：", format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel177);
					Label wlabel178 = new Label(2, i+1, elevator.getShi(), format);
					wsheet.addCell(wlabel178);
					Label wlabel179 = new Label(3, i+1, "区县：", format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel179);
					Label wlabel180 = new Label(5, i+1, elevator.getQuhuamingcheng(), format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel180);
					Label wlabel181 = new Label(8, i+1, "乡镇：", format);
					wsheet.addCell(wlabel181);
					Label wlabel182 = new Label(9, i+1, elevator.getXiangzhen(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel182);
				workbook.write();
				workbook.close();
				os.close();
			} catch (Exception e) {
				
			}
		}else if("3000".equals(report.getShebeizhongleidaima())){
			TElevatorParam elevator = (TElevatorParam) super.findById(Long.parseLong(id), TElevatorParam.class.getName());
			
			try {
				// 创建Excel
				workbook = Workbook.createWorkbook(os);
				// 在Excel中新建一个sheet
				WritableSheet wsheet = workbook.createSheet("电梯", 0);
				//去掉整个sheet中的网格线
				wsheet.getSettings().setShowGridLines(false);
				wsheet.getSettings().setPaperSize(PaperSize.A4);
				wsheet.getSettings().setFitHeight(297) ;                        // 打印区高度
		        wsheet.getSettings().setFitWidth(210) ;                        // 打印区宽度    
		        // 设置边距            
	            wsheet.getSettings().setTopMargin(0.5) ;
	            wsheet.getSettings().setBottomMargin(0.3) ;
	            wsheet.getSettings().setLeftMargin(0.3) ;
	            wsheet.getSettings().setRightMargin(0.3) ;
	            
				String[] titles = new String[8];
				for (int i = 0; i < titles.length; i++) {
					if(i==0 || i == 1 || i==3 || i==4){
						wsheet.setColumnView(i, 8);
					}else if(i==2 || i==5 ){
						wsheet.setColumnView(i, 16);
					}else{
						wsheet.setColumnView(i, 17);
					}
				}
				
				
				// 标题字体
				WritableFont font = new WritableFont(WritableFont.ARIAL, 12,
						WritableFont.BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);
				WritableCellFormat titleFormat = new WritableCellFormat(font);
				//水平居中对齐
				titleFormat.setAlignment(Alignment.CENTRE);
	            //竖直方向居中对齐
				titleFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
				// 内容字体
				font = new jxl.write.WritableFont(WritableFont.createFont("宋体"),
						12, WritableFont.NO_BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);
				
				WritableCellFormat format = new jxl.write.WritableCellFormat(font);
				format.setAlignment(Alignment.CENTRE);
				format.setVerticalAlignment(VerticalAlignment.CENTRE);
				format.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				format.setWrap(true);
				
				DateFormat date = new DateFormat("yyyy-MM-dd");
				WritableCellFormat format2 = new jxl.write.WritableCellFormat(date);
				format2.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
					int i = 1;
					Label wlabel0 = new Label(0, 0, "特种设备使用登记表" , titleFormat);
					wsheet.mergeCells(0, 0, 7, 1);
					wsheet.addCell(wlabel0);
					Label wlabel1 = new Label(0, i+1, "注册登记机构" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel1);
					Label wlabel2 = new Label(2, i+1, elevator.getZhucedengjijigou(), format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel2);
					Label wlabel3 = new Label(6, i+1, "注册登记日期" , format);
					wsheet.addCell(wlabel3);
					//DateTime wlabel4 = new DateTime(7, i+1, elevator.getDj_jingbanriqi() , format2);
					Label wlabel4 = new Label(7, i+1, null == elevator.getZhuceriqi()? "" : DateFormatTool.formate(elevator.getZhuceriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel4);
					i=2;
					Label wlabel5 = new Label(0, i+1, "设备注册代码" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel5);
					Label wlabel6 = new Label(2, i+1, elevator.getZhucedaima() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel6);
					Label wlabel7 = new Label(6, i+1, "更新日期" , format);
					wsheet.addCell(wlabel7);
					Label wlabel8 = new Label(7, i+1, null == elevator.getBiangengriqi()? "" : DateFormatTool.formate(elevator.getBiangengriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel8);
					i=3;
					Label wlabel9 = new Label(0, i+1, "单位内部编号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel9);
					Label wlabel10 = new Label(2, i+1, elevator.getNeibubianhao() , format);
					wsheet.addCell(wlabel10);
					Label wlabel11 = new Label(3, i+1, "厂车牌照编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel11);
					Label wlabel12 = new Label(5, i+1, "" , format);
					wsheet.addCell(wlabel12);
					Label wlabel13 = new Label(6, i+1, "注册登记人员" , format);
					wsheet.addCell(wlabel13);
					Label wlabel14 = new Label(7, i+1, elevator.getDj_jingbanren() , format);
					wsheet.addCell(wlabel14);
					i=4;
					Label wlabel15 = new Label(0, i+1, "产权单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel15);
					Label wlabel16 = new Label(2, i+1, elevator.getChanquandanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel16);
					Label wlabel17 = new Label(6, i+1, "产权单位代码" , format);
					wsheet.addCell(wlabel17);
					Label wlabel18 = new Label(7, i+1, elevator.getChanquandanwei_daima() , format);
					wsheet.addCell(wlabel18);
					i=5;
					Label wlabel19 = new Label(0, i+1, "产权单位地址" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel19);
					Label wlabel20 = new Label(2, i+1, elevator.getChanquandanwei_dizhi() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel20);
					Label wlabel21 = new Label(6, i+1, "邮政编码" , format);
					wsheet.addCell(wlabel21);
					Label wlabel22 = new Label(7, i+1, elevator.getChanquandanwei_youbian() , format);
					wsheet.addCell(wlabel22);
					i=6;
					Label wlabel23 = new Label(0, i+1, "单位法人代表" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel23);
					Label wlabel24 = new Label(2, i+1, elevator.getChanquandanwei_farendaibiao() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel24);
					Label wlabel25 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel25);
					Label wlabel26 = new Label(7, i+1, elevator.getChanquandanwei_dianhua() , format);
					wsheet.addCell(wlabel26);
					i=7;
					Label wlabel27 = new Label(0, i+1, "使用单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel27);
					Label wlabel28 = new Label(2, i+1, elevator.getShiyongdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel28);
					Label wlabel29 = new Label(6, i+1, "使用单位代码" , format);
					wsheet.addCell(wlabel29);
					Label wlabel30 = new Label(7, i+1, elevator.getShiyongdanwei_code() , format);
					wsheet.addCell(wlabel30);
					i=8;
					Label wlabel31 = new Label(0, i+1, "使用单位地址" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel31);
					Label wlabel32 = new Label(2, i+1, elevator.getShiyongdanwei_dizhi() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel32);
					Label wlabel33 = new Label(6, i+1, "邮政编码" , format);
					wsheet.addCell(wlabel33);
					Label wlabel34 = new Label(7, i+1, elevator.getShiyongdanwei_youbian() , format);
					wsheet.addCell(wlabel34);
					i=9;
					Label wlabel35 = new Label(0, i+1, "安全管理部门" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel35);
					Label wlabel36 = new Label(2, i+1, elevator.getAnquanguanlibumen() , format);
					wsheet.addCell(wlabel36);
					Label wlabel37 = new Label(3, i+1, "安全管理人员" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel37);
					Label wlabel38 = new Label(5, i+1, elevator.getAnquanguanlirenyuan() , format);
					wsheet.addCell(wlabel38);
					Label wlabel39 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel39);
					Label wlabel40 = new Label(7, i+1, elevator.getAnquanguanli_lianxidianhua() , format);
					wsheet.addCell(wlabel40);
					i=10;
					Label wlabel41 = new Label(0, i+1, "设备使用地点" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel41);
					Label wlabel42 = new Label(2, i+1, elevator.getShebeididian() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel42);
					Label wlabel43 = new Label(6, i+1, "操作人员" , format);
					wsheet.addCell(wlabel43);
					Label wlabel44 = new Label(7, i+1, elevator.getShiyongdanwei_caozuorenyuan() , format);
					wsheet.addCell(wlabel44);
					i=11;
					Label wlabel45 = new Label(0, i+1, "设备类别" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel45);
					Label wlabel46 = new Label(2, i+1, elevator.getShebeileibie() , format);
					wsheet.addCell(wlabel46);
					Label wlabel47 = new Label(3, i+1, "设备名称" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel47);
					Label wlabel48 = new Label(5, i+1, elevator.getShebeimingcheng() , format);
					wsheet.addCell(wlabel48);
					Label wlabel49 = new Label(6, i+1, "设备型号" , format);
					wsheet.addCell(wlabel49);
					Label wlabel50 = new Label(7, i+1, elevator.getShebeixinghao() , format);
					wsheet.addCell(wlabel50);
					i=12;
					Label wlabel51 = new Label(0, i+1, "设计单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel51);
					Label wlabel52 = new Label(2, i+1, elevator.getShejidanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel52);
					Label wlabel53 = new Label(6, i+1, "设计单位代码" , format);
					wsheet.addCell(wlabel53);
					Label wlabel54 = new Label(7, i+1, elevator.getShejidanweidaima() , format);
					wsheet.addCell(wlabel54);
					i=13;
					Label wlabel55 = new Label(0, i+1, "制造单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel55);
					Label wlabel56 = new Label(2, i+1, elevator.getZhizaodanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel56);
					Label wlabel57= new Label(6, i+1, "制造单位代码" , format);
					wsheet.addCell(wlabel57);
					Label wlabel58 = new Label(7, i+1, elevator.getZhizaodanwei_code() , format);
					wsheet.addCell(wlabel58);
					i=14;
					Label wlabel59 = new Label(0, i+1, "资格证书名称" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel59);
					Label wlabel60 = new Label(2, i+1, elevator.getZhizaodanwei_zigezhengshu(), format);
					wsheet.addCell(wlabel60);
					Label wlabel61 = new Label(3, i+1, "资格证书号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel61);
					Label wlabel62 = new Label(5, i+1,  elevator.getZhizaodanweixukezhengbianhao() , format);
					wsheet.addCell(wlabel62);
					Label wlabel63 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel63);
					Label wlabel64 = new Label(7, i+1, elevator.getZhizaodanwei_lianxidianhua() , format);
					wsheet.addCell(wlabel64);
					i=15;
					Label wlabel65 = new Label(0, i+1, "制造年月" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel65);
					Label wlabel66 = new Label(2, i+1, null == elevator.getZhizaoriqi_date() ? elevator.getZhizaoriqi() : DateFormatTool.formate(elevator.getZhizaoriqi_date(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel66);
					Label wlabel67 = new Label(3, i+1, "出厂编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel67);
					Label wlabel68 = new Label(5, i+1, elevator.getChuchangbianhao() , format);
					wsheet.addCell(wlabel68);
					Label wlabel69 = new Label(6, i+1, "适用场合" , format);
					wsheet.addCell(wlabel69);
					Label wlabel70 = new Label(7, i+1, elevator.getShiyongchangsuo(), format);
					wsheet.addCell(wlabel70);
					i=16;
					Label wlabel71 = new Label(0, i+1, "安装单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel71);
					Label wlabel72 = new Label(2, i+1, elevator.getAnzhuangdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel72);
					Label wlabel73= new Label(6, i+1, "安装单位代码" , format);
					wsheet.addCell(wlabel73);
					Label wlabel74 = new Label(7, i+1, elevator.getAnzhuangdanwei_daima() , format);
					wsheet.addCell(wlabel74);
					i=17;
					Label wlabel75 = new Label(0, i+1, "资格证书编号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel75);
					Label wlabel76 = new Label(2, i+1, elevator.getAnzhuangdanwei_zigezhengshu(), format);
					wsheet.addCell(wlabel76);
					Label wlabel77 = new Label(3, i+1, "项目负责人" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel77);
					Label wlabel78 = new Label(5, i+1, elevator.getAnzhuangdanwei_lianxiren(), format);
					wsheet.addCell(wlabel78);
					Label wlabel79 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel79);
					Label wlabel80 = new Label(7, i+1, elevator.getAnzhuangdanwei_lianxidianhua() , format);
					wsheet.addCell(wlabel80);
					i=18;
					Label wlabel81 = new Label(0, i+1, "土建施工单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel81);
					Label wlabel82 = new Label(2, i+1, elevator.getShigongdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel82);
					Label wlabel83= new Label(6, i+1, "开始施工日期" , format);
					wsheet.addCell(wlabel83);
					Label wlabel84 = new Label(7, i+1, null == elevator.getShigongdanwei_shigongriqi()?"":DateFormatTool.formate(elevator.getShigongdanwei_shigongriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel84);
					i=19;
					Label wlabel85 = new Label(0, i+1, "土建验收单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel85);
					Label wlabel86 = new Label(2, i+1, elevator.getYanshoudanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel86);
					Label wlabel87= new Label(6, i+1, "竣工验收日期" , format);
					wsheet.addCell(wlabel87);
					Label wlabel88 = new Label(7, i+1, null == elevator.getShigongdanwei_jungongriqi()?"":DateFormatTool.formate(elevator.getShigongdanwei_jungongriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel88);
					i=20;
					Label wlabel89 = new Label(0, i+1, "验收检验机构" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel89);
					Label wlabel90 = new Label(2, i+1, elevator.getYanshoujigou(), format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel90);
					Label wlabel91 = new Label(6, i+1, "验收报告编号" , format);
					wsheet.addCell(wlabel91);
					Label wlabel92 = new Label(7, i+1, elevator.getYanshoubaogaobianhao() , format);
					wsheet.addCell(wlabel92);
					i=21;
					Label wlabel93 = new Label(0, i+1, "投用日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel93);
					Label wlabel94 = new Label(2, i+1, null == elevator.getTouyongriqi_date() ? elevator.getTouyongriqi() : DateFormatTool.formate(elevator.getTouyongriqi_date(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel94);
					Label wlabel95 = new Label(3, i+1, "维保周期( 周)" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel95);
					Label wlabel96 = new Label(5, i+1, elevator.getWeibaozhouqi() , format);
					wsheet.addCell(wlabel96);
					Label wlabel97 = new Label(6, i+1, "大修周期(月)" , format);
					wsheet.addCell(wlabel97);
					Label wlabel98 = new Label(7, i+1, elevator.getDaxiuzhouqi(), format);
					wsheet.addCell(wlabel98);
					i=22;
					Label wlabel99 = new Label(0, i+1, "维修保养单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel99);
					Label wlabel100 = new Label(2, i+1, elevator.getWeihubaoyangdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel100);
					Label wlabel101 = new Label(6, i+1, "维保单位代码" , format);
					wsheet.addCell(wlabel101);
					Label wlabel102 = new Label(7, i+1, elevator.getWeihubaoyangdanwei_code(), format);
					wsheet.addCell(wlabel102);
					i=23;
					Label wlabel103 = new Label(0, i+1, "资格证书号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel103);
					Label wlabel104 = new Label(2, i+1, elevator.getWhbydw_zizhizhengshu(), format);
					wsheet.addCell(wlabel104);
					Label wlabel105 = new Label(3, i+1, "维保责任人" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel105);
					Label wlabel106 = new Label(5, i+1, elevator.getWeihubaoyangdanwei_lianxiren() , format);
					wsheet.addCell(wlabel106);
					Label wlabel107 = new Label(6, i+1, "电话" , format);
					wsheet.addCell(wlabel107);
					Label wlabel108 = new Label(7, i+1, elevator.getWeihubaoyangdanwei_dianhua(), format);
					wsheet.addCell(wlabel108);
					i=24;
					Label wlabel109 = new Label(0, i+1, "所在车间分厂" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel109);
					Label wlabel110 = new Label(2, i+1, elevator.getSuoshuchejian() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel110);
					Label wlabel111 = new Label(6, i+1, "" , format);
					wsheet.addCell(wlabel111);
					Label wlabel112 = new Label(7, i+1, "" , format);
					wsheet.addCell(wlabel112);
					i=25;
					Label wlabel113 = new Label(0, i+1, "检验单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel113);
					Label wlabel114 = new Label(2, i+1, elevator.getJianyanjigou() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel114);
					Label wlabel115 = new Label(6, i+1, "检验单位代码" , format);
					wsheet.addCell(wlabel115);
					Label wlabel116 = new Label(7, i+1,  elevator.getJianyanjigou_code(), format);
					wsheet.addCell(wlabel116);
					i=26;
					Label wlabel117 = new Label(0, i+1, "检验日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel117);
					Label wlabel118 = new Label(2, i+1,  null == elevator.getJianyankaishiriqi()? "" : DateFormatTool.formate(elevator.getJianyankaishiriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel118);
					Label wlabel119 = new Label(3, i+1, "检验类别" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel119);
					Label wlabel120 = new Label(5, i+1, elevator.getJianyanleixing() , format);
					wsheet.addCell(wlabel120);
					Label wlabel121 = new Label(6, i+1, "主要问题" , format);
					wsheet.addCell(wlabel121);
					Label wlabel122 = new Label(7, i+1, elevator.getZhuyaowenti() , format);
					wsheet.addCell(wlabel122);
					i=27;
					Label wlabel123 = new Label(0, i+1, "检验结论" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel123);
					Label wlabel124 = new Label(2, i+1, elevator.getJianyanjielun(), format);
					wsheet.addCell(wlabel124);
					Label wlabel125 = new Label(3, i+1, "报告书编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel125);
					Label wlabel126 = new Label(5, i+1, elevator.getBaogaobianhao() , format);
					wsheet.addCell(wlabel126);
					Label wlabel127 = new Label(6, i+1, "下次检验日期" , format);
					wsheet.addCell(wlabel127);
					Label wlabel128 = new Label(7, i+1, null == elevator.getXiacijianyanriqi()? "" : DateFormatTool.formate(elevator.getXiacijianyanriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel128);
					i=28;
					Label wlabel129 = new Label(0, i+1, "事故类别" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel129);
					Label wlabel130 = new Label(2, i+1, elevator.getShiguleibie() , format);
					wsheet.addCell(wlabel130);
					Label wlabel131 = new Label(3, i+1, "事故发生日期" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel131);
					Label wlabel132 = new Label(5, i+1, null == elevator.getShigufashengriqi()?"":DateFormatTool.formate(elevator.getShigufashengriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel132);
					Label wlabel133 = new Label(6, i+1, "事故处理结果" , format);
					wsheet.addCell(wlabel133);
					Label wlabel134 = new Label(7, i+1, elevator.getShiguchulijieguo()  , format);
					wsheet.addCell(wlabel134);
					i=29;
					Label wlabel135 = new Label(0, i+1, "设备变动方式" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel135);
					Label wlabel136 = new Label(2, i+1, elevator.getShebeibiandongfangshi(), format);
					wsheet.addCell(wlabel136);
					Label wlabel137 = new Label(3, i+1, "设备变动项目" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel137);
					Label wlabel138 = new Label(5, i+1, elevator.getShebeibiandongxiangmu() , format);
					wsheet.addCell(wlabel138);
					Label wlabel139 = new Label(6, i+1, "设备变动日期" , format);
					wsheet.addCell(wlabel139);
					Label wlabel140 = new Label(7, i+1, null == elevator.getShebeibiandongriqi()?"":DateFormatTool.formate(elevator.getShebeibiandongriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel140);
					i=30;
					Label wlabel141 = new Label(0, i+1, "设备承担单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel141);
					Label wlabel142 = new Label(2, i+1, elevator.getChengdandanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel142);
					Label wlabel143 = new Label(6, i+1, "承担单位代码" , format);
					wsheet.addCell(wlabel143);
					Label wlabel144 = new Label(7, i+1, elevator.getChengdandanwei_code() , format);
					wsheet.addCell(wlabel144);
					i=31;
					Label wlabel198 = new Label(0, i+1, "管理方式" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel198);
					Label wlabel199 = new Label(2, i+1, "" , format);
					wsheet.addCell(wlabel199);
					Label wlabel200 = new Label(3, i+1, "电梯运行速度" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel200);
					Label wlabel201 = new Label(5, i+1, null == elevator.getMingyisudu() ? "":elevator.getMingyisudu().toString(), format);
					wsheet.addCell(wlabel201);
					Label wlabel202 = new Label(6, i+1, "电梯额定载荷" , format);
					wsheet.addCell(wlabel202);
					Label wlabel203 = new Label(7, i+1, null == elevator.getEdingzaizhongliang() ? "":elevator.getEdingzaizhongliang().toString(), format);
					wsheet.addCell(wlabel203);
					i=32;
					Label wlabel204 = new Label(0, i+1, "电梯层站" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel204);
					Label wlabel205 = new Label(2, i+1, elevator.getDianticengzhan() , format);
					wsheet.addCell(wlabel205);
					Label wlabel206 = new Label(3, i+1, "电梯提升高度" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel206);
					Label wlabel207 = new Label(5, i+1, null == elevator.getTishenggaodu() ? "":elevator.getTishenggaodu().toString() , format);
					wsheet.addCell(wlabel207);
					Label wlabel208 = new Label(6, i+1, "电梯走行距离" , format);
					wsheet.addCell(wlabel208);
					Label wlabel209 = new Label(7, i+1, elevator.getZouxingjuli() , format);
					wsheet.addCell(wlabel209);
					i=33;
					Label wlabel210 = new Label(0, i+1, "电梯层" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel210);
					Label wlabel211 = new Label(2, i+1, null == elevator.getCeng() ? "":elevator.getCeng().toString() , format);
					wsheet.addCell(wlabel211);
					Label wlabel212 = new Label(3, i+1, "电梯站" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel212);
					Label wlabel213 = new Label(5, i+1, null == elevator.getZhan() ? "":elevator.getZhan().toString(), format);
					wsheet.addCell(wlabel213);
					Label wlabel214 = new Label(6, i+1, "电梯门" , format);
					wsheet.addCell(wlabel214);
					Label wlabel215 = new Label(7, i+1, null == elevator.getMen() ? "":elevator.getMen().toString(), format);
					wsheet.addCell(wlabel215);
					i=34;
					Label wlabel216 = new Label(0, i+1, "梯级宽度" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel216);
					Label wlabel217 = new Label(2, i+1, null == elevator.getMingyikuandu() ? "":elevator.getMingyikuandu().toString() , format);
					wsheet.addCell(wlabel217);
					Label wlabel218 = new Label(3, i+1, "油缸压力" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel218);
					Label wlabel219 = new Label(5, i+1, "" , format);
					wsheet.addCell(wlabel219);
					Label wlabel220 = new Label(6, i+1, "使用区段长度" , format);
					wsheet.addCell(wlabel220);
					Label wlabel221 = new Label(7, i+1, null == elevator.getQuduanchangdu() ? "":elevator.getQuduanchangdu().toString() , format);
					wsheet.addCell(wlabel221);
					i=35;
					Label wlabel222 = new Label(0, i+1, "倾斜角度" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel222);
					Label wlabel223 = new Label(2, i+1, null == elevator.getQingxiejiao() ? "":elevator.getQingxiejiao().toString() , format);
					wsheet.mergeCells(2, i+1, 7, i+1);
					wsheet.addCell(wlabel223);
					i=36;
					Label wlabel145 = new Label(0, i+1, "电梯登记卡（基本信息）" , titleFormat);
					wsheet.mergeCells(0, i+1, 7, i+1);
					wsheet.addCell(wlabel145);
					i=37;
					Label wlabel146 = new Label(0, i+1, "使用登记证号码" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel146);
					Label wlabel147 = new Label(2, i+1, elevator.getDengjizhengbianhao() , format);
					wsheet.mergeCells(2, i+1, 4, i+1);
					wsheet.addCell(wlabel147);
					Label wlabel148 = new Label(5, i+1, "注册代码" , format);
					wsheet.addCell(wlabel148);
					Label wlabel149 = new Label(6, i+1, elevator.getZhucedaima() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel149);
					i=38;
					Label wlabel150 = new Label(0, i+1, "使用单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel150);
					Label wlabel151 = new Label(2, i+1, elevator.getShiyongdanwei(), format);
					wsheet.mergeCells(2, i+1, 7, i+1);
					wsheet.addCell(wlabel151);
					i=39;
					Label wlabel152 = new Label(0, i+1, "详细地址" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel152);
					Label wlabel153 = new Label(2, i+1, elevator.getShiyongdanwei_dizhi() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel153);
					Label wlabel154 = new Label(6, i+1, "邮政编码" , format);
					wsheet.addCell(wlabel154);
					Label wlabel155 = new Label(7, i+1, elevator.getShiyongdanwei_youbian(), format);
					wsheet.addCell(wlabel155);
					i=40;
					Label wlabel156 = new Label(0, i+1, "使用单位地址(省)" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel156);
					Label wlabel157 = new Label(2, i+1, "鲁" , format);
					wsheet.addCell(wlabel157);
					Label wlabel158 = new Label(3, i+1, "市" , format);
					wsheet.addCell(wlabel158);
					Label wlabel159 = new Label(4, i+1, elevator.getShi(), format);
					wsheet.addCell(wlabel159);
					Label wlabel160 = new Label(5, i+1, "区（县）" , format);
					wsheet.addCell(wlabel160);
					Label wlabel161 = new Label(6, i+1, elevator.getQuhuamingcheng() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel161);
					i=41;
					Label wlabel193 = new Label(0, i+1, "所在乡镇" , format);
					wsheet.mergeCells(0, i+1, 2, i+1);
					wsheet.addCell(wlabel193);
					Label wlabel194 = new Label(3, i+1, elevator.getXiangzhen() , format);
					wsheet.mergeCells(3, i+1, 5, i+1);
					wsheet.addCell(wlabel194);
					Label wlabel195 = new Label(6, i+1, "所在村" , format);
					wsheet.addCell(wlabel195);
					Label wlabel196 = new Label(7, i+1, "" , format);
					wsheet.addCell(wlabel196);
					i=42;
					Label wlabel162 = new Label(0, i+1, "法定代表人" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel162);
					Label wlabel163 = new Label(2, i+1, elevator.getFadingdaibiaoren() , format);
					wsheet.addCell(wlabel163);
					Label wlabel164 = new Label(3, i+1, "电话（或总机）" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel164);
					Label wlabel165 = new Label(5, i+1, elevator.getShiyongdanwei_lianxidianhua() , format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel165);
					i=43;
					Label wlabel166 = new Label(0, i+1, "E-Mail" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel166);
					Label wlabel167 = new Label(2, i+1, "" , format);
					wsheet.mergeCells(2, i+1, 3, i+1);
					wsheet.addCell(wlabel167);
					Label wlabel168 = new Label(4, i+1, "传真" , format);
					wsheet.addCell(wlabel168);
					Label wlabel169 = new Label(5, i+1, elevator.getShiyongdanwei_chuanzhen() , format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel169);
					i=44;
					Label wlabel170 = new Label(0, i+1, "主管负责人" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel170);
					Label wlabel171 = new Label(2, i+1, elevator.getZhuguanfuzeren(), format);
					wsheet.addCell(wlabel171);
					Label wlabel172 = new Label(3, i+1, "主管负责人电话" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel172);
					Label wlabel173 = new Label(5, i+1, elevator.getZhuguanfuzerendianhua() , format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel173);
					i=45;
					Label wlabel174 = new Label(0, i+1, "经办人" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel174);
					Label wlabel175 = new Label(2, i+1, elevator.getJingbanren() , format);
					wsheet.addCell(wlabel175);
					Label wlabel176 = new Label(3, i+1, "经办人电话" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel176);
					Label wlabel1jbrdh = new Label(5, i+1, "" , format);
					wsheet.addCell(wlabel1jbrdh);
					Label wlabel177 = new Label(6, i+1, "手机或传呼" , format);
					wsheet.addCell(wlabel177);
					Label wlabel178 = new Label(7, i+1, elevator.getJingbanrendianhua() , format);
					wsheet.addCell(wlabel178);
					i=46;
					Label wlabel179 = new Label(0, i+1, "填表日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel179);
					Label wlabel180 = new Label(2, i+1, null == elevator.getTianbiaoriqi()?"":DateFormatTool.formate(elevator.getTianbiaoriqi(), "yyyy-MM-dd"), format);
					wsheet.addCell(wlabel180);
					Label wlabel181 = new Label(3, i+1, "是否在人口密集区" , format);
					wsheet.mergeCells(3, i+1, 5, i+1);
					wsheet.addCell(wlabel181);
					Label wlabel182 = new Label(6, i+1, elevator.getShifou_renkoumijiqu() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel182);
					i=47;
					Label wlabel183 = new Label(0, i+1, "是否重大危险源" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel183);
					Label wlabel184 = new Label(2, i+1, elevator.getShifou_zhongdaweixianyuan() , format);
					wsheet.addCell(wlabel184);
					Label wlabel185 = new Label(3, i+1, "是否制定事故应急措施和救援预案" , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel185);
					Label wlabel186 = new Label(7, i+1, elevator.getShifou_yingjifangan() , format);
					wsheet.addCell(wlabel186);
					i=48;
					Label wlabel187 = new Label(0, i+1, "" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel187);
					Label wlabel188 = new Label(2, i+1, "" , format);
					wsheet.addCell(wlabel188);
					Label wlabel189 = new Label(3, i+1, "是否重点监控特种设备" , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel189);
					Label wlabel190 = new Label(7, i+1, elevator.getShifou_zhongdianjiankong() , format);
					wsheet.addCell(wlabel190);
					i=49;
					Label wlabel191 = new Label(0, i+1, "备注" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel191);
					Label wlabel192 = new Label(2, i+1, elevator.getBeizhu() , format);
					wsheet.mergeCells(2, i+1, 7, i+1);
					wsheet.addCell(wlabel192);

				workbook.write();
				workbook.close();
				os.close();
			} catch (Exception e) {
				
			}
		}else if("4000".equals(report.getShebeizhongleidaima())){
			TCraneParam elevator = (TCraneParam) super.findById(Long.parseLong(id), TCraneParam.class.getName());
			
			try {
				// 创建Excel
				workbook = Workbook.createWorkbook(os);
				// 在Excel中新建一个sheet
				WritableSheet wsheet = workbook.createSheet("起重机械", 0);
				//去掉整个sheet中的网格线
				wsheet.getSettings().setShowGridLines(false);
				wsheet.getSettings().setPaperSize(PaperSize.A4);
				wsheet.getSettings().setFitHeight(297) ;                        // 打印区高度
		        wsheet.getSettings().setFitWidth(210) ;                        // 打印区宽度    
		        // 设置边距            
	            wsheet.getSettings().setTopMargin(0.5) ;
	            wsheet.getSettings().setBottomMargin(0.3) ;
	            wsheet.getSettings().setLeftMargin(0.3) ;
	            wsheet.getSettings().setRightMargin(0.3) ;
				String[] titles = new String[11];
				for (int i = 0; i < titles.length; i++) {
					if(i==0){
						wsheet.setColumnView(i, 10);
					}else if(i==6 || i==3 || i==4 || i==5 ){
						wsheet.setColumnView(i, 7);
					}else{
						wsheet.setColumnView(i, 10);
					}
				}
				// 标题字体
				WritableFont font = new WritableFont(WritableFont.ARIAL, 12,
						WritableFont.BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);
				WritableCellFormat titleFormat = new WritableCellFormat(font);
				//水平居中对齐
				titleFormat.setAlignment(Alignment.CENTRE);
	            //竖直方向居中对齐
				titleFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
				// 内容字体
				font = new jxl.write.WritableFont(WritableFont.createFont("宋体"),
						12, WritableFont.NO_BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);

				WritableCellFormat format = new jxl.write.WritableCellFormat(font);
				format.setAlignment(Alignment.CENTRE);
				format.setVerticalAlignment(VerticalAlignment.CENTRE);
				format.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				format.setWrap(true);
				
				WritableCellFormat formatNoBorder = new jxl.write.WritableCellFormat(font);
				formatNoBorder.setAlignment(Alignment.CENTRE);
				formatNoBorder.setVerticalAlignment(VerticalAlignment.CENTRE);
				formatNoBorder.setWrap(true);

				WritableCellFormat formatLeft = new jxl.write.WritableCellFormat(font);
				formatLeft.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				formatLeft.setAlignment(Alignment.LEFT);
				formatLeft.setVerticalAlignment(VerticalAlignment.CENTRE);
				formatLeft.setWrap(true);
				
				WritableCellFormat formatRight = new jxl.write.WritableCellFormat(font);
				formatRight.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				formatRight.setAlignment(Alignment.RIGHT);
				formatRight.setVerticalAlignment(VerticalAlignment.CENTRE);
				formatRight.setWrap(true);
				
				DateFormat date = new DateFormat("yyyy-MM-dd");
				WritableCellFormat format2 = new jxl.write.WritableCellFormat(date);
				format2.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				
				for(int i = 1;i<61;i++){
					wsheet.setRowView(i,300);
				}
				
					Label wlabel0 = new Label(0, 0, "特种设备使用登记表" , titleFormat);
					wsheet.mergeCells(0, 0, 10, 0);
					wsheet.setRowView(0, 400);
					wsheet.addCell(wlabel0);
					Label wlabeldjlb = new Label(0, 1, "登记类别:" , formatNoBorder);
					wsheet.mergeCells(0, 1, 1, 1);
					wsheet.addCell(wlabeldjlb);
					Label wlabeldjlbv = new Label(2, 1, elevator.getDengjileibie(), formatNoBorder);
					wsheet.mergeCells(2, 1, 5, 1);
					wsheet.addCell(wlabeldjlbv);
					Label wlabelzcdm = new Label(6, 1, "注册代码" , formatNoBorder);
					wsheet.mergeCells(6, 1, 7, 1);
					wsheet.addCell(wlabelzcdm);
					Label wlabelzcdmv = new Label(8, 1, elevator.getZhucedaima(), formatNoBorder);
					wsheet.mergeCells(8, 1, 10, 1);
					wsheet.addCell(wlabelzcdmv);
					int i = 1;
					Label wlabel1 = new Label(0, i+1, "设备基本情况" , format);
					wsheet.mergeCells(0, i+1, 0, i+4);
					wsheet.addCell(wlabel1);
					Label wlabel2 = new Label(1, i+1, "设备种类" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel2);
					Label wlabel3 = new Label(3, i+1, elevator.getShebeizhonglei() , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel3);
					Label wlabel4 = new Label(7, i+1, "设备类别", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel4);
					Label wlabel5 = new Label(9, i+1, elevator.getShebeileibie(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel5);
					i=2;
					Label wlabel6 = new Label(1, i+1, "设备品种" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel6);
					Label wlabel7 = new Label(3, i+1, elevator.getShebeipinzhong() , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel7);
					Label wlabel8 = new Label(7, i+1, "产品名称", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel8);
					Label wlabel9 = new Label(9, i+1, elevator.getShebeimingcheng(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel9);
					i=3;
					Label wlabel10 = new Label(1, i+1, "设备代码" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel10);
					Label wlabel11 = new Label(3, i+1, elevator.getShebeidaima() , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel11);
					Label wlabel12 = new Label(7, i+1, "设备型号", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel12);
					Label wlabel13 = new Label(9, i+1, elevator.getShebeixinghao(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel13);
					i=4;
					Label wlabel14 = new Label(1, i+1, "设备使用年限" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel14);
					Label wlabel15 = new Label(3, i+1, elevator.getShebeishiyongnianxian() , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel15);
					Label wlabel16 = new Label(7, i+1, "固定资产值", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel16);
					Label wlabel17 = new Label(9, i+1, elevator.getGudingzichanzhi(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel17);
					i=5;
					Label wlabel200 = new Label(0, i+1, "设备结构型式" , format);
					wsheet.mergeCells(0, i+1, 0, i+2);
					wsheet.addCell(wlabel200);
					Label wlabel201 = new Label(1, i+1, "主体结构型式" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel201);
					Label wlabel202 = new Label(3, i+1, "" , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel202);
					Label wlabel203 = new Label(7, i+1, "防爆型式", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel203);
					Label wlabel204 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel204);
					i=6;
					Label wlabel205 = new Label(1, i+1, "吊具型式" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel205);
					Label wlabel206 = new Label(3, i+1, "" , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel206);
					Label wlabel207 = new Label(7, i+1, "操纵方式", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel207);
					Label wlabel208 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel208);
					i=7;
					Label wlabel209 = new Label(0, i+1, "设备主要性能参数" , format);
					wsheet.mergeCells(0, i+1, 0, i+3);
					wsheet.addCell(wlabel209);
					Label wlabel210 = new Label(1, i+1, "额定起重量(起重力矩)" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.setRowView(i+1, 600);
					wsheet.addCell(wlabel210);
					Label wlabel211 = new Label(3, i+1,  elevator.getEdingqizhongliang(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel211);
					Label wlabel212 = new Label(7, i+1, "跨度", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel212);
					Label wlabel213 = new Label(9, i+1, elevator.getKuadu(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel213);
					i=8;
					Label wlabel214 = new Label(1, i+1, "起升高度" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel214);
					Label wlabel215 = new Label(3, i+1,  elevator.getQishenggaodu(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel215);
					Label wlabel216 = new Label(7, i+1, "起升速度", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel216);
					Label wlabel217 = new Label(9, i+1, elevator.getQishengsudu(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel217);
					i=9;
					Label wlabel218 = new Label(1, i+1, "工作级别" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel218);
					Label wlabel219 = new Label(3, i+1,  elevator.getGongzuojibie(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel219);
					Label wlabel220 = new Label(7, i+1, "整机总功率", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel220);
					Label wlabel221 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel221);
					i = 10;
					Label wlabel18 = new Label(0, i+1, "设备使用情况" , format);
					wsheet.mergeCells(0, i+1, 0, i+13);
					wsheet.addCell(wlabel18);
					Label wlabel19 = new Label(1, i+1, "使用单位名称" , format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel19);
					Label wlabel20 = new Label(3, i+1, elevator.getShiyongdanwei() , format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel20);
					i = 11;
					Label wlabel21 = new Label(1, i+1, "使用单位地址", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel21);
					Label wlabel22 = new Label(3, i+1, elevator.getShiyongdanwei_dizhi(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel22);
					i = 12;
					Label wlabel23 = new Label(1, i+1, "组织机构代码", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel23);
					Label wlabel24 = new Label(3, i+1, elevator.getShiyongdanwei_code(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel24);
					Label wlabel25 = new Label(7, i+1, "邮政编码", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel25);
					Label wlabel26 = new Label(9, i+1, elevator.getShiyongdanwei_code(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel26);
					i = 13;
					Label wlabel27 = new Label(1, i+1, "经济类型", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel27);
					Label wlabel28 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel28);
					Label wlabel29 = new Label(7, i+1, "所属行业", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel29);
					Label wlabel30 = new Label(9, i+1, elevator.getShiyongdanwei_suoshuhangye(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel30);
					i = 14;
					Label wlabel31 = new Label(1, i+1, "法定代表人", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel31);
					Label wlabel32 = new Label(3, i+1, elevator.getFadingdaibiaoren(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel32);
					Label wlabel33 = new Label(7, i+1, "安全管理部门", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel33);
					Label wlabel34 = new Label(9, i+1, elevator.getAnquanguanlibumen(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel34);
					i = 15;
					Label wlabel35 = new Label(1, i+1, "安全管理人员", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel35);
					Label wlabel36 = new Label(3, i+1, elevator.getAnquanguanlirenyuan(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel36);
					Label wlabel37 = new Label(7, i+1, "联系电话", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel37);
					Label wlabel38 = new Label(9, i+1, elevator.getAnquanguanli_lianxidianhua(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel38);
					i = 16;
					Label wlabel39 = new Label(1, i+1, "产权单位名称", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel39);
					Label wlabel40 = new Label(3, i+1, elevator.getChanquandanwei(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel40);
					
					i = 17;
					Label wlabel43 = new Label(1, i+1, "产权单位地址", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel43);
					Label wlabel44 = new Label(3, i+1, elevator.getChanquandanwei_dizhi(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel44);
					
					i = 18;
					Label wlabel222 = new Label(1, i+1, "产权单位负责人", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel222);
					Label wlabel223 = new Label(3, i+1, elevator.getChanquandanwei_farendaibiao(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel223);
					Label wlabel224 = new Label(7, i+1, "联系电话", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel224);
					Label wlabel225 = new Label(9, i+1, elevator.getChanquandanwei_dianhua(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel225);
					i = 19;
					Label wlabel226 = new Label(1, i+1, "设备用途", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel226);
					Label wlabel227 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel227);
					Label wlabel228 = new Label(7, i+1, "单位内编号", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel228);
					Label wlabel229 = new Label(9, i+1, elevator.getNeibubianhao(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel229);
					
					i = 20;
					Label wlabel56 = new Label(1, i+1, "单位内使用地点", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel56);
					Label wlabel57 = new Label(3, i+1, elevator.getShiyongdanwei_dizhi() , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel57);
					Label wlabel45 = new Label(7, i+1, "设备地理信息", format);
					wsheet.mergeCells(7, i+1, 7, i+3);
					wsheet.addCell(wlabel45);
					Label wlabel46 = new Label(8, i+1, "经度", format);
					wsheet.addCell(wlabel46);
					Label wlabel47 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel47);
					
					i = 21;
					Label wlabel48 = new Label(1, i+1, "投入使用日期", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel48);
					Label wlabel49 = new Label(3, i+1, null == elevator.getTouyongriqi_date() ? elevator.getTouyongriqi() : DateFormatTool.formate(elevator.getTouyongriqi_date(),"yyyy-MM-dd"), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel49);
					Label wlabel50 = new Label(8, i+1, "纬度", format);
					wsheet.addCell(wlabel50);
					Label wlabel51 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel51);
					i = 22;
					Label wlabel52 = new Label(1, i+1, "设备布置数量", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel52);
					Label wlabel53 = new Label(3, i+1, "" , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel53);
					Label wlabel54 = new Label(8, i+1, "海拔高度", format);
					wsheet.addCell(wlabel54);
					Label wlabel55 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel55);
					i = 23;
					Label wlabel66 = new Label(0, i+1, "设备制造与监检情况", format);
					wsheet.mergeCells(0, i+1, 0, i+8);
					wsheet.addCell(wlabel66);
					Label wlabel67 = new Label(1, i+1, "制造单位名称", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel67);
					Label wlabel68 = new Label(3, i+1, elevator.getZhizaodanwei(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel68);
					i = 24;
					Label wlabel69 = new Label(1, i+1, "组织结构代码", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel69);
					Label wlabel70 = new Label(3, i+1, elevator.getZhizaodanwei_code(), format);
					wsheet.mergeCells(3, i+1,6, i+1);
					wsheet.addCell(wlabel70);
					Label wlabel71 = new Label(7, i+1, "制造许可证编号", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel71);
					Label wlabel72 = new Label(9, i+1, elevator.getZhizaodanweixukezhengbianhao(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel72);
					i = 25;
					Label wlabel73 = new Label(1, i+1, "产品编号", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel73);
					Label wlabel74 = new Label(3, i+1, elevator.getChuchangbianhao(), format);
					wsheet.mergeCells(3, i+1,6, i+1);
					wsheet.addCell(wlabel74);
					Label wlabel75 = new Label(7, i+1, "制造日期", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel75);
					Label wlabel76 = new Label(9, i+1, null == elevator.getZhizaoriqi_date() ? elevator.getZhizaoriqi() : DateFormatTool.formate(elevator.getZhizaoriqi_date(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel76);
					i = 26;
					Label wlabel77 = new Label(1, i+1, "质量证明书编号", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel77);
					Label wlabel78 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel78);
					i = 27;
					Label wlabel79 = new Label(1, i+1, "制造监检机构", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel79);
					Label wlabel80 = new Label(3, i+1, elevator.getZhizaojianjianjigou(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel80);
					i = 28;
					Label wlabel83 = new Label(1, i+1, "核准证编号", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel83);
					Label wlabel84 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel84);
					Label wlabel81 = new Label(7, i+1, "监检证书编号", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel81);
					Label wlabel82 = new Label(9, i+1, elevator.getJianjianhezhunzheng(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel82);
					i = 29;
					Label wlabel85 = new Label(1, i+1, "型式试验机构", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel85);
					Label wlabel86 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel86);
					i = 30;
					Label wlabel230 = new Label(1, i+1, "核准证编号", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel230);
					Label wlabel231 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel231);
					Label wlabel87 = new Label(7, i+1, "型式试验证书编号", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel87);
					Label wlabel88 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel88);
					i = 31;
					Label wlabel89 = new Label(0, i+1, "设备施工情况", format);
					wsheet.mergeCells(0, i+1, 0, i+4);
					wsheet.addCell(wlabel89);
					Label wlabel90 = new Label(1, i+1, "施工单位名称", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel90);
					Label wlabel91 = new Label(3, i+1, elevator.getShigongdanwei(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel91);
					i = 32;
					Label wlabel232 = new Label(1, i+1, "组织结构代码", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel232);
					Label wlabel233 = new Label(3, i+1, elevator.getShiyongdanwei_code(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel233);
					i = 33;
					Label wlabel92 = new Label(1, i+1, "施工类别", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel92);
					Label wlabel93 = new Label(3, i+1, elevator.getShigongleibie(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel93);
					Label wlabel94 = new Label(7, i+1, "施工许可证编号", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel94);
					Label wlabel95 = new Label(9, i+1, elevator.getShigongdanwei_xukezhengbianhao(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel95);
					i = 34;
					Label wlabel96 = new Label(1, i+1, "施工告知日期", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel96);
					Label wlabel97 = new Label(3, i+1, null == elevator.getShigongdanwei_shigongriqi()?"":DateFormatTool.formate(elevator.getShigongdanwei_shigongriqi(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel97);
					Label wlabel98 = new Label(7, i+1, "施工竣工日期", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel98);
					Label wlabel99 = new Label(9, i+1, null == elevator.getShigongdanwei_jungongriqi()?"":DateFormatTool.formate(elevator.getShigongdanwei_jungongriqi(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel99);
					i = 35;
					Label wlabel234 = new Label(0, i+1, "设备维护保养情况", format);
					wsheet.mergeCells(0, i+1, 0, i+2);
					wsheet.addCell(wlabel234);
					Label wlabel100 = new Label(1, i+1, "维护保养单位", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel100);
					Label wlabel101 = new Label(3, i+1, elevator.getWeihubaoyangdanwei(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel101);
					i = 36;
					Label wlabel104 = new Label(1, i+1, "组织机构代码", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel104);
					Label wlabel105 = new Label(3, i+1, elevator.getWeihubaoyangdanwei_code(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel105);
					Label wlabel106 = new Label(7, i+1, "维护保养形式", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel106);
					Label wlabel107 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel107);
					i = 37;
					Label wlabel235 = new Label(0, i+1, "设备运行情况 ", format);
					wsheet.mergeCells(0, i+1, 0, i+2);
					wsheet.addCell(wlabel235);
					Label wlabel236 = new Label(1, i+1, "工作环境", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel236);
					Label wlabel237 = new Label(3, i+1, elevator.getGongzuohuanjing(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel237);
					Label wlabel238 = new Label(7, i+1, "运行方式", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel238);
					Label wlabel239 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel239);
					i = 38;
					Label wlabel240 = new Label(1, i+1, "运行操作形式", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel240);
					Label wlabel241 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel241);
					Label wlabel242 = new Label(7, i+1, "", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel242);
					Label wlabel243 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel243);
					
					i = 39;
					Label wlabel108 = new Label(0, i+1, "设备保险情况", format);
					wsheet.mergeCells(0, i+1, 0, i+4);
					wsheet.addCell(wlabel108);
					Label wlabel109 = new Label(1, i+1, "保险机构", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel109);
					Label wlabel110 = new Label(3, i+1, elevator.getBaoxianjigou(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel110);
					i = 40;
					Label wlabel111 = new Label(1, i+1, "组织机构代码", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel111);
					Label wlabel112 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel112);
					Label wlabel113 = new Label(7, i+1, "保险险种", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel113);
					Label wlabel114 = new Label(9, i+1, elevator.getBaoxianxianzhong(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel114);
					i = 41;
					Label wlabel115 = new Label(1, i+1, "保险价值", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel115);
					Label wlabel116 = new Label(3, i+1, elevator.getBaoxianjiazhi(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel116);
					Label wlabel117 = new Label(7, i+1, "保险费", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel117);
					Label wlabel118 = new Label(9, i+1, elevator.getBaoxianfei(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel118);
					i = 42;
					Label wlabel244 = new Label(1, i+1, "保险金额", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel244);
					Label wlabel245 = new Label(3, i+1, elevator.getBaoxianji(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel245);
					i = 43;
					Label wlabel119= new Label(0, i+1, "设备变更情况", format);
					wsheet.mergeCells(0, i+1, 0, i+4);
					wsheet.addCell(wlabel119);
					Label wlabel120 = new Label(1, i+1, "变更项目", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel120);
					Label wlabel121 = new Label(3, i+1, "变更类别", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel121);
					Label wlabel122 = new Label(7, i+1, "变更原因", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel122);
					Label wlabel123 = new Label(9, i+1, "变更日期", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel123);
					i = 44;
					Label wlabel124 = new Label(1, i+1, "", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel124);
					Label wlabel125 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel125);
					Label wlabel126 = new Label(7, i+1, "", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel126);
					Label wlabel127 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel127);
					i = 45;
					Label wlabel128 = new Label(1, i+1, "", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel128);
					Label wlabel129 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel129);
					Label wlabel130 = new Label(7, i+1, "", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel130);
					Label wlabel131 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel131);
					i = 46;
					Label wlabel132 = new Label(1, i+1, "", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel132);
					Label wlabel133 = new Label(3, i+1, "", format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel133);
					Label wlabel134 = new Label(7, i+1, "", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel134);
					Label wlabel135 = new Label(9, i+1, "", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel135);
					i = 47;
					Label wlabel136 = new Label(0, i+1, "设备检验情况", format);
					wsheet.mergeCells(0, i+1, 0, i+4);
					wsheet.addCell(wlabel136);
					Label wlabel137 = new Label(1, i+1, "检验机构", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel137);
					Label wlabel138 = new Label(3, i+1, elevator.getJianyanjigou(), format);
					wsheet.mergeCells(3, i+1, 10, i+1);
					wsheet.addCell(wlabel138);
					i = 48;
					Label wlabel139 = new Label(1, i+1, "组织机构代码", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel139);
					Label wlabel140 = new Label(3, i+1, elevator.getJianyanjigou_code(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel140);
					Label wlabel141 = new Label(7, i+1, "检验类别", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel141);
					Label wlabel142 = new Label(9, i+1, elevator.getJianyanleixing(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel142);
					i = 49;
					Label wlabel143 = new Label(1, i+1, "检验日期", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel143);
					Label wlabel144 = new Label(3, i+1, null == elevator.getJianyankaishiriqi()?"":DateFormatTool.formate(elevator.getJianyankaishiriqi(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel144);
					Label wlabel145 = new Label(7, i+1, "检验结论", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel145);
					Label wlabel146 = new Label(9, i+1, elevator.getJianyanjielun(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel146);
					i = 50;
					Label wlabel147 = new Label(1, i+1, "检验报告编号", format);
					wsheet.mergeCells(1, i+1, 2, i+1);
					wsheet.addCell(wlabel147);
					Label wlabel148 = new Label(3, i+1, elevator.getBaogaobianhao(), format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel148);
					Label wlabel149 = new Label(7, i+1, "下次检验日期", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel149);
					Label wlabel150 = new Label(9, i+1, null == elevator.getXiacijianyanriqi()?"":DateFormatTool.formate(elevator.getXiacijianyanriqi(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel150);
					i = 51;
					Label wlabel161 = new Label(0, i+1, "说明：", format);
					wsheet.mergeCells(0, i+1, 0, i+2);
					wsheet.addCell(wlabel161);
					Label wlabelsm = new Label(1, i+1, "", formatLeft);
					wsheet.mergeCells(1, i+1, 10, i+2);
					wsheet.addCell(wlabelsm);
					
					i = 53;
					Label wlabel151 = new Label(0, i+1, "使用单位填表人员：", format);
					wsheet.mergeCells(0, i+1, 2, i+1);
					wsheet.setRowView(i+1, 600);
					wsheet.addCell(wlabel151);
					Label wlabel152 = new Label(3, i+1, elevator.getTianbiaorenyuan(), format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel152);
					Label wlabel153 = new Label(5, i+1, "日期：", format);
					wsheet.mergeCells(5, i+1, 6, i+1);
					wsheet.addCell(wlabel153);
					Label wlabel154 = new Label(7, i+1, null == elevator.getTianbiaoriqi()?"":DateFormatTool.formate(elevator.getTianbiaoriqi(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel154);
					Label wlabel163 = new Label(9, i+1, "(使用单位公章或者专用章)", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel163);
					i = 54;
					Label wlabel155 = new Label(0, i+1, "使用单位安全管理人员：", format);
					wsheet.mergeCells(0, i+1, 2, i+1);
					wsheet.addCell(wlabel155);
					Label wlabel156 = new Label(3, i+1, elevator.getAnquanguanlirenyuan(), format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel156);
					Label wlabel157 = new Label(5, i+1, "日期：", format);
					wsheet.mergeCells(5, i+1, 6, i+1);
					wsheet.addCell(wlabel157);
					Label wlabel158 = new Label(7, i+1, "", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel158);
					Label wlabel164 = new Label(9, i+1, "  年   月   日", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel164);
				
					i = 55;
					Label wlabel165 = new Label(0, i+1, "说明：", format);
					wsheet.addCell(wlabel165);
					Label wlabel166 = new Label(1, i+1, elevator.getBeizhu(), formatLeft);
					wsheet.mergeCells(1, i+1, 10, i+1);
					wsheet.addCell(wlabel166);
					i = 56;
					Label wlabel167 = new Label(0, i+1, "登记机关登记人员：", format);
					wsheet.mergeCells(0, i+1, 2, i+1);
					wsheet.addCell(wlabel167);
					Label wlabel168 = new Label(3, i+1, elevator.getDj_jingbanren(), format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel168);
					Label wlabel169 = new Label(5, i+1, "日期：", format);
					wsheet.mergeCells(5, i+1, 6, i+1);
					wsheet.addCell(wlabel169);
					Label wlabel170 = new Label(7, i+1, null == elevator.getDj_jingbanriqi()?"":DateFormatTool.formate(elevator.getDj_jingbanriqi(), "yyyy-MM-dd"), format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel170);
					Label wlabel171 = new Label(9, i+1, "登记机关(专用章)", format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel171);
					i=57;
					Label wlabel172 = new Label(0, i+1, " 年   月   日", formatRight);
					wsheet.mergeCells(0, i+1, 10, i+1);
					wsheet.addCell(wlabel172);
					i = 58;
					Label wlabel173 = new Label(0, i+1, " ", format);
					wsheet.mergeCells(0, i+1, 4, i+1);
					wsheet.addCell(wlabel173);
					Label wlabel174 = new Label(5, i+1, "  ", format);
					wsheet.mergeCells(5, i+1, 6, i+1);
					wsheet.addCell(wlabel174);
					Label wlabel175 = new Label(7, i+1, "使用登记证编号：", format);
					wsheet.mergeCells(7, i+1, 8, i+1);
					wsheet.addCell(wlabel175);
					Label wlabel176 = new Label(9, i+1, elevator.getDengjizhengbianhao(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel176);
					i = 59;
					Label wlabel177 = new Label(0, i+1, "市：", format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel177);
					Label wlabel178 = new Label(2, i+1, elevator.getShi(), format);
					wsheet.addCell(wlabel178);
					Label wlabel179 = new Label(3, i+1, "区县：", format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel179);
					Label wlabel180 = new Label(5, i+1, elevator.getQuhuamingcheng(), format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel180);
					Label wlabel181 = new Label(8, i+1, "乡镇：", format);
					wsheet.addCell(wlabel181);
					Label wlabel182 = new Label(9, i+1, elevator.getXiangzhen(), format);
					wsheet.mergeCells(9, i+1, 10, i+1);
					wsheet.addCell(wlabel182);
				workbook.write();
				workbook.close();
				os.close();
			} catch (Exception e) {
				
			}
		}else if("5000".equals(report.getShebeizhongleidaima())){
			TCraneParam crane = (TCraneParam) super.findById(Long.parseLong(id), TCraneParam.class.getName());
			
			try {
				// 创建Excel
				workbook = Workbook.createWorkbook(os);
				// 在Excel中新建一个sheet
				WritableSheet wsheet = workbook.createSheet("厂车", 0);
				//去掉整个sheet中的网格线
				wsheet.getSettings().setShowGridLines(false);
				wsheet.getSettings().setPaperSize(PaperSize.A4);
				wsheet.getSettings().setFitHeight(297) ;                        // 打印区高度
		        wsheet.getSettings().setFitWidth(210) ;                        // 打印区宽度    
		        // 设置边距            
	            wsheet.getSettings().setTopMargin(0.5) ;
	            wsheet.getSettings().setBottomMargin(0.3) ;
	            wsheet.getSettings().setLeftMargin(0.3) ;
	            wsheet.getSettings().setRightMargin(0.3) ;
	            
				String[] titles = new String[8];
				for (int i = 0; i < titles.length; i++) {
					if(i==0 || i==1 || i==3 || i==4){
						wsheet.setColumnView(i, 8);
					}else if(i==2 || i==5 ){
						wsheet.setColumnView(i, 16);
					}else{
						wsheet.setColumnView(i, 17);
					}
				}
				// 标题字体
				WritableFont font = new WritableFont(WritableFont.ARIAL, 12,
						WritableFont.BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);
				WritableCellFormat titleFormat = new WritableCellFormat(font);
				//水平居中对齐
				titleFormat.setAlignment(Alignment.CENTRE);
	            //竖直方向居中对齐
				titleFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
				// 内容字体
				font = new jxl.write.WritableFont(WritableFont.createFont("宋体"),
						12, WritableFont.NO_BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);
				
				WritableCellFormat format = new jxl.write.WritableCellFormat(font);
				format.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				format.setAlignment(Alignment.CENTRE);
				format.setVerticalAlignment(VerticalAlignment.CENTRE);
				format.setWrap(true);
				
				DateFormat date = new DateFormat("yyyy-MM-dd");
				WritableCellFormat format2 = new jxl.write.WritableCellFormat(date);
				format2.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				
				for(int i = 2;i<47;i++){
			//		wsheet.setRowView(i, 330);
				}
				
					Label wlabel0 = new Label(0, 0, "特种设备使用登记表" , titleFormat);
					wsheet.mergeCells(0, 0, 7, 1);
					wsheet.addCell(wlabel0);
					int i = 1;
					Label wlabel1 = new Label(0, i+1, "注册登记机构" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel1);
					Label wlabel2 = new Label(2, i+1, crane.getZhucedengjijigou() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel2);
					Label wlabel3 = new Label(6, i+1, "注册登记日期" , format);
					wsheet.addCell(wlabel3);
					Label wlabel4 = new Label(7, i+1, null == crane.getDj_jingbanriqi()?"":DateFormatTool.formate(crane.getDj_jingbanriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel4);
					i=2;
					Label wlabel5 = new Label(0, i+1, "设备注册代码" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel5);
					Label wlabel6 = new Label(2, i+1, crane.getZhucedaima() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel6);
					Label wlabel7 = new Label(6, i+1, "更新日期" , format);
					wsheet.addCell(wlabel7);
					Label wlabel8 = new Label(7, i+1, null == crane.getBiangengriqi()? "" : DateFormatTool.formate(crane.getBiangengriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel8);
					i=3;
					Label wlabel9 = new Label(0, i+1, "单位内部编号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel9);
					Label wlabel10 = new Label(2, i+1, crane.getNeibubianhao() , format);
					wsheet.addCell(wlabel10);
					Label wlabel11 = new Label(3, i+1, "厂车牌照编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel11);
					Label wlabel12 = new Label(5, i+1, crane.getPaizhaohaoma() , format);
					wsheet.addCell(wlabel12);
					Label wlabel13 = new Label(6, i+1, "注册登记人员" , format);
					wsheet.addCell(wlabel13);
					Label wlabel14 = new Label(7, i+1, crane.getDj_jingbanren() , format);
					wsheet.addCell(wlabel14);
					i=4;
					Label wlabel15 = new Label(0, i+1, "产权单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel15);
					Label wlabel16 = new Label(2, i+1, crane.getChanquandanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel16);
					Label wlabel17 = new Label(6, i+1, "产权单位代码" , format);
					wsheet.addCell(wlabel17);
					Label wlabel18 = new Label(7, i+1, crane.getChanquandanwei_daima(), format);
					wsheet.addCell(wlabel18);
					i=5;
					Label wlabel19 = new Label(0, i+1, "产权单位地址" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel19);
					Label wlabel20 = new Label(2, i+1, crane.getChanquandanwei_dizhi(), format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel20);
					Label wlabel21 = new Label(6, i+1, "邮政编码" , format);
					wsheet.addCell(wlabel21);
					Label wlabel22 = new Label(7, i+1, crane.getChanquandanwei_youbian() , format);
					wsheet.addCell(wlabel22);
					i=6;
					Label wlabel23 = new Label(0, i+1, "单位法人代表" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel23);
					Label wlabel24 = new Label(2, i+1, crane.getChanquandanwei_farendaibiao() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel24);
					Label wlabel25 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel25);
					Label wlabel26 = new Label(7, i+1,  crane.getChanquandanwei_dianhua(), format);
					wsheet.addCell(wlabel26);
					i=7;
					Label wlabel27 = new Label(0, i+1, "使用单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel27);
					Label wlabel28 = new Label(2, i+1, crane.getShiyongdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel28);
					Label wlabel29 = new Label(6, i+1, "使用单位代码" , format);
					wsheet.addCell(wlabel29);
					Label wlabel30 = new Label(7, i+1, crane.getShiyongdanwei_code() , format);
					wsheet.addCell(wlabel30);
					i=8;
					Label wlabel31 = new Label(0, i+1, "使用单位地址" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel31);
					Label wlabel32 = new Label(2, i+1, crane.getShiyongdanwei_dizhi() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel32);
					Label wlabel33 = new Label(6, i+1, "邮政编码" , format);
					wsheet.addCell(wlabel33);
					Label wlabel34 = new Label(7, i+1, crane.getShiyongdanwei_youbian() , format);
					wsheet.addCell(wlabel34);
					i=9;
					Label wlabel35 = new Label(0, i+1, "安全管理部门" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel35);
					Label wlabel36 = new Label(2, i+1, crane.getAnquanguanlibumen() , format);
					wsheet.addCell(wlabel36);
					Label wlabel37 = new Label(3, i+1, "安全管理人员" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel37);
					Label wlabel38 = new Label(5, i+1, crane.getAnquanguanlirenyuan() , format);
					wsheet.addCell(wlabel38);
					Label wlabel39 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel39);
					Label wlabel40 = new Label(7, i+1, crane.getAnquanguanli_lianxidianhua() , format);
					wsheet.addCell(wlabel40);
					i=10;
					Label wlabel41 = new Label(0, i+1, "设备使用地点" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel41);
					Label wlabel42 = new Label(2, i+1, crane.getShebeididian() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel42);
					Label wlabel43 = new Label(6, i+1, "操作人员" , format);
					wsheet.addCell(wlabel43);
					Label wlabel44 = new Label(7, i+1, crane.getShiyongdanwei_caozuorenyuan() , format);
					wsheet.addCell(wlabel44);
					i=11;
					Label wlabel45 = new Label(0, i+1, "设备类别" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel45);
					Label wlabel46 = new Label(2, i+1, crane.getShebeileibie() , format);
					wsheet.addCell(wlabel46);
					Label wlabel47 = new Label(3, i+1, "设备名称" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel47);
					Label wlabel48 = new Label(5, i+1, crane.getShebeimingcheng() , format);
					wsheet.addCell(wlabel48);
					Label wlabel49 = new Label(6, i+1, "设备型号" , format);
					wsheet.addCell(wlabel49);
					Label wlabel50 = new Label(7, i+1, crane.getShebeixinghao() , format);
					wsheet.addCell(wlabel50);
					i=12;
					Label wlabel51 = new Label(0, i+1, "设计单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel51);
					Label wlabel52 = new Label(2, i+1, crane.getShejidanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel52);
					Label wlabel53 = new Label(6, i+1, "设计单位代码" , format);
					wsheet.addCell(wlabel53);
					Label wlabel54 = new Label(7, i+1, crane.getShejidanweidaima() , format);
					wsheet.addCell(wlabel54);
					i=13;
					Label wlabel55 = new Label(0, i+1, "制造单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel55);
					Label wlabel56 = new Label(2, i+1, crane.getZhizaodanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel56);
					Label wlabel57= new Label(6, i+1, "制造单位代码" , format);
					wsheet.addCell(wlabel57);
					Label wlabel58 = new Label(7, i+1, crane.getZhizaodanwei_code() , format);
					wsheet.addCell(wlabel58);
					i=14;
					Label wlabel59 = new Label(0, i+1, "资格证书名称" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel59);
					Label wlabel60 = new Label(2, i+1, crane.getZhizaodanwei_zigezhengshu() , format);
					wsheet.addCell(wlabel60);
					Label wlabel61 = new Label(3, i+1, "资格证书号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel61);
					Label wlabel62 = new Label(5, i+1, crane.getZhizaodanweixukezhengbianhao() , format);
					wsheet.addCell(wlabel62);
					Label wlabel63 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel63);
					Label wlabel64 = new Label(7, i+1, crane.getZhizaodanwei_lianxidianhua() , format);
					wsheet.addCell(wlabel64);
					i=15;
					Label wlabel65 = new Label(0, i+1, "制造年月" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel65);
					Label wlabel66 = new Label(2, i+1, null == crane.getZhizaoriqi_date() ? crane.getZhizaoriqi() : DateFormatTool.formate(crane.getZhizaoriqi_date(),"yyyy-MM-dd") , format);
					wsheet.addCell(wlabel66);
					Label wlabel67 = new Label(3, i+1, "出厂编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel67);
					Label wlabel68 = new Label(5, i+1, crane.getChuchangbianhao() , format);
					wsheet.addCell(wlabel68);
					Label wlabel69 = new Label(6, i+1, "适用场合" , format);
					wsheet.addCell(wlabel69);
					Label wlabel70 = new Label(7, i+1, crane.getShiyongchangsuo() , format);
					wsheet.addCell(wlabel70);
					i=16;
					Label wlabel71 = new Label(0, i+1, "安装单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel71);
					Label wlabel72 = new Label(2, i+1, crane.getAnzhuangdanwei(), format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel72);
					Label wlabel73= new Label(6, i+1, "安装单位代码" , format);
					wsheet.addCell(wlabel73);
					Label wlabel74 = new Label(7, i+1, crane.getAnzhuangdanwei_daima() , format);
					wsheet.addCell(wlabel74);
					i=17;
					Label wlabel75 = new Label(0, i+1, "资格证书编号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel75);
					Label wlabel76 = new Label(2, i+1, crane.getAnzhuangdanwei_zigezhengshu() , format);
					wsheet.addCell(wlabel76);
					Label wlabel77 = new Label(3, i+1, "项目负责人" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel77);
					Label wlabel78 = new Label(5, i+1, crane.getAnzhuangdanwei_lianxiren(), format);
					wsheet.addCell(wlabel78);
					Label wlabel79 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel79);
					Label wlabel80 = new Label(7, i+1, crane.getAnzhuangdanwei_lianxidianhua() , format);
					wsheet.addCell(wlabel80);
					i=18;
					Label wlabel81 = new Label(0, i+1, "土建施工单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel81);
					Label wlabel82 = new Label(2, i+1, crane.getShigongdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel82);
					Label wlabel83= new Label(6, i+1, "开始施工日期" , format);
					wsheet.addCell(wlabel83);
					Label wlabel84 = new Label(7, i+1, null == crane.getShigongdanwei_shigongriqi()?"":DateFormatTool.formate(crane.getShigongdanwei_shigongriqi(),"yyyy-MM-dd"), format);
					wsheet.addCell(wlabel84);
					i=19;
					Label wlabel85 = new Label(0, i+1, "土建验收单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel85);
					Label wlabel86 = new Label(2, i+1, crane.getYanshoudanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel86);
					Label wlabel87= new Label(6, i+1, "竣工验收日期" , format);
					wsheet.addCell(wlabel87);
					Label wlabel88 = new Label(7, i+1, null == crane.getShigongdanwei_jungongriqi()?"":DateFormatTool.formate(crane.getShigongdanwei_jungongriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel88);
					i=20;
					Label wlabel89 = new Label(0, i+1, "验收检验机构" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel89);
					Label wlabel90 = new Label(2, i+1, crane.getYanshoujigou(), format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel90);
					Label wlabel91 = new Label(6, i+1, "验收报告编号" , format);
					wsheet.addCell(wlabel91);
					Label wlabel92 = new Label(7, i+1, crane.getYanshoubaogaobianhao(), format);
					wsheet.addCell(wlabel92);
					i=21;
					Label wlabel93 = new Label(0, i+1, "投用日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel93);
					Label wlabel94 = new Label(2, i+1, null == crane.getTouyongriqi_date() ? crane.getTouyongriqi() : DateFormatTool.formate(crane.getTouyongriqi_date(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel94);
					Label wlabel95 = new Label(3, i+1, "维保周期(周)" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel95);
					Label wlabel96 = new Label(5, i+1, crane.getWeibaozhouqi() , format);
					wsheet.addCell(wlabel96);
					Label wlabel97 = new Label(6, i+1, "大修周期(月)" , format);
					wsheet.addCell(wlabel97);
					Label wlabel98 = new Label(7, i+1, crane.getDaxiuzhouqi() , format);
					wsheet.addCell(wlabel98);
					i=22;
					Label wlabel99 = new Label(0, i+1, "维修保养单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel99);
					Label wlabel100 = new Label(2, i+1, crane.getWeihubaoyangdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel100);
					Label wlabel101 = new Label(6, i+1, "维保单位代码" , format);
					wsheet.addCell(wlabel101);
					Label wlabel102 = new Label(7, i+1, crane.getWeihubaoyangdanwei_code() , format);
					wsheet.addCell(wlabel102);
					i=23;
					Label wlabel103 = new Label(0, i+1, "资格证书号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel103);
					Label wlabel104 = new Label(2, i+1, crane.getAnquanguanlibumen() , format);
					wsheet.addCell(wlabel104);
					Label wlabel105 = new Label(3, i+1, "维保责任人" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel105);
					Label wlabel106 = new Label(5, i+1, crane.getWeihubaoyangdanwei_lianxiren() , format);
					wsheet.addCell(wlabel106);
					Label wlabel107 = new Label(6, i+1, "电话" , format);
					wsheet.addCell(wlabel107);
					Label wlabel108 = new Label(7, i+1, crane.getWeihubaoyangdanwei_dianhua(), format);
					wsheet.addCell(wlabel108);
					i=24;
					Label wlabel109 = new Label(0, i+1, "所在车间分厂" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel109);
					Label wlabel110 = new Label(2, i+1, crane.getSuoshuchejian(), format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel110);
					Label wlabel111 = new Label(6, i+1, "" , format);
					wsheet.addCell(wlabel111);
					Label wlabel112 = new Label(7, i+1, "" , format);
					wsheet.addCell(wlabel112);
					i=25;
					Label wlabel113 = new Label(0, i+1, "检验单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel113);
					Label wlabel114 = new Label(2, i+1, crane.getJianyanjigou() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel114);
					Label wlabel115 = new Label(6, i+1, "检验单位代码" , format);
					wsheet.addCell(wlabel115);
					Label wlabel116 = new Label(7, i+1, crane.getJianyanjigou_code() , format);
					wsheet.addCell(wlabel116);
					i=26;
					Label wlabel117 = new Label(0, i+1, "检验日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel117);
					Label wlabel118 = new Label(2, i+1,  null == crane.getJianyankaishiriqi()? "" : DateFormatTool.formate(crane.getJianyankaishiriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel118);
					Label wlabel119 = new Label(3, i+1, "检验类别" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel119);
					Label wlabel120 = new Label(5, i+1, crane.getJianyanleixing() , format);
					wsheet.addCell(wlabel120);
					Label wlabel121 = new Label(6, i+1, "主要问题" , format);
					wsheet.addCell(wlabel121);
					Label wlabel122 = new Label(7, i+1, crane.getZhuyaowenti() , format);
					wsheet.addCell(wlabel122);
					i=27;
					Label wlabel123 = new Label(0, i+1, "检验结论" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel123);
					Label wlabel124 = new Label(2, i+1, crane.getJianyanjielun(), format);
					wsheet.addCell(wlabel124);
					Label wlabel125 = new Label(3, i+1, "报告书编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel125);
					Label wlabel126 = new Label(5, i+1, crane.getBaogaobianhao() , format);
					wsheet.addCell(wlabel126);
					Label wlabel127 = new Label(6, i+1, "下次检验日期" , format);
					wsheet.addCell(wlabel127);
					Label wlabel128 = new Label(7, i+1, null == crane.getXiacijianyanriqi()? "" : DateFormatTool.formate(crane.getXiacijianyanriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel128);
					i=28;
					Label wlabel129 = new Label(0, i+1, "事故类别" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel129);
					Label wlabel130 = new Label(2, i+1, crane.getShiguleibie() , format);
					wsheet.addCell(wlabel130);
					Label wlabel131 = new Label(3, i+1, "事故发生日期" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel131);
					Label wlabel132 = new Label(5, i+1, null == crane.getShigufashengriqi()?"":DateFormatTool.formate(crane.getShigufashengriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel132);
					Label wlabel133 = new Label(6, i+1, "事故处理结果" , format);
					wsheet.addCell(wlabel133);
					Label wlabel134 = new Label(7, i+1, crane.getShiguchulijieguo()  , format);
					wsheet.addCell(wlabel134);
					i=29;
					Label wlabel135 = new Label(0, i+1, "设备变动方式" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel135);
					Label wlabel136 = new Label(2, i+1, crane.getShebeibiandongfangshi(), format);
					wsheet.addCell(wlabel136);
					Label wlabel137 = new Label(3, i+1, "设备变动项目" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel137);
					Label wlabel138 = new Label(5, i+1, crane.getShebeibiandongxiangmu() , format);
					wsheet.addCell(wlabel138);
					Label wlabel139 = new Label(6, i+1, "设备变动日期" , format);
					wsheet.addCell(wlabel139);
					Label wlabel140 = new Label(7, i+1, null == crane.getShebeibiandongriqi()?"":DateFormatTool.formate(crane.getShebeibiandongriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel140);
					i=30;
					Label wlabel141 = new Label(0, i+1, "设备承担单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel141);
					Label wlabel142 = new Label(2, i+1, crane.getChengdandanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel142);
					Label wlabel143 = new Label(6, i+1, "承担单位代码" , format);
					wsheet.addCell(wlabel143);
					Label wlabel144 = new Label(7, i+1, crane.getChengdandanwei_code() , format);
					wsheet.addCell(wlabel144);
					i=31;
					Label wlabel198 = new Label(0, i+1, "厂车牌照编号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel198);
					Label wlabel199 = new Label(2, i+1, crane.getPaizhaohaoma() , format);
					wsheet.addCell(wlabel199);
					Label wlabel200 = new Label(3, i+1, "厂内车辆运行速度" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel200);
					Label wlabel201 = new Label(5, i+1, crane.getYunxingsudu(), format);
					wsheet.addCell(wlabel201);
					Label wlabel202 = new Label(6, i+1, "厂内车辆额定载荷" , format);
					wsheet.addCell(wlabel202);
					Label wlabel203 = new Label(7, i+1, null == crane.getChangneicheliang_edingzaihe() ? "":crane.getChangneicheliang_edingzaihe().toString(), format);
					wsheet.addCell(wlabel203);
					i=32;
					Label wlabel145 = new Label(0, i+1, "厂内机动车辆登记卡（基本信息）" , titleFormat);
					wsheet.mergeCells(0, i+1, 7, i+1);
					wsheet.addCell(wlabel145);
					i=33;
					Label wlabel146 = new Label(0, i+1, "使用登记证号码" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel146);
					Label wlabel147 = new Label(2, i+1, crane.getDengjizhengbianhao() , format);
					wsheet.mergeCells(2, i+1, 4, i+1);
					wsheet.addCell(wlabel147);
					Label wlabel148 = new Label(5, i+1, "注册代码" , format);
					wsheet.addCell(wlabel148);
					Label wlabel149 = new Label(6, i+1, crane.getZhucedaima() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel149);
					i=34;
					Label wlabel150 = new Label(0, i+1, "使用单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel150);
					Label wlabel151 = new Label(2, i+1, crane.getShiyongdanwei(), format);
					wsheet.mergeCells(2, i+1, 7, i+1);
					wsheet.addCell(wlabel151);
					i=35;
					Label wlabel152 = new Label(0, i+1, "详细地址" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel152);
					Label wlabel153 = new Label(2, i+1, crane.getShiyongdanwei_dizhi() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel153);
					Label wlabel154 = new Label(6, i+1, "邮政编码" , format);
					wsheet.addCell(wlabel154);
					Label wlabel155 = new Label(7, i+1, crane.getShiyongdanwei_youbian(), format);
					wsheet.addCell(wlabel155);
					i=36;
					Label wlabel156 = new Label(0, i+1, "使用单位地址(省)" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel156);
					Label wlabel157 = new Label(2, i+1, "鲁" , format);
					wsheet.addCell(wlabel157);
					Label wlabel158 = new Label(3, i+1, "市" , format);
					wsheet.addCell(wlabel158);
					Label wlabel159 = new Label(4, i+1, crane.getShi() , format);
					wsheet.addCell(wlabel159);
					Label wlabel160 = new Label(5, i+1, "区（县）" , format);
					wsheet.addCell(wlabel160);
					Label wlabel161 = new Label(6, i+1, crane.getQuhuamingcheng() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel161);
					i=37;
					Label wlabel193 = new Label(0, i+1, "所在乡镇" , format);
					wsheet.mergeCells(0, i+1, 2, i+1);
					wsheet.addCell(wlabel193);
					Label wlabel194 = new Label(3, i+1, crane.getXiangzhen() , format);
					wsheet.mergeCells(3, i+1, 5, i+1);
					wsheet.addCell(wlabel194);
					Label wlabel195 = new Label(6, i+1, "所在村" , format);
					wsheet.addCell(wlabel195);
					Label wlabel196 = new Label(7, i+1, "" , format);
					wsheet.addCell(wlabel196);
					i=38;
					Label wlabel162 = new Label(0, i+1, "法定代表人" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel162);
					Label wlabel163 = new Label(2, i+1, crane.getFadingdaibiaoren() , format);
					wsheet.addCell(wlabel163);
					Label wlabel164 = new Label(3, i+1, "电话(或总机)" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel164);
					Label wlabel165 = new Label(5, i+1, crane.getShiyongdanwei_lianxidianhua() , format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel165);
					i=39;
					Label wlabel166 = new Label(0, i+1, "E-Mail" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel166);
					Label wlabel167 = new Label(2, i+1, "" , format);
					wsheet.mergeCells(2, i+1, 3, i+1);
					wsheet.addCell(wlabel167);
					Label wlabel168 = new Label(4, i+1, "传真" , format);
					wsheet.addCell(wlabel168);
					Label wlabel169 = new Label(5, i+1, crane.getShiyongdanwei_chuanzhen() , format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel169);
					i=40;
					Label wlabel170 = new Label(0, i+1, "主管负责人" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel170);
					Label wlabel171 = new Label(2, i+1, crane.getZhuguanfuzeren(), format);
					wsheet.addCell(wlabel171);
					Label wlabel172 = new Label(3, i+1, "主管负责人电话" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel172);
					Label wlabel173 = new Label(5, i+1, crane.getZhuguanfuzerendianhua() , format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel173);
					i=41;
					Label wlabel174 = new Label(0, i+1, "经办人" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel174);
					Label wlabel175 = new Label(2, i+1, crane.getJingbanren() , format);
					wsheet.addCell(wlabel175);
					Label wlabel176 = new Label(3, i+1, "经办人电话" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel176);
					Label wlabeljbrdh = new Label(5, i+1, "" , format);
					wsheet.addCell(wlabeljbrdh);
					Label wlabel177 = new Label(6, i+1, "手机或传呼" , format);
					wsheet.addCell(wlabel177);
					Label wlabel178 = new Label(7, i+1, crane.getJingbanrendianhua() , format);
					wsheet.addCell(wlabel178);
					i=42;
					Label wlabel179 = new Label(0, i+1, "填表日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel179);
					Label wlabel180 = new Label(2, i+1, null == crane.getTianbiaoriqi()?"":DateFormatTool.formate(crane.getTianbiaoriqi(), "yyyy-MM-dd"), format);
					wsheet.addCell(wlabel180);
					Label wlabel181 = new Label(3, i+1, "是否在人口密集区" , format);
					wsheet.mergeCells(3, i+1, 5, i+1);
					wsheet.addCell(wlabel181);
					Label wlabel182 = new Label(6, i+1, crane.getShifou_renkoumijiqu() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel182);
					i=43;
					Label wlabel183 = new Label(0, i+1, "是否重大危险源" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel183);
					Label wlabel184 = new Label(2, i+1, crane.getShifou_zhongdaweixianyuan() , format);
					wsheet.addCell(wlabel184);
					Label wlabel185 = new Label(3, i+1, "是否制定事故应急措施和救援预案" , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel185);
					Label wlabel186 = new Label(7, i+1, crane.getShifou_yingjifangan(), format);
					wsheet.addCell(wlabel186);
					i=44;
					Label wlabel187 = new Label(0, i+1, "" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel187);
					Label wlabel188 = new Label(2, i+1, "" , format);
					wsheet.addCell(wlabel188);
					Label wlabel189 = new Label(3, i+1, "是否重点监控特种设备" , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel189);
					Label wlabel190 = new Label(7, i+1, crane.getShifou_zhongdianjiankong() , format);
					wsheet.addCell(wlabel190);
					i=45;
					Label wlabel191 = new Label(0, i+1, "备注" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel191);
					Label wlabel192 = new Label(2, i+1, crane.getBeizhu() , format);
					wsheet.mergeCells(2, i+1, 7, i+1);
					wsheet.addCell(wlabel192);
					
					
				workbook.write();
				workbook.close();
				os.close();
			} catch (Exception e) {
				
			}
		}else if("6000".equals(report.getShebeizhongleidaima())){
			TRecreationParam elevator = (TRecreationParam) super.findById(Long.parseLong(id), TRecreationParam.class.getName());
			
			try {
				// 创建Excel
				workbook = Workbook.createWorkbook(os);
				// 在Excel中新建一个sheet
				WritableSheet wsheet = workbook.createSheet("游乐设施", 0);
				//去掉整个sheet中的网格线
				wsheet.getSettings().setShowGridLines(false);
				wsheet.getSettings().setPaperSize(PaperSize.A4);
				wsheet.getSettings().setFitHeight(297) ;                        // 打印区高度
		        wsheet.getSettings().setFitWidth(210) ;                        // 打印区宽度    
		        // 设置边距            
	            wsheet.getSettings().setTopMargin(0.5) ;
	            wsheet.getSettings().setBottomMargin(0.3) ;
	            wsheet.getSettings().setLeftMargin(0.3) ;
	            wsheet.getSettings().setRightMargin(0.3) ;
	            
				String[] titles = new String[8];
				for (int i = 0; i < titles.length; i++) {
					if(i==0 || i==1 || i==3 || i==4){
						wsheet.setColumnView(i, 8);
					}else if(i==2 || i==5 ){
						wsheet.setColumnView(i, 16);
					}else{
						wsheet.setColumnView(i,17);
					}
				}
				for(int i = 1;i<38;i++){
					wsheet.setRowView(i, 350);
				}
				// 标题字体
				WritableFont font = new WritableFont(WritableFont.ARIAL, 12,
						WritableFont.BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);
				WritableCellFormat titleFormat = new WritableCellFormat(font);
				//水平居中对齐
				titleFormat.setAlignment(Alignment.CENTRE);
	            //竖直方向居中对齐
				titleFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
				// 内容字体
				font = new jxl.write.WritableFont(WritableFont.createFont("宋体"),
						12, WritableFont.NO_BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);

				WritableCellFormat format = new jxl.write.WritableCellFormat(font);
				format.setAlignment(Alignment.CENTRE);
				format.setVerticalAlignment(VerticalAlignment.CENTRE);
				format.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				format.setWrap(true);
				
				WritableCellFormat formatNoBorder = new jxl.write.WritableCellFormat(font);
				formatNoBorder.setAlignment(Alignment.CENTRE);
				formatNoBorder.setVerticalAlignment(VerticalAlignment.CENTRE);
				formatNoBorder.setWrap(true);
				
				DateFormat date = new DateFormat("yyyy-MM-dd");
				WritableCellFormat format2 = new jxl.write.WritableCellFormat(date);
				format2.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
					int i = 1;
					Label wlabel0 = new Label(0, 0, "特种设备使用登记表" , titleFormat);
					wsheet.mergeCells(0, 0, 7, 0);
					wsheet.addCell(wlabel0);
					Label wlabeldwz = new Label(0, i, "（使用单位印章）" , formatNoBorder);
					wsheet.mergeCells(0, i, 2, i);
					wsheet.addCell(wlabeldwz);
					Label wlabelzcdwz = new Label(6, i, "（注册单位印章）" , formatNoBorder);
					wsheet.mergeCells(6, i, 7, i);
					wsheet.addCell(wlabelzcdwz);
					Label wlabel1 = new Label(0, i+1, "注册登记机构" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel1);
					Label wlabel2 = new Label(2, i+1, elevator.getZhucedengjijigou() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel2);
					Label wlabel3 = new Label(6, i+1, "注册登记日期" , format);
					wsheet.addCell(wlabel3);
					//DateTime wlabel4 = new DateTime(7, i+1, elevator.getDj_jingbanriqi() , format2);
					Label wlabel4 = new Label(7, i+1, null == elevator.getDj_jingbanriqi()? "" : DateFormatTool.formate(elevator.getDj_jingbanriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel4);
					i=2;
					Label wlabel5 = new Label(0, i+1, "设备注册代码" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel5);
					Label wlabel6 = new Label(2, i+1, elevator.getZhucedaima() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel6);
					Label wlabel7 = new Label(6, i+1, "更新日期" , format);
					wsheet.addCell(wlabel7);
					Label wlabel8 = new Label(7, i+1, null == elevator.getBiangengriqi()? "" : DateFormatTool.formate(elevator.getBiangengriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel8);
					i=3;
					Label wlabel9 = new Label(0, i+1, "单位内部编号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel9);
					Label wlabel10 = new Label(2, i+1, elevator.getNeibubianhao() , format);
					wsheet.addCell(wlabel10);
					Label wlabel11 = new Label(3, i+1, "厂车牌照编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel11);
					Label wlabel12 = new Label(5, i+1, "", format);
					wsheet.addCell(wlabel12);
					Label wlabel13 = new Label(6, i+1, "注册登记人员" , format);
					wsheet.addCell(wlabel13);
					Label wlabel14 = new Label(7, i+1, elevator.getDj_jingbanren() , format);
					wsheet.addCell(wlabel14);
					i=4;
					Label wlabel15 = new Label(0, i+1, "产权单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel15);
					Label wlabel16 = new Label(2, i+1, elevator.getChanquandanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel16);
					Label wlabel17 = new Label(6, i+1, "产权单位代码" , format);
					wsheet.addCell(wlabel17);
					Label wlabel18 = new Label(7, i+1, elevator.getChanquandanwei_daima() , format);
					wsheet.addCell(wlabel18);
					i=5;
					Label wlabel19 = new Label(0, i+1, "产权单位地址" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel19);
					Label wlabel20 = new Label(2, i+1, elevator.getChanquandanwei_dizhi() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel20);
					Label wlabel21 = new Label(6, i+1, "邮政编码" , format);
					wsheet.addCell(wlabel21);
					Label wlabel22 = new Label(7, i+1, elevator.getChanquandanwei_youbian(), format);
					wsheet.addCell(wlabel22);
					i=6;
					Label wlabel23 = new Label(0, i+1, "单位法人代表" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel23);
					Label wlabel24 = new Label(2, i+1, elevator.getChanquandanwei_farendaibiao() , format);
					wsheet.addCell(wlabel24);
					Label wlabelglfzr = new Label(3, i+1, "管理负责人" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabelglfzr);
					Label wlabelglfzrv = new Label(5, i+1, "", format);
					wsheet.addCell(wlabelglfzrv);
					Label wlabel25 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel25);
					Label wlabel26 = new Label(7, i+1, elevator.getChanquandanwei_dianhua() , format);
					wsheet.addCell(wlabel26);
					i=7;
					Label wlabel27 = new Label(0, i+1, "使用单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel27);
					Label wlabel28 = new Label(2, i+1, elevator.getShiyongdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel28);
					Label wlabel29 = new Label(6, i+1, "使用单位代码" , format);
					wsheet.addCell(wlabel29);
					Label wlabel30 = new Label(7, i+1, elevator.getShiyongdanwei_code() , format);
					wsheet.addCell(wlabel30);
					i=8;
					Label wlabel31 = new Label(0, i+1, "使用单位地址" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel31);
					Label wlabel32 = new Label(2, i+1, elevator.getShiyongdanwei_dizhi() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel32);
					Label wlabel33 = new Label(6, i+1, "邮政编码" , format);
					wsheet.addCell(wlabel33);
					Label wlabel34 = new Label(7, i+1, elevator.getShiyongdanwei_youbian() , format);
					wsheet.addCell(wlabel34);
					i=9;
					Label wlabel35 = new Label(0, i+1, "安全管理部门" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel35);
					Label wlabel36 = new Label(2, i+1, elevator.getAnquanguanlibumen() , format);
					wsheet.addCell(wlabel36);
					Label wlabel37 = new Label(3, i+1, "安全管理人员" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel37);
					Label wlabel38 = new Label(5, i+1, elevator.getAnquanguanlirenyuan() , format);
					wsheet.addCell(wlabel38);
					Label wlabel39 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel39);
					Label wlabel40 = new Label(7, i+1, elevator.getAnquanguanli_lianxidianhua() , format);
					wsheet.addCell(wlabel40);
					i=10;
					Label wlabel41 = new Label(0, i+1, "设备使用地点" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel41);
					Label wlabel42 = new Label(2, i+1, elevator.getShebeididian() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel42);
					Label wlabel43 = new Label(6, i+1, "操作人员" , format);
					wsheet.addCell(wlabel43);
					Label wlabel44 = new Label(7, i+1, elevator.getShiyongdanwei_caozuorenyuan() , format);
					wsheet.addCell(wlabel44);
					i=11;
					Label wlabel45 = new Label(0, i+1, "设备类别" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel45);
					Label wlabel46 = new Label(2, i+1, elevator.getShebeileibie() , format);
					wsheet.addCell(wlabel46);
					Label wlabel47 = new Label(3, i+1, "设备名称" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel47);
					Label wlabel48 = new Label(5, i+1, elevator.getShebeimingcheng() , format);
					wsheet.addCell(wlabel48);
					Label wlabel49 = new Label(6, i+1, "设备型号" , format);
					wsheet.addCell(wlabel49);
					Label wlabel50 = new Label(7, i+1, elevator.getShebeixinghao() , format);
					wsheet.addCell(wlabel50);
					i=12;
					Label wlabel51 = new Label(0, i+1, "设计单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel51);
					Label wlabel52 = new Label(2, i+1, elevator.getShejidanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel52);
					Label wlabel53 = new Label(6, i+1, "设计单位代码" , format);
					wsheet.addCell(wlabel53);
					Label wlabel54 = new Label(7, i+1, elevator.getShejidanweidaima() , format);
					wsheet.addCell(wlabel54);
					i=13;
					Label wlabel55 = new Label(0, i+1, "制造单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel55);
					Label wlabel56 = new Label(2, i+1, elevator.getZhizaodanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel56);
					Label wlabel57= new Label(6, i+1, "制造单位代码" , format);
					wsheet.addCell(wlabel57);
					Label wlabel58 = new Label(7, i+1, elevator.getZhizaodanwei_code() , format);
					wsheet.addCell(wlabel58);
					i=14;
					Label wlabel59 = new Label(0, i+1, "资格证书名称" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel59);
					Label wlabel60 = new Label(2, i+1, elevator.getZhizaodanwei_zigezhengshu() , format);
					wsheet.addCell(wlabel60);
					Label wlabel61 = new Label(3, i+1, "资格证书号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel61);
					Label wlabel62 = new Label(5, i+1, elevator.getZhizaodanweixukezhengbianhao() , format);
					wsheet.addCell(wlabel62);
					Label wlabel63 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel63);
					Label wlabel64 = new Label(7, i+1, elevator.getZhizaodanwei_lianxidianhua() , format);
					wsheet.addCell(wlabel64);
					i=15;
					Label wlabel65 = new Label(0, i+1, "制造年月" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel65);
					Label wlabel66 = new Label(2, i+1, null == elevator.getZhizaoriqi_date() ? elevator.getZhizaoriqi() : DateFormatTool.formate(elevator.getZhizaoriqi_date(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel66);
					Label wlabel67 = new Label(3, i+1, "出厂编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel67);
					Label wlabel68 = new Label(5, i+1, elevator.getChuchangbianhao() , format);
					wsheet.addCell(wlabel68);
					Label wlabel69 = new Label(6, i+1, "适用场合" , format);
					wsheet.addCell(wlabel69);
					Label wlabel70 = new Label(7, i+1, elevator.getShiyongchangsuo(), format);
					wsheet.addCell(wlabel70);
					i=16;
					Label wlabel71 = new Label(0, i+1, "安装单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel71);
					Label wlabel72 = new Label(2, i+1, elevator.getShigongdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel72);
					Label wlabel73= new Label(6, i+1, "安装单位代码" , format);
					wsheet.addCell(wlabel73);
					Label wlabel74 = new Label(7, i+1, elevator.getAnzhuangdanwei_daima() , format);
					wsheet.addCell(wlabel74);
					i=17;
					Label wlabel75 = new Label(0, i+1, "资格证书编号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel75);
					Label wlabel76 = new Label(2, i+1, elevator.getAnzhuangdanwei_zigezhengshu(), format);
					wsheet.addCell(wlabel76);
					Label wlabel77 = new Label(3, i+1, "项目负责人" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel77);
					Label wlabel78 = new Label(5, i+1, elevator.getAnzhuangdanwei_lianxiren() , format);
					wsheet.addCell(wlabel78);
					Label wlabel79 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel79);
					Label wlabel80 = new Label(7, i+1, elevator.getAnzhuangdanwei_lianxidianhua() , format);
					wsheet.addCell(wlabel80);
					i=18;
					Label wlabel81 = new Label(0, i+1, "土建施工单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel81);
					Label wlabel82 = new Label(2, i+1, elevator.getShigongdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel82);
					Label wlabel83= new Label(6, i+1, "开始施工日期" , format);
					wsheet.addCell(wlabel83);
					Label wlabel84 = new Label(7, i+1, elevator.getShigongdanwei_shigongriqi() == null?"":DateFormatTool.formate(elevator.getShigongdanwei_shigongriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel84);
					i=19;
					Label wlabel85 = new Label(0, i+1, "土建验收单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel85);
					Label wlabel86 = new Label(2, i+1, elevator.getYanshoudanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel86);
					Label wlabel87= new Label(6, i+1, "竣工验收日期" , format);
					wsheet.addCell(wlabel87);
					Label wlabel88 = new Label(7, i+1, elevator.getShigongdanwei_jungongriqi() == null?"":DateFormatTool.formate(elevator.getShigongdanwei_jungongriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel88);
					i=20;
					Label wlabel89 = new Label(0, i+1, "验收检验机构" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel89);
					Label wlabel90 = new Label(2, i+1, elevator.getYanshoujigou(), format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel90);
					Label wlabel91 = new Label(6, i+1, "验收报告编号" , format);
					wsheet.addCell(wlabel91);
					Label wlabel92 = new Label(7, i+1, elevator.getYanshoubaogaobianhao(), format);
					wsheet.addCell(wlabel92);
					i=21;
					Label wlabel93 = new Label(0, i+1, "投用日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel93);
					Label wlabel94 = new Label(2, i+1, null == elevator.getTouyongriqi_date() ? elevator.getTouyongriqi() : DateFormatTool.formate(elevator.getTouyongriqi_date(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel94);
					Label wlabel95 = new Label(3, i+1, "维保周期( 周)" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel95);
					Label wlabel96 = new Label(5, i+1, elevator.getWeibaozhouqi(), format);
					wsheet.addCell(wlabel96);
					Label wlabel97 = new Label(6, i+1, "大修周期(月)" , format);
					wsheet.addCell(wlabel97);
					Label wlabel98 = new Label(7, i+1, elevator.getDaxiuzhouqi(), format);
					wsheet.addCell(wlabel98);
					i=22;
					Label wlabel99 = new Label(0, i+1, "维修保养单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel99);
					Label wlabel100 = new Label(2, i+1, elevator.getWeihubaoyangdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel100);
					Label wlabel101 = new Label(6, i+1, "维保单位代码" , format);
					wsheet.addCell(wlabel101);
					Label wlabel102 = new Label(7, i+1, elevator.getWeihubaoyangdanwei_code(), format);
					wsheet.addCell(wlabel102);
					i=23;
					Label wlabel103 = new Label(0, i+1, "资格证书号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel103);
					Label wlabel104 = new Label(2, i+1, elevator.getWhbydw_zizhizhengshu() , format);
					wsheet.addCell(wlabel104);
					Label wlabel105 = new Label(3, i+1, "维保责任人" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel105);
					Label wlabel106 = new Label(5, i+1, elevator.getWeihubaoyangdanwei_lianxiren() , format);
					wsheet.addCell(wlabel106);
					Label wlabel107 = new Label(6, i+1, "电话" , format);
					wsheet.addCell(wlabel107);
					Label wlabel108 = new Label(7, i+1, elevator.getWeihubaoyangdanwei_dianhua(), format);
					wsheet.addCell(wlabel108);
					i=24;
					Label wlabel197 = new Label(0, i+1, "设备主要参数" , titleFormat);
					wsheet.mergeCells(0, i+1, 7, i+1);
					wsheet.addCell(wlabel197);
					i=25;
					Label wlabel198 = new Label(0, i+1, "游乐设施线速度" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel198);
					Label wlabel199 = new Label(2, i+1, elevator.getXiansudu() , format);
					wsheet.addCell(wlabel199);
					Label wlabel200 = new Label(3, i+1, "游乐设施高度" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel200);
					Label wlabel201 = new Label(5, i+1, elevator.getYlss_gaodu(), format);
					wsheet.addCell(wlabel201);
					Label wlabel202 = new Label(6, i+1, "额定乘客人数" , format);
					wsheet.addCell(wlabel202);
					Label wlabel203 = new Label(7, i+1, elevator.getEdingchengkerenshu(), format);
					wsheet.addCell(wlabel203);
					i=26;
					Label wlabel204 = new Label(0, i+1, "额定载荷" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel204);
					Label wlabel205 = new Label(2, i+1, elevator.getEdingzaihe(), format);
					wsheet.addCell(wlabel205);
					Label wlabel206 = new Label(3, i+1, "额定速度" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel206);
					Label wlabel207 = new Label(5, i+1, elevator.getSudu(), format);
					wsheet.addCell(wlabel207);
					Label wlabel208 = new Label(6, i+1, "倾夹角或坡度" , format);
					wsheet.addCell(wlabel208);
					Label wlabel209 = new Label(7, i+1, elevator.getQingjiao(), format);
					wsheet.addCell(wlabel209);
					i=27;
					Label wlabel210 = new Label(0, i+1, "副速度" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel210);
					Label wlabel211 = new Label(2, i+1, elevator.getFusudu(), format);
					wsheet.addCell(wlabel211);
					Label wlabel212 = new Label(3, i+1, "驱动形式" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel212);
					Label wlabel213 = new Label(5, i+1, elevator.getQudongxingshi(), format);
					wsheet.addCell(wlabel213);
					Label wlabel214 = new Label(6, i+1, "驱动主功率" , format);
					wsheet.addCell(wlabel214);
					Label wlabel215 = new Label(7, i+1, elevator.getQudongzhugonglv(), format);
					wsheet.addCell(wlabel215);
					i=28;
					Label wlabel216 = new Label(0, i+1, "电压" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel216);
					Label wlabel217 = new Label(2, i+1, elevator.getDianya(), format);
					wsheet.addCell(wlabel217);
					Label wlabel218 = new Label(3, i+1, "副功率" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel218);
					Label wlabel219 = new Label(5, i+1, elevator.getFugonglv(), format);
					wsheet.addCell(wlabel219);
					Label wlabelzcgd = new Label(6, i+1, "座舱高度" , format);
					wsheet.addCell(wlabelzcgd);
					Label wlabelzcgdv = new Label(7, i+1, elevator.getGaodu(), format);
					wsheet.addCell(wlabelzcgdv);
					i=29;
					Label wlabelhzzj = new Label(0, i+1, "回转直径" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabelhzzj);
					Label wlabelhzzjv = new Label(2, i+1, elevator.getHuizhuanzhijing(), format);
					wsheet.addCell(wlabelhzzjv);
					Label wlabelgj = new Label(3, i+1, "轨距" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabelgj);
					Label wlabelgjv = new Label(5, i+1, elevator.getGuiju(), format);
					wsheet.addCell(wlabelgjv);
					Label wlabelgjcd = new Label(6, i+1, "轨距长度" , format);
					wsheet.addCell(wlabelgjcd);
					Label wlabelgjcdv = new Label(7, i+1, elevator.getGuijuchangdu(), format);
					wsheet.addCell(wlabelgjcdv);
					i=30;
					Label wlabelshtgd = new Label(0, i+1, "水滑梯高度" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabelshtgd);
					Label wlabelshtgdv = new Label(2, i+1, elevator.getShuihuatigaodu(), format);
					wsheet.addCell(wlabelshtgdv);
					Label wlabelylcss = new Label(3, i+1, "游乐池水深" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabelylcss);
					Label wlabelylcssv = new Label(5, i+1, elevator.getYoulechishuishen(), format);
					wsheet.addCell(wlabelylcssv);
					Label wlabelnull = new Label(6, i+1, "" , format);
					wsheet.addCell(wlabelnull);
					Label wlabelnullv = new Label(7, i+1, "", format);
					wsheet.addCell(wlabelnullv);
					i=31;
					Label wlabel113 = new Label(0, i+1, "检验单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel113);
					Label wlabel114 = new Label(2, i+1, elevator.getJianyanjigou(), format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel114);
					Label wlabel115 = new Label(6, i+1, "检验单位代码" , format);
					wsheet.addCell(wlabel115);
					Label wlabel116 = new Label(7, i+1, elevator.getJianyanjigou_code() , format);
					wsheet.addCell(wlabel116);
					i=32;
					Label wlabel117 = new Label(0, i+1, "检验日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel117);
					Label wlabel118 = new Label(2, i+1,  null == elevator.getJianyankaishiriqi()? "" : DateFormatTool.formate(elevator.getJianyankaishiriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel118);
					Label wlabel119 = new Label(3, i+1, "检验类别" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel119);
					Label wlabel120 = new Label(5, i+1, elevator.getJianyanleixing() , format);
					wsheet.addCell(wlabel120);
					Label wlabel121 = new Label(6, i+1, "主要问题" , format);
					wsheet.addCell(wlabel121);
					Label wlabel122 = new Label(7, i+1, elevator.getZhuyaowenti(), format);
					wsheet.addCell(wlabel122);
					i=33;
					Label wlabel123 = new Label(0, i+1, "检验结论" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel123);
					Label wlabel124 = new Label(2, i+1, elevator.getJianyanjielun(), format);
					wsheet.addCell(wlabel124);
					Label wlabel125 = new Label(3, i+1, "报告书编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel125);
					Label wlabel126 = new Label(5, i+1, elevator.getBaogaobianhao() , format);
					wsheet.addCell(wlabel126);
					Label wlabel127 = new Label(6, i+1, "下次检验日期" , format);
					wsheet.addCell(wlabel127);
					Label wlabel128 = new Label(7, i+1, null == elevator.getXiacijianyanriqi()? "" : DateFormatTool.formate(elevator.getXiacijianyanriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel128);
					i=34;
					Label wlabel129 = new Label(0, i+1, "事故类别" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel129);
					Label wlabel130 = new Label(2, i+1, elevator.getShiguleibie() , format);
					wsheet.addCell(wlabel130);
					Label wlabel131 = new Label(3, i+1, "事故发生日期" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel131);
					Label wlabel132 = new Label(5, i+1, null == elevator.getShigufashengriqi()?"":DateFormatTool.formate(elevator.getShigufashengriqi(), "yyyy-MM-dd"), format);
					wsheet.addCell(wlabel132);
					Label wlabel133 = new Label(6, i+1, "事故处理结果" , format);
					wsheet.addCell(wlabel133);
					Label wlabel134 = new Label(7, i+1, elevator.getShiguchulijieguo()  , format);
					wsheet.addCell(wlabel134);
					i=35;
					Label wlabel135 = new Label(0, i+1, "设备变动方式" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel135);
					Label wlabel136 = new Label(2, i+1, elevator.getShebeibiandongfangshi(), format);
					wsheet.addCell(wlabel136);
					Label wlabel137 = new Label(3, i+1, "设备变动项目" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel137);
					Label wlabel138 = new Label(5, i+1, elevator.getShebeibiandongxiangmu(), format);
					wsheet.addCell(wlabel138);
					Label wlabel139 = new Label(6, i+1, "设备变动日期" , format);
					wsheet.addCell(wlabel139);
					Label wlabel140 = new Label(7, i+1, null == elevator.getShebeibiandongriqi()?"":DateFormatTool.formate(elevator.getShebeibiandongriqi(), "yyyy-MM-dd"), format);
					wsheet.addCell(wlabel140);
					i=36;
					Label wlabel141 = new Label(0, i+1, "设备承担单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel141);
					Label wlabel142 = new Label(2, i+1, elevator.getChengdandanwei(), format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel142);
					Label wlabel143 = new Label(6, i+1, "承担单位代码" , format);
					wsheet.addCell(wlabel143);
					Label wlabel144 = new Label(7, i+1, elevator.getChengdandanwei_code() , format);
					wsheet.addCell(wlabel144);
		/*			i=30;
					Label wlabel145 = new Label(0, i+1, "游乐设施登记卡（基本信息）" , format1);
					wsheet.mergeCells(1, i+1, 7, i+1);
					wsheet.addCell(wlabel145);
					i=31;
					Label wlabel146 = new Label(0, i+1, "使用登记证号码" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel146);
					Label wlabel147 = new Label(2, i+1, elevator.getDengjizhengbianhao() , format);
					wsheet.mergeCells(2, i+1, 4, i+1);
					wsheet.addCell(wlabel147);
					Label wlabel148 = new Label(5, i+1, "承担单位代码" , format);
					wsheet.addCell(wlabel148);
					Label wlabel149 = new Label(6, i+1, elevator.getChengdandanwei_code() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel149);
					i=32;
					Label wlabel150 = new Label(0, i+1, "使用单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel150);
					Label wlabel151 = new Label(2, i+1, elevator.getShiyongdanwei(), format);
					wsheet.mergeCells(2, i+1, 7, i+1);
					wsheet.addCell(wlabel151);
					i=33;
					Label wlabel152 = new Label(0, i+1, "详细地址" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel152);
					Label wlabel153 = new Label(2, i+1, elevator.getShiyongdanwei_dizhi() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel153);
					Label wlabel154 = new Label(6, i+1, "邮政编码" , format);
					wsheet.addCell(wlabel154);
					Label wlabel155 = new Label(7, i+1, elevator.getShiyongdanwei_youbian(), format);
					wsheet.addCell(wlabel155);
					i=34;
					Label wlabel156 = new Label(0, i+1, "使用单位地址(省)" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel156);
					Label wlabel157 = new Label(2, i+1, "" , format);
					wsheet.addCell(wlabel157);
					Label wlabel158 = new Label(3, i+1, "市" , format);
					wsheet.addCell(wlabel158);
					Label wlabel159 = new Label(4, i+1, elevator.getShi() , format);
					wsheet.addCell(wlabel159);
					Label wlabel160 = new Label(5, i+1, "区（县）" , format);
					wsheet.addCell(wlabel160);
					Label wlabel161 = new Label(6, i+1, elevator.getQuhuamingcheng() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel161);
					i=35;
					Label wlabel162 = new Label(0, i+1, "法定代表人" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel162);
					Label wlabel163 = new Label(2, i+1, elevator.getFadingdaibiaoren() , format);
					wsheet.addCell(wlabel163);
					Label wlabel164 = new Label(3, i+1, "电话（或总机）" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel164);
					Label wlabel165 = new Label(5, i+1, elevator.getShiyongdanwei_lianxidianhua(), format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel165);
					i=36;
					Label wlabel166 = new Label(0, i+1, "E-Mail" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel166);
					Label wlabel167 = new Label(2, i+1, "" , format);
					wsheet.mergeCells(2, i+1, 3, i+1);
					wsheet.addCell(wlabel167);
					Label wlabel168 = new Label(4, i+1, "传真" , format);
					wsheet.addCell(wlabel168);
					Label wlabel169 = new Label(5, i+1, elevator.getShiyongdanwei_chuanzhen() , format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel169);
					i=37;
					Label wlabel170 = new Label(0, i+1, "主管负责人" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel170);
					Label wlabel171 = new Label(2, i+1, elevator.getZhuguanfuzeren(), format);
					wsheet.addCell(wlabel171);
					Label wlabel172 = new Label(3, i+1, "主管负责人电话" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel172);
					Label wlabel173 = new Label(5, i+1, elevator.getZhuguanfuzerendianhua(), format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel173);
					i=38;
					Label wlabel174 = new Label(0, i+1, "经办人" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel174);
					Label wlabel175 = new Label(2, i+1, elevator.getJingbanren(), format);
					wsheet.addCell(wlabel175);
					Label wlabel176 = new Label(3, i+1, "经办人电话" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel176);
					Label wlabel177 = new Label(5, i+1, "手机或传呼" , format);
					wsheet.addCell(wlabel177);
					Label wlabel178 = new Label(6, i+1, elevator.getJingbanrendianhua() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel178);
					i=39;
					Label wlabel179 = new Label(0, i+1, "填表日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel179);
					Label wlabel180 = new Label(2, i+1, null == elevator.getTianbiaoriqi()?"":DateFormatTool.formate(elevator.getTianbiaoriqi(), "yyyy-MM-dd"), format);
					wsheet.addCell(wlabel180);
					Label wlabel181 = new Label(3, i+1, "是否在人口密集区" , format);
					wsheet.mergeCells(3, i+1, 5, i+1);
					wsheet.addCell(wlabel181);
					Label wlabel182 = new Label(6, i+1, elevator.getShifou_renkoumijiqu() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel182);
					i=40;
					Label wlabel183 = new Label(0, i+1, "是否重大危险源" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel183);
					Label wlabel184 = new Label(2, i+1, elevator.getShifou_zhongdaweixianyuan() , format);
					wsheet.addCell(wlabel184);
					Label wlabel185 = new Label(3, i+1, "是否制定事故应急措施和救援预案" , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel185);
					Label wlabel186 = new Label(7, i+1, elevator.getShifou_yingjifangan() , format);
					wsheet.addCell(wlabel186);
					i=41;
					Label wlabel187 = new Label(0, i+1, "" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel187);
					Label wlabel188 = new Label(2, i+1, "" , format);
					wsheet.addCell(wlabel188);
					Label wlabel189 = new Label(3, i+1, "是否重点监控特种设备" , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel189);
					Label wlabel190 = new Label(7, i+1, elevator.getShifou_zhongdianjiankong() , format);
					wsheet.addCell(wlabel190);
					i=42;
					Label wlabel191 = new Label(0, i+1, "备注" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel191);
					Label wlabel192 = new Label(2, i+1, elevator.getBeizhu() , format);
					wsheet.addCell(wlabel192);
					Label wlabel193 = new Label(3, i+1, "所在乡镇" , format);
					wsheet.addCell(wlabel193);
					Label wlabel194 = new Label(4, i+1, elevator.getXiangzhen() , format);
					wsheet.mergeCells(4, i+1, 5, i+1);
					wsheet.addCell(wlabel194);
					Label wlabel195 = new Label(6, i+1, "所在村" , format);
					wsheet.addCell(wlabel195);
					Label wlabel196 = new Label(7, i+1, "" , format);
					wsheet.addCell(wlabel196);*/
				workbook.write();
				workbook.close();
				os.close();
			} catch (Exception e) {
				
			}
		}else if("8000".equals(report.getShebeizhongleidaima())){
			TPressurePipingParam guandao = (TPressurePipingParam) super.findById(Long.parseLong(id), TPressurePipingParam.class.getName());
			
			try {
				// 创建Excel
				workbook = Workbook.createWorkbook(os);
				// 在Excel中新建一个sheet
				WritableSheet wsheet = workbook.createSheet("压力管道", 0);
				//去掉整个sheet中的网格线
				wsheet.getSettings().setShowGridLines(false);
				wsheet.getSettings().setPaperSize(PaperSize.A4);
				wsheet.getSettings().setFitHeight(297) ;                        // 打印区高度
		        wsheet.getSettings().setFitWidth(210) ;                        // 打印区宽度    
		        // 设置边距            
	            wsheet.getSettings().setTopMargin(0.5) ;
	            wsheet.getSettings().setBottomMargin(0.3) ;
	            wsheet.getSettings().setLeftMargin(0.2) ;
	            wsheet.getSettings().setRightMargin(0.1) ;
				
				String[] titles = new String[10];
				for (int i = 0; i < titles.length; i++) {
					wsheet.setColumnView(i, 10);
				}
				// 标题字体
				WritableFont font = new WritableFont(WritableFont.ARIAL, 12,
						WritableFont.BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);
				WritableCellFormat format1 = new WritableCellFormat(font);
				//水平居中对齐
				format1.setAlignment(Alignment.CENTRE);
	            //竖直方向居中对齐
				format1.setVerticalAlignment(VerticalAlignment.CENTRE);
				//加边框
				format1.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				// 内容字体
				font = new jxl.write.WritableFont(WritableFont.createFont("宋体"),
						12, WritableFont.NO_BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);
				
				WritableCellFormat format = new jxl.write.WritableCellFormat(font);
				format.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				format.setWrap(true);
				
				DateFormat date = new DateFormat("yyyy-MM-dd");
				WritableCellFormat format2 = new jxl.write.WritableCellFormat(date);
				format2.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
					Label wlabel0 = new Label(0, 0, "特种设备使用登记表" , format1);
					wsheet.mergeCells(0, 0, 9, 0);
					wsheet.addCell(wlabel0);
					int i = 0;
					Label wlabel1 = new Label(0, i+1, "使用单位 " , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel1);
					Label wlabel2 = new Label(2, i+1, guandao.getShiyongdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel2);
					Label wlabel3 = new Label(6, i+1, "单位地址" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel3);
					Label wlabel4 = new Label(8, i+1, guandao.getShiyongdanwei_dizhi(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel4);
					i = 1;
					Label wlabel5 = new Label(0, i+1, "主管部门 " , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel5);
					Label wlabel6 = new Label(2, i+1, guandao.getZhuguanbumen() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel6);
					Label wlabel7 = new Label(6, i+1, "行业" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel7);
					Label wlabel8 = new Label(8, i+1, guandao.getHangye(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel8);
					i = 2;
					Label wlabel9 = new Label(0, i+1, "联系电话 " , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel9);
					Label wlabel10 = new Label(2, i+1, guandao.getShiyongdanwei_lianxidianhua() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel10);
					Label wlabel11 = new Label(6, i+1, "安全管理部门" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel11);
					Label wlabel12 = new Label(8, i+1, guandao.getAnquanguanlibumen(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel12);
					i = 3;
					Label wlabel13 = new Label(0, i+1, "安全管理人员 " , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel13);
					Label wlabel14 = new Label(2, i+1, guandao.getAnquanguanlirenyuan() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel14);
					Label wlabel15 = new Label(6, i+1, "经办人" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel15);
					Label wlabel16 = new Label(8, i+1, guandao.getJingbanren(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel16);
					i = 4;
					Label wlabel17 = new Label(0, i+1, "压力管道类别 " , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel17);
					Label wlabel18 = new Label(2, i+1, guandao.getShebeileibie() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel18);
					Label wlabel19 = new Label(6, i+1, "工程(装置)名称" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel19);
					Label wlabel20 = new Label(8, i+1, guandao.getGongchengmingcheng(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel20);
					i = 5;
					Label wlabel21 = new Label(0, i+1, "设计单位 " , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel21);
					Label wlabel22 = new Label(2, i+1, guandao.getShejidanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel22);
					Label wlabel23 = new Label(6, i+1, "设计单位代码" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel23);
					Label wlabel24 = new Label(8, i+1, guandao.getShejidanweidaima(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel24);
					i = 6;
					Label wlabel25 = new Label(0, i+1, "安装单位 " , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel25);
					Label wlabel26 = new Label(2, i+1, guandao.getAnzhuangdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel26);
					Label wlabel27 = new Label(6, i+1, "安装单位代码" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel27);
					Label wlabel28 = new Label(8, i+1, guandao.getAnzhuangdanwei_daima(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel28);
					i = 7;
					Label wlabel29 = new Label(0, i+1, "竣工验收日期 " , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel29);
					Label wlabel30 = new Label(2, i+1, guandao.getShigongdanwei_jungongriqi()==null?"":DateFormatTool.formate(guandao.getShigongdanwei_jungongriqi(), "yyyy-MM-dd"), format);
					wsheet.addCell(wlabel30);
					Label wlabel31 = new Label(3, i+1, "投用日期" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel31);
					Label wlabel32 = new Label(5, i+1, null == guandao.getTouyongriqi_date() ? guandao.getTouyongriqi() : DateFormatTool.formate(guandao.getTouyongriqi_date(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel32);
					Label wlabel33 = new Label(6, i+1, "管道规格" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel33);
					Label wlabel34 = new Label(8, i+1, guandao.getShebeixinghao(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel34);
					i = 8;
					Label wlabel35 = new Label(0, i+1, "管道名称 " , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel35);
					Label wlabel36 = new Label(2, i+1, guandao.getShebeimingcheng() , format);
					wsheet.addCell(wlabel36);
					Label wlabel37 = new Label(3, i+1, "管道编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel37);
					Label wlabel38 = new Label(5, i+1, guandao.getChuchangbianhao(), format);
					wsheet.addCell(wlabel38);
					Label wlabel39 = new Label(6, i+1, "管道级别" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel39);
					Label wlabel40 = new Label(8, i+1, guandao.getGuandaojibie(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel40);
					i = 9;
					Label wlabel41 = new Label(0, i+1, "公称直径(mm) " , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel41);
					Label wlabel42 = new Label(2, i+1, guandao.getGongchengzhijing() , format);
					wsheet.addCell(wlabel42);
					Label wlabel43 = new Label(3, i+1, "公称壁厚(mm)" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel43);
					Label wlabel44 = new Label(5, i+1, guandao.getGongchengbihou(), format);
					wsheet.addCell(wlabel44);
					Label wlabel45 = new Label(6, i+1, "管道长度" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel45);
					Label wlabel46 = new Label(8, i+1, guandao.getGuandaochangdu(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel46);
					i = 10;
					Label wlabel47 = new Label(0, i+1, "设计压力" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel47);
					Label wlabel48 = new Label(2, i+1, guandao.getShejiyali() , format);
					wsheet.addCell(wlabel48);
					Label wlabel49 = new Label(3, i+1, "设计温度" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel49);
					Label wlabel50 = new Label(5, i+1, guandao.getShejiwendu(), format);
					wsheet.addCell(wlabel50);
					Label wlabel51 = new Label(6, i+1, "输送介质" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel51);
					Label wlabel52 = new Label(8, i+1, guandao.getShusongjiezhi(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel52);
					i = 11;
					Label wlabel53 = new Label(0, i+1, "最高工作压力" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel53);
					Label wlabel54 = new Label(2, i+1, guandao.getGongzuoyali() , format);
					wsheet.addCell(wlabel54);
					Label wlabel55 = new Label(3, i+1, "最高工作温度" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel55);
					Label wlabel56 = new Label(5, i+1, guandao.getGongzuowendu(), format);
					wsheet.addCell(wlabel56);
					Label wlabel57 = new Label(6, i+1, "是否重要管道" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel57);
					Label wlabel58 = new Label(8, i+1, "0".equals(guandao.getZhongyaoguandao())?"否":"是", format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel58);
					i = 12;
					Label wlabel59 = new Label(0, i+1, "所属车间" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel59);
					Label wlabel60 = new Label(2, i+1, guandao.getSuoshuchejian() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel60);
					Label wlabel61 = new Label(6, i+1, "检验结论" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel61);
					Label wlabel62 = new Label(8, i+1, guandao.getJianyanjielun(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel62);
					i = 13;
					Label wlabel67 = new Label(0, i+1, "压力管道代码" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel67);
					Label wlabel68 = new Label(2, i+1, guandao.getZhucedaima() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel68);
					Label wlabel69 = new Label(6, i+1, "检验日期" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel69);
					Label wlabel70 = new Label(8, i+1, null == guandao.getJianyanjieshuriqi()? "" : DateFormatTool.formate(guandao.getJianyanjieshuriqi(), "yyyy-MM-dd")  , format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel70);
					i = 14;
					Label wlabel71 = new Label(0, i+1, "下次检验日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel71);
					Label wlabel72 = new Label(2, i+1, null == guandao.getXiacijianyanriqi()? "" : DateFormatTool.formate(guandao.getXiacijianyanriqi(), "yyyy-MM-dd")   , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel72);
					Label wlabel73 = new Label(6, i+1, "固定资产值" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel73);
					Label wlabel74 = new Label(8, i+1, guandao.getGudingzichanzhi(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel74);
					i = 15;
					Label wlabel75 = new Label(0, i+1, "备注" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel75);
					Label wlabel76 = new Label(2, i+1, guandao.getBeizhu() , format);
					wsheet.mergeCells(2, i+1, 9, i+1);
					wsheet.addCell(wlabel76);
					i = 16;
					Label wlabel77 = new Label(0, i+1, "审核日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel77);
					Label wlabel78 = new Label(2, i+1, null == guandao.getShenheriqi()? "" : DateFormatTool.formate(guandao.getShenheriqi(), "yyyy-MM-dd") , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel78);
					Label wlabel79 = new Label(6, i+1, "登记意见" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel79);
					Label wlabel80 = new Label(8, i+1, guandao.getDengjiyijian(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel80);
					i = 17;
					Label wlabel81 = new Label(0, i+1, "注册登记日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel81);
					Label wlabel82 = new Label(2, i+1, null == guandao.getZhuceriqi()? "" : DateFormatTool.formate(guandao.getZhuceriqi(), "yyyy-MM-dd")  , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel82);
					Label wlabel83 = new Label(6, i+1, "注册登记人员" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel83);
					Label wlabel84 = new Label(8, i+1, guandao.getZhucedengjirenyuan(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel84);
					i = 18;
					Label wlabel85 = new Label(0, i+1, "注册登记机构" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel85);
					Label wlabel86 = new Label(2, i+1, guandao.getZhucedengjijigou() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel86);
					Label wlabel87 = new Label(6, i+1, "" , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel87);
					Label wlabel88 = new Label(8, i+1, "", format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel88);
					i = 19;
					Label wlabel89 = new Label(0, i+1, "市：" , format);
					wsheet.addCell(wlabel89);
					Label wlabel90 = new Label(1, i+1, guandao.getShi(), format);
					wsheet.addCell(wlabel90);
					Label wlabel91 = new Label(2, i+1, "区县：" , format);
					wsheet.mergeCells(2, i+1, 3, i+1);
					wsheet.addCell(wlabel91);
					Label wlabel92 = new Label(4, i+1, guandao.getQuhuamingcheng(), format);
					wsheet.mergeCells(4, i+1, 6, i+1);
					wsheet.addCell(wlabel92);
					Label wlabel93 = new Label(7, i+1, "乡镇：" , format);
					wsheet.addCell(wlabel93);
					Label wlabel94 = new Label(8, i+1, guandao.getXiangzhen(), format);
					wsheet.mergeCells(8, i+1, 9, i+1);
					wsheet.addCell(wlabel94);
					
				workbook.write();
				workbook.close();
				os.close();
			} catch (Exception e) {
				
			}
		}else if("9000".equals(report.getShebeizhongleidaima())){
			TCablewaysParam elevator = (TCablewaysParam) super.findById(Long.parseLong(id), TCablewaysParam.class.getName());
			
			try {
				// 创建Excel
				workbook = Workbook.createWorkbook(os);
				// 在Excel中新建一个sheet
				WritableSheet wsheet = workbook.createSheet("索道", 0);
				//去掉整个sheet中的网格线
				wsheet.getSettings().setShowGridLines(false);
				wsheet.getSettings().setPaperSize(PaperSize.A4);
				wsheet.getSettings().setFitHeight(297) ;                        // 打印区高度
		        wsheet.getSettings().setFitWidth(210) ;                        // 打印区宽度    
		        // 设置边距            
	            wsheet.getSettings().setTopMargin(0.5) ;
	            wsheet.getSettings().setBottomMargin(0.3) ;
	            wsheet.getSettings().setLeftMargin(0.2) ;
	            wsheet.getSettings().setRightMargin(0.1) ;
				
				String[] titles = new String[8];
				for (int i = 0; i < titles.length; i++) {
					if(i==0 || i==1 || i==3 || i==4){
						wsheet.setColumnView(i, 8);
					}else if(i==2 || i==5 ){
						wsheet.setColumnView(i, 16);
					}else{
						wsheet.setColumnView(i, 17);
					}
				}
				for(int i = 1;i<34;i++){
					wsheet.setRowView(i, 350);
				}
				// 标题字体
				WritableFont font = new WritableFont(WritableFont.ARIAL, 15,
						WritableFont.BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);
				WritableCellFormat titleFormat = new WritableCellFormat(font);
				//水平居中对齐
				titleFormat.setAlignment(Alignment.CENTRE);
	            //竖直方向居中对齐
				titleFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
				// 内容字体
				font = new jxl.write.WritableFont(WritableFont.createFont("宋体"),
						12, WritableFont.NO_BOLD, false,
						jxl.format.UnderlineStyle.NO_UNDERLINE,
						jxl.format.Colour.BLACK);
				
				WritableCellFormat format = new jxl.write.WritableCellFormat(font);
				format.setAlignment(Alignment.CENTRE);
				format.setVerticalAlignment(VerticalAlignment.CENTRE);
				format.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
				format.setWrap(true);
				
				WritableCellFormat formatNoBorder = new jxl.write.WritableCellFormat(font);
				formatNoBorder.setAlignment(Alignment.CENTRE);
				formatNoBorder.setVerticalAlignment(VerticalAlignment.CENTRE);
				formatNoBorder.setWrap(true);
				
				DateFormat date = new DateFormat("yyyy-MM-dd");
				WritableCellFormat format2 = new jxl.write.WritableCellFormat(date);
				format2.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
					int i = 1;
					Label wlabel0 = new Label(0, 0, "特种设备使用登记表" , titleFormat);
					wsheet.mergeCells(0, 0, 7, 0);
					wsheet.addCell(wlabel0);
					Label wlabeldwz = new Label(0, i, "（使用单位印章）" , formatNoBorder);
					wsheet.mergeCells(0, i, 2, i);
					wsheet.addCell(wlabeldwz);
					Label wlabelzcdwz = new Label(6, i, "（注册单位印章）" , formatNoBorder);
					wsheet.mergeCells(6, i, 7, i);
					wsheet.addCell(wlabelzcdwz);
					
					Label wlabel1 = new Label(0, i+1, "注册登记机构" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel1);
					Label wlabel2 = new Label(2, i+1, elevator.getZhucedengjijigou() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel2);
					Label wlabel3 = new Label(6, i+1, "注册登记日期" , format);
					wsheet.addCell(wlabel3);
					//DateTime wlabel4 = new DateTime(7, i+1, elevator.getDj_jingbanriqi() , format2);
					Label wlabel4 = new Label(7, i+1, null == elevator.getDj_jingbanriqi()? "" : DateFormatTool.formate(elevator.getDj_jingbanriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel4);
					i=2;
					Label wlabel5 = new Label(0, i+1, "设备注册代码" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel5);
					Label wlabel6 = new Label(2, i+1, elevator.getZhucedaima() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel6);
					Label wlabel7 = new Label(6, i+1, "更新日期" , format);
					wsheet.addCell(wlabel7);
					Label wlabel8 = new Label(7, i+1, null == elevator.getBiangengriqi()? "" : DateFormatTool.formate(elevator.getBiangengriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel8);
					i=3;
					Label wlabel9 = new Label(0, i+1, "单位内部编号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel9);
					Label wlabel10 = new Label(2, i+1, elevator.getNeibubianhao() , format);
					wsheet.addCell(wlabel10);
					Label wlabel11 = new Label(3, i+1, "厂车牌照编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel11);
					Label wlabel12 = new Label(5, i+1, "" , format);
					wsheet.addCell(wlabel12);
					Label wlabel13 = new Label(6, i+1, "注册登记人员" , format);
					wsheet.addCell(wlabel13);
					Label wlabel14 = new Label(7, i+1, elevator.getDj_jingbanren() , format);
					wsheet.addCell(wlabel14);
					i=4;
					Label wlabel15 = new Label(0, i+1, "产权单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel15);
					Label wlabel16 = new Label(2, i+1, elevator.getChanquandanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel16);
					Label wlabel17 = new Label(6, i+1, "产权单位代码" , format);
					wsheet.addCell(wlabel17);
					Label wlabel18 = new Label(7, i+1, elevator.getChanquandanwei_daima() , format);
					wsheet.addCell(wlabel18);
					i=5;
					Label wlabel19 = new Label(0, i+1, "产权单位地址" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel19);
					Label wlabel20 = new Label(2, i+1, elevator.getChanquandanwei_dizhi() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel20);
					Label wlabel21 = new Label(6, i+1, "邮政编码" , format);
					wsheet.addCell(wlabel21);
					Label wlabel22 = new Label(7, i+1, elevator.getChanquandanwei_youbian() , format);
					wsheet.addCell(wlabel22);
					i=6;
					Label wlabel23 = new Label(0, i+1, "单位法人代表" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel23);
					Label wlabel24 = new Label(2, i+1, elevator.getChanquandanwei_farendaibiao() , format);
					wsheet.addCell(wlabel24);
					Label wlabelglfzr = new Label(3, i+1, "管理负责人" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabelglfzr);
					Label wlabelglfzrv = new Label(5, i+1, "" , format);
					wsheet.addCell(wlabelglfzrv);
					Label wlabel25 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel25);
					Label wlabel26 = new Label(7, i+1, elevator.getCqdw_frdbdh() , format);
					wsheet.addCell(wlabel26);
					i=7;
					Label wlabel27 = new Label(0, i+1, "使用单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel27);
					Label wlabel28 = new Label(2, i+1, elevator.getShiyongdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel28);
					Label wlabel29 = new Label(6, i+1, "使用单位代码" , format);
					wsheet.addCell(wlabel29);
					Label wlabel30 = new Label(7, i+1, elevator.getShiyongdanwei_code() , format);
					wsheet.addCell(wlabel30);
					i=8;
					Label wlabel31 = new Label(0, i+1, "使用单位地址" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel31);
					Label wlabel32 = new Label(2, i+1, elevator.getShiyongdanwei_dizhi() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel32);
					Label wlabel33 = new Label(6, i+1, "邮政编码" , format);
					wsheet.addCell(wlabel33);
					Label wlabel34 = new Label(7, i+1, elevator.getShiyongdanwei_youbian() , format);
					wsheet.addCell(wlabel34);
					i=9;
					Label wlabel35 = new Label(0, i+1, "安全管理部门" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel35);
					Label wlabel36 = new Label(2, i+1, elevator.getAnquanguanlibumen() , format);
					wsheet.addCell(wlabel36);
					Label wlabel37 = new Label(3, i+1, "安全管理人员" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel37);
					Label wlabel38 = new Label(5, i+1, elevator.getAnquanguanlirenyuan() , format);
					wsheet.addCell(wlabel38);
					Label wlabel39 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel39);
					Label wlabel40 = new Label(7, i+1, elevator.getAnquanguanli_lianxidianhua() , format);
					wsheet.addCell(wlabel40);
					i=10;
					Label wlabel41 = new Label(0, i+1, "设备使用地点" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel41);
					Label wlabel42 = new Label(2, i+1, elevator.getShebeididian() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel42);
					Label wlabel43 = new Label(6, i+1, "操作人员" , format);
					wsheet.addCell(wlabel43);
					Label wlabel44 = new Label(7, i+1, elevator.getShiyongdanwei_caozuorenyuan(), format);
					wsheet.addCell(wlabel44);
					i=11;
					Label wlabel45 = new Label(0, i+1, "设备类别" , format);
					wsheet.setRowView(i+1, 850);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel45);
					Label wlabel46 = new Label(2, i+1, elevator.getShebeileibie() , format);
					wsheet.addCell(wlabel46);
					Label wlabel47 = new Label(3, i+1, "设备名称" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel47);
					Label wlabel48 = new Label(5, i+1, elevator.getShebeimingcheng() , format);
					wsheet.addCell(wlabel48);
					Label wlabel49 = new Label(6, i+1, "设备型号" , format);
					wsheet.addCell(wlabel49);
					Label wlabel50 = new Label(7, i+1, elevator.getShebeixinghao() , format);
					wsheet.addCell(wlabel50);
					i=12;
					Label wlabel51 = new Label(0, i+1, "设计单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel51);
					Label wlabel52 = new Label(2, i+1, elevator.getShejidanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel52);
					Label wlabel53 = new Label(6, i+1, "设计单位代码" , format);
					wsheet.addCell(wlabel53);
					Label wlabel54 = new Label(7, i+1, elevator.getShejidanweidaima() , format);
					wsheet.addCell(wlabel54);
					i=13;
					Label wlabel55 = new Label(0, i+1, "制造单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel55);
					Label wlabel56 = new Label(2, i+1, elevator.getZhizaodanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel56);
					Label wlabel57= new Label(6, i+1, "制造单位代码" , format);
					wsheet.addCell(wlabel57);
					Label wlabel58 = new Label(7, i+1, elevator.getZhizaodanwei_code(), format);
					wsheet.addCell(wlabel58);
					i=14;
					Label wlabel59 = new Label(0, i+1, "资格证书名称" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel59);
					Label wlabel60 = new Label(2, i+1, elevator.getZhizaodanwei_zigezhengshu(), format);
					wsheet.addCell(wlabel60);
					Label wlabel61 = new Label(3, i+1, "资格证书号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel61);
					Label wlabel62 = new Label(5, i+1, elevator.getZhizaodanweixukezhengbianhao(), format);
					wsheet.addCell(wlabel62);
					Label wlabel63 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel63);
					Label wlabel64 = new Label(7, i+1, elevator.getZhizaodanwei_lianxidianhua() , format);
					wsheet.addCell(wlabel64);
					i=15;
					Label wlabel65 = new Label(0, i+1, "制造年月" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel65);
					Label wlabel66 = new Label(2, i+1, null == elevator.getZhizaoriqi_date() ? elevator.getZhizaoriqi() : DateFormatTool.formate(elevator.getZhizaoriqi_date(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel66);
					Label wlabel67 = new Label(3, i+1, "出厂编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel67);
					Label wlabel68 = new Label(5, i+1, elevator.getChuchangbianhao() , format);
					wsheet.addCell(wlabel68);
					Label wlabel69 = new Label(6, i+1, "适用场合" , format);
					wsheet.addCell(wlabel69);
					Label wlabel70 = new Label(7, i+1, elevator.getShiyongchangsuo(), format);
					wsheet.addCell(wlabel70);
					i=16;
					Label wlabel71 = new Label(0, i+1, "安装单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel71);
					Label wlabel72 = new Label(2, i+1, elevator.getAnzhuangdanwei(), format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel72);
					Label wlabel73= new Label(6, i+1, "安装单位代码" , format);
					wsheet.addCell(wlabel73);
					Label wlabel74 = new Label(7, i+1, elevator.getAnzhuangdanwei_daima(), format);
					wsheet.addCell(wlabel74);
					i=17;
					Label wlabel75 = new Label(0, i+1, "资格证书编号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel75);
					Label wlabel76 = new Label(2, i+1, elevator.getAnzhuangdanwei_zigezhengshu() , format);
					wsheet.addCell(wlabel76);
					Label wlabel77 = new Label(3, i+1, "项目负责人" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel77);
					Label wlabel78 = new Label(5, i+1, elevator.getAnzhuangdanwei_lianxiren() , format);
					wsheet.addCell(wlabel78);
					Label wlabel79 = new Label(6, i+1, "联系电话" , format);
					wsheet.addCell(wlabel79);
					Label wlabel80 = new Label(7, i+1, elevator.getAnzhuangdanwei_lianxidianhua() , format);
					wsheet.addCell(wlabel80);
					i=18;
					Label wlabel81 = new Label(0, i+1, "土建施工单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel81);
					Label wlabel82 = new Label(2, i+1, elevator.getShigongdanwei(), format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel82);
					Label wlabel83= new Label(6, i+1, "开始施工日期" , format);
					wsheet.addCell(wlabel83);
					Label wlabel84 = new Label(7, i+1, elevator.getShigongdanwei_shigongriqi() == null?"":DateFormatTool.formate(elevator.getShigongdanwei_shigongriqi(), "yyyy-MM-dd"), format);
					wsheet.addCell(wlabel84);
					i=19;
					Label wlabel85 = new Label(0, i+1, "土建验收单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel85);
					Label wlabel86 = new Label(2, i+1, elevator.getYanshoudanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel86);
					Label wlabel87= new Label(6, i+1, "竣工验收日期" , format);
					wsheet.addCell(wlabel87);
					Label wlabel88 = new Label(7, i+1, elevator.getShigongdanwei_jungongriqi() == null?"":DateFormatTool.formate(elevator.getShigongdanwei_jungongriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel88);
					i=20;
					Label wlabel89 = new Label(0, i+1, "验收检验机构" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel89);
					Label wlabel90 = new Label(2, i+1, elevator.getYanshoujigou(), format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel90);
					Label wlabel91 = new Label(6, i+1, "验收报告编号" , format);
					wsheet.addCell(wlabel91);
					Label wlabel92 = new Label(7, i+1, elevator.getYanshoubaogaobianhao(), format);
					wsheet.addCell(wlabel92);
					i=21;
					Label wlabel93 = new Label(0, i+1, "投用日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel93);
					Label wlabel94 = new Label(2, i+1, null == elevator.getTouyongriqi_date() ? elevator.getTouyongriqi() : DateFormatTool.formate(elevator.getTouyongriqi_date(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel94);
					Label wlabel95 = new Label(3, i+1, "维保周期( 周)" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel95);
					Label wlabel96 = new Label(5, i+1, elevator.getWeibaozhouqi() , format);
					wsheet.addCell(wlabel96);
					Label wlabel97 = new Label(6, i+1, "大修周期(月)" , format);
					wsheet.addCell(wlabel97);
					Label wlabel98 = new Label(7, i+1, elevator.getDaxiuzhouqi() , format);
					wsheet.addCell(wlabel98);
					i=22;
					Label wlabel99 = new Label(0, i+1, "维修保养单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel99);
					Label wlabel100 = new Label(2, i+1, elevator.getWeihubaoyangdanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel100);
					Label wlabel101 = new Label(6, i+1, "维保单位代码" , format);
					wsheet.addCell(wlabel101);
					Label wlabel102 = new Label(7, i+1, elevator.getWeihubaoyangdanwei_code() , format);
					wsheet.addCell(wlabel102);
					i=23;
					Label wlabel103 = new Label(0, i+1, "资格证书号" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel103);
					Label wlabel104 = new Label(2, i+1, elevator.getWhbydw_zizhizhengshu() , format);
					wsheet.addCell(wlabel104);
					Label wlabel105 = new Label(3, i+1, "维保责任人" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel105);
					Label wlabel106 = new Label(5, i+1, elevator.getWeihubaoyangdanwei_lianxiren() , format);
					wsheet.addCell(wlabel106);
					Label wlabel107 = new Label(6, i+1, "电话" , format);
					wsheet.addCell(wlabel107);
					Label wlabel108 = new Label(7, i+1, elevator.getWeihubaoyangdanwei_dianhua(), format);
					wsheet.addCell(wlabel108);
					i=24;
					Label wlabel197 = new Label(0, i+1, "设备主要参数" , format);
					wsheet.mergeCells(0, i+1, 7, i+1);
					wsheet.addCell(wlabel197);
					i=25;
					Label wlabel198 = new Label(0, i+1, "运行速度" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel198);
					Label wlabel199 = new Label(2, i+1, elevator.getYunxingsudu() , format);
					wsheet.addCell(wlabel199);
					Label wlabel200 = new Label(3, i+1, "索道长度" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel200);
					Label wlabel201 = new Label(5, i+1, elevator.getChangdu(), format);
					wsheet.addCell(wlabel201);
					Label wlabel202 = new Label(6, i+1, "运载能力" , format);
					wsheet.addCell(wlabel202);
					Label wlabel203 = new Label(7, i+1, elevator.getYunzainengli(), format);
					wsheet.addCell(wlabel203);
					i=26;
					Label wlabel204 = new Label(0, i+1, "运载车辆型式" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel204);
					Label wlabel205 = new Label(2, i+1, elevator.getYunzaicheliangxingshi(), format);
					wsheet.addCell(wlabel205);
					Label wlabel206 = new Label(3, i+1, "" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel206);
					Label wlabel207 = new Label(5, i+1, "", format);
					wsheet.addCell(wlabel207);
					Label wlabel208 = new Label(6, i+1, "" , format);
					wsheet.addCell(wlabel208);
					Label wlabel209 = new Label(7, i+1, "", format);
					wsheet.addCell(wlabel209);
					/*i=24;
					Label wlabel109 = new Label(0, i+1, "所在车间分厂" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel109);
					Label wlabel110 = new Label(2, i+1, elevator.getSuoshuchejian() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel110);
					Label wlabel111 = new Label(6, i+1, "" , format);
					wsheet.addCell(wlabel111);
					Label wlabel112 = new Label(7, i+1, "" , format);
					wsheet.addCell(wlabel112);*/
					i=27;
					Label wlabel113 = new Label(0, i+1, "检验单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel113);
					Label wlabel114 = new Label(2, i+1, elevator.getJianyanjigou() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel114);
					Label wlabel115 = new Label(6, i+1, "检验单位代码" , format);
					wsheet.addCell(wlabel115);
					Label wlabel116 = new Label(7, i+1, elevator.getJianyanjigou_code() , format);
					wsheet.addCell(wlabel116);
					i=28;
					Label wlabel117 = new Label(0, i+1, "检验日期" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel117);
					Label wlabel118 = new Label(2, i+1,  null == elevator.getJianyankaishiriqi()? "" : DateFormatTool.formate(elevator.getJianyankaishiriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel118);
					Label wlabel119 = new Label(3, i+1, "检验类别" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel119);
					Label wlabel120 = new Label(5, i+1, elevator.getJianyanleixing() , format);
					wsheet.addCell(wlabel120);
					Label wlabel121 = new Label(6, i+1, "主要问题" , format);
					wsheet.addCell(wlabel121);
					Label wlabel122 = new Label(7, i+1, elevator.getZhuyaowenti() , format);
					wsheet.addCell(wlabel122);
					i=29;
					Label wlabel123 = new Label(0, i+1, "检验结论" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel123);
					Label wlabel124 = new Label(2, i+1, elevator.getJianyanjielun(), format);
					wsheet.addCell(wlabel124);
					Label wlabel125 = new Label(3, i+1, "报告书编号" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel125);
					Label wlabel126 = new Label(5, i+1, elevator.getBaogaobianhao(), format);
					wsheet.addCell(wlabel126);
					Label wlabel127 = new Label(6, i+1, "下次检验日期" , format);
					wsheet.addCell(wlabel127);
					Label wlabel128 = new Label(7, i+1, null == elevator.getXiacijianyanriqi()? "" : DateFormatTool.formate(elevator.getXiacijianyanriqi(), "yyyy-MM-dd")  , format);
					wsheet.addCell(wlabel128);
					i=30;
					Label wlabel129 = new Label(0, i+1, "事故类别" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel129);
					Label wlabel130 = new Label(2, i+1, elevator.getShiguleibie() , format);
					wsheet.addCell(wlabel130);
					Label wlabel131 = new Label(3, i+1, "事故发生日期" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel131);
					Label wlabel132 = new Label(5, i+1, null == elevator.getShigufashengriqi()?"":DateFormatTool.formate(elevator.getShigufashengriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel132);
					Label wlabel133 = new Label(6, i+1, "事故处理结果" , format);
					wsheet.addCell(wlabel133);
					Label wlabel134 = new Label(7, i+1, elevator.getShiguchulijieguo()  , format);
					wsheet.addCell(wlabel134);
					i=31;
					Label wlabel135 = new Label(0, i+1, "设备变动方式" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel135);
					Label wlabel136 = new Label(2, i+1, elevator.getShebeibiandongfangshi(), format);
					wsheet.addCell(wlabel136);
					Label wlabel137 = new Label(3, i+1, "设备变动项目" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel137);
					Label wlabel138 = new Label(5, i+1, elevator.getShebeibiandongxiangmu() , format);
					wsheet.addCell(wlabel138);
					Label wlabel139 = new Label(6, i+1, "设备变动日期" , format);
					wsheet.addCell(wlabel139);
					Label wlabel140 = new Label(7, i+1, elevator.getShebeibiandongriqi()==null?"":DateFormatTool.formate(elevator.getShebeibiandongriqi(), "yyyy-MM-dd") , format);
					wsheet.addCell(wlabel140);
					i=32;
					Label wlabel141 = new Label(0, i+1, "变动承担单位" , format);
					wsheet.mergeCells(0, i+1, 1, i+1);
					wsheet.addCell(wlabel141);
					Label wlabel142 = new Label(2, i+1, elevator.getChengdandanwei() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel142);
					Label wlabel143 = new Label(6, i+1, "承担单位代码" , format);
					wsheet.addCell(wlabel143);
					Label wlabel144 = new Label(7, i+1, elevator.getChengdandanwei_code() , format);
					wsheet.addCell(wlabel144);
					/*i=31;
					Label wlabel145 = new Label(1, i+1, "客运索道登记卡（基本信息）" , format1);
					wsheet.mergeCells(1, i+1, 7, i+1);
					wsheet.addCell(wlabel145);
					i=32;
					Label wlabel146 = new Label(1, i+1, "使用登记证号码" , format);
					wsheet.addCell(wlabel146);
					Label wlabel147 = new Label(2, i+1, elevator.getDengjizhengbianhao() , format);
					wsheet.mergeCells(2, i+1, 4, i+1);
					wsheet.addCell(wlabel147);
					Label wlabel148 = new Label(5, i+1, "承担单位代码" , format);
					wsheet.addCell(wlabel148);
					Label wlabel149 = new Label(6, i+1, elevator.getChengdandanwei_code() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel149);
					i=33;
					Label wlabel150 = new Label(1, i+1, "使用单位" , format);
					wsheet.addCell(wlabel150);
					Label wlabel151 = new Label(2, i+1, elevator.getShiyongdanwei(), format);
					wsheet.mergeCells(2, i+1, 7, i+1);
					wsheet.addCell(wlabel151);
					i=34;
					Label wlabel152 = new Label(1, i+1, "详细地址" , format);
					wsheet.addCell(wlabel152);
					Label wlabel153 = new Label(2, i+1, elevator.getShiyongdanwei_dizhi() , format);
					wsheet.mergeCells(2, i+1, 5, i+1);
					wsheet.addCell(wlabel153);
					Label wlabel154 = new Label(6, i+1, "邮政编码" , format);
					wsheet.addCell(wlabel154);
					Label wlabel155 = new Label(7, i+1, elevator.getShiyongdanwei_youbian(), format);
					wsheet.addCell(wlabel155);
					i=35;
					Label wlabel156 = new Label(1, i+1, "使用单位地址(省)" , format);
					wsheet.addCell(wlabel156);
					Label wlabel157 = new Label(2, i+1, "" , format);
					wsheet.addCell(wlabel157);
					Label wlabel158 = new Label(3, i+1, "市" , format);
					wsheet.addCell(wlabel158);
					Label wlabel159 = new Label(4, i+1, elevator.getShi(), format);
					wsheet.addCell(wlabel159);
					Label wlabel160 = new Label(5, i+1, "区（县）" , format);
					wsheet.addCell(wlabel160);
					Label wlabel161 = new Label(6, i+1, elevator.getQuhuamingcheng() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel161);
					i=36;
					Label wlabel162 = new Label(1, i+1, "法定代表人" , format);
					wsheet.addCell(wlabel162);
					Label wlabel163 = new Label(2, i+1, elevator.getFadingdaibiaoren() , format);
					wsheet.addCell(wlabel163);
					Label wlabel164 = new Label(3, i+1, "电话（或总机）" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel164);
					Label wlabel165 = new Label(5, i+1, elevator.getShiyongdanwei_lianxidianhua() , format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel165);
					i=37;
					Label wlabel166 = new Label(1, i+1, "E-Mail" , format);
					wsheet.addCell(wlabel166);
					Label wlabel167 = new Label(2, i+1, "" , format);
					wsheet.mergeCells(2, i+1, 3, i+1);
					wsheet.addCell(wlabel167);
					Label wlabel168 = new Label(4, i+1, "传真" , format);
					wsheet.addCell(wlabel168);
					Label wlabel169 = new Label(5, i+1, elevator.getShiyongdanwei_chuanzhen() , format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel169);
					i=38;
					Label wlabel170 = new Label(1, i+1, "主管负责人" , format);
					wsheet.addCell(wlabel170);
					Label wlabel171 = new Label(2, i+1, elevator.getZhuguanfuzeren(), format);
					wsheet.addCell(wlabel171);
					Label wlabel172 = new Label(3, i+1, "主管负责人电话" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel172);
					Label wlabel173 = new Label(5, i+1, elevator.getZhuguanfuzerendianhua() , format);
					wsheet.mergeCells(5, i+1, 7, i+1);
					wsheet.addCell(wlabel173);
					i=39;
					Label wlabel174 = new Label(1, i+1, "经办人" , format);
					wsheet.addCell(wlabel174);
					Label wlabel175 = new Label(2, i+1, elevator.getJingbanren() , format);
					wsheet.addCell(wlabel175);
					Label wlabel176 = new Label(3, i+1, "经办人电话" , format);
					wsheet.mergeCells(3, i+1, 4, i+1);
					wsheet.addCell(wlabel176);
					Label wlabel177 = new Label(5, i+1, "手机或传呼" , format);
					wsheet.addCell(wlabel177);
					Label wlabel178 = new Label(6, i+1, elevator.getJingbanrendianhua() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel178);
					i=40;
					Label wlabel179 = new Label(1, i+1, "填表日期" , format);
					wsheet.addCell(wlabel179);
					Label wlabel180 = new Label(2, i+1, elevator.getTianbiaoriqi()== null?"":DateFormatTool.formate(elevator.getTianbiaoriqi(), "yyyy-MM-dd"), format);
					wsheet.addCell(wlabel180);
					Label wlabel181 = new Label(3, i+1, "是否在人口密集区" , format);
					wsheet.mergeCells(3, i+1, 5, i+1);
					wsheet.addCell(wlabel181);
					Label wlabel182 = new Label(6, i+1, elevator.getShifou_renkoumijiqu() , format);
					wsheet.mergeCells(6, i+1, 7, i+1);
					wsheet.addCell(wlabel182);
					i=41;
					Label wlabel183 = new Label(1, i+1, "是否重大危险源" , format);
					wsheet.addCell(wlabel183);
					Label wlabel184 = new Label(2, i+1, elevator.getShifou_zhongdaweixianyuan() , format);
					wsheet.addCell(wlabel184);
					Label wlabel185 = new Label(3, i+1, "是否制定事故应急措施和救援预案" , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel185);
					Label wlabel186 = new Label(7, i+1, elevator.getShifou_yingjifangan(), format);
					wsheet.addCell(wlabel186);
					i=42;
					Label wlabel187 = new Label(1, i+1, "" , format);
					wsheet.addCell(wlabel187);
					Label wlabel188 = new Label(2, i+1, "" , format);
					wsheet.addCell(wlabel188);
					Label wlabel189 = new Label(3, i+1, "是否重点监控特种设备" , format);
					wsheet.mergeCells(3, i+1, 6, i+1);
					wsheet.addCell(wlabel189);
					Label wlabel190 = new Label(7, i+1, elevator.getShifou_zhongdianjiankong() , format);
					wsheet.addCell(wlabel190);
					i=43;
					Label wlabel191 = new Label(1, i+1, "备注" , format);
					wsheet.addCell(wlabel191);
					Label wlabel192 = new Label(2, i+1, elevator.getBeizhu() , format);
					wsheet.addCell(wlabel192);
					Label wlabel193 = new Label(3, i+1, "所在乡镇" , format);
					wsheet.addCell(wlabel193);
					Label wlabel194 = new Label(4, i+1, elevator.getXiangzhen() , format);
					wsheet.mergeCells(4, i+1, 5, i+1);
					wsheet.addCell(wlabel194);
					Label wlabel195 = new Label(6, i+1, "所在村" , format);
					wsheet.addCell(wlabel195);
					Label wlabel196 = new Label(7, i+1, "" , format);
					wsheet.addCell(wlabel196);*/
				workbook.write();
				workbook.close();
				os.close();
			} catch (Exception e) {
				
			}
		}
	}
	
	/**
	 * 注册登记导出锅炉
	 * @param workbook
	 * @param id
	 * @param os
	 */
	public void zcdjDaoChuGl(WritableWorkbook workbook,String id,OutputStream os){
		TBoilerParam elevator = (TBoilerParam) super.findById(Long.parseLong(id), TBoilerParam.class.getName());
		try {
			workbook = Workbook.createWorkbook(os);
			WritableSheet wsheet = workbook.createSheet("锅炉", 0);
			wsheet.getSettings().setShowGridLines(false);
			wsheet.getSettings().setPaperSize(PaperSize.A4);
			wsheet.getSettings().setFitHeight(297) ;                        
	        wsheet.getSettings().setFitWidth(210) ;                        
            wsheet.getSettings().setTopMargin(0.3) ;
            wsheet.getSettings().setBottomMargin(0.3) ;
            wsheet.getSettings().setLeftMargin(0.3) ;
            wsheet.getSettings().setRightMargin(0.3) ;
			String[] titles = new String[11];
			for (int i = 0; i < titles.length; i++) {
				if(i==0){
					wsheet.setColumnView(i, 10);
				}else if(i==6 || i==3 || i==4 || i==5 ){
					wsheet.setColumnView(i, 7);
				}else{
					wsheet.setColumnView(i, 10);
				}
			}
			WritableFont font = new WritableFont(WritableFont.ARIAL, 15,
					WritableFont.BOLD, false,
					jxl.format.UnderlineStyle.NO_UNDERLINE,
					jxl.format.Colour.BLACK);
			WritableCellFormat titleFormat = new WritableCellFormat(font);
			titleFormat.setAlignment(Alignment.CENTRE);
			titleFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
			// 内容字体
			font = new jxl.write.WritableFont(WritableFont.createFont("宋体"),
					11, WritableFont.NO_BOLD, false,
					jxl.format.UnderlineStyle.NO_UNDERLINE,
					jxl.format.Colour.BLACK);

			WritableCellFormat formatNoBorder = new jxl.write.WritableCellFormat(font);
			formatNoBorder.setAlignment(Alignment.CENTRE);
			formatNoBorder.setVerticalAlignment(VerticalAlignment.CENTRE);
			formatNoBorder.setWrap(true);
			//内容格式
			WritableCellFormat format = new jxl.write.WritableCellFormat(font);
			format.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
			format.setAlignment(Alignment.CENTRE);
			format.setVerticalAlignment(VerticalAlignment.CENTRE);
			format.setWrap(true);
			

			WritableCellFormat leftFormat = new jxl.write.WritableCellFormat(font);
			leftFormat.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
			leftFormat.setAlignment(Alignment.LEFT);
			leftFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
			leftFormat.setWrap(true);
			
			DateFormat date = new DateFormat("yyyy-MM-dd");
			WritableCellFormat format2 = new jxl.write.WritableCellFormat(date);
			format2.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);
			
			for(int i = 1;i<53;i++){
				wsheet.setRowView(i, 280);
			}
				Label wlabel0 = new Label(0, 0, "特种设备使用登记表" , titleFormat);
				wsheet.mergeCells(0, 0, 10, 0);
				wsheet.addCell(wlabel0);
				Label wlabeldjlb = new Label(0, 1, "登记类别:" , formatNoBorder);
				wsheet.mergeCells(0, 1, 1, 1);
				wsheet.addCell(wlabeldjlb);
				Label wlabeldjlbv = new Label(2, 1, elevator.getDengjileibie(), formatNoBorder);
				wsheet.mergeCells(2, 1, 5, 1);
				wsheet.addCell(wlabeldjlbv);
				Label wlabelzcdm = new Label(6, 1, "注册代码:" , formatNoBorder);
				wsheet.mergeCells(6, 1, 7, 1);
				wsheet.addCell(wlabelzcdm);
				Label wlabelzcdmv = new Label(8, 1, elevator.getZhucedaima(), formatNoBorder);
				wsheet.mergeCells(8, 1, 10, 1);
				wsheet.addCell(wlabelzcdmv);
				int i = 1;
				Label wlabel1 = new Label(0, i+1, "设备基本情况" , format);
				wsheet.mergeCells(0, i+1, 0, i+4);
				wsheet.addCell(wlabel1);
				Label wlabel2 = new Label(1, i+1, "设备种类" , format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel2);
				Label wlabel3 = new Label(3, i+1, elevator.getShebeizhonglei() , format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel3);
				Label wlabel4 = new Label(7, i+1, "设备类别", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel4);
				Label wlabel5 = new Label(9, i+1, elevator.getShebeileibie(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel5);
				i=2;
				Label wlabel6 = new Label(1, i+1, "设备品种" , format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel6);
				Label wlabel7 = new Label(3, i+1, elevator.getShebeipinzhong() , format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel7);
				Label wlabel8 = new Label(7, i+1, "产品名称", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel8);
				Label wlabel9 = new Label(9, i+1, elevator.getShebeimingcheng(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel9);
				i=3;
				Label wlabel10 = new Label(1, i+1, "设备代码" , format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel10);
				Label wlabel11 = new Label(3, i+1, elevator.getShebeidaima() , format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel11);
				Label wlabel12 = new Label(7, i+1, "设备型号", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel12);
				Label wlabel13 = new Label(9, i+1, elevator.getShebeixinghao(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel13);
				i=4;
				Label wlabel14 = new Label(1, i+1, "设备使用年限" , format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel14);
				Label wlabel15 = new Label(3, i+1, elevator.getShebeishiyongnianxian() , format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel15);
				Label wlabel16 = new Label(7, i+1, "固定资产值", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel16);
				Label wlabel17 = new Label(9, i+1, elevator.getGudingzichanzhi(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel17);
				i = 5;
				Label wlabel18 = new Label(0, i+1, "设备使用情况" , format);
				wsheet.mergeCells(0, i+1, 0, i+13);
				wsheet.addCell(wlabel18);
				Label wlabel19 = new Label(1, i+1, "使用单位名称" , format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel19);
				Label wlabel20 = new Label(3, i+1, elevator.getShiyongdanwei() , format);
				wsheet.mergeCells(3, i+1, 10, i+1);
				wsheet.addCell(wlabel20);
				i = 6;
				Label wlabel21 = new Label(1, i+1, "使用单位地址", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel21);
				Label wlabel22 = new Label(3, i+1, elevator.getShiyongdanwei_dizhi(), format);
				wsheet.mergeCells(3, i+1, 10, i+1);
				wsheet.addCell(wlabel22);
				i = 7;
				Label wlabel23 = new Label(1, i+1, "机构代码或信用代码", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel23);
				Label wlabel24 = new Label(3, i+1, elevator.getShiyongdanwei_code(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel24);
				Label wlabel25 = new Label(7, i+1, "邮政编码", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel25);
				Label wlabel26 = new Label(9, i+1, elevator.getShiyongdanwei_youbian(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel26);
				i = 8;
				Label wlabel27 = new Label(1, i+1, "单位性质", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel27);
				Label wlabel28 = new Label(3, i+1, elevator.getShiyongdanwei_xingzhi(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel28);
				Label wlabel29 = new Label(7, i+1, "所属行业", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel29);
				Label wlabel30 = new Label(9, i+1, elevator.getShiyongdanwei_suoshuhangye(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel30);
				i = 9;
				Label wlabel31 = new Label(1, i+1, "法定代表人", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel31);
				Label wlabel32 = new Label(3, i+1, elevator.getFadingdaibiaoren(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel32);
				Label wlabel33 = new Label(7, i+1, "安全管理部门", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel33);
				Label wlabel34 = new Label(9, i+1, elevator.getAnquanguanlibumen(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel34);
				i = 10;
				Label wlabel35 = new Label(1, i+1, "安全管理人员", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel35);
				Label wlabel36 = new Label(3, i+1, elevator.getAnquanguanlirenyuan(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel36);
				Label wlabel37 = new Label(7, i+1, "联系电话", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel37);
				Label wlabel38 = new Label(9, i+1, elevator.getAnquanguanli_lianxidianhua(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel38);
				i = 11;
				Label wlabel39 = new Label(1, i+1, "单位内编号", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel39);
				Label wlabel40 = new Label(3, i+1, elevator.getNeibubianhao(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel40);
				Label wlabel41 = new Label(7, i+1, "设备使用地点", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel41);
				Label wlabel42 = new Label(9, i+1, elevator.getShebeididian(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel42);
				i = 12;
				Label wlabel43 = new Label(1, i+1, "使用场所类别", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel43);
				Label wlabel44 = new Label(3, i+1, elevator.getShiyongchangsuo(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel44);
				Label wlabel45 = new Label(7, i+1, "设备地理信息", format);
				wsheet.mergeCells(7, i+1, 7, i+3);
				wsheet.addCell(wlabel45);
				Label wlabel46 = new Label(8, i+1, "经度", format);
				wsheet.addCell(wlabel46);
				Label wlabel47 = new Label(9, i+1, elevator.getJingdu(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel47);
				i = 13;
				Label wlabel48 = new Label(1, i+1, "运行状态", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel48);
				Label wlabel49 = new Label(3, i+1, "", format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel49);
				Label wlabel50 = new Label(8, i+1, "纬度", format);
				wsheet.addCell(wlabel50);
				Label wlabel51 = new Label(9, i+1, elevator.getWeidu(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel51);
				i = 14;
				Label wlabel52 = new Label(1, i+1, "投入使用日期", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel52);
				Label wlabel53 = new Label(3, i+1, null == elevator.getTouyongriqi_date() ? elevator.getTouyongriqi() : DateFormatTool.formate(elevator.getTouyongriqi_date(), "yyyy-MM-dd"), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel53);
				Label wlabel54 = new Label(8, i+1, "海拔高度", format);
				wsheet.addCell(wlabel54);
				Label wlabel55 = new Label(9, i+1, "", format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel55);
				i = 15;
				Label wlabel56 = new Label(1, i+1, "产权单位名称", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel56);
				Label wlabel57 = new Label(3, i+1, elevator.getChanquandanwei() , format);
				wsheet.mergeCells(3, i+1, 10, i+1);
				wsheet.addCell(wlabel57);
				i = 16;
				Label wlabel58 = new Label(1, i+1, "机构代码或信用代码", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel58);
				Label wlabel59 = new Label(3, i+1, elevator.getChanquandanwei_daima(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel59);
				Label wlabel60 = new Label(7, i+1, "联系电话", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel60);
				Label wlabel61 = new Label(9, i+1, elevator.getChanquandanwei_dianhua(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel61);
				i = 17;
				Label wlabel62 = new Label(1, i+1, "单位性质", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel62);
				Label wlabel63 = new Label(3, i+1, elevator.getChanquandanwei_xingzhi(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel63);
				Label wlabel64 = new Label(7, i+1, "所属行业", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel64);
				Label wlabel65 = new Label(9, i+1, elevator.getChanquandanwei_suoshuhangye(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel65);
				i = 18;
				Label wlabel66 = new Label(0, i+1, "设备制造与监检情况", format);
				wsheet.mergeCells(0, i+1, 0, i+7);
				wsheet.addCell(wlabel66);
				Label wlabel67 = new Label(1, i+1, "制造单位名称", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel67);
				Label wlabel68 = new Label(3, i+1, elevator.getZhizaodanwei(), format);
				wsheet.mergeCells(3, i+1, 10, i+1);
				wsheet.addCell(wlabel68);
				i = 19;
				Label wlabel69 = new Label(1, i+1, "制造许可证编号", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel69);
				Label wlabel70 = new Label(3, i+1, elevator.getZhizaodanweixukezhengbianhao(), format);
				wsheet.mergeCells(3, i+1,6, i+1);
				wsheet.addCell(wlabel70);
				Label wlabel71 = new Label(7, i+1, "产品编号", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel71);
				Label wlabel72 = new Label(9, i+1, elevator.getChuchangbianhao(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel72);
				i = 20;
				Label wlabel73 = new Label(1, i+1, "制造日期", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel73);
				Label wlabel74 = new Label(3, i+1, null == elevator.getZhizaoriqi_date() ? elevator.getZhizaoriqi() : DateFormatTool.formate(elevator.getZhizaoriqi_date(), "yyyy-MM-dd"), format);
				wsheet.mergeCells(3, i+1,6, i+1);
				wsheet.addCell(wlabel74);
				Label wlabel75 = new Label(7, i+1, "产品合格证编号", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel75);
				Label wlabel76 = new Label(9, i+1, elevator.getChanpinhegezhengbianhao(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel76);
				i = 21;
				Label wlabel77 = new Label(1, i+1, "设计文件鉴定机构", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel77);
				Label wlabel78 = new Label(3, i+1, elevator.getWenjianjiandingjigou(), format);
				wsheet.mergeCells(3, i+1, 10, i+1);
				wsheet.addCell(wlabel78);
				i = 22;
				Label wlabel79 = new Label(1, i+1, "鉴定报告书编号", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel79);
				Label wlabel80 = new Label(3, i+1, elevator.getJiandingbaogaobianhao(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel80);
				Label wlabel81 = new Label(7, i+1, "产品图号", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel81);
				Label wlabel82 = new Label(9, i+1, elevator.getChanpintuhao(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel82);
				i = 23;
				Label wlabel83 = new Label(1, i+1, "制造监检机构", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel83);
				Label wlabel84 = new Label(3, i+1, elevator.getZhizaojianjianjigou(), format);
				wsheet.mergeCells(3, i+1, 10, i+1);
				wsheet.addCell(wlabel84);
				i = 24;
				Label wlabel85 = new Label(1, i+1, "监检机构核准证编号", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel85);
				Label wlabel86 = new Label(3, i+1, elevator.getJianjianhezhunzheng(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel86);
				Label wlabel87 = new Label(7, i+1, "制造监检证书编号", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel87);
				Label wlabel88 = new Label(9, i+1, elevator.getJianjianzhengshubianhao(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel88);
				i = 25;
				Label wlabel89 = new Label(0, i+1, "设备施工情况", format);
				wsheet.mergeCells(0, i+1, 0, i+3);
				wsheet.addCell(wlabel89);
				Label wlabel90 = new Label(1, i+1, "施工单位名称", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel90);
				Label wlabel91 = new Label(3, i+1, elevator.getShigongdanwei(), format);
				wsheet.mergeCells(3, i+1, 10, i+1);
				wsheet.addCell(wlabel91);
				i = 26;
				Label wlabel92 = new Label(1, i+1, "施工许可证编号", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel92);
				Label wlabel93 = new Label(3, i+1, elevator.getShigongdanwei_xukezhengbianhao(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel93);
				Label wlabel94 = new Label(7, i+1, "施工类别", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel94);
				Label wlabel95 = new Label(9, i+1, elevator.getShigongleibie(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel95);
				i = 27;
				Label wlabel96 = new Label(1, i+1, "施工告知日期", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel96);
				Label wlabel97 = new Label(3, i+1, null == elevator.getShigongdanwei_shigongriqi()?"":DateFormatTool.formate(elevator.getShigongdanwei_shigongriqi(), "yyyy-MM-dd"), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel97);
				Label wlabel98 = new Label(7, i+1, "施工竣工日期", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel98);
				Label wlabel99 = new Label(9, i+1, null == elevator.getShigongdanwei_jungongriqi()?"":DateFormatTool.formate(elevator.getShigongdanwei_jungongriqi(), "yyyy-MM-dd"), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel99);
				i = 28;
				Label wlabelgzcs = new Label(0, i+1, "设备工作参数", format);
				wsheet.mergeCells(0, i+1, 0, i+2);
				wsheet.addCell(wlabelgzcs);
				Label wlabel100 = new Label(1, i+1, "工作压力", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel100);
				Label wlabel101 = new Label(3, i+1, null == elevator.getGongzuoyali()?"":elevator.getGongzuoyali().toString(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel101);
				Label wlabel102 = new Label(7, i+1, "工作温度", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel102);
				Label wlabel103 = new Label(9, i+1, null == elevator.getGongzuowendu()?"":elevator.getGongzuowendu().toString(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel103);
				i = 29;
				Label wlabel104 = new Label(1, i+1, "介质", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel104);
				Label wlabel105 = new Label(3, i+1, elevator.getJiezhi(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel105);
				Label wlabel106 = new Label(7, i+1, "运行热效率", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel106);
				Label wlabel107 = new Label(9, i+1, elevator.getYunxingrexiaolv(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel107);
				i = 30;
				Label wlabel108 = new Label(0, i+1, "设备保险情况", format);
				wsheet.mergeCells(0, i+1, 0, i+3);
				wsheet.addCell(wlabel108);
				Label wlabel109 = new Label(1, i+1, "保险机构", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel109);
				Label wlabel110 = new Label(3, i+1, elevator.getBaoxianjigou(), format);
				wsheet.mergeCells(3, i+1, 10, i+1);
				wsheet.addCell(wlabel110);
				i = 31;
				Label wlabel111 = new Label(1, i+1, "保险险种", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel111);
				Label wlabel112 = new Label(3, i+1, elevator.getBaoxianxianzhong(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel112);
				Label wlabel113 = new Label(7, i+1, "保险价值", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel113);
				Label wlabel114 = new Label(9, i+1, elevator.getBaoxianjiazhi(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel114);
				i = 32;
				Label wlabel115 = new Label(1, i+1, "保险费", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel115);
				Label wlabel116 = new Label(3, i+1, elevator.getBaoxianfei(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel116);
				Label wlabel117 = new Label(7, i+1, "保险金额", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel117);
				Label wlabel118 = new Label(9, i+1, elevator.getBaoxianji(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel118);
				i = 33;
				Label wlabel119= new Label(0, i+1, "设备变更情况", format);
				wsheet.mergeCells(0, i+1, 0, i+4);
				wsheet.addCell(wlabel119);
				Label wlabel120 = new Label(1, i+1, "变更项目", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel120);
				Label wlabel121 = new Label(3, i+1, "变更类别", format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel121);
				Label wlabel122 = new Label(7, i+1, "变更原因", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel122);
				Label wlabel123 = new Label(9, i+1, "变更日期", format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel123);
				i = 34;
				Label wlabel124 = new Label(1, i+1, "", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel124);
				Label wlabel125 = new Label(3, i+1, "", format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel125);
				Label wlabel126 = new Label(7, i+1, "", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel126);
				Label wlabel127 = new Label(9, i+1, "", format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel127);
				i = 35;
				Label wlabel128 = new Label(1, i+1, "", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel128);
				Label wlabel129 = new Label(3, i+1, "", format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel129);
				Label wlabel130 = new Label(7, i+1, "", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel130);
				Label wlabel131 = new Label(9, i+1, "", format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel131);
				i = 36;
				Label wlabel132 = new Label(1, i+1, "", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel132);
				Label wlabel133 = new Label(3, i+1, "", format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel133);
				Label wlabel134 = new Label(7, i+1, "", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel134);
				Label wlabel135 = new Label(9, i+1, "", format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel135);
				i = 37;
				Label wlabel136 = new Label(0, i+1, "设备检验情况", format);
				wsheet.mergeCells(0, i+1, 0, i+4);
				wsheet.addCell(wlabel136);
				Label wlabel137 = new Label(1, i+1, "检验机构", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel137);
				Label wlabel138 = new Label(3, i+1, elevator.getJianyanjigou(), format);
				wsheet.mergeCells(3, i+1, 10, i+1);
				wsheet.addCell(wlabel138);
				i = 38;
				Label wlabel139 = new Label(1, i+1, "机构代码或信用代码", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel139);
				Label wlabel140 = new Label(3, i+1, elevator.getJianyanjigou_code(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel140);
				Label wlabel141 = new Label(7, i+1, "检验类别", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel141);
				Label wlabel142 = new Label(9, i+1, elevator.getJianyanleixing(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel142);
				i = 39;
				Label wlabel143 = new Label(1, i+1, "检验日期", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel143);
				Label wlabel144 = new Label(3, i+1, null == elevator.getJianyankaishiriqi()?"":DateFormatTool.formate(elevator.getJianyankaishiriqi(), "yyyy-MM-dd"), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel144);
				Label wlabel145 = new Label(7, i+1, "检验结论", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel145);
				Label wlabel146 = new Label(9, i+1, elevator.getJianyanjielun(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel146);
				i = 40;
				Label wlabel147 = new Label(1, i+1, "检验报告编号", format);
				wsheet.mergeCells(1, i+1, 2, i+1);
				wsheet.addCell(wlabel147);
				Label wlabel148 = new Label(3, i+1, elevator.getYanshoubaogaobianhao(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel148);
				Label wlabel149 = new Label(7, i+1, "下次检验日期", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel149);
				Label wlabel150 = new Label(9, i+1, null == elevator.getXiacijianyanriqi()?"":DateFormatTool.formate(elevator.getXiacijianyanriqi(), "yyyy-MM-dd"), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel150);
				i = 41;
				Label wlabel161 = new Label(0, i+1, "在此申明：所申报的内容真实；在使用过程中，将严格执行《中华人民共和国特种设备安全法》、《特种设备安全监察条例》及其相关规定，并接受特种设备安全监督管理部门的监督管理。", leftFormat);
				wsheet.mergeCells(0, i+1, 10, i+2);
				wsheet.setRowView(i+1, 300);
				wsheet.addCell(wlabel161);
				i = 43;
				Label wlabel162 = new Label(0, i+1, " 附：合格证(含产品数据表)", leftFormat);
				wsheet.mergeCells(0, i+1, 10, i+1);
				wsheet.addCell(wlabel162);
				
				i = 44;
				Label wlabel151 = new Label(0, i+1, "使用单位填表人员：", format);
				wsheet.mergeCells(0, i+1, 2, i+1);
				wsheet.setRowView(i+1, 600);
				wsheet.addCell(wlabel151);
				Label wlabel152 = new Label(3, i+1, elevator.getTianbiaorenyuan(), format);
				wsheet.mergeCells(3, i+1, 4, i+1);
				wsheet.addCell(wlabel152);
				Label wlabel153 = new Label(5, i+1, "日期：", format);
				wsheet.mergeCells(5, i+1, 6, i+1);
				wsheet.addCell(wlabel153);
				Label wlabel154 = new Label(7, i+1, null == elevator.getTianbiaoriqi()?"":DateFormatTool.formate(elevator.getTianbiaoriqi(), "yyyy-MM-dd"), format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel154);
				Label wlabel163 = new Label(9, i+1, "(使用单位公章或者专用章)", format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel163);
				i = 45;
				Label wlabel155 = new Label(0, i+1, "使用单位安全管理人员：", format);
				wsheet.mergeCells(0, i+1, 2, i+1);
				wsheet.addCell(wlabel155);
				Label wlabel156 = new Label(3, i+1, elevator.getAnquanguanlirenyuan(), format);
				wsheet.mergeCells(3, i+1, 4, i+1);
				wsheet.addCell(wlabel156);
				Label wlabel157 = new Label(5, i+1, "日期：", format);
				wsheet.mergeCells(5, i+1, 6, i+1);
				wsheet.addCell(wlabel157);
				Label wlabel158 = new Label(7, i+1, "", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel158);
				Label wlabel164 = new Label(9, i+1, "  年   月   日", format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel164);
				i = 46;
				Label wlabel159 = new Label(0, i+1, "首次定期检验日期：", format);
				wsheet.mergeCells(0, i+1, 3, i+1);
				wsheet.addCell(wlabel159);
				Label wlabel160 = new Label(4, i+1, "", format);
				wsheet.mergeCells(4, i+1, 10, i+1);
				wsheet.addCell(wlabel160);
				i = 47;
				Label wlabel165 = new Label(0, i+1, "说明：", format);
				wsheet.addCell(wlabel165);
				Label wlabel166 = new Label(1, i+1, elevator.getBeizhu(), format);
				wsheet.mergeCells(1, i+1, 10, i+1);
				wsheet.addCell(wlabel166);
				i = 48;
				Label wlabel167 = new Label(0, i+1, "登记机关登记人员：", format);
				wsheet.mergeCells(0, i+1, 2, i+1);
				wsheet.addCell(wlabel167);
				Label wlabel168 = new Label(3, i+1, elevator.getDj_jingbanren(), format);
				wsheet.mergeCells(3, i+1, 4, i+1);
				wsheet.addCell(wlabel168);
				Label wlabel169 = new Label(5, i+1, "日期：", format);
				wsheet.mergeCells(5, i+1, 6, i+1);
				wsheet.addCell(wlabel169);
				Label wlabel170 = new Label(7, i+1, null == elevator.getDj_jingbanriqi()?"":DateFormatTool.formate(elevator.getDj_jingbanriqi(), "yyyy-MM-dd"), format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel170);
				Label wlabel171 = new Label(9, i+1, "登记机关（专用章）", format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel171);
				i=49;
				Label wlabel172 = new Label(0, i+1, "   年   月   日", format);
				wsheet.mergeCells(0, i+1, 10, i+1);
				wsheet.addCell(wlabel172);
				i = 50;
				Label wlabel173 = new Label(0, i+1, "  监管类别：", format);
				wsheet.mergeCells(0, i+1, 2, i+1);
				wsheet.addCell(wlabel173);
				Label wlabel174 = new Label(5, i+1, elevator.getJianguanleibie(), format);
				wsheet.mergeCells(3, i+1, 6, i+1);
				wsheet.addCell(wlabel174);
				Label wlabel175 = new Label(7, i+1, "  使用登记证编号：", format);
				wsheet.mergeCells(7, i+1, 8, i+1);
				wsheet.addCell(wlabel175);
				Label wlabel176 = new Label(9, i+1, elevator.getDengjizhengbianhao(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel176);
				i = 51;
				Label wlabel177 = new Label(0, i+1, " 市：", format);
				wsheet.mergeCells(0, i+1, 1, i+1);
				wsheet.addCell(wlabel177);
				Label wlabel178 = new Label(2, i+1, elevator.getShi(), format);
				wsheet.addCell(wlabel178);
				Label wlabel179 = new Label(3, i+1, "  区县：", format);
				wsheet.mergeCells(3, i+1, 4, i+1);
				wsheet.addCell(wlabel179);
				Label wlabel180 = new Label(5, i+1, elevator.getQuhuamingcheng(), format);
				wsheet.mergeCells(5, i+1, 7, i+1);
				wsheet.addCell(wlabel180);
				Label wlabel181 = new Label(8, i+1, "乡镇：", format);
				wsheet.addCell(wlabel181);
				Label wlabel182 = new Label(9, i+1, elevator.getXiangzhen(), format);
				wsheet.mergeCells(9, i+1, 10, i+1);
				wsheet.addCell(wlabel182);
			workbook.write();
			workbook.close();
			os.close();
		} catch (Exception e) {
			
		}
	}
	
	public void updateZcstate(String ids,TUser user,String state){
		TShuJuShenHe sh = null;
		TBaseInfoSearch bs = null;
		String neirong = "";
		for(String id : ids.split(",")){
			sh = new TShuJuShenHe();
			bs = (TBaseInfoSearch)super.findById(Long.parseLong(id),TBaseInfoSearch.class.getName());
			neirong = bs.getShebeizhonglei()+"&nbsp;&nbsp;&nbsp;"+bs.getShiyongdanwei()+"&nbsp;&nbsp;&nbsp;"+bs.getZhucedaima()+"&nbsp;&nbsp;&nbsp;"+
			bs.getChuchangbianhao()+"&nbsp;&nbsp;&nbsp;"+bs.getShi()+"&nbsp;&nbsp;&nbsp;"+bs.getQuhuamingcheng()+"&nbsp;&nbsp;&nbsp;"+DateFormatTool.formate(bs.getXiacijianyanriqi(), "yyyy-MM-dd");
			sh.setDataId(Long.parseLong(id));
			sh.setNeirong(neirong);
			sh.setOrgan_code(bs.getQuhuadaima());
			if("3".equals(state)){
				sh.setShenheleixing("停用申请");
			}else if("5".equals(state)){
				sh.setShenheleixing("注销申请");
			}else if("1".equals(state)){
				sh.setShenheleixing("启用申请");
			}
			sh.setTijiaoren(user.getName());
			sh.setTijiaoren_loginId(user.getLoginId());
			sh.setTijiaoriqi(new Date());
			sh.setType("设备");
			sh.setShstate("0");
			super.save(sh);
		}
	}

	//上传Excel
	public void saveuploadSeFile(TUser user,String ids,String type,File uploadify,String fileFileName,String text) throws IOException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Random rd = new Random();
		String fileType = fileFileName.substring(fileFileName.indexOf("."));
		if(FileUtils.fileType(fileType)){
		}else{
			String fileName = fileFileName.substring(0,fileFileName.indexOf("."));
			String newfileName = fileName+"_"+sdf.format(new Date())+(rd.nextInt(90000)+10000)+fileType;
		    //得到工程保存文件的路径
		    String savePath = Resources.getString("SHEBEIBIANGENGZILIAO", "struts");
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
	        
	        String[] str = ids.split(",");
	        TBaseFile seFile = null;
	        SimpleDateFormat sdff = new SimpleDateFormat("yyyy-MM-dd H:m:s");
	        for(int i=0;i<str.length;i++){
	        	seFile = new TBaseFile();
	        	seFile.setDataId(Long.parseLong(str[i]));
	        	seFile.setUpdateName(user.getName());
	        	try {
					seFile.setUpdateTime(sdff.parse(sdff.format(new Date())));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        	seFile.setFilePath(savePath+newfileName);
	        	seFile.setBeizhu(text);
	        	seFile.setType(type);
	        	super.save(seFile);
	        }
		}
		
        
	}
	
	/**
	 * 企业进行设备或使用单位信息变更的时候，验证是否有待审核的记录
	 * 如果有不允许再次进行变更信息操作，如果没有可以进行变更
	 * @param dataId 设备主键或使用单位主键
	 * @return
	 */
	public boolean findSJSH(String dataId){
		boolean flag = true;
		Long count = super.findTotalBySql(" select count(id) ct from qy_tab_shujushenhe where shstate = '0' and dataid in ("+dataId+") ");
		
		if(count > 0){
			flag = false;
		}
		return flag;
	}
	
	//获取锅炉压力管道
	public List<TBoiler_YLGD_HZB> getListByYlgdHzb(String id){
		String query = "from TBoiler_YLGD_HZB app where se_id = '"+id+"'";
		String order = " order by app.id";
		List<TBoiler_YLGD_HZB> list = super.findListByHql(query + order);
		if(list.size()==0){
			list.add(new TBoiler_YLGD_HZB());
		}
		return list;
	}
	
	
	public HashMap getHuaXiang(String id) {
		String path = ServletActionContext.getRequest().getContextPath();
		HashMap hm = new HashMap();
		HashMap h = null;
		List list = new ArrayList();
		List listLinks = new ArrayList();
		String sql = "";
		long cn = 0;
		String name = "";
		String url = "";
		int symbolSize = 20;
		String[] categories = { "设备", "一级标签", "二级标签" };
		String[] lg = { "相关单位", "相关人员", "监督情况", "检验情况", "修改记录", "隐患历史", "安全管理", "登记信息", "其他" };
		TBaseInfoSearch bi = (TBaseInfoSearch) super.findById(Long.parseLong(id), TBaseInfoSearch.class.getName());
		// 设备
		name = bi.getShebeizhonglei() + "\n使用登记证编号:";
		name += null == bi.getDengjizhengbianhao() ? "" : bi.getDengjizhengbianhao();
		setNode(3 * symbolSize, name, 0, h, list, "");
		// 一级标签
		for (int i = 0; i < lg.length; i++) {
			name = bi.getShebeizhonglei() + "\n使用登记证编号:";
			name += null == bi.getDengjizhengbianhao() ? "" : bi.getDengjizhengbianhao();
			setNode(2 * symbolSize, lg[i], 1, h, list, "");
			setLinks(lg[i], name, h, listLinks);
			// 二级标签
			if ("相关单位".equals(lg[i])) {
				name = "设计单位：";
				name += null == bi.getShejidanwei() ? "" : bi.getShejidanwei();
				setNode(symbolSize, name, 2, h, list, getCertNoByDw(bi.getShejidanwei(), "sjdw", bi.getId()));
				setLinks(name, lg[i], h, listLinks);

				name = "制造单位：";
				name += null == bi.getZhizaodanwei() ? "" : bi.getZhizaodanwei();
				setNode(symbolSize, name, 2, h, list, getCertNoByDw(bi.getZhizaodanwei(), "zzdw", bi.getId()));
				setLinks(name, lg[i], h, listLinks);

				name = "安装单位：";
				name += null == bi.getAnzhuangdanwei() ? "" : bi.getAnzhuangdanwei();
				setNode(symbolSize, name, 2, h, list, getCertNoByDw(bi.getAnzhuangdanwei(), "azdw", bi.getId()));
				setLinks(name, lg[i], h, listLinks);

				name = "施工单位：";
				name += null == bi.getShigongdanwei() ? "" : bi.getShigongdanwei();
				setNode(symbolSize, name, 2, h, list, getCertNoByDw(bi.getShigongdanwei(), "sgdw", bi.getId()));
				setLinks(name, lg[i], h, listLinks);

				name = "维保单位：";
				name += null == bi.getWeihubaoyangdanwei() ? "" : bi.getWeihubaoyangdanwei();
				setNode(symbolSize, name, 2, h, list, getCertNoByDw(bi.getWeihubaoyangdanwei(), "wbdw", bi.getId()));
				setLinks(name, lg[i], h, listLinks);

				name = "使用单位：";
				name += null == bi.getShiyongdanwei() ? "" : bi.getShiyongdanwei();
				setNode(symbolSize, name, 2, h, list, path + "/syUtils!openDwInfo.do?id=" + bi.getShiyongdanweiId()
						+ "&adr=sbhx");
				setLinks(name, lg[i], h, listLinks);
			} else if ("相关人员".equals(lg[i])) {
				name = "作业人员：";
				// name += null == bi.getZhucedengjirenyuan() ? "" :
				// bi.getZhucedengjirenyuan();
				setNode(symbolSize, name, 2, h, list, "");
				setLinks(name, lg[i], h, listLinks);

				// setNode(symbolSize,"操作人员："+bi.getZhucedengjirenyuan(),2,h,list);
				// setNode(symbolSize,"检验人员："+bi.getZhucedengjirenyuan(),2,h,list);
			} else if ("监督情况".equals(lg[i])) {
				setNode(symbolSize, "监督检查计划", 2, h, list, "");
				setLinks("监督检查计划", lg[i], h, listLinks);

				setNode(symbolSize, "监督检查记录", 2, h, list, "");
				setLinks("监督检查记录", lg[i], h, listLinks);

				setNode(symbolSize, "监察指令书", 2, h, list, "");
				setLinks("监察指令书", lg[i], h, listLinks);
			} else if ("检验情况".equals(lg[i])) {
				sql = "select count(*) ct from (select 'r' as jianyanxiangmu,w.jianyanriqi,w.xiacijianyanriqi,w.jianyanjielun,w.jianyanjigou "
						+ "from web_jiekou w where zhucedaima = '"
						+ bi.getZhucedaima()
						+ "' union select 't' as jianyanxiangmu,j.jianyanriqi,"
						+ "j.xiacijianyanriqi,j.jianyanjielun, j.jianyanjigou from tab_jianyanxinxi j where zhucedaima = '"
						+ bi.getZhucedaima() + "')";
				cn = super.findTotalBySql(sql);
				name = "历次检验记录(" + cn + ")";
				setNode(symbolSize, name, 2, h, list,
						path + "/jsp/biz/sbxx/huaxiang/licijianyanjilu.jsp?zcdm=" + bi.getZhucedaima());
				setLinks(name, lg[i], h, listLinks);
			} else if ("修改记录".equals(lg[i])) {
				name = "注册登记信息";
				/*
				 * sql =
				 * "select annalid from biz_register t where t.zhucedaima = '"
				 * +bi.getZhucedaima()+"' and tjstate='1'";
				 * List<HashMap<String,Object>> djList =
				 * super.findListBySql(sql); if(djList.size()==0){ sql =
				 * "select annalid from biz_register t where t.shiyongdengjizhenghaoma = '"
				 * +bi.getDengjizhengbianhao()+"' and tjstate='1'"; djList =
				 * super.findListBySql(sql); if(djList.size() == 0){ name +=
				 * "(暂无)"; url = ""; }else{ url =
				 * "/register!openZcdjbById.do?id="
				 * +djList.get(0).get("annalid")+
				 * "&zldm="+bi.getShebeizhongleidaima(); } }else{ url =
				 * "/register!openZcdjbById.do?id="
				 * +djList.get(0).get("annalid")+
				 * "&zldm="+bi.getShebeizhongleidaima(); }
				 */
				if (null != bi.getDjb_id()) {
					url = path + "/register!openZcdjbById.do?id=" + bi.getDjb_id() + "&zldm="
							+ bi.getShebeizhongleidaima();
				} else {
					name += "(暂无)";
					url = "";
				}
				setNode(symbolSize, name, 2, h, list, url);
				setLinks(name, lg[i], h, listLinks);

				sql = "select count(*) ct from biz_se_history t where t.pid = '" + bi.getId() + "'";
				cn = super.findTotalBySql(sql);
				name = "历次修改记录(" + cn + ")";
				setNode(symbolSize, name, 2, h, list,
						path + "/jsp/biz/sbxx/huaxiang/licixiugaijilu.jsp?id=" + bi.getId());
				setLinks(name, lg[i], h, listLinks);
			} else if ("隐患历史".equals(lg[i])) {
				sql = "select count(*) ct from tab_hideequ t where t.seid = '" + bi.getId() + "'";
				cn = super.findTotalBySql(sql);
				name = "历次隐患(" + cn + ")";
				setNode(symbolSize, name, 2, h, list, path + "/jsp/biz/sbxx/huaxiang/liciyinhuan.jsp?id=" + bi.getId());
				setLinks(name, lg[i], h, listLinks);
			} else if ("安全管理".equals(lg[i])) {
				name = "安全管理制度";
				setNode(symbolSize, name, 2, h, list, "");
				setLinks(name, lg[i], h, listLinks);
				name = "安全管理部门：";
				name += null == bi.getAnquanguanlibumen() ? "" : bi.getAnquanguanlibumen();
				setNode(symbolSize, name, 2, h, list, "");
				setLinks(name, lg[i], h, listLinks);
				name = "安全管理人员：";
				name += null == bi.getAnquanguanlirenyuan() ? "" : bi.getAnquanguanlirenyuan();
				setNode(symbolSize, name, 2, h, list, "");
				setLinks(name, lg[i], h, listLinks);
			} else if ("登记信息".equals(lg[i])) {
				name = "登记机关：";
				name += null == bi.getZhucedengjijigou() ? "" : bi.getZhucedengjijigou();
				setNode(symbolSize, name, 2, h, list, "");
				setLinks(name, lg[i], h, listLinks);
				name = "登记人员：";
				name += null == bi.getZhucedengjirenyuan() ? "" : bi.getZhucedengjirenyuan();
				setNode(symbolSize, name, 2, h, list, "");
				setLinks(name, lg[i], h, listLinks);
				name = "登记日期：";
				name += null == bi.getTianbiaoriqi() ? "" : DateFormatTool.format(bi.getTianbiaoriqi(), false);
				setNode(symbolSize, name, 2, h, list, "");
				setLinks(name, lg[i], h, listLinks);
				name = "登记证号或代码：\n";
				name += null == bi.getDengjizhengbianhao() ? null == bi.getZhucedaima() ? "" : bi.getZhucedaima() : bi
						.getDengjizhengbianhao();
				setNode(symbolSize, name, 2, h, list, "");
				setLinks(name, lg[i], h, listLinks);
			} else if ("其他".equals(lg[i])) {
				name = "官网";
				setNode(symbolSize, name, 2, h, list, "");
				setLinks(name, lg[i], h, listLinks);
				name = "舆情信息";
				setNode(symbolSize, name, 2, h, list, "");
				setLinks(name, lg[i], h, listLinks);
			}
		}

		hm.put("nodes", list);
		hm.put("links", listLinks);
		setCategoriesAndLegend(h, hm, categories);
		return hm;
	}
	

	public void setCategoriesAndLegend(HashMap h, HashMap hm, String[] c) {
		List l = new ArrayList();
		for (int i = 0; i < c.length; i++) {
			h = new HashMap();
			h.put("name", c[i]);
			l.add(h);
		}

		hm.put("categories", l);

		l = new ArrayList();
		for (int i = 1; i < c.length; i++) {
			l.add(c[i]);
		}

		hm.put("legend", l);
	}

	public void setNode(int symbolSize, String name, int c, HashMap h, List list, String url) {
		h = new HashMap();
		h.put("symbolSize", symbolSize);
		h.put("label", JSONObject.fromObject("{normal: {show: true,color:'#000'}}"));
		h.put("draggable", true);
		h.put("name", name);
		h.put("category", c);
		h.put("url", url);
		list.add(h);
	}

	public void setLinks(String source, String target, HashMap h, List listLinks) {
		h = new HashMap();
		h.put("source", source);
		h.put("target", target);
		listLinks.add(h);
	}

	public String getCertNoByDw(String dw, String type, Long id) {
		if (null == dw) {
			return "";
		}
		return "";

		// String url =
		// "http://218.57.139.17:9900/JYJCWEB/zcInterfaceAction!getInfo.do?";
		// List<HashMap<String,Object>> list = new
		// ArrayList<HashMap<String,Object>>();
		// String sql = "";
		// Session ses =
		// super.getBaseDAO().getHibernateTemplate().getSessionFactory().getCurrentSession();
		// ses.beginTransaction();
		//
		// if("zzdw".equals(type)){
		// url += "itemid=1511";
		// sql =
		// "select c.certno from tab_file_sezz_cert@DSJ_XZXK c where c.organid in (select o.organid from tab_file_sezz_organinfo@DSJ_XZXK o "
		// +
		// "where o.orgname = '"+dw+"')";
		// Query q = ses.createSQLQuery(sql);
		// q.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		// list = q.list();
		// }else if("sjdw".equals(type)){
		// url += "itemid=1510";
		// sql =
		// "select c.certno from tab_file_sesj_cert@DSJ_XZXK c where c.organid in (select o.organid from tab_file_sesj_organinfo@DSJ_XZXK o "
		// +
		// "where o.orgname = '"+dw+"')";
		// Query q = ses.createSQLQuery(sql);
		// q.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		// list = q.list();
		// }else if("azdw".equals(type) || "sgdw".equals(type) ||
		// "wbdw".equals(type)){
		//
		// url += "itemid=1512";
		// sql =
		// "select c.certno from tab_file_seagw_cert@DSJ_XZXK c where c.organid in (select o.organid from tab_file_seagw_organinfo@DSJ_XZXK o "
		// +
		// "where o.orgname = '"+dw+"')";
		// Query q = ses.createSQLQuery(sql);
		// q.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		// list = q.list();
		// }
		//
		// ses.getTransaction().rollback();
		// if(list.size()>0){
		// url += "&certno="+list.get(0).get("CERTNO");
		// }else{
		// url =
		// ServletActionContext.getRequest().getContextPath()+"/se!getDwInfo.do?type="+type+"&id="+id;
		// }
		// return url;
	}


}
