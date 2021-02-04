<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="teamC.DBM" %>  
<%@ page import="teamC.VO" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="../style/TRecordpage.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<% 
String u_no = request.getParameter("u_no");
String r_ct = request.getParameter("i");
String t_no = request.getParameter("t_no");
String p_try = request.getParameter("p_try");

//System.out.println(u_no);
//System.out.println(r_ct);
//System.out.println(t_no);
DBM dbm = new DBM();

dbm.DBOpen();
// while 문을 돌려야 할듯 
String sql = "" ;
sql = "select e_no,r_ct,e_name,e_set,e_cnt,e_kg,e_time,e_part,e_rest " ;
sql +="from exercise where u_no = '"+u_no+"' and r_ct = '" +r_ct+ "' and p_try='" +p_try+"' " ;
//System.out.println(sql);
dbm.OpenQuery(sql);


 // r_ct 값을 바꿔야함
DBM dbm2 = new DBM();

dbm2.DBOpen();
sql = "select r_date from round where u_no = '" +u_no+ "' and r_ct = '" +r_ct+ "' and p_try='" +p_try+"' ";
//System.out.println(sql);
dbm2.OpenQuery(sql);
dbm2.ResultNext();
String r_date= dbm2.getString("r_date");
if(r_date == null)
{
	r_date="";	
}
%>
<div>
	<div style=" text-align:center; width:100%;" >
	<span style="color:black;"><%=r_ct %>회차<%=r_date %></span> 
	<form id="frm">
		<table style="width:60vh; height:300px; text-align:center; margin:auto;">
			<tr>
				<th rowspan="5"><input type="text" class="form-control" id='e_name' name='e_name' value='' placeholder="운동명"></th>
				<th>세트</th>
				<th>횟수</th>
				<th>무게</th>
			</tr>	
			<tr>
				<td>
					<input type="hidden" id="u_no"   name="u_no"   value="<%=u_no %>">
					<input type="hidden" id="r_date" name="r_date" value="<%=r_date %>">
					<input type="hidden" id="r_ct"   name="r_ct"   value="<%=r_ct %>">
					<input type="hidden" id="t_no"   name="t_no"   value="<%=t_no %>">
					<input type="hidden" id="p_try"  name="p_try"  value="<%=p_try %>">
					<input type="hidden" id="e_no"   name="e_no">
					<input type="text" class="form-control" id='e_set' name ='e_set' value=''>세트
				</td>
				<td><input type="text" class="form-control" id='e_cnt' name ='e_cnt' value=''>회</td>
				<td><input type="text" class="form-control" id='e_kg' name ='e_kg' value=''>kg</td>
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
				<td><input type="text" class="form-control" id='e_time' name ='e_time' value=''>분</td>
				<td><input type="text" class="form-control" id='e_part' name ='e_part' value=''>&nbsp;</td>
				<td><input type="text" class="form-control" id='e_rest' name ='e_rest'value=''>초</td>
			</tr>
			<tr style="text-align:right">
				<td colspan="4"><input type='button' class="btn btn-dark" id="records" onclick="Exlistsave()" value='저장'></td>
		
			</tr>
			<tr>
				<td colspan="4"><div id="exsave"></div></td>
			</tr>
		</table>
	</form>
	</div>

	<div style="overflow:auto;height:400px;" id="Exersava">
		<% 
		int cnt = 1;
		while(dbm.ResultNext()){
		
			String e_no   = dbm.getString("e_no"); // 운동 관리번호 
			String e_name = dbm.getString("e_name"); // 운동이름
			String e_set  = dbm.getString("e_set"); // 세트수
			String e_cnt  = dbm.getString("e_cnt"); // 횟수
			String e_kg   = dbm.getString("e_kg"); // 무게
			String e_time = dbm.getString("e_time"); // 소요시간
			String e_part = dbm.getString("e_part"); // 부위
			String e_rest = dbm.getString("e_rest"); // 휴식시간
			
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
		
		%>
		<div style="margin-top:10vh;">
			<table style="width:60vh; height:300px; text-align:center; margin:auto;" >
				<tr style="display:none;">
					<td colspan="4">
						<input type="hidden" id="e_name" name="e_name" value="<%=e_name%>">
						<input type="hidden" id="e_set"  name="e_set"  value="<%=e_set%>">
						<input type="hidden" id="e_cnt"  name="e_cnt"  value="<%=e_cnt%>">
						<input type="hidden" id="e_kg"   name="e_kg"   value="<%=e_kg%>">
						<input type="hidden" id="e_no"   name="e_no"   value="<%=e_no%>">
						<input type="hidden" id="e_time" name="e_time" value="<%=e_time%>">
						<input type="hidden" id="e_part" name="e_part" value="<%=e_part%>">
						<input type="hidden" id="e_rest" name="e_rest" value="<%=e_rest%>">
					</td>
				</tr>
				<tr>	
					<th id="eName_<%=cnt%>" rowspan="5"><%=e_name%></th>
					<th>세트</th>
					<th>횟수</th>
					<th>무게</th>
				</tr>
				<tr>
					<td id="eSet_<%=cnt%>"><%=e_set%></td>
					<td id="eCnt_<%=cnt%>"><%=e_cnt%></td>
					<td id="eKg_<%=cnt%>"><%=e_kg%></td>
					<td id="eNo_<%=cnt%>"></td>
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
					<td id="eTime_<%=cnt%>"><%=e_time%></td>
					<td id="ePart_<%=cnt%>"><%=e_part%></td>
					<td id="eRest_<%=cnt%>"><%=e_rest%></td>
				</tr>
				<tr style="text-align:right">
					<td colspan="4"><button onclick='r_modify(this,<%= cnt %>)' class="btn btn-dark">수정</button></td>
				</tr>
			</table>
		</div>
			<%
			cnt++;
		} 
			%>
	</div>	
</div>
<%
dbm.CloseQuery();
dbm.DBClose();
dbm2.CloseQuery();
dbm2.DBClose();
%>