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
  
    
    BbsVO bag=new BbsVO();
    bag.setNo(Integer.parseInt(no));
    BBSDAO dao= new BBSDAO();
    dao.delete(bag);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>게시물 삭제 정보 확인</h3>
<hr>
삭제한 게시물 no: <%= no %><br>
<hr>
<a href="bbs_delete.html">
<button>상품등록페이지로</button>
</a>
<a href="bbs_home.html">
<button>홈으로</button>
</a>

</body>
</html>