<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*" %>
<%@ include file="DBOpen.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<script>

</script>
<body>
<%
	String u_id = null;
	if(session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");
	}
	/*if(u_id == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('잘못된 접근입니다!!');");
		script.println("location.href = '../startpage/Firstpage.jsp'");
		script.println("</script>");
		script.close();	
	}*/
	session.setMaxInactiveInterval(20*60);//20분지나면 자동 로그아웃
%>
<%
	ResultSet        rs;		
	sql = "select count(*) as cnt from user ";
	
	mStmt= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs = mStmt.executeQuery();	
	rs.next();
	int recordTotal = Integer.parseInt(rs.getString("cnt"));
	
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	
	if(type == null)
	{
		type = "1";
	}
	
	if(keyword == null)
	{
		keyword="";
	}
	String adParam = "type=" + type + "&keyword=" + keyword;
%>
		
		
	<header>
	</header>
	<nav style="float:left; margin-right:100px;">
		<ul style="list-style: none">
			<li><a href="Daejang.jsp">일반 회원 관리</a></li>
			<li><a href="TDaejang.jsp">트레이너 회원 관리</a></li>
		</ul>
	</nav>
	<section>
		<table style="width:80%; text-align:center;">
			<thead>
				<tr style="text-align:right;">
					<td colspan="7">
						<c:out value="${u_id}"/>
						<a href='../u-login/U-Logout.jsp'>LOGOUT</a>
					</td>
				</tr>
				<tr style="text-align:right;">
					<td colspan="7">About <%= recordTotal %> results</td>
				</tr>
				<tr style="text-align:right;">
					<td colspan="7">
						<form style="align:right" id="frm" name="frm" method="get" action="Daejang.jsp"  >
						Search: <select id="type" name="type">
						<%
							if(type.equals("1"))
							{
								%><option value="1" selected >아이디</option><% 
							}
							else
							{
								%><option value="1" >아이디</option><% 
							}
							if(type.equals("2"))
							{
								%><option value="2" selected>닉네임</option><%
							}
							else
							{
								%><option value="2">닉네임</option><%
							}
							if(type.equals("3"))
							{
								%><option value="3" selected>이메일</option><% 			
							}
							else
							{
								%><option value="3">이메일</option><% 	
							}
						%>	
							</select>
							<input type="search" id="keyword" name="keyword" value=<%= keyword %>>
							<input type="submit" value="검색">
						</form>
					</td>
				</tr>
				<tr >
					<th width="5%">번호</th>
					<th width="15%">아이디</th>
					<th width="15%">닉네임</th>
					<th width="20%">이메일</th>
					<th width="15%">가입일</th>
					<th width="10%">가입:Y/탈퇴:N</th>
					<th width="20%">회원관리</th>				
				</tr>
			</thead>
			<tbody>
				<%
					recordTotal = 0;
					int pageno  = 0;
					int perpage = 0;
					int startno = 0;
					
					try
					{
						
			
						String curpage = request.getParameter("page");
						if(curpage == null)
						{
							curpage = "1";
						}
						
						
						
						sql = "select count(*) as cnt from user ";
						if(!keyword.equals(""))
						{
							switch(type)
							{
							case "1": //아이디
								sql += "where u_id like '%" + keyword + "%' ";
							break;
							case "2": //닉네임
								sql += "where u_nick like '%" + keyword + "%' ";
							break;
							case "3": //이메일
								sql += "where u_email = '" + keyword +"'";
							break;
							}
						}
						mStmt= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
						rs = mStmt.executeQuery();	
						rs.next();
						recordTotal = Integer.parseInt(rs.getString("cnt"));
	
						
						//검색된 결과를 닫는다.
						rs.close();
						//stmt 를 닫는다.
						mStmt.close();	
						
						pageno  = Integer.parseInt(curpage);
						perpage = 10;
						startno = ((pageno - 1) * perpage);
						sql = "select u_id,u_nick,u_email,u_joindate,u_state from user ";
						if(!keyword.equals(""))
						{
							switch(type)
							{
							case "1": //아이디
								sql += "where u_id like '%" + keyword + "%' ";
							break;
							case "2": //닉네임
								sql += "where u_nick like '%" + keyword + "%' ";
							break;
							case "3": //이메일
								sql += "where u_email = '" + keyword +"'";
							break;
							}
						}
						sql += "order by u_no desc ";
						sql += "limit " + startno + "," + perpage;
						
						
						mStmt= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
						rs = mStmt.executeQuery();		
						
						int i = recordTotal - ((pageno - 1) * perpage);
						
						while(rs.next())
						{
							c_id  		= rs.getString("u_id");
							u_nick  	= rs.getString("u_nick");
							u_email 	= rs.getString("u_email");
							u_joindate  = rs.getString("u_joindate");							
							u_state 	= rs.getString("u_state");						
							
							%>
							<tr bgcolor="white">
								<td><%= i--  %></td>
								<td><%= c_id %></td>
								<td><%= u_nick %></td>
								<td><%= u_email %></td>
								<td><%= u_joindate %></td>
								<td><%= u_state %></td>
								<td>
									<a href="u_change.jsp?c_id=<%= c_id %>">비밀번호 변경</a>
									<a href="u_out.jsp?c_id=<%= c_id %>">회원 탈퇴</a>
								</td>
							</tr>
							<%
						}
						
						//검색된 결과를 닫는다.
						rs.close();
				
						//stmt 를 닫는다.
						mStmt.close();		
						
					}catch(Exception e)
					{
						out.println("ERROR:" + e.getMessage());
					}
					%>
				</tbody>
		</table>
		
		<%-- <div align="right" >
			<%
				int maxPage = recordTotal / perpage;
				if( (recordTotal % perpage ) != 0)
				{
					maxPage++;
				}
				int blockstart = ((pageno-1)/10)*10;
			%>
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="Daejang.jsp?page=<%=blockstart - 1 %>&<%= adParam%>">Previous</a></li>
					<%
					
						for(int j=blockstart+1; j <= (blockstart+10); j++)
						{
							%><li class="page-item"><a href="Daejang.jsp?page=<%= j %>&<%= adParam%>"><%= j %></a>&nbsp;&nbsp;</li><%
						}
					%> 
				<li class="page-item"><a class="page-link" href="Daejang.jsp?page=<%=(blockstart+10)+1%>&<%= adParam%>">Next</a></li>	
			</ul>
		</div> --%>
	</section>
</body>
</html>
<% conn.close();%>