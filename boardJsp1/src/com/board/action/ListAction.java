package com.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.pro.BoardBean;
import com.board.pro.BoardDAO;
import com.common.LoggerMaster;
import com.common.action.ActionForward;
import com.common.action.MyAction;

public class ListAction implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		
		LoggerMaster.debug("ListAction", "List");
		
		String current_Page = req.getParameter("current_Page");
		if( current_Page == null ) {
			current_Page = "";
		}
		
		int currentPage = 0;
		if(current_Page.equals("")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(current_Page);
		}
		
		int startPage = 0;
		int endPage = 0;
		int totalPage = 0;
		
		int PageSize = 10;
		int PageWidth = 10;
		
		LoggerMaster.debug("ListAction", "This CurrentPage Is : " + currentPage);
		
		BoardDAO dao = new BoardDAO();
		
		int totalCount = dao.getTotalCount();
		
		if(totalCount == -1)
		{
			LoggerMaster.error("ListAction", "No Connected DB");
		}
		else
		{
			ArrayList<BoardBean> boardList = dao.selectBoardListAll();
			
			LoggerMaster.debug("totalCount : " + totalCount, "getTotalCount");
			
			req.setAttribute("boardList", boardList);
			req.setAttribute("totalCount", totalCount);
			req.setAttribute("current_Page", currentPage);
		}
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}
