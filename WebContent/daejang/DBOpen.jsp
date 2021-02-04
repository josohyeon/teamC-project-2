<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%  
String mDBMS     = "jdbc:mysql://127.0.0.1/team2?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
String mUserID   = "root";
String mUserPass = "mySQL1234";

Connection        conn;
PreparedStatement mStmt;
String            sql;


String  u_no    = ""; 
String  c_id = "";
String  u_nick  = "";
String 	u_email = "";
String  u_joindate = "";
String 	u_state = "";




Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection( mDBMS, mUserID ,mUserPass );
%>