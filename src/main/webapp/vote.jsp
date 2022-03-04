<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<body>
	<div id="wrap">
		<h1>투표하기</h1>
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
			<button onclick="location.href='index.jsp'" id = "main">메인</button>
			
			
		</div>

	</div>



</body>
</html>