<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "trainer.TrainerDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String c_id = null;
	
	c_id = (String)request.getParameter("c_id");
	TrainerDAO userDAO = new TrainerDAO();
	userDAO.u_out(c_id);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('탈퇴처리되었습니다.새로고침 해주세요');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
%>
