<%@page import="health.HealthVo"%>
<%@page import="health.HealthDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String tel = request.getParameter("tel");
String gender = request.getParameter("gender");
String lecture = request.getParameter("lecture");
String date = request.getParameter("date");

HealthDao.modify(new HealthVo(name, email, tel, gender, lecture, date));
response.sendRedirect("list.jsp");
%>