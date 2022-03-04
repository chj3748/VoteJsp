<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>



<body>
<h2>투표 결과</h2>
<%
	String id2 = "hojin";
	Connection con = null;
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver"); // DB연결 객체 생성
		con = DriverManager.getConnection("jdbc:mysql://13.209.88.99:3306/jsp?useUnicode=true", "aws", "1234");
		out.println("Database 접속완료");
		PreparedStatement pstmt = con.prepareStatement("select * from vote_user");
		ResultSet rs=pstmt.executeQuery();
		
		%>
        <table border="1" width="200">

       <%
       while (rs.next()) {

           String id = rs.getString("id");
           String pwd = rs.getString("password");
           String name = rs.getString("name");
           int age = rs.getInt("age");
           String gender = rs.getString("sex");
           
        %>

           <tr>
              <td><%= id %></td>
              <td><%= name %></td>
           </tr>

       <%
              }
       %>

          </table>
           
        <%
	}catch (SQLException | ClassNotFoundException e) {
		out.println("Database접속불가");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>

<%-- <table border="1" width="400">
	<tr>
		<td colspan="3"><b>총 투표자 : </b></td>
		<td width="40"><b>count(%)</b></td>
	</tr>
	
	<tr>
	
		<td width="20" align="center"><%=i+1%></td>
		
		<td width="120" align="center">
			<%if(maxCnt==count){ %>
			<font color="red"><b> 
			<%}%>
			
			<%=item[0]%>
			<%if(maxCnt==count){ %>
					</b></font> 
			<%}%>
		</td>
		
		<td>
			<table width="<%=ratio%>">
				<tr>
					<td bgcolor="<%=rgb%>" height="15"></td>
				</tr>
			</table>	
				
		</td>
		
		<td width="40" align="center"><%=count%>(<%=ratio%>)</td>
	</tr>
</table> --%>
		
		
		
</body>


</html>


