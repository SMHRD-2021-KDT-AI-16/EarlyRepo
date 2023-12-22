<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.early.model.BoardDAO"%>
<%@page import="com.early.model.boardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>

<body>
	<table>
		<tr>
			<th>번호</th>
			<th>날짜</th>
			<th>ID</th>
		</tr>
		<%
		List<boardVO> list = (List<boardVO>)session.getAttribute("allboard");
		
		for(boardVO x:list){
			System.out.print(x.getId());
			%>
			<tr>
			<td><%=x.getF_num() %></td>
			<td><%=x.getF_date() %></td>
			<td><%=x.getId() %></td>
			</tr>
		<% }%>

	</table>

</body>
</html>