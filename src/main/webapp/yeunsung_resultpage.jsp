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

<%@page import="java.util.Set" %>
<%@page import="java.util.Random" %>

<!DOCTYPE html>
<%
	Random r= new Random();
%>

<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
   font-family: 'BMHANNAPro';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}


@font-face {
    font-family: 'BMKIRANGHAERANG';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMKIRANGHAERANG.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
   font-family: 'BMKIRANGHAERANG';
}

html{

   background-color:black;
}

#wrap {
   display: flex;
   justify-content: center;
   align-items: center;
   flex-direction: column;
   font-size: 25px;
}

h1{
   color:#F5C836;

}
table{
   color :#fff;

}
#vote_wrap {
   width: 80%;
   color:#fff;
   
}

.option {
   margin-top: 50px;
   margin-left: 200px;
   margin-bottom: 50px;
   font-size: 30px;
}

#button{
   font-size: 20px;
   width: 100px;
   height: 30px;
}
.tb{
	 border: 2px solid white; 
	 background-color: black; 
	 border-radius: 16px;
  	 box-shadow: inset 0 0 8px "ffcc99";
  	 width: 700px; 
  	 height :400px;
}
tr, td{
    border: 1px solid #ffffff;
  }
</style>
</head>



<body>
<div id = "wrap">
   <h1 >투표 결과</h1>

<%
	if(session.getAttribute("userId") == null){
		response.sendRedirect("index.jsp");
	}else{
	   String[] menus={"치킨","피자","분식","회","닭발","곱창"};
	   LinkedHashMap<String, Integer> voteResult= null;
	   VoteDAO voteDao = new VoteDAO();
	   try{
	      voteResult = voteDao.voteCnt();
	   }catch(Exception e){
	      e.printStackTrace();
	      response.sendRedirect("index.jsp");
	   }
	
	   int sumCount=0;
	   for (String key : voteResult.keySet()) {
	      int count = voteResult.get(key);
	      sumCount+= count;
	   }
	   %>
	   <table class="tb">
	   <tr>
	      <td colspan="3" width="180"><b><%="총 투표자 : "+sumCount+"명" %> </b></td>
	      <td width="60"><b><%="득표수"%></b></td>
	   </tr>
	   
	
	   <%
	   	  int i=0;
	      for (String key : voteResult.keySet()) {
	    	 i++;
	         System.out.println(i);
	         String rgb = "#"+Integer.toHexString(r.nextInt(255*255*255));
	         int count = voteResult.get(key);
	         int ratio = new Double(Math.round((double) count/sumCount*100)).intValue();
	
	   %>
	   <tr>
	      <td width="20" align = "center"><%=i%></td>
	      
	      <td width="120" align = "center"><%=key %>
	      <td>
	      
	         <table width="<%=ratio*5%>" > 
	            <tr> 
	               <td bgcolor="<%=rgb%>" height = "15" align="center" style="font-size:15px;"><%=ratio+"%" %></td> 
	            </tr> 
	         </table>
	
	      </td>
	      
	      <td><%=voteResult.get(key) %></td>
	      
	   </tr>
	   <% }
	      for(int j = 0; j < menus.length; j++) {
	    	  if(!(voteResult.containsKey(menus[j]))) {
	            i++;
       			
   %>
		      <tr>
		      <td width="20" align = "center"><%=i%></td>
		      
		      <td width="120" align = "center"><%=menus[j] %>
		      <td>
		      
		         <table width="<%=0%>"> 
		            <tr> 
		               <td bgcolor="black" height = "15"></td> 
		            </tr>
		         </table>
		
		      </td>
		      
		      <td>0</td>
		   	  </tr>
   <%
	    	  }
         }
     
   %>
   
   
   </table>
	
	<br>
	<button onclick="location.href='index.jsp'">홈으로</button>
      
   </div>
   <% 
	 }
   %>
      
</body>


</html>

