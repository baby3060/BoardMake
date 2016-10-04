package com.user.pro;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.common.DBConn;
import com.common.LoggerMaster;
import com.common.ResourceManager;

public class UserDAO {
	DBConn dbConn;
	ResourceManager manager;
	
	public UserDAO() {
		if(manager == null) {
			manager = new ResourceManager();
		}
		
		if(dbConn == null) {
			dbConn = new DBConn();
		}
		
		if( dbConn.getConn() != null ) {
			manager.setConn(dbConn.getConn());
		}
	}
	
	
	public int countExUserId(String userId) {
		int count = 0;
		
		String sql = "Select Count(*) As cnt From user Where user_id = ? ";
		
		LoggerMaster.info("UserDAO", "countExUserId sql Is : " + sql);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			if( manager.getConn() == null ) {
				count = -1;
			} else {
				pstmt = manager.getConn().prepareStatement(sql);
				
				pstmt.setString(1, userId);
				
				manager.setPstmt(pstmt);
				
				rs = pstmt.executeQuery();
				manager.setRs(rs);
				
				if(rs.next()) {
					count = rs.getInt("cnt");
				}
			}
		}
		catch(Exception e) {
			LoggerMaster.error("UserDAO.countExUserId", e.toString());
		} finally {
			manager.Release();
		}
		
		return count;
	}
	
	public String getSaveDbPW(String userId) {
		String passWd = "";
		
		String sql = "Select user_pass From user Where user_id = ? ";
		
		LoggerMaster.info("UserDAO", "getSaveDbPW sql Is : " + sql);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			if( manager.getConn() == null ) {
				passWd = "";
			} else {
				pstmt = manager.getConn().prepareStatement(sql);
				
				pstmt.setString(1, userId);
				
				manager.setPstmt(pstmt);
				
				rs = pstmt.executeQuery();
				manager.setRs(rs);
				
				if(rs.next()) {
					passWd = rs.getString("user_pass");
				}
			}
		}
		catch(Exception e) {
			LoggerMaster.error("UserDAO.countExUserId", e.toString());
		} finally {
			manager.Release();
		}
		
		return passWd;
	}
	
}
