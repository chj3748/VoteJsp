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
<%@page import="java.util.*" %>
<!DOCTYPE html>
<%
	Random r= new Random();
%>

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
<%
		Set<String> voteResultKey= voteResult.keySet();
		int sumCount=0;
		for(int i =0;i<voteResultKey.length; i++){
			int count = voteResult.get(voteResultKey[i]);
			sumCount=sumCount+count;
		}
			

	%>
	<table border="1" width="400">
	<tr>
		<td colspan="3"><b><%="총 투표자 :" + sumCount %> </b></td>
		<td width="40"><b><%="득표수"%></b></td>
	</tr>
	

	<%
		for(int i =0;i<voteResultKey.length; i++){	
			String rgb = "#"+Integer.toHexString(r.nextInt(255*255*255));
			int count = voteResult.get(voteResultKey[i]);
			int ratio = new Double(Math.round((double) count/sumCount*100)).intValue();

	%>
	<tr>
		<td width="20" align = "center"><%=i+1%></td>
		
		<td width="120" align = "center"><%=voteResultKey[i] %>
		<td>
		
			<table width="<%=ratio%>"> 
				<tr> 
					<td bgcolor="<%=rgb%>" height = "15"></td> 
				</tr> 
			</table>

		</td>
		
		<td><%=voteResult.get(voteResultKey[i]) %>
		
	</tr>
	<% } %>
	</table>

<!-- for (Object key : urlsMap.keySet()) {
      urlsMap.get(key);
  }
	 -->


		
		
</body>


</html>


