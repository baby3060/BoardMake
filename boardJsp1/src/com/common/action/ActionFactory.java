package com.common.action;

import com.board.action.*;
import com.user.action.*;

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
		} else if( cmd.equals("/userLoginProc.uo") ) {
			action = new LoginActionProc(); 
		} else if( cmd.equals("/userJoin.uo") ) {
			action = new JoinAction(); 
		} 
		
		return action;
	}
}
