<%@page import="java.io.PrintWriter"%>
<%@page import="health.HealthDao"%>
<%@page import="health.HealthVo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%!%>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String tel = request.getParameter("tel");
String gender = request.getParameter("gender");
String lecture = request.getParameter("lecture");
String date = request.getParameter("date");

HealthVo vo = new HealthVo(name, email, tel, gender, lecture, date);
System.out.println(vo);
HealthDao.insert(vo);

PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('예약되었습니다.')");

script.println("location.href = 'main.jsp'");
script.println("</script>");
%>