<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.Utility" %>
<%@ page import="teamC.DBM" %>
<%@ page import="teamC.VO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="trainer.TrainerDAO"%>
<%
	//비정상 요청에 대한 처리 -> 페이지 이동
	if(request.getMethod().equals("GET"))
	{
		response.sendRedirect("U-Join.jsp");
		return;
	}
	
	//입력데이터에 대한 인코딩 방식 변경 -> 한글 입력 데이터 처리
	request.setCharacterEncoding("UTF-8");
	
	//입력데이터를 반환받아 저장
	String u_id = null;
	String u_nick = null;
	String u_pw = null;
	String u_email = null;
	String u_phone = null;
	String u_gender = null;
	String u_check = null;
	String t_major = null;
	String t_addr1 = null;
	String t_addr2 = null;
	
	u_id   = (String)request.getParameter("u_id");
	u_nick = (String)request.getParameter("u_nick");
	u_pw   = (String)request.getParameter("u_pw");
	u_email = (String)request.getParameter("u_email");
	u_phone = (String)request.getParameter("u_phone");
	u_gender = (String)request.getParameter("u_gender");
	u_check = (String)request.getParameter("u_check");
	
	if(u_pw != null)
	{	u_pw = Utility.encoding(u_pw);}
	if(request.getParameter("t_major")!=null)
	{ 	t_major = (String)request.getParameter("t_major");}
	if(request.getParameter("t_addr1")!=null)
	{ 	t_addr1 = (String)request.getParameter("t_addr1");}
	if(request.getParameter("t_addr2")!=null)
	{ 	t_addr2 = (String)request.getParameter("t_addr2");}
	
	//u_joindate 
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date now = new Date();
	String u_joindate = format1.format(now);
	
	int result = -1;
	if(u_check.equals("U"))
	{
		UserDAO userDAO = new UserDAO();
		result = userDAO.join(new VO(u_id,u_nick,u_pw,
				u_email,u_phone,u_joindate,u_gender,u_check,'Y'));
		
	}else if(u_check.equals("T"))
	{
		TrainerDAO trainerDAO = new TrainerDAO();
		result = trainerDAO.join(new VO(u_id,u_nick,u_pw,
				u_email,u_phone,u_joindate,t_major,t_addr1,t_addr2,'Y'));
	}
	
	
		if(result == -1)
		{ 	
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}else
		{
			session.setAttribute("u_id",u_id);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('가입에 성공하셨습니다.');");
			script.println("location.href = '../startpage/Firstpage.jsp';");
			script.println("</script>");
			script.close();
		} 
		 
		
	
	
%>