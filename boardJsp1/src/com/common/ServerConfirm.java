package com.common;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServerConfirm implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		LoggerMaster.debug(ServerConfirm.class.getName(), "서버 종료");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		LoggerMaster.debug(ServerConfirm.class.getName(), "서버 시작");
	}

}
