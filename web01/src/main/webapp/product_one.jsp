<%@page import="db_connect.ProductVO"%>
<%@page import="db_connect.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db_connect.MemberVO"%>
<%@page import="db_connect.MemberDAO"%>
<%@page import="db_connect.BbsVO"%>
<%@page import="db_connect.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");

ProductDAO dao = new ProductDAO();

ProductVO bag = dao.one(id);
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
				<td>이름</td>
				<td>내용</td>
				<td>가격</td>
				<td>회사</td>
				<td>이미지</td>
			</tr>
		</thead>
	
		<tr>
			<td><%=bag.getID()%></td>
			<td><%=bag.getNAME()%></td>
			<td><%=bag.getCONTENT()%></td>
			<td><%=bag.getPRICE()%></td>
			<td><%=bag.getCOMPANY()%></td>
			<td><img style="width:300px; height : 100px"
			 src="img/<%=bag.getIMG()%>"></td>
		</tr>
	
	</table>
	<a href="product_one.html">
		<button>뒤로가기</button>
	</a>
</body>
</html>