<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>database connect test</title>
</head>
<body>
<%
	Connection con = null;
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver"); // DB���� ��ü ����
		con = DriverManager.getConnection("jdbc:mysql://13.209.88.99:3306/jsp", "aws", "1234");
		out.println("Database���ӵǾ����ϴ�. ");
		con.close();
	}
	catch (Exception e) {
		out.println("Database���ӺҰ�");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</body>
</html>