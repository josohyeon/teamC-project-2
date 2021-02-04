<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "trainer.TrainerDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String t_nick = null;
	String t_email = null;
	
	t_nick = (String)request.getParameter("t_nick");
	t_email = (String)request.getParameter("t_email");
	
	TrainerDAO trainerDAO = new TrainerDAO();
	String t_id  = trainerDAO.findid(t_nick,t_email);
	out.print(t_id);
%>
