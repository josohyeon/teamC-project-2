<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String u_id = null;
	
	u_id = (String)session.getAttribute("u_id");
	UserDAO userDAO = new UserDAO();
	userDAO.u_out(u_id);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('탈퇴처리되었습니다.');");
	script.println("location.href='../startpage/Firstpage.jsp'");
	script.println("</script>");
	script.close();
%>