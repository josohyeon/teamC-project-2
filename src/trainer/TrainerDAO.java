package trainer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import teamC.DBM;
import teamC.VO;
import util.Utility;

public class TrainerDAO 
{
	Connection        conn;
	PreparedStatement pstmt;
	ResultSet         rs;	

	
	public int login(String t_id,String t_pw)
	{
		String sql = "select t_pw from trainer where t_id = ?";
		
		System.out.println(sql);
		
		DBM dbm = new DBM();
		dbm.DBOpen();
		conn = dbm.getConn();
		try
		{
			//dbm.OpenQuery(sql)
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				if(rs.getString("t_pw").equals(Utility.encoding(t_pw)))
					return 1;//로그인 성공
				else
					return 0;//비밀번호 틀림
			}
			rs.close();
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
		sql += "insert into trainer ";
		sql += "(t_id,t_nick,t_pw,t_email,t_phone, t_joindate, t_major, t_addr1, t_addr2, t_state) ";
		sql = sql + "values ";
		sql = sql + "(?,?,?,?,?,NOW(),?,?,?,'Y') ";
	
		System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		conn = dbm.getConn();
		
		try
		{
			String pw = Utility.encoding(vo.getT_pw());
			//dbm.Excute(sql)
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getT_id());
			pstmt.setString(2, vo.getT_nick());
			pstmt.setString(3, pw);
			pstmt.setString(4, vo.getT_email());
			pstmt.setString(5, vo.getT_phone());
			pstmt.setString(6, vo.getT_major());
			pstmt.setString(7, vo.getT_addr1());
			pstmt.setString(8, vo.getT_addr2());					
			return pstmt.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		dbm.DBClose();
		return -1;//회원가입 실패
		
	}
	
	public int findno(String u_id)
	{
		String sql = "select t_no from trainer where t_id = '" + u_id + "'";
		
		System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.OpenQuery(sql);
		int a = 0;
		if(dbm.ResultNext())
		{
			a = dbm.getInt("t_no");
		}
		dbm.CloseQuery();
		dbm.DBClose();
		return a;
	}
	
	public String findid(String t_nick, String t_email)
	{
		t_nick = t_nick.replaceAll("'","''");
		t_email = t_email.replaceAll("'","''");
		
		String sql = "select t_id from trainer where t_nick = '" + t_nick + "' and t_email = '" + t_email + "'";
		
		System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.OpenQuery(sql);
		String a ="";
		if(dbm.ResultNext())
		{
			a = dbm.getString("t_id");
		}
		dbm.CloseQuery();
		dbm.DBClose();
		return a;
		
	}
	
	public String outcheck(String u_id)
	{
		String sql = "select t_state from trainer where t_id = '" + u_id + "'";
		
		System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.OpenQuery(sql);
		String a ="";
		if(dbm.ResultNext())
		{
			a = dbm.getString("t_state");
		}
		dbm.CloseQuery();
		dbm.DBClose();
		return a;
	}
	
	public void u_out(String u_id)
	{
		String sql = "";  
		sql += "update trainer set t_state = 'N' where t_id = '" + u_id + "'" ;
	
		System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.Excute(sql);
		dbm.DBClose();
	}
	
	public void u_change(String u_id, String u_pw)
	{
		String sql = "";  
		sql += "update trainer set t_pw = '" + Utility.encoding(Utility.encoding(u_pw)) + "' where t_id = '" + u_id + "'" ;
	
		System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.Excute(sql);
		dbm.DBClose();
	}
	
	
}

