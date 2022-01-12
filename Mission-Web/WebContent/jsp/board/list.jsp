<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* tbl_board에서 전체 게시글 조회
	     게시판 번호, 제목, 작성자, 등록일만 보이도록 목록을 작성 - DB에서 가져와야 함(ConnectionFactory,pstmt) */
	//변경된 서블렛 파일안에 이미 try catch문이 있기 때문에 안써도 오류가 나진 않음
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	sql.append(" from tbl_board");
	sql.append(" order by no desc ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery();
	//rs의 정보를 웹에 출력하고 싶은 것 -> body에 들어감

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	hr, h2, table {
		width: 80%;
	}
</style>

<script>
	//기능이 오타가 없는지 중간중간 alert으로 확인해 줘야 함!
	function goWriteForm(){
		location.href = "writeForm.jsp" //같은 폴더에 있으므로 상대경로로 작성 가능
	}
	
	function goJoinForm(){
		location.href = "joinForm.jsp"
	}
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>전체 게시판</h2>
		<hr>
		<br>
		
		<table border="1">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="16%">작성자</th>
				<th width="20%">작성일</th>
			</tr>
			<!-- 출력되는 행의 개수 = tbl_board 에 저장된 행의 개수 = rs에 저장된 행의 개수 = rs.next()=false 일 때까지의 개수
				  자바블럭으로 반복할 <tr> 태그를 묶어서 출력하자 -->
			
			<%
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String regDate = rs.getString("reg_date");
			%>
				<tr>
					<!-- 각각의 행이 가지고 있는 컬럼내용을 가져온다. 
						 out.println()로 출력할 내용을 표현식을 사용하여 간단하게 나타낼 수 있다. -->
					<td align="center"><%= no %></td>
					<td><%= title %></td>
					<td align="center"><%= writer %></td>
					<td align="center"><%= regDate %></td>
				</tr>
				<!-- 이 반복문에 대한 해석은 서버가 하므로 응답된 HTML코드는 정적인 태그형태로 나타난다
				     => 보안에 대한 장점(어떤 반복문을 사용하여 코드를 작성했는지 나타나지 않음)
				     1.사용자 요청  2.JSP해석  3.HTML응답  4.웹 브라우저가 해석하여 화면에 출력 -->
			<%
			}
			%>
		
		</table>
		<br><br>
		<button onclick="goWriteForm()">글 쓰기</button>
		<button onclick="goJoinForm()">회원 가입</button>
	</div>
</body>
</html>
<%
	JDBCClose.close(pstmt, conn);
%>