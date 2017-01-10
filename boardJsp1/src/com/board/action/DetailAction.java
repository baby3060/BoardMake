package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.LoggerMaster;
import com.common.action.ActionForward;
import com.common.action.MyAction;

public class DetailAction implements MyAction {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		// 로그인한 유저와 작성 유저가 같을 경우 수정 및 삭제 가능.
		// 로그인한 유저가 아닐 경우 수정 및 삭제 가능하지 않음.
		
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
