<%@page import="db_connect.MemberVO"%>
<%@page import="db_connect.MemberDAO"%>
<%@page import="db_connect.BbsVO"%>
<%@page import="db_connect.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id=request.getParameter("id");
    
   MemberDAO dao= new MemberDAO();
    MemberVO bag = new MemberVO();
    bag= dao.one(id);
    
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
<h3><%=bag.getName() %>님의 정보입니다.</h3>
<hr>
<table class="table table-dark table-hover table-striped">
<tr>
<td>
ID 
</td>
<td>
<%=bag.getId() %>
</td>
</tr>
<tr>
<td>
PW 
</td>
<td>
<%=bag.getPw() %>
</td>
</tr>
<tr>
<td>
이름 
</td>
<td>
<%=bag.getName() %>
</td>
</tr>
<tr>
<td>
연락처 
</td>
<td>
<%=bag.getTel() %>
</td>
</tr>
</table>
<a href="member_one.html">
<button>뒤로가기</button>
</a>
</body>
</html>