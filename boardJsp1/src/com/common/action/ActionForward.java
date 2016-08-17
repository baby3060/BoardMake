package com.common.action;

public class ActionForward {
	private boolean isRedirect = false;
	private String path;
	
	public boolean isRedirect() {
		return this.isRedirect;
	}
	public String getPath() {
		return this.path;
	}
	public void setIsRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
