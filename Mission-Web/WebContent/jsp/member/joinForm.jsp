<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	function doJoin(){
		let f = document.inputForm
		
		if(f.id.value == ''){
			alert("아이디를 입력해 주세요")
			return false
		}
		
		if(f.password.value == ''){
			alert("비밀번호를 입력해 주세요")
			return false
		}
		
		if(f.name.value == ''){
			alert("이름을 입력해 주세요")
			return false
		}
		return true
	}
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>회원 가입</h2>
		<hr>
		<br>
		
		<form action="join.jsp" method="post" name="inputForm" onsubmit="return doJoin()">
			<table>
				<tr>
					<th width="23%">아이디</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email_id"></td>
					<td><input type="text" name="email_domain"></td>
					
				</tr>
				<tr>
					<th>핸드폰 번호</th>
					<td><input type="text" name="tel1"></td>
					<td><input type="text" name="tel2"></td>
					<td><input type="text" name="tel3"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" name="post"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="basic_addr"></td>
					<td><input type="text" name="detail_addr"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="가입">
		</form>
	</div>
</body>
</html>