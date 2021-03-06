<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> <!-- 첨부파일 -->
<%@ page import="com.oreilly.servlet.MultipartRequest"%> <!-- 첨부파일 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> <!-- 첨부파일 -->
<%@ page import="trainer.TrainerProfilDAO" %>
<%@ page import="teamC.VO" %>
<% 
request.setCharacterEncoding("UTF-8"); //한글 입력 가능.
String saveFolder      = "D:/jsh/Team2/WebContent/profilimage"; //프로젝터 WebContent 하위 폴더명
String encoding        = "UTF-8";
int maxSize            = 10*1024*1024; //10mb
VO vo = new VO();
String u_id = null;
if(session.getAttribute("u_id") != null) {
	u_id = (String) session.getAttribute("u_id");
}
try
{ 
	//파일이 서버에 업로드되는 시점
	MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encoding, new DefaultFileRenamePolicy());
	String t_id    = u_id;	//트레이너 아이디
	String major   = (String)multi.getParameter("major");	//트레이너 전문분야
	String addr1   = (String)multi.getParameter("addr1");	//트레이너 근무지
	String addr2   = (String)multi.getParameter("addr2");
	String nick    = (String)multi.getParameter("nick");	//트레이너 닉네임
	String etc     = (String)multi.getParameter("etc");		//트레이너 자기소개
	String fileP   = multi.getFilesystemName("fileUp");		//중복되는 이름이 있을경우 index가 붙는 파일 이름
	String originP = multi.getOriginalFileName("fileUp");	//index가 붙기 전의 원래 이름.
	String cost1   = (String)multi.getParameter("cost1");	//트레이너 PT 가격
	String cost2   = (String)multi.getParameter("cost2");
	String cost3   = (String)multi.getParameter("cost3");
	
	vo.setT_id(t_id);
	vo.setT_major(major);
	vo.setT_addr1(addr1);
	vo.setT_addr2(addr2);
	vo.setT_nick(nick);
	vo.setT_etc(etc);
	vo.setT_realP(fileP);
	vo.setT_originP(originP);
	vo.setT_cost1(cost1);
	vo.setT_cost2(cost2);
	vo.setT_cost3(cost3);

	TrainerProfilDAO dao = new TrainerProfilDAO();
	
	int result = dao.tProfilUpdateDAO(vo);
	//System.out.println("test::"+result);	
}catch(Exception e)
{
	out.println("ERROR : " + e.getMessage());
} finally{
	response.sendRedirect("T-Mypage.jsp");
}
%>