<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@page import="java.util.Date"%>
<!DOCTYPE html>

<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
   div{
      text-align: center;
   
   }
   h3{
      color: #289AFE;
   
   }
   td{
      background-color: #289AFF;
      color : #ffffff;
      padding: 10px;
   
   
   }
</style>


</head>



<body bgcolor=<%="" %>>
   <div>
   <h3>  호랑이</h3>   
   </div>
   
   
   
   <form action="tiger" method="post">   
      <input type="text" name ="name" value="호랭이">
      <input type="hidden" name ="age" value="23">
      <input type="submit" value="다음단계">
   </form>

   이름1 : <input type="text"/><br/>
   
   <label>
      이름2 : <input type="text"/><br/>
   </label>

   <ol start ="1">
      <li>호랑이</li>
      <li>코끼리</li>
      <li>독수리</li>
      
   </ol>
   
   <ul>
      <li> 이름: <%="홍길동" %></li>
      <li> 코끼리 </li>
   </ul>

   <a href = "a.jsp"> ex1 </a><br>
   <a href = "dog/b.jsp"> ex2 </a><br>
   <a href = "dog/cat/c.jsp"> ex3 </a><br>
   <!-- 클라이언트에서 서버로 데이터를 날린다.  -->
   <a href ="a.jsp?nickName=why"> ex4</a><br>
   
   <% String str ="lion"; %>
   <a href ="a.jsp?nickName= <%= str %>">ex5</a><br>

   <a href ="a.jsp?nickName=tiger&age=30 ">ex6</a><br>
   <a href ="http://www.daum.net ">daum으로 가기</a><br>

   <form action="dog/b.jsp">   
      <input type="text" name ="nickName" value="banana">
      <input type="hidden" name ="age" value="23">
      <input type="submit" value="다음단계">
   </form>
   
   <%String data ="orange"; %>
   <form action="dog/b.jsp">   
      <input type="text" name ="nickName" value=<%=data %>>
      <input type="hidden" name ="age" value="30">
      <input type="submit" value="다음단계">
   </form>

   <a href ="index.jsp ">새로고침</a><br>


   </body>
   


</html>

<%-- //jstl 예제 
<c:forEach var="i" begin="1" end="10">
      ${i}
   </c:forEach>
    --%>
    
    
<%-- <%
      for(int i =0;i<10;i++){
         out.println("<a href=a.jsp?num=" +i +"> ["+i+"] </a>");          
      }
   %> --%>
   
<!-- <FORM METHOD=POST action= "testPage.jsp">
      <table>
         <tr>
            <td colspan="3">회원가입</td>
         </tr>
         <tr>
            <td>아이디</td>
            <td><input type ="text" name="tiger"></td>
            <td>아이디를 적어주세요</td>
         </tr>
         <tr>
            <td>패스워드</td>
            <td><input type ="text" name ="pass"></td>
            <td>패스워드를 적어주세요</td>
         </tr>
         <tr>
         <td colspan ="3"><input type ="submit" value="가입"></td>
         </tr>
      </table>
   </FORM> -->
   
<%--    <%
      Date date = new java.util.Date();
   %>
   <%= date +"<br/>"%>
    --%>

<!--    <fieldset>
      <legend>제목</legend>
      <FORM METHOD =POST action="testPage.jsp">
         <INPUT TYPE="text" NAME ="name" VALUE="apple"><p>
         <INPUT TYPE="submit" VALUE="전송"><p>         
      </FORM>
   </fieldset> -->

<%--    <table border ="1" width="1000">
   <th> 구구단 </th>
   <%
      for(int i=1;i<10;i++){

         out.println("<tr>");
         for(int j=2;j<10;j++){
            out.println("<td>");
            out.println(j);
            out.println("X");
            out.println(i);
            out.println("=");
            out.println(i*j);
            out.println("</td>");
         }
         out.println("</tr>");

      }
   %> --%>

<!--    <select name ="color">
      <option value ="red">빨강</option>
      <option value ="green">초록</option>
      <option value ="blue">파랑</option>
   </select> -->
   
<!--    <button>버튼1</button><br/>
   <hr/>
   <button>버튼1</button><br/>
   <input type = "text" value= "뭐 써봐"/><br/>
   <input type = "submit" value= "전송"/><br/>
   
   <input type="button" value ="버튼임 이거"><br/>
   <input type="checkbox"><br/>
   <input type="color"><br/>
   
   <input type="date"><br/>
   <input type="datetime-local"><br/>
   
   <input type="email"><br/>
   
   <input type="file"><br/>
   <input type="hidden"><br/>
   
   <input type="image"><br/>
   
   <input type="month"><br/>
   <input type="number"><br/>
   <input type="password"><br/>
   
   <input type="radio"><br/>
   <input type="range"><br/>
   <input type="reset"><br/>
   <input type="search"><br/>
   <input type="submit"><br/>
   <input type="tel"><br/>
   <input type="text"><br/>
   <input type="time"><br/>
   <input type="url"><br/>
   <input type="week"><br/>
    -->
<%--    <table border="1" width ="200">
      <%
         for(int i=0; i<name.length;i++){            
      %>
      
         <tr>
            <td> <%=i*100 %> </td>
            <td><%=name[i]%></td>
         </tr>
         
      <% 
         }
      %>
   </table> --%>

<%-- <%
      int num=10;
      String s = "Apple";
      out.println(num + "</br>");  
      out.println(s);
   %> --%>
   