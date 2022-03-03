<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>



<body>
<%

%>
<div align="center">
<br />
<h2>투표 결과</h2>

<table border="1" width="400">
	<tr>
		<td colspan="3"><b>총 투표자 : </b></td>
		<td width="40"><b>count(%)</b></td>
	</tr>
	
	<tr>
	
		<td width="20" align="center"><%=i+1%></td>
		
		<td width="120" align="center">
			<%if(maxCnt==count){ %>
			<font color="red"><b> 
			<%}%>
			
			<%=item[0]%>
			<%if(maxCnt==count){ %>
					</b></font> 
			<%}%>
		</td>
		
		<td>
			<table width="<%=ratio%>">
				<tr>
					<td bgcolor="<%=rgb%>" height="15"></td>
				</tr>
			</table>	
				
		</td>
		
		<td width="40" align="center"><%=count%>(<%=ratio%>)</td>
	</tr>
</table>
		
		
		
</body>


</html>