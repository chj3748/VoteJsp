<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="pack.vote.VoteDAO" %>
<%@page import="pack.vote.VoteDTO" %>
<%@page import="java.util.LinkedHashMap" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>



<body>
<h2>투표 결과</h2>
<%
	LinkedHashMap voteResult= null;
	VoteDAO voteDao = new VoteDAO();
	try{
		voteResult = voteDao.voteCnt();
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("index.jsp");
	}
%>
	<table border="1" width="400">
	<tr>
		<td colspan="3"><b>총 투표자 : </b></td>
		<td width="40"><b>count(%)</b></td>
	</tr>
	
	<tr>
		<td>
		
	</tr>
	</table>


	


		
		
</body>


</html>


