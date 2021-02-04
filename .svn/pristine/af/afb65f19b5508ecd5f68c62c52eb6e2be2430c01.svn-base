<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "trainer.TrainerDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String c_id = null;
	String u_pw = null;
	
	c_id = (String)request.getParameter("c_id");
	u_pw = (String)request.getParameter("pw");
	

		TrainerDAO userDAO = new TrainerDAO();
		userDAO.u_change(c_id, u_pw);
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 변경되었습니다');");
		script.println("location.href='../daejang/TDaejang.jsp';");
		script.println("</script>");
%>