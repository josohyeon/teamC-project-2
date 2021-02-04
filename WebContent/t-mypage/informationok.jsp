<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trainer.TrainerInfoDAO" %>
<%@ page import="teamC.VO" %>
<%
request.setCharacterEncoding("UTF-8"); //한글 입력 가능.

VO vo = new VO();

try
{	
	String t_id    = request.getParameter("t_id");     //트레이너 아이디
	String t_pw    = request.getParameter("pw");       //트레이너 비밀번호
	String t_phone = request.getParameter("phonenum"); //트레이너 휴대폰번호
	String t_email = request.getParameter("temail");   //트레이너 이메일

	vo.setT_id(t_id);
	vo.setT_pw(t_pw);
	vo.setT_phone(t_phone);
	vo.setT_email(t_email);
	
	TrainerInfoDAO dao = new TrainerInfoDAO();
	
	int result = dao.tInfoUpdateDAO(vo);
	//out.print("test::"+result);
}catch(Exception e)
{
	out.println("ERROR : " + e.getMessage());
}finally
{
	response.sendRedirect("T-Modify.jsp");
}
%>