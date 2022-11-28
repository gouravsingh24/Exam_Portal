package com.wipro.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.wipro.Provider.Provider;
import com.wipro.bean.Register;

public class RegisterDao {


	public static boolean register(Register reg) {
		
		boolean status = false;
		Connection con = null;
		try {
			con = Provider.getCon();
			String qry = "insert into registration(username,email,password,phone,address,type) values(?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(qry);
			pst.setString(1, reg.getName());
			pst.setString(2, reg.getEmail());
			pst.setString(3, reg.getPassword());
			pst.setString(4, reg.getPhone());
			pst.setString(5, reg.getAddress());
			pst.setString(6, reg.getUserType());
			int count = pst.executeUpdate();
			if(count > 0) {
				status = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
