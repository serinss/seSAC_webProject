package kr.co.mlec.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MethodServlet extends HttpServlet {
	//init, destroy 는 필요 없음. 요청한 것을 처리해야 하므로 service만 필요함
	//doGet 메서드만 쓸 것 
	
	
	//http://localhost:9999/Lecture-Web/method?id=aaa 형태로 요청함 (request 변수)
	//요청한 값 중 aaa만 뽑아서 확인하고 싶음
	//HttpServletRequest request 가 해당 정보를 가지고 요청 (/Lecture-Web/method?id=aaa&password=bbb) --> 정보 유출!!(get방식은 보안성이 굉장히 떨어진다)
	//보안+길이가 긴 정보 전달 불가 --> Post방식 도입
	//HttpServletResponse response 가 응답 (<html>...</html>
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//doGet, doPost 방식이 어떤건지 확인하는 메서드
		String method = request.getMethod();
		//프로토콜, 포트 정보를 뺀 나머지 (구분자 이름)를 가져오는 메서드
		String uri = request.getRequestURI();
		String id = request.getParameter("id");
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter(); //I/O 형태를 알아둬야 함 (Client -- Server 사이의 통로 형성)
		out.println("<HTML>"); //client 에게 전송
		out.println("	<HEAD>");
		out.println("		<TITLE>메소드 호출 결과</TITLE>"); //한글은 깨진다 (utf-8 설정 필요)
		out.println("	</HEAD>");
		out.println("		<BODY>");
		out.println("======================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;출 력 결 과<br>");
		out.println("======================================<br>");
		out.println("======================================<br>");
		out.println("요청 메소드 : "+ method +"<br>");
		out.println("요청 URI : "+ uri + "<br>");
		out.println("파라미터(id) : "+ id + "<br>");
		out.println("======================================<br>");
		out.println("		</BODY>");
		out.println("</HTML>");
		//이 부분은 JSP가 담당할 것
		
		out.flush(); //
		out.close(); //통로 닫기
		
		/*
		System.out.println("요청 메소드 : " + method);
		System.out.println("요청 URI : "+ uri);
		System.out.println("id : " + id); -----------> 이 결과를 html문서로 보여주고 싶음
		*/
		
	}

	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//POST방식일 때에만 인코딩 필요 반드시 반드시 필요
		request.setCharacterEncoding("utf-8");
		
		String method = request.getMethod();
		String uri = request.getRequestURI();
		String id = request.getParameter("id");
		
		System.out.println("요청 메소드 : " + method);
		System.out.println("요청 URI : "+ uri);
		System.out.println("id : " + id);
	}
	
}
