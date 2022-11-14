<%@page import="db_connect.MovieVO"%>
<%@page import="db_connect.MovieDAO"%>
<%@page import="db_connect.BbsVO"%>
<%@page import="db_connect.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String title = request.getParameter("title");

MovieDAO dao = new MovieDAO();
MovieVO bag = new MovieVO();
bag.setTitle(title);
 bag= dao.one(bag);
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
	<h3>영화 상세정보</h3>
	<hr>
	<table class="table table-hover table-striped">
		<tr>
			<td >번호 :</td>
			<td><%=bag.getNo()%></td>
			<td rowspan="4">
			<img  src="img2/<%=bag.getImg()%>" width="400px">
			</td>
		</tr>
		<tr>
			<td>제목 :</td>
			<td><%=bag.getTitle()%></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><%=bag.getGenre()%></td>
		</tr>
		<tr>
		<td colspan="2">
		<a href="https://movie.naver.com/movie/bi/mi/running.naver?code=<%=bag.getUrl()%>">
		<button class="btn btn-primary btn-lg">예매하러 가기</button>
		</a>
		</td>
		</tr>
	</table>
	<a href="movie_all2.jsp">
		<button>뒤로가기</button>
	</a>
</body>
</html>