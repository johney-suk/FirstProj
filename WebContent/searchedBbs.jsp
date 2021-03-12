<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<link href="css/styles.css" rel="stylesheet" />
<title>검색</title>
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
		System.out.println("pageNumber=" + pageNumber);
	}
	String searchWord = null;
	if (request.getParameter("searchWord") != null) {
		searchWord = (String) request.getParameter("searchWord");
		System.out.println("searchword from parameter is :" + searchWord);
	}
	if (session.getAttribute("searchWord") != null) {
		searchWord = (String) session.getAttribute("searchWord");
		System.out.println("searchword from session is :" + searchWord);
	}
	%>

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

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<div class="input-group mb-3">

						<input type="text" class="form-control" placeholder="검색어 입력"
							aria-label="Recipient's username" aria-describedby="basic-addon2"
							id="myInput" name="searchWord">
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit">검색</button>
						</div>

					</div>
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
					//System.out.println("here before getlist");
					ArrayList<Bbs> list = bbsDAO.getSearchedList(pageNumber, searchWord);
					//System.out.println("here after getlist" + list.get(0).getBbsDate().substring(0,11));
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getBbsID()%></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;")
		.replaceAll("\n", "<br>")%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
		+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
					</tr>
					<%
					}
					%>

				</tbody>
			</table>

		

		</div>
	</div>
	<script src="js/bootstrap.js"></script>
</body>
</html>