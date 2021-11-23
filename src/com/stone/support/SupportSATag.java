package com.stone.support;

import javax.servlet.jsp.JspException; 
import javax.servlet.jsp.tagext.TagSupport;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.stone.para.IConstant;
import com.stone.sys.pojo.TUser;
import com.stone.sys.service.impl.MenuServiceImpl;

/**
 * 权限验证的自定义标签
 * @author foo
 */
public class SupportSATag extends TagSupport {
	private static final long serialVersionUID = -7628103880167408458L;
	
	private String code;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Override
	public int doStartTag() throws JspException {
		ApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(super.pageContext.getServletContext());
		MenuServiceImpl menuService = (MenuServiceImpl)context.getBean("menuService",MenuServiceImpl.class);
		
		TUser user = (TUser)super.pageContext.getSession().getAttribute(IConstant.SESSION_TUSER);
		if(user != null){
			boolean result = menuService.hasAuthority(user, code);
			if(result){
				return EVAL_BODY_INCLUDE;
			}
		}
		return SKIP_BODY;
	}
	
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}
	
}
