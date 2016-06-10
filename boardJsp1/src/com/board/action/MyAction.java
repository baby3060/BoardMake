package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MyAction {
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res);
}
