package com.board.action;

public class ActionFactory {
	public MyAction getAction(String cmd) {
		MyAction action = null;
		
		if( cmd.equals("/boardList.bo") ) {
			action = new ListAction();
		}
		
		return action;
	}
}
