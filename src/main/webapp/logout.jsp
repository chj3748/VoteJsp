<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
   <%
	  if(session.getAttribute("userId") == null){
		  response.sendRedirect("index.jsp");
	  }
	  else{
	      session.removeAttribute("userId");
	      response.sendRedirect("index.jsp");
	  }
   %>
</body>
</html>