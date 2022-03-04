<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	
	<% 			 
	  String id = request.getParameter("id");
	  String pwd = request.getParameter("pwd");
	  String pwdc = request.getParameter("pwdc");
	  String name = request.getParameter("name");
	  String age = request.getParameter("age");
	  String gender = request.getParameter("gender");

   	  Connection IDcon = null;
	  PreparedStatement IDpstmt = null;
	  int findID = 0;
	  
	  try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			IDcon = DriverManager.getConnection("jdbc:mysql://13.209.88.99:3306/jsp?useUnicode=true", "aws", "1234");
			String IDsql = "select * from vote_user where id=?";
		    IDpstmt = IDcon.prepareStatement(IDsql);
		  	IDpstmt.setString(1, id);
		  	System.out.println("idcheck DB접속");
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
	  
   
 
  	  if (findID == 1) {
  		response.sendRedirect("loginFail.jsp");
    
	  // 비밀번호 일치 확인
      } else if (pwd.equals(pwdc)) {
	   	  int n = 0;
	   	  PreparedStatement pstmt = null;
	   	  Connection con = null;
   	  
	   	  try {
	   		  
	   		  // 2. 전송된 값을 db에 저장.
	   		 
	   		  Class.forName("com.mysql.cj.jdbc.Driver"); // DB연결 객체 생성
	   		  con = DriverManager.getConnection("jdbc:mysql://13.209.88.99:3306/jsp?characterEncoding=euckr&useUnicode=true&mysqlEncoding=euckr", "aws", "1234");
	   		  String sql = "insert into vote_user values(?,?,?,?,?);";
	   		  pstmt = con.prepareStatement(sql);
	   		  System.out.println("insert DB접속");
	   		  
	   		  pstmt.setString(1, id);
	   		  pstmt.setString(2, pwd);
	   		  pstmt.setString(3, name);
	   		  pstmt.setInt(4, age);
	   		  pstmt.setString(5, gender);
	   		  
	   		  n = pstmt.executeUpdate();
	   	  } catch (ClassNotFoundException ce) {
	   		  System.out.println(ce.getMessage());
	   	  } catch (SQLException se) {
	   		  System.out.println(se.getMessage());
	   	  } finally {
	   		  try {
	   			  
	   			  if (pstmt != null)
	   				  pstmt.close();
	   			  
	   			  if (con != null)
	   				  con.close();
	   			  
	   		  } catch (SQLException se) {
	   			  System.out.println(se.getMessage());
	   		  }
   	  		}
      
   	  
	   	  if (n > 0) {
	   		response.sendRedirect("index.jsp");
	   	  } else {
	   		response.sendRedirect("loginFail.jsp");
	   	  }
   	  
     } else {
    	 //비밀번호 일치하지 않는 경우
    	 response.sendRedirect("loginFail.jsp");
	 } 
     
   %>
</body>
</html>