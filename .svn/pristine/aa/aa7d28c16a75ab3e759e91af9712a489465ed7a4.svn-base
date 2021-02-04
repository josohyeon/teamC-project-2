<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="teamC.DBM" %>  
<%@ page import="teamC.VO" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="../style/TRecordpage.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<% 
String e_no   = request.getParameter("e_no");
String e_name = request.getParameter("e_name");
String e_set  = request.getParameter("e_set");
String e_cnt  = request.getParameter("e_cnt");
String e_kg   = request.getParameter("e_kg");
String e_time = request.getParameter("e_time");
String e_part = request.getParameter("e_part");
String e_rest = request.getParameter("e_rest");

DBM dbm = new DBM();

dbm.DBOpen();
String sql = "" ;
sql = "update exercise set " ;
sql+= "e_name = '"+ e_name + "',e_set = "+e_set ;
sql+= ",e_cnt= "+ e_cnt+ ",e_kg= "+e_kg ;
sql+= ",e_time= "+ e_time+ ",e_part= "+e_part ;
sql+= ",e_rest = "+ e_rest + " where e_no =" +e_no ; 
dbm.Excute(sql);
//System.out.println(sql);

dbm.DBClose();
%>