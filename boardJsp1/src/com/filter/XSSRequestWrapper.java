package com.filter;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class XSSRequestWrapper extends HttpServletRequestWrapper {

	private static Pattern[] patterns = new Pattern[] {
			Pattern.compile("<script>(.*?)</script>", Pattern.CASE_INSENSITIVE),
			Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?)\\\'",
					Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
							| Pattern.DOTALL),
			Pattern.compile("src[\r\n]*=[\r\n]*\\\"(.*?)\\\"",
					Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
							| Pattern.DOTALL),
			Pattern.compile("</script>", Pattern.CASE_INSENSITIVE),
			Pattern.compile("<script(.*?)>", Pattern.CASE_INSENSITIVE
					| Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("eval\\((.*?)\\)", Pattern.CASE_INSENSITIVE
					| Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("expression\\((.*?)\\)", Pattern.CASE_INSENSITIVE
					| Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("javascript:", Pattern.CASE_INSENSITIVE),
			Pattern.compile("vbscript:", Pattern.CASE_INSENSITIVE),
			Pattern.compile("onload(.*?)=", Pattern.CASE_INSENSITIVE
					| Pattern.MULTILINE | Pattern.DOTALL)

	};
	
	public XSSRequestWrapper(HttpServletRequest servletRequest) {

		super(servletRequest);

	}

	@Override
	public String[] getParameterValues(String parameter) {
        // System.out.println("getParameterValues");
		String[] values = super.getParameterValues(parameter);

		if (values == null) {
			return null;
		}

		int count = values.length;

		String[] encodedValues = new String[count];

		for (int i = 0; i < count; i++) {
			encodedValues[i] = stripXSS(values[i]);
		}

		return encodedValues;

	}

	@Override
	public String getParameter(String parameter) {
		// System.out.println("getParameter");
		String value = super.getParameter(parameter);
		String result = "";
		
		if(value == null || value.equals("")) {
			result = "";
		} else {
			result = stripXSS(value);
		}
		
		return result;
	}

	@Override
	public String getHeader(String name) {
		// System.out.println("getHeader");
		String value = super.getHeader(name);

		return stripXSS(value);

	}

	private String stripXSS(String value) {
		// System.out.println("stripXSS: value= "+value);
		if (value != null) {

			value = value.replaceAll("\0", "");
			
			for (Pattern scriptPattern : patterns) {
				if ( scriptPattern.matcher(value).find() ) {
					value=value.replaceAll("<", "&lt;").replaceAll(">", "&gt;");		
				}
			}
		}
		// System.out.print("result: "+value);
		return value;

	}
	

}