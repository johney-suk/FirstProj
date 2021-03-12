<%@page import="health.HealthDao"%>
<%@page import="health.HealthVo"%>
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

<script>
$(function() {
	$('form').submit(function() {

		this.action = "modify_ok.jsp";
		this.method = "GET";
		this.submit();
		alert("저장되었습니다.");
	});
});
</script>
<style>
h2 {
	text-align: center;
	margin-top: 30px;
}
</style>
<title>Insert title here</title>

</head>
<body>
<h2> 고객정보 수정 </h2>
<%
String name = request.getParameter("name");
HealthVo member = HealthDao.selectOne(new HealthVo(name));
%>
<form>
	<div class="container-lg">
		<div class="row gx-5">
			<div class="col">
				<div class="p-3 border bg-light">
						<div class="mb-3">
							<label for="name" class="form-label">이름</label> <input
								type="text" class="form-control" name="name" value="<%=member.getName() %>">
						</div>

						<label for="enail" class="form-label">이메일</label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" name="email"
								placeholder="id@xxx.xxx" aria-label="Username" name="email" value="<%=member.getEmail() %>">

						</div>

						<div class="mb-3">
							<label for="phone" class="form-label">전화번호</label> <input
								type="text" class="form-control" name="tel"
								aria-describedby="namebox" name="email" value="<%=member.getTel() %>">
						</div>
						<label for="name" class="form-label">성별</label>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="gender" id="flexRadioDefault1" value="MAN"> <label
								class="form-check-label" for="flexRadioDefault1"> 남자 </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="gender" id="flexRadioDefault2" value="WOMAN" checked>
							<label class="form-check-label" for="flexRadioDefault2">
								여자 </label>
						</div>
						<br>
						<div class="col-md-4">
							<label for="class" class="form-label">수강 과목<br></label> <label
								for="inputState" class="form-label"></label> <select
								id="inputState" class="form-select" name="lecture">
								<option selected >Choose...</option>
								<option value="ZUMBA">줌바</option>
								<option value="AEROBIC" >에어로빅</option>
								<option value="SPINNING">스피닝</option>
								<option value="HEALTH" >헬스</option>

							</select>
						</div>
						<br>
						<div class="mb-3">
							<label for="reservation" class="form-label">예약 날짜</label> <input
								type='date' name="date" name="email" value="<%=member.getDate() %>"/><br>
						</div>



						<div class="submit">
							<button type="submit" class="btn btn-primary" id=sumbmitBtn>저장</button>
						</div>


				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>