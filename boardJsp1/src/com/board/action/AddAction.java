package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.LoggerMaster;

public class AddAction implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		
		LoggerMaster.debug("AddAction", "Add");
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}
