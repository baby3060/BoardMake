package com.common;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConn {
	private Connection conn;
	
	private String url;
	private String userId;
	private String userPass;
	
	private void setUrl(String url) {
		this.url = url;
	}
	
	private void setUserId(String userId) {
		this.userId = userId;
	}
	
	private void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	
	public DBConn() {
		setValues();
	}
	
	// url, userId, userPass 값 할당
	private void setValues() {
		Properties prop = new Properties();
		InputStream in = getClass().getResourceAsStream("common.properties");
		try {
			prop.load(in);
			setUrl(prop.getProperty("db.url"));
			setUserId(prop.getProperty("db.user"));
			setUserPass(prop.getProperty("db.pass"));
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			
			try {
				in.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public Connection getConn() {
		try {
			if( this.conn == null || conn.isClosed() ) {
				if(this.url.equals("")) {
					setValues();
				}
				try {
					Class.forName("com.mysql.jdbc.Driver");
					
					this.conn = DriverManager.getConnection(this.url, this.userId, this.userPass);
					
					// Autocommit False
					this.conn.setAutoCommit(false);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		} catch(SQLException sqlE) {
			LoggerMaster.error("DBConn.getConn()", "Mysql 서비스 실행 안 되어 있음.");
			return null;
		}
		return this.conn;
	}
	
	
}