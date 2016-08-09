package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddProcAction implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		
		String title = req.getParameter("title");
		
		System.out.println(title);
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}
