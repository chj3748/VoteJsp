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
<title>회원가입</title>
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

.input{
	width: 60%;
	height: 40px;
    border: none;
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    transition: 0.25s;
    margin: 10px;
    font-size: 20px;
    opacity: 70%;
}

.pass{
	font-family:none;
}

.input::placeholder {
	font-family: 'BMKIRANGHAERANG';
	text-align: center;
}

.inputBtn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 10px 25px;
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 300;
    transition: 0.25s;
    margin: 20px;
    font-size: 20px;
    background-color: #F5C836;
    width: 100px;
}

.inputBtn-outline:hover {
    background-color: #fce205;
    color: #6e6e6e;
}

.inputBtn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.radio{
	color: white;
	font-size: 20px;
}

span{
	font-size: 70px;
}
</style>
</head>
<body>
   <div
      style="width: 30%; height: 400px; margin-top: 40px; margin-left: 34%; text-align: center; padding-top: 5%; border-radius: 30px;">
      <p style="font-size: 30px; color: #ffffff; margin: 0px;">
         <span> 회원가입 </span>
      </p>
      <div style="padding-bottom: 50px; margin-top: 30px;">
         <form method="post" action="joinOk.jsp" style="text-align: -webkit-center;">
            <fieldset id="regbox" style="text-align: center; border: none;">
               <input class="input input_id" type="text" name="id" required="true" maxlength="20" title="공백 제외한 20자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="아이디를 입력해주세요." /> <br /> 
               <input class="input input_pw pass" type="password" name="pwd" required="true" maxlength="20" title="20자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="비밀번호를 입력해주세요." /><br />
               <input class="input input_pwc pass" type="password" name="pwdc" required="true" maxlength="20" title="20자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="비밀번호를 한번 더 입력해주세요." /><br /> 
               <input class="input input_name" type="name" name="name" required="true" maxlength="10" title="공백 제외한 10자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="이름을 입력해주세요" /><br />
               <input class="input input_age" type="number" name="age" pattern="^[0-9]$" title="지정된 양식을 지켜주세요." required="true" placeholder="나이를 입력해주세요" /><br />
               
	            <label class="radio"><input type="radio" name="gender" value="male">Male</label>
				<label class="radio"><input type="radio" name="gender" value="female">Female</label><br/>
               <button class="inputBtn" type="submit" value="가입">가입</button>
               <button class="inputBtn" type="reset" value="취소">취소</button>
            </fieldset>
         </form>
      </div>
   </div>
   
</body>
</html>