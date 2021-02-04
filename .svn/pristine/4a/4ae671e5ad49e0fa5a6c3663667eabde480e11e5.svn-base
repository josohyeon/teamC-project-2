<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String u_nick = null;
	String u_email = null;
	
	u_nick = (String)request.getParameter("u_nick");
	u_email = (String)request.getParameter("u_email");
	
	UserDAO userDAO = new UserDAO();
	String u_id  = userDAO.findid(u_nick,u_email);
	out.print(u_id);
%>
