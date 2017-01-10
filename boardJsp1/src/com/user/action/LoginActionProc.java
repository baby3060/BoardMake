package com.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.LoggerMaster;
import com.common.action.ActionForward;
import com.common.action.MyAction;
import com.user.pro.UserDAO;

public class LoginActionProc implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		
		// LoggerMaster.debug("LoginActionProc", "Login");
		
		String userId = req.getParameter("UserID");
		String userPass = req.getParameter("UserPass");
		
		UserDAO userDAO = new UserDAO();
		
		if(userDAO.managerConnIsNotNull()) {
			// 둘 다 공백 아닐 때
			if( !userId.equals("") && !userPass.equals("") ) {
				// UserId 가 존재하는지?
				int usrCnt = userDAO.countExUserId(userId);
				
				if( usrCnt == 1 ) {
					// Id의 Password 비교
					String dbPass = userDAO.getSaveDbPW(userId);
					
					if( dbPass.equals(userPass) ) {
						LoginManager loginManager = LoginManager.getInstance();
						
						HttpSession session = req.getSession();
						
						if( loginManager.isUsing(userId) ) {
							req.setAttribute("actions", "userLogin.uo");
							req.setAttribute("errCode", "ERR");
							req.setAttribute("msg", "이미 로그인 된 계정입니다.다시 로그인 해주십시오.");
							loginManager.eqUsingSRemove(userId);
						} else {
							loginManager.setSession(session, userId);
						}
						
					} else {
						req.setAttribute("actions", "userLogin.uo");
						req.setAttribute("errCode", "ERR");
						req.setAttribute("msg", "입력 비밀번호와 저장 비밀번호가 다릅니다.");
					}
				} else {
					req.setAttribute("actions", "userLogin.uo");
					req.setAttribute("errCode", "ERR");
					if( usrCnt == 0 ) {
						req.setAttribute("msg", "존재하지 않는 User입니다.");
					} else {
						req.setAttribute("msg", "잘못된 User입니다.");
					}
				}
			}
		} else {
			req.setAttribute("errCode", "ERR");
			req.setAttribute("msg", "DB가 연결되지 않았습니다.");
		}
		
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}