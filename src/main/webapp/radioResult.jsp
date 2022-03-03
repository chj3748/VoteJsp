<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%

	String menu[] = request.getParameterValues("menu");
	

%>

	<h1><%=menu[0] %></h1>

</body>
</html>