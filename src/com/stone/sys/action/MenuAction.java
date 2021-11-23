package com.stone.sys.action;

import java.util.List;

import net.sf.json.JSONArray;

import com.stone.support.SupportAction;
import com.stone.sys.pojo.TMenu;
import com.stone.sys.service.impl.MenuServiceImpl;


public class MenuAction extends SupportAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8749964810755717003L;
	private MenuServiceImpl menuService;
	private TMenu menu;
	
	public TMenu getMenu() {
		return menu;
	}
	public void setMenu(TMenu menu) {
		this.menu = menu;
	}
	public void setMenuService(MenuServiceImpl menuService) {
		this.menuService = menuService;
	}
	
	@SuppressWarnings("unchecked")
	public String add() throws Exception{
	/*	List<TMenu> btnList = (List<TMenu>)JSONArray.toCollection(JSONArray.fromObject(super.getParameter("btns")),TMenu.class);
		boolean validate = true;
		for(TMenu btn : btnList){
			if(!this.menuService.validateButtonCode(btn)){
				validate = false;
				super.addLogicError(btn.getBtnCode() + " 编号重复");
			}
		}
		
		if(validate){
			this.menuService.save(this.menu,btnList);
		}else{
			super.setLogicErrorTitle("菜单添加失败");
		}*/
		this.menuService.save(this.menu);
		super.addActionData("id", menu.getId());
		
		return SUCCESS;
	}
	
	public String deleteByIds() throws Exception{
		String ids = super.getParameter("ids");
		this.menuService.deleteByIds(ids);
		
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String edit() throws Exception{
		/*菜单信息*/
	//	List<TMenu> btnList = (List<TMenu>)JSONArray.toCollection(JSONArray.fromObject(super.getParameter("btns")),TMenu.class);
		boolean btnCodeValidate = true;
		
	/*	String message = "错误：";
		for(TMenu btn : btnList){
			if(!this.menuService.validateButtonCode(btn)){
				message += "["+btn.getBtnCode()+"] ";
				btnCodeValidate = false;
				break;
			}
		}
		message += " 编号重复!";*/
		
	/*	if(btnCodeValidate){
			this.menuService.update(menu, btnList);
		}else{
			//super.addActionData(ERROR_MSG, message);
		}
		*/
		this.menuService.update(menu);
		return SUCCESS;
	}
	
	public String getMenuInfo() throws Exception{
		String id = super.getParameter("id");
		menu = (TMenu)this.menuService.findById(Long.parseLong(id), TMenu.class.getName());
		return "OPEN_MENU_SUCCESS";
	}
}
