<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야식전쟁 - 로그인</title>
<style>
	input {
		height:40px;
		border: 0px;
		border-radius: 4px;
	}
	button {
		border: 0px;
		border-radius: 4px;
		background-color : #fa0050;
		height : 40px;
		width : 80px;
		color: #ffffff;
	}
	button:hover{
			background-color : #f03e7c;
	}
</style>
</head>
<body>
<!-- 로그인 유저이면 다시 인덱스페이지로 -->
<%
 if (session.getAttribute("userId") != null){
	 response.sendRedirect("index.jsp");
 }
%>
<div
      style="width: 30%; height: 400px; margin-top: 80px; margin-left: 34%; background-color: #fa0050; text-align: center; padding-top: 5%; border-radius: 30px;">
      <p style="font-size: 30px; color: #ffffff; margin: 0px;">
         <span> 로그인 </span>
      </p>
      <div style="padding-bottom: 50px; margin-top: 50px;">
         <form method="post" action="loginOk.jsp" style="text-align: -webkit-center;">
            <fieldset id="regbox" style="text-align: center; border: none;">
               <input class="input input_id" type="text" name="id" required="true" maxlength="20" title="공백 제외한 20자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="아이디를 입력해주세요." /> <br /> 
               <input class="input input_pw" type="password" name="password" required="true" maxlength="20" title="20자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="비밀번호를 입력해주세요." style="margin-top:40px; margin-bottom:40px;" /><br />
               <button class="inputBtn" type="submit" value="로그인">로그인</button>
            </fieldset>
         </form>
      </div>

         <a href="index.jsp" style="color:black; text-decoration:none;"><span> 홈으로 </span></a>

   </div>
</body>
</html>