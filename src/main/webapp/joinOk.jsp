<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pack.user.UserDAO" %>
<%@page import="pack.user.UserDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<%
	  request.setCharacterEncoding("UTF-8");
	  String id = request.getParameter("id");
	  String pwd = request.getParameter("pwd");
	  String pwdc = request.getParameter("pwdc");
	  String name = request.getParameter("name");
	  int age = Integer.parseInt(request.getParameter("age"));
	  String gender = request.getParameter("gender");
	  
	  UserDTO user = null;
	  UserDTO joinUser = new UserDTO(id, pwd, name, age, gender);
	  UserDAO userDAO = new UserDAO();
	  
	  try {		  	
		  	user = userDAO.findUser(joinUser);
		  	//이미 존재하는 아이디입니다.
		  	if (user != null) {
		  		response.sendRedirect("loginFail.jsp");
		  	}
	  
	  		else if (pwd.equals(pwdc)){
		  		try{
		  			userDAO.join(joinUser);
		  			System.out.println(joinUser.getId());
		  			System.out.println(joinUser.getPwd());
		  			System.out.println(joinUser.getName());
		  			System.out.println(joinUser.getAge());
		  			System.out.println(joinUser.getGender());
		  			response.sendRedirect("login.jsp");
		  		}catch (Exception e){
		  			response.sendRedirect("join.jsp");
		  		}
		  	}else{
		  		//비밀번호 일치하지 않는 경우
		    	response.sendRedirect("loginFail.jsp");
		  	}
	  }
	  catch(Exception e){
		  response.sendRedirect("index.jsp");
	  }
   %>
   
</body>
</html>