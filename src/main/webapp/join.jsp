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
<title>ȸ������</title>
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
         <span> ȸ������ </span>
      </p>
      <div style="padding-bottom: 50px; margin-top: 50px;">
         <form method="post" action="joinOk.jsp" style="text-align: -webkit-center;">
            <fieldset id="regbox" style="text-align: center; border: none;">
               <input class="input input_id" type="text" name="id" required="true" maxlength="20" title="���� ������ 20�� �̸����� �ۼ����ּ���." pattern="^[\S]+$" placeholder="���̵� �Է����ּ���." /> <br /> 
               <input class="input input_pw" type="password" name="pwd" required="true" maxlength="20" title="20�� �̸����� �ۼ����ּ���." pattern="^[\S]+$" placeholder="��й�ȣ�� �Է����ּ���." /><br />
               <input class="input input_pwc" type="password" name="pwdc" required="true" maxlength="20" title="20�� �̸����� �ۼ����ּ���." pattern="^[\S]+$" placeholder="��й�ȣ�� �ѹ� �� �Է����ּ���." /><br /> 
               <input class="input input_name" type="name" name="name" required="true" maxlength="10" title="���� ������ 10�� �̸����� �ۼ����ּ���." pattern="^[\S]+$" placeholder="�̸��� �Է����ּ���" /><br />
               <input class="input input_age" type="number" name="age" pattern="^[0-9]$" title="������ ����� �����ּ���." required="true" placeholder="���̸� �Է����ּ���" /><br />
               
	            <label><input type="radio" name="gender" value="male">Male</label>
				<label><input type="radio" name="gender" value="female">Female</label><br/>
               <button class="inputBtn" type="submit" value="����">����</button>
               <button class="inputBtn" type="reset" value="���">���</button>
            </fieldset>
         </form>
      </div>
   </div>
   
</body>
</html>