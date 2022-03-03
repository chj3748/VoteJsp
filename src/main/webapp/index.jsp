<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>Welcome</title>
</head>
<body>
	<h1>야 식 전 쟁</h1>

	
	<%
   	request.setCharacterEncoding("UTF-8");

   /* 세션에 값이 없다면 */
   if (session.getAttribute("userId") == null) {
   %>
	<button class="inputBtn" onclick="location.href='join.jsp'">회원가입</button>
	<button class="inputBtn" onclick="location.href='login.jsp'">로그인</button>

	<%
   }
   /* 세션에 값이 있다면 */
   else if (session.getAttribute("userId") != null) {
   %>

	<%
   //db 접근해서 vote_result 안에 voter = id
   Connection IDcon = null;
   PreparedStatement IDpstmt = null;
   String Ss_id = (String)session.getAttribute("userId");
   int findID = 0;
   try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      IDcon = DriverManager.getConnection(
      "jdbc:mysql://13.209.88.99:3306/test?useUnicode=true&serverTimezone=Asia/Seoul&", "aws", "1234");
      String IDsql = "select * from vote_result where voter=?";
      IDpstmt = IDcon.prepareStatement(IDsql);
      IDpstmt.setString(1, Ss_id);
      ResultSet rs = IDpstmt.executeQuery();
      findID = rs.next() ? 1 : 0;
   } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
   } finally {
      try {
         if (IDpstmt != null)
      IDpstmt.close();

         if (IDcon != null)
      IDcon.close();

      } catch (SQLException se) {
         System.out.println(se.getMessage());
      }
   }
   if (findID == 1) {%>
	<button class="inputBtn" onclick="location.href='yeunsung_resultpage.jsp'">투표현황</button>
	<%}
   
   else{%>
	<button class="inputBtn" onclick="location.href='vote.jsp'">투표하기</button>
	<%
   }%>
	<button class="inputBtn" onclick="location.href='logout.jsp'">로그아웃</button>
	<% 
   }
   %>


</body>
</html>