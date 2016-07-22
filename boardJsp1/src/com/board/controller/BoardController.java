package com.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.ActionFactory;
import com.board.action.ActionForward;
import com.board.action.MyAction;
import com.common.LoggerMaster;

public class BoardController extends HttpServlet implements Servlet {
	
	// serialVersionID
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
			doProcess(req, res);
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
		
		LoggerMaster.info(BoardController.class.getName(), "command : " + command);
		
		ActionFactory factory = new ActionFactory();
		MyAction action = factory.getAction(command);
		ActionForward forward = action.execute(req, res);
		
		makeForward(forward, command);
		
		// Dispatcher로 넘길 경우 request.~Attribute 사용 가능
		if(forward.isRedirect()) {
			res.sendRedirect(forward.getPath());
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
			dispatcher.forward(req, res);
		}
	}
	

	private static void makeForward(ActionForward forward, String command) { 
		if( command.equals("/boardList.bo") ) {
			forward.setIsRedirect(false);
			forward.setPath("./board/list.jsp");
		} else if (command.equals("/boardAdd.bo")) {
			forward.setIsRedirect(false);
			forward.setPath("./board/add.jsp");
		} else if( command.equals("/boardDetail.bo") ) {
			forward.setIsRedirect(false);
			forward.setPath("./board/detail.jsp");
		}
		
		
	}
}
