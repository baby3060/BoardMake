package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.pro.BoardDAO;
import com.common.LoggerMaster;

public class ListAction implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		
		LoggerMaster.debug("ListAction", "List");
		
		BoardDAO dao = new BoardDAO();
		
		int totalCount = dao.getTotalCount();
		
		req.setAttribute("totalCount", totalCount);
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}
