<%@page import="db_connect.BbsVO"%>
<%@page import="db_connect.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String no = request.getParameter("no");

BBSDAO dao = new BBSDAO();
BbsVO bag = new BbsVO();
bag = dao.one(Integer.parseInt(no));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h3>검색된 결과입니다.</h3>
	<hr>
	<table class="table table-dark table-hover table-striped">
		<tr>
			<td>번호 :</td>
			<td><%=bag.getNo()%></td>
		</tr>
		<tr>
			<td>제목 :</td>
			<td><%=bag.getTitle()%></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><%=bag.getContent()%></td>
		</tr>
		<tr>
			<td>작성자 :</td>
			<td><%=bag.getWriter()%></td>
		</tr>
	</table>
	<a href="bbs_read.html">
		<button>뒤로가기</button>
	</a>
</body>
</html>