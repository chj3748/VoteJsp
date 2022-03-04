<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.jsp.JspWriter"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>

<style>
@font-face {
    font-family: 'BMKIRANGHAERANG';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMKIRANGHAERANG.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

*{
	font-family: 'BMKIRANGHAERANG';
	text-align: center;
}

body{
	background: url(img/night.jpg) no-repeat;
	background-size: 100%;
	position: relative;
}

h1{
	font-size: 150px;
	font-weight: 400;
	margin-top: 13%;
	color: orange;
	text-shadow: -3px 0 #000, 0 3px #000, 3px 0 #000, 0 -3px #000;
	text-shadow: 2px 2px 2px #000;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 10px 25px;
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 300;
    transition: 0.25s;
    margin: 10px;
    font-size: 38px;
}

.w-btn-yellow {
    background-color: #F5C836;
}

.w-btn-yellow-outline:hover {
    background-color: #fce205;
    color: #6e6e6e;
}

.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

</style>

</head>
<body>

	<h1>야 식 전 쟁</h1>
	<%
   	request.setCharacterEncoding("UTF-8");

   if (session.getAttribute("userId") == null) {
   %>
   	<button class="w-btn w-btn-yellow" onclick="location.href='join.jsp'">회원가입</button>
	<button class="w-btn w-btn-yellow" onclick="location.href='login.jsp'">로그인</button>

	<%
   }
   else if (session.getAttribute("userId") != null) {
   %>

	<%
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
	<button class="w-btn w-btn-yellow" onclick="location.href='yeunsung_resultpage.jsp'">투표현황</button>
	<%}
   
   else{%>
	<button class="w-btn w-btn-yellow" onclick="location.href='vote.jsp'">투표하기</button>
	<%
   }%>
	<button class="w-btn w-btn-yellow" onclick="location.href='logout.jsp'">로그아웃</button>
	<% 
   }
   %>
</body>

</html>


