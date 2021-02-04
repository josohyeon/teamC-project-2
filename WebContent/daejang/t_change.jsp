<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String c_id = null;
	
	c_id = (String)request.getParameter("c_id");
%>
<form id="frm" name = "frm" method="post" action="t_changeOK.jsp?c_id=<%= c_id %>">
	새 비밀번호 : <input type ="password" id="pw" name="pw">
	<input type="submit" value="확인">
</form>