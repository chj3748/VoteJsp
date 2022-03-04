<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.time.LocalTime" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
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

h3{
	color: #59f536;

}

h3 span{
	color: #59f536;
}

h4{
	color: #fff;

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

#main{
	background-color:#F5C836; 
	font-size: 15px;
	width: 50px;
	height: 30px;
	margin-top: 50px;
}
</style>

</head>

<% 
//현재 시간
LocalTime now = LocalTime.now();
//현재시간 출력
System.out.println(now); // 06:20:57.008731300
//포맷 정의하기
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH시 mm분 ss초");
//포맷 적용하기
String formatedNow = now.format(formatter);
//포맷 적용된 현재 시간 출력
System.out.println(formatedNow); // 06시 20분 57초




%>

<body>
	<div id="wrap">
		<h1>투표하기</h1>
		<h3>종료 시간: <span>PM 6</span> </h3>
		<h4>현재 시간: <%=date %> </h4>
		<div id="vote_wrap">
			<fieldset>
				<legend>야식 메뉴</legend>
				<form action="radioResult.jsp">
					<div class="option">
						<label> 치킨 🍗: <input type="radio" name="menu" value="치킨"
							checked="checked">
						</label>
					</div>

					<div class="option">
						<label> 피자 🍕: <input type="radio" name="menu" value="피자">
						</label>

					</div>

					<div class="option">
						<label> 분식 🍙: <input type="radio" name="menu" value="분식">
						</label>
					</div>

					<div class="option">
						<label> 회 🍣 :<input type="radio" name="menu" value="회">
						</label>
					</div>

					<div class="option">
						<label> 닭발 🐔: <input type="radio" name="menu" value="닭발">
						</label>
					</div>

					<div class="option">
						<label> 곱창 🐷🐮: <input type="radio" name="menu" value="곱창">
						</label>
					</div>
					<input type="submit" value="전송" id = "button">
				</form>
				
			</fieldset>
			
			<%
				
			%>
			<button onclick="location.href='index.jsp'" id = "main">메인</button>
			
			
		</div>

	</div>



</body>
</html>