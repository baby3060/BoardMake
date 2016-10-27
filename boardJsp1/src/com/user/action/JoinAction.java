package com.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.LoggerMaster;
import com.common.action.ActionForward;
import com.common.action.MyAction;

public class JoinAction implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		
		LoggerMaster.info("JoinAction", "join");
		
		HttpSession session = req.getSession();
		
		session.invalidate();
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}
