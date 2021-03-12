<%@page import="java.io.PrintWriter"%>
<%@page import="health.HealthVo"%>
<%@page import="health.HealthDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<link href="css/styles.css" rel="stylesheet" />
<head>
<link rel="shortcut icon" href="favicon.ico">
<%
String userID = request.getParameter("ID");
if(session.getAttribute("ID") != null){
	userID= (String) session.getAttribute("ID");
}
if (userID == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인이 필요한 서비스입니다.')");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
}

if (userID.equals("admin") == false ){
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('잘못된 접근입니다.')");
script.println("location.href = 'main.jsp'");
script.println("</script>");
}

%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

<script>
    function idDelete(delID){
     if (confirm("정말 삭제하시겠습니까?"))
        location.href = "delete.jsp?name=" + delID;               
    }
    
    function idModify(modiID){
           location.href = "modify.jsp?name=" + modiID;               
       }
</script>

<title>회원검색 및 수정</title>

<style>
h2 {
	text-align: center;
	margin-top: 30px;
}
</style>

</head>
<body>
	<div>
		<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="main.jsp"> Zym &
					Fitness</a>
				
			</div>
		</nav>
	</div>
	<br>
	<br>
	<br>


	<h2>관리자 페이지</h2>

	<br>
	<form class="row row-cols-lg-auto g-3 align-items-center" style = "float: right; margin-right:30px">
<div class="input-group mb-3">
  
  <input type="text" class="form-control" placeholder="검색어 입력" 
  aria-label="Recipient's username" aria-describedby="basic-addon2" id="myInput">
  <div class="input-group-append">
    <button class="btn btn-primary" type="submit">검색</button>
  </div>
  
</div>
</form>
	<br>
	<table class="table"
		style="text-align: center; border: 1px solid #ddddd">
		<thead>
			<tr>
				<th style="background-color: #fafafa; text-align: center;">이름</th>
				<th style="background-color: #fafafa; text-align: center;">이메일</th>
				<th style="background-color: #fafafa; text-align: center;">전화번호</th>
				<th style="background-color: #fafafa; text-align: center;">성별</th>
				<th style="background-color: #fafafa; text-align: center;">수강과목</th>
				<th style="background-color: #fafafa; text-align: center;">예약날짜</th>
				<th style="background-color: #fafafa; text-align: center;">수정</th>
				<th style="background-color: #fafafa; text-align: center;">삭제</th>


			</tr>
		</thead>
		<%
		List<HealthVo> list = HealthDao.selectAll();
		for (int i = 0; i < list.size(); i++) {
			HealthVo health = list.get(i);
		%>
		<tbody id="myTable">
		<tr>
			<td><%=health.getName()%></td>
			<td><%=health.getEmail()%></td>
			<td><%=health.getTel()%></td>
			<td><%=health.getGender()%></td>
			<td><%=health.getLecture()%></td>
			<td><%=health.getDate()%></td>
			<td>
				<button onclick="idModify('<%=health.getName() %>');" type="button" class="btn btn-outline-success">수정</button>
			</td>
			<td>
				<button onclick="idDelete('<%=health.getName() %>');" type="button" class="btn btn-outline-danger">삭제</button>
			</td>
			
		</tr>
		<%
		}
		%>

	</table>
	<a href="join.html">예약하기</a>
</body>
</html>