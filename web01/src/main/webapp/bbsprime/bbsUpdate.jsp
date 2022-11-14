<%@page import="db_connect.BBSDAO"%>
<%@page import="db_connect.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
String title=request.getParameter("title");
String content=request.getParameter("content");
String writer=request.getParameter("writer");

BbsVO vo=new BbsVO();

vo.setNo(Integer.parseInt(id));
vo.setTitle(title);
vo.setContent(content);
vo.setWriter(writer);

BBSDAO dao= new BBSDAO();


dao.update(vo);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
background: orange;
}</style>
</head>
<body>
<h3><%=writer %>님이 수정한 게시판 내용입니다.</h3>
<hr style="background: blue; height: 5px;">
아이디 >> <%=id %><br>
제목 >> <%=title %><br>
내용 >> <%=content %><br>
작성자 >> <%=writer %><br>
<hr style="background: blue; height: 5px;">
<a href="bbsupdate.html">앞페이지로 가기</a>
</body>
</html>