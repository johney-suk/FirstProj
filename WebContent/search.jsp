<%@page import="health.HealthVo"%>
<%@page import="health.HealthDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<h2>Filterable Table</h2>
<p>Type something in the input field to search the table for first names, last names or emails:</p>  
<input id="myInput" type="text" placeholder="Search..">
<br><br>

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
			  </tbody>
			
		<%
		}
		%>

	</table>
	<a href="join.html">회원 정보 입력</a>
</body>
</html>