package com.common;


import org.apache.log4j.Logger;

public class LoggerMaster {
	public static void debug(String category, String message) {
		Logger.getLogger(category).debug(message);
	}
	
	public static void info(String category, String message) {
		Logger.getLogger(category).info(message);
	}
	
	public static void trace(String category, String message) {
		Logger.getLogger(category).trace(message);
	}
	
	public static void error(String category, String message) {
		Logger.getLogger(category).error(message);
	}
	
	
	public static void fatal(String category, String message) {
		Logger.getLogger(category).fatal(message);
	}
	
	
	public static void warn(String category, String message) {
		Logger.getLogger(category).warn(message);
	}
	
}
