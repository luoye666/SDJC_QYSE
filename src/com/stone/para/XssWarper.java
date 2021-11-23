package com.stone.para;

import cn.hutool.core.util.StrUtil;
import com.stone.support.utils.StringUtils;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zichen
 */
public class XssWarper extends HttpServletRequestWrapper {

    /**
     * 用于存储请求参数
     */
	private Map<String, String[]> params = new HashMap<String, String[]>();

	/**
	 * @Method content 富文本内容
	 * @Author MC 不进行处理的params
	 * @Return
	 * @Date 2019/11/25 0025 9:55
	 */
	private String noCheckParamsStr = "content";

	private HttpServletRequest request;

	public XssWarper(HttpServletRequest request) {
		super(request);
		this.request = request;
		this.params.putAll(request.getParameterMap());
        for (String key : this.params.keySet()) {
            this.params.put(key, getParameterValues(key));
        }
	}

	@Override
	public String getParameter(String name) {
		if (noCheckParamsStr.contains(name)) {
			return super.getParameter(name);
		}
		return filterValue(request.getParameter(name));
	}

    public String filterValue(String val) {
        if (StringUtils.isNotEmpty(val)) {
            // 将所有传递进来的String进行HTML编码，防止XSS攻击
            val = HtmlUtils.htmlEscape(val);
            StrUtil.removeAll(val, "alert");
            StrUtil.removeAllLineBreaks(val);
        }
        return val;
    }

    @Override
    public Map getParameterMap() {
        return this.params;
    }

    @Override
	public String[] getParameterValues(String name) {
        String[] values = params.get(name);
        for (int i = 0; i < values.length; i++) {
            values[i] = filterValue(values[i]);
        }
		return values;
	}

	public void addAllParameters(Map<String, String[]> otherParams) {
		for (Map.Entry<String, String[]> entry : otherParams.entrySet()) {
			addParameter(entry.getKey(), entry.getValue());
		}
	}

	public void addParameter(String name, Object value) {
		if (value != null) {
			if (value instanceof String[]) {
				params.put(name, (String[]) value);
			} else if (value instanceof String) {
				params.put(name, new String[] { (String) value });
			} else {
				params.put(name, new String[] { String.valueOf(value) });
			}
		}
	}

}
