<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="teamC.DBM" %>
<% 
String t_nick = request.getParameter("u_nick");

	DBM dbm = new DBM();
	 try 
	 {
		String sql = "select*from trainer where t_nick= \'"+ t_nick +"\'";
		System.out.println(sql);		
		dbm.DBOpen();
		dbm.OpenQuery(sql);
		
		
		if(dbm.ResultNext()||t_nick.equals("")) 
		{
			out.print(0); // true 이미 존재하는 아이디
		}
		else 
		{
			out.print(1); // false  사용가능한 아이디 
		}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally  // 어떻게든 실행이 되는 구문
		{
			/* 
			try 
			{
				if(rs!= null)rs.close();
				if(psmt!=null)psmt.close();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			conn.close(); 
			*/
			dbm.CloseQuery();
			dbm.DBClose();
		}
		
	
%>