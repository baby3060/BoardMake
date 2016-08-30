package com.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.LoggerMaster;
import com.common.action.ActionForward;
import com.common.action.MyAction;

public class LoginActionProc implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		
		LoggerMaster.debug("LoginActionProc", "Login");
		
		String userId = req.getParameter("UserID");
		String userPass = req.getParameter("UserPass");
		
		LoggerMaster.debug("LoginActionProc", "Input User Id : " + userId + ", User Pass : " + userPass);
		
		HttpSession session = req.getSession();
		
		session.setAttribute("UserID", userId);
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}