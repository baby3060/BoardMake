package com.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.LoggerMaster;
import com.common.action.ActionForward;
import com.common.action.MyAction;

public class LoginAction implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		
		LoggerMaster.debug("LoginAction", "Login");
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}