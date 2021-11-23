package com.stone.support;

import java.io.IOException;
import java.sql.BatchUpdateException;
import java.sql.SQLException;

import net.sf.json.JSONObject;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.dao.DataAccessException;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class SupportExceptionInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = -8269621527674908594L;

	@Override
	public String intercept(ActionInvocation invoke) throws Exception {
		JSONObject jsonDataSet = (JSONObject)invoke.getStack().findValue("jsonDataSet");
		
		String errorMsg = null;
		
		try{
			invoke.invoke();
		}catch(NullPointerException e){
			errorMsg = "调用的对象不存在!";
			e.printStackTrace();
		}catch(IOException e){
			errorMsg = "访问资源时发生异常!";
			e.printStackTrace();
		}catch(ClassNotFoundException e){
			errorMsg = "指定的类不存在!";
			e.printStackTrace();
		}catch(IllegalArgumentException  e){
			errorMsg = "传递所需参数时发生异常!";
			e.printStackTrace();
		}catch(ClassCastException e){
			errorMsg = "强制类型转换时发生异常!";
			e.printStackTrace();
		}catch(BatchUpdateException e){
			errorMsg = "批量更新数据时发生异常!";
			e.printStackTrace();
		}catch(ConstraintViolationException e){
			errorMsg = "违反约束条件，数据操作失败!";
			e.printStackTrace();
		}catch(SQLException e){
			errorMsg = "操作数据库发生异常!";
			e.printStackTrace();
		}catch(DataAccessException e){
			errorMsg = "数据库操作发生异常!";
			e.printStackTrace();
		}catch(NoSuchMethodError e){
			errorMsg = "未找到调用所需方法!";
			e.printStackTrace();
		}catch(InternalError e){
			errorMsg = "虚拟机内部发生错误!";
			e.printStackTrace();
		}catch (Exception e) {
			errorMsg = "程序内部发生错误!";
			e.printStackTrace();
		}
		
		if(errorMsg != null){
			jsonDataSet.put(SupportAction.RESULT, false);
			jsonDataSet.put(SupportAction.SYSTEM_ERROR_MSG, errorMsg);
		}
		
		return "success";
	}

}
