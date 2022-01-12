<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1~10 사이의 정수를 출력하시오</h1>
	1<br>
	2<br>
	3<br>
	4<br>
	5<br>
	6<br>
	7<br>
	8<br>
	9<br>
	10<br>
	<%-- 정적인 형태 --%>
	========<br>
	<%-- 동적인 형태로 변환 --%>
	<%
		//<<스트립트릿 실행문>>
		//이전에 서블릿에서 출력을 하려면 out 객체를 따로 생성해 줘야 했음 -> 그러나 jsp는 결국 서블릿으로 변환되므로 내장객체!
		//response.setContentType("text/html; charset=utf-8");
		//PrintWriter out = response.getWriter();
		
		for(int i=1; i<=10; i++){
			out.println(i + "<br>"); 
		}
	%>
	========<br>
	<%-- 위의 코드를 표현식을 이용하여 출력 -> exam02 --%>
	
	
	
	
</body>
</html>