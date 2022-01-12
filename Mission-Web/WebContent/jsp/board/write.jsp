<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력된 정보값(제목, 작성자, 내용)을 받아서 tbl_board에 저장하는 역할 -> 다시 list.jsp 로 돌아가게 된다
화면에 출력될 html 문서가 필요 없음 => 지워도 됨 --%>
<%--
	작업 순서
	1. writeForm.jsp 에서 넘겨준 제목(title),작성자(writer),내용(content) 추출
	2. tbl_board 테이블에 추출된 정보로 새로운 행 삽입(insert)
 --%>
<%
	//요청 객체 데이터 인코딩(Post 방식은 body에 저장되므로 무조건 해야한다)
	request.setCharacterEncoding("utf-8");

	//요청 객체에서 입력한 데이터 추출
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	System.out.println("title: " + title);
	System.out.println("writer: " + writer);
	System.out.println("content: " + content);
	
	//데이터베이서 tbl_board 테이블에 새 글 등록 (insert)
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("insert into tbl_board(no, title, writer, content) ");
	sql.append(" values(seq_tbl_board_no.nextval, ?, ?, ?) ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setString(1, title);
	pstmt.setString(2, writer);
	pstmt.setString(3, content);
	
	pstmt.executeUpdate();
%>

<script>
	alert('새 글 등록이 완료되었습니다')
	location.href = 'list.jsp'
</script>