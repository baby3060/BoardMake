package com.common;


import org.apache.logging.log4j.LogManager;

public class LoggerMaster {
	public static void debug(String category, String message) {
		LogManager.getLogger(category).debug(message);
	}
	
	public static void info(String category, String message) {
		LogManager.getLogger(category).info(message);
	}
	
	public static void trace(String category, String message) {
		LogManager.getLogger(category).trace(message);
	}
	
	public static void error(String category, String message) {
		LogManager.getLogger(category).error(message);
	}
	
	
	public static void fatal(String category, String message) {
		LogManager.getLogger(category).fatal(message);
	}
	
	
	public static void warn(String category, String message) {
		LogManager.getLogger(category).warn(message);
	}
	
}
