<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select id, name, email_id || '@' || email_domain as email, tel1 || '-' || tel2 || '-' || tel3 as tel, post, basic_addr || detail_addr as addr, type, reg_date ");
	sql.append(" from tbl_member ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회</title>
<style>
	hr, h2, table {
		width: 80%;
	}
</style>
</head>
<body>
	<div align="center">
		<hr>
		<h2>회원 목록 조회</h2>
		<hr>
		<br>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>핸드폰 번호</th>
				<th>우편 번호</th>
				<th>주소</th>
				<th>회원 등급</th>
				<th>가입 날짜</th>
			</tr>
			
			<%
			while(rs.next()) {
					String id = rs.getString("id");
					String name = rs.getString("name");
					String email = rs.getString("email");
					String tel = rs.getString("tel");
					String post = rs.getString("post");
					String addr = rs.getString("addr");
					String type = rs.getString("type");
					String date = rs.getString("reg_date");
			%>
				<tr>
					<td><%= id %></td>
					<td><%= name %></td>
					<td><%= email %></td>
					<td><%= tel %></td>
					<td><%= post %></td>
					<td><%= addr %></td>
					<td><%= type %></td>
					<td><%= date %></td>
				</tr>
			
			<%
			}
			%>
			
		</table>
	</div>
</body>
</html>
<%
	JDBCClose.close(pstmt, conn);
%>