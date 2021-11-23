package com.stone.sys.action;

import java.util.List;

import com.stone.para.IConstant;
import com.stone.support.SupportListAction;
import com.stone.sys.pojo.TShebeiYiqi;
import com.stone.sys.pojo.TUser;
import com.stone.sys.service.impl.ShebeiYiqiServiceImpl;

/**
 * 设备仪器action
 * @author THINKPAD
 * 2015年5月11日13:36:50
 */
public class ShebeiYiqiListAction extends SupportListAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 848768334774031152L;
	
	
	private ShebeiYiqiServiceImpl yiqiService;

	/**
	 * 获取结果集
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getList(){
//		TUser user = (TUser) super.getSession().getAttribute(IConstant.SESSION_TUSER);
		String yiqimingcheng = super.getParameter("yiqimingcheng");
		String xinghao = super.getParameter("xinghao");
		String neibubianhao = super.getParameter("neibubianhao");
		String shebeizhonglei = super.getParameter("sbzl");
//		String username = super.getParameter("username");
		String query = "from TShebeiYiqi t ";
		String conditions = " where 1=1 ";
		String order = " order by t.id desc";
		
		//查询条件
		//字典数据名称
		if(super.checkParam(yiqimingcheng)){
			conditions += " and t.yiqimingcheng like '%" + yiqimingcheng + "%'";
		}
		if(super.checkParam(xinghao)){
			conditions += " and t.xinghao like '%"+xinghao+"%'";
		}
		if(super.checkParam(neibubianhao)){
			conditions += " and t.neibubianhao like '%"+neibubianhao+"%'";
		}
		if(super.checkParam(shebeizhonglei)){
			conditions += " and t.shebeizhonglei = '"+shebeizhonglei+"'";
		}
		/*if(super.checkParam(username)){
			conditions += " and t.userId = "+user.getId()+" OR t.userId = 1";
		}else{
			conditions += " and t.userId <> "+user.getId()+" ";
		}
		*/
		query += conditions + order;
		
		List list = this.yiqiService.findPageListByHql(query, super.getPagination(), super.getRowNumber());
		long total = this.yiqiService.findTotalByHql("select count(t) " + query);
		super.addActionData(ROWS, list).addActionData(TOTAL, total);
		return SUCCESS;
	}
	
	/**
	 * 获取仪器设备详细信息
	 * @return
	 */
	public String getByYiqiId(){
		String id = super.getParameter("id");
		TShebeiYiqi yiqi = (TShebeiYiqi) this.yiqiService.findById(Long.parseLong(id), TShebeiYiqi.class.getName());
		this.addActionData("yiqi", yiqi);
		return SUCCESS;
	}
	
	/**
	 * 仪器设备的借用记录
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getYiqiInfoList(){
		TUser user = (TUser) super.getSession().getAttribute(IConstant.SESSION_TUSER);
		String username = super.getParameter("username");
		
		String query = "from TShebeiYiqiInfo t ";
		String conditions = " where t.guihuanren is null";
		String order = " order by t.id ";
		
		//查询条件
		if(super.checkParam(username)){
			conditions += " and t.userid = '"+user.getId()+"'"; 
		}
		
		query += conditions+ order;
		List list = this.yiqiService.findListByHql(query);
		this.addActionData(ROWS, list);
		return SUCCESS;
	}
	
	/**
	 * 通过原始记录主键获取原始记录项目
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getYiqiYsjlList(){
		String id = super.getParameter("id");
		List list = yiqiService.findListByHql("From TShebeiYiqiYsjl t WHERE t.ysjlid ='"+id+"'");
		this.addActionData(ROWS, list);
		return SUCCESS;
	}
	
	/**
	 * 验证内部编号唯一
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String verifyNeibubianhao(){
    	String bh = super.getParameter("bianhao");
    	String sbzl = super.getParameter("sbzl");
    	String hql = "FROM TShebeiYiqi t WHERE t.neibubianhao = '"+bh+"' and t.shebeizhonglei = '"+sbzl+"'";
    	List<TShebeiYiqi> list = yiqiService.findListByHql(hql);
    	super.addActionData("result", list.size());
    	return SUCCESS;
    }
	
	
	
	public void setYiqiService(ShebeiYiqiServiceImpl yiqiService) {
		this.yiqiService = yiqiService;
	}
	
	
}
