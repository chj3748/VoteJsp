<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<style>
.input{
	width: 60%;
}
</style>
</head>
<body>
   <div
      style="width: 30%; height: 400px; margin-top: 80px; margin-left: 34%; background-color: #fa0050; text-align: center; padding-top: 5%; border-radius: 30px;">
      <p style="font-size: 30px; color: #ffffff; margin: 0px;">
         <span> 회원가입 </span>
      </p>
      <div style="padding-bottom: 50px; margin-top: 50px;">
         <form method="post" action="joinOk.jsp" style="text-align: -webkit-center;">
            <fieldset id="regbox" style="text-align: center; border: none;">
               <input class="input input_id" type="text" name="id" required="true" maxlength="20" title="공백 제외한 20자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="아이디를 입력해주세요." /> <br /> 
               <input class="input input_pw" type="password" name="pwd" required="true" maxlength="20" title="20자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="비밀번호를 입력해주세요." /><br />
               <input class="input input_pwc" type="password" name="pwdc" required="true" maxlength="20" title="20자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="비밀번호를 한번 더 입력해주세요." /><br /> 
               <input class="input input_name" type="name" name="name" required="true" maxlength="10" title="공백 제외한 10자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="이름을 입력해주세요" /><br />
               <input class="input input_age" type="number" name="age" pattern="^[0-9]$" title="지정된 양식을 지켜주세요." required="true" placeholder="나이를 입력해주세요" /><br />
               
	            <label><input type="radio" name="gender" value="male">Male</label>
				<label><input type="radio" name="gender" value="female">Female</label><br/>
               <button class="inputBtn" type="submit" value="가입">가입</button>
               <button class="inputBtn" type="reset" value="취소">취소</button>
            </fieldset>
         </form>
      </div>
   </div>
   
</body>
</html>