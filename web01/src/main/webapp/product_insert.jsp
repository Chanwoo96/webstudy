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
    
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    String content=request.getParameter("content");
  	String price=request.getParameter("price");
    String company=request.getParameter("company");
    String img=request.getParameter("img");
    
    ProductVO bag=new ProductVO();
    bag.setID(id);
    bag.setNAME(name);
    bag.setCONTENT(content);
    bag.setPRICE(Integer.parseInt(price));
    bag.setCOMPANY(company);
    bag.setIMG(img);
    
    ProductDAO dao= new ProductDAO();
    dao.insert(bag);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품 등록 정보 확인</h3>
<hr>
<%= bag %> <!-- 표현식 expression -->
<hr>
id: <%= id %><br>
name: <%= name %><br>
content: <%= content %><br>
price: <%= price %><br>
company: <%= company %><br>
img: <%= img %><br>
<hr>
<a href="product_insert.html">
<button>상품등록페이지로</button>
</a>
<a href="product.html">
<button>홈으로</button>
</a>

</body>
</html>