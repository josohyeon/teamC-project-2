<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="teamC.VO" %>
<%@ page import="trainer.TrainerProfilDAO" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="../style/TModifypage.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<title>TRAINER MYPAGE</title>
<style>

</style>
</head>
<script src="../js/jquery-3.5.1.min.js"></script>	
<script>

	function selfout()
	{
		var selfout = confirm('회원을 탈퇴하시겠습니까?');
		if(selfout == true){
			location.href="T-selfout.jsp";
		}
	}
	
	function pwcheck()
	{
           if(document.getElementById('pw').value.length < 6 || document.getElementById('pw').value.length> 16)
           {
           	alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
           	$('#pw').focus();
          		
           }
           
 	//2.특수문자 사용 ===============================================================            
		var sc = ["!","@","#","$","%","^","&","+","="];
		var check_sc= 0;
           
			for(var i=0;i<sc.length;i++)
            {
           	 	if(document.getElementById('pw').value.indexOf(sc[i]) != -1)// indexof: 배열 안의 내용이 없다면 -1을 반환
             	{
             		check_sc = 1;// 특수문자가  있는 경우
            	}
            }
          
           if(check_sc == 0 )//특수문자가 없는 경우
           {
           	alert('!,@,#,$,%,^,&,+,= 등의 특수문자가 들어가 있지 않습니다.');
           	$('#pw').focus();
           	
           }
         
	}          
</script>
<body>
<%
	String u_id = null;
	if(session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");
	}
	if(u_id == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('잘못된 접근입니다!!');");
		script.println("location.href = '../startpage/Firstpage.jsp'");
		script.println("</script>");
		script.close();	
	}
%>	
	<!-- 상단 로그아웃 버튼 -->
	<div id="first">
		<button type="button" class="btn btn-dark" onclick="location.href='../u-login/U-Logout.jsp'">LOGOUT</button>
	</div>	
	
	<!-- 상단 로고 -->
	<div>
		<img src="../images/TLOGO.png" style="width:110px; height:70px; position:absolute; top:0; cursor: pointer;" onclick="location.href='../t-mainpage/T-Mainpage.jsp'">
	</div>
	
	<!-- 상단 메뉴바 -->
	<div class="contents">
		<ul>
			<li>
				<a href="../t-manegement/T-Record.jsp">회원관리</a>
			</li>
			<li>
				<a href="../t-mypage/T-Mypage.jsp">내 PT프로필</a>
			</li>
			<li>
				<a href="../t-mypage/T-Modify.jsp">내 정보</a>
			</li>
		</ul>
	</div>
	<%
	// 트레이너 Profil 불러오는 부분
	
	TrainerProfilDAO dao = new TrainerProfilDAO();
	
	//out.print("test::"+u_id);
	
	VO vo = dao.tProfil2DAO(u_id);
	
	String I = vo.getT_id();    // 트레이너 아이디
	String N = vo.getT_nick();  // 트레이너 닉네임
	String P = vo.getT_phone(); // 트레이너 전화번호
	String E = vo.getT_email(); // 트레이너 이메일
	
	%>
	<!-- 정보가 보이는 부분 -->
	<div class="info">
		<table style="width:700px; height:700px; text-align:left; margin: auto; font-size:20px;">
			<tr style="height:80px;"> 
				<th>아이디</th>
				<td><%= I %></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr style="height:2px;"/>
				</td>
			</tr>
			<tr style="height:80px;">
				<th>닉네임</th>
				<td><%= N %></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr style="height:2px;"/>
				</td>
			</tr>
			<tr style="height:80px;">
				<th>비밀번호</th>
				<td>*******</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr style="height:2px;"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호 변경</th>
				<td>
					<form id="frm" name="frm" method="post" action="T-selfchangepw.jsp">
						<input type="password" id="pw" name="pw" onblur="pwcheck()" >
						<input type="submit" class="btn btn-primary" value="변경">
					</form>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr style="height:2px;"/>
				</td>
			</tr>
			<tr style="height:80px;">
				<th>휴대폰 번호</th>
				<td id="phone"><%= P %></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr style="height:2px;"/>
				</td>
			</tr>
			<tr style="height:80px;">
				<th>이메일</th>
				<td id="email"><%= E %></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr style="height:2px;"/>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn btn-primary" onclick="location.href='T-ModifyUpdate.jsp'" value="수정">
				</td>
				<td>
					<button type="button" class="btn btn-danger" onclick="selfout()">회원탈퇴</button>
				</td>
			</tr>
		</table>
	</div>
	</body>
</html>