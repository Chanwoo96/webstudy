<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db_connect.MovieVO"%>
<%@page import="db_connect.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    MovieDAO dao= new MovieDAO();
    
   ArrayList<MovieVO> bag = dao.list();
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박스오피스 영화</title><link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style type="text/css">
.td:hover{color:#212529;background-color:rgba(0,0,0,.075)}
.container{width: 80%}
</style>
</head>
<body>
<h2>박스오피스 영화목록</h2>
<div class="container">
<table class="table">

<tr>
<%for(int i=0; i<5; i++){MovieVO vo =bag.get(i); %>
<td class="td">
<a href="http://localhost:8989/web01/movie_one.jsp?title=<%=vo.getTitle()%>">
<img  src="img2/<%=vo.getImg()%>" class="mx-auto d-block" >
</a>
</td>

<% } %>
</tr>
<tr>
<%for(int i=5; i<bag.size(); i++){MovieVO vo =bag.get(i); %>
<td class="td">
<a href="http://localhost:8989/web01/movie_one.jsp?title=<%=vo.getTitle()%>">
<img  src="img2/<%=vo.getImg()%>" class="mx-auto d-block">
</a>
</td>

<% } %>
</tr>

</table>
</div>
</body>
</html>