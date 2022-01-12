<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 등록</title>
<style>
	hr, h2, table {
			width: 80%;
		}
</style>
<script>
	function doWrite(){
		let f = document.inputForm
		
		if(f.title.value == ''){
			alert('제목을 입력하세요')
			f.title.focus()
			return false
		}
		
		if(f.writer.value == ''){
			alert('작성자를 입력하세요')
			f.writer.focus()
			return false
		}
		
		if(f.content.value == ''){
			alert('내용 입력하세요')
			f.content.focus()
			return false
		}
		
		return true
	}

</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>새 글 등록</h2>
		<hr>
		<br>
		<form action="write.jsp" method="post" name="inputForm" onsubmit="return doWrite()">
			<table border="1">
				<tr>
					<th width="23%">제목</th>
					<td>
						<input type="text" name="title">
						<!-- url뒤에 ?title=aaa 형태로 날라간다 -->
					</td>
				</tr>
				<tr>
					<th width="23%">작성자</th>
					<td>
						<input type="text" name="writer">
					</td>
				</tr>
				<tr>
					<th width="23%">내용</th>
					<td>
						<textarea name="content" rows="7" cols="60"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="등록">
			<!-- 버튼을 누르면 입력한 값들이 FormData 형식으로 넘어간다 -->
			<!-- 현재 DB의 테이블을 만들 때, 제목,작성자,내용 을 not null 로 설정 하였으므로 하나라도 빠진 채로 등록하게 되면
			     DB를 넘기는 과정에서 무조건 오류가 나게 된다 ==> required 속성 추가 or 함수 설정 -->
		
		</form>
		
		
	</div>
</body>
</html>