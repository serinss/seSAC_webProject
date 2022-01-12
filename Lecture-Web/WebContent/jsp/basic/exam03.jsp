<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>1~10 사이의 랜덤한 숫자를 추출하시오</h2>
	<%
		Random r = new Random();
		int random = r.nextInt(10) + 1;
	%>
	추출된 정수 : <%= random %><br>
	
</body>
</html>