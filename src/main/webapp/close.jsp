<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="pack.user.UserDAO" %>
<%@page import="pack.vote.VoteDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if(!(session.getAttribute("userId").equals("admin"))){
		response.sendRedirect("index.jsp");
	}
	else{
		UserDAO userDAO = new UserDAO();
		try{
			int cnt = userDAO.adminClose();
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("loginFail.jsp");
		}
		
		response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>