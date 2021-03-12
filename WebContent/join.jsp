<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="shortcut icon" href="favicon.ico">
<%
/* String userID = null;
 if(session.getAttribute("ID") != null){
	userID= (String) session.getAttribute("ID");
}

if (userID == null ){
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('로그인먼저하셈.')");
script.println("location.href = 'main.jsp'");
script.println("</script>");
} */
%>
<style>
.container-lg {
	margin-top: 30px;
}

h2 {
	text-align: center;
}

.submit {
	margin-top: 20px;
	text-align: center;
}
</style>


<title>예약 등록</title>
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
	<br>
	<div class="container-lg">
		<div class="row gx-5">
			<div class="col">
				<div class="p-3 border bg-light">
					<h2>예약 등록</h2>

					<form method="POST" action="join_ok.jsp">


						<div class="mb-3">
							<label for="name" class="form-label">이름</label> 
							<input type="text" class="form-control" name="name">
						</div>

						<label for="email" class="form-label">이메일</label>
						<div class="input-group mb-3">
							<input type="email" class="form-control" name="email"
								placeholder="id@xxx.xxx" aria-label="Username">

						</div>

						<div class="mb-3">
							<label for="phone" class="form-label">전화번호</label> <input
								type="text" class="form-control" name="tel"
								aria-describedby="namebox" value="010-">
						</div>
						<label for="name" class="form-label">성별</label>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender"
								id="flexRadioDefault1" value="MAN"> <label
								class="form-check-label" for="flexRadioDefault1"> 남자 </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender"
								id="flexRadioDefault2" value="WOMAN" checked> <label
								class="form-check-label" for="flexRadioDefault2"> 여자 </label>
						</div>
						<br>
						<div class="col-md-4">
							<label for="class" class="form-label">수강 과목<br></label> <label
								for="inputState" class="form-label"></label> <select
								id="inputState" class="form-select" name="lecture">
								<option selected>Choose...</option>
								<option value="ZUMBA">줌바</option>
								<option value="AEROBIC">에어로빅</option>
								<option value="SPINNING">스피닝</option>
								<option value="HEALTH">헬스</option>

							</select>
						</div>
						<br>
						<div class="mb-3">
							<label for="reservation" class="form-label">예약 날짜</label> <input
								type='date' name="date" /><br>
						</div>



						<div class="submit">
							<button type="submit" class="btn btn-primary" id=sumbmitBtn>등록</button>
						</div>

					</form>


				</div>
			</div>
		</div>
	</div>

	<script>
		//	$(function() {
		//		$('form').submit(function() {
		//		
		//	this.action = "join_ok.jsp";
		//this.method ="POST";
		//this.submit();
		//alert("예약 완료");

		//});
		//});
	</script>
</body>
</html>