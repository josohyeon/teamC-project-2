package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import teamC.DBM;
import teamC.VO;

public class UserInfoDAO {
	Connection        conn;
	PreparedStatement pstmt;
	ResultSet         rs;
	
	public VO uInfoDAO(String u_id) 
	{
		String sql = "select u_no,u_id,u_nick,u_pw,u_phone,u_email from user where u_id = ?";
		
		DBM dbm = new DBM();
		dbm.DBOpen();
		conn    = dbm.getConn();
		VO vo   = new VO();
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo.setU_id(rs.getString("u_id"));
			vo.setU_no(rs.getInt("u_no"));
			vo.setU_nick(rs.getString("u_nick"));
			vo.setU_email(rs.getString("u_email"));
			
			rs.close();
		}catch(Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			dbm.DBClose();
		}
		return vo;
	}
	
	public int tInfoUpdateDAO(VO vo) 
	{
		String sql  = "update user set ";
			   sql += "u_phone = '?', ";
			   sql += "u_email = '?'";
			   
		DBM dbm = new DBM();
		dbm.DBOpen();
		conn = dbm.getConn();
		try 
		{	
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getU_phone());
			pstmt.setString(2, vo.getU_email());
			return pstmt.executeUpdate();
			
		}catch(Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			dbm.DBOpen();
		}
		return 1;
	}
}
