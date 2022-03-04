<%@page import="poll.PollItemBean"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Vector"%>
<%@page import="poll.PollListBean"%>
<%@page contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <% 
	request.setCharacterEncoding("UTF-8");
	int num=0; 
	if(request.getParameter("num")!=null){ 
		num = Integer.parseInt(request.getParameter("num")); 
		}
	PollListBean plbBean = mgr.getPollRead(num); //설문에 대한 값 
	Vector<PollItemBean> vlist = mgr.getView(num); 
	int sumCount = mgr.sumCount(num);
	String question = plbBean.getQuestion();//투표수 
	Random r= new Random(); //막대그래프 랜덤한 색깔 부여
%>
 --%>
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>


<body bgcolor="#FFFFCC">
<% 
	int sumCount =0;
	String question="nul";

%>
	<div align="center">
		<br />
		<h2>투표 결과</h2>
		
		<table border="1" width="400">
			<tr>
				<td colspan="4"><b>Q : <%=question%></b></td>
			</tr>
			<tr>
				<td colspan="3"><b>총 투표자 : <%=sumCount%>+<%"명+=" %></b></td>
				<td width="40"><b>count(%)</b></td>
			</tr>
			<% 
				for(int i=0; i<vlist.size(); i++)
				{ PollItemBean piBean = vlist.get(i);
				String item[] = piBean.getItem();
				int count = piBean.getCount(); 
				int ratio = new Double(Math.round((double) count/sumCount*100)).intValue(); 
				String rgb = "#"+Integer.toHexString(r.nextInt(255*255*255)); //색상수 
				int maxCnt = mgr.getMaxCount(num);
			%>
			<tr>
				<td width="20" align="center"><%=i+1%></td>
				<td width="120" align="center">
					<%if(maxCnt==count){ %><font color="red"><b> <%}%> <%=item[0]%>
							<%if(maxCnt==count){ %>
					</b></font> <%}%>
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
			<% } %>
		</table>
		
		<br /> <a href="javascript:window.close()">닫기</a>
	</div>
</body>
</html>

