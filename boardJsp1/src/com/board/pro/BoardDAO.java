package com.board.pro;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.common.DBConn;
import com.common.LoggerMaster;
import com.common.ResourceManager;

public class BoardDAO {
	
	DBConn dbConn;
	ResourceManager manager;
	
	public BoardDAO() {
		if(manager == null) {
			manager = new ResourceManager();
		}
		
		if(dbConn == null) {
			dbConn = new DBConn();
		}
		
		manager.setConn(dbConn.getConn());
	}
	
	// No Parameter
	public int getTotalCount() {
		int result = 0;
		
		String sql = "Select Count(*) As cnt From BOARD ";
		
		LoggerMaster.info("BoardDAO", "No Param getTotalCount sql Is : " + sql);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			pstmt = manager.getConn().prepareStatement(sql);
			manager.setPstmt(pstmt);
			
			rs = pstmt.executeQuery();
			manager.setRs(rs);
			
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			manager.Release();
		}
		return result;
	}
}