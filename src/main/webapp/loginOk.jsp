<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pack.user.UserDAO" %>
<%@page import="pack.user.UserDTO" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	UserDTO user = null;
	UserDTO loginUser = new UserDTO(id, password);
	UserDAO userDAO = new UserDAO();
	try{
		// db확인 후
		// 로그인 정보일치
		user = userDAO.login(loginUser);
		if (user != null) {
			session.setAttribute("userId", id);
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("loginFail.jsp");
			//response.sendRedirect("login.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
		//response.sendRedirect("loginFail.jsp");
		response.sendRedirect("login.jsp");
	}

	%>
</body>
</html>