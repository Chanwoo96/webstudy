package db_connect;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Hello
 */
@WebServlet("/bye2")//@ (annotaion,표시) 표시를 통해 url을 설정
public class Hello extends HttpServlet {
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("안녕히 가세요!!");
		System.out.println("이름은 "+request.getParameter("name")+",메시지는 "+request.getParameter("message"));
	}

}
