<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	//session.setAttribute("userId", "ahhyun");
	if(session.getAttribute("userId") != null){
		//String id = new String("ahhyun");
		String id = (String)session.getAttribute("userId");
		String menu[] = request.getParameterValues("menu");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // DB연결 객체 생성
			Connection con = DriverManager.getConnection("jdbc:mysql://13.209.88.99:3306/jsp", "aws", "1234");
			
			Statement stmt = con.createStatement();
			ResultSet rs=stmt.executeQuery("select id from vote_user where id='"+id+"'");
			//데이터베이스에 동일한 번호가 있는지 확인
			if(rs.next()) {
				ResultSet rs2=stmt.executeQuery("select voter from vote_result where voter='"+id+"'");
				if(rs2.next()){
%>
				<script>
					alert("이미 투표를 완료했습니다."); 
					history.go(-1);
				</script>
				
		

<% 				
				
				response.sendRedirect("./yeunsung_resultpage.jsp");
			}else{

				stmt.executeUpdate("insert into vote_result (voter, candidate) values ('"+id+"', '"+menu[0]+"')");	
			
%>
			
			<span>기록되었습니다.</span>
			<h1><%=id %></h1>
			<h1><%=menu[0] %></h1>
			 
			
<%	
			response.sendRedirect("./yeunsung_resultpage.jsp");
			}
		}
		else{
%>
	
			<script>
				alert("존재하지 않는 ID입니다."); // 
				history.go(-1);
			</script>
		
	
	<%
		
	}
		stmt.close();
		con.close();
	} catch (Exception e) {
		out.println(e);
	}
	}else{
		
	%>
	
			<script>
				alert("로그인 해주세요"); // 
				history.go(-1);
			</script>
	
	<%
		
	}
	%>



	


	

</body>
</html>