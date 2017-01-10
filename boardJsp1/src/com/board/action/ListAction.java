package com.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.pro.BoardBean;
import com.board.pro.BoardDAO;
import com.common.LoggerMaster;
import com.common.action.ActionForward;
import com.common.action.MyAction;

public class ListAction implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
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
		
		// 한 페이지당 몇 개의 게시물
		final int PAGE_SIZE = 10;
				
		// 한 화면당 몇 개의 페이지
		final int PAGE_WIDTH = 10;
		
		
		// 전체 페이지
		int totalPage = 0;
		
		// 시작 페이지
		// 1, 11, 21, 31 순 10 개씩
		int startPage =  (((currentPage - 1) / PAGE_WIDTH) * PAGE_WIDTH) + 1 ;
		
		
		// LoggerMaster.debug("ListAction", "This startPage Is : " + startPage);
		
		// 종료 페이지
		// totalCount == 64 => totalPage = 7
		// startPage = 1 : endPage = 7
		
		int endPage = (((int)(startPage / PAGE_SIZE)) + 1) * 10;
		
		// LoggerMaster.debug("ListAction", "This CurrentPage Is : " + currentPage);
		
		BoardDAO dao = new BoardDAO();
		
		int totalCount = dao.getTotalCount();
		
		if(totalCount == -1)
		{
			LoggerMaster.error("ListAction", "No Connected DB");
		}
		else
		{
			totalPage = (int)(totalCount / PAGE_SIZE) + ((totalCount % PAGE_SIZE) > 0 ? 1 : 0 ); 
	        
	        if( endPage >= totalPage ) {
	            endPage = totalPage;
	        } 
			
	        // LoggerMaster.debug("ListAction", "This EndPage Is : " + endPage);
			
			ArrayList<BoardBean> boardList = dao.selectBoardListAll();
			
			// LoggerMaster.debug("totalCount : " + totalCount, "getTotalCount");
			
			req.setAttribute("boardList", boardList);
			req.setAttribute("totalCount", totalCount);
			req.setAttribute("current_Page", currentPage);
		}
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}
