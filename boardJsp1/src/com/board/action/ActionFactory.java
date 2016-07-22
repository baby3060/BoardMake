package com.board.action;

public class ActionFactory {
	public MyAction getAction(String cmd) {
		MyAction action = null;
		
		if( cmd.equals("/boardList.bo") ) {
			action = new ListAction();
		} else if(cmd.equals("/boardAdd.bo")) {
			action = new AddAction();
		} else if(cmd.equals("/boardDetail.bo")) {
			action = new DetailAction();
		} 
		
		return action;
	}
}
