package com.stone.sys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.stone.support.SupportService;
import com.stone.sys.pojo.TShebeiYiqi;
import com.stone.sys.pojo.TShebeiYiqiInfo;
import com.stone.sys.pojo.TUser;


public class ShebeiYiqiServiceImpl extends SupportService{

	/**
	 * 修改
	 * @param id
	 * @param yiqi
	 */
	public void updateData(String id,TShebeiYiqi yiqi){
		TShebeiYiqi yiqishebei = (TShebeiYiqi) super.findById(Long.parseLong(id), TShebeiYiqi.class.getName());
		yiqishebei.setNeibubianhao(yiqi.getNeibubianhao());
		yiqishebei.setShebeizhonglei(yiqi.getShebeizhonglei());
		yiqishebei.setXinghao(yiqi.getXinghao());
		yiqishebei.setYiqimingcheng(yiqi.getYiqimingcheng());
		super.update(yiqishebei);
	}
	
	/**
	 * 仪器领用
	 * @param id
	 * @param info
	 * @param yiqi
	 */
	public void saveYiqiInfo(String ids,TUser user,TShebeiYiqi yiqi){
		Calendar cal = Calendar.getInstance();
		if(ids != null){
			String[] id = ids.split(",");
			for(int i=0;i<id.length;i++){
				TShebeiYiqi yiqishebei = (TShebeiYiqi) super.findById(Long.parseLong(id[i]), TShebeiYiqi.class.getName());
				TShebeiYiqiInfo info = new TShebeiYiqiInfo();
				info.setYiqiid(yiqishebei.getId());
				info.setJieyongriqi(cal.getTime());
				info.setYiqimingcheng(yiqishebei.getYiqimingcheng());
				info.setNeibubianhao(yiqishebei.getNeibubianhao());
				info.setXinghao(yiqishebei.getXinghao());
				info.setJieyongren(user.getName());
				info.setUserid(user.getId());
				
				super.saveReturnId(info);
				
				yiqishebei.setJieyongren(user.getName());
				yiqishebei.setJieyongriqi(cal.getTime());
				yiqishebei.setState("1");
//				yiqishebei.setYiqiinfoid(yiqiinfoid);//存入仪器主键
				super.update(yiqishebei);
			}
		}
		
	}
	
	/**
	 * 归还
	 * @param id
	 * @param user
	 */
	public void updateYiqiInfo(String ids,TUser user){
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(ids != null){
			
			int row = super.executeUpdateByHql("UPDATE TShebeiYiqiInfo t SET t.guihuanren = '"+user.getName()+"'," +
					"t.guihuanriqi = to_date('"+sf.format(new java.util.Date())+"','yyyy-MM-dd HH24:mi:ss') " +
							"WHERE t.yiqiid in("+ids+") and t.userid = '"+user.getId()+"' and t.guihuanren is null");
			
			if(row > 0){
				super.executeUpdateByHql("UPDATE TShebeiYiqi t SET t.state = '0',t.guihuanren = '"+user.getName()+"'," +
					"t.guihuanriqi = to_date('"+sf.format(new java.util.Date())+"','yyyy-MM-dd HH24:mi:ss') WHERE t.id in("+ids+")");
			}
		}
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void deleteDataByIds(String ids){
		if(ids != null){
			String[] id = ids.split(",");
			for (int i = 0; i < id.length; i++) {
				TShebeiYiqi yiqi = (TShebeiYiqi) super.findById(Long.parseLong(id[i]), TShebeiYiqi.class.getName());
				super.delete(yiqi);
			}
		}
	}
	
	
}
