package kr.co.mlec.servlet;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/examMethod") //url 확인가능
//@WebServlet(urlPatterns = {"/examMethod"}) 원래는 urlPatters를 사용해야 하지만, 없어도 인식 가능

public class ExamMethodServlet extends HttpServlet {
	
	
	//요청 url : http://localhost:9999/Lecture-Web/examMethod
	//              ?name=hong&hobby=reading&hobby=movie 입력 시
	//                         => hobby 는 체크박스로 여러개가 입력 된 상태, getParameter로 가져오면 처음 하나만 가져옴
	//3.0 오면서 xml 환경 설정을 어노테이션이 대체할 수 있어짐 (완전 장점)
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String[] hobby = request.getParameterValues("hobby"); //리턴타입 배열
		
		System.out.println("name: "+name);
		System.out.println("hobby: "+Arrays.toString(hobby));
		
	}
	
}
