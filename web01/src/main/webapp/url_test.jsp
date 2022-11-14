<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String[] id_list= {"apple","park","friday"};
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%for(String id:id_list ){ %>
<a href="http://localhost:8989/web01/member_one.jsp?id=<%=id%>"><%=id %>인 사람의 정보</a><br>

<%} %>
</body>
</html>