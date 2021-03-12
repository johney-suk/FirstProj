<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- meta 선언 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- link 선언 -->
<link rel="stylesheet" href="./css/style_login.css">
<!-- script 선언 -->
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="../js/script.js"></script>
<title>관리자 로그인</title>
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />

</head>
<body>

	<div>
		<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="main.jsp"> Zym
					& Fitness</a>


			</div>
		</nav>
	</div>
<% 
String ID = request.getParameter("ID");
	if(session.getAttribute("ID") != null){
		ID= (String) session.getAttribute("ID");
	}
if (ID != null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 로그인되어있습니다.')");
	script.println("location.href = 'main.jsp'");
	script.println("</script>");
}
%>
	<div class="login_containers">
		<h2>로그인</h2>
		<form method="post" action="login_action.jsp">
			<h3>아이디</h3>
			<div class="loginID">
				<input type="text" class="input" placeholder="아이디" name="ID"
					maxlength="20">
			</div>
			<h3>비밀번호</h3>
			<div class="loginPassword">
				<input type="password" class="input" placeholder="비밀번호"
					name="PW" maxlength="20">
			</div>
			<input type="submit" class="bt_login" value="로그인">
		</form>
	</div>

</body>
</html>

