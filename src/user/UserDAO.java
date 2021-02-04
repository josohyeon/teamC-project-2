package user;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import teamC.DBM;
import teamC.VO;
import util.Utility;

public class UserDAO 
{
	Connection        conn;
	PreparedStatement pstmt;
	ResultSet         rs;	

	
	public int login(String u_id,String u_pw)
	{
		String sql = "select u_pw from user where u_id = ?";
		
		//System.out.println(sql);
		//System.out.println(u_pw);
		
		DBM dbm = new DBM();
		dbm.DBOpen();
		conn = dbm.getConn();
		try
		{
			//dbm.OpenQuery(sql)
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				if(rs.getString("u_pw").equals(Utility.encoding(u_pw)))
					return 1;//로그인 성공
				else
					return 0;//비밀번호 틀림
			}
			return -1;//아이디 없음
			
		}catch(Exception e)
		{
			e.printStackTrace();
			
		}
		dbm.DBClose();
		return -2;//데이터베이스 오류
	}
	
	public int join(VO vo)
	{
		String sql = "";  
		sql += "insert into user ";
		sql += "(u_id,u_nick,u_pw,u_email,u_phone, u_joindate, u_gender, u_check, u_state) ";
		sql = sql + "values ";
		sql = sql + "(?,?,?,?,?,NOW(),?,?,'Y') ";
	
		//System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		conn = dbm.getConn();
		
		try
		{
			String pw = Utility.encoding(vo.getU_pw());
			//dbm.Excute(sql)
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getU_id());
			pstmt.setString(2, vo.getU_nick());
			pstmt.setString(3, pw);
			pstmt.setString(4, vo.getU_email());
			pstmt.setString(5, vo.getU_phone());
			pstmt.setString(6, vo.getU_gender());
			pstmt.setString(7, vo.getU_check());
			return pstmt.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		dbm.DBClose();
		return -1;//회원가입 실패
		
	}
	
	public String daejang(String u_id)
	{
		String sql = "select u_check from user where u_id = '" + u_id + "'";
		
		//System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.OpenQuery(sql);
		String a ="";
		if(dbm.ResultNext())
		{
			a = dbm.getString("u_check");
		}
		dbm.CloseQuery();
		dbm.DBClose();
		return a;
	}
	
	public String outcheck(String u_id)
	{
		String sql = "select u_state from user where u_id = '" + u_id + "'";
		
		//System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.OpenQuery(sql);
		String a ="";
		if(dbm.ResultNext())
		{
			a = dbm.getString("u_state");
		}
		dbm.CloseQuery();
		dbm.DBClose();
		return a;
	}
	
	public String findid(String u_nick, String u_email)
	{
		u_nick = u_nick.replaceAll("'","''");
		u_email = u_email.replaceAll("'","''");
		
		String sql = "select u_id from user where u_nick = '" + u_nick + "' and u_email = '" + u_email + "'";
		
		//System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.OpenQuery(sql);
		String a ="";
		if(dbm.ResultNext())
		{
			a = dbm.getString("u_id");
		}
		dbm.CloseQuery();
		dbm.DBClose();
		return a;
		
	}
	
	public void u_out(String u_id)
	{
		String sql = "";  
		sql += "update user set u_state = 'N' where u_id = '" + u_id + "'" ;
	
		//System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.Excute(sql);
		dbm.DBClose();
	}
	
	public void u_change(String u_id, String u_pw)
	{
		String sql = "";  
		sql += "update user set u_pw = '" + Utility.encoding(Utility.encoding(u_pw)) + "' where u_id = '" + u_id + "'" ;
	
		//System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.Excute(sql);
		dbm.DBClose();
	}
	
}
