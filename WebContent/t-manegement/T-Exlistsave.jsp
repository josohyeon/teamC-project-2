<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="teamC.DBM" %>  
<%@ page import="teamC.VO" %>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="../style/TRecordpage.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<%
String t_no   = request.getParameter("t_no");
String r_date = request.getParameter("r_date");
String u_no   = request.getParameter("u_no");
String p_try  = request.getParameter("p_try");
String r_ct   = request.getParameter("r_ct");
String e_name = request.getParameter("e_name");
String e_set  = request.getParameter("e_set");
String e_cnt  = request.getParameter("e_cnt");
String e_kg   = request.getParameter("e_kg");
String e_time = request.getParameter("e_time");
String e_part = request.getParameter("e_part");
String e_rest = request.getParameter("e_rest");

if(e_set == "")
{
	e_set="0";
}
if(e_cnt == "")
{
	e_cnt ="0";
}
if(e_kg == "")
{
	e_kg ="0";
}
if(e_time == "")
{
	e_time ="0";
}
if(e_part == "")
{
	e_part ="0";
}
if(e_rest == "")
{
	e_rest ="0";
}


//System.out.println(t_no);
//System.out.println(u_no);
//System.out.println(p_try);
//System.out.println(r_ct);
DBM dbm = new DBM();
dbm.DBOpen();
String sql = "" ;
sql = "insert into exercise ";
sql += "(t_no,u_no,p_try,r_ct,e_name,e_set,e_cnt,e_kg,e_time,e_part,e_rest) ";
sql += "values ";
sql += "("+t_no+","+u_no+","+p_try+","+r_ct+",'"+e_name+"',";
sql += " "+e_set+","+e_cnt+","+e_kg+","+e_time+",'"+e_part+"',"+e_rest+") ";

dbm.Excute(sql);
System.out.println(sql);

DBM dbm3 = new DBM();
dbm3.DBOpen();
sql = "select max(e_no) as e_no from exercise" ;
dbm3.OpenQuery(sql);
dbm3.ResultNext();
String e_no = dbm3.getString("e_no");
DBM dbm2 = new DBM();
dbm2.DBOpen();
sql = "select e_name, e_set, e_cnt, e_kg, e_time, e_part, e_rest ";
sql += "from exercise where t_no =" +t_no+ " and u_no =" +u_no+ " and r_ct=" + r_ct +" ";
sql += " and e_no=" +e_no ;

//System.out.println(sql);
//sql += " and e_no = max(e_no)" ;
System.out.println(sql);
dbm2.OpenQuery(sql);

while(dbm2.ResultNext()){
String ve_name = dbm2.getString("e_name");
String ve_set  = dbm2.getString("e_set");
String ve_cnt  = dbm2.getString("e_cnt");
String ve_kg   = dbm2.getString("e_kg");
String ve_time = dbm2.getString("e_time");
String ve_part = dbm2.getString("e_part");
String ve_rest = dbm2.getString("e_rest");
%>
<div style=" text-align:center; width:100%" id="">
<form id="frm">
<input type="hidden" id="u_no"  name="u_no"  value=<%=u_no %>>
<input type="hidden" id="r_ct"  name="r_ct"  value=<%=r_ct %>>
<input type="hidden" id="t_no"  name="t_no"  value=<%=t_no %>>
<input type="hidden" id="p_try" name="p_try" value=<%=p_try %>>
<div style="margin-top:10vh;" style="overflow:auto;height:400px;">
<table style="width:60vh; height:300px; text-align:center; margin:auto;">
	<tr>	
		<th rowspan="5"><%=ve_name%></th>	
		<th>세트</th>
		<th>횟수</th>
		<th>무게</th>
	</tr>
	<tr>
		<td><%=ve_set%></td>
		<td><%=ve_cnt%></td>
		<td><%=ve_kg%></td>
	</tr>

<!-- 간격을 위해 임의로 넣은것 -->
	<tr>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
	</tr>
	
	<tr>
		<th>소요시간</th>
		<th>자극부위</th>
		<th>세트간 휴식</th>
	</tr>
	<tr>
		<td><%=ve_time%></td>
		<td><%=ve_part%></td>
		<td><%=ve_rest%></td>
	</tr>
	<tr style="text-align:right">
		<td colspan="4"><button onclick='r_modify()' class="btn btn-dark updateBtn">수정</button></td>
		</tr>
	</table>
	</div>
</form>
</div>
<%
}
dbm2.CloseQuery();
dbm.DBClose();
dbm2.DBClose();
dbm3.CloseQuery();
dbm3.DBClose();
%>
