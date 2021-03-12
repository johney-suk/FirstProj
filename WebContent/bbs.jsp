<%@page import="bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bbs.Bbs"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">

<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>
	<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<link href="css/styles.css" rel="stylesheet" />
<title>리뷰 게시판</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body>
	<%
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	<script type="text/javascript">
		var a =
	<%=pageNumber%>
		console.log(a);
	</script>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="main.jsp">Zym &
				Fitness</a>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<!-- 게시판 -->
	<form method="post" action="searchedBbs.jsp" class="row row-cols-lg-auto g-3 align-items-center" style = "float: right; margin-right:30px">
<div class="input-group mb-3">

  <input type="text" class="form-control" placeholder="검색어 입력" 
  aria-label="Recipient's username" aria-describedby="basic-addon2" id="myInput" name="searchWord">
  <div class="input-group-append">
    <button class="btn btn-primary" type="submit">검색</button>
  </div>
  
</div>
	</form>
	<br>
	<br>
	<br>


	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for (int i = 0; i < list.size(); i++) {
					%>

					<tr>

						<td><%=list.get(i).getBbsID()%></td>

						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>

						<td><%=list.get(i).getUserID()%></td>

						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"

		+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
					</tr>

					<%
					}
					%>

				</tbody>

			</table>
			<!-- 페이지 넘기기 -->

			<%
			if (pageNumber != 1) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arrow-left" style="width: 10%;">이전</a>
			<%
			}
			if (bbsDAO.nextPage(pageNumber)) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arrow-left" style="width: 10%;">다음</a>
			<%
			}
			%>

			<a href="write.jsp" class="btn btn-primary pull-right"
				style="width: 10%;" style="float: right; margin-right:50px">글쓰기</a>

		</div>
	</div>
</body>
</html>