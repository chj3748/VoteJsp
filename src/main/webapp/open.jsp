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
			try{
				int cnt = userDAO.adminOpen(); 
				
			}catch(Exception e){
				throw new Exception("admin open 실패");
			}
		
			VoteDAO voteDAO = new VoteDAO();
			try{
				voteDAO.closeVote();
				voteDAO.openVote();
			}catch(Exception e){
				throw new Exception("투표 리셋 실패");
			}
			response.sendRedirect("index.jsp");
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("loginFail.jsp");
		}
	}
	%>
</body>
</html>