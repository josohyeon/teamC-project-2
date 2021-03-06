<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="teamC.DBM" %> 
<%@ page import="java.io.PrintWriter"%> 
<%@ page import="teamC.VO" %>
<%@ page import="pt.PtDAO" %>  
<%@ page import="trainer.TrainerDAO" %>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="../style/TRecordpage.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<title>TRAINER PT RECORD</title>
<script src="../js/jquery-3.5.1.min.js"></script>
<script>
    var curTable = null;
    function r_modify(node,cnt)
    {
    	curTable = $(node).parent().parent().parent();
    	e_name   = $(curTable).find("#e_name");
    	e_set    = $(curTable).find("#e_set");
    	e_cnt    = $(curTable).find("#e_cnt");
    	e_kg 	 = $(curTable).find("#e_kg");
    	e_time   = $(curTable).find("#e_time");
    	e_part   = $(curTable).find("#e_part");
    	e_rest   = $(curTable).find("#e_rest");
    	e_no 	 = $(curTable).find("#e_no");
    	//alert($(e_set).val());

    	$('#e_name').val($(e_name).val());
    	$('#e_set').val($(e_set).val());
    	$('#e_cnt').val($(e_cnt).val());
    	$('#e_kg').val($(e_kg).val());
    	$('#e_time').val($(e_time).val());
    	$('#e_part').val($(e_part).val());
    	$('#e_rest').val($(e_rest).val());
    	$('#e_no').val($(e_no).val());
    	$('#records').attr('value','수정완료').attr('onclick','r_modifyok(this,'+cnt+')');
    }
    function r_modifyok(node,cnt)
    {
    	curTable = $(node).parent().parent().parent();
    	e_no 	 = $(curTable).find("#e_no");
    	e_name   = $(curTable).find("#e_name");
    	e_set 	 = $(curTable).find("#e_set");
    	e_cnt 	 = $(curTable).find("#e_cnt");
    	e_kg 	 = $(curTable).find("#e_kg");
    	e_time   = $(curTable).find("#e_time");
    	e_part   = $(curTable).find("#e_part");
    	e_rest   = $(curTable).find("#e_rest");
    	//alert($(e_no).val());
    	
    	var e_no 	= $(e_no).val();
    	var e_name  = $(e_name).val();
    	var e_set   = $(e_set).val();
    	var e_cnt   = $(e_cnt).val();
    	var e_kg 	= $(e_kg).val();
    	var e_time  = $(e_time).val();
    	var e_part  = $(e_part).val();
    	var e_rest  = $(e_rest).val();
    	
    	$.ajax({
			type:'GET',	 
			url:'T-Exmodify.jsp',
			data:{"e_no":e_no,"e_name":e_name,"e_set":e_set,"e_cnt":e_cnt,
				 "e_kg":e_kg,"e_time":e_time,"e_part":e_part,"e_rest":e_rest},
			success:function(data)
			{
				$("#eName_"+cnt).text(e_name);
				$("#eName_"+cnt).find("#e_name").val(e_name);
				$("#eSet_"+cnt).text(e_set);
				$("#eSet_"+cnt).find("#e_set").val(e_set);
				$("#eCnt_"+cnt).text(e_cnt);
				$("#eCnt_"+cnt).find("#e_cnt").val(e_cnt);
				$("#eKg_"+cnt).text(e_kg);
				$("#eKg_"+cnt).find("#e_kg").val(e_kg);
				$("#eTime_"+cnt).text(e_time);
				$("#eTime_"+cnt).find("#e_time").val(e_time);
				$("#ePart_"+cnt).text(e_part);
				$("#ePart_"+cnt).find("#e_part").val(e_part);
				$("#eRest_"+cnt).text(e_rest);
				$("#eRest_"+cnt).find("#e_rest").val(e_rest);
				$('#records').attr('value','수정');
				$('#records').attr('value','저장').attr('onclick','Exlistsave()');
			
				$(curTable).find("#e_no").val("");
				$(curTable).find("#e_name").val("");
				$(curTable).find("#e_set").val("");
				$(curTable).find("#e_cnt").val("");
				$(curTable).find("#e_kg").val("");
				$(curTable).find("#e_time").val("");
				$(curTable).find("#e_part").val("");
				$(curTable).find("#e_rest").val("");
			}
		});
    }
    
    //누르면 상단으로 감!
    function onTop()
    {
    	$(".list").scrollTop(0);	
    }

    var prev_u_no = null;
	function Countlist(p_no, u_nick, u_no, t_no, p_try)
	{
		var u_nick =u_nick;
		var list   =  $('#spanreal_cnt_'+u_nick).text();
		var output = " ";
		var p_no   = p_no;
		var u_no   = u_no;
		var t_no   = t_no;
		var p_try  = p_try;
			list   = Number(list);
		for(var i=list; i>=1; i--)
		{			
			output += "<input type='button' class='btn btn-primary' id='btn"+i+"' value = '"+i+"회차'" ;
			output += "style='width:500px; height:30px; margin-bottom:10px;'" ;
			output += "onclick= 'Exlistopen("+u_no+","+i+","+t_no+","+p_try+")';>";
		}
		if(list == 0)
		{
			alert("등록된 회차가 없습니다");
			$("#add_"+u_no).toggle();
		}
		else
		{
			if(prev_u_no != null)
			{
				$("#userDetail_"+prev_u_no).html("");
				$("#add_"+prev_u_no).toggle();
			}
			$("#userDetail_"+u_no).html(output);
			$("#add_"+u_no).toggle();
			prev_u_no = u_no;			
		}
	}
	function Countplus(t_no, u_no, p_try, p_no, u_nick, p_cnt) // 목록  추가하기
	{
		var t_no 	= t_no;
		var u_no 	= u_no;
		var p_try   = p_try;
		var p_no    = p_no;
		var u_nick  = u_nick;
		var p_cnt   = p_cnt;
		var listMax = $('#spanreal_cnt_'+u_nick).text();		
		
		$.ajax({
			type:'post',
			data:{"t_no":t_no,"u_no":u_no,"p_try":p_try,"p_no":p_no,"listMax":listMax,"p_cnt":p_cnt}, 
			url:'T-Countplus.jsp',
			success:function(result)
			{
				var output = "";
				var Num    = Number(Number(listMax)+1)
				if(result.trim() == 0)
				{
					//alert("회차가 추가 되었습니다");
					output += "<input type='button' value = '"+Num+"회차'" ;
					output += "style='width:500px; height:30px; margin-bottom:10px;' class='btn btn-primary' " ; 
					output += "onclick= 'Exlistopen("+u_no+","+Num+","+t_no+","+p_try+")';>";
					//위에 버튼 아이디 값 바꿔야함 
					$("#userDetail_"+u_no).prepend(output);
					$("#spanreal_cnt_"+u_nick).text(Number(Number(listMax)+1));			
				}
				else if(result.trim() == 1)
				{
					alert("회차가 만료 되었습니다");
				}
				else
				{
					alert('오류 입니다. 다시시도 하세요');
				}
			}
		});
	}
	
	
	function Modify(p_no, u_no) // 코맨트 수정하기
	{
		$("#spanComment1_"+u_no).toggle();
		$("#spanComment2_"+u_no).toggle();
		$("#m_btn_"+u_no).toggle();
		$("#s_btn_"+u_no).toggle();
	}	
	function ModifyOK(p_no, u_no) // 코맨트 저장하기
	{
		var mComment = $("#comment_"+u_no).val();
		$("#spanComment1_"+u_no).html(mComment);
		$("#spanComment1_"+u_no).toggle();
		$("#spanComment2_"+u_no).toggle();
		$("#m_btn_"+u_no).toggle();
		$("#s_btn_"+u_no).toggle();		
		$.ajax
		({
			type:'GET',
			data:{"p_no":p_no,"mComment":mComment,"u_no":u_no},
			url:'T-Modify.jsp',
			success:function(result)
			{
				alert('변경되었습니다');
			}
		});
	}	
 	function Exlistopen(u_no,i,t_no,p_try)
 	{
 		var u_no  = u_no;
 		var i     = i;
 		var t_no  = t_no;
 		var p_try = p_try;
		$.ajax
		({
			type:'GET',
			data:{"u_no":u_no, "i":i,"t_no":t_no,"p_try":p_try}, 
			url:'Exlistopen.jsp',
			success:function(data)
			{
				$("#exlist").html(data);
			}
		});
 	}

 	function Exlistsave()
 	{
 		//alert($("#frm").serialize());
		$.ajax({
			type:'GET',	 
			url:'T-Exlistsave.jsp',
			data:$("#frm").serialize(),
			success:function(data)
			{
				$("#Exersava").prepend(data);	
				$("#e_no").val("");
				$("#e_name").val("");
				$("#e_set").val("");
				$("#e_cnt").val("");
				$("#e_kg").val("");
				$("#e_time").val("");
				$("#e_part").val("");
				$("#e_rest").val("");
			}
		});
 	}
	function deleteM(u_no,p_state,t_no,p_try,p_end)
	{
		$.ajax({
			type:'GET',
			data:{"u_no":u_no, "p_state":p_state,"t_no":t_no,"p_try":p_try,"p_end":p_end},
			url:'T-Delete.jsp',
			success:function(data)
			{
				
				$("#memberinfo_"+u_no).hide();
			}
		});
	}
	
	/* $(document).ready(function(){
		
		$(".updateBtn").on("click",function(){
			r_modify();
		});
	}); */
</script>
<style>

</style>
</head>
<body>
<%
	String  u_id = null;
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
		<button type="button" class="btn btn-link" onclick="location.href='../startpage/Firstpage.jsp'">LOGOUT</button>
	</div>	
	
	<!-- 상단 로고 -->
	<div>
		<img src="../images/TLOGO.png" style="width:110px; height:70px; position:absolute; top:0; cursor: pointer;" onclick="location.href='../t-mainpage/T-Mainpage.jsp'">
	</div>
	
	<!-- 상단 메뉴바 -->
	<div class="content">
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
	
	<!-- 회원 리스트가 보이는 부분 -->
	<!-- class="list"는 전체를 감싸는 흰배경부분 -->
	<div class="list">
		<!-- 안에 있는 content들 -->
		<div class="listcont">
			<table style="margin:auto; font-size:18px;">
				<thead>
					<tr>
					<td style="color:#B22222; text-align:center;">*PT회차를 눌러 회원의 PT를 기록해주세요!</td>
				</tr>
			</thead>
			<tbody>
			<%
				try
				{	
					//PT를 받는 회원들의 목록을 불러오는 곳.
					
					TrainerDAO trainerDAO = new TrainerDAO();
					int t_no = trainerDAO.findno(u_id);
					System.out.println("t_no::" + t_no);
					
					DBM dbm = new DBM();
				
					dbm.DBOpen();
					
					String sql = "";
					 sql = "select p.p_no,p.u_no,p.p_try,u.u_nick,u.u_gender,p.p_comment,p.p_ok,p.p_cnt, p.p_state, p.p_end, (select count(*) " ; // p.u_no 없어도 될듯 
					 sql += " from round where p_try = p.p_try and t_no = p.t_no and u_no = p.u_no) " ;
					 sql += "as real_cnt from pt p, user u where u.u_no = p.u_no and p.t_no = "+ t_no +" and p.p_state in ('b','c') " ;
					 sql += "order by p.p_state asc,p.p_ok" ;
					 dbm.OpenQuery(sql);
					// out.print(sql);
					 while(dbm.ResultNext())
					 {
						 String p_no 	  = dbm.getString("p_no");
						 String u_no 	  = dbm.getString("u_no");
						 String p_try 	  = dbm.getString("p_try");
						 String u_nick 	  = dbm.getString("u_nick");
						 String u_gender  = dbm.getString("u_gender");
						 String p_comment = dbm.getString("p_comment");
						 String p_ok 	  = dbm.getString("p_ok");
						 String p_cnt 	  = dbm.getString("p_cnt");
						 String real_cnt  = dbm.getString("real_cnt");
						 String p_state   = dbm.getString("p_state");
						 String p_end 	  = dbm.getString("p_end");
						 
						 if(p_comment == null)
						 {
							 p_comment = "회원의 기타사항을 남겨주세요";
						 }
			%>
				<tr id = "memberinfo_<%=u_no %>">
					<td>
					<div style="border:3px solid #343A40; width:500px; height:150px; border-radius:10px" class="member1">
					<% 

						if(u_gender.equals("M")) //남자 회원 이미지
						{
							if(p_state.equals("c")) //남자이면서 만료된 경우
							{
								%><img src="../images/boyok.png" style="width:130px;  height:140px; margin:2px 2px 0px 2px; float:left;"><%
							}else
							{
								%><img src="../images/boy.png" style="width:130px;  height:140px; margin:2px 2px 0px 2px; float:left;">
							<%
							}
						}else //여자 회원 이미지
						{
							if(p_state.equals("c")) //여자이면서 만료된 경우
							{
								%><img src="../images/girlok.png" style="width:130px;  height:140px; margin:2px 2px 0px 2px; float:left;"><%
							}else{
								%><img src="../images/girl.png" style="width:130px;  height:140px; margin:2px 2px 0px 2px; float:left;"><%
							}
					
						}
					%>
						닉네임 : <%=u_nick%><br>
						PT차수 : <span id="spanreal_cnt_<%=u_nick %>" style="color:black;"><%= real_cnt%></span>/<%=p_cnt %><br>
						<p id='etc1'>
							기타사항 : 
							<span id="spanComment1_<%=u_no %>" style="color:black;"><%= p_comment%></span>
							<span id="spanComment2_<%=u_no %>" style="display:none;"><input type="text" id="comment_<%=u_no %>" name="comment_<%=u_no %>" value="<%= p_comment%>"></span>
						</p>
						<button class="btn btn-dark" id="Clist_<%=u_no %>" onclick="Countlist(<%=p_no%>, '<%=u_nick%>', <%=u_no%>, <%=t_no%>, <%=p_try%>);">PT회차</button>
						<button class="btn btn-dark" id="add_<%=u_no %>" style="display:none;" onclick="Countplus(<%=t_no%>,<%=u_no%>,<%=p_try%>,<%=p_no%>,'<%=u_nick%>',<%=p_cnt%>);">회차추가</button>
						<input type="button" class="btn btn-dark" id="m_btn_<%=u_no %>" onclick="Modify(<%=p_no%>,<%=u_no %>)" value="수정">
						<input type="button" class="btn btn-dark" id="s_btn_<%=u_no %>" onclick="ModifyOK(<%=p_no%>,<%=u_no %>)" value="저장" style="display:none;">
						<button class="btn btn-dark" id=d_btn_<%=u_no %> onclick="deleteM(<%=u_no%>,'<%=p_state%>',<%=t_no%>,<%=p_try%>,<%=p_end%>)">삭제</button>
					</div>
					<div id="userDetail_<%=u_no %>" style="width:500px; -ms-overflow-style: none;"></div>
					</td>
				</tr>
				<%
					}
					dbm.CloseQuery();
					dbm.DBClose();
				%>
				</tbody>
				</table>
				</div>
				<%
				}catch(Exception e) 
				{ 
					e.printStackTrace(); 	
				}
				%>
				
	<!-- 왼쪽 이미지 -->
		<div id="leftimg">
		</div> 
	
	<!-- PT별 운동기록이 보이는 부분 -->
		<div style="float:right; right:20%; margin-left:100px; position:absolute; font-size:18px" id="exlist">
		</div>
		
	<!-- 누르면 상단으로 가는 버튼 -->
		<a href="javascript:onTop();" style="color:black; position:fixed; bottom:5%; right:5%;">[TOP]</a>
	
	</div> 
</body>
</html>