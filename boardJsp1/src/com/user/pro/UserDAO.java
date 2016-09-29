package com.user.pro;

import com.common.DBConn;
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
	
	
}
