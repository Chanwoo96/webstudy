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
<title>박스오피스 영화</title>
</head>
<body>
<h2>박스오피스 영화목록</h2>
<table>
<tr>
<%for(MovieVO vo:bag){ %>
<td>
<a href="http://localhost:8989/web01/movie_one.jsp?title=<%=vo.getTitle()%>">
<img  src="img2/<%=vo.getImg()%>" >
</a>
</td>

<% } %>
</tr>
<tr>
<%for(int i=1; i<5; i++){MovieVO vo =bag.get(i); %>
<td>
<a href="http://localhost:8989/web01/movie_one.jsp?title=<%=vo.getTitle()%>">
<img  src="img2/<%=vo.getImg()%>" >
</a>
</td>

<% } %>
</tr>
<tr>
<%for(int i=5; i<bag.size(); i++){MovieVO vo =bag.get(i); %>
<td>
<a href="http://localhost:8989/web01/movie_one.jsp?title=<%=vo.getTitle()%>">
<img  src="img2/<%=vo.getImg()%>" >
</a>
</td>

<% } %>
</tr>

</table>
</body>
</html>