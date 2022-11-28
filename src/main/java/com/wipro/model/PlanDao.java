package com.wipro.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.wipro.Provider.Provider;
import com.wipro.bean.Plan;

public class PlanDao {


	public static boolean insert(Plan p) {
		
		Connection con = null;
		boolean status = false;
		
		try {
			con = Provider.getCon();
			
			PreparedStatement pst = con.prepareStatement("insert into plans values(?,?,?)");
			pst.setString(1, p.getAccount());
			pst.setString(2, p.getBank());
			pst.setString(3, p.getPlan());
			
			int res = pst.executeUpdate();
			
			if(res > 0) {
				status = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
