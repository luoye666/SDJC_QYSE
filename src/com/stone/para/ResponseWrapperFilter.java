package com.stone.para;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResponseWrapperFilter implements Filter {

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) servletRequest;
		HttpServletResponse resp = (HttpServletResponse) servletResponse;
		ResponseWrapper mResp = new ResponseWrapper(resp); // 包装响应对象 resp
															// 并缓存响应数据

		filterChain.doFilter(req, mResp);

		// byte[] b = mResp.getBytes();

		String s = mResp.getResult();
		s = filterHTML(s);
		resp.setContentLength(-1);
		ByteArrayOutputStream bout = new ByteArrayOutputStream();

		bout.write(s.getBytes()); // 将响应的数据写到 Gzip 压缩流中
		bout.flush();
		bout.close(); // 将数据刷新到 bout 字节流数组

		byte[] bts = bout.toByteArray();
		String result = new String(bts, "UTF-8");
		resp.getOutputStream().write(result.getBytes()); // 将压缩数据响应给客户端

	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void destroy() {
	}

	public String filterHTML(String result) throws IOException {

		if (result.length() > 0) {
			if (result.contains("D:\\SDJC\\")) {
				result = result.replace("D:\\SDJC\\", "SDJC4");
			}
			if (result.contains("D:\\SDAZ\\")) {
				result = result.replace("D:\\SDAZ\\", "SDAZ4");
			}
			if (result.contains("D:\\QYSE\\")) {
				result = result.replace("D:\\QYSE\\", "QYSE4");
			}

			if (result.contains("E:\\SDJC\\")) {
				result = result.replace("E:\\SDJC\\", "SDJC5");
			}
			if (result.contains("E:\\SDAZ\\")) {
				result = result.replace("E:\\SDAZ\\", "SDAZ5");
			}
			if (result.contains("E:\\QYSE\\")) {
				result = result.replace("E:\\QYSE\\", "QYSE5");
			}

			if (result.contains("D:/SDJC/")) {
				result = result.replace("D:/SDJC/", "SDJC4");
			}
			if (result.contains("D:/SDAZ/")) {
				result = result.replace("D:/SDAZ/", "SDAZ4");
			}
			if (result.contains("D:/QYSE/")) {
				result = result.replace("D:/QYSE/", "QYSE4");
			}

			if (result.contains("E:/SDJC/")) {
				result = result.replace("E:/SDJC/", "SDJC5");
			}
			if (result.contains("E:/SDAZ/")) {
				result = result.replace("E:/SDAZ/", "SDAZ5");
			}
			if (result.contains("E:/QYSE/")) {
				result = result.replace("E:/QYSE/", "QYSE5");
			}
		}

		return result;
	}

}
