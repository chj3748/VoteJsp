<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야식전쟁 - 로그인</title>
</head>
<body>
<!-- 로그인 유저이면 다시 인덱스페이지로 -->
<%
 if (session.getAttribute("userId") != null){
	 response.sendRedirect("index.jsp");
 }
%>
	<form action="loginOk.jsp" method=post>
		<input type="text" name="id"><br/> 
		<input type="password" name="password"><br/>
		<input type="submit"><br/>
	</form>

</body>
</html>