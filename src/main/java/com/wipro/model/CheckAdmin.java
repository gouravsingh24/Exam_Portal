package com.wipro.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.wipro.Provider.Provider;


public class CheckAdmin {

public static String checkAd(String name , String pass) {
		
		Connection con = null;
		String type = "";
		try {
			con = Provider.getCon();
			
			String qry = "select type from registration where username = ? and password = ?";
			PreparedStatement pst = con.prepareStatement(qry);
			pst.setString(1, name);
			pst.setString(2, pass);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				type = rs.getString(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return type;
	}
}
