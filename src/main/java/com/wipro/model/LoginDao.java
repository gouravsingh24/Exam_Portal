package com.wipro.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.wipro.Provider.Provider;
import com.wipro.bean.Login;

public class LoginDao {

public static boolean Validate(Login login) {
		
		boolean status = false;
		Connection con = null;
		try {
			
			con = Provider.getCon();
			String qry = "select * from registration where username = ? and password = ?";
			PreparedStatement pst = con.prepareStatement(qry);
			pst.setString(1, login.getName());
			pst.setString(2, login.getPass());
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				status = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
}
