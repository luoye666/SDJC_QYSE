package com.stone.sys.action;

import com.stone.support.SupportAction;
import com.stone.sys.pojo.TSeDirectory;
import com.stone.sys.service.impl.SeDirServiceImpl;

public class SeDirectoryAction extends SupportAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 613162496010489145L;
	private SeDirServiceImpl dirService;
	private TSeDirectory dir;
	
	
	public void setDirService(SeDirServiceImpl dirService) {
		this.dirService = dirService;
	}

	public TSeDirectory getDir() {
		return dir;
	}

	public void setDir(TSeDirectory dir) {
		this.dir = dir;
	}

	public String add() throws Exception{
		this.dirService.addDir(dir);
		return SUCCESS;
	}
	
	public String delete() throws Exception{
		return SUCCESS;
	}
	
	public String deleteByIds() throws Exception{
		String ids = super.getParameter("ids");
		this.dirService.deleteByIds(ids);
		return SUCCESS;
	}
	
	public String edit() throws Exception{
		this.dirService.update(this.dir);
		return SUCCESS;
	}
	
	public String getById() throws Exception{
		Long id = super.getParameterLong("id");
		TSeDirectory dir = (TSeDirectory)this.dirService.findById(id, TSeDirectory.class.getName());
		addActionData("dir", dir);
		
		return SUCCESS;
	}
}
