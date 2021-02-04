<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String u_id = null;
	String u_pw = null;
	
	u_id = (String)session.getAttribute("u_id");
	u_pw = (String)request.getParameter("pw");
	
	if(u_pw.equals(""))
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('새 비밀번호가 입력되지 않았습니다. ');");
		script.println("history.back()");
		script.println("</script>");
	}else
	{
	

		UserDAO userDAO = new UserDAO();
		userDAO.u_change(u_id, u_pw);
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 변경되었습니다.다시 로그인해주세요');");
		script.println("location.href='../startpage/Firstpage.jsp';");
		script.println("</script>");
		
	}
%>