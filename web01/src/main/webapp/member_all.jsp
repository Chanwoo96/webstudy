<%@page import="java.util.ArrayList"%>
<%@page import="db_connect.MemberVO"%>
<%@page import="db_connect.MemberDAO"%>
<%@page import="db_connect.BbsVO"%>
<%@page import="db_connect.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");

MemberDAO dao = new MemberDAO();

ArrayList<MemberVO> list = dao.list();
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
	<h3>회원 전체 목록</h3>
	<hr>
	<table class="table table-dark table-hover table-striped">
		<thead>
			<tr>
				<td>ID</td>
				<td>PW</td>
				<td>이름</td>
				<td>연락처</td>
			</tr>
		</thead>
		<%
		for (MemberVO bag : list) {
		%>
		<tr>
			<td><%=bag.getId()%></td>
			<td><%=bag.getPw()%></td>
			<td><%=bag.getName()%></td>
			<td><%=bag.getTel()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<a href="member_one.html">
		<button>뒤로가기</button>
	</a>
</body>
</html>