<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--주석 / 지시자 형태 (현재 페이지의 언어=자바, 파일형태, 인코딩 형태)--> 모두 포함된 것이 jsp파일
    	아래 내용은 html 파일의 내용과 동일함 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		JSP주석 : 서블릿으로 변환되지 않기 때문에 화면에 전송되지 않음
		-> work - Catalina - localhost - Lecture-Web - org - apache - jsp - jsp - basic - comment_jsp.class
		   형태로 servlet 파일로 변환되어 저장될 때, JSP 주석은 가져가지 않음 => 보이지 않음
		   따라서 개발자들이 주석을 달 때에는 꼭 JSP 주석으로 달아야 함 (사용자들에게 노출되지 않기 위해)
		   
		   + 서블릿 파일로 변환되어 저장되기 때문에, service()의 일부분으로 들어간다. 
		     service에 있는 함수들을 사용할 수 있음 (내장 객체: Implicit Object)
	 --%>
	 <!-- 
	 	컨텐트 주석 : 서블릿으로 변환되어 브라우저에 전송되나, 웹 브라우저에서 해석하지 않기 때문에 보이지 않음
	  -->
	  
	  화면에 주석이 보입니까?
	  
</body>
</html>