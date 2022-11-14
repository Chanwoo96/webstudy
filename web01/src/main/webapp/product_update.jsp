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
    
    String id=request.getParameter("id");
    String content=request.getParameter("content");
    
    ProductVO bag=new ProductVO();
    bag.setID(id);
    bag.setCONTENT(content);
    
    ProductDAO dao= new ProductDAO();
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
id: <%= id %><br>
content: <%= content %><br>

<hr>
<a href="product_update.html">
<button>상품수정페이지로</button>
</a>
<a href="product.html">
<button>홈으로</button>
</a>

</body>
</html>