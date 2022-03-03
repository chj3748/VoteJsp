<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	Connection con = null;
	PreparedStatement pstmt = null;
	int findID = 0;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://13.209.88.99:3306/jsp", "aws", "1234");
		String sql = "select * from vote_user where id=? and password=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		System.out.println("login DB접속");
		ResultSet rs = pstmt.executeQuery();
		findID = rs.next() ? 1 : 0;
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
		response.sendRedirect("loginFail.jsp");
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			response.sendRedirect("loginFail.jsp");
		}
	}
	// db확인 후
	// 로그인 정보일치
	if (findID == 1) {
		session.setAttribute("userId", id);
		response.sendRedirect("index.jsp");
	} else {
		response.sendRedirect("loginFail.jsp");
		//response.sendRedirect("login.jsp");
	}
	%>
</body>
</html>