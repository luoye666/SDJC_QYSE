package com.stone.sys.action;

import com.stone.support.SupportAction;
import com.stone.sys.pojo.TOrgan;
import com.stone.sys.service.impl.OrganServiceImpl;

public class OrganAction extends SupportAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3142808412180567125L;
	private OrganServiceImpl baseService;
	private TOrgan organ;
	
	public TOrgan getOrgan() {
		return organ;
	}
	public void setOrgan(TOrgan organ) {
		this.organ = organ;
	}
	public void setBaseService(OrganServiceImpl baseService) {
		this.baseService = baseService;
	}

	public String add() throws Exception{
		this.baseService.addOrgan(organ);
		super.addActionData("id",organ.getId());
		return SUCCESS;
	}
	
	public String delete() throws Exception{
		return SUCCESS;
	}
	
	public String deleteByIds() throws Exception{
		String ids = super.getParameter("ids");
		this.baseService.deleteByIds(ids);
		return SUCCESS;
	}
	
	public String edit() throws Exception{
		this.baseService.update(this.organ);
		return SUCCESS;
	}

	public String getOrganInfo() throws Exception{
		Long id = super.getParameterLong("id");
		organ = (TOrgan)this.baseService.findById(id, TOrgan.class.getName());
		return "OPEN_ORGAN_SUCCESS";
	}
	public String getById() throws Exception{
		Long id = super.getParameterLong("id");
		organ = (TOrgan)this.baseService.findById(id, TOrgan.class.getName());
		super.addActionData("organ",organ);
		return SUCCESS;
	}
	
	/**
	 * 使用单位显示质监局电话
	 * 电话存储在 organ 中的 tel
	 * @return
	 */
	public String getByTel(){
		String code = super.getParameter("code");
		
		if(code.trim().length() > 0){
			organ = (TOrgan) baseService.findSingletonByHql(" from TOrgan o where o.code = '"+code.trim()+"' and o.tel is not null");
			if(organ != null){
				super.addActionData("tel", organ.getTel());
			}else{
				super.addActionData("tel", "");
			}
		}
		return SUCCESS;
	}
}
