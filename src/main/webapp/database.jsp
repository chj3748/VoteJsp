<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>database connect test</title>
</head>
<body>
<%
	Connection con = null;
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver"); // DB연결 객체 생성
		con = DriverManager.getConnection("jdbc:mysql://13.209.88.99:3306/jsp", "aws", "1234");
		out.println("Database접속되었습니다. ");
		con.close();
	}
	catch (Exception e) {
		out.println("Database접속불가");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</body>
</html>