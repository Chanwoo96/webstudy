<%@page import="db_connect.MemberDAO"%>
<%@page import="db_connect.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1. 데이터를 받아서, 2.sql문을 만들어서, 3. 결과를 html로 만들어야 하는 페이지 -->
<!-- java코드 처리하는 부분 + html로 만들어진 부분(jsp) -->
<!-- 1. 데이터를 받아라  -->
<%
//자바코드를 일부 넣는 부분, 작은 프로그램(let)의 일부분
//자바코드를 그냥 스크립트 쓰듯이 쓰면 된다.
//스크립트릿(scriptlet)
//HTTPServletRequest request = new XMLRequestServlet(); 내장된 객체
//미리 request라는 이름의 객체를 만들어서 제공함.
String id=request.getParameter("id");
String pw=request.getParameter("pw");
String name=request.getParameter("name");
String tel=request.getParameter("tel");
MemberVO vo = new MemberVO();
vo.setId(id);
vo.setPw(pw);
vo.setName(name);
vo.setTel(tel);
//2.sql문을 만들어서, db서버에 전송 (jdbc프로그래밍)

MemberDAO dao = new MemberDAO();
dao.insert(vo);
//3. 결과를 클라이언트에 html로 알려줌.

%>



<!--3번을 담당하는 부분 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
background: orange;}
</style>
</head>
<body>

회원가입이 잘되었습니다.<hr>
회원가입정보 <hr>
아이디는 <%=id %> <br> <!-- 램에 있는 값을 브라우저에 표현하기. 표현식 expression -->
암호는 <%=pw %> <br>
이름은 <%=name %> <br>
전화번호는 <%=tel %> <br>
</body>
</html>