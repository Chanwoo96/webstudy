<%@page import="javax.swing.JOptionPane"%>
<%@page import="db_connect.MemberVO"%>
<%@page import="db_connect.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id=request.getParameter("id");
    String pw=request.getParameter("pw");
    MemberVO bag = new MemberVO();
    bag.setId(id);
    bag.setPw(pw);
    MemberDAO dao = new MemberDAO();
    int result = dao.login(bag);
    String result2 ="로그인 실패";
    
    if (result==1) {
    	result2 ="로그인 성공";
    	response.sendRedirect("http://localhost:8989/web01/member_one.jsp?id="+bag.getId());
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인 결과:<%=result2 %>
</body>
</html>