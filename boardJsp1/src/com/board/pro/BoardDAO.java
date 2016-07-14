package com.board.pro;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	// No Parameter : All Data
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
	
	// All Data
	public ArrayList<BoardBean> selectBoardListAll() {
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		
		StringBuffer query = new StringBuffer();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			query.append(" Select board_num, board_title, board_gubun ");
			query.append("      , board_pnum, board_contn, board_htcnt ");
			query.append("      , board_usrid, board_cdate, board_mdate ");
			query.append("      , board_priva, board_prpwd, board_ctcnt ");
			query.append("      , board_rpcnt ");
			query.append(" From BOARD ");
			query.append(" Where board_num < ? ");
			
			pstmt = manager.getConn().prepareStatement(query.toString());
			pstmt.setInt(1, 100);
			manager.setPstmt(pstmt);
			
			rs = pstmt.executeQuery();
			manager.setRs(rs);
			
			BoardBean boardBean = null;
			
			while(rs.next()) {
				boardBean = new BoardBean();
					boardBean.setBoard_num(rs.getInt("board_num"));
					boardBean.setBoard_title(rs.getString("board_title"));
					boardBean.setBoard_gubun(rs.getString("board_gubun"));
					boardBean.setBoard_pnum(rs.getInt("board_pnum"));
					boardBean.setBoard_contn(rs.getString("board_contn"));
					boardBean.setBoard_htcnt(rs.getInt("board_htcnt"));
					boardBean.setBoard_usrid(rs.getString("board_usrid"));
					boardBean.setBoard_cdate(rs.getString("board_cdate"));
					boardBean.setBoard_mdate(rs.getString("board_mdate"));
					boardBean.setBoard_priva(rs.getString("board_priva"));
					boardBean.setBoard_prpwd(rs.getString("board_prpwd"));
					boardBean.setBoard_ctcnt(rs.getInt("board_ctcnt"));
					boardBean.setBoard_rpcnt(rs.getInt("board_rpcnt"));
				boardList.add(boardBean);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			query.setLength(0);
			manager.Release();
		}
		
		
		return boardList;
	}
}