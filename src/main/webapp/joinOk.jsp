<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>hello</h1>
	<% 			 
	  String id = request.getParameter("id");
	  String pwd = request.getParameter("pwd");
	  String pwdc = request.getParameter("pwdc");
	  String name = request.getParameter("name");
	  String age = request.getParameter("age");
	  String gender = request.getParameter("gender");
	  
	  System.out.println(id+pwd+ pwdc+ name+ age+ gender);

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
  		System.out.println("중복된 아이디입니다");
    
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
	   		  pstmt.setString(4, age);
	   		  pstmt.setString(5, gender);
	   		  System.out.println(sql);
	   		  
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
      }
	  else{
	  	System.out.println("가입 실패");
	  }
   	  
   	  // 3. 사용자(클라이언트)에 결과를 응답하기.

   	  /* if (n > 0) {
		  alert('가입에 성공했습니다')
   	  } else {
		  "<h3 style=\"font-size: 20; text-align:center; \">가입에 실패했습니다.</h3>"+
		  "<a href='javascript:history.go(-1)' style=\"display:block; width:100%; color: black; font-size: 20; text-align:center \">이전페이지로 가기</a>" +

   	  }
     } else {
		  "<h3 style=\"font-size: 20; text-align:center; \">비밀번호가 일치하지 않습니다.</h3>"+
		  "<a href='javascript:history.go(-1)' style=\"display:block; width:100%; color: black; font-size: 20; text-align:center \">이전페이지로 가기</a>" +
     	} 
     } */
   %>
</body>
</html>