<%@page import="db_connect.BBSDAO"%>
<%@page import="db_connect.BbsVO"%>
<%@page import="db_connect.ProductDAO"%>
<%@page import="db_connect.ProductVO"%>
<!-- @ : page지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /*
    1. 입력
    2. 처리 (db처리 - dao,vo)
    3. 출력 (브라우저로 출력, html)
    */
    
    String no=request.getParameter("no");
    String title=request.getParameter("title");
    String content=request.getParameter("content");
  	String writer=request.getParameter("writer");
  
    
    BbsVO bag=new BbsVO();
    bag.setNo(Integer.parseInt(no));
    bag.setTitle(title);
    bag.setContent(content);
    bag.setWriter(writer);
    
    
    BBSDAO dao= new BBSDAO();
    dao.insert(bag);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>게시물 등록 정보 확인</h3>
<hr>
<%= bag %> <!-- 표현식 expression -->
<hr>
no: <%= bag.getNo() %><br>
title: <%=bag.getTitle() %><br>
content: <%= bag.getContent() %><br>
writer: <%= bag.getWriter() %><br>
<hr>
<a href="bbs_insert.html">
<button>상품등록페이지로</button>
</a>
<a href="bbs_home.html">
<button>홈으로</button>
</a>

</body>
</html>