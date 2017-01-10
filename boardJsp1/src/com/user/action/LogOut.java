package com.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.action.ActionForward;
import com.common.action.MyAction;

public class LogOut implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		String connId = req.getParameter("ConnID"); 
		
		if( connId == null ) {
			connId = "";
		}
		
		LoginManager loginManager = LoginManager.getInstance();
		
		loginManager.eqUsingSRemove(connId);
		
		ActionForward forward = new ActionForward();
		return forward;
	}
}