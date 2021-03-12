<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="bbs.BbsDAO"%>

<!-- bbsdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter"%>
<!-- 자바 클래스 사용 -->
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<!-- // Bbs bbs = new Bbs(); -->
<jsp:setProperty name="bbs" property="bbsTitle" /><!-- bbs.setBbsTitle(request) -->
<jsp:setProperty name="bbs" property="bbsContent" />
<jsp:setProperty name="bbs" property="userID" />

<%
// System.out.println(bbs);
%>


<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 쓰기</title>
</head>
<body>

	<%
	if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다')");
		script.println("history.back()");
		script.println("</script>");

	} else {
		BbsDAO BbsDAO = new BbsDAO();
		int result = BbsDAO.write(bbs.getBbsTitle(), bbs.getUserID(), bbs.getBbsContent());
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>