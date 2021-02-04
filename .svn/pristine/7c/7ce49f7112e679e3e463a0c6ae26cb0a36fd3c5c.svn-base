<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="../style/Findpage.css" rel="stylesheet" type="text/css">
<link href="../style/FindDIV.css" rel="stylesheet" type="text/css">
<title>ID/PW FIND</title>
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<script src="../js/jquery-3.5.1.min.js"></script>
<script>
	//ID 찾은 결과창 ONCLICK
	function findid()
	{
		var t_nick = $("#t_nick").val();
		var t_email = $("#t_email").val();
	
		if(t_nick == "" || t_email == "")
		{
			alert("닉네임 또는 이메일이 입력되지 않았습니다.");
		
			return;
		}
		
		
		$.ajax({
			type:'post',
			url:'T-FindidOK.jsp',
			data:{"t_nick":t_nick,"t_email":t_email},
			success:function(result) // 성공적으로 수행되었으면 result로 값변환 result 정의
			{
				$(".modalhagosipda").css("visibility", "visible");
				$(".modalhagosipda").css("opacity", "1");
				$("#tdResult").html("회원님의 아이디는 " + result.trim() +"입니다.");
				$("#divResult").toggle();
				
			}
		});
		
	}
	
		function close(){
			
			$('#divResult').toggle();
			$(".modalhagosipda").css("visibility", "hidden");
			$(".modalhagosipda").css("opacity", "0");
		}
		
	//PW 찾은 결과창 ONCLICK
		function DoFindPW()
		{	
			$(".modalhagosipda2").css("visibility", "visible");
			$(".modalhagosipda2").css("opacity", "1");
			$("#tdResult2").html("비밀번호 찾기는 관리자에게 문의해주세요 <br> 관리자 홍은표 : 010-xxxx-xxxx");
			$("#divResult2").toggle();
		}
		function close2(){
			
			$('#divResult2').toggle();
			$(".modalhagosipda2").css("visibility", "hidden");
			$(".modalhagosipda2").css("opacity", "0");
		}
	
</script>
</head>
<style>

</style>
<body>
	<!-- 상단 오른쪽 버튼 -->
	<div id="first">
		<button type="button" class="btn btn-dark" onclick="location.href='../startpage/Firstpage.jsp'">BACK</button>
	</div>
	
	<!-- ID / PW 찾는 부분 -->
	<div class="find">
		<div id="findtitle">
			<span>가입시 입력한 이메일을 입력해주세요.</span>
		</div>
		<ul>
			<li>
				<form id="find" name="find" method="post" action="findidOK.jsp">
				<table style="width:500px; height:300px;">
					<tr>
						<td style="font-size:20px; font-weight:bold;">ID 찾기</td>
					</tr>
					<tr>
						<td><input type="text" id="t_nick" class="form-control" placeholder="닉네임" required autofocus></td>
					</tr>
					<tr>
						<td><input type="email" id="t_email" class="form-control" placeholder="이메일" required></td>
					</tr>
					<tr>
						<td><input type="button" class="btn btn-primary" value="찾기" onclick="findid()" ></td>
					</tr>
				</table>
				</form>
			</li>
			<li>
				<form id="" name="" method="post" action="findidOK.jsp">
				<table style="width:500px; height:300px">
					<tr>
						<td style="font-size:20px; font-weight:bold;">PW 찾기<p/></td>
					</tr>
					<!-- <tr>
						<td><input type="text" class="form-control" placeholder="아이디"></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="닉네임"></td>
					</tr>
					<tr>
						<td><input type="email" class="form-control" placeholder="이메일"></td>
					</tr> -->
					<tr>
						<td><input type="button" class="btn btn-primary" value="찾기" onclick="javascript:DoFindPW();"></td>
					</tr>
				</table>
				</form>
			</li>
		</ul>	
	</div>
	
	<!-- ID 찾은 결과 나오는 부분 -->
	<div class="modalhagosipda">
		<div id="divResult" name="divResult">
			<table style="width:100%; cellpadding:3; cellspacing:3;">
				<tr>
					<td align="right" height="28" bgcolor="#f4f4f4">[ <a href="javascript:close();"><b>닫기</b></a> ]&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td bgcolor="gold" height="5"></td>
				</tr>
				
				<!-- 결과를 가운데 정렬하고 싶어서 넣은 tr -->
				<tr>
					<td>&nbsp;</td>
				</tr>
				
				<tr>
					<td height="100" id="tdResult" align="center" name="tdResult" style="font-size:15px; font-weight:bold;"></td>
				</tr>
			</table>	
		</div>
	</div>
	
	<!-- PW 찾은 결과 나오는 부분 -->
	<div class="modalhagosipda2">
		<div id="divResult2" name="divResult"">
			<table style="width:100%; cellpadding:3; cellspacing:3;">
				<tr>
					<td align="right" height="28" bgcolor="#f4f4f4">[ <a href="javascript:close2();"><b>닫기</b></a> ]&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td bgcolor="gold" height="5"></td>
				</tr>
				
				<!-- 결과를 가운데 정렬하고 싶어서 넣은 tr -->
				<tr>
					<td>&nbsp;</td>
				</tr>
				
				<tr>
					<td height="100" id="tdResult2" align="center" name="tdResult" style="font-size:15px; font-weight:bold;"></td>
				</tr>
			</table>	
		</div>
	</div>
	
</html>