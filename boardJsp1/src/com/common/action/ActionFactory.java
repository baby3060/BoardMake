package com.common.action;

import com.board.action.AddAction;
import com.board.action.AddProcAction;
import com.board.action.DetailAction;
import com.board.action.ListAction;
import com.user.action.LoginAction;

public class ActionFactory {
	public MyAction getAction(String cmd) {
		MyAction action = null;
		
		if( cmd.equals("/boardList.bo") ) {
			action = new ListAction();
		} else if(cmd.equals("/boardAdd.bo")) {
			action = new AddAction();
		} else if(cmd.equals("/boardDetail.bo")) {
			action = new DetailAction();
		}  else if(cmd.equals("/boardAddPro.bo")) {
			action = new AddProcAction();
		} else if( cmd.equals("/userLogin.uo") ) {
			action = new LoginAction(); 
		}
		
		return action;
	}
}
