<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헬스장 홈페이지</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap"
	rel="stylesheet">
<script src="js/jquery-3.5.0.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<link href="css/styles.css" rel="stylesheet" />

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

.wrap {
	width: 100%;
	height: 95px;
	position: fixed;
	left: 0;
	top: 0;
	background: #fff;
}

.header {
	width: 100%;
	height: 95px;
	border-bottom: 1px solid #d9d9d9;
}

.header .header_inner {
	width: 1280px;
	height: 95px;
	margin: 0 auto;
}

.header .header_inner h1 {
	float: left;
	width: 200px;
	height: 23px;
	background: url("imgs/logo.png") no-repeat;
	margin-top: 55px;
}

.header .header_inner h1 a {
	display: block;
	text-indent: -99999px;
}

.header .header_inner .gnb {
	float: left;
	margin-top: 55px;
	margin-left: 20px;
}

.header .header_inner .gnb>li {
	float: left;
	position: relative;
}

.header .header_inner .gnb>li>a {
	display: block;
	height: 38px;
	padding: 0 35px;
	font-weight: 600;
	font-size: 19px;
	color: #0d0d0d;
	/* border: 1px solid red; */
}

/* 2단메뉴 */
.header .header_inner .gnb>li>.depth2 {
	position: absolute;
	left: 35px;
	top: 38px;
	width: 200px;
	/* border: 1px solid red; */
	padding-top: 20px;
	display: none;
}

.header .header_inner .gnb>li>.depth2 li {
	line-height: 36px;
}

.header .header_inner .gnb>li>.depth2 li a {
	font-size: 15px;
	color: #0d0d0d;
	font-weight: 500;
}

.header .header_inner .gnb>li>.depth2 li:hover>a {
	color: #0d7ee2;
}

.header .header_inner .util_wrap {
	float: right;
	margin-top: 20px;
}

.header .header_inner .util_wrap .util {
	float: right;
}

.header .header_inner .util_wrap .util li {
	float: left;
	position: relative;
	padding: 0 15px;
}

.header .header_inner .util_wrap .util li:before {
	content: '';
	position: absolute;
	left: 0;
	top: 5px;
	width: 1px;
	height: 11px;
	background: #0d0d0d;
}

.header .header_inner .util_wrap .util li:first-child {
	padding-left: 0;
}

.header .header_inner .util_wrap .util li:first-child::before {
	display: none;
}

.header .header_inner .util_wrap .util li:last-child {
	padding-right: 0;
}

.header .header_inner .util_wrap .util li a {
	font-size: 14px;
	color: #0d0d0d;
	font-weight: bold;
}

.header .header_inner .util_wrap .box {
	clear: both;
	padding-top: 15px;
}

.header .header_inner .util_wrap .box a {
	display: inline-block;
	border: 1px solid #4d4d4d;
	font-size: 14px;
	background-color: #fff;
	color: #4d4d4d;
	line-height: 26px;
}

.header .header_inner .util_wrap .box .a_1 {
	color: #fff;
	background: #156ad1;
	border: 1px solid #156ad1;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
}

.main {
	width: 100%;
}

.main .visual {
	height: 1080px;
	background: url("imgs/scroll_bg2.jpg") no-repeat center top;
}
</style>
</head>
<body>
	<%
	String userID = request.getParameter("ID");
	if (session.getAttribute("ID") != null) {
		userID = (String) session.getAttribute("ID");
	}
	%>


	<div class="wrap">

		<div class="header">
			<div class="header_inner">
				<h1>
					<a href="main.jsp"> AI 헬스장 </a>
				</h1>
				<ul class="gnb">

					<li><a href="#">헬스장 소개 </a>
						<ul class="depth2">
							<li><a href="map.jsp">오시는 길</a></li>
							<li><a href="bbs.jsp">리뷰 게시판</a></li>
						</ul></li>
					<li><a href="#">코스별 프로그램 </a>
						<ul class="depth2">
							<li><a href="lecture.html">코스별 안내</a></li>
						</ul></li>
					<li><a href="#">예약 안내 </a>
						<ul class="depth2">
							<li><a href="join.jsp">예약하기</a></li>
						</ul></li>
				</ul>
				<%
				if (userID == null) {
				%>
				<div class="util_wrap">
					<ul class="util">
						<li><a href="list.jsp">회원관리</a></li>
						<li><a href="login.jsp">관리자</a></li>
					</ul>

				</div>
			</div>
		</div>
	</div>
	<%
	} else {
	%>
	<div class="util_wrap">
		<ul class="util">
			<li><a href="list.jsp">회원관리</a></li>
			<li><a href="logoutAction.jsp">로그아웃</a></li>
		</ul>

	</div>
	</div>
	</div>
	</div>

	<%
	}
	%>

	<div class="main">
		<div class="visual"></div>
	</div>

	<script>
		$(function() {
			$('.gnb').mouseenter(function() {
				$('.depth2').show();
				$('.wrap').stop().animate({
					'height' : 320
				});
			});
		});

		$(function() {
			$('.gnb').mouseleave(function() {
				$('.depth2').hide();
				$('.wrap').stop().animate({
					'height' : 95
				});
			});
		});
	</script>

</body>
</html>