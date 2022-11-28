package com.wipro.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wipro.Provider.Provider;
import com.wipro.bean.AdminUser;

public class AdminUserDao {

	private static final String select_user_by_id = "select username from registration where username = ?";
	private static final String select_all_users = "select * from registration";
	private static final String delete_users = "delete from registration where username = ?";
	private static final String update_user = "update registration set username = ? , email = ?, password = ?, phone = ?, address = ?, type = ? where username = ?";

	// select user by id
	public static String getStudentName(String username) {

		String name = null;
		Connection con = null;

		try {

			con = Provider.getCon();

			PreparedStatement pst = con.prepareStatement(select_user_by_id);
			pst.setString(1, username);

			ResultSet rs = pst.executeQuery();

			if(rs.next()) {

				name = rs.getString(1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	// select users
	public static ArrayList<AdminUser> selectAllUsers() {

		ArrayList<AdminUser> user = new ArrayList<AdminUser>();

		Connection con = null;

		try {

			con = Provider.getCon();

			PreparedStatement pst = con.prepareStatement(select_all_users);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("Id");
				String name = rs.getString("username");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String type = rs.getString("type");
				user.add(new AdminUser(name, email, password, phone, address, type));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	// delete user
	public static int deleteRecord(AdminUser user) {
		
		int status = 0;
		Connection con = null;
		
		try {
			con = Provider.getCon();
			PreparedStatement pst = con.prepareStatement(delete_users);
			pst.setString(1, user.getName());
			int val = pst.executeUpdate();
			if(val > 0)
			{
				status = 1;
			}
			else
			{
				status = 0;
			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return status;
		
	}
	// update user
	public static int updateUser(String originalusername,String newuserid,String newEmail,String newpassword,String newphone,String address, String type) {

		int status = 0;
		Connection con = null;
		try {

			con = Provider.getCon();

			PreparedStatement pst = con.prepareStatement(update_user);
			
			pst.setString(1, newuserid);
			pst.setString(2, newEmail);
			pst.setString(3, newpassword);
			pst.setString(4, newphone);
			pst.setString(5, address);
			pst.setString(6, type);
			pst.setString(7, originalusername);

			int val = pst.executeUpdate();
			if(val > 0)
			{
				status = 1;
			}
			else
			{
				status = -1;
			}
			}
			catch(Exception f)
			{
				status = 2;
				f.printStackTrace();
			}
			
		return status;
	}
}
