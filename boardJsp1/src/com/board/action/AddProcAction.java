package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.action.ActionForward;
import com.common.action.MyAction;

public class AddProcAction implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}
