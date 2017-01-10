package com.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.LoggerMaster;
import com.common.action.ActionForward;
import com.common.action.MyAction;
import com.user.pro.UserDAO;

public class JoinProcAction implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		ActionForward forward = new ActionForward();
		
		LoggerMaster.info("JoinProcAction", "join");
		
		UserDAO userDAO = new UserDAO();
		
		String userId = req.getParameter("user_id");
		if( userId == null ) {
			userId = "";
		}
		String user_pass = req.getParameter("user_pass");
		if( user_pass == null ) {
			user_pass = "";
		}
		
		String user_name = req.getParameter("user_name");
		if( user_name == null ) {
			user_name = "";
		}
		
		if( userId.equals("") || user_pass.equals("") || user_name.equals("")) {
			req.setAttribute("actions", "userJoin.uo");
			req.setAttribute("errCode", "ERR");
			req.setAttribute("msg", "필수입력 내역 들 중 누락된 내용이 있습니다.");
		} else {
			// ID 중복
			int id_cnt = 0;
			if( id_cnt == 0 ) {
				// 회원가입 및 로그인하기
				LoginManager loginManager = LoginManager.getInstance();
				
				HttpSession session = req.getSession();
				
				loginManager.setSession(session, userId);
			} else {
				req.setAttribute("actions", "userLogin.uo");
				req.setAttribute("errCode", "ERR");
				req.setAttribute("msg", "이미 등록된 USER_ID 입니다.");
			}
		}
		
		return forward;
	}

}
