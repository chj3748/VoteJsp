<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǥ�ϱ�</title>
<style type="text/css">
@font-face {
	font-family: 'BMHANNAPro';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'BMHANNAPro';
}

#wrap {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-size: 25px;
}

#vote_wrap {
	width: 80%;
}

.option {
	margin-top: 50px;
	margin-left: 200px;
	margin-bottom: 50px;
	font-size: 20px;
}
</style>

</head>


<body>
	<div id="wrap">
		<h1>��ǥ�ϱ�</h1>
		<div id="vote_wrap">
			<fieldset>
				<legend>�߽� �޴�</legend>
				<form action="radioResult.jsp">
					<div class="option">
						<label> ġŲ :<input type="radio" name="menu" value="chicken"
							checked="checked">
						</label>
					</div>

					<div class="option">
						<label> ���� :<input type="radio" name="menu" value="pizza">
						</label>

					</div>

					<div class="option">
						<label> �н� :<input type="radio" name="menu" value="snack">
						</label>
					</div>

					<div class="option">
						<label> ȸ :<input type="radio" name="menu" value="sashimi">
						</label>
					</div>

					<div class="option">
						<label> �߹� :<input type="radio" name="menu" value="chickenfeet">
						</label>
					</div>

					<div class="option">
						<label> ��â :<input type="radio" name="menu" value="giblets">
						</label>
					</div>
					<input type="submit" value="����">
				</form>
			</fieldset>
			
			
		</div>

	</div>




	<h1>�����ϱ�</h1>


</body>
</html>