package com.wipro.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wipro.Provider.Provider;
import com.wipro.bean.Instructions;

public class InstructionsDao {

public static boolean addInstructions(Instructions ins) {
		
		Connection con = null;
		boolean status = false;
		try {
			
			con = Provider.getCon();
			String qry = "insert into instructions value(?)";
			PreparedStatement pst = con.prepareCall(qry);
			pst.setString(1, ins.getInstruction() );
			int count = pst.executeUpdate();
			if(count > 0) {
				status = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
	public static ArrayList<Instructions> getAllRecords()
	{
        ArrayList<Instructions>  samp =new ArrayList<Instructions>();
		try
		{
			
		   samp.clear();
		   Connection con = Provider.getCon();
		   String sql = "select * from instructions";
		   PreparedStatement pst = con.prepareStatement(sql);
		   
		   ResultSet rs = pst.executeQuery(sql);
		   while(rs.next())
		   {
			  String ins = rs.getString("instruction");
			 samp.add(new Instructions(ins));
			  
			   
		   }
		  

		}
		catch(Exception e2)
		{
			e2.printStackTrace();
		}
		return samp;
	}
	public static int deleteRecord(Instructions ist) {
		// TODO Auto-generated method stub
	int val = 0;
		try
		{
		
		Connection con = Provider.getCon();
		String sql = "delete from instructions where instruction=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,ist.getInstruction());

	    val = pst.executeUpdate();
	
	
	    }
		catch(Exception e)
		{
			val = -1;
		}
		return val;
	}
	public static int doUpdateNowRecord(String instaoriginal,String instamodified)
	{
		int status = 0;
		try
		{
		
		Connection con = Provider.getCon();
		String sql = "update instructions set instruction=? where instruction=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,instamodified);
		pst.setString(2, instaoriginal);
	
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
