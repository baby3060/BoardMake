package com.user.action;

import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class LoginManager implements HttpSessionBindingListener {
	
	// 하나의 Instance만을 생성 -> SingleTon
	private static LoginManager loginManager = null;
	
	private static Hashtable<String, String> loginUsers = new Hashtable<String, String>();
	
	private LoginManager() {
		super();
	}
	
	public static synchronized LoginManager getInstance() {
		if( loginManager == null ) {
			loginManager = new LoginManager();
		}
		return loginManager;
	}
	
	
	public void setSession(HttpSession session, String userID) {
		loginUsers.put(session.getId(), userID);
		session.setAttribute("UserID", userID);
		session.setAttribute("login", getInstance());
	}
	
	
	// 같은 아이디로 등록되어있는 세션 제거
	public void eqUsingSRemove( HttpSession session, String userID ) {
		String sessionId = "";
		
		Set set = loginUsers.entrySet();
		
		System.out.println(set);
	}
	
	
	public boolean isUsing(String usrId) {
		boolean isUsing = false;
		Enumeration<String> e = loginUsers.keys();
		String key = "";
		
		while(e.hasMoreElements()) {
			key = e.nextElement();
			if(usrId.equals(key)) {
				isUsing = true;
				break;
			}
		}
		return isUsing;
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub

	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		loginUsers.remove(event.getSession().getId());
	}

}
