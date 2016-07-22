package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.LoggerMaster;

public class DetailAction implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		LoggerMaster.debug("DetailAction", "detail");
		
		String boardNum_str = req.getParameter("board_num");
		if( boardNum_str == null || boardNum_str.equals("")) {
			
		} else { 
			// Board Hit Count Update
			
			// getBoardRec
		}
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}
