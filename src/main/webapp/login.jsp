<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야식전쟁 - 로그인</title>
<style>
@font-face {
	font-family: 'BMKIRANGHAERANG';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMKIRANGHAERANG.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'BMKIRANGHAERANG';
	text-align: center;
}

body {
	background: url(img/night.jpg) no-repeat;
	background-size: 100%;
	position: relative;
}

.input {
	width: 60%;
	height: 40px;
	display: inline-block;
	border: none;
	border-radius: 15px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	transition: 0.25s;
	font-size: 20px;
	opacity: 70%;
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
	margin-bottom: 3px;
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

.title {
	font-size: 60px;
}

.tohome {
	font-size: 20px;
}
</style>
</head>
<body>
	<!-- 로그인 유저이면 다시 인덱스페이지로 -->
	<%
	if (session.getAttribute("userId") != null) {
		response.sendRedirect("index.jsp");
	}
	%>
	<div
		style="width: 30%; height: 400px; margin-top: 80px; margin-left: 34%; text-align: center; padding-top: 5%; border-radius: 30px;">
		<p style="font-size: 30px; color: #ffffff; margin: 0px;">
			<span class="title"> 로그인 </span>
		</p>
		<div style="padding-bottom: 50px; margin-top: 50px;">
			<form method="post" action="loginOk.jsp"
				style="text-align: -webkit-center;">
				<fieldset id="regbox" style="text-align: center; border: none;">
					<input class="input input_id" type="text" name="id" required="true"
						maxlength="20" title="공백 제외한 20자 미만으로 작성해주세요." pattern="^[\S]+$"
						placeholder="아이디를 입력해주세요." /> <br /> <input
						class="input input_pw" type="password" name="password"
						required="true" maxlength="20" title="20자 미만으로 작성해주세요."
						pattern="^[\S]+$" placeholder="비밀번호를 입력해주세요."
						style="margin-top: 40px; margin-bottom: 40px; font-family: none;" /><br />
					<button class="inputBtn" type="submit" value="로그인">확인</button>
				</fieldset>
			</form>
		</div>

		<a href="index.jsp" style="color: white; text-decoration: none;"><span
			class="tohome"> 홈으로 </span></a>

	</div>
</body>
</html>