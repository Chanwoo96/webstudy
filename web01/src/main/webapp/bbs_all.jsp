<%@page import="db_connect.BbsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db_connect.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BBSDAO dao = new BBSDAO();
ArrayList<BbsVO> box = dao.list();
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
	<h3>
		게시물 전체 개수
		<%=box.size()%>개
	</h3>
	<table class="table table-dark table-hover table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
			</tr>
		</thead>
		<%
		for (BbsVO a : box) {
		%>
		<tr>
			<td><%=a.getNo()%></td>
			<td>
			<a href="http://localhost:8989/web01/bbs_one.jsp?no=<%=a.getNo()%>">
			<%=a.getTitle()%>
			</a>
			</td>
			<td><%=a.getContent()%></td>
			<td><%=a.getWriter()%></td>
		</tr>
		<%
		} //for
		%>
	</table>
</body>
</html>