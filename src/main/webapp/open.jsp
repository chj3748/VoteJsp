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
	UserDAO userDAO = new UserDAO();
	try{
		int cnt = userDAO.adminOpen();
	}catch(Exception e){
		e.printStackTrace();
	}

	VoteDAO voteDAO = new VoteDAO();
	try{
		voteDAO.closeVote();
		voteDAO.openVote();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>
</body>
</html>