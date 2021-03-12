<%@page import="health.HealthVo"%>
<%@page import="health.HealthDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String name = request.getParameter("name");
HealthDao.delete(new HealthVo(name));

response.sendRedirect("list.jsp");
%>