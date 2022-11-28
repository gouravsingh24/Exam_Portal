package com.wipro.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wipro.Provider.Provider;
import com.wipro.bean.Question;

public class QuestionDao {

	public static boolean question(Question que) {

		boolean status = false;
		Connection con = null;
		try {
			con = Provider.getCon();
			String qry = "insert into questions(question,A,B,C,D,answer) values(?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(qry);
			
			pst.setString(1, que.getQuestion());
			pst.setString(2, que.getA());
			pst.setString(3, que.getB());
			pst.setString(4, que.getC());
			pst.setString(5, que.getD());
			pst.setString(6, que.getAns());
			
			int count = pst.executeUpdate();
			if (count > 0) {
				status = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static ArrayList<Question> getAllRecords()
	{
        ArrayList<Question>  samp =new ArrayList<Question>();
		try
		{
			
		   samp.clear();
		   Connection con = Provider.getCon();
		   String sql = "select * from questions";
		   PreparedStatement pst = con.prepareStatement(sql);
		   
		   ResultSet rs = pst.executeQuery(sql);
		   while(rs.next())
		   {
			  Question s = new Question();
			  s.setQuestion(rs.getString("question"));
			  s.setA(rs.getString("A"));
			  s.setB(rs.getString("B"));
			  s.setC(rs.getString("C"));
			  s.setD(rs.getString("D"));
			  s.setAns(rs.getString("answer"));
			   samp.add(s);
			 
			  
			   
		   }
		  

		}
		catch(Exception e2)
		{
			e2.printStackTrace();
		}
		return samp;
	}
	public static int deleteRecord(Question q)
	{
		int status = 0;
		try
		{
		
		Connection con = Provider.getCon();
		String sql = "delete from questions where question=?";
		PreparedStatement pst = con.prepareStatement(sql);
	    pst.setString(1, q.getQuestion());
	  
	    
	    int val = pst.executeUpdate();
	    if(val > 0)
	    {
	    	status =1;
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
	public static int doUpdateNowRecord(String OriginalQuestion,String newQuestion,String opta,String optb,String optc,String optd,String ans)
	{
		int status = 0;
		try
		{
		
		Connection con = Provider.getCon();
		String sql = "update questions set question=?,A=?,B=?,C=?,D=?,answer=? where question=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,newQuestion);
		pst.setString(2, opta);
		pst.setString(3, optb);
		pst.setString(4, optc);
		pst.setString(5, optd);
		pst.setString(6, ans);
		pst.setString(7, OriginalQuestion);
	
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
