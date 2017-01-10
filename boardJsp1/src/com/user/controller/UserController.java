package com.user.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.controller.BoardController;
import com.common.LoggerMaster;
import com.common.action.ActionFactory;
import com.common.action.ActionForward;
import com.common.action.MyAction;

public class UserController extends HttpServlet implements Servlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)  {
		try {
			doProcess(req, res);
		} catch (ServletException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		} catch (IOException ioe) {
			// TODO Auto-generated catch block
			ioe.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)  {
		try {
			req.setCharacterEncoding("UTF-8");
			doProcess(req, res);
		} catch(UnsupportedEncodingException uee) {
			uee.printStackTrace();
		} catch (ServletException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		} catch (IOException ioe) {
			// TODO Auto-generated catch block
			ioe.printStackTrace();
		}
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException
	{
		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		LoggerMaster.info(UserController.class.getName(), "command : " + command);
		
		ActionFactory factory = new ActionFactory();
		MyAction action = factory.getAction(command);
		
		ActionForward forward = action.execute(req, res);
		
		String errCode = (String)req.getAttribute("errCode");
		
		if( errCode == null ) {
			errCode = "";
		} 
		
		makeForward(forward, command, errCode);
		
		// Dispatcher로 넘길 경우 request.~Attribute 사용 가능
		if(forward.isRedirect()) {
			res.sendRedirect(forward.getPath());
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
			dispatcher.forward(req, res);
		}
	}

	private static void makeForward(ActionForward forward, String command, String errCode) { 
		
		if( command.equals("/userLogin.uo") ) {
			forward.setIsRedirect(false);
			forward.setPath("./user/login.jsp");
		} else if ( command.equals("/userLoginProc.uo") ) {
			if(errCode.equals("")) {
				forward.setIsRedirect(true);
				forward.setPath("./board/list.jsp");
			} else {
				forward.setIsRedirect(false);
				forward.setPath("./include/error.jsp");
			}
		} else if(command.equals("/userJoin.uo")) {
			forward.setIsRedirect(true);
			forward.setPath("./user/join.jsp");
		} else if(command.equals("/userJoinProc.uo")) {
			if(errCode.equals("")) {
				forward.setIsRedirect(true);
				forward.setPath("./board/list.jsp");
			} else {
				forward.setIsRedirect(false);
				forward.setPath("./include/error.jsp");
			}
		} else if(command.equals("/userLogout.uo")) {
			forward.setPath("/userLogin.uo");
		}
	}
}
