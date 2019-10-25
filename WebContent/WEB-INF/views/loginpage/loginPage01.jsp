<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<%-- jsp는 8080까지만 생략됨, 상대경로로 찾아가기는 너무 복잡, 그래서 절대 경로로함 --%>
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>



</head>

<body>

	<form>
		<div class="form-group">
			<label for="mid">아이디</label>
			<input type="text" class="form-control" id="mid" name="mid"
				placeholder="아이디를 입력하세요">
		</div>
		<div class="form-group">
			<label for="mpassword">비밀번호</label>
			<input type="password" class="form-control" id="mpassword" name="password"
				placeholder="비밀번호를 입력하세요">
		</div>
		
		<div>
			<input type="submit" class="btn btn-primary" value="로그인"/>		
			<input type="submit" class="btn btn-success" value="회원가입"/>		
		</div>

	</form>

</body>
</html>