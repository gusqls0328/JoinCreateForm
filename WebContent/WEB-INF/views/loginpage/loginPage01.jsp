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

<script type="text/javascript">

	function checkForm() {
		
		var result = true;
		
		$(".error").text("");
		
		if ($("#mid").val() == "") {
			$("#midError").text("아이디를 입력하세요");
			result = false;
		}
		if ($("#mpassword").val() == "") {
			$("#mpasswordError").text("비밀번호를 입력하세요");
			result = false;
		}
		
		return result;
	}


</script>


</head>

<body>

	<form method="post" action="login" onsubmit="return checkForm()">
	
		<div class="form-group">
			<label for="mid">아이디</label>
			<input type="text" class="form-control" id="mid" name="mid"
				placeholder="아이디를 입력하세요">
				<span id="midError" class="error" style="color: red">${midError}</span>
		</div>
		
		<div class="form-group">
			<label for="mpassword">비밀번호</label>
			<input type="password" class="form-control" id="mpassword" name="mpassword"
				placeholder="비밀번호를 입력하세요">
				<span id="mpasswordError" class="error" style="color: red">${mpasswordError}</span>
		</div>
		
		<div>
			<input type="submit" class="btn btn-primary" value="로그인"/>		
				
		</div>

	</form>
	
	<form method="get" action="goToJoinPage">
		<button>회원가입</button>	
	</form>
	
</body>
</html>