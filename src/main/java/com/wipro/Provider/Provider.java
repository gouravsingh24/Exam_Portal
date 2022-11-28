package com.wipro.Provider;

import java.sql.Connection;
import java.sql.DriverManager;

public class Provider {

	public static Connection getCon() {

		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/exam";
		String userId = "root";
		String password = "root";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Class Loaded");
			con = DriverManager.getConnection(url, userId, password);
			System.out.println("Connection Established");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
