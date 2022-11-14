<%@page import="db_connect.BBSDAO"%>
<%@page import="db_connect.BbsVO"%>
<%@page import="db_connect.ProductDAO"%>
<%@page import="db_connect.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /*
    1. 입력
    2. 처리 (db처리 - dao,vo)
    3. 출력 (브라우저로 출력, html)
    */
    
    String no=request.getParameter("no");
    String content=request.getParameter("content");
    
    BbsVO bag=new BbsVO();
    bag.setNo(Integer.parseInt(no));
    bag.setContent(content);
    
    BBSDAO dao= new BBSDAO();
    dao.update(bag);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품 정보 수정 확인</h3>
<hr>
<%= bag %> <!-- 표현식 expression -->
<hr>
no: <%= no %><br>
content: <%= content %><br>

<hr>
<a href="bbs_update.html">
<button>상품수정페이지로</button>
</a>
<a href="bbs_home.html">
<button>홈으로</button>
</a>

</body>
</html>